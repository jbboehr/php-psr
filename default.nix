# to use a specific version of php, run: nix-shell --arg php '(import <nixpkgs> {}).php73'`
# or clang: nix-shell --arg stdenv '(import <nixpkgs> {}).clangStdenv'
{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
  stdenv ? pkgs.stdenv,
  php ? pkgs.php,
  phpPackages ? pkgs.phpPackages,

  buildPecl ? pkgs.callPackage <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php stdenv;
  },

  gitignoreSource ? (import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "00b237fb1813c48e20ee2021deb6f3f03843e9e4";
      sha256 = "sha256:186pvp1y5fid8mm8c7ycjzwzhv7i6s3hh33rbi05ggrs7r3as3yy";
  }) { inherit (pkgs) lib; }).gitignoreSource,

  composer2nix ? pkgs.callPackage (import (pkgs.fetchFromGitHub {
      owner = "svanderburg";
      repo = "composer2nix";
      rev = "57cecaf5d9d667b47415bb7c1d1f5154be7c759e";
      sha256 = "0q0x3in43ss1p0drhc5lp5bnp2jqni1i7zxm7lmjl5aad9nkn3gf";
  })) { inherit pkgs system; },

  phpPsrVersion ? null,
  phpPsrSha256 ? null,
  phpPsrSrc ? pkgs.lib.cleanSourceWith {
    filter = (path: type: (builtins.all (x: x != baseNameOf path) [".idea" ".git" ".github" "ci.nix" ".ci" "nix" "default.nix"]));
    src = gitignoreSource ./.;
  },

  devSupport ? false
}:

pkgs.callPackage ./nix/derivation.nix {
  inherit stdenv php phpPackages buildPecl composer2nix;
  inherit phpPsrVersion phpPsrSrc phpPsrSha256;
  inherit devSupport;
}
