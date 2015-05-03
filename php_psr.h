
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"

#ifdef ZTS
#include "TSRM.h"
#endif

#ifndef PHP_PSR_H
#define PHP_PSR_H

#define PHP_PSR_NAME "psr"
#define PHP_PSR_VERSION "0.0.1"
#define PHP_PSR_RELEASE "2015-05-02"
#define PHP_PSR_AUTHORS "John Boehr <jbboehr@gmail.com> (lead)"

extern zend_module_entry psr_module_entry;
#define phpext_psr_ptr &psr_module_entry

extern zend_class_entry * PsrLogLogLevel_ce_ptr;
extern zend_class_entry * PsrLogLoggerInterface_ce_ptr;
extern zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;
extern zend_class_entry * PsrLogAbstractLogger_ce_ptr;

#endif	/* PHP_PSR_H */

