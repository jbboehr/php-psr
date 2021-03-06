
#ifndef PSR_HTTP_FACTORY_H
#define PSR_HTTP_FACTORY_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_FACTORY_VERSION "1.0.0"
#define PHP_PSR_HTTP_FACTORY_VERSION_ID 10000

extern PHP_PSR_API zend_class_entry * PsrHttpMessageRequestFactoryInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageResponseFactoryInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageServerRequestFactoryInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageStreamFactoryInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUploadedFileFactoryInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpMessageUriFactoryInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_factory);

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, RequestFactoryInterface, createRequest, 2, Psr\\Http\\Message\\RequestInterface, 0)
    ZEND_ARG_TYPE_INFO(0, method, IS_STRING, 0)
    ZEND_ARG_INFO(0, uri)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, ResponseFactoryInterface, createResponse, 0, Psr\\Http\\Message\\ResponseInterface, 0)
    ZEND_ARG_TYPE_INFO(0, code, IS_LONG, 0)
    ZEND_ARG_TYPE_INFO(0, reasonPhrase, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, ServerRequestFactoryInterface, createServerRequest, 2, Psr\\Http\\Message\\ServerRequestInterface, 0)
    ZEND_ARG_TYPE_INFO(0, method, IS_STRING, 0)
    ZEND_ARG_INFO(0, uri)
    ZEND_ARG_ARRAY_INFO(0, serverParams, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, StreamFactoryInterface, createStream, 0, Psr\\Http\\Message\\StreamInterface, 0)
    ZEND_ARG_TYPE_INFO(0, content, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, StreamFactoryInterface, createStreamFromFile, 1, Psr\\Http\\Message\\StreamInterface, 0)
    ZEND_ARG_TYPE_INFO(0, filename, IS_STRING, 0)
    ZEND_ARG_TYPE_INFO(0, mode, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, StreamFactoryInterface, createStreamFromResource, 1, Psr\\Http\\Message\\StreamInterface, 0)
    ZEND_ARG_INFO(0, resouce)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, UploadedFileFactoryInterface, createUploadedFile, 1, Psr\\Http\\Message\\UploadedFileInterface, 0)
    ZEND_ARG_OBJ_INFO(0, stream, Psr\\Http\\Message\\StreamInterface, 0)
    ZEND_ARG_TYPE_INFO(0, size, IS_LONG, 1)
    ZEND_ARG_TYPE_INFO(0, error, IS_LONG, 0)
    ZEND_ARG_TYPE_INFO(0, clientFilename, IS_STRING, 1)
    ZEND_ARG_TYPE_INFO(0, clientMediaType, IS_STRING, 1)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpMessage, UriFactoryInterface, createUri, 0, Psr\\Http\\Message\\UriInterface, 0)
    ZEND_ARG_TYPE_INFO(0, uri, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_HTTP_FACTORY_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
