
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#ifndef PSR_CACHE_H
#define PSR_CACHE_H

#include "php.h"
#include "php_psr.h"

extern PHPAPI zend_class_entry * PsrCacheCacheItemInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheItemPoolInterface_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheInvalidArgumentException_ce_ptr;
extern PHPAPI zend_class_entry * PsrCacheCacheException_ce_ptr;

PHP_MINIT_FUNCTION(psr_cache);

#endif

