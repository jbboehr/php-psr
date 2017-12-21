
#ifndef PHP_PSR_H
#define PHP_PSR_H

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"

#ifdef ZTS
#include "TSRM.h"
#endif

#if defined(PHP_WIN32) && defined(PSR_EXPORTS)
#define PHP_PSR_API __declspec(dllexport)
#else
#define PHP_PSR_API PHPAPI
#endif

#define PHP_PSR_NAME "psr"
#define PHP_PSR_VERSION "0.3.0RC4"
#define PHP_PSR_RELEASE "2017-08-11"
#define PHP_PSR_AUTHORS "John Boehr <jbboehr@gmail.com> (lead)"

#define PHP_PSR_ABSTRACT_ME(c, f) PHP_ABSTRACT_ME(c, f, arginfo_ ## c ## _ ## f)
#define PHP_PSR_BEGIN_ARG_INFO(c, f, n) ZEND_BEGIN_ARG_INFO_EX(arginfo_ ## c ## _ ## f, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, n)
#define PHP_PSR_END_ARG_INFO ZEND_END_ARG_INFO
#define REGISTER_PSR_CLASS_CONST_STRING(ce, const_name, value) \
        zend_declare_class_constant_stringl(ce, const_name, sizeof(const_name)-1, value, sizeof(value)-1 TSRMLS_CC);

extern zend_module_entry psr_module_entry;
#define phpext_psr_ptr &psr_module_entry

#endif /* PHP_PSR_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
