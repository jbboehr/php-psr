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

    generatePsrTestsForPlatform = { pkgs, php, buildPecl, phpPsrSrc }:
        pkgs.recurseIntoAttrs {
            psr = pkgs.callPackage ./derivation.nix {
               inherit php buildPecl phpPsrSrc;
            };
        };
in
builtins.mapAttrs (k: _v:
  let
    path = builtins.fetchTarball {
       url = https://github.com/NixOS/nixpkgs/archive/release-19.09.tar.gz;
       name = "nixpkgs-19.09";
    };
    pkgs = import (path) { system = k; };

    phpPsrSrc = generatePsrDrv {
        inherit pkgs;
        inherit (pkgs) php;
    };
  in
  pkgs.recurseIntoAttrs {
    php71 = let
        path = builtins.fetchTarball {
           url = https://github.com/NixOS/nixpkgs/archive/release-19.03.tar.gz;
           name = "nixpkgs-19.03";
        };
        pkgs = import (path) { system = k; };
        php = pkgs.php71;
    in generatePsrTestsForPlatform {
        inherit pkgs php phpPsrSrc;
        buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
    };

    php72 = let
        php = pkgs.php72;
    in generatePsrTestsForPlatform {
        inherit pkgs php phpPsrSrc;
        buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
    };

    php73 = let
        php = pkgs.php73;
    in generatePsrTestsForPlatform {
        inherit pkgs php phpPsrSrc;
        buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
    };

    php74 = let
        path = builtins.fetchTarball {
           url = https://github.com/NixOS/nixpkgs/archive/release-20.03.tar.gz;
           name = "nixpkgs-unstable";
        };
        pkgs = import (path) { system = k; };
        php = pkgs.php74;
    in generatePsrTestsForPlatform {
        inherit pkgs php phpPsrSrc;
        buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
    };

    # php = let
    #     path = builtins.fetchTarball {
    #        url = https://github.com/NixOS/nixpkgs/archive/master.tar.gz;
    #        name = "nixpkgs-unstable";
    #     };
    #     pkgs = import (path) { system = k; };
    #     php = pkgs.php;
    # in generatePsrTestsForPlatform {
    #     inherit pkgs php phpPsrSrc;
    #     buildPecl = pkgs.callPackage "${path}/pkgs/build-support/build-pecl.nix" { inherit php; };
    # };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
