<?php

use Psr\Http\Message\UploadedFileInterface;

class SampleUploadedFile implements UploadedFileInterface
{
    public function getStream()
    {
        var_dump(__METHOD__);
    }

    public function moveTo($targetPath)
    {
        var_dump(__METHOD__, $targetPath);
    }

    public function getSize()
    {
        var_dump(__METHOD__);
    }

    public function getError()
    {
        var_dump(__METHOD__);
    }

    public function getClientFilename()
    {
        var_dump(__METHOD__);
    }

    public function getClientMediaType()
    {
        var_dump(__METHOD__);
    }
}

