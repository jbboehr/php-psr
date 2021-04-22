
#ifndef PSR_LINK_H
#define PSR_LINK_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_LINK_VERSION "1.0.0"
#define PHP_PSR_LINK_VERSION_ID 10000

extern PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkProviderInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkLinkInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkLinkProviderInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_link);

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkInterface, withHref, 1)
    ZEND_ARG_INFO(0, href)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkInterface, withRel, 1)
    ZEND_ARG_INFO(0, rel)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkInterface, withoutRel, 1)
    ZEND_ARG_INFO(0, rel)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkInterface, withAttribute, 2)
    ZEND_ARG_INFO(0, attribute)
    ZEND_ARG_INFO(0, value)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkInterface, withoutAttribute, 1)
    ZEND_ARG_INFO(0, attribute)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkProviderInterface, withLink, 1)
    ZEND_ARG_OBJ_INFO(0, link, Psr\\Link\\LinkInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, EvolvableLinkProviderInterface, withoutLink, 1)
    ZEND_ARG_OBJ_INFO(0, link, Psr\\Link\\LinkInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkInterface, getHref, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkInterface, isTemplated, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkInterface, getRels, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkInterface, getAttributes, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkProviderInterface, getLinks, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_INFO(Link, LinkProviderInterface, getLinksByRel, 1)
    ZEND_ARG_INFO(0, rel)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_LINK_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
