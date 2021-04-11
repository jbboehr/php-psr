{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "guzzlehttp/guzzle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-guzzle-9d4290de1cfd701f38099ef7e183b64b4b7b0c5e";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/guzzle/zipball/9d4290de1cfd701f38099ef7e183b64b4b7b0c5e";
          sha256 = "1dlrdpil0173cmx73ghy8iis2j0lk00dzv3n166d0riky21n8djb";
        };
      };
    };
    "guzzlehttp/promises" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-promises-8e7d04f1f6450fef59366c399cfad4b9383aa30d";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/promises/zipball/8e7d04f1f6450fef59366c399cfad4b9383aa30d";
          sha256 = "158wd8nmvvl386c24lkr4jkwdhqpdj0dxdbjwh8iv6a2rgccjr2q";
        };
      };
    };
    "guzzlehttp/psr7" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-psr7-35ea11d335fd638b5882ff1725228b3d35496ab1";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/psr7/zipball/35ea11d335fd638b5882ff1725228b3d35496ab1";
          sha256 = "1nsd7sla2jpx9kzg0lzk4kvc66d30bnkf2yfzdp7gghb67wvajfa";
        };
      };
    };
    "psr/http-client" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-client-2dfb5f6c5eff0e91e20e913f8c5452ed95b86621";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-client/zipball/2dfb5f6c5eff0e91e20e913f8c5452ed95b86621";
          sha256 = "0cmkifa3ji1r8kn3y1rwg81rh8g2crvnhbv2am6d688dzsbw967v";
        };
      };
    };
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
    "ralouphie/getallheaders" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ralouphie-getallheaders-120b605dfeb996808c31b6477290a714d356e822";
        src = fetchurl {
          url = "https://api.github.com/repos/ralouphie/getallheaders/zipball/120b605dfeb996808c31b6477290a714d356e822";
          sha256 = "1bv7ndkkankrqlr2b4kw7qp3fl0dxi6bp26bnim6dnlhavd6a0gg";
        };
      };
    };
    "symfony/polyfill-intl-idn" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-idn-2d63434d922daf7da8dd863e7907e67ee3031483";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/2d63434d922daf7da8dd863e7907e67ee3031483";
          sha256 = "0sk592qrdb6dvk6v8msjva8p672qmhmnzkw1lw53gks0xrc20xjy";
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
  };
  devPackages = {
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
    "phpunit/php-code-coverage" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-code-coverage-f6293e1b30a2354e8428e004689671b83871edde";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/f6293e1b30a2354e8428e004689671b83871edde";
          sha256 = "0q7az9h109jchlsgkzlnvzl90f39ifqp53k9bih85lbkaiz5w329";
        };
      };
    };
    "phpunit/php-file-iterator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-file-iterator-aa4be8575f26070b100fccb67faabb28f21f66f8";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-file-iterator/zipball/aa4be8575f26070b100fccb67faabb28f21f66f8";
          sha256 = "0vxnrzwb573ddmiw1sd77bdym6jiimwjhcz7yvmsr9wswkxh18l6";
        };
      };
    };
    "phpunit/php-invoker" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-invoker-5a10147d0aaf65b58940a0b72f71c9ac0423cc67";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-invoker/zipball/5a10147d0aaf65b58940a0b72f71c9ac0423cc67";
          sha256 = "1vqnnjnw94mzm30n9n5p2bfgd3wd5jah92q6cj3gz1nf0qigr4fh";
        };
      };
    };
    "phpunit/php-text-template" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-text-template-5da5f67fc95621df9ff4c4e5a84d6a8a2acf7c28";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-text-template/zipball/5da5f67fc95621df9ff4c4e5a84d6a8a2acf7c28";
          sha256 = "0ff87yzywizi6j2ps3w0nalpx16mfyw3imzn6gj9jjsfwc2bb8lq";
        };
      };
    };
    "phpunit/php-timer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-timer-5a63ce20ed1b5bf577850e2c4e87f4aa902afbd2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/php-timer/zipball/5a63ce20ed1b5bf577850e2c4e87f4aa902afbd2";
          sha256 = "0g1g7yy4zk1bidyh165fsbqx5y8f1c8pxikvcahzlfsr9p2qxk6a";
        };
      };
    };
    "phpunit/phpunit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-c73c6737305e779771147af66c96ca6a7ed8a741";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/phpunit/zipball/c73c6737305e779771147af66c96ca6a7ed8a741";
          sha256 = "1j7iz17jpf69ijidylsavqxn67qf3n8xvs8g9gk6wkl4z6db7gc7";
        };
      };
    };
    "sebastian/cli-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-cli-parser-442e7c7e687e42adc03470c7b668bc4b2402c0b2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/cli-parser/zipball/442e7c7e687e42adc03470c7b668bc4b2402c0b2";
          sha256 = "074qzdq19k9x4svhq3nak5h348xska56v1sqnhk1aj0jnrx02h37";
        };
      };
    };
    "sebastian/code-unit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-code-unit-1fc9f64c0927627ef78ba436c9b17d967e68e120";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/code-unit/zipball/1fc9f64c0927627ef78ba436c9b17d967e68e120";
          sha256 = "04vlx050rrd54mxal7d93pz4119pas17w3gg5h532anfxjw8j7pm";
        };
      };
    };
    "sebastian/code-unit-reverse-lookup" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-code-unit-reverse-lookup-ac91f01ccec49fb77bdc6fd1e548bc70f7faa3e5";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/code-unit-reverse-lookup/zipball/ac91f01ccec49fb77bdc6fd1e548bc70f7faa3e5";
          sha256 = "1h1jbzz3zak19qi4mab2yd0ddblpz7p000jfyxfwd2ds0gmrnsja";
        };
      };
    };
    "sebastian/comparator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-comparator-55f4261989e546dc112258c7a75935a81a7ce382";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/comparator/zipball/55f4261989e546dc112258c7a75935a81a7ce382";
          sha256 = "1d4bgf4m2x0kn3nw9hbb45asbx22lsp9vxl74rp1yl3sj2vk9sch";
        };
      };
    };
    "sebastian/complexity" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-complexity-739b35e53379900cc9ac327b2147867b8b6efd88";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/complexity/zipball/739b35e53379900cc9ac327b2147867b8b6efd88";
          sha256 = "1y4yz8n8hszbhinf9ipx3pqyvgm7gz0krgyn19z0097yq3bbq8yf";
        };
      };
    };
    "sebastian/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-diff-3461e3fccc7cfdfc2720be910d3bd73c69be590d";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/diff/zipball/3461e3fccc7cfdfc2720be910d3bd73c69be590d";
          sha256 = "0967nl6cdnr0v0z83w4xy59agn60kfv8gb41aw3fpy1n2wpp62dj";
        };
      };
    };
    "sebastian/environment" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-environment-388b6ced16caa751030f6a69e588299fa09200ac";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/environment/zipball/388b6ced16caa751030f6a69e588299fa09200ac";
          sha256 = "022vn8zss3sm7hg83kg3y0lmjw2ak6cy64b584nbsgxfhlmf6msd";
        };
      };
    };
    "sebastian/exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-exporter-d89cc98761b8cb5a1a235a6b703ae50d34080e65";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/exporter/zipball/d89cc98761b8cb5a1a235a6b703ae50d34080e65";
          sha256 = "1s8v0cbcjdb0wvwyh869y5f8d55mpjkr0f3gg2kvvxk3wh8nvvc7";
        };
      };
    };
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-a90ccbddffa067b51f574dea6eb25d5680839455";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/global-state/zipball/a90ccbddffa067b51f574dea6eb25d5680839455";
          sha256 = "0pad9gz2y38rziywdliylhhgz6762053pm57254xf7hywfpqsa3a";
        };
      };
    };
    "sebastian/lines-of-code" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-lines-of-code-c1c2e997aa3146983ed888ad08b15470a2e22ecc";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/lines-of-code/zipball/c1c2e997aa3146983ed888ad08b15470a2e22ecc";
          sha256 = "0fay9s5cm16gbwr7qjihwrzxn7sikiwba0gvda16xng903argbk0";
        };
      };
    };
    "sebastian/object-enumerator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-enumerator-5c9eeac41b290a3712d88851518825ad78f45c71";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-enumerator/zipball/5c9eeac41b290a3712d88851518825ad78f45c71";
          sha256 = "11853z07w8h1a67wsjy3a6ir5x7khgx6iw5bmrkhjkiyvandqcn1";
        };
      };
    };
    "sebastian/object-reflector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-reflector-b4f479ebdbf63ac605d183ece17d8d7fe49c15c7";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/object-reflector/zipball/b4f479ebdbf63ac605d183ece17d8d7fe49c15c7";
          sha256 = "0g5m1fswy6wlf300x1vcipjdljmd3vh05hjqhqfc91byrjbk4rsg";
        };
      };
    };
    "sebastian/recursion-context" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-recursion-context-cd9d8cf3c5804de4341c283ed787f099f5506172";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/recursion-context/zipball/cd9d8cf3c5804de4341c283ed787f099f5506172";
          sha256 = "1k0ki1krwq6329vsbw3515wsyg8a7n2l83lk19pdc12i2lg9nhpy";
        };
      };
    };
    "sebastian/resource-operations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-resource-operations-0f4443cb3a1d92ce809899753bc0d5d5a8dd19a8";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/resource-operations/zipball/0f4443cb3a1d92ce809899753bc0d5d5a8dd19a8";
          sha256 = "0p5s8rp7mrhw20yz5wx1i4k8ywf0h0ximcqan39n9qnma1dlnbyr";
        };
      };
    };
    "sebastian/type" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-type-81cd61ab7bbf2de744aba0ea61fae32f721df3d2";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/type/zipball/81cd61ab7bbf2de744aba0ea61fae32f721df3d2";
          sha256 = "0mar746dr79v1phlfhv5k6kk10615yc0vz6afnmr6r36irqdazya";
        };
      };
    };
    "sebastian/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-version-c6c1022351a901512170118436c764e473f6de8c";
        src = fetchurl {
          url = "https://api.github.com/repos/sebastianbergmann/version/zipball/c6c1022351a901512170118436c764e473f6de8c";
          sha256 = "1bs7bwa9m0fin1zdk7vqy5lxzlfa9la90lkl27sn0wr00m745ig1";
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
    "spryker/code-sniffer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "spryker-code-sniffer-cf7d526037982d67490d0a60c59575b9fcb24fad";
        src = fetchurl {
          url = "https://api.github.com/repos/spryker/code-sniffer/zipball/cf7d526037982d67490d0a60c59575b9fcb24fad";
          sha256 = "1ggs0r50vpl02l8nr6hr54n9zpvq379ick405z60n6c1zcdc5y26";
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
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "ricardofiorani-guzzle-psr18-adapter";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = "https://github.com/ricardofiorani/guzzle-psr18-adapter";
    license = "MIT";
  };
}
