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
            in pkgs.callPackage ../default.nix {
                inherit php pkgs;
                buildPecl = php.buildPecl;
            };

            clang = let
                php = pkgs.${phpAttr}.withExtensions (filterPhpExtensions pkgs.${phpAttr});
                stdenv = pkgs.clangStdenv;
            in pkgs.callPackage ../default.nix {
                inherit php stdenv pkgs;
                buildPecl = php.buildPecl;
            };
        };
in
builtins.mapAttrs (k: _v:
  let
    path = builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs/archive/nixos-22.05.tar.gz;
        name = "nixos-22.05";
    };
    system = k;
    pkgs = import (path) { inherit system; };

  in
  pkgs.recurseIntoAttrs {
    php74 = generateTestsForPlatform {
        inherit system pkgs;
        phpAttr = "php74";
    };

    php80 = generateTestsForPlatform {
        inherit system pkgs;
        phpAttr = "php80";
    };

    php81 = generateTestsForPlatform {
        inherit system pkgs;
        phpAttr = "php81";
    };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
