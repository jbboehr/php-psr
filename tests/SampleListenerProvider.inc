<?php

use Psr\EventDispatcher\ListenerProviderInterface;

class SampleListenerProvider implements ListenerProviderInterface
{
    public function getListenersForEvent(object $event): iterable
    {
        var_dump(__METHOD__, is_object($event));

        return new ArrayIterator([]);
    }
}
