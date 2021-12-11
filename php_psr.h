
#ifndef PHP_PSR_H
#define PHP_PSR_H

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"

#ifdef ZTS
#include "TSRM.h"
#endif

#ifdef PHP_WIN32
# ifdef PHP_PSR_EXPORTS
#  define PHP_PSR_API __declspec(dllexport)
# else
#  define PHP_PSR_API __declspec(dllimport)
# endif
#elif defined(__GNUC__) && __GNUC__ >= 4
# define PHP_PSR_API __attribute__ ((visibility("default")))
#else
# define PHP_PSR_API
#endif

#define PHP_PSR_NAME "psr"
#define PHP_PSR_VERSION "1.2.0"
#define PHP_PSR_VERSION_ID 10200
#define PHP_PSR_RELEASE "2021-12-11"
#define PHP_PSR_AUTHORS "John Boehr <jbboehr@gmail.com> (lead)"

#define PHP_PSR_ARGINFO(p, c, f) (arginfo_Psr ## p ## c ## _ ## f)
#define PHP_PSR_BEGIN_ARG_INFO(p, c, f, n) ZEND_BEGIN_ARG_INFO_EX(PHP_PSR_ARGINFO(p, c, f), ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, n)
#define PHP_PSR_END_ARG_INFO ZEND_END_ARG_INFO
#define REGISTER_PSR_CLASS_CONST_STRING(ce, const_name, value) \
        zend_declare_class_constant_stringl(ce, const_name, sizeof(const_name)-1, value, sizeof(value)-1);

#define PHP_PSR_CLASS_NAMESPACE "PsrExt"
#define PHP_PSR_ALIAS_NAMESPACE "Psr"

#ifdef ZEND_BEGIN_ARG_WITH_RETURN_OBJ_INFO_EX
#define PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(p, c, f, n, cn, an) ZEND_BEGIN_ARG_WITH_RETURN_OBJ_INFO_EX(PHP_PSR_ARGINFO(p, c, f), ZEND_RETURN_VALUE, n, cn, an)
#define PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(p, c, f, n, t, an) ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(PHP_PSR_ARGINFO(p, c, f), ZEND_RETURN_VALUE, n, t, an)
#else
#define PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(p, c, f, n, cn, an) ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(PHP_PSR_ARGINFO(p, c, f), ZEND_RETURN_VALUE, n, IS_OBJECT, #cn, an)
#define PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(p, c, f, n, t, an) ZEND_BEGIN_ARG_WITH_RETURN_TYPE_INFO_EX(PHP_PSR_ARGINFO(p, c, f), ZEND_RETURN_VALUE, n, t, NULL, an)
#endif

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
