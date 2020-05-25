let
    generatePsrDrv = { pkgs, php }:
        pkgs.runCommand "pecl-psr.tgz" {
            buildInputs = [ php ];
            src = builtins.filterSource
                (path: type: baseNameOf path != ".idea" && baseNameOf path != ".git" && baseNameOf path != "ci.nix")
                ./.;
        } ''
            cp -r $src/* .
            pecl package | tee tmp.txt
            pecl_tgz=$(cat tmp.txt | grep -v Warning | awk '{print $2}')
            echo $pecl_tgz
            cp $pecl_tgz $out
        '';

    generateTestsForPlatform = { pkgs, path, phpAttr, dist }:
        pkgs.recurseIntoAttrs {
            psr = let
                php = pkgs.${phpAttr};
            in pkgs.callPackage ./default.nix {
                inherit php;
                phpPsrSrc = dist;
                buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
            };
            psr-32bit = let
                php = pkgs.pkgsi686Linux.${phpAttr};
            in pkgs.pkgsi686Linux.callPackage ./default.nix {
                inherit php;
                phpPsrSrc = dist;
                buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
            };
        };
in
builtins.mapAttrs (k: _v:
  let
    path = builtins.fetchTarball {
        url = https://github.com/NixOS/nixpkgs/archive/release-20.03.tar.gz;
        name = "nixpkgs-20.03";
    };
    pkgs = import (path) { system = k; };

    dist = generatePsrDrv {
        inherit pkgs;
        inherit (pkgs) php;
    };
  in
  pkgs.recurseIntoAttrs {
    php72 = generateTestsForPlatform {
        inherit pkgs path dist;
        phpAttr = "php72";
    };

    php73 = let
        php = pkgs.php73;
    in generateTestsForPlatform {
        inherit pkgs path dist;
        phpAttr = "php73";
    };

    php74 = let
        php = pkgs.php74;
    in generateTestsForPlatform {
        inherit pkgs path dist;
        phpAttr = "php74";
    };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
