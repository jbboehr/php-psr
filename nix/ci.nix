let
    generateTestsForPlatform = { system, pkgs, phpAttr, noThirdParty ? false }:
        pkgs.recurseIntoAttrs {
            gcc = let
                php = pkgs.${phpAttr};
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
                # calendar tests are broken on 32bit?
                php = pkgs.pkgsi686Linux.${phpAttr}.withExtensions ({ enabled, all }:
                    (pkgs.lib.filter (e: e != pkgs.pkgsi686Linux.${phpAttr}.extensions.calendar) enabled));
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
                php = pkgs.${phpAttr};
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
    php73 = generateTestsForPlatform {
        inherit system pkgs;
        phpAttr = "php73";
    };

    php74 = generateTestsForPlatform {
        inherit system pkgs;
        phpAttr = "php74";
    };

#    php80 = let
#        path = builtins.fetchTarball {
#            url = https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
#            name = "nixos-unstable";
#        };
#        system = k;
#        pkgs = import (path) { inherit system; };
#    in generateTestsForPlatform {
#        inherit system pkgs;
#        phpAttr = "php80";
#        noThirdParty = true;
#    };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
