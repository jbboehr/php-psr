
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_psr.h"
#include "psr_http_factory.h"
#include "psr_private.h"

/* {{{ Psr\Http\Message\RequestFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageRequestFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageRequestFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestFactoryInterface, createRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageRequestFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, RequestFactoryInterface);
}

/* }}} Psr\Http\Message\RequestFactoryInterface */
/* {{{ Psr\Http\Message\ResponseFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageResponseFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageResponseFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, ResponseFactoryInterface, createResponse)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageResponseFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, ResponseFactoryInterface);
}

/* }}} Psr\Http\Message\ResponseFactoryInterface */
/* {{{ Psr\Http\Message\ServerRequestFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageServerRequestFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestFactoryInterface, createServerRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageServerRequestFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, ServerRequestFactoryInterface);
}

/* }}} Psr\Http\Message\ServerRequestFactoryInterface */
/* {{{ Psr\Http\Message\StreamFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageStreamFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageStreamFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamFactoryInterface, createStream)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamFactoryInterface, createStreamFromFile)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamFactoryInterface, createStreamFromResource)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageStreamFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, StreamFactoryInterface);
}

/* }}} Psr\Http\Message\StreamFactoryInterface */
/* {{{ Psr\Http\Message\UploadedFileFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUploadedFileFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileFactoryInterface, createUploadedFile)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageUploadedFileFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, UploadedFileFactoryInterface);
}

/* }}} Psr\Http\Message\UploadedFileFactoryInterface */
/* {{{ Psr\Http\Message\UriFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUriFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUriFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriFactoryInterface, createUri)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageUriFactoryInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, UriFactoryInterface);
}

/* }}} Psr\Http\Message\UriFactoryInterface */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_http_factory)
{
    php_psr_register_PsrHttpMessageRequestFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpMessageResponseFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpMessageServerRequestFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpMessageStreamFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpMessageUploadedFileFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrHttpMessageUriFactoryInterface(INIT_FUNC_ARGS_PASSTHRU);

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
