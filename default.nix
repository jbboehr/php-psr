# to use a specific version of php, run: nix-shell --arg php '(import <nixpkgs> {}).php73'`
# or clang: nix-shell --arg stdenv '(import <nixpkgs> {}).clangStdenv'
{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
  stdenv ? pkgs.stdenv,
  php ? pkgs.php,
  buildPecl ? php.buildPecl,

  gitignoreSource ? (import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "00b237fb1813c48e20ee2021deb6f3f03843e9e4";
      sha256 = "sha256:186pvp1y5fid8mm8c7ycjzwzhv7i6s3hh33rbi05ggrs7r3as3yy";
  }) { inherit (pkgs) lib; }).gitignoreSource,
}:

pkgs.callPackage ./nix/derivation.nix {
  inherit stdenv php buildPecl gitignoreSource;
}
