{
    system ? builtins.currentSystem,
    pkgs ? import <nixpkgs> {
        inherit system;
    },
    stdenv ? pkgs.stdenv,
    php ? pkgs.php,
    phpPackages ? pkgs.phpPackages,
    psr ? pkgs.callPackage (import ../default.nix) { inherit stdenv php pkgs; },
    filterAttrs ? pkgs.lib.filterAttrs
}:

let
    phpWrapper = stdenv.mkDerivation {
        name = "php-wrapper";
        buildInputs = [ pkgs.makeWrapper ];
        unpackPhase = "true";
        installPhase = ''
                mkdir -p $out/bin $out/etc/php.d
                makeWrapper ${php}/bin/php $out/bin/php \
                    --set PHP_INI_SCAN_DIR $out/etc/php.d
                echo error_reporting=24575 | tee -a $out/etc/php.d/php.ini
                echo memory_limit=256M | tee -a $out/etc/php.d/php.ini
                echo extension=${psr}/lib/php/extensions/psr.so | tee -a $out/etc/php.d/php.ini
            '';
    };
    composerEnv = import ./composer-env.nix {
        inherit phpPackages;
        inherit (pkgs) stdenv writeTextFile fetchurl unzip;
        php = phpWrapper;
    };
    commonArgs = {
        inherit composerEnv;
        inherit (pkgs) fetchurl fetchgit fetchhg fetchsvn;
    };
    commonImport = (j: p: l: (import p commonArgs).override {
        src = pkgs.fetchgit (filterAttrs (n: v: n != "date") (builtins.fromJSON (builtins.readFile j)));
        buildInputs = [ pkgs.git phpWrapper ];
        buildPhase = ''
                cp -av $src/* .
                src=`pwd`
                cp ${l} composer.lock
            '';
        postInstall = ''
                chmod -R +w vendor
                # remove their installed psr dependencies (except testing classes)
	            # monolog requires the test class, so don't delete everything
                find vendor/psr/ -type f -not -iname "*test*" -delete
                # remove some tests from laminas that are really slow
                rm -f test/Storage/Adapter/FilesystemTest.php test/Storage/Adapter/MemoryTest.php
                chmod -R -w vendor
                ${phpWrapper}/bin/php ./vendor/bin/phpunit
            '';
    });
in
{
    monolog = commonImport ./deps/monolog.json ./deps/monolog-packages.nix ./deps/monolog-composer.lock;
    psx-cache = commonImport ./deps/psx-cache.json ./deps/psx-cache-packages.nix ./deps/psx-cache-composer.lock;
    psr7 = commonImport ./deps/psr7.json ./deps/psr7-packages.nix ./deps/psr7-composer.lock;
    league-container = commonImport ./deps/league-container.json ./deps/league-container-packages.nix ./deps/league-container-composer.lock;
    link-util = commonImport ./deps/link-util.json ./deps/link-util-packages.nix ./deps/link-util-composer.lock;
    dispatch = commonImport ./deps/dispatch.json ./deps/dispatch-packages.nix ./deps/dispatch-composer.lock;
    http-factory-guzzle = commonImport ./deps/http-factory-guzzle.json ./deps/http-factory-guzzle-packages.nix ./deps/http-factory-guzzle-composer.lock;
    guzzle-psr18-adapter = commonImport ./deps/guzzle-psr18-adapter.json ./deps/guzzle-psr18-adapter-packages.nix ./deps/guzzle-psr18-adapter-composer.lock;
    tukio = commonImport ./deps/tukio.json ./deps/tukio-packages.nix ./deps/tukio-composer.lock;
    laminas-cache = commonImport ./deps/laminas-cache.json ./deps/laminas-cache-packages.nix ./deps/laminas-cache-composer.lock;
}
