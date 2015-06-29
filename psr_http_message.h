
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#ifndef PSR_HTTP_MESSAGE_H
#define PSR_HTTP_MESSAGE_H

#include "php.h"
#include "php_psr.h"

extern PHPAPI zend_class_entry * PsrHttpMessageMessageInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageRequestInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageResponseInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageServerRequestInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageStreamInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageUploadedFileInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrHttpMessageUriInterface_ce_ptr;

PHP_MINIT_FUNCTION(psr_http_message);

#endif

