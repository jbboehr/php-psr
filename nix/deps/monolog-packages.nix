{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
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
    "aws/aws-sdk-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "aws-aws-sdk-php-d44eac162f8ed1869d20c076adca9869c70a8ad9";
        src = fetchurl {
          url = https://api.github.com/repos/aws/aws-sdk-php/zipball/d44eac162f8ed1869d20c076adca9869c70a8ad9;
          sha256 = "1zpra8gnykhp69a2y7r1w6ja15hb8nsalswvjg82bf3l5baczngh";
        };
      };
    };
    "doctrine/couchdb" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-couchdb-2ca8e66343b6d00658a86ba9709fffcdb5965251";
        src = fetchurl {
          url = https://api.github.com/repos/doctrine/couchdb-client/zipball/2ca8e66343b6d00658a86ba9709fffcdb5965251;
          sha256 = "1vqzjn09shcq1xwws6qr82292r60g6bidjwfjw627ifi03i67j8n";
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
    "egulias/email-validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "egulias-email-validator-cfa3d44471c7f5bfb684ac2b0da7114283d78441";
        src = fetchurl {
          url = https://api.github.com/repos/egulias/EmailValidator/zipball/cfa3d44471c7f5bfb684ac2b0da7114283d78441;
          sha256 = "0v151ayw9lyjh8nws1wjihs5pj2md6hiyrs4152ypfgwd2bqq9zf";
        };
      };
    };
    "elasticsearch/elasticsearch" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "elasticsearch-elasticsearch-9ba89f905ebf699e72dacffa410331c7fecc8255";
        src = fetchurl {
          url = https://api.github.com/repos/elastic/elasticsearch-php/zipball/9ba89f905ebf699e72dacffa410331c7fecc8255;
          sha256 = "1lfgx7bsz8yqqqxk48lv6bf3qrvjxm46i8qnyy92pdqgrdggvlgf";
        };
      };
    };
    "graylog2/gelf-php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "graylog2-gelf-php-14b87aa31880b9f2da6de053674ea1e12d4a174b";
        src = fetchurl {
          url = https://api.github.com/repos/bzikarsky/gelf-php/zipball/14b87aa31880b9f2da6de053674ea1e12d4a174b;
          sha256 = "03iqis69nd9alqaxp73q45i754gpiwkgngyd86qjc8clxbfyg8s6";
        };
      };
    };
    "guzzlehttp/guzzle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-guzzle-2d9d3c186a6637a43193e66b097c50e4451eaab2";
        src = fetchurl {
          url = https://api.github.com/repos/guzzle/guzzle/zipball/2d9d3c186a6637a43193e66b097c50e4451eaab2;
          sha256 = "07fnqcwjafciwk0vvfbsffwhj9dnf6x786c9q78wz94kpy5npz31";
        };
      };
    };
    "guzzlehttp/promises" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-promises-a59da6cf61d80060647ff4d3eb2c03a2bc694646";
        src = fetchurl {
          url = https://api.github.com/repos/guzzle/promises/zipball/a59da6cf61d80060647ff4d3eb2c03a2bc694646;
          sha256 = "1kpl91fzalcgkcs16lpakvzcnbkry3id4ynx6xhq477p4fipdciz";
        };
      };
    };
    "guzzlehttp/psr7" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-psr7-239400de7a173fe9901b9ac7c06497751f00727a";
        src = fetchurl {
          url = https://api.github.com/repos/guzzle/psr7/zipball/239400de7a173fe9901b9ac7c06497751f00727a;
          sha256 = "0mfq93x7ayix6l3v5jkk40a9hnmrxaqr9vk1r26q39d1s6292ma7";
        };
      };
    };
    "guzzlehttp/ringphp" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-ringphp-5e2a174052995663dd68e6b5ad838afd47dd615b";
        src = fetchurl {
          url = https://api.github.com/repos/guzzle/RingPHP/zipball/5e2a174052995663dd68e6b5ad838afd47dd615b;
          sha256 = "09n1znwxawmsidyq6zk94mg85hibsg8kxm1j0bi795pa55fiqzj9";
        };
      };
    };
    "guzzlehttp/streams" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-streams-47aaa48e27dae43d39fc1cea0ccf0d84ac1a2ba5";
        src = fetchurl {
          url = https://api.github.com/repos/guzzle/streams/zipball/47aaa48e27dae43d39fc1cea0ccf0d84ac1a2ba5;
          sha256 = "1ax2b61l31vsx5814iak7l35rmh9yk0rbps5gndrkwlf27ciq9jy";
        };
      };
    };
    "mtdowling/jmespath.php" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "mtdowling-jmespath.php-52168cb9472de06979613d365c7f1ab8798be895";
        src = fetchurl {
          url = https://api.github.com/repos/jmespath/jmespath.php/zipball/52168cb9472de06979613d365c7f1ab8798be895;
          sha256 = "14sl8kprlzv4lcz8fhpvl15f8fsxd9wkg7vnlrcrnfb4d2542a02";
        };
      };
    };
    "myclabs/deep-copy" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "myclabs-deep-copy-b2c28789e80a97badd14145fda39b545d83ca3ef";
        src = fetchurl {
          url = https://api.github.com/repos/myclabs/DeepCopy/zipball/b2c28789e80a97badd14145fda39b545d83ca3ef;
          sha256 = "1a7vr0kb54z8cpal0hqlar9dg5jaklhr4pckvwahgdk37kh38p0s";
        };
      };
    };
    "paragonie/constant_time_encoding" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "paragonie-constant_time_encoding-47a1cedd2e4d52688eb8c96469c05ebc8fd28fa2";
        src = fetchurl {
          url = https://api.github.com/repos/paragonie/constant_time_encoding/zipball/47a1cedd2e4d52688eb8c96469c05ebc8fd28fa2;
          sha256 = "00yfq2wwrdf16jadfr3jn1q2sx2vai05x7xin2i2qjlhlpqj8vk8";
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
    "php-amqplib/php-amqplib" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-amqplib-php-amqplib-6353c5d2d3021a301914bc6566e695c99cfeb742";
        src = fetchurl {
          url = https://api.github.com/repos/php-amqplib/php-amqplib/zipball/6353c5d2d3021a301914bc6566e695c99cfeb742;
          sha256 = "1nadc5afkn1fiws2w1wh0n032pr5b4dzfg1dcqyf2jnh0nsgq0xp";
        };
      };
    };
    "php-console/php-console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-console-php-console-aa1d71d4ea3dc91e126edc9aa4f3c10eb8559cff";
        src = fetchurl {
          url = https://api.github.com/repos/barbushin/php-console/zipball/aa1d71d4ea3dc91e126edc9aa4f3c10eb8559cff;
          sha256 = "0nsqbrxdzcvxxjyh3j37q6a0mh5ahgrxgpi5wkwdy52lqb532yk7";
        };
      };
    };
    "php-parallel-lint/php-parallel-lint" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "php-parallel-lint-php-parallel-lint-474f18bc6cc6aca61ca40bfab55139de614e51ca";
        src = fetchurl {
          url = https://api.github.com/repos/php-parallel-lint/PHP-Parallel-Lint/zipball/474f18bc6cc6aca61ca40bfab55139de614e51ca;
          sha256 = "0kbi69p74qgss55cbaz2lqy8ibar2ywkrbw8syyykdx1qxjm4lyb";
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
    "phpseclib/phpseclib" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpseclib-phpseclib-34620af4df7d1988d8f0d7e91f6c8a3bf931d8dc";
        src = fetchurl {
          url = https://api.github.com/repos/phpseclib/phpseclib/zipball/34620af4df7d1988d8f0d7e91f6c8a3bf931d8dc;
          sha256 = "1jlc8plx0v0rq3zqhc19a01r7xx7a2p6gl7mkzf2hn0kss50plz5";
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
    "predis/predis" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "predis-predis-f0210e38881631afeafb56ab43405a92cafd9fd1";
        src = fetchurl {
          url = https://api.github.com/repos/nrk/predis/zipball/f0210e38881631afeafb56ab43405a92cafd9fd1;
          sha256 = "0361alhpbzmi81d0maqd2wd61izf6jfqqdwqr05i02k047lfc6yp";
        };
      };
    };
    "psr/http-client" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-client-496a823ef742b632934724bf769560c2a5c7c44e";
        src = fetchurl {
          url = https://api.github.com/repos/php-fig/http-client/zipball/496a823ef742b632934724bf769560c2a5c7c44e;
          sha256 = "1da5f0jax9i738kdrv91mbkp57s3mhw52w3ls0bmwlqwpzim8qiv";
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
    "ralouphie/getallheaders" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ralouphie-getallheaders-120b605dfeb996808c31b6477290a714d356e822";
        src = fetchurl {
          url = https://api.github.com/repos/ralouphie/getallheaders/zipball/120b605dfeb996808c31b6477290a714d356e822;
          sha256 = "1bv7ndkkankrqlr2b4kw7qp3fl0dxi6bp26bnim6dnlhavd6a0gg";
        };
      };
    };
    "react/promise" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "react-promise-f3cff96a19736714524ca0dd1d4130de73dbbbc4";
        src = fetchurl {
          url = https://api.github.com/repos/reactphp/promise/zipball/f3cff96a19736714524ca0dd1d4130de73dbbbc4;
          sha256 = "0wg9260q99z7sapsm43nhh1gl588z238aixjkp081x1h0c8j500m";
        };
      };
    };
    "rollbar/rollbar" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "rollbar-rollbar-889501d445e6096c037f7098e2a7121657290de8";
        src = fetchurl {
          url = https://api.github.com/repos/rollbar/rollbar-php/zipball/889501d445e6096c037f7098e2a7121657290de8;
          sha256 = "0z26l67pdm1fsbxv5gc27gmibyvaha0plvl60w9hj3mzr18lildi";
        };
      };
    };
    "ruflin/elastica" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ruflin-elastica-29262657b33c003cf138b7c66f75e78bc5e01ddf";
        src = fetchurl {
          url = https://api.github.com/repos/ruflin/Elastica/zipball/29262657b33c003cf138b7c66f75e78bc5e01ddf;
          sha256 = "11nhcqvmwcb1l6mr3q054jqfy3ay4h9irrz68zwr1rbal9vcbk8s";
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
    "swiftmailer/swiftmailer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "swiftmailer-swiftmailer-149cfdf118b169f7840bbe3ef0d4bc795d1780c9";
        src = fetchurl {
          url = https://api.github.com/repos/swiftmailer/swiftmailer/zipball/149cfdf118b169f7840bbe3ef0d4bc795d1780c9;
          sha256 = "0kscflkky6h7p7ambsf19rywnlnqslc503958cyriq5lg91nj9ri";
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
    "symfony/polyfill-iconv" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-iconv-ba6c9c18db36235b859cc29b8372d1c01298c035";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-iconv/zipball/ba6c9c18db36235b859cc29b8372d1c01298c035;
          sha256 = "1hzw224ah11qj5q4r5lbwb8khv7va59ll047kr0m56wg28g0nn0k";
        };
      };
    };
    "symfony/polyfill-intl-idn" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-idn-a57f8161502549a742a63c09f0a604997bf47027";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/a57f8161502549a742a63c09f0a604997bf47027;
          sha256 = "17fywp57dpwqzvlfzfacfi19bcn3gayihpz7pc15lclvj34lw4m9";
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
    "symfony/polyfill-php72" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php72-f048e612a3905f34931127360bdd2def19a5e582";
        src = fetchurl {
          url = https://api.github.com/repos/symfony/polyfill-php72/zipball/f048e612a3905f34931127360bdd2def19a5e582;
          sha256 = "1lkjxh17nfaglh7v2m3zw2fy6b2w8nmxr7jb1gqqpvg74yqqz83f";
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
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "monolog-monolog";
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {
    homepage = http://github.com/Seldaek/monolog;
    license = "MIT";
  };
}