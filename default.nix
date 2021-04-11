# to use a specific version of php, run: nix-shell --arg php '(import <nixpkgs> {}).php73'`
# or clang: nix-shell --arg stdenv '(import <nixpkgs> {}).clangStdenv'
{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
  stdenv ? pkgs.stdenv,
  php ? pkgs.php,
  phpPackages ? if builtins.hasAttr "packages" php then php.packages else pkgs.phpPackages,
  composer ? if builtins.hasAttr "composer" phpPackages then phpPackages.composer else null,
  buildPecl ? if builtins.hasAttr "buildPecl" php then php.buildPecl else pkgs.callPackage <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php stdenv;
  },

  gitignoreSource ? (import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "00b237fb1813c48e20ee2021deb6f3f03843e9e4";
      sha256 = "sha256:186pvp1y5fid8mm8c7ycjzwzhv7i6s3hh33rbi05ggrs7r3as3yy";
  }) { inherit (pkgs) lib; }).gitignoreSource,

  composer2nix ? pkgs.callPackage (import (pkgs.fetchFromGitHub {
      owner = "jbboehr";
      repo = "composer2nix";
      rev = "029aeb997d05cda720cf1f8fdfaca7e921c648ea";
      sha256 = "034kvfl76xqd1ij5fp62hfa1i3qhfzyxn8yzaqv3r5d1g84mhmll";
  })) { inherit pkgs system php phpPackages; },

  phpPsrVersion ? null,
  phpPsrSha256 ? null,
  phpPsrSrc ? pkgs.lib.cleanSourceWith {
    filter = (path: type: (builtins.all (x: x != baseNameOf path) [".idea" ".git" ".github" "ci.nix" ".ci" "nix" "default.nix"]));
    src = gitignoreSource ./.;
  },

  devSupport ? false
}:

pkgs.callPackage ./nix/derivation.nix {
  inherit stdenv php phpPackages buildPecl composer2nix composer;
  inherit phpPsrVersion phpPsrSrc phpPsrSha256;
  inherit devSupport;
}
