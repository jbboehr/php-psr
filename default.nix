# to use a specific version of php, run: nix-shell --arg php '(import <nixpkgs> {}).php73'`
# or clang: nix-shell --arg stdenv '(import <nixpkgs> {}).clangStdenv'
{
  pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
  php ? pkgs.php,
  buildPecl ? pkgs.callPackage <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php stdenv;
  },

  gitignoreSource ? (import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "00b237fb1813c48e20ee2021deb6f3f03843e9e4";
      sha256 = "sha256:186pvp1y5fid8mm8c7ycjzwzhv7i6s3hh33rbi05ggrs7r3as3yy";
  }) { inherit (pkgs) lib; }).gitignoreSource,

  phpPsrVersion ? null,
  phpPsrSha256 ? null,
  phpPsrSrc ? pkgs.lib.cleanSourceWith {
    filter = (path: type: (builtins.all (x: x != baseNameOf path) [".idea" ".git" "ci.nix" ".travis.sh" ".travis.yml" ".ci"]));
    src = gitignoreSource ./.;
  }
}:

pkgs.callPackage ./derivation.nix {
  inherit stdenv php buildPecl;
  inherit phpPsrVersion phpPsrSrc phpPsrSha256;
}
