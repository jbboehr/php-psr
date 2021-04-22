
#ifndef PSR_HTTP_CLIENT_H
#define PSR_HTTP_CLIENT_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_HTTP_CLIENT_VERSION "1.0.0"
#define PHP_PSR_HTTP_CLIENT_VERSION_ID 10000

extern PHP_PSR_API zend_class_entry * PsrHttpClientClientInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpClientClientExceptionInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpClientNetworkExceptionInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrHttpClientRequestExceptionInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_client);

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpClient, ClientInterface, sendRequest, 1, Psr\\Http\\Message\\ResponseInterface, 0)
    ZEND_ARG_OBJ_INFO(0, request, Psr\\Http\\Message\\RequestInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpClient, NetworkExceptionInterface, getRequest, 0, Psr\\Http\\Message\\RequestInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(HttpClient, RequestExceptionInterface, getRequest, 0, Psr\\Http\\Message\\RequestInterface, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_HTTP_CLIENT_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
