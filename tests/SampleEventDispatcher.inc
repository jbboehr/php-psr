<?php

use Psr\EventDispatcher\EventDispatcherInterface;

class SampleEventDispatcher implements EventDispatcherInterface
{
    public function dispatch(object $event)
    {
        var_dump(__METHOD__, is_object($event));

        return $event;
    }
}
