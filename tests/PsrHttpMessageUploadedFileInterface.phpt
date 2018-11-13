--TEST--
Psr\Http\Message\UploadedFileInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleUploadedFile.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\UploadedFileInterface', false));
var_dump(class_implements('SampleUploadedFile', false));
$uploadedFile = new SampleUploadedFile();
$uploadedFile->getStream();
$uploadedFile->moveTo('/dev/null');
$uploadedFile->getSize();
$uploadedFile->getError();
$uploadedFile->getClientFilename();
$uploadedFile->getClientMediaType();
--EXPECT--
bool(true)
array(1) {
  ["Psr\Http\Message\UploadedFileInterface"]=>
  string(38) "Psr\Http\Message\UploadedFileInterface"
}
string(29) "SampleUploadedFile::getStream"
string(26) "SampleUploadedFile::moveTo"
string(9) "/dev/null"
string(27) "SampleUploadedFile::getSize"
string(28) "SampleUploadedFile::getError"
string(37) "SampleUploadedFile::getClientFilename"
string(38) "SampleUploadedFile::getClientMediaType"

