--TEST--
psr phpinfo
--SKIPIF--
<?php if( !extension_loaded('psr') || PHP_MAJOR_VERSION < 7 ) die('skip '); ?>
--FILE--
<?php
phpinfo(INFO_MODULES);
--EXPECTF--
%A
psr
%A
Version => %s
Released => %s
Authors => %s
PSR-3 Log Version => %d.%d.%d
PSR-6 Cache Version => %d.%d.%d
PSR-7 Http Message Version => %d.%d.%d
PSR-11 Container Version => %d.%d.%d
PSR-13 Link Version => %d.%d.%d
PSR-15 HTTP Handlers (Server Handler) => %d.%d.%d
PSR-15 HTTP Handlers (Middleware) => %d.%d.%d
PSR-16 Simple Cache Version => %d.%d.%d
PSR-17 HTTP Factories => %d.%d.%d
%A
