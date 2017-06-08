--TEST--
Psr\Link\LinkInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
class MyImpl implements LinkInterface {
    public function getHref() {}
    public function isTemplated() {}
    public function getRels() {}
    public function getAttributes() {}
}
$ex = new MyImpl();
var_dump($ex instanceof LinkInterface);
--EXPECT--
bool(true)
