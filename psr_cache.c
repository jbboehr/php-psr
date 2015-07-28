
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "ext/spl/spl_exceptions.h"
#include "zend_API.h"
#include "zend_interfaces.h"

#include "php_psr.h"
#include "psr_cache.h"

/* {{{ CacheItemInterface --------------------------------------------------- */

PHPAPI zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, getKey, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, get, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, set, 1)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, isHit, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, exists, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, expiresAt, 1)
    ZEND_ARG_INFO(0, expiration)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, expiresAfter, 1)
    ZEND_ARG_INFO(0, time)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemInterface, getExpiration, 0)
PHP_PSR_END_ARG_INFO()

static zend_function_entry PsrCacheCacheItemInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, getKey)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, get)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, set)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, isHit)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, exists)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAt)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAfter)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, getExpiration)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_CacheItemInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Cache\\CacheItemInterface", PsrCacheCacheItemInterface_methods);
    PsrCacheCacheItemInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ CacheItemPoolInterface ----------------------------------------------- */

PHPAPI zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, getItem, 1)
    ZEND_ARG_INFO(0, key)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, getItems, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(PsrCacheCacheItemPoolInterface, clear, 0)
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

static zend_function_entry PsrCacheCacheItemPoolInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItem)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItems)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, clear)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, deleteItems)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, save)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, saveDeferred)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, commit)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_CacheItemPoolInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Cache\\CacheItemPoolInterface", PsrCacheCacheItemPoolInterface_methods);
    PsrCacheCacheItemPoolInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ InvalidArgumentException --------------------------------------------- */

PHPAPI zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;

static zend_always_inline void php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Cache\\InvalidArgumentException", NULL);
    PsrCacheInvalidArgumentException_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ CacheException ------------------------------------------------------- */

PHPAPI zend_class_entry * PsrCacheCacheException_ce_ptr;

static zend_always_inline void php_psr_register_CacheException(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Cache\\CacheException", NULL);
    PsrCacheCacheException_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_cache)
{
    php_psr_register_CacheItemInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheItemPoolInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheException(INIT_FUNC_ARGS_PASSTHRU);

    return SUCCESS;
}
/* }}} */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

