{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "fig/event-dispatcher-util" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "fig-event-dispatcher-util-b906bd3c2bc7a7b5ed987ab12667161f7d83a45b";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/event-dispatcher-util/zipball/b906bd3c2bc7a7b5ed987ab12667161f7d83a45b;
          sha256 = "0f57rnaw0zqw9qxg8ansj8xa7dw8b96xmsivl21r650xiwd25sbs";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-b7ce3b176482dbbc1245ebf52b181af44c2cf55f";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/container/zipball/b7ce3b176482dbbc1245ebf52b181af44c2cf55f;
          sha256 = "0rkz64vgwb0gfi09klvgay4qnw993l1dc03vyip7d7m2zxi6cy4j";
        };
      };
    };
    "psr/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-event-dispatcher-dbefd12671e8a14ec7f180cab83036ed26714bb0";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/event-dispatcher/zipball/dbefd12671e8a14ec7f180cab83036ed26714bb0;
          sha256 = "05nicsd9lwl467bsv4sn44fjnnvqvzj1xqw2mmz9bac9zm66fsjd";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-0f73288fd15629204f9d42b7055f72dacbe811fc";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/log/zipball/0f73288fd15629204f9d42b7055f72dacbe811fc;
          sha256 = "1npi9ggl4qll4sdxz1xgp8779ia73gwlpjxbb1f1cpl1wn4s42r4";
        };
      };
    };
  };
  devPackages = {
    "beberlei/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "beberlei-assert-d63a6943fc4fd1a2aedb65994e3548715105abcf";
        src = fetchurl {
          url = https://api.github.com/repos/beberlei/assert/zipball/d63a6943fc4fd1a2aedb65994e3548715105abcf;
          sha256 = "0x9ym59gn0fxa8pbv3359y8pfrxqsrmk7b0icjwlimpkqq9yy7jc";
        };
      };
    };
    "composer/ca-bundle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-ca-bundle-8a7ecad675253e4654ea05505233285377405215";
        src = fetchurl {
          url = https://api.github.com/repos/composer/ca-bundle/zipball/8a7ecad675253e4654ea05505233285377405215;
          sha256 = "1l4rxcgya42ms654lxybgcg15zgdzxsrzdpkzk1k4zlv8qksh2m7";
        };
      };
    };
    "composer/composer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-composer-47c841ba3b2d3fc0b4b13282cf029ea18b66d78b";
        src = fetchurl {
          url = https://api.github.com/repos/composer/composer/zipball/47c841ba3b2d3fc0b4b13282cf029ea18b66d78b;
          sha256 = "07vga7lxl0n6kn26yi8x2n5llc0mghmws492w41f7ihhcrg23wh6";
        };
      };
    };
    "composer/semver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-semver-38276325bd896f90dfcfe30029aa5db40df387a7";
        src = fetchurl {
          url = https://api.github.com/repos/composer/semver/zipball/38276325bd896f90dfcfe30029aa5db40df387a7;
          sha256 = "17a9yixy54sy3mh1mwrgkjv430ivz6gl51c6yhppqs90wdhalpx7";
        };
      };
    };
    "composer/spdx-licenses" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-spdx-licenses-6946f785871e2314c60b4524851f3702ea4f2223";
        src = fetchurl {
          url = https://api.github.com/repos/composer/spdx-licenses/zipball/6946f785871e2314c60b4524851f3702ea4f2223;
          sha256 = "0raab8q0kcxngz2r9s8psgz211vmfhnbw6x87p2gfvpyrnraan56";
        };
      };
    };
    "composer/xdebug-handler" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-xdebug-handler-ebd27a9866ae8254e873866f795491f02418c5a5";
        src = fetchurl {
          url = https://api.github.com/repos/composer/xdebug-handler/zipball/ebd27a9866ae8254e873866f795491f02418c5a5;
          sha256 = "1r84xd8fqb3slsmmm7vmawi470vlii26mdpjcb57ldm86kzaj955";
        };
      };
    };
    "dealerdirect/phpcodesniffer-composer-installer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dealerdirect-phpcodesniffer-composer-installer-e8d808670b8f882188368faaf1144448c169c0b7";
        src = fetchurl {
          url = https://api.github.com/repos/Dealerdirect/phpcodesniffer-composer-installer/zipball/e8d808670b8f882188368faaf1144448c169c0b7;
          sha256 = "0sz09ppjjxyq8h3g2lc88k3kd24kragl0fqmr72dqb5dvg3fb01k";
        };
      };
    };
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-bfe91e31984e2ba76df1c1339681770401ec262f";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/annotations/zipball/bfe91e31984e2ba76df1c1339681770401ec262f;
          sha256 = "1c0c7x71r08qkwlr6pwb5f82ya4rjlyy37dklbw8yifvgl8gp60v";
        };
      };
    };
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
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-e864bbf5904cb8f5bb334f99209b48018522f042";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/lexer/zipball/e864bbf5904cb8f5bb334f99209b48018522f042;
          sha256 = "11lg9fcy0crb8inklajhx3kyffdbx7xzdj8kwl21xsgq9nm9iwvv";
        };
      };
    };
    "friendsofphp/php-cs-fixer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "friendsofphp-php-cs-fixer-1023c3458137ab052f6ff1e09621a721bfdeca13";
        src = fetchurl {
          url = https://api.github.com/repos/FriendsOfPHP/PHP-CS-Fixer/zipball/1023c3458137ab052f6ff1e09621a721bfdeca13;
          sha256 = "1ympwxg8bqwypam1h296cdlc692mvdxyjy3haa6sc7ii2r48h1sa";
        };
      };
    };
    "justinrainbow/json-schema" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "justinrainbow-json-schema-2ba9c8c862ecd5510ed16c6340aa9f6eadb4f31b";
        src = fetchurl {
          url = https://api.github.com/repos/justinrainbow/json-schema/zipball/2ba9c8c862ecd5510ed16c6340aa9f6eadb4f31b;
          sha256 = "18hqybnyfcyvnkjzgq91nqgb2c05gmziliq5ck8l8cy7s75wm6xf";
        };
      };
    };
    "league/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "league-container-7dc67bdf89efc338e674863c0ea70a63efe4de05";
        src = fetchurl {
          url = https://api.github.com/repos/thephpleague/container/zipball/7dc67bdf89efc338e674863c0ea70a63efe4de05;
          sha256 = "16di5mpb377r8xrzf3nyvwk0d247al7kk26wf944xqdvd8q97h53";
        };
      };
    };
    "lstrojny/functional-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "lstrojny-functional-php-4924870cecd16c8fe6536ff25f4deb1f18e53f39";
        src = fetchurl {
          url = https://api.github.com/repos/lstrojny/functional-php/zipball/4924870cecd16c8fe6536ff25f4deb1f18e53f39;
          sha256 = "1wh1c4hzdmvk1yyydqxvlxq92rdvlvz3py9ky13x5gmmmg8dhd9a";
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
    "nette/utils" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nette-utils-c09937fbb24987b2a41c6022ebe84f4f1b8eec0f";
        src = fetchurl {
          url = https://api.github.com/repos/nette/utils/zipball/c09937fbb24987b2a41c6022ebe84f4f1b8eec0f;
          sha256 = "1ik3xfqzwrxdbrjpxlfpkk83k1l98xjvyc3hsc6472dpkmm96n0l";
        };
      };
    };
    "nunomaduro/phpinsights" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nunomaduro-phpinsights-4e9672fdb78b7d0ea2708f6303ca134986d6af1a";
        src = fetchurl {
          url = https://api.github.com/repos/nunomaduro/phpinsights/zipball/4e9672fdb78b7d0ea2708f6303ca134986d6af1a;
          sha256 = "1ykbxgxas0wr1hzw46vkq25jgi0x1dd2yvxlb9pyjffq4k4vz1yw";
        };
      };
    };
    "object-calisthenics/phpcs-calisthenics-rules" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "object-calisthenics-phpcs-calisthenics-rules-6a4e66767138763839370273b47f1f9da6e0ee5a";
        src = fetchurl {
          url = https://api.github.com/repos/object-calisthenics/phpcs-calisthenics-rules/zipball/6a4e66767138763839370273b47f1f9da6e0ee5a;
          sha256 = "0jbpnczfsnf91sw65ppsnkvx9byzjn431w0iabhv8pza0bf0xyzz";
        };
      };
    };
    "paragonie/random_compat" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "paragonie-random_compat-84b4dfb120c6f9b4ff7b3685f9b8f1aa365a0c95";
        src = fetchurl {
          url = https://api.github.com/repos/paragonie/random_compat/zipball/84b4dfb120c6f9b4ff7b3685f9b8f1aa365a0c95;
          sha256 = "03nsccdvcb79l64b7lsmx0n8ldf5z3v8niqr7bpp6wg401qp9p09";
        };
      };
    };
    "phar-io/manifest" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-manifest-7761fcacf03b4d4f16e7ccb606d4879ca431fcf4";
        src = fetchurl {
          url = https://api.github.com/repos/phar-io/manifest/zipball/7761fcacf03b4d4f16e7ccb606d4879ca431fcf4;
          sha256 = "1n59a0gnk43ryl54bc37hlsi1spvi8280bq64zddxrpagyjyp15a";
        };
      };
    };
    "phar-io/version" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phar-io-version-45a2ec53a73c70ce41d55cedef9063630abaf1b6";
        src = fetchurl {
          url = https://api.github.com/repos/phar-io/version/zipball/45a2ec53a73c70ce41d55cedef9063630abaf1b6;
          sha256 = "0syr7v2b3lsdavfa22z55sdkg5awc3jlzpgn0qk0d3vf6x96hvzp";
        };
      };
    };
    "php-cs-fixer/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-cs-fixer-diff-78bb099e9c16361126c86ce82ec4405ebab8e756";
        src = fetchurl {
          url = https://api.github.com/repos/PHP-CS-Fixer/diff/zipball/78bb099e9c16361126c86ce82ec4405ebab8e756;
          sha256 = "082w79q2bipw5iibpw6whihnz2zafljh5bgpfs4qdxmz25n8g00l";
        };
      };
    };
    "phpbench/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpbench-container-2f2b269b3b8cb9a0053cf98f1c3a84866fe7f0e2";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/container/zipball/2f2b269b3b8cb9a0053cf98f1c3a84866fe7f0e2;
          sha256 = "0h9a6jkj07w7qi1474z0wvw7ws5ijrd300sgza51db5445x2ns7r";
        };
      };
    };
    "phpbench/dom" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpbench-dom-b135378dd0004c05ba5446aeddaf0b83339c1c4c";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/dom/zipball/b135378dd0004c05ba5446aeddaf0b83339c1c4c;
          sha256 = "042600hi6jqcys0rsswcr1ybh4v51lqy7v07qfk6k913mdmn3x7k";
        };
      };
    };
    "phpbench/phpbench" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpbench-phpbench-829217ef08c568449d039ff43205d8bb0c8027be";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/phpbench/zipball/829217ef08c568449d039ff43205d8bb0c8027be;
          sha256 = "1r1ylxkjp91y518936crd96bkmwdc2qwsp7iz2h6szcg3z4p92ka";
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
    "phploc/phploc" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phploc-phploc-5b714ccb7cb8ca29ccf9caf6eb1aed0131d3a884";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/phploc/zipball/5b714ccb7cb8ca29ccf9caf6eb1aed0131d3a884;
          sha256 = "1jkxizpqhr5wcyz6c2nwy36ix2cvmwhr57g7v90sl11wsnmlqy91";
        };
      };
    };
    "phpspec/prophecy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpspec-prophecy-8ce87516be71aae9b956f81906aaf0338e0d8a2d";
        src = fetchurl {
          url = https://api.github.com/repos/phpspec/prophecy/zipball/8ce87516be71aae9b956f81906aaf0338e0d8a2d;
          sha256 = "10cfgk3bm05ikav74809l7548w892118y7ai467ncp2ijmy1gr3v";
        };
      };
    };
    "phpstan/phpdoc-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpstan-phpdoc-parser-98a088b17966bdf6ee25c8a4b634df313d8aa531";
        src = fetchurl {
          url = https://api.github.com/repos/phpstan/phpdoc-parser/zipball/98a088b17966bdf6ee25c8a4b634df313d8aa531;
          sha256 = "0qk526jr6j0b84wsik0sar5vsvfy3qgg2kw1m2cmizw88x11axgm";
        };
      };
    };
    "phpunit/php-code-coverage" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-code-coverage-f1884187926fbb755a9aaf0b3836ad3165b478bf";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/f1884187926fbb755a9aaf0b3836ad3165b478bf;
          sha256 = "1vnahnjxshyvvx1j7dsqcw1wrmwkgp5zjd2yv9bzi1lkh1lkisqm";
        };
      };
    };
    "phpunit/php-file-iterator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-file-iterator-050bedf145a257b1ff02746c31894800e5122946";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-file-iterator/zipball/050bedf145a257b1ff02746c31894800e5122946;
          sha256 = "0b5y1dmksnzqps694h1bhw6r6w1cqrf3vhw2k00adjdawjzaa00j";
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
        name = "phpunit-php-timer-1038454804406b0b5f5f520358e78c1c2f71501e";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-timer/zipball/1038454804406b0b5f5f520358e78c1c2f71501e;
          sha256 = "0vmaca44sz6n9avd8awzk28wq5w4qnvjfl24q89611pdnkl4j8d8";
        };
      };
    };
    "phpunit/php-token-stream" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-php-token-stream-995192df77f63a59e47f025390d2d1fdf8f425ff";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-token-stream/zipball/995192df77f63a59e47f025390d2d1fdf8f425ff;
          sha256 = "1hl3n6kad0n4vls1sy0qgrqw3caxm2z50adi3nhzx0asdsx85nfn";
        };
      };
    };
    "phpunit/phpunit" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpunit-phpunit-34c18baa6a44f1d1fbf0338907139e9dce95b997";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/phpunit/zipball/34c18baa6a44f1d1fbf0338907139e9dce95b997;
          sha256 = "15p8is3rvk1h6wrzqkync98zaip3di0lr926r93j6yv638c6bsaz";
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
        name = "sebastian-comparator-5de4fc177adf9bce8df98d8d141a7559d7ccf6da";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/comparator/zipball/5de4fc177adf9bce8df98d8d141a7559d7ccf6da;
          sha256 = "1kf0w51kj4whak8cdmplhj3vsvpj71bl0k3dyz197vvh83ghvl2i";
        };
      };
    };
    "sebastian/diff" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-diff-720fcc7e9b5cf384ea68d9d930d480907a0c1a29";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/diff/zipball/720fcc7e9b5cf384ea68d9d930d480907a0c1a29;
          sha256 = "0i81kz91grz5vzifw114kg6dcfh150019zid7j99j2y5w7s1fqq2";
        };
      };
    };
    "sebastian/environment" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-environment-464c90d7bdf5ad4e8a6aea15c091fec0603d4368";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/environment/zipball/464c90d7bdf5ad4e8a6aea15c091fec0603d4368;
          sha256 = "1dpd2x9yr02c4wf5icvgaw70i8bzxcmqab9plxjv00d712h73z08";
        };
      };
    };
    "sebastian/exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-exporter-68609e1261d215ea5b21b7987539cbfbe156ec3e";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/exporter/zipball/68609e1261d215ea5b21b7987539cbfbe156ec3e;
          sha256 = "0i8a502xqf2ripwbr5rgw9z49z9as7fjibh7sr171q0h4yrrr02j";
        };
      };
    };
    "sebastian/finder-facade" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-finder-facade-167c45d131f7fc3d159f56f191a0a22228765e16";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/finder-facade/zipball/167c45d131f7fc3d159f56f191a0a22228765e16;
          sha256 = "07hnh050c3abdx8iw2blxrspqhq9nv5g5wrmhmw0frf7w2a9sp5v";
        };
      };
    };
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-edf8a461cf1d4005f19fb0b6b8b95a9f7fa0adc4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/global-state/zipball/edf8a461cf1d4005f19fb0b6b8b95a9f7fa0adc4;
          sha256 = "01wba1xd5qvcx1j0vldlyixjlbyvnxnm2vx1i2y1wqaldn8d1wy2";
        };
      };
    };
    "sebastian/object-enumerator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-enumerator-7cfd9e65d11ffb5af41198476395774d4c8a84c5";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/object-enumerator/zipball/7cfd9e65d11ffb5af41198476395774d4c8a84c5;
          sha256 = "00z5wzh19z1drnh52d27gflqm7dyisp96c29zyxrgsdccv1wss3m";
        };
      };
    };
    "sebastian/object-reflector" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-object-reflector-773f97c67f28de00d397be301821b06708fca0be";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/object-reflector/zipball/773f97c67f28de00d397be301821b06708fca0be;
          sha256 = "1rq5wwf7smdbbz3mj46hmjc643bbsm2b6cnnggmawyls479qmxlk";
        };
      };
    };
    "sebastian/recursion-context" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-recursion-context-5b0cd723502bac3b006cbf3dbf7a1e3fcefe4fa8";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/recursion-context/zipball/5b0cd723502bac3b006cbf3dbf7a1e3fcefe4fa8;
          sha256 = "0p4j54bxriciw67g7l8zy1wa472di0b8f8mxs4fdvm37asz2s6vd";
        };
      };
    };
    "sebastian/resource-operations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-resource-operations-4d7a795d35b889bf80a0cc04e08d77cedfa917a9";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/resource-operations/zipball/4d7a795d35b889bf80a0cc04e08d77cedfa917a9;
          sha256 = "0prnq9hvg1bi3nkms21wl0fr0f28p0mhp5w802sqb05v9k0qnb41";
        };
      };
    };
    "sebastian/type" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-type-3aaaa15fa71d27650d62a948be022fe3b48541a3";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/type/zipball/3aaaa15fa71d27650d62a948be022fe3b48541a3;
          sha256 = "034sc9qiag074lsi990nfwzm9jnw9fysdwsd906146snqrxcqsk6";
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
    "seld/jsonlint" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "seld-jsonlint-590cfec960b77fd55e39b7d9246659e95dd6d337";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/jsonlint/zipball/590cfec960b77fd55e39b7d9246659e95dd6d337;
          sha256 = "03lqkhizm1flkl9k6gfj1i10sfkrs54hafjcb5ng7kw5bgb98zd5";
        };
      };
    };
    "seld/phar-utils" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "seld-phar-utils-8674b1d84ffb47cc59a101f5d5a3b61e87d23796";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/phar-utils/zipball/8674b1d84ffb47cc59a101f5d5a3b61e87d23796;
          sha256 = "14q8b6c7k1172nml5v88z244xy0vqbk6dhc68j2iv0l9yww2722d";
        };
      };
    };
    "sensiolabs/security-checker" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sensiolabs-security-checker-a576c01520d9761901f269c4934ba55448be4a54";
        src = fetchurl {
          url = https://api.github.com/repos/sensiolabs/security-checker/zipball/a576c01520d9761901f269c4934ba55448be4a54;
          sha256 = "0zlylw1gr1g32yzg35jkmavxj8m5mxyl9iyfxmisna5y74f07l6s";
        };
      };
    };
    "slevomat/coding-standard" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "slevomat-coding-standard-696dcca217d0c9da2c40d02731526c1e25b65346";
        src = fetchurl {
          url = https://api.github.com/repos/slevomat/coding-standard/zipball/696dcca217d0c9da2c40d02731526c1e25b65346;
          sha256 = "017mb08j9c6657nv9mkgy09qpy9540dxsvximgm1j1r1dzxnyj3j";
        };
      };
    };
    "squizlabs/php_codesniffer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "squizlabs-php_codesniffer-e97627871a7eab2f70e59166072a6b767d5834e0";
        src = fetchurl {
          url = https://api.github.com/repos/squizlabs/PHP_CodeSniffer/zipball/e97627871a7eab2f70e59166072a6b767d5834e0;
          sha256 = "1anpqfjr0iq9vsvcx4b7dx4mswhgkybrg9712q137h4cvwg0p8g7";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-90933b39c7b312fc3ceaa1ddeac7eb48cb953124";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/console/zipball/90933b39c7b312fc3ceaa1ddeac7eb48cb953124;
          sha256 = "1vg9n5m2wjlfmn1pdg2lhggz2qazc2kyc6xnipk72xngfr42smbn";
        };
      };
    };
    "symfony/deprecation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-deprecation-contracts-5fa56b4074d1ae755beb55617ddafe6f5d78f665";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/deprecation-contracts/zipball/5fa56b4074d1ae755beb55617ddafe6f5d78f665;
          sha256 = "0ny59x0aaipqaj956wx7ak5f6d5rn90766swp5m18019v9cppg10";
        };
      };
    };
    "symfony/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-e17bb5e0663dc725f7cdcafc932132735b4725cd";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/event-dispatcher/zipball/e17bb5e0663dc725f7cdcafc932132735b4725cd;
          sha256 = "0p7zgnj74phljg6dljvg54ajr8m5m451nfc5b1hjhjlkw8dbr5kn";
        };
      };
    };
    "symfony/event-dispatcher-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-contracts-84e23fdcd2517bf37aecbd16967e83f0caee25a7";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/event-dispatcher-contracts/zipball/84e23fdcd2517bf37aecbd16967e83f0caee25a7;
          sha256 = "1pcfrlc0rg8vdnp23y3y1p5qzng5nxf5i2c36g9x9f480xrnc1fw";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-1a8697545a8d87b9f2f6b1d32414199cc5e20aae";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/filesystem/zipball/1a8697545a8d87b9f2f6b1d32414199cc5e20aae;
          sha256 = "1gjjlmyzf3g1ak25qw1nlsm6agc74d25w4djpih7bz21m8i2vavj";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-2c3ba7ad6884e6c4451ce2340e2dc23f6fa3e0d8";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/finder/zipball/2c3ba7ad6884e6c4451ce2340e2dc23f6fa3e0d8;
          sha256 = "0r6j60xmpfsjw8g0zfk0afdbr3rvl92k6bpynmwjj8173f7gjlj6";
        };
      };
    };
    "symfony/http-client" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-client-df757997ee95101c0ca94c7ea2b76e16a758e0ca";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/http-client/zipball/df757997ee95101c0ca94c7ea2b76e16a758e0ca;
          sha256 = "1z5d6c868n5k6l5cb4i8jb40z0v3lz4c7b2d76rpqzddrwhnyl2b";
        };
      };
    };
    "symfony/http-client-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-client-contracts-3a5d0fe7908daaa23e3dbf4cee3ba4bfbb19fdd3";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/http-client-contracts/zipball/3a5d0fe7908daaa23e3dbf4cee3ba4bfbb19fdd3;
          sha256 = "0rznd5q8wc299fdks3rwfc3m5v3g5l182my2apvxghs63br0mgay";
        };
      };
    };
    "symfony/mime" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-mime-4404d6545125863561721514ad9388db2661eec5";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/mime/zipball/4404d6545125863561721514ad9388db2661eec5;
          sha256 = "00kq85mk685zsa1hvh4x0wlq0iyighd5g0qdw9a76rscxkgdpsc6";
        };
      };
    };
    "symfony/options-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-options-resolver-4c7e155bf7d93ea4ba3824d5a14476694a5278dd";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/options-resolver/zipball/4c7e155bf7d93ea4ba3824d5a14476694a5278dd;
          sha256 = "1np8b12vk3064dn0b40zq078rlsppychhljlrr7hn4xm11d17hl3";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-1c302646f6efc070cd46856e600e5e0684d6b454";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-ctype/zipball/1c302646f6efc070cd46856e600e5e0684d6b454;
          sha256 = "17piwz6vhdch0kc7wd3h04sgrvpmw7dqfkrcj2dppid5j8v29lnv";
        };
      };
    };
    "symfony/polyfill-intl-idn" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-idn-5dcab1bc7146cf8c1beaa4502a3d9be344334251";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/5dcab1bc7146cf8c1beaa4502a3d9be344334251;
          sha256 = "015saw0cl3108lqqax58p9q608193hh89dav4ril54na1yz6r3lz";
        };
      };
    };
    "symfony/polyfill-intl-normalizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-normalizer-37078a8dd4a2a1e9ab0231af7c6cb671b2ed5a7e";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/37078a8dd4a2a1e9ab0231af7c6cb671b2ed5a7e;
          sha256 = "0dy6snii84dyific6xn6a3mz9shhp7wj4fyqjizg89jwvc3f7qdj";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-a6977d63bf9a0ad4c65cd352709e230876f9904a";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-mbstring/zipball/a6977d63bf9a0ad4c65cd352709e230876f9904a;
          sha256 = "1i6fhjag28q3ynp7jfixm8rx1j1p9z88yvmcxzfkzjm1gl8v7w54";
        };
      };
    };
    "symfony/polyfill-php70" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php70-0dd93f2c578bdc9c72697eaa5f1dd25644e618d3";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php70/zipball/0dd93f2c578bdc9c72697eaa5f1dd25644e618d3;
          sha256 = "1mrsfx3pxs1wqz5bz24i1rxlsbv7bx8q5fndk7z53kb59jsg1837";
        };
      };
    };
    "symfony/polyfill-php72" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php72-639447d008615574653fb3bc60d1986d7172eaae";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php72/zipball/639447d008615574653fb3bc60d1986d7172eaae;
          sha256 = "1kqxamfcf5k8i3fh3950syg91rsk4bhjm83w5qjbia6xfm03awxz";
        };
      };
    };
    "symfony/polyfill-php73" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php73-fffa1a52a023e782cdcc221d781fe1ec8f87fcca";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php73/zipball/fffa1a52a023e782cdcc221d781fe1ec8f87fcca;
          sha256 = "07sv5hjmadp879rq2q50d9rbwi2ki6rkap98yn0h7hq82q2yh1f0";
        };
      };
    };
    "symfony/polyfill-php80" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php80-d87d5766cbf48d72388a9f6b85f280c8ad51f981";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php80/zipball/d87d5766cbf48d72388a9f6b85f280c8ad51f981;
          sha256 = "1cxwqycsj776iqlib7np33l94ch3hal6a7dghq1b3xmm1j1450z7";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-d3a2e64866169586502f0cd9cab69135ad12cee9";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/process/zipball/d3a2e64866169586502f0cd9cab69135ad12cee9;
          sha256 = "0j6vfqabicv4942ikv03qja7hamihm877mp908p32y0nr7jx6nh3";
        };
      };
    };
    "symfony/service-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-service-contracts-d15da7ba4957ffb8f1747218be9e1a121fd298a1";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/service-contracts/zipball/d15da7ba4957ffb8f1747218be9e1a121fd298a1;
          sha256 = "168iq1lp2r5qb5h8j0s17da09iaj2h5hrrdc9rw2p73hq8rvm1w2";
        };
      };
    };
    "symfony/stopwatch" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-stopwatch-0f7c58cf81dbb5dd67d423a89d577524a2ec0323";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/stopwatch/zipball/0f7c58cf81dbb5dd67d423a89d577524a2ec0323;
          sha256 = "00l78j645ni650l6v9f1v8bv1xmxcaxj2xrffhn1jhp17ivkp0qh";
        };
      };
    };
    "theseer/fdomdocument" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "theseer-fdomdocument-6e8203e40a32a9c770bcb62fe37e68b948da6dca";
        src = fetchurl {
          url = https://api.github.com/repos/theseer/fDOMDocument/zipball/6e8203e40a32a9c770bcb62fe37e68b948da6dca;
          sha256 = "0zm1mn7xfdwk1mxicchj8ljw0q8qdragpv78w1rwyxqqb4dlpihn";
        };
      };
    };
    "theseer/tokenizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "theseer-tokenizer-75a63c33a8577608444246075ea0af0d052e452a";
        src = fetchurl {
          url = https://api.github.com/repos/theseer/tokenizer/zipball/75a63c33a8577608444246075ea0af0d052e452a;
          sha256 = "1cj1lb99hccsnwkq0i01mlcldmy1kxwcksfvgq6vfx8mgz3iicij";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-bafc69caeb4d49c39fd0779086c03a3738cbb389";
        src = fetchurl {
          url = https://api.github.com/repos/webmozart/assert/zipball/bafc69caeb4d49c39fd0779086c03a3738cbb389;
          sha256 = "0wd0si4c9r1256xj76vgk2slxpamd0wzam3dyyz0g8xgyra7201c";
        };
      };
    };
    "webmozart/path-util" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-path-util-d939f7edc24c9a1bb9c0dee5cb05d8e859490725";
        src = fetchurl {
          url = https://api.github.com/repos/webmozart/path-util/zipball/d939f7edc24c9a1bb9c0dee5cb05d8e859490725;
          sha256 = "0zv2di0fh3aiwij0nl6595p8qvm9zh0k8jd3ngqhmqnis35kr01l";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "crell-tukio";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = https://github.com/Crell/Tukio;
    license = "LGPL-3.0-or-later";
  };
}