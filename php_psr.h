
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#ifndef PHP_PSR_H
#define PHP_PSR_H

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"

#ifdef ZTS
#include "TSRM.h"
#endif

#define PHP_PSR_NAME "psr"
#define PHP_PSR_VERSION "0.0.1"
#define PHP_PSR_RELEASE "2015-05-02"
#define PHP_PSR_AUTHORS "John Boehr <jbboehr@gmail.com> (lead)"

#define PHP_PSR_ABSTRACT_ME(c, f) PHP_ABSTRACT_ME(c, f, arginfo_ ## c ## _ ## f)
#define PHP_PSR_BEGIN_ARG_INFO(c, f, n) ZEND_BEGIN_ARG_INFO_EX(arginfo_ ## c ## _ ## f, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, n)
#define PHP_PSR_END_ARG_INFO ZEND_END_ARG_INFO
#define REGISTER_PSR_CLASS_CONST_STRING(ce, const_name, value) \
        zend_declare_class_constant_stringl(ce, const_name, sizeof(const_name)-1, value, sizeof(value)-1 TSRMLS_CC);

#if PHP_MAJOR_VERSION < 7
#define REGISTER_PSR_CLASS(class) zend_register_internal_class(class TSRMLS_CC)
#define REGISTER_PSR_CLASS_EX(class, parent) zend_register_internal_class_ex(class, parent, NULL TSRMLS_CC)
#define PHP_PSR_EXTRA_TRAIT_FLAGS 0
#else
#define REGISTER_PSR_CLASS zend_register_internal_class
#define REGISTER_PSR_CLASS_EX zend_register_internal_class_ex
/* Needed to work around https://bugs.php.net/bug.php?id=69579 */
#define PHP_PSR_EXTRA_TRAIT_FLAGS ZEND_ACC_ARENA_ALLOCATED
#endif

extern zend_module_entry psr_module_entry;
#define phpext_psr_ptr &psr_module_entry

PHP_MINIT_FUNCTION(psr);
PHP_MINFO_FUNCTION(psr);

#endif	/* PHP_PSR_H */

