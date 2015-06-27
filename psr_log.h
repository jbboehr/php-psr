
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#ifndef PSR_LOG_H
#define PSR_LOG_H

#include "php.h"
#include "php_psr.h"

extern PHPAPI zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLogLevel_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLoggerInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogAbstractLogger_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogNullLogger_ce_ptr;

#if PHP_API_VERSION >= 20100412
PHPAPI zend_class_entry * PsrLogLoggerTrait_ce_ptr;
PHPAPI zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;
#endif

PHP_MINIT_FUNCTION(psr_log);

#endif

