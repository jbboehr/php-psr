--TEST--
Psr\Http\Message\UriInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Http\Message\UriInterface;
include __DIR__ . '/SampleUri.inc';
var_dump(interface_exists(UriInterface::class, false));
var_dump(is_subclass_of(SampleUri::class, UriInterface::class));
$uri = new SampleUri();
$uri->getScheme();
$uri->getAuthority();
$uri->getUserInfo();
$uri->getHost();
$uri->getPort();
$uri->getPath();
$uri->getQuery();
$uri->getFragment();
$uri->withScheme('http');
$uri->withUserInfo('foo', 'bar');
$uri->withHost('php.net');
$uri->withPort(8080);
$uri->withPath('/');
$uri->withQuery('');
$uri->withFragment('');
$uri->__toString();
--EXPECT--
bool(true)
bool(true)
string(20) "SampleUri::getScheme"
string(23) "SampleUri::getAuthority"
string(22) "SampleUri::getUserInfo"
string(18) "SampleUri::getHost"
string(18) "SampleUri::getPort"
string(18) "SampleUri::getPath"
string(19) "SampleUri::getQuery"
string(22) "SampleUri::getFragment"
string(21) "SampleUri::withScheme"
string(4) "http"
string(23) "SampleUri::withUserInfo"
string(3) "foo"
string(3) "bar"
string(19) "SampleUri::withHost"
string(7) "php.net"
string(19) "SampleUri::withPort"
int(8080)
string(19) "SampleUri::withPath"
string(1) "/"
string(20) "SampleUri::withQuery"
string(0) ""
string(23) "SampleUri::withFragment"
string(0) ""
string(21) "SampleUri::__toString"
