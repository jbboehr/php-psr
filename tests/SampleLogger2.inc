<?php

use Psr\Log\LogLevel;
use Psr\Log\AbstractLogger;

class SampleLogger2 extends AbstractLogger {
    public function log($level, $message, array $context = array()) {
	var_dump($level, $message, $context);
    }
}

