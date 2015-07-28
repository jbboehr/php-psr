
#ifndef PSR_LOG_H
#define PSR_LOG_H

#include "php.h"

extern PHPAPI zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLogLevel_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLoggerInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogAbstractLogger_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogNullLogger_ce_ptr;

#if PHP_API_VERSION >= 20100412
extern PHPAPI zend_class_entry * PsrLogLoggerTrait_ce_ptr;
extern PHPAPI zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;
#endif

extern PHP_MINIT_FUNCTION(psr_log);

#endif /* PSR_LOG_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

