--TEST--
Psr\Link\EvolvableLinkInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
use Psr\Link\EvolvableLinkInterface;
class MyImpl implements EvolvableLinkInterface {
    public function getHref() {}
    public function isTemplated() {}
    public function getRels() {}
    public function getAttributes() {}
    public function withHref($href) {}
    public function withRel($rel) {}
    public function withoutRel($rel) {}
    public function withAttribute($attribute, $value) {}
    public function withoutAttribute($attribute) {}
}
$ex = new MyImpl();
var_dump($ex instanceof LinkInterface);
var_dump($ex instanceof EvolvableLinkInterface);
--EXPECT--
bool(true)
bool(true)
