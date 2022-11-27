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

  outputs = { self, nixpkgs, flake-utils, composer2nix, gitignore }@args:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        php = pkgs.php;
      in
      rec {
        packages = flake-utils.lib.flattenTree rec {
          composer2nix = pkgs.callPackage args.composer2nix {};
          php-psr = pkgs.callPackage ./default.nix {
            inherit php;
            inherit (gitignore.lib) gitignoreSource;
            inherit (php) buildPecl;
          };
          default = php-psr;
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = builtins.attrValues self.packages.${system};
          buildInputs = [ php.packages.composer ];
        };
      }
    );
}
