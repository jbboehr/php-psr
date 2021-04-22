#ifndef PSR_HTTP_SERVER_MIDDLEWARE_H
#define PSR_HTTP_SERVER_MIDDLEWARE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_SERVER_MIDDLEWARE_VERSION "1.0.0"
#define PHP_PSR_HTTP_SERVER_MIDDLEWARE_VERSION_ID 10000

extern PHP_MINIT_FUNCTION(psr_http_server_middleware);

extern PHP_PSR_API zend_class_entry * PsrHttpServerMiddlewareInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpServer, MiddlewareInterface, process, 2, Psr\\Http\\Message\\ResponseInterface, 0)
    ZEND_ARG_OBJ_INFO(0, request, Psr\\Http\\Message\\ServerRequestInterface, 0)
    ZEND_ARG_OBJ_INFO(0, handler, Psr\\Http\\Server\\RequestHandlerInterface, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_HTTP_SERVER_MIDDLEWARE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
