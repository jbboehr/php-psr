{
  pkgs ? import <nixpkgs> {},
  php ? pkgs.php,
  buildPecl ? pkgs.callPackage <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php;
  },

  phpPsrVersion ? null,
  phpPsrSrc ? ./.,
  phpPsrSha256 ? null
}:

pkgs.callPackage ./derivation.nix {
  inherit php phpPsrVersion phpPsrSrc phpPsrSha256 buildPecl;
}
