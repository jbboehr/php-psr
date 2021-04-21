
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

#define PHP_PSR_LOCAL_PSR_NAME Cache
#define PHP_PSR_LOCAL_VERSION_NAME v1
#include "psr_private.h"

/* {{{ CacheException ------------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrCacheCacheException_ce_ptr;
#define PsrCacheCacheException_methods NULL

static zend_always_inline void php_psr_register_CacheException(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Cache, CacheException);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ CacheItemInterface --------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;

static zend_function_entry PsrCacheCacheItemInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, getKey)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, get)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, isHit)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, set)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAt)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemInterface, expiresAfter)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_CacheItemInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Cache, CacheItemInterface);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ CacheItemPoolInterface ----------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;

static zend_function_entry PsrCacheCacheItemPoolInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItem)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, getItems)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, hasItem)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, clear)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, deleteItem)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, deleteItems)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, save)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, saveDeferred)
    PHP_PSR_ABSTRACT_ME(PsrCacheCacheItemPoolInterface, commit)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_CacheItemPoolInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Cache, CacheItemPoolInterface);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ InvalidArgumentException --------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
#define PsrCacheInvalidArgumentException_methods NULL

static zend_always_inline void php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Cache, InvalidArgumentException);
    zend_class_implements(PsrCacheInvalidArgumentException_ce_ptr, 1, PsrCacheCacheException_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_cache)
{
    php_psr_register_CacheException(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheItemInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_CacheItemPoolInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS_PASSTHRU);

    return SUCCESS;
}
/* }}} */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
