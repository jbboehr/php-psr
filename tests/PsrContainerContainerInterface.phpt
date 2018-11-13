--TEST--
Psr\Container\ContainerInterface
--SKIPIF--
<?php include('skip.inc'); ?>
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
