<?php

class SampleResponse extends SampleMessage
{
    public function getStatusCode()
    {
        var_dump(__METHOD__);
    }

    public function withStatus($code, $reasonPhrase = '')
    {
        var_dump(__METHOD__, $code, $reasonPhrase);
    }

    public function getReasonPhrase()
    {
        var_dump(__METHOD__);
    }

}

