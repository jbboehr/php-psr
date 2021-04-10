--TEST--
Psr\Link\LinkProviderInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Link\LinkProviderInterface;
class MyImpl implements LinkProviderInterface {
    public function getLinks(): array {
        return [];
    }
    public function getLinksByRel(string $rel): array {
        return [];
    }
}
$ex = new MyImpl();
var_dump($ex instanceof LinkProviderInterface);
--EXPECT--
bool(true)
