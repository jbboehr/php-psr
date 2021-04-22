
#ifndef PSR_CONTAINER_H
#define PSR_CONTAINER_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_CONTAINER_VERSION "1.1.1"
#define PHP_PSR_CONTAINER_VERSION_ID 10101

extern PHP_PSR_API zend_class_entry * PsrContainerContainerExceptionInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrContainerContainerInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrContainerNotFoundExceptionInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_container);

PHP_PSR_BEGIN_ARG_INFO(Container, ContainerInterface, get, 1)
    ZEND_ARG_TYPE_INFO(0, id, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Container, ContainerInterface, has, 1)
    ZEND_ARG_TYPE_INFO(0, id, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_CONTAINER_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
