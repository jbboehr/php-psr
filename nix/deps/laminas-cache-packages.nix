{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "container-interop/container-interop" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "container-interop-container-interop-79cbf1341c22ec75643d841642dd5d6acd83bdb8";
        src = fetchurl {
          url = https://api.github.com/repos/container-interop/container-interop/zipball/79cbf1341c22ec75643d841642dd5d6acd83bdb8;
          sha256 = "1pxm461g5flcq50yabr01nw8w17n3g7klpman9ps3im4z0604m52";
        };
      };
    };
    "laminas/laminas-eventmanager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-eventmanager-1940ccf30e058b2fd66f5a9d696f1b5e0027b082";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-eventmanager/zipball/1940ccf30e058b2fd66f5a9d696f1b5e0027b082;
          sha256 = "0jbkql891py1bzx27sq4rz18w8zm146x0395yccb97giywd3xqpa";
        };
      };
    };
    "laminas/laminas-servicemanager" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-servicemanager-0d4c8628a71fae9f7bd0b1b74b76382e5e9a04b1";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-servicemanager/zipball/0d4c8628a71fae9f7bd0b1b74b76382e5e9a04b1;
          sha256 = "02m7hnhx5gbafjrlb86bizdpbq74if9r9y7zjyml1r21y7x6x1n2";
        };
      };
    };
    "laminas/laminas-stdlib" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-stdlib-b9d84eaa39fde733356ea948cdef36c631f202b6";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-stdlib/zipball/b9d84eaa39fde733356ea948cdef36c631f202b6;
          sha256 = "1wqg4yz120yr7i02wpg487c3i9yg8xmhf8cmcw8imjrynzc35wnd";
        };
      };
    };
    "laminas/laminas-zendframework-bridge" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-zendframework-bridge-6ede70583e101030bcace4dcddd648f760ddf642";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-zendframework-bridge/zipball/6ede70583e101030bcace4dcddd648f760ddf642;
          sha256 = "10cksxv2fzv3d14n8kmij3wvfibddzp1qz65dqgybs1w2fd1n358";
        };
      };
    };
    "psr/cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-cache-d11b50ad223250cf17b86e38383413f5a6764bf8";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/cache/zipball/d11b50ad223250cf17b86e38383413f5a6764bf8;
          sha256 = "06i2k3dx3b4lgn9a4v1dlgv8l9wcl4kl7vzhh63lbji0q96hv8qz";
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
    "psr/simple-cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-simple-cache-408d5eafb83c57f6365a3ca330ff23aa4a5fa39b";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/simple-cache/zipball/408d5eafb83c57f6365a3ca330ff23aa4a5fa39b;
          sha256 = "1djgzclkamjxi9jy4m9ggfzgq1vqxaga2ip7l3cj88p7rwkzjxgw";
        };
      };
    };
  };
  devPackages = {
    "beberlei/assert" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "beberlei-assert-124317de301b7c91d5fce34c98bba2c6925bec95";
        src = fetchurl {
          url = https://api.github.com/repos/beberlei/assert/zipball/124317de301b7c91d5fce34c98bba2c6925bec95;
          sha256 = "0ngswbl0qjgm3g5509cf6x1wax4ljzcs3pxz7fsmg394hy6xzha8";
        };
      };
    };
    "cache/integration-tests" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cache-integration-tests-a8d9538a44ed5a70d551f9b87f534c98dfe6b0ee";
        src = fetchurl {
          url = https://api.github.com/repos/php-cache/integration-tests/zipball/a8d9538a44ed5a70d551f9b87f534c98dfe6b0ee;
          sha256 = "0hwvv505a6y01ykx3dvlba3q8wss8w8hii048l7skz2k2vd4qm9j";
        };
      };
    };
    "cache/tag-interop" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "cache-tag-interop-c7496dd81530f538af27b4f2713cde97bc292832";
        src = fetchurl {
          url = https://api.github.com/repos/php-cache/tag-interop/zipball/c7496dd81530f538af27b4f2713cde97bc292832;
          sha256 = "14p3nq8ncq02iiazfqvvqhycjr96nbfnazpgg583h752v6knjyr6";
        };
      };
    };
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-ce77a7ba1770462cd705a91a151b6c3746f9c6ad";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/annotations/zipball/ce77a7ba1770462cd705a91a151b6c3746f9c6ad;
          sha256 = "1gyiq27jg7n0p4wyx7qbcv8kfwacx25jpsnlqiyi3zbrqcb8ajn4";
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
    "laminas/laminas-coding-standard" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-coding-standard-08880ce2fbfe62d471cd3cb766a91da630b32539";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-coding-standard/zipball/08880ce2fbfe62d471cd3cb766a91da630b32539;
          sha256 = "0zgc255wp6xwlpa0qnkvqn9l2cy2mbbijqli8775mv6wmfgi79ld";
        };
      };
    };
    "laminas/laminas-json" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-json-00dc0da7b5e5018904c5c4a8e80a5faa16c2c1c6";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-json/zipball/00dc0da7b5e5018904c5c4a8e80a5faa16c2c1c6;
          sha256 = "0xfcs5n3ji7n6my24x0iz4r2cgdzkv18xi22l8abyhi0xalmczdv";
        };
      };
    };
    "laminas/laminas-serializer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-serializer-c1c9361f114271b0736db74e0083a919081af5e0";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-serializer/zipball/c1c9361f114271b0736db74e0083a919081af5e0;
          sha256 = "0m1wfs5lymlwgi8gz14zgaqr284l36is3sz833a5fsjcwvnwyz9l";
        };
      };
    };
    "laminas/laminas-session" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "laminas-laminas-session-921e6a9f807ee243a9a4f8a8a297929d0c2b50cd";
        src = fetchurl {
          url = https://api.github.com/repos/laminas/laminas-session/zipball/921e6a9f807ee243a9a4f8a8a297929d0c2b50cd;
          sha256 = "1wziynbn2fjfwzmxcbgfk3x7h8nhhln3lqpjy4wv8kzr8rsf46wc";
        };
      };
    };
    "lstrojny/functional-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "lstrojny-functional-php-9e8363e3cb9db924327f51b5804f4dfba03605aa";
        src = fetchurl {
          url = https://api.github.com/repos/lstrojny/functional-php/zipball/9e8363e3cb9db924327f51b5804f4dfba03605aa;
          sha256 = "1mzm7jqg4sqcibm5y2p2f6ddqshvm2lgvi5p5bwjmismqvazj56b";
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
        name = "phpbench-phpbench-0dab4d0b6a699c27105d677398b2ea8046706292";
        src = fetchurl {
          url = https://api.github.com/repos/phpbench/phpbench/zipball/0dab4d0b6a699c27105d677398b2ea8046706292;
          sha256 = "1adb6wn5awdy21zrwy1krhj2y1g7180il7s7dmr003fr90wb5ppn";
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
        name = "phpspec-prophecy-8ce87516be71aae9b956f81906aaf0338e0d8a2d";
        src = fetchurl {
          url = https://api.github.com/repos/phpspec/prophecy/zipball/8ce87516be71aae9b956f81906aaf0338e0d8a2d;
          sha256 = "10cfgk3bm05ikav74809l7548w892118y7ai467ncp2ijmy1gr3v";
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
        name = "seld-jsonlint-590cfec960b77fd55e39b7d9246659e95dd6d337";
        src = fetchurl {
          url = https://api.github.com/repos/Seldaek/jsonlint/zipball/590cfec960b77fd55e39b7d9246659e95dd6d337;
          sha256 = "03lqkhizm1flkl9k6gfj1i10sfkrs54hafjcb5ng7kw5bgb98zd5";
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
        name = "symfony-console-a10b1da6fc93080c180bba7219b5ff5b7518fe81";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/console/zipball/a10b1da6fc93080c180bba7219b5ff5b7518fe81;
          sha256 = "1asr5i05m7gxyd2abizc41kajiaxapl7kkgjh2niaraxa7f9iq9l";
        };
      };
    };
    "symfony/debug" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-debug-ab42889de57fdfcfcc0759ab102e2fd4ea72dcae";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/debug/zipball/ab42889de57fdfcfcc0759ab102e2fd4ea72dcae;
          sha256 = "0kd3kiy5g0ljx96mvf8hn218mi02z06b1dmk4zcl2jxsppsnkkbw";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-e58d7841cddfed6e846829040dca2cca0ebbbbb3";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/filesystem/zipball/e58d7841cddfed6e846829040dca2cca0ebbbbb3;
          sha256 = "0hhyf1qmj9xy29ja11kv3cyypz1ssfsrnjfhpinnb5v69w46za2y";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-4e1da3c110c52d868f8a9153b7de3ebc381fba78";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/finder/zipball/4e1da3c110c52d868f8a9153b7de3ebc381fba78;
          sha256 = "039j9hrfkkl8grb4fvr6irsfvr6g7bsnqw4hc02v4sr7fvi7ib2q";
        };
      };
    };
    "symfony/options-resolver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-options-resolver-c7efc97a47b2ebaabc19d5b6c6b50f5c37c92744";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/options-resolver/zipball/c7efc97a47b2ebaabc19d5b6c6b50f5c37c92744;
          sha256 = "0mbc1765ckxxaidnyvjlxyzadzibaks785fbgd5bc8dcfp397igb";
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
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-39d483bdf39be819deabf04ec872eb0b2410b531";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-mbstring/zipball/39d483bdf39be819deabf04ec872eb0b2410b531;
          sha256 = "1rzll717f58biifmxsb56akm7fsjfj70wahycdsfpxdds75m267w";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-b8648cf1d5af12a44a51d07ef9bf980921f15fca";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/process/zipball/b8648cf1d5af12a44a51d07ef9bf980921f15fca;
          sha256 = "02hxmkjv3k4ims5hrjjyd6k9fxqjbcclljnxgriczd10l58cv4sv";
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
          sha256 = "18jplwg4dsl86rqf1fvizbx84klmbvaq207a6i8gl97qxp20arlj";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "laminas-laminas-cache";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = https://laminas.dev;
    license = "BSD-3-Clause";
  };
}