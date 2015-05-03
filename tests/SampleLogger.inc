<?php

use Psr\Log\LogLevel;
use Psr\Log\LoggerInterface;

class SampleLogger implements LoggerInterface {
    public function emergency($message, array $context = array()) {
        return $this->log(LogLevel::EMERGENCY, $message, $context);
    }
    public function alert($message, array $context = array()) {
        return $this->log(LogLevel::ALERT, $message, $context);
    }
    public function critical($message, array $context = array()) {
        return $this->log(LogLevel::CRITICAL, $message, $context);
    }
    public function error($message, array $context = array()) {
        return $this->log(LogLevel::ERROR, $message, $context);
    }
    public function warning($message, array $context = array()) {
        return $this->log(LogLevel::WARNING, $message, $context);
    }
    public function notice($message, array $context = array()) {
        return $this->log(LogLevel::NOTICE, $message, $context);
    }
    public function info($message, array $context = array()) {
        return $this->log(LogLevel::INFO, $message, $context);
    }
    public function debug($message, array $context = array()) {
        return $this->log(LogLevel::DEBUG, $message, $context);
    }
    public function log($level, $message, array $context = array()) {
	var_dump($level, $message, $context);
    }
}

