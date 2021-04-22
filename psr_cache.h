
#ifndef PSR_CACHE_H
#define PSR_CACHE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_CACHE_VERSION "1.0.0"
#define PHP_PSR_CACHE_VERSION_ID 10000

extern PHP_PSR_API zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheCacheException_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_cache);

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, getKey, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, get, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, isHit, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, set, 1)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, expiresAt, 1)
    ZEND_ARG_INFO(0, expiration)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemInterface, expiresAfter, 1)
    ZEND_ARG_INFO(0, time)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, getItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, getItems, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, hasItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, clear, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, deleteItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, deleteItems, 1)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, save, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, saveDeferred, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Cache, CacheItemPoolInterface, commit, 0)
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
