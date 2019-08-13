{ php, stdenv, autoreconfHook, fetchurl,
  buildPecl ? import <nixpkgs/pkgs/build-support/build-pecl.nix> {
    # re2c is required for nixpkgs master, must not be specified for <= 19.03
    inherit php stdenv autoreconfHook fetchurl;
  },
  phpPsrVersion ? null,
  phpPsrSrc ? null,
  phpPsrSha256 ? null
}:

let
  orDefault = x: y: (if (!isNull x) then x else y);
in

buildPecl rec {
  pname = "psr";
  name = "psr-${version}";
  version = orDefault phpPsrVersion "v0.6.0";
  src = orDefault phpPsrSrc (fetchurl {
    url = "https://github.com/jbboehr/php-psr/archive/${version}.tar.gz";
    sha256 = orDefault phpPsrSha256 "11hajfnqksq7bs1mzq03s6rsa8j1ja7rnyvrlxrl53kvblbrc9yw";
  });

  makeFlags = ["phpincludedir=$(out)/include/php/ext/psr"];

  doCheck = true;
  checkTarget = "test";
  checkFlagsArray = ["REPORT_EXIT_STATUS=1" "NO_INTERACTION=1" "TEST_PHP_DETAILED=1"];
}

