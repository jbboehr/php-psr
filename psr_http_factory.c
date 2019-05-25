
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_psr.h"
#include "psr_http_factory.h"

/* {{{ Psr\Http\Message\RequestFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageRequestFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageRequestFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestFactoryInterface, createRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageRequestFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\RequestFactoryInterface", PsrHttpMessageRequestFactoryInterface_methods);
    PsrHttpMessageRequestFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Message\RequestFactoryInterface */
/* {{{ Psr\Http\Message\ResponseFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageResponseFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageResponseFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageResponseFactoryInterface, createResponse)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageResponseFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\ResponseFactoryInterface", PsrHttpMessageResponseFactoryInterface_methods);
    PsrHttpMessageResponseFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Message\ResponseFactoryInterface */
/* {{{ Psr\Http\Message\ServerRequestFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageServerRequestFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestFactoryInterface, createServerRequest)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageServerRequestFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\ServerRequestFactoryInterface", PsrHttpMessageServerRequestFactoryInterface_methods);
    PsrHttpMessageServerRequestFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Message\ServerRequestFactoryInterface */
/* {{{ Psr\Http\Message\StreamFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageStreamFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageStreamFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamFactoryInterface, createStream)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamFactoryInterface, createStreamFromFile)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamFactoryInterface, createStreamFromResource)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageStreamFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\StreamFactoryInterface", PsrHttpMessageStreamFactoryInterface_methods);
    PsrHttpMessageStreamFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Message\StreamFactoryInterface */
/* {{{ Psr\Http\Message\UploadedFileFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUploadedFileFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileFactoryInterface, createUploadedFile)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageUploadedFileFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\UploadedFileFactoryInterface", PsrHttpMessageUploadedFileFactoryInterface_methods);
    PsrHttpMessageUploadedFileFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} Psr\Http\Message\UploadedFileFactoryInterface */
/* {{{ Psr\Http\Message\UriFactoryInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUriFactoryInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUriFactoryInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriFactoryInterface, createUri)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrHttpMessageUriFactoryInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\UriFactoryInterface", PsrHttpMessageUriFactoryInterface_methods);
    PsrHttpMessageUriFactoryInterface_ce_ptr = zend_register_internal_interface(&ce);
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
