
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_psr.h"
#include "psr_http_server_middleware.h"

/* {{{ MiddlewareInterface --------------------------------------------------- */

#ifdef ZEND_ENGINE_3

PHP_PSR_API zend_class_entry * PsrHttpServerMiddlewareInterface_ce_ptr;

static zend_function_entry PsrHttpServerMiddlewareInterface_methods[] = {
        PHP_PSR_ABSTRACT_ME(PsrHttpServerMiddlewareInterface, process)
        PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpServerMiddlewareInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Server\\MiddlewareInterface", PsrHttpServerMiddlewareInterface_methods);
    PsrHttpServerMiddlewareInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

#endif

/* }}} ---------------------------------------------------------------------- */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_http_server_middleware)
{
#ifdef ZEND_ENGINE_3
    php_psr_register_PsrHttpServerMiddlewareInterface(INIT_FUNC_ARGS_PASSTHRU);
#endif

    return SUCCESS;
}
/* }}} */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
