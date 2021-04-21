
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include <Zend/zend_exceptions.h>
#include "php_psr.h"
#include "psr_http_client.h"
#include "psr_private.h"

/* {{{ Psr\Http\Client\ClientInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientClientInterface_ce_ptr;

static zend_function_entry PsrHttpClientClientInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpClientClientInterface, sendRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpClientClientInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Client, ClientInterface);
}

/* }}} Psr\Http\Client\ClientInterface */
/* {{{ Psr\Http\Client\ClientExceptionInterface */

PHP_PSR_API zend_class_entry * PsrHttpClientClientExceptionInterface_ce_ptr;
#define PsrHttpClientClientExceptionInterface_methods NULL

static zend_always_inline void php_psr_register_PsrHttpClientClientExceptionInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Client, ClientExceptionInterface);
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
    PHP_PSR_REGISTER_INTERFACE2(Http, Client, NetworkExceptionInterface);
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
    PHP_PSR_REGISTER_INTERFACE2(Http, Client, RequestExceptionInterface);
    zend_class_implements(PsrHttpClientRequestExceptionInterface_ce_ptr, 1, PsrHttpClientClientExceptionInterface_ce_ptr);
}

/* }}} Psr\Http\Client\RequestExceptionInterface */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_http_client)
{
    php_psr_register_PsrHttpClientClientInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientClientExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientNetworkExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpClientRequestExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);

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
