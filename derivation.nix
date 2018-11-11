{ php, stdenv, autoreconfHook, fetchurl,
  phpPsrVersion ? null,
  phpPsrSrc ? null,
  phpPsrSha256 ? null
}:

let
  orDefault = x: y: (if (!isNull x) then x else y);
  buildPecl = import <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php stdenv autoreconfHook fetchurl;
  };
in

buildPecl rec {
  name = "psr-${version}";
  version = orDefault phpPsrVersion "v0.5.1";
  src = orDefault phpPsrSrc (fetchurl {
    url = "https://github.com/jbboehr/php-psr/archive/${version}.tar.gz";
    sha256 = orDefault phpPsrSha256 "063lrr2869zpzyxiag6af1jvxhg4ivqbljrfyqgbflcq2c9vn975";
  });

  makeFlags = ["phpincludedir=$(out)/include/php/ext/psr"];

  doCheck = true;
  checkTarget = "test";
  checkFlagsArray = ["REPORT_EXIT_STATUS=1" "NO_INTERACTION=1" "TEST_PHP_DETAILED=1"];
}

