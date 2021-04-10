
#ifndef PSR_LINK_H
#define PSR_LINK_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_LINK_VERSION "2.0.1"
#define PHP_PSR_LINK_VERSION_ID 20001

extern PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkProviderInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkLinkInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrLinkLinkProviderInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_link);

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkInterface, withHref, 1, IS_STATIC, 0)
    ZEND_ARG_OBJ_TYPE_MASK(0, href, Stringable, MAY_BE_STRING, NULL)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkInterface, withRel, 1, IS_STATIC, 0)
    ZEND_ARG_TYPE_INFO(0, rel, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkInterface, withoutRel, 1, IS_STATIC, 0)
    ZEND_ARG_TYPE_INFO(0, rel, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkInterface, withAttribute, 2, IS_STATIC, 0)
    ZEND_ARG_TYPE_INFO(0, attribute, IS_STRING, 0)
    ZEND_ARG_OBJ_TYPE_MASK(0, value, Stringable, MAY_BE_STRING|MAY_BE_LONG|MAY_BE_DOUBLE|MAY_BE_ARRAY|MAY_BE_BOOL, NULL)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkInterface, withoutAttribute, 1, IS_STATIC, 0)
    ZEND_ARG_TYPE_INFO(0, attribute, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkProviderInterface, withLink, 1, IS_STATIC, 0)
    ZEND_ARG_OBJ_INFO(0, link, Psr\\Link\\LinkInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkEvolvableLinkProviderInterface, withoutLink, 1, IS_STATIC, 0)
    ZEND_ARG_OBJ_INFO(0, link, Psr\\Link\\LinkInterface, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkInterface, getHref, 0, IS_STRING, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkInterface, isTemplated, 0, _IS_BOOL, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkInterface, getRels, 0, IS_ARRAY, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkInterface, getAttributes, 0, IS_ARRAY, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkProviderInterface, getLinks, 0, IS_ITERABLE, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrLinkLinkProviderInterface, getLinksByRel, 1, IS_ITERABLE, 0)
    ZEND_ARG_TYPE_INFO(0, rel, IS_STRING, 0)
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
