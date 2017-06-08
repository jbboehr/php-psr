--TEST--
Psr\Link\LinkProviderInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Link\LinkProviderInterface;
class MyImpl implements LinkProviderInterface {
    public function getLinks() {}
    public function getLinksByRel($rel) {}
}
$ex = new MyImpl();
var_dump($ex instanceof LinkProviderInterface);
--EXPECT--
bool(true)
