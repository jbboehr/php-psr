
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
#include "psr_private.h"

/* {{{ Psr\Http\Message\MessageInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;

static zend_function_entry PsrHttpMessageMessageInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, getProtocolVersion)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, withProtocolVersion)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, getHeaders)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, hasHeader)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, getHeader)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, getHeaderLine)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, withHeader)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, withAddedHeader)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, withoutHeader)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, getBody)
    PHP_PSR_ABSTRACT_ME(HttpMessage, MessageInterface, withBody)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageMessageInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, MessageInterface);
}

/* }}} Psr\Http\Message\MessageInterface */
/* {{{ Psr\Http\Message\RequestInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;

static zend_function_entry PsrHttpMessageRequestInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, getRequestTarget)
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, withRequestTarget)
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, getMethod)
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, withMethod)
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, getUri)
    PHP_PSR_ABSTRACT_ME(HttpMessage, RequestInterface, withUri)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageRequestInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, RequestInterface);
    // @todo make sure this is right
    zend_class_implements(PsrHttpMessageRequestInterface_ce_ptr, 1, PsrHttpMessageMessageInterface_ce_ptr);
}

/* }}} Psr\Http\Message\RequestInterface */
/* {{{ Psr\Http\Message\ResponseInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;

static zend_function_entry PsrHttpMessageResponseInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, ResponseInterface, getStatusCode)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ResponseInterface, withStatus)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ResponseInterface, getReasonPhrase)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageResponseInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, ResponseInterface);
    zend_class_implements(PsrHttpMessageResponseInterface_ce_ptr, 1, PsrHttpMessageMessageInterface_ce_ptr);
}

/* }}} Psr\Http\Message\ResponseInterface */
/* {{{ Psr\Http\Message\ServerRequestInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;

static zend_function_entry PsrHttpMessageServerRequestInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getServerParams)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getCookieParams)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withCookieParams)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getQueryParams)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withQueryParams)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getUploadedFiles)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withUploadedFiles)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getParsedBody)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withParsedBody)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getAttributes)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, getAttribute)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withAttribute)
    PHP_PSR_ABSTRACT_ME(HttpMessage, ServerRequestInterface, withoutAttribute)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageServerRequestInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, ServerRequestInterface);
    zend_class_implements(PsrHttpMessageServerRequestInterface_ce_ptr, 1, PsrHttpMessageRequestInterface_ce_ptr);
}

/* }}} Psr\Http\Message\ServerRequestInterface */
/* {{{ Psr\Http\Message\StreamInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;

static zend_function_entry PsrHttpMessageStreamInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, __toString)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, close)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, detach)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, getSize)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, tell)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, eof)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, isSeekable)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, seek)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, rewind)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, isWritable)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, write)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, isReadable)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, read)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, getContents)
    PHP_PSR_ABSTRACT_ME(HttpMessage, StreamInterface, getMetadata)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageStreamInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, StreamInterface);
}

/* }}} Psr\Http\Message\StreamInterface */
/* {{{ Psr\Http\Message\UploadedFileInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUploadedFileInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, getStream)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, moveTo)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, getSize)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, getError)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, getClientFilename)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UploadedFileInterface, getClientMediaType)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageUploadedFileInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, UploadedFileInterface);
}

/* }}} Psr\Http\Message\UploadedFileInterface */
/* {{{ Psr\Http\Message\UriInterface */

PHP_PSR_API zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

static zend_function_entry PsrHttpMessageUriInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getScheme)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getAuthority)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getUserInfo)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getHost)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getPort)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getPath)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getQuery)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, getFragment)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withScheme)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withUserInfo)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withHost)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withPort)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withPath)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withQuery)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, withFragment)
    PHP_PSR_ABSTRACT_ME(HttpMessage, UriInterface, __toString)
    PHP_FE_END
};

static zend_always_inline void php_register_PsrHttpMessageUriInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE2(Http, Message, UriInterface);
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
