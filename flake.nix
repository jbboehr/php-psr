{
  description = "php-psr";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    composer2nix.url = "github:svanderburg/composer2nix";
    composer2nix.flake = false;
    gitignore = {
        url = "github:hercules-ci/gitignore.nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, composer2nix, gitignore }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        php = pkgs.php;
      in
      rec {
        packages = flake-utils.lib.flattenTree rec {
          php-psr = pkgs.callPackage ./default.nix {
            inherit php;
            inherit (gitignore.lib) gitignoreSource;
            inherit (php) buildPecl;
          };
          default = php-psr;
        };

        devShell = pkgs.mkShell {
          inputsFrom = builtins.attrValues self.packages.${system};
          buildInputs = [ composer2nix php.packages.composer ];
        };
      }
    );
}
