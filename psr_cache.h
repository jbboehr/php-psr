
#ifndef PSR_CACHE_H
#define PSR_CACHE_H

#include "php.h"

extern PHPAPI zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheException_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_cache);

#endif /* PSR_CACHE_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

