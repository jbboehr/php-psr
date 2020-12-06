{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "psr/link" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-link-131b5c337db3599ef922e9d6c22889ad237b80b9";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/link/zipball/131b5c337db3599ef922e9d6c22889ad237b80b9;
          sha256 = "1vxdr5mcx7rj7kc8ciwyrfidialfalsvn8hmblfjschd4540p91r";
        };
      };
    };
  };
  devPackages = {
    "doctrine/instantiator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-instantiator-f350df0268e904597e3bd9c4685c53e0e333feea";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/instantiator/zipball/f350df0268e904597e3bd9c4685c53e0e333feea;
          sha256 = "01a3px69q7ddlskaq9dc1w3cy6kyx07jxmagnnlhqkxjy2jl247q";
        };
      };
    };
    "myclabs/deep-copy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "myclabs-deep-copy-969b211f9a51aa1f6c01d1d2aef56d3bd91598e5";
        src = fetchurl {
          url = https://api.github.com/repos/myclabs/DeepCopy/zipball/969b211f9a51aa1f6c01d1d2aef56d3bd91598e5;
          sha256 = "0i5aswlbn7pxhgwswpqxf5wdr1v40kic4a2z06xv77wnfkhb6myh";
        };
      };
    };
    "phpdocumentor/reflection-common" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-common-1d01c49d4ed62f25aa84a747ad35d5a16924662b";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/ReflectionCommon/zipball/1d01c49d4ed62f25aa84a747ad35d5a16924662b;
          sha256 = "1wx720a17i24471jf8z499dnkijzb4b8xra11kvw9g9hhzfadz1r";
        };
      };
    };
    "phpdocumentor/reflection-docblock" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-reflection-docblock-069a785b2141f5bcf49f3e353548dc1cce6df556";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/ReflectionDocBlock/zipball/069a785b2141f5bcf49f3e353548dc1cce6df556;
          sha256 = "0qid63bsfjmc3ka54f1ijl4a5zqwf7jmackjyjmbw3gxdnbi69il";
        };
      };
    };
    "phpdocumentor/type-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-type-resolver-6a467b8989322d92aa1c8bf2bebcc6e5c2ba55c0";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/TypeResolver/zipball/6a467b8989322d92aa1c8bf2bebcc6e5c2ba55c0;
          sha256 = "01g6mihq5wd1396njjb7ibcdfgk26ix1kmbjb6dlshzav0k3983h";
        };
      };
    };
    "phpspec/prophecy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpspec-prophecy-451c3cd1418cf640de218914901e51b064abb093";
        src = fetchurl {
          url = https://api.github.com/repos/phpspec/prophecy/zipball/451c3cd1418cf640de218914901e51b064abb093;
          sha256 = "0z6wh1lygafcfw36r9abrg7fgq9r3v1233v38g4wbqy3jf7xfrzb";
        };
      };
    };
    "phpunit/php-code-coverage" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-code-coverage-ef7b2f56815df854e66ceaee8ebe9393ae36a40d";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/ef7b2f56815df854e66ceaee8ebe9393ae36a40d;
          sha256 = "0i6lbr08g63vzd0dh1ax6b0x8m86r79ia7iggx6k42898332qgw3";
        };
      };
    };
    "phpunit/php-file-iterator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-file-iterator-730b01bc3e867237eaac355e06a36b85dd93a8b4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-file-iterator/zipball/730b01bc3e867237eaac355e06a36b85dd93a8b4;
          sha256 = "0kbg907g9hrx7pv8v0wnf4ifqywdgvigq6y6z00lyhgd0b8is060";
        };
      };
    };
    "phpunit/php-text-template" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-text-template-31f8b717e51d9a2afca6c9f046f5d69fc27c8686";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-text-template/zipball/31f8b717e51d9a2afca6c9f046f5d69fc27c8686;
          sha256 = "1y03m38qqvsbvyakd72v4dram81dw3swyn5jpss153i5nmqr4p76";
        };
      };
    };
    "phpunit/php-timer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-timer-3dcf38ca72b158baf0bc245e9184d3fdffa9c46f";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-timer/zipball/3dcf38ca72b158baf0bc245e9184d3fdffa9c46f;
          sha256 = "1j04r0hqzrv6m1jk5nb92k2nnana72nscqpfk3rgv3fzrrv69ljr";
        };
      };
    };
    "phpunit/php-token-stream" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-token-stream-791198a2c6254db10131eecfe8c06670700904db";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-token-stream/zipball/791198a2c6254db10131eecfe8c06670700904db;
          sha256 = "03i9259r9mjib2ipdkavkq6di66mrsga6kzc7rq5pglrhfiiil4s";
        };
      };
    };
    "phpunit/phpunit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-b7803aeca3ccb99ad0a506fa80b64cd6a56bbc0c";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/phpunit/zipball/b7803aeca3ccb99ad0a506fa80b64cd6a56bbc0c;
          sha256 = "0m3bimpkv0cw4l35mnqzda50yhg8zgikfliq9lmdf36wda00rri7";
        };
      };
    };
    "phpunit/phpunit-mock-objects" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-mock-objects-a23b761686d50a560cc56233b9ecf49597cc9118";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/phpunit-mock-objects/zipball/a23b761686d50a560cc56233b9ecf49597cc9118;
          sha256 = "19sa45fzw9fhjdl470i444y64iymhdad7hmlx9q54qjh9y6fy8gk";
        };
      };
    };
    "sebastian/code-unit-reverse-lookup" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-code-unit-reverse-lookup-4419fcdb5eabb9caa61a27c7a1db532a6b55dd18";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/code-unit-reverse-lookup/zipball/4419fcdb5eabb9caa61a27c7a1db532a6b55dd18;
          sha256 = "0n0bygv2vx1l7af8szbcbn5bpr4axrgvkzd0m348m8ckmk8akvs8";
        };
      };
    };
    "sebastian/comparator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-comparator-2b7424b55f5047b47ac6e5ccb20b2aea4011d9be";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/comparator/zipball/2b7424b55f5047b47ac6e5ccb20b2aea4011d9be;
          sha256 = "0ymarxgnr8b3iy0w18h5z13iiv0ja17vjryryzfcwlqqhlc6w7iq";
        };
      };
    };
    "sebastian/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-diff-7f066a26a962dbe58ddea9f72a4e82874a3975a4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/diff/zipball/7f066a26a962dbe58ddea9f72a4e82874a3975a4;
          sha256 = "1ppx21vjj79z6d584ryq451k7kvdc511awmqjkj9g4vxj1s1h3j6";
        };
      };
    };
    "sebastian/environment" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-environment-5795ffe5dc5b02460c3e34222fee8cbe245d8fac";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/environment/zipball/5795ffe5dc5b02460c3e34222fee8cbe245d8fac;
          sha256 = "0z1zv8v7k2cycw3vzilpbs7y3mjpwdzcspzgl6pbzi8rj7f4a93l";
        };
      };
    };
    "sebastian/exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-exporter-ce474bdd1a34744d7ac5d6aad3a46d48d9bac4c4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/exporter/zipball/ce474bdd1a34744d7ac5d6aad3a46d48d9bac4c4;
          sha256 = "1g8b7nm7f5dk7rkxhv3l6pclb95az28gi0j5g3inymysa95myh5d";
        };
      };
    };
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-bc37d50fea7d017d3d340f230811c9f1d7280af4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/global-state/zipball/bc37d50fea7d017d3d340f230811c9f1d7280af4;
          sha256 = "0y1x16mf9q38s7rlc7k2s6sxn2ccxmyk1q5zgh24hr4yp035f0pb";
        };
      };
    };
    "sebastian/object-enumerator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-enumerator-1311872ac850040a79c3c058bea3e22d0f09cbb7";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/object-enumerator/zipball/1311872ac850040a79c3c058bea3e22d0f09cbb7;
          sha256 = "0f4vdgpq2alsj43bap0sarr79fxnzwpddq96kd18kgfl6n6m730y";
        };
      };
    };
    "sebastian/recursion-context" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-recursion-context-2c3ba150cbec723aa057506e73a8d33bdb286c9a";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/recursion-context/zipball/2c3ba150cbec723aa057506e73a8d33bdb286c9a;
          sha256 = "0rfa6qwayrlzaf4ycwm10m870bmzq152w1rn7wp4vrm283zkf4cs";
        };
      };
    };
    "sebastian/resource-operations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-resource-operations-ce990bb21759f94aeafd30209e8cfcdfa8bc3f52";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/resource-operations/zipball/ce990bb21759f94aeafd30209e8cfcdfa8bc3f52;
          sha256 = "19jfc8xzkyycglrcz85sv3ajmxvxwkw4sid5l4i8g6wmz9npbsxl";
        };
      };
    };
    "sebastian/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-version-99732be0ddb3361e16ad77b68ba41efc8e979019";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/version/zipball/99732be0ddb3361e16ad77b68ba41efc8e979019;
          sha256 = "0wrw5hskz2hg5aph9r1fhnngfrcvhws1pgs0lfrwindy066z6fj7";
        };
      };
    };
    "squizlabs/php_codesniffer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "squizlabs-php_codesniffer-2acf168de78487db620ab4bc524135a13cfe6745";
        src = fetchurl {
          url = https://api.github.com/repos/squizlabs/PHP_CodeSniffer/zipball/2acf168de78487db620ab4bc524135a13cfe6745;
          sha256 = "149gak174pfqilb67i51w874ji179r3ckwiqcrz0p860lfm3sg8m";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-f4ba089a5b6366e453971d3aad5fe8e897b37f41";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-ctype/zipball/f4ba089a5b6366e453971d3aad5fe8e897b37f41;
          sha256 = "0gx3vypz6hipnma7ymqlarr66yxddjmqwkgspiriy8mqcz2y61mn";
        };
      };
    };
    "symfony/yaml" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-yaml-543cb4dbd45ed803f08a9a65f27fb149b5dd20c2";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/yaml/zipball/543cb4dbd45ed803f08a9a65f27fb149b5dd20c2;
          sha256 = "0vj91brghsgvd59a4k5gc2qpqhvbk2iirnr62wlrk9d4vfijclf6";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-bafc69caeb4d49c39fd0779086c03a3738cbb389";
        src = fetchurl {
          url = https://api.github.com/repos/webmozart/assert/zipball/bafc69caeb4d49c39fd0779086c03a3738cbb389;
          sha256 = "18jplwg4dsl86rqf1fvizbx84klmbvaq207a6i8gl97qxp20arlj";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "fig-link-util";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    license = "MIT";
  };
}