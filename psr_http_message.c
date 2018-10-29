
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "ext/spl/spl_exceptions.h"
#include "zend_API.h"
#include "zend_interfaces.h"

#include "php_psr.h"
#include "psr_http_message.h"
#include "php5to7.h"

/* {{{ Psr\Http\Message\MessageInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;

static zend_function_entry PsrHttpMessageMessageInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, getProtocolVersion)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, withProtocolVersion)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, getHeaders)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, hasHeader)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, getHeader)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, getHeaderLine)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, withHeader)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, withAddedHeader)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, withoutHeader)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, getBody)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageMessageInterface, withBody)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageMessageInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\MessageInterface", PsrHttpMessageMessageInterface_methods);
    PsrHttpMessageMessageInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Http\Message\MessageInterface */
/* {{{ Psr\Http\Message\RequestInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;

static zend_function_entry PsrHttpMessageRequestInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, getRequestTarget)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, withRequestTarget)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, getMethod)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, withMethod)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, getUri)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageRequestInterface, withUri)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageRequestInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\RequestInterface", PsrHttpMessageRequestInterface_methods);
    PsrHttpMessageRequestInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
    // @todo make sure this is right
    zend_class_implements(PsrHttpMessageRequestInterface_ce_ptr TSRMLS_CC, 1, PsrHttpMessageMessageInterface_ce_ptr);
}

/* }}} Psr\Http\Message\RequestInterface */
/* {{{ Psr\Http\Message\ResponseInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;

static zend_function_entry PsrHttpMessageResponseInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageResponseInterface, getStatusCode)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageResponseInterface, withStatus)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageResponseInterface, getReasonPhrase)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageResponseInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\ResponseInterface", PsrHttpMessageResponseInterface_methods);
    PsrHttpMessageResponseInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
    zend_class_implements(PsrHttpMessageResponseInterface_ce_ptr TSRMLS_CC, 1, PsrHttpMessageMessageInterface_ce_ptr);
}

/* }}} Psr\Http\Message\ResponseInterface */
/* {{{ Psr\Http\Message\ServerRequestInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;

static zend_function_entry PsrHttpMessageServerRequestInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getServerParams)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getCookieParams)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withCookieParams)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getQueryParams)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withQueryParams)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getUploadedFiles)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withUploadedFiles)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getParsedBody)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withParsedBody)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getAttributes)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, getAttribute)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withAttribute)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageServerRequestInterface, withoutAttribute)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageServerRequestInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\ServerRequestInterface", PsrHttpMessageServerRequestInterface_methods);
    PsrHttpMessageServerRequestInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
    zend_class_implements(PsrHttpMessageServerRequestInterface_ce_ptr TSRMLS_CC, 1, PsrHttpMessageRequestInterface_ce_ptr);
}

/* }}} Psr\Http\Message\ServerRequestInterface */
/* {{{ Psr\Http\Message\StreamInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;

static zend_function_entry PsrHttpMessageStreamInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, __toString)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, close)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, detach)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, getSize)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, tell)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, eof)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, isSeekable)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, seek)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, rewind)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, isWritable)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, write)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, isReadable)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, read)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, getContents)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageStreamInterface, getMetadata)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageStreamInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\StreamInterface", PsrHttpMessageStreamInterface_methods);
    PsrHttpMessageStreamInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Http\Message\StreamInterface */
/* {{{ Psr\Http\Message\UploadedFileInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUploadedFileInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, getStream)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, moveTo)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, getSize)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, getError)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, getClientFilename)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUploadedFileInterface, getClientMediaType)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageUploadedFileInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\UploadedFileInterface", PsrHttpMessageUploadedFileInterface_methods);
    PsrHttpMessageUploadedFileInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Http\Message\UploadedFileInterface */
/* {{{ Psr\Http\Message\UriInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUriInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getScheme)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getAuthority)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getUserInfo)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getHost)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getPort)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getPath)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getQuery)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, getFragment)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withScheme)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withUserInfo)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withHost)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withPort)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withPath)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withQuery)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, withFragment)
    PHP_PSR_ABSTRACT_ME(PsrHttpMessageUriInterface, __toString)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageUriInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Http\\Message\\UriInterface", PsrHttpMessageUriInterface_methods);
    PsrHttpMessageUriInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Http\Message\UriInterface */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_http_message)
{
    php_register_PsrHttpMessageMessageInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageRequestInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageResponseInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageServerRequestInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageStreamInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageUploadedFileInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_register_PsrHttpMessageUriInterface(INIT_FUNC_ARGS_PASSTHRU);
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
