<?php

use Psr\Log\LoggerInterface;
use Psr\Log\LoggerAwareInterface;

class SampleLoggerAware implements LoggerAwareInterface {
    private $logger;
    public function setLogger(LoggerInterface $logger) {
        $this->logger = $logger;
        var_dump('got logger');
    }
    public function doSomethingThatLogs() {
        $this->logger->emergency('test log');
    }
}

