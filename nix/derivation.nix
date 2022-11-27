{
  lib, stdenv, autoreconfHook, fetchurl,
  php, buildPecl, gitignoreSource
}:

buildPecl rec {
  pname = "psr";
  name = "psr-${version}";
  version = "v1.0.0";

  src = lib.cleanSourceWith {
    filter = (path: type: (builtins.all (x: x != baseNameOf path)
        [".idea" ".git" ".github" "ci.nix" ".ci" "nix" "default.nix" "flake.nix" "flake.lock"]));
    src = gitignoreSource ../.;
  };

  makeFlags = ["phpincludedir=$(out)/include/php/ext/psr"];

  doCheck = true;
  checkTarget = "test";
  checkFlags = ["REPORT_EXIT_STATUS=1" "NO_INTERACTION=1"]; # "TEST_PHP_DETAILED=1"
}
