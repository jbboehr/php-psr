{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
  stdenv ? pkgs.stdenv,
  php ? pkgs.php.buildEnv {
    extensions = { all, ... }: with all; [ zlib ];
  },
  gitignoreSource ? (import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "00b237fb1813c48e20ee2021deb6f3f03843e9e4";
      sha256 = "sha256:186pvp1y5fid8mm8c7ycjzwzhv7i6s3hh33rbi05ggrs7r3as3yy";
  }) { inherit (pkgs) lib; }).gitignoreSource,
  phpPsrSrc ? pkgs.lib.cleanSourceWith {
    filter = (path: type: (builtins.all (x: x != baseNameOf path) [".idea" ".git" ".github" "ci.nix" ".ci" "nix" "default.nix"]));
    src = gitignoreSource ./.;
  }
}:

{
    dist = pkgs.runCommand "psr-pecl.tgz" {
        buildInputs = [php];
        src = phpPsrSrc;
    } ''
        cp -r $src/* .
        PHP_PEAR_PHP_BIN=${php}/bin/php pecl package
        mv psr-*.tgz $out
    '';
}
