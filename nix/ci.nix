let
    generateTestsForPlatform = { system, pkgs, phpAttr, noThirdParty ? false }:
        let
            filterPhpExtensions = php: ({ enabled, all }:
                # calendar tests are broken on 32bit?
                let enabled' = (pkgs.lib.filter (e: e != php.extensions.calendar) enabled);
                in enabled' ++ [ all.mongodb ]);
        in
        pkgs.recurseIntoAttrs {
            gcc = let
                php = pkgs.${phpAttr}.withExtensions (filterPhpExtensions pkgs.${phpAttr});
                phpPackages = php.packages;
                psr = pkgs.callPackage ../default.nix {
                    inherit php pkgs;
                    buildPecl = php.buildPecl;
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = if noThirdParty then null else pkgs.recurseIntoAttrs (pkgs.callPackage ./deps.nix {
                    inherit system pkgs php phpPackages psr;
                });
            };

            gcc-i686 = let
                php = pkgs.pkgsi686Linux.${phpAttr}.withExtensions (filterPhpExtensions pkgs.pkgsi686Linux.${phpAttr});
                phpPackages = php.packages;
                psr = pkgs.pkgsi686Linux.callPackage ../default.nix {
                    inherit php;
                    pkgs = pkgs.pkgsi686Linux;
                    buildPecl = php.buildPecl;
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = if noThirdParty then null else pkgs.recurseIntoAttrs (pkgs.pkgsi686Linux.callPackage ./deps.nix {
                    pkgs = pkgs.pkgsi686Linux;
                    inherit system php phpPackages psr;
                });
            };

            clang = let
                php = pkgs.${phpAttr}.withExtensions (filterPhpExtensions pkgs.${phpAttr});
                phpPackages = php.packages;
                stdenv = pkgs.clangStdenv;
                psr = pkgs.callPackage ../default.nix {
                    inherit php stdenv pkgs;
                    buildPecl = php.buildPecl;
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = if noThirdParty then null else pkgs.recurseIntoAttrs (pkgs.callPackage ./deps.nix {
                    inherit system pkgs php phpPackages stdenv psr;
                });
            };
        };
in
builtins.mapAttrs (k: _v:
  let
    path = builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs/archive/nixos-20.09.tar.gz;
        name = "nixos-20.09";
    };
    system = k;
    pkgs = import (path) { inherit system; };

  in
  pkgs.recurseIntoAttrs {

    # disabled until nixos 21.05 is out

    # php80 = let
    #     path = builtins.fetchTarball {
    #         url = https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
    #         name = "nixos-unstable";
    #     };
    #     system = k;
    #     pkgs = import (path) { inherit system; };
    # in generateTestsForPlatform {
    #     inherit system pkgs;
    #     phpAttr = "php80";
    # };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
