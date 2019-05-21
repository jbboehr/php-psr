
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include <Zend/zend_exceptions.h>
#include "php_psr.h"
#include "psr_http_client.h"

#ifdef ZEND_ENGINE_3
/* {{{ Psr\Http\Client\ClientInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientClientInterface_ce_ptr;

static zend_function_entry PsrHttpClientClientInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpClientClientInterface, sendRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpClientClientInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Client\\ClientInterface", PsrHttpClientClientInterface_methods);
    PsrHttpClientClientInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Client\ClientInterface */
/* {{{ Psr\Http\Client\ClientExceptionInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientClientExceptionInterface_ce_ptr;

static zend_always_inline void php_psr_register_PsrHttpClientClientExceptionInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Client\\ClientExceptionInterface", NULL);
    PsrHttpClientClientExceptionInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrHttpClientClientExceptionInterface_ce_ptr, 1, zend_ce_throwable);
}

/* }}} Psr\Http\Client\ClientExceptionInterface */
/* {{{ Psr\Http\Client\NetworkExceptionInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientNetworkExceptionInterface_ce_ptr;

static zend_function_entry PsrHttpClientNetworkExceptionInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpClientNetworkExceptionInterface, getRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpClientNetworkExceptionInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Client\\NetworkExceptionInterface", PsrHttpClientNetworkExceptionInterface_methods);
    PsrHttpClientNetworkExceptionInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrHttpClientNetworkExceptionInterface_ce_ptr, 1, PsrHttpClientClientExceptionInterface_ce_ptr);
}

/* }}} Psr\Http\Client\NetworkExceptionInterface */
/* {{{ Psr\Http\Client\RequestExceptionInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientRequestExceptionInterface_ce_ptr;

static zend_function_entry PsrHttpClientRequestExceptionInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpClientRequestExceptionInterface, getRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpClientRequestExceptionInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Client\\RequestExceptionInterface", PsrHttpClientRequestExceptionInterface_methods);
    PsrHttpClientRequestExceptionInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrHttpClientRequestExceptionInterface_ce_ptr, 1, PsrHttpClientClientExceptionInterface_ce_ptr);
}

/* }}} Psr\Http\Client\RequestExceptionInterface */
#endif

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_http_client)
{
#ifdef ZEND_ENGINE_3
    php_psr_register_PsrHttpClientClientInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientClientExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientNetworkExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientRequestExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
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
