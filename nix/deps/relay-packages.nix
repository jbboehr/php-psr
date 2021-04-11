{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "psr/http-message" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-message-f6561bf28d520154e4b0ec72be95418abe6d9363";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-message/zipball/f6561bf28d520154e4b0ec72be95418abe6d9363";
          sha256 = "195dd67hva9bmr52iadr4kyp2gw2f5l51lplfiay2pv6l9y4cf45";
        };
      };
    };
    "psr/http-server-handler" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-server-handler-aff2f80e33b7f026ec96bb42f63242dc50ffcae7";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-server-handler/zipball/aff2f80e33b7f026ec96bb42f63242dc50ffcae7";
          sha256 = "0sfz1j9lxirsld0zm0bqqmxf52krjn982w3fq9n27q7mpjd33y4x";
        };
      };
    };
    "psr/http-server-middleware" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-server-middleware-2296f45510945530b9dceb8bcedb5cb84d40c5f5";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-server-middleware/zipball/2296f45510945530b9dceb8bcedb5cb84d40c5f5";
          sha256 = "1r92xj2hybnxcnamxqklk5kivkgy0bi34hhsh00dnwn9wmf3s0gj";
        };
      };
    };
  };
  devPackages = {
    "amphp/amp" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "amphp-amp-efca2b32a7580087adb8aabbff6be1dc1bb924a9";
        src = fetchurl {
          url = "https://api.github.com/repos/amphp/amp/zipball/efca2b32a7580087adb8aabbff6be1dc1bb924a9";
          sha256 = "05q7cc67bmx7kg158mv0mw4iba0f1hqjax7f3r870j1pkplwvisd";
        };
      };
    };
    "amphp/byte-stream" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "amphp-byte-stream-acbd8002b3536485c997c4e019206b3f10ca15bd";
        src = fetchurl {
          url = "https://api.github.com/repos/amphp/byte-stream/zipball/acbd8002b3536485c997c4e019206b3f10ca15bd";
          sha256 = "14jqc5igivq54bwj0gr9rpbnw1rapi11ddhmvbkx1251a1bbyzr2";
        };
      };
    };
    "composer/package-versions-deprecated" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-package-versions-deprecated-7413f0b55a051e89485c5cb9f765fe24bb02a7b6";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/package-versions-deprecated/zipball/7413f0b55a051e89485c5cb9f765fe24bb02a7b6";
          sha256 = "13d7vjw2jqdvzmz4v513wamn6cm8jjcy8wj7p2wpsz72m2ck4qyz";
        };
      };
    };
    "composer/semver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-semver-a02fdf930a3c1c3ed3a49b5f63859c0c20e10464";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/semver/zipball/a02fdf930a3c1c3ed3a49b5f63859c0c20e10464";
          sha256 = "0dd8m30jmjy2x64jv50xjva5x36hn3wrwcqnc38jrdaq2hcg1092";
        };
      };
    };
    "composer/xdebug-handler" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-xdebug-handler-f27e06cd9675801df441b3656569b328e04aa37c";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/xdebug-handler/zipball/f27e06cd9675801df441b3656569b328e04aa37c";
          sha256 = "0db49yf7zcf4q57ba48n10cyrdjf7s598321m69dkb4dph0yc5qh";
        };
      };
    };
    "dealerdirect/phpcodesniffer-composer-installer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dealerdirect-phpcodesniffer-composer-installer-fe390591e0241955f22eb9ba327d137e501c771c";
        src = fetchurl {
          url = "https://api.github.com/repos/Dealerdirect/phpcodesniffer-composer-installer/zipball/fe390591e0241955f22eb9ba327d137e501c771c";
          sha256 = "1xvx1qqf5nl630zsz8xq2p18lrzml7ydp4451vy1mrjgjhv5ifpv";
        };
      };
    };
    "dnoegel/php-xdg-base-dir" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dnoegel-php-xdg-base-dir-8f8a6e48c5ecb0f991c2fdcf5f154a47d85f9ffd";
        src = fetchurl {
          url = "https://api.github.com/repos/dnoegel/php-xdg-base-dir/zipball/8f8a6e48c5ecb0f991c2fdcf5f154a47d85f9ffd";
          sha256 = "02n4b4wkwncbqiz8mw2rq35flkkhn7h6c0bfhjhs32iay1y710fq";
        };
      };
    };
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-b17c5014ef81d212ac539f07a1001832df1b6d3b";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/annotations/zipball/b17c5014ef81d212ac539f07a1001832df1b6d3b";
          sha256 = "0p2qbbsirr2bahlpn0i1id93lb0cj2xpbcsh5l7vcyg253qz3775";
        };
      };
    };
    "doctrine/coding-standard" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-coding-standard-529d385bb3790431080493c0fe7adaec39df368a";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/coding-standard/zipball/529d385bb3790431080493c0fe7adaec39df368a";
          sha256 = "025kzy34cdr51ycdi8xx0sgv67c2r5473gi2zbjask1qbnc5lvr9";
        };
      };
    };
    "doctrine/instantiator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-instantiator-d56bf6102915de5702778fe20f2de3b2fe570b5b";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/instantiator/zipball/d56bf6102915de5702778fe20f2de3b2fe570b5b";
          sha256 = "04rihgfjv8alvvb92bnb5qpz8fvqvjwfrawcjw34pfnfx4jflcwh";
        };
      };
    };
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-e864bbf5904cb8f5bb334f99209b48018522f042";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/lexer/zipball/e864bbf5904cb8f5bb334f99209b48018522f042";
          sha256 = "11lg9fcy0crb8inklajhx3kyffdbx7xzdj8kwl21xsgq9nm9iwvv";
        };
      };
    };
    "felixfbecker/advanced-json-rpc" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "felixfbecker-advanced-json-rpc-06f0b06043c7438959dbdeed8bb3f699a19be22e";
        src = fetchurl {
          url = "https://api.github.com/repos/felixfbecker/php-advanced-json-rpc/zipball/06f0b06043c7438959dbdeed8bb3f699a19be22e";
          sha256 = "0vjm9a24r0lrx5hjzhb9q3zmzvwvq85kh5xjmc0c805y6sxfr5v3";
        };
      };
    };
    "felixfbecker/language-server-protocol" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "felixfbecker-language-server-protocol-9d846d1f5cf101deee7a61c8ba7caa0a975cd730";
        src = fetchurl {
          url = "https://api.github.com/repos/felixfbecker/php-language-server-protocol/zipball/9d846d1f5cf101deee7a61c8ba7caa0a975cd730";
          sha256 = "146mqmni6677sqkrf29na7j2m0xjj2vp0mhf6bbnj8nwqp3ylvd1";
        };
      };
    };
    "friendsofphp/php-cs-fixer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "friendsofphp-php-cs-fixer-e0f6d05c8b157f50029ca6c65c19ed2694f475bf";
        src = fetchurl {
          url = "https://api.github.com/repos/FriendsOfPHP/PHP-CS-Fixer/zipball/e0f6d05c8b157f50029ca6c65c19ed2694f475bf";
          sha256 = "191nnxhqmnnfr5b0bdp1kkip4mn27vycdqki1qx5qfy0fsy89qvv";
        };
      };
    };
    "laminas/laminas-diactoros" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-diactoros-4ff7400c1c12e404144992ef43c8b733fd9ad516";
        src = fetchurl {
          url = "https://api.github.com/repos/laminas/laminas-diactoros/zipball/4ff7400c1c12e404144992ef43c8b733fd9ad516";
          sha256 = "159nmy8mlj1fxf4ikdzqa3lhlspbjsy2azcg2y481h0m4d4646ff";
        };
      };
    };
    "laminas/laminas-zendframework-bridge" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-zendframework-bridge-6cccbddfcfc742eb02158d6137ca5687d92cee32";
        src = fetchurl {
          url = "https://api.github.com/repos/laminas/laminas-zendframework-bridge/zipball/6cccbddfcfc742eb02158d6137ca5687d92cee32";
          sha256 = "10i9dk9idj2drcknglw9vzgvnk1mpnayq08yx8899q3k33bsj7vd";
        };
      };
    };
    "myclabs/deep-copy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "myclabs-deep-copy-776f831124e9c62e1a2c601ecc52e776d8bb7220";
        src = fetchurl {
          url = "https://api.github.com/repos/myclabs/DeepCopy/zipball/776f831124e9c62e1a2c601ecc52e776d8bb7220";
          sha256 = "181f3fsxs6s2wyy4y7qfk08qmlbvz1wn3mn3lqy42grsb8g8ym0k";
        };
      };
    };
    "netresearch/jsonmapper" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "netresearch-jsonmapper-e0f1e33a71587aca81be5cffbb9746510e1fe04e";
        src = fetchurl {
          url = "https://api.github.com/repos/cweiske/jsonmapper/zipball/e0f1e33a71587aca81be5cffbb9746510e1fe04e";
          sha256 = "0gxyy639px4wm02hjljlfv7sk7alsy8l71rmkwa7nnvpzbf907v2";
        };
      };
    };
    "nikic/php-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nikic-php-parser-c6d052fc58cb876152f89f532b95a8d7907e7f0e";
        src = fetchurl {
          url = "https://api.github.com/repos/nikic/PHP-Parser/zipball/c6d052fc58cb876152f89f532b95a8d7907e7f0e";
          sha256 = "1392bj45myazpphic05jxqwlyify72s3qf5vspd991rk5a2p60pw";
        };
      };
    };
    "openlss/lib-array2xml" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "openlss-lib-array2xml-a91f18a8dfc69ffabe5f9b068bc39bb202c81d90";
        src = fetchurl {
          url = "https://api.github.com/repos/nullivex/lib-array2xml/zipball/a91f18a8dfc69ffabe5f9b068bc39bb202c81d90";
          sha256 = "0h8f4ag6gq7xbh6bvybzbfmnxcsyqnk9dni0bdm195bnjqjw1l2q";
        };
      };
    };
    "phar-io/manifest" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-manifest-85265efd3af7ba3ca4b2a2c34dbfc5788dd29133";
        src = fetchurl {
          url = "https://api.github.com/repos/phar-io/manifest/zipball/85265efd3af7ba3ca4b2a2c34dbfc5788dd29133";
          sha256 = "13cqrx7iikx2aixszhxl55ql6hikblvbalix0kr05pbiccipg6fv";
        };
      };
    };
    "phar-io/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-version-bae7c545bef187884426f042434e561ab1ddb182";
        src = fetchurl {
          url = "https://api.github.com/repos/phar-io/version/zipball/bae7c545bef187884426f042434e561ab1ddb182";
          sha256 = "0hqmrihb4wv53rl3fg93wjldwrz79jyad5bv29ynbdklsirh7b2l";
        };
      };
    };
    "php-cs-fixer/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-cs-fixer-diff-dbd31aeb251639ac0b9e7e29405c1441907f5759";
        src = fetchurl {
          url = "https://api.github.com/repos/PHP-CS-Fixer/diff/zipball/dbd31aeb251639ac0b9e7e29405c1441907f5759";
          sha256 = "0wz8m2knrr8jhqbvkqayzykmxhgixxjivlkxmh5n8291sfgc2win";
        };
      };
    };
    "phpdocumentor/reflection-common" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-common-1d01c49d4ed62f25aa84a747ad35d5a16924662b";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/ReflectionCommon/zipball/1d01c49d4ed62f25aa84a747ad35d5a16924662b";
          sha256 = "1wx720a17i24471jf8z499dnkijzb4b8xra11kvw9g9hhzfadz1r";
        };
      };
    };
    "phpdocumentor/reflection-docblock" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-docblock-069a785b2141f5bcf49f3e353548dc1cce6df556";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/ReflectionDocBlock/zipball/069a785b2141f5bcf49f3e353548dc1cce6df556";
          sha256 = "0qid63bsfjmc3ka54f1ijl4a5zqwf7jmackjyjmbw3gxdnbi69il";
        };
      };
    };
    "phpdocumentor/type-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-type-resolver-6a467b8989322d92aa1c8bf2bebcc6e5c2ba55c0";
        src = fetchurl {
          url = "https://api.github.com/repos/phpDocumentor/TypeResolver/zipball/6a467b8989322d92aa1c8bf2bebcc6e5c2ba55c0";
          sha256 = "01g6mihq5wd1396njjb7ibcdfgk26ix1kmbjb6dlshzav0k3983h";
        };
      };
    };
    "phpspec/prophecy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpspec-prophecy-be1996ed8adc35c3fd795488a653f4b518be70ea";
        src = fetchurl {
          url = "https://api.github.com/repos/phpspec/prophecy/zipball/be1996ed8adc35c3fd795488a653f4b518be70ea";
          sha256 = "167snpasy7499pbxpyx2bj607qa1vrg07xfpa30dlpbwi7f34dji";
        };
      };
    };
    "phpstan/phpdoc-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpstan-phpdoc-parser-98a088b17966bdf6ee25c8a4b634df313d8aa531";
        src = fetchurl {
          url = "https://api.github.com/repos/phpstan/phpdoc-parser/zipball/98a088b17966bdf6ee25c8a4b634df313d8aa531";
          sha256 = "0qk526jr6j0b84wsik0sar5vsvfy3qgg2kw1m2cmizw88x11axgm";
        };
      };
    };
    "phpstan/phpstan" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpstan-phpstan-4a967cec6efb46b500dd6d768657336a3ffe699f";
        src = fetchurl {
          url = "https://api.github.com/repos/phpstan/phpstan/zipball/4a967cec6efb46b500dd6d768657336a3ffe699f";
          sha256 = "0mzhrznm3x9g26134br92qaljndj7ypg43035zzp22aqg4lgd0dn";
        };
      };
    };
    "phpunit/php-code-coverage" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-code-coverage-bb7c9a210c72e4709cdde67f8b7362f672f2225c";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/bb7c9a210c72e4709cdde67f8b7362f672f2225c";
          sha256 = "1csy38k6ci8r4z27cd7awgjmgd149q9hmhh8nj6b9si8c0s8grbx";
        };
      };
    };
    "phpunit/php-file-iterator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-file-iterator-4b49fb70f067272b659ef0174ff9ca40fdaa6357";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-file-iterator/zipball/4b49fb70f067272b659ef0174ff9ca40fdaa6357";
          sha256 = "1f0libqg4r5miijs8jaimn11skcxw095ypbhxfvjcxndcv6r9c1s";
        };
      };
    };
    "phpunit/php-text-template" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-text-template-31f8b717e51d9a2afca6c9f046f5d69fc27c8686";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-text-template/zipball/31f8b717e51d9a2afca6c9f046f5d69fc27c8686";
          sha256 = "1y03m38qqvsbvyakd72v4dram81dw3swyn5jpss153i5nmqr4p76";
        };
      };
    };
    "phpunit/php-timer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-timer-2454ae1765516d20c4ffe103d85a58a9a3bd5662";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-timer/zipball/2454ae1765516d20c4ffe103d85a58a9a3bd5662";
          sha256 = "12gaqzvgh5y212zmp253z03w0f040v00zqafymilzkc9l0m2fsxd";
        };
      };
    };
    "phpunit/php-token-stream" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-token-stream-a853a0e183b9db7eed023d7933a858fa1c8d25a3";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-token-stream/zipball/a853a0e183b9db7eed023d7933a858fa1c8d25a3";
          sha256 = "0vkh5sb5hdb69s9dich45r2dj9r2prcfpb8ganz483pl4lnv4sh1";
        };
      };
    };
    "phpunit/phpunit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-038d4196d8e8cb405cd5e82cedfe413ad6eef9ef";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/phpunit/zipball/038d4196d8e8cb405cd5e82cedfe413ad6eef9ef";
          sha256 = "166kbsg0w6hrakfzsl4rqbdwma1jv8mmhl1a1yqkd5p90913hd0n";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-8622567409010282b7aeebe4bb841fe98b58dcaf";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/container/zipball/8622567409010282b7aeebe4bb841fe98b58dcaf";
          sha256 = "0qfvyfp3mli776kb9zda5cpc8cazj3prk0bg0gm254kwxyfkfrwn";
        };
      };
    };
    "psr/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-event-dispatcher-dbefd12671e8a14ec7f180cab83036ed26714bb0";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/event-dispatcher/zipball/dbefd12671e8a14ec7f180cab83036ed26714bb0";
          sha256 = "05nicsd9lwl467bsv4sn44fjnnvqvzj1xqw2mmz9bac9zm66fsjd";
        };
      };
    };
    "psr/http-factory" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-factory-12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-factory/zipball/12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
          sha256 = "0inbnqpc5bfhbbda9dwazsrw9xscfnc8rdx82q1qm3r446mc1vds";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-0f73288fd15629204f9d42b7055f72dacbe811fc";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/log/zipball/0f73288fd15629204f9d42b7055f72dacbe811fc";
          sha256 = "1npi9ggl4qll4sdxz1xgp8779ia73gwlpjxbb1f1cpl1wn4s42r4";
        };
      };
    };
    "roave/security-advisories" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "roave-security-advisories-aa48fe959b0236eede9c51a38f47df2bb81ef137";
        src = fetchurl {
          url = "https://api.github.com/repos/Roave/SecurityAdvisories/zipball/aa48fe959b0236eede9c51a38f47df2bb81ef137";
          sha256 = "0sr7sn1dm5yl65p4x8pfsafwsspnznqqmzh2avw7vlzi55iix2ix";
        };
      };
    };
    "sebastian/code-unit-reverse-lookup" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-code-unit-reverse-lookup-1de8cd5c010cb153fcd68b8d0f64606f523f7619";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/code-unit-reverse-lookup/zipball/1de8cd5c010cb153fcd68b8d0f64606f523f7619";
          sha256 = "17690sqmhdabhvgalrf2ypbx4nll4g4cwdbi51w5p6w9n8cxch1a";
        };
      };
    };
    "sebastian/comparator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-comparator-1071dfcef776a57013124ff35e1fc41ccd294758";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/comparator/zipball/1071dfcef776a57013124ff35e1fc41ccd294758";
          sha256 = "0i2lnvf56n4s88001dzxzy9bjzih1qbf7kzc7457qhlvwdnaydn3";
        };
      };
    };
    "sebastian/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-diff-14f72dd46eaf2f2293cbe79c93cc0bc43161a211";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/diff/zipball/14f72dd46eaf2f2293cbe79c93cc0bc43161a211";
          sha256 = "0planffhifwhxgml9r3ma89c83jvbrqilj517a5ps9x8vc6kk312";
        };
      };
    };
    "sebastian/environment" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-environment-d47bbbad83711771f167c72d4e3f25f7fcc1f8b0";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/environment/zipball/d47bbbad83711771f167c72d4e3f25f7fcc1f8b0";
          sha256 = "1s5wfp79bx2diw9jxfdm6l54286pr9b1rhs7s2j71rvj4y7pycgp";
        };
      };
    };
    "sebastian/exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-exporter-6b853149eab67d4da22291d36f5b0631c0fd856e";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/exporter/zipball/6b853149eab67d4da22291d36f5b0631c0fd856e";
          sha256 = "1s0n1vbds3yj8mg98vmykxz61mgsbqd28bv63cw8fkvnmgb0s5x7";
        };
      };
    };
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-474fb9edb7ab891665d3bfc6317f42a0a150454b";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/global-state/zipball/474fb9edb7ab891665d3bfc6317f42a0a150454b";
          sha256 = "0x56dqs2i2gfg49i61bl7kvcqsc3gpz1ig1w6yzcggk0irncjn3i";
        };
      };
    };
    "sebastian/object-enumerator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-enumerator-e67f6d32ebd0c749cf9d1dbd9f226c727043cdf2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-enumerator/zipball/e67f6d32ebd0c749cf9d1dbd9f226c727043cdf2";
          sha256 = "10g778j02h3kywvz4ldhin64zbypxpl0l39rm2ycsr7iin8q904w";
        };
      };
    };
    "sebastian/object-reflector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-reflector-9b8772b9cbd456ab45d4a598d2dd1a1bced6363d";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-reflector/zipball/9b8772b9cbd456ab45d4a598d2dd1a1bced6363d";
          sha256 = "010g9mkf3s1hcbwn1wvd9s72xcyjzrb6csx472xs69yln1mr11z8";
        };
      };
    };
    "sebastian/recursion-context" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-recursion-context-367dcba38d6e1977be014dc4b22f47a484dac7fb";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/recursion-context/zipball/367dcba38d6e1977be014dc4b22f47a484dac7fb";
          sha256 = "1zpq0qk2mgwnbyhjnj05dz2n2v8hvj2g4jy68fd5klxxkdr92ps7";
        };
      };
    };
    "sebastian/resource-operations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-resource-operations-31d35ca87926450c44eae7e2611d45a7a65ea8b3";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/resource-operations/zipball/31d35ca87926450c44eae7e2611d45a7a65ea8b3";
          sha256 = "10im8r899k4jdch1r4n6nbfvxbqnndg3bqrzlvxi03w501pcsxfd";
        };
      };
    };
    "sebastian/type" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-type-0150cfbc4495ed2df3872fb31b26781e4e077eb4";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/type/zipball/0150cfbc4495ed2df3872fb31b26781e4e077eb4";
          sha256 = "0kv5ia8hqhc2ipx0dnzi3nmkw45h0vrdbl2jhb8l5j5hi41kldrz";
        };
      };
    };
    "sebastian/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-version-99732be0ddb3361e16ad77b68ba41efc8e979019";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/version/zipball/99732be0ddb3361e16ad77b68ba41efc8e979019";
          sha256 = "0wrw5hskz2hg5aph9r1fhnngfrcvhws1pgs0lfrwindy066z6fj7";
        };
      };
    };
    "slevomat/coding-standard" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "slevomat-coding-standard-696dcca217d0c9da2c40d02731526c1e25b65346";
        src = fetchurl {
          url = "https://api.github.com/repos/slevomat/coding-standard/zipball/696dcca217d0c9da2c40d02731526c1e25b65346";
          sha256 = "017mb08j9c6657nv9mkgy09qpy9540dxsvximgm1j1r1dzxnyj3j";
        };
      };
    };
    "squizlabs/php_codesniffer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "squizlabs-php_codesniffer-ffced0d2c8fa8e6cdc4d695a743271fab6c38625";
        src = fetchurl {
          url = "https://api.github.com/repos/squizlabs/PHP_CodeSniffer/zipball/ffced0d2c8fa8e6cdc4d695a743271fab6c38625";
          sha256 = "1cndvz85ii2cl47lbfkmxr4xw03n7y70l6jc8sdh6bhz4axvk03z";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-35f039df40a3b335ebf310f244cb242b3a83ac8d";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/console/zipball/35f039df40a3b335ebf310f244cb242b3a83ac8d";
          sha256 = "11raz6qv3b88h4i37z7i37rc3fxxmchy7n2fm7j4dk65kva07m5s";
        };
      };
    };
    "symfony/deprecation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-deprecation-contracts-5fa56b4074d1ae755beb55617ddafe6f5d78f665";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/deprecation-contracts/zipball/5fa56b4074d1ae755beb55617ddafe6f5d78f665";
          sha256 = "0ny59x0aaipqaj956wx7ak5f6d5rn90766swp5m18019v9cppg10";
        };
      };
    };
    "symfony/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-d08d6ec121a425897951900ab692b612a61d6240";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher/zipball/d08d6ec121a425897951900ab692b612a61d6240";
          sha256 = "16fhr3yj6rm6ax09s7ll7kqjlqgzkcsj8vlj5qrlwasw40nj0agx";
        };
      };
    };
    "symfony/event-dispatcher-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-contracts-0ba7d54483095a198fa51781bc608d17e84dffa2";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher-contracts/zipball/0ba7d54483095a198fa51781bc608d17e84dffa2";
          sha256 = "0z9zqkf340xij833xb7lv1d2ilrw26cbng6xz4lm71r3hpc8hx45";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-8c86a82f51658188119e62cff0a050a12d09836f";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/filesystem/zipball/8c86a82f51658188119e62cff0a050a12d09836f";
          sha256 = "1xghwc7zz6659p572anx68f7n8x9lhair0c4fh5a3rf748arlby4";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-0d639a0943822626290d169965804f79400e6a04";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/finder/zipball/0d639a0943822626290d169965804f79400e6a04";
          sha256 = "17v5pnl95di1ks4gm04yr7p2jjzbisiabv3yilhw7wsd45a9rz7q";
        };
      };
    };
    "symfony/options-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-options-resolver-5d0f633f9bbfcf7ec642a2b5037268e61b0a62ce";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/options-resolver/zipball/5d0f633f9bbfcf7ec642a2b5037268e61b0a62ce";
          sha256 = "1rk3wcxn08s0wdjxi2byj1mhr3xf0ql55wxwik8cbx57i8p5r2sw";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-c6c942b1ac76c82448322025e084cadc56048b4e";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-ctype/zipball/c6c942b1ac76c82448322025e084cadc56048b4e";
          sha256 = "0jpk859wx74vm03q5s9z25f4ak2138p2x5q3b587wvy8rq2m4pbd";
        };
      };
    };
    "symfony/polyfill-intl-grapheme" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-grapheme-5601e09b69f26c1828b13b6bb87cb07cddba3170";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-grapheme/zipball/5601e09b69f26c1828b13b6bb87cb07cddba3170";
          sha256 = "1k3xk8iknyjaslzvhdl1am3jlyndvb6pw0509znmwgvc2jhkb4jr";
        };
      };
    };
    "symfony/polyfill-intl-normalizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-normalizer-43a0283138253ed1d48d352ab6d0bdb3f809f248";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/43a0283138253ed1d48d352ab6d0bdb3f809f248";
          sha256 = "04irkl6aks8zyfy17ni164060liihfyraqm1fmpjbs5hq0b14sc9";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-5232de97ee3b75b0360528dae24e73db49566ab1";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-mbstring/zipball/5232de97ee3b75b0360528dae24e73db49566ab1";
          sha256 = "1mm670fxj2x72a9mbkyzs3yifpp6glravq2ss438bags1xf6psz8";
        };
      };
    };
    "symfony/polyfill-php70" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php70-5f03a781d984aae42cebd18e7912fa80f02ee644";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php70/zipball/5f03a781d984aae42cebd18e7912fa80f02ee644";
          sha256 = "0yzw1gp2q46pk8fmgvz4nyiz34m6d4kiardyr9ajdmfrlqsiy202";
        };
      };
    };
    "symfony/polyfill-php72" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php72-cc6e6f9b39fe8075b3dabfbaf5b5f645ae1340c9";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php72/zipball/cc6e6f9b39fe8075b3dabfbaf5b5f645ae1340c9";
          sha256 = "12dmz2n1b9pqqd758ja0c8h8h5dxdai5ik74iwvaxc5xn86a026b";
        };
      };
    };
    "symfony/polyfill-php73" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php73-a678b42e92f86eca04b7fa4c0f6f19d097fb69e2";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php73/zipball/a678b42e92f86eca04b7fa4c0f6f19d097fb69e2";
          sha256 = "10rq2x2q9hsdzskrz0aml5qcji27ypxam324044fi24nl60fyzg0";
        };
      };
    };
    "symfony/polyfill-php80" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php80-dc3063ba22c2a1fd2f45ed856374d79114998f91";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php80/zipball/dc3063ba22c2a1fd2f45ed856374d79114998f91";
          sha256 = "1mhfjibk7mqyzlqpz6jjpxpd93fnfw0nik140x3mq1d2blg5cbvd";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-313a38f09c77fbcdc1d223e57d368cea76a2fd2f";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/process/zipball/313a38f09c77fbcdc1d223e57d368cea76a2fd2f";
          sha256 = "101q7k39cyhpk8i5mrf62k62wk5sm1057s3pwzf2awgyj7nk7hm8";
        };
      };
    };
    "symfony/service-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-service-contracts-d15da7ba4957ffb8f1747218be9e1a121fd298a1";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/service-contracts/zipball/d15da7ba4957ffb8f1747218be9e1a121fd298a1";
          sha256 = "168iq1lp2r5qb5h8j0s17da09iaj2h5hrrdc9rw2p73hq8rvm1w2";
        };
      };
    };
    "symfony/stopwatch" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-stopwatch-b12274acfab9d9850c52583d136a24398cdf1a0c";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/stopwatch/zipball/b12274acfab9d9850c52583d136a24398cdf1a0c";
          sha256 = "064bvwjy2ckwsdflvd0yqkl97s3jxp4nwcbjfvfyjmclw7mha8rh";
        };
      };
    };
    "symfony/string" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-string-ad0bd91bce2054103f5eaa18ebeba8d3bc2a0572";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/string/zipball/ad0bd91bce2054103f5eaa18ebeba8d3bc2a0572";
          sha256 = "03snf86rk31jrcvaz9s1792w260iyvjchpl6ky6wshy3jkj7lqcs";
        };
      };
    };
    "theseer/tokenizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "theseer-tokenizer-75a63c33a8577608444246075ea0af0d052e452a";
        src = fetchurl {
          url = "https://api.github.com/repos/theseer/tokenizer/zipball/75a63c33a8577608444246075ea0af0d052e452a";
          sha256 = "1cj1lb99hccsnwkq0i01mlcldmy1kxwcksfvgq6vfx8mgz3iicij";
        };
      };
    };
    "vimeo/psalm" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "vimeo-psalm-d4377c0baf3ffbf0b1ec6998e8d1be2a40971005";
        src = fetchurl {
          url = "https://api.github.com/repos/vimeo/psalm/zipball/d4377c0baf3ffbf0b1ec6998e8d1be2a40971005";
          sha256 = "0rvlxnaz4xmj7pal41qnf691366lbyra2xpg8bfx0583gl7bbcg8";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-6964c76c7804814a842473e0c8fd15bab0f18e25";
        src = fetchurl {
          url = "https://api.github.com/repos/webmozarts/assert/zipball/6964c76c7804814a842473e0c8fd15bab0f18e25";
          sha256 = "17xqhb2wkwr7cgbl4xdjf7g1vkal17y79rpp6xjpf1xgl5vypc64";
        };
      };
    };
    "webmozart/path-util" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-path-util-d939f7edc24c9a1bb9c0dee5cb05d8e859490725";
        src = fetchurl {
          url = "https://api.github.com/repos/webmozart/path-util/zipball/d939f7edc24c9a1bb9c0dee5cb05d8e859490725";
          sha256 = "0zv2di0fh3aiwij0nl6595p8qvm9zh0k8jd3ngqhmqnis35kr01l";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "relay-relay";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = "https://github.com/relayphp/Relay.Relay";
    license = "MIT";
  };
}
