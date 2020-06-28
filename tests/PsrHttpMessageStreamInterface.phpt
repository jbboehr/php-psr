--TEST--
Psr\Http\Message\StreamInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Http\Message\StreamInterface;
include __DIR__ . '/SampleStream.inc';
var_dump(interface_exists(StreamInterface::class, false));
var_dump(is_subclass_of(SampleStream::class, StreamInterface::class));
$stream = new SampleStream();
$stream->__toString();
$stream->close();
$stream->detach();
$stream->getSize();
$stream->tell();
$stream->eof();
$stream->isSeekable();
$stream->seek(0);
$stream->rewind();
$stream->isWritable();
$stream->write('foo');
$stream->isReadable();
$stream->read(123);
$stream->getContents();
$stream->getMetadata();
--EXPECTF--
bool(true)
bool(true)
string(24) "SampleStream::__toString"
string(19) "SampleStream::close"
string(20) "SampleStream::detach"
string(21) "SampleStream::getSize"
string(18) "SampleStream::tell"
string(17) "SampleStream::eof"
string(24) "SampleStream::isSeekable"
string(18) "SampleStream::seek"
int(0)
int(0)
string(20) "SampleStream::rewind"
string(24) "SampleStream::isWritable"
string(19) "SampleStream::write"
string(3) "foo"
string(24) "SampleStream::isReadable"
string(18) "SampleStream::read"
int(123)
string(25) "SampleStream::getContents"
string(25) "SampleStream::getMetadata"
NULL
