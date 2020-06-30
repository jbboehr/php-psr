let
    generateTestsForPlatform = { system, pkgs, path, phpAttr }:
        pkgs.recurseIntoAttrs {
            gcc = let
                php = pkgs.${phpAttr};
                phpPackages = pkgs."${phpAttr}Packages";
                psr = pkgs.callPackage ../default.nix {
                    inherit php pkgs;
                    buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = pkgs.recurseIntoAttrs (pkgs.callPackage ./deps.nix {
                    inherit system pkgs php phpPackages psr;
                });
            };

            gcc-i686 = let
                php = pkgs.pkgsi686Linux.${phpAttr};
                phpPackages = pkgs.pkgsi686Linux."${phpAttr}Packages";
                psr = pkgs.pkgsi686Linux.callPackage ../default.nix {
                    inherit php;
                    pkgs = pkgs.pkgsi686Linux;
                    buildPecl = pkgs.pkgsi686Linux.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = pkgs.recurseIntoAttrs (pkgs.pkgsi686Linux.callPackage ./deps.nix {
                    pkgs = pkgs.pkgsi686Linux;
                    inherit system php phpPackages psr;
                });
            };

            clang = let
                php = pkgs.${phpAttr};
                phpPackages = pkgs."${phpAttr}Packages";
                stdenv = pkgs.clangStdenv;
                psr = pkgs.callPackage ../default.nix {
                    inherit php stdenv pkgs;
                    buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php stdenv; };
                };
            in pkgs.recurseIntoAttrs {
                inherit psr;
                third-party = pkgs.recurseIntoAttrs (pkgs.callPackage ./deps.nix {
                    inherit system pkgs php phpPackages stdenv psr;
                });
            };
        };
in
builtins.mapAttrs (k: _v:
  let
    path = builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz;
        name = "nixpkgs-20.03";
    };
    system = k;
    pkgs = import (path) { inherit system; };

  in
  pkgs.recurseIntoAttrs {
    php72 = generateTestsForPlatform {
        inherit system pkgs path;
        phpAttr = "php72";
    };

    php73 = let
        php = pkgs.php73;
    in generateTestsForPlatform {
        inherit system pkgs path;
        phpAttr = "php73";
    };

    php74 = let
        php = pkgs.php74;
    in generateTestsForPlatform {
        inherit system pkgs path;
        phpAttr = "php74";
    };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
