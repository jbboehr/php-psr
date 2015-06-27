<?php

use Psr\Http\Message\StreamInterface;

class SampleStream implements StreamInterface
{
    public function __toString()
    {
        var_dump(__METHOD__);
    }

    public function close()
    {
        var_dump(__METHOD__);
    }

    public function detach()
    {
        var_dump(__METHOD__);
    }

    public function getSize()
    {
        var_dump(__METHOD__);
    }

    public function tell()
    {
        var_dump(__METHOD__);
    }

    public function eof()
    {
        var_dump(__METHOD__);
    }

    public function isSeekable()
    {
        var_dump(__METHOD__);
    }

    public function seek($offset, $whence = SEEK_SET)
    {
        var_dump(__METHOD__, $offset, $whence);
    }

    public function rewind()
    {
        var_dump(__METHOD__);
    }

    public function isWritable()
    {
        var_dump(__METHOD__);
    }

    public function write($string)
    {
        var_dump(__METHOD__, $string);
    }

    public function isReadable()
    {
        var_dump(__METHOD__);
    }

    public function read($length)
    {
        var_dump(__METHOD__, $length);
    }

    public function getContents()
    {
        var_dump(__METHOD__);
    }

    public function getMetadata($key = null)
    {
        var_dump(__METHOD__, $key);
    }
}

