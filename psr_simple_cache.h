
#ifndef PSR_SIMPLE_CACHE_H
#define PSR_SIMPLE_CACHE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_SIMPLE_CACHE_VERSION "1.0.0"

extern PHP_PSR_API zend_class_entry * PsrSimpleCacheCacheException_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrSimpleCacheCacheInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrSimpleCacheInvalidArgumentException_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_simple_cache);

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, get, 1)
    ZEND_ARG_INFO(0, key)
    ZEND_ARG_INFO(0, default)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, set, 2)
    ZEND_ARG_INFO(0, key)
    ZEND_ARG_INFO(0, value)
    ZEND_ARG_INFO(0, ttl)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, delete, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, clear, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, getMultiple, 1)
    ZEND_ARG_INFO(0, keys)
    ZEND_ARG_INFO(0, default)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, setMultiple, 1)
    ZEND_ARG_INFO(0, values)
    ZEND_ARG_INFO(0, ttl)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, deleteMultiple, 1)
    ZEND_ARG_INFO(0, keys)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrSimpleCacheCacheInterface, has, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_CACHE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
