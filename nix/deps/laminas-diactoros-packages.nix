{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
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
    "psr/http-factory" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-factory-12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/http-factory/zipball/12ac7fcd07e5b077433f5f2bee95b3a771bf61be;
          sha256 = "0inbnqpc5bfhbbda9dwazsrw9xscfnc8rdx82q1qm3r446mc1vds";
        };
      };
    };
    "psr/http-message" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-message-f6561bf28d520154e4b0ec72be95418abe6d9363";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/http-message/zipball/f6561bf28d520154e4b0ec72be95418abe6d9363;
          sha256 = "195dd67hva9bmr52iadr4kyp2gw2f5l51lplfiay2pv6l9y4cf45";
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
    "http-interop/http-factory-tests" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "http-interop-http-factory-tests-3c6c62052daeb67ca7dc3e1ea1b72c0f0cc19070";
        src = fetchurl {
          url = https://api.github.com/repos/http-interop/http-factory-tests/zipball/3c6c62052daeb67ca7dc3e1ea1b72c0f0cc19070;
          sha256 = "06i9jd2sxnl8s9m52xwbjr27k00dmakj3shs3wsl08y61jywa97h";
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
    "php-http/psr7-integration-tests" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-http-psr7-integration-tests-c3bb79ca4a276df57364ff45bf2f619f769ded4a";
        src = fetchurl {
          url = https://api.github.com/repos/php-http/psr7-integration-tests/zipball/c3bb79ca4a276df57364ff45bf2f619f769ded4a;
          sha256 = "0j4q05mgc84drq4v34nfdl44dkzrl0y76mrzfgh79r4ask1x22hr";
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
  name = "laminas-laminas-diactoros";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = https://laminas.dev;
    license = "BSD-3-Clause";
  };
}