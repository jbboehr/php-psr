
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

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




/* {{{ MessageInterface ----------------------------------------------------- */

PHPAPI zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, getProtocolVersion, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withProtocolVersion, 1)
    ZEND_ARG_INFO(0, version)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, getHeaders, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, hasHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, getHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, getHeaderLine, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withHeader, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withAddedHeader, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withoutHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, getBody, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withBody, 0)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Http\\Message\\StreamInterface, 0)
PHP_PSR_END_ARG_INFO()

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

/* }}} ---------------------------------------------------------------------- */
/* {{{ RequestInterface ----------------------------------------------------- */

PHPAPI zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, getRequestTarget, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, withRequestTarget, 1)
    ZEND_ARG_INFO(0, requestTarget)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, getMethod, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, withMethod, 1)
    ZEND_ARG_INFO(0, method)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, getUri, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageRequestInterface, withUri, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Http\\Message\\UriInterface, 0)
    ZEND_ARG_INFO(0, preserveHost)
PHP_PSR_END_ARG_INFO()

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

/* }}} ---------------------------------------------------------------------- */
/* {{{ ResponseInterface ---------------------------------------------------- */

PHPAPI zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, getStatusCode, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, withStatus, 1)
    ZEND_ARG_INFO(0, code)
    ZEND_ARG_INFO(0, reasonPhrase)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, getReasonPhrase, 0)
PHP_PSR_END_ARG_INFO()

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
    // @todo make sure this is right
    zend_class_implements(PsrHttpMessageResponseInterface_ce_ptr TSRMLS_CC, 1, PsrHttpMessageMessageInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ ServerRequestInterface ----------------------------------------------- */

PHPAPI zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getServerParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getCookieParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withCookieParams, 1)
    ZEND_ARG_ARRAY_INFO(0, cookies, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getQueryParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withQueryParams, 1)
    ZEND_ARG_ARRAY_INFO(0, query, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getUploadedFiles, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withUploadedFiles, 1)
    ZEND_ARG_ARRAY_INFO(0, uploadedFiles, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getParsedBody, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withParsedBody, 1)
    ZEND_ARG_INFO(0, parsedBody)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getAttributes, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, getAttribute, 1)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, default)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withAttribute, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageServerRequestInterface, withoutAttribute, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

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
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ StreamInterface ------------------------------------------------ */

PHPAPI zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, __toString, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, close, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, detach, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, getSize, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, tell, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, eof, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, isSeekable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, seek, 1)
    ZEND_ARG_INFO(0, offset)
    ZEND_ARG_INFO(0, whence)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, rewind, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, isWritable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, write, 1)
    ZEND_ARG_INFO(0, string)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, isReadable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, read, 1)
    ZEND_ARG_INFO(0, length)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, getContents, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageStreamInterface, getMetadata, 0)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

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

/* }}} ---------------------------------------------------------------------- */
/* {{{ UploadedFileInterface ------------------------------------------------ */

PHPAPI zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, getStream, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, moveTo, 1)
    ZEND_ARG_INFO(0, targetPath)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, getSize, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, getError, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, getClientFilename, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUploadedFileInterface, getClientMediaType, 0)
PHP_PSR_END_ARG_INFO()

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

/* }}} ---------------------------------------------------------------------- */
/* {{{ UriInterface --------------------------------------------------------- */

PHPAPI zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getScheme, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getAuthority, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getUserInfo, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getHost, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getPort, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getPath, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getQuery, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, getFragment, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withScheme, 1)
    ZEND_ARG_INFO(0, scheme)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withUserInfo, 1)
    ZEND_ARG_INFO(0, user)
    ZEND_ARG_INFO(0, password)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withHost, 0)
    ZEND_ARG_INFO(0, host)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withPort, 0)
    ZEND_ARG_INFO(0, port)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withPath, 0)
    ZEND_ARG_INFO(0, path)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withQuery, 0)
    ZEND_ARG_INFO(0, query)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withFragment, 0)
    ZEND_ARG_INFO(0, fragment)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, __toString, 0)
PHP_PSR_END_ARG_INFO()

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

/* }}} ---------------------------------------------------------------------- */

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

