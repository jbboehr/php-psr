
#ifndef PSR_CACHE_H
#define PSR_CACHE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_CACHE_VERSION "3.0.0"
#define PHP_PSR_CACHE_VERSION_ID 30000

extern PHP_PSR_API zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrCacheCacheException_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_cache);

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, getKey, 0, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, get, 0, IS_MIXED, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, isHit, 0, _IS_BOOL, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, set, 1, IS_STATIC, 0)
    ZEND_ARG_TYPE_INFO(0, value, IS_MIXED, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, expiresAt, 1, IS_STATIC, 0)
    ZEND_ARG_OBJ_TYPE_MASK(0, expiration, DateTimeInterface, MAY_BE_NULL, NULL)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemInterface, expiresAfter, 1, IS_STATIC, 0)
    ZEND_ARG_OBJ_TYPE_MASK(0, time, DateInterval, MAY_BE_LONG|MAY_BE_NULL, NULL)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_OBJ_INFO(PsrCacheCacheItemPoolInterface, getItem, 1, Psr\\Cache\\CacheItemInterface, 0)
    ZEND_ARG_TYPE_INFO(0, key, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, getItems, 0, IS_ITERABLE, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, hasItem, 1, _IS_BOOL, 0)
    ZEND_ARG_TYPE_INFO(0, key, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, clear, 0, _IS_BOOL, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, deleteItem, 1, _IS_BOOL, 0)
    ZEND_ARG_TYPE_INFO(0, key, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, deleteItems, 1, _IS_BOOL, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, save, 1, _IS_BOOL, 0)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, saveDeferred, 1, _IS_BOOL, 0)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrCacheCacheItemPoolInterface, commit, 0, _IS_BOOL, 0)
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
