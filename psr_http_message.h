
#ifndef PSR_HTTP_MESSAGE_H
#define PSR_HTTP_MESSAGE_H

#include "php.h"

extern PHPAPI zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_http_message);

#endif /* PSR_HTTP_MESSAGE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

