--TEST--
Psr\Http\Message\UploadedFileFactoryInterface
--SKIPIF--
<?php include('skip_for_php5.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleStream.inc';
include __DIR__ . '/SampleUploadedFile.inc';
include __DIR__ . '/SampleUploadedFileFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\UploadedFileFactoryInterface', false));
var_dump(class_implements('SampleUploadedFileFactory', false));
$stream = new SampleStream();
$factory = new SampleUploadedFileFactory();
$uploadedFile = $factory->createUploadedFile($stream);
var_dump($uploadedFile instanceof \Psr\Http\Message\UploadedFileInterface);
$factory->createUploadedFile($stream, 100, UPLOAD_ERR_NO_FILE, 'image.png', 'image/png');
--EXPECTF--
bool(true)
array(1) {
  ["Psr\Http\Message\UploadedFileFactoryInterface"]=>
  string(45) "Psr\Http\Message\UploadedFileFactoryInterface"
}
string(45) "SampleUploadedFileFactory::createUploadedFile"
object(SampleStream)#%d (0) {
}
NULL
int(0)
NULL
NULL
bool(true)
string(45) "SampleUploadedFileFactory::createUploadedFile"
object(SampleStream)#%d (0) {
}
int(100)
int(4)
string(9) "image.png"
string(9) "image/png"
