<?php

use Psr\Http\Message\ServerRequestInterface;

class SampleServerRequest extends SampleRequest implements ServerRequestInterface
{
    public function getServerParams()
    {
        var_dump(__METHOD__);
    }

    public function getCookieParams()
    {
        var_dump(__METHOD__);
    }

    public function withCookieParams(array $cookies)
    {
        var_dump(__METHOD__, $cookies);
    }

    public function getQueryParams()
    {
        var_dump(__METHOD__);
    }

    public function withQueryParams(array $query)
    {
        var_dump(__METHOD__, $query);
    }

    public function getUploadedFiles()
    {
        var_dump(__METHOD__);
    }

    public function withUploadedFiles(array $uploadedFiles)
    {
        var_dump(__METHOD__, $uploadedFiles);
    }

    public function getParsedBody()
    {
        var_dump(__METHOD__);
    }

    public function withParsedBody($data)
    {
        var_dump(__METHOD__, $data);
    }

    public function getAttributes()
    {
        var_dump(__METHOD__);
    }

    public function getAttribute($name, $default = null)
    {
        var_dump(__METHOD__, $name, $default);
    }

    public function withAttribute($name, $value)
    {
        var_dump(__METHOD__, $name, $value);
    }

    public function withoutAttribute($name)
    {
        var_dump(__METHOD__, $name);
    }
}

