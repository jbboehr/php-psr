--TEST--
Psr\Link\EvolvableLinkProviderInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
use Psr\Link\LinkProviderInterface;
use Psr\Link\EvolvableLinkProviderInterface;
class MyImpl implements EvolvableLinkProviderInterface {
    public function getLinks() {}
    public function getLinksByRel($rel) {}
    public function withLink(LinkInterface $link) {}
    public function withoutLink(LinkInterface $link) {}
}
$ex = new MyImpl();
var_dump($ex instanceof LinkProviderInterface);
var_dump($ex instanceof EvolvableLinkProviderInterface);
--EXPECT--
bool(true)
bool(true)
