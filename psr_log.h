
#ifndef PSR_LOG_H
#define PSR_LOG_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_LOG_VERSION "1.0.0"

extern PHP_PSR_API zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogLogLevel_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogLoggerInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogAbstractLogger_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogNullLogger_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogLoggerTrait_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_log);

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, emergency, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, alert, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, critical, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, error, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, warning, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, notice, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, info, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, debug, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerInterface, log, 2)
    ZEND_ARG_INFO(0, level)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrLogLoggerAwareInterface, setLogger, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Log\\LoggerInterface, 0)
PHP_PSR_END_ARG_INFO();

#endif /* PSR_LOG_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
