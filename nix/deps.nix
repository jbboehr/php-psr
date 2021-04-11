{
    system ? builtins.currentSystem,
    pkgs ? import <nixpkgs> {
        inherit system;
    },
    stdenv ? pkgs.stdenv,
    php ? pkgs.php,
    phpPackages ? pkgs.phpPackages,
    psr ? pkgs.callPackage (import ../default.nix) { inherit stdenv php pkgs phpPackages; },
    filterAttrs ? pkgs.lib.filterAttrs
}:

let
    phpWrapper = stdenv.mkDerivation {
        name = "php-wrapper";
        buildInputs = [ pkgs.makeWrapper ];
        unpackPhase = "true";
        installPhase = ''
                mkdir -p $out/bin $out/etc/php.d
                makeWrapper ${php.unwrapped}/bin/php $out/bin/php \
                    --set PHP_INI_SCAN_DIR $out/etc/php.d
                cat ${php}/lib/php.ini > $out/etc/php.d/php.ini
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
    commonImport = (j: p: l: x: (import p commonArgs).override {
        src = pkgs.fetchgit (filterAttrs (n: v: n != "date" && n != "path") (builtins.fromJSON (builtins.readFile j)));
        buildInputs = [ pkgs.git phpWrapper ];
        buildPhase = ''
                cp -av $src/* .
                src=`pwd`
                chmod +w . *
                cp ${l} composer.lock
            '';
        postInstall = ''
                chmod -R +w vendor
                # remove their installed psr dependencies (except testing classes)
	            # monolog requires the test class, so don't delete everything
                find vendor/psr/ -type f -not -iname "*test*" -delete
                if [ ! -z "${x}" ]
                then
                    rm -f ${x}
                fi
                chmod -R -w vendor
                ${phpWrapper}/bin/php ./vendor/bin/phpunit --exclude-group internet
            '';
    });
in
{
    monolog = commonImport ./deps/monolog.json ./deps/monolog-packages.nix ./deps/monolog-composer.lock "tests/Monolog/Formatter/MongoDBFormatterTest.php";
    psx-cache = commonImport ./deps/psx-cache.json ./deps/psx-cache-packages.nix ./deps/psx-cache-composer.lock "";
    link-util = commonImport ./deps/link-util.json ./deps/link-util-packages.nix ./deps/link-util-composer.lock "";
    dispatch = commonImport ./deps/dispatch.json ./deps/dispatch-packages.nix ./deps/dispatch-composer.lock "";
    request-handler = commonImport ./deps/request-handler.json ./deps/request-handler-packages.nix ./deps/request-handler-composer.lock "";
    http-factory-guzzle = commonImport ./deps/http-factory-guzzle.json ./deps/http-factory-guzzle-packages.nix ./deps/http-factory-guzzle-composer.lock "";
    guzzle-psr18-adapter = commonImport ./deps/guzzle-psr18-adapter.json ./deps/guzzle-psr18-adapter-packages.nix ./deps/guzzle-psr18-adapter-composer.lock "";
    tukio = commonImport ./deps/tukio.json ./deps/tukio-packages.nix ./deps/tukio-composer.lock "";
    laminas-diactoros = commonImport ./deps/laminas-diactoros.json ./deps/laminas-diactoros-packages.nix ./deps/laminas-diactoros-composer.lock "test/ResponseTest.php";
    relay = commonImport ./deps/relay.json ./deps/relay-packages.nix ./deps/relay-composer.lock "";
    # psx-dependency is broken
    psx-dependency = commonImport ./deps/psx-dependency.json ./deps/psx-dependency-packages.nix ./deps/psx-dependency-composer.lock "";
    cache-util = commonImport ./deps/cache-util.json ./deps/cache-util-packages.nix ./deps/cache-util-composer.lock "";
    event-dispatcher-util = commonImport ./deps/event-dispatcher-util.json ./deps/event-dispatcher-util-packages.nix ./deps/event-dispatcher-util-composer.lock "";
}
