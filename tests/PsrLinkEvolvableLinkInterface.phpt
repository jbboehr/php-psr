--TEST--
Psr\Link\EvolvableLinkInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Link\LinkInterface;
use Psr\Link\EvolvableLinkInterface;
class MyImpl implements EvolvableLinkInterface {
    public function getHref(): string {
        return "";
    }

    public function isTemplated(): bool {
        return false;
    }

    public function getRels(): array {
        return [];
    }

    public function getAttributes(): array {
        return [];
    }

    public function withHref(string|\Stringable $href): static {
        return $this;
    }

    public function withRel(string $rel): static {
        return $this;
    }

    public function withoutRel(string $rel): static {
        return $this;
    }

    public function withAttribute(string $attribute, string|\Stringable|int|float|bool|array $value): static {
        return $this;
    }

    public function withoutAttribute(string $attribute): static {
        return $this;
    }
}
$ex = new MyImpl();
var_dump($ex instanceof LinkInterface);
var_dump($ex instanceof EvolvableLinkInterface);
var_dump($ex->withHref("foo") === $ex);
var_dump($ex->withRel("foo") === $ex);
var_dump($ex->withoutRel("foo") === $ex);
--EXPECT--
bool(true)
bool(true)
bool(true)
bool(true)
bool(true)
