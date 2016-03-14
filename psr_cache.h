
#ifndef PSR_CACHE_H
#define PSR_CACHE_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_CACHE_VERSION "1.0.0"

extern PHPAPI zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheException_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_cache);

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, getKey, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, get, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, isHit, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, set, 1)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, expiresAt, 1)
    ZEND_ARG_INFO(0, expiration)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, expiresAfter, 1)
    ZEND_ARG_INFO(0, time)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, getItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, getItems, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, hasItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, clear, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, deleteItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, deleteItems, 1)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, save, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, saveDeferred, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, commit, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_CACHE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

