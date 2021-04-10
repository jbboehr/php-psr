--TEST--
Psr\Link\LinkInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
class MyImpl implements LinkInterface {
    public function getHref(): string {}
    public function isTemplated(): bool {}
    public function getRels(): array {}
    public function getAttributes(): array {}
}
$ex = new MyImpl();
var_dump($ex instanceof LinkInterface);
--EXPECT--
bool(true)
