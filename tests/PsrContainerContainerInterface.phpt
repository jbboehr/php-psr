--TEST--
Psr\Container\ContainerInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Container\ContainerInterface;
class MyImpl implements ContainerInterface {
    public function get(string $id) {}
    public function has(string $id): bool {}
}
$ex = new MyImpl();
var_dump($ex instanceof ContainerInterface);
--EXPECT--
bool(true)
