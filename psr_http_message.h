
#ifndef PSR_HTTP_MESSAGE_H
#define PSR_HTTP_MESSAGE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_MESSAGE_VERSION "1.0.0"

extern PHP_PSR_API zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_message);

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

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageMessageInterface, withBody, 1)
    ZEND_ARG_OBJ_INFO(0, body, Psr\\Http\\Message\\StreamInterface, 0)
PHP_PSR_END_ARG_INFO()

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

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, getStatusCode, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, withStatus, 1)
    ZEND_ARG_INFO(0, code)
    ZEND_ARG_INFO(0, reasonPhrase)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageResponseInterface, getReasonPhrase, 0)
PHP_PSR_END_ARG_INFO()

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

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withHost, 1)
    ZEND_ARG_INFO(0, host)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withPort, 1)
    ZEND_ARG_INFO(0, port)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withPath, 1)
    ZEND_ARG_INFO(0, path)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withQuery, 1)
    ZEND_ARG_INFO(0, query)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, withFragment, 1)
    ZEND_ARG_INFO(0, fragment)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrHttpMessageUriInterface, __toString, 0)
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
