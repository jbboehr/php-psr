#ifndef PSR_HTTP_SERVER_HANDLER_H
#define PSR_HTTP_SERVER_HANDLER_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_SERVER_HANDLER_VERSION "1.0.0"

extern PHP_PSR_API zend_class_entry * PsrHttpServerReqeustHandlerInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_server_handler);

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(PsrHttpServerReqeustHandlerInterface, handle, 1, Psr\\Http\\Message\\ResponseInterface, 0)
    ZEND_ARG_OBJ_INFO(0, request, Psr\\Http\\Message\\ServerRequestInterface, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_HTTP_SERVER_HANDLER_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
