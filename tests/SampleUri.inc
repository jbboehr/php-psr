<?php

use Psr\Http\Message\UriInterface;

class SampleUri implements UriInterface
{
    public function getScheme()
    {
        var_dump(__METHOD__);
    }

    public function getAuthority()
    {
        var_dump(__METHOD__);
    }

    public function getUserInfo()
    {
        var_dump(__METHOD__);
    }

    public function getHost()
    {
        var_dump(__METHOD__);
    }

    public function getPort()
    {
        var_dump(__METHOD__);
    }

    public function getPath()
    {
        var_dump(__METHOD__);
    }

    public function getQuery()
    {
        var_dump(__METHOD__);
    }

    public function getFragment()
    {
        var_dump(__METHOD__);
    }

    public function withScheme($scheme)
    {
        var_dump(__METHOD__, $scheme);
    }

    public function withUserInfo($user, $password = null)
    {
        var_dump(__METHOD__, $user, $password);
    }

    public function withHost($host)
    {
        var_dump(__METHOD__, $host);
    }

    public function withPort($port)
    {
        var_dump(__METHOD__, $port);
    }

    public function withPath($path)
    {
        var_dump(__METHOD__, $path);
    }

    public function withQuery($query)
    {
        var_dump(__METHOD__, $query);
    }

    public function withFragment($fragment)
    {
        var_dump(__METHOD__, $fragment);
    }

    public function __toString()
    {
        var_dump(__METHOD__);
        return '';
    }

}

