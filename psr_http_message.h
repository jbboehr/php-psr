
#ifndef PSR_HTTP_MESSAGE_H
#define PSR_HTTP_MESSAGE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_MESSAGE_VERSION "1.0.0"
#define PHP_PSR_HTTP_MESSAGE_VERSION_ID 10000

extern PHP_PSR_API zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_message);

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, getProtocolVersion, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, withProtocolVersion, 1)
    ZEND_ARG_INFO(0, version)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, getHeaders, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, hasHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, getHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, getHeaderLine, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, withHeader, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, withAddedHeader, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, withoutHeader, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, getBody, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, MessageInterface, withBody, 1)
    ZEND_ARG_OBJ_INFO(0, body, Psr\\Http\\Message\\StreamInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, getRequestTarget, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, withRequestTarget, 1)
    ZEND_ARG_INFO(0, requestTarget)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, getMethod, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, withMethod, 1)
    ZEND_ARG_INFO(0, method)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, getUri, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, RequestInterface, withUri, 1)
    ZEND_ARG_OBJ_INFO(0, uri, Psr\\Http\\Message\\UriInterface, 0)
    ZEND_ARG_INFO(0, preserveHost)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ResponseInterface, getStatusCode, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ResponseInterface, withStatus, 1)
    ZEND_ARG_INFO(0, code)
    ZEND_ARG_INFO(0, reasonPhrase)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ResponseInterface, getReasonPhrase, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getServerParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getCookieParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withCookieParams, 1)
    ZEND_ARG_ARRAY_INFO(0, cookies, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getQueryParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withQueryParams, 1)
    ZEND_ARG_ARRAY_INFO(0, query, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getUploadedFiles, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withUploadedFiles, 1)
    ZEND_ARG_ARRAY_INFO(0, uploadedFiles, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getParsedBody, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withParsedBody, 1)
    ZEND_ARG_INFO(0, parsedBody)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getAttributes, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, getAttribute, 1)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, default)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withAttribute, 2)
    ZEND_ARG_INFO(0, name)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, ServerRequestInterface, withoutAttribute, 1)
    ZEND_ARG_INFO(0, name)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, __toString, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, close, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, detach, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, getSize, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, tell, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, eof, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, isSeekable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, seek, 1)
    ZEND_ARG_INFO(0, offset)
    ZEND_ARG_INFO(0, whence)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, rewind, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, isWritable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, write, 1)
    ZEND_ARG_INFO(0, string)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, isReadable, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, read, 1)
    ZEND_ARG_INFO(0, length)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, getContents, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, StreamInterface, getMetadata, 0)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, getStream, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, moveTo, 1)
    ZEND_ARG_INFO(0, targetPath)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, getSize, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, getError, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, getClientFilename, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UploadedFileInterface, getClientMediaType, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getScheme, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getAuthority, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getUserInfo, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getHost, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getPort, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getPath, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getQuery, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, getFragment, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withScheme, 1)
    ZEND_ARG_INFO(0, scheme)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withUserInfo, 1)
    ZEND_ARG_INFO(0, user)
    ZEND_ARG_INFO(0, password)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withHost, 1)
    ZEND_ARG_INFO(0, host)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withPort, 1)
    ZEND_ARG_INFO(0, port)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withPath, 1)
    ZEND_ARG_INFO(0, path)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withQuery, 1)
    ZEND_ARG_INFO(0, query)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, withFragment, 1)
    ZEND_ARG_INFO(0, fragment)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(HttpMessage, UriInterface, __toString, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_HTTP_MESSAGE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
