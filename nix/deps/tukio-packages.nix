{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "fig/event-dispatcher-util" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "fig-event-dispatcher-util-29725c77467dddf637d08579e63b28a14209dbff";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/event-dispatcher-util/zipball/29725c77467dddf637d08579e63b28a14209dbff;
          sha256 = "11a80wld8i4zq9r49sncfz9grngnkpqfxg1r22qfag73hz9c4g1j";
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
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-5db60a4969eba0e0c197a19c077780aadbc43c5d";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/annotations/zipball/5db60a4969eba0e0c197a19c077780aadbc43c5d;
          sha256 = "1a8psmvs90x4nflfvjvp6j9yjmq6z9jgsb3plrp5c7iy7snkq1v2";
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
    "lstrojny/functional-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "lstrojny-functional-php-11610f50323519dd38bd7b527d6730e524e5eb58";
        src = fetchurl {
          url = https://api.github.com/repos/lstrojny/functional-php/zipball/11610f50323519dd38bd7b527d6730e524e5eb58;
          sha256 = "0hlkjc73gja2zwzq9v5xymj637j103lnah2bavp0gnh37nzcsqc0";
        };
      };
    };
    "myclabs/deep-copy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "myclabs-deep-copy-5796d127b0c4ff505b77455148ea9d5269d99758";
        src = fetchurl {
          url = https://api.github.com/repos/myclabs/DeepCopy/zipball/5796d127b0c4ff505b77455148ea9d5269d99758;
          sha256 = "1l6v4viyq7zm0824k12x25i9hqfq36syjm32f33fsk7mb6ys9gfd";
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
    "phpbench/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpbench-container-c0e3cbf1cd8f867c70b029cb6d1b0b39fe6d409d";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/container/zipball/c0e3cbf1cd8f867c70b029cb6d1b0b39fe6d409d;
          sha256 = "1818l10w9wr4z780hy1ml9imlf8xagvbd8fyhi9kgm1pniqgpny2";
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
        name = "phpbench-phpbench-a541ccbc9c3296940b22f1c90e3b82d81eb71e41";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/phpbench/zipball/a541ccbc9c3296940b22f1c90e3b82d81eb71e41;
          sha256 = "1rz2z0wqd63im25zbpalrqsvxyyd3hg413gvrnv4a7ws0ygylwa6";
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
        name = "phpdocumentor-reflection-docblock-cd72d394ca794d3466a3b2fc09d5a6c1dc86b47e";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/ReflectionDocBlock/zipball/cd72d394ca794d3466a3b2fc09d5a6c1dc86b47e;
          sha256 = "17fnqsf7vic0prp0rnqdhp7mahhwakg4nnhca86x83iwvic66sg2";
        };
      };
    };
    "phpdocumentor/type-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpdocumentor-type-resolver-e878a14a65245fbe78f8080eba03b47c3b705651";
        src = fetchurl {
          url = https://api.github.com/repos/phpDocumentor/TypeResolver/zipball/e878a14a65245fbe78f8080eba03b47c3b705651;
          sha256 = "1anwy26b1z9ymgy36ch7is27wnkrzl7v50cd69fz481paa9f9izk";
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
        name = "phpunit-php-code-coverage-807e6013b00af69b6c5d9ceb4282d0393dbb9d8d";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/php-code-coverage/zipball/807e6013b00af69b6c5d9ceb4282d0393dbb9d8d;
          sha256 = "04l5piavahvxp5j3f6s1cx85b3lnjidnlw3nixk24nwqx4bdfk10";
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
        name = "phpunit-phpunit-9467db479d1b0487c99733bb1e7944d32deded2c";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/phpunit/zipball/9467db479d1b0487c99733bb1e7944d32deded2c;
          sha256 = "192mri9ikbcc8ix4pwiwyyw8jc9xfg77il4wjbadycw4k4f43944";
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
    "sebastian/global-state" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "sebastian-global-state-e8ba02eed7bbbb9e59e43dedd3dddeff4a56b0c4";
        src = fetchurl {
          url = https://api.github.com/repos/sebastianbergmann/global-state/zipball/e8ba02eed7bbbb9e59e43dedd3dddeff4a56b0c4;
          sha256 = "1489kfvz0gg6jprakr43mjkminlhpsimcdrrxkmsm6mmhahbgjnf";
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
        name = "seld-jsonlint-ff2aa5420bfbc296cf6a0bc785fa5b35736de7c1";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/jsonlint/zipball/ff2aa5420bfbc296cf6a0bc785fa5b35736de7c1;
          sha256 = "13a6r0pk1wqa2fqvxj9s97gy5qan4jwgn2s7r3q8n7cslhf44dv4";
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
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-34ac555a3627e324b660e318daa07572e1140123";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/console/zipball/34ac555a3627e324b660e318daa07572e1140123;
          sha256 = "1kym2lf3dk1wy1rkd7i8n3f5dm16224x448nqynjp7kjkwl7l6ia";
        };
      };
    };
    "symfony/debug" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-debug-28f92d08bb6d1fddf8158e02c194ad43870007e6";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/debug/zipball/28f92d08bb6d1fddf8158e02c194ad43870007e6;
          sha256 = "09vblsv0bh4lbancdd03s55g7lzcazfhmibi453m751hdsmqxcss";
        };
      };
    };
    "symfony/deprecation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-deprecation-contracts-dd99cb3a0aff6cadd2a8d7d7ed72c2161e218337";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/deprecation-contracts/zipball/dd99cb3a0aff6cadd2a8d7d7ed72c2161e218337;
          sha256 = "0w3y2iyibaad6x3d7nn5w5bijxwlhqbgscx9x9lyfdg96w650qnk";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-6e4320f06d5f2cce0d96530162491f4465179157";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/filesystem/zipball/6e4320f06d5f2cce0d96530162491f4465179157;
          sha256 = "1ks2k0bcpnw43nfdp2pbvy47mq82d8ylgv9nbx5mx3ay5q9alm1a";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-4298870062bfc667cb78d2b379be4bf5dec5f187";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/finder/zipball/4298870062bfc667cb78d2b379be4bf5dec5f187;
          sha256 = "08gc305cng271lq0wgym4q366pfasjpl4sylrkam4ywba4mf1ky6";
        };
      };
    };
    "symfony/options-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-options-resolver-663f5dd5e14057d1954fe721f9709d35837f2447";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/options-resolver/zipball/663f5dd5e14057d1954fe721f9709d35837f2447;
          sha256 = "01y0padk0zllbpbl36q4ar07xsdnyrqgfa1kz6khnppwdc6xi6a7";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-2edd75b8b35d62fd3eeabba73b26b8f1f60ce13d";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-ctype/zipball/2edd75b8b35d62fd3eeabba73b26b8f1f60ce13d;
          sha256 = "0gixj9117cv2bc858fphc4vqgyp57g9srg063l7f103zfwhq3vmn";
        };
      };
    };
    "symfony/polyfill-intl-grapheme" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-grapheme-6e4dbcf5e81eba86e36731f94fe56b1726835846";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-intl-grapheme/zipball/6e4dbcf5e81eba86e36731f94fe56b1726835846;
          sha256 = "1sabg8vwkb0582gnqflbwsdarhs5a0bxh67923q9qpbqjkcqv465";
        };
      };
    };
    "symfony/polyfill-intl-normalizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-normalizer-40309d1700e8f72447bb9e7b54af756eeea35620";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/40309d1700e8f72447bb9e7b54af756eeea35620;
          sha256 = "1sz1385vrlm9i9kb4lvvh4jx42s4irnvxjwq8gnmc4zpc09cglzp";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-7110338d81ce1cbc3e273136e4574663627037a7";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-mbstring/zipball/7110338d81ce1cbc3e273136e4574663627037a7;
          sha256 = "1iq0x9h7j8vsrfd95y25vglahqfdkh38yv134wqgzy9cnrbakzqb";
        };
      };
    };
    "symfony/polyfill-php73" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php73-fa0837fe02d617d31fbb25f990655861bb27bd1a";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php73/zipball/fa0837fe02d617d31fbb25f990655861bb27bd1a;
          sha256 = "1pbnwlqmpaj6vqyngks006g5nd23gd7wccfpzxk9516xrbsjprqj";
        };
      };
    };
    "symfony/polyfill-php80" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php80-4a5b6bba3259902e386eb80dd1956181ee90b5b2";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php80/zipball/4a5b6bba3259902e386eb80dd1956181ee90b5b2;
          sha256 = "1dfsvaz5g7zvn0l0w66d5rqyshmx1rm43n48bl6l4xkcvnqmpz6r";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-7f6378c1fa2147eeb1b4c385856ce9de0d46ebd1";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/process/zipball/7f6378c1fa2147eeb1b4c385856ce9de0d46ebd1;
          sha256 = "0czd4cs4sxjrk9g14c23ybvc9m1i7br9fq2mllmi5v5lmcf758p3";
        };
      };
    };
    "symfony/service-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-service-contracts-66a8f0957a3ca54e4f724e49028ab19d75a8918b";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/service-contracts/zipball/66a8f0957a3ca54e4f724e49028ab19d75a8918b;
          sha256 = "08rqnzg6z4njx1wlzlk4zr3mdqcpfqh3pm6ikjvhphhjhkl5rahn";
        };
      };
    };
    "symfony/string" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-string-ac70459db781108db7c6d8981dd31ce0e29e3298";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/string/zipball/ac70459db781108db7c6d8981dd31ce0e29e3298;
          sha256 = "1mi9wgwrgks6l2qpi2qdnz8l6pkx3fpjkp7y7sd4wj7b7n8zarf1";
        };
      };
    };
    "theseer/tokenizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "theseer-tokenizer-11336f6f84e16a720dae9d8e6ed5019efa85a0f9";
        src = fetchurl {
          url = https://api.github.com/repos/theseer/tokenizer/zipball/11336f6f84e16a720dae9d8e6ed5019efa85a0f9;
          sha256 = "1nnym5d45fanxfp18yb0ylpwcvg3973ppzc67ana02g9w72gfspl";
        };
      };
    };
    "webmozart/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webmozart-assert-9dc4f203e36f2b486149058bade43c851dd97451";
        src = fetchurl {
          url = https://api.github.com/repos/webmozart/assert/zipball/9dc4f203e36f2b486149058bade43c851dd97451;
          sha256 = "1bljpw3hnpz5wlnpkz2g6nnlzrj8p36qp9bnxzh3zqy9j3d66k9z";
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