--TEST--
Psr\Link\EvolvableLinkProviderInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
use Psr\Link\LinkProviderInterface;
use Psr\Link\EvolvableLinkProviderInterface;
class MyImpl implements EvolvableLinkProviderInterface {
    public function getLinks(): iterable {
        return [];
    }
    public function getLinksByRel(string $rel): iterable {
        return [];
    }
    public function withLink(LinkInterface $link): static {
        return $this;
    }
    public function withoutLink(LinkInterface $link): static {
        return $this;
    }
}
$ex = new MyImpl();
var_dump($ex instanceof LinkProviderInterface);
var_dump($ex instanceof EvolvableLinkProviderInterface);
--EXPECT--
bool(true)
bool(true)
