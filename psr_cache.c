
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

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

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_getKey, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_get, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_set, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, value)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_isHit, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_exists, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_expiresAt, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, expiration)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_expiresAfter, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, time)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_getExpiration, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

static zend_function_entry PsrCacheCacheItemInterface_methods[] = {
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, getKey, arginfo_PsrCacheCacheItemInterface_getKey)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, get, arginfo_PsrCacheCacheItemInterface_get)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, set, arginfo_PsrCacheCacheItemInterface_set)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, isHit, arginfo_PsrCacheCacheItemInterface_isHit)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, exists, arginfo_PsrCacheCacheItemInterface_exists)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAt, arginfo_PsrCacheCacheItemInterface_expiresAt)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAfter, arginfo_PsrCacheCacheItemInterface_expiresAfter)
    PHP_ABSTRACT_ME(PsrCacheCacheItemInterface, getExpiration, arginfo_PsrCacheCacheItemInterface_getExpiration)
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

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_getItem, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, key)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_getItems, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_clear, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_deleteItems, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_ARRAY_INFO(0, keys, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_save, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_saveDeferred, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Cache\\CacheItemInterface, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrCacheCacheItemInterface_commit, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 0)
ZEND_END_ARG_INFO()

static zend_function_entry PsrCacheCacheItemPoolInterface_methods[] = {
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItem, arginfo_PsrCacheCacheItemInterface_getItem)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItems, arginfo_PsrCacheCacheItemInterface_getItems)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, clear, arginfo_PsrCacheCacheItemInterface_clear)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, deleteItems, arginfo_PsrCacheCacheItemInterface_deleteItems)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, save, arginfo_PsrCacheCacheItemInterface_save)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, saveDeferred, arginfo_PsrCacheCacheItemInterface_saveDeferred)
    PHP_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, commit, arginfo_PsrCacheCacheItemInterface_commit)
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

PHP_MINIT_FUNCTION(psr_cache)
{
    php_psr_register_CacheItemInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheItemPoolInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheException(INIT_FUNC_ARGS_PASSTHRU);

    return SUCCESS;
}

