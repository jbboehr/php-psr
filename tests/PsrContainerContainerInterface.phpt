--TEST--
Psr\Container\ContainerInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Container\ContainerInterface;
class MyImpl implements ContainerInterface {
    public function get($id) {}
    public function has($id) {}
}
$ex = new MyImpl();
var_dump($ex instanceof ContainerInterface);
--EXPECT--
bool(true)
