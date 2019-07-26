<?php

use Psr\EventDispatcher\StoppableEventInterface;

class SampleStoppableEvent implements StoppableEventInterface
{
    public function isPropagationStopped(): bool
    {
        var_dump(__METHOD__);

        return true;
    }
}
