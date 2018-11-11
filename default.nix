{
  pkgs ? import <nixpkgs> {},
  php ? pkgs.php,

  phpPsrVersion ? null,
  phpPsrSrc ? ./.,
  phpPsrSha256 ? null
}:

pkgs.callPackage ./derivation.nix {
  inherit php phpPsrVersion phpPsrSrc phpPsrSha256;
}

