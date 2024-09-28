# Copyright (c) anno Domini nostri Jesu Christi MMXVI-MMXXIV John Boehr & contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
{
  lib,
  php,
  stdenv,
  pkg-config,
  valgrind,
  autoreconfHook,
  buildPecl,
  src,
  lcov,
  checkSupport ? false,
  debugSupport ? false,
  valgrindSupport ? true,
  coverageSupport ? false,
}:
(buildPecl rec {
  pname = "psr";
  name = "psr-${version}";
  version = "v1.2.0";

  inherit src;

  nativeBuildInputs =
    [php.unwrapped.dev pkg-config]
    ++ lib.optional valgrindSupport valgrind
    ++ lib.optional coverageSupport lcov;

  passthru = {
    inherit php stdenv;
  };

  configureFlags =
    []
    ++ lib.optional coverageSupport ["--enable-psr-coverage"];

  makeFlags = ["phpincludedir=$(dev)/include"];
  outputs =
    lib.optional (checkSupport && coverageSupport) "coverage"
    ++ ["out" "dev"];

  doCheck = checkSupport;
  theRealFuckingCheckPhase =
    ''
      runHook preCheck
      REPORT_EXIT_STATUS=1 NO_INTERACTION=1 make test TEST_PHP_ARGS="-n" || (find tests -name '*.log' | xargs cat ; exit 1)
    ''
    + (lib.optionalString valgrindSupport ''
      USE_ZEND_ALLOC=0 REPORT_EXIT_STATUS=1 NO_INTERACTION=1 make test TEST_PHP_ARGS="-n -m" || (find tests -name '*.mem' | xargs cat ; exit 1)
    '')
    + ''
      runHook postCheck
    '';

  preBuild = lib.optionalString coverageSupport ''
    lcov --directory . --zerocounters
    lcov --directory . --capture --compat-libtool --initial --output-file coverage.info
  '';

  postCheck = lib.optionalString coverageSupport ''
    lcov --no-checksum --directory . --capture --no-markers --compat-libtool --output-file coverage.info
    set -o noglob
    lcov --remove coverage.info '${builtins.storeDir}/*' \
        --compat-libtool \
        --output-file coverage.info
    set +o noglob
    mkdir -p $coverage
    cp coverage.info $coverage/coverage.info
    genhtml coverage.info -o $coverage/html/
  '';

  meta = with lib; {
    homepage = "https://github.com/jbboehr/php-psr";
    license = licenses.bsd3;
    outputsToInstall = outputs;
  };

  #TEST_PHP_DETAILED = 1;
})
.overrideAttrs (o:
    o
    // {
      checkPhase = o.theRealFuckingCheckPhase;
    })
