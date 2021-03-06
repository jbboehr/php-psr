
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"

#include "php_psr.h"
#include "psr_link.h"
#include "psr_private.h"

/* {{{ EvolvableLinkInterface ----------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkInterface_ce_ptr;

static zend_function_entry PsrLinkEvolvableLinkInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkInterface, withHref)
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkInterface, withRel)
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkInterface, withoutRel)
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkInterface, withAttribute)
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkInterface, withoutAttribute)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkEvolvableLinkInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Link, EvolvableLinkInterface);
    zend_class_implements(PsrLinkEvolvableLinkInterface_ce_ptr, 1, PsrLinkLinkInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ PsrLinkEvolvableLinkProviderInterface -------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkProviderInterface_ce_ptr;

static zend_function_entry PsrLinkEvolvableLinkProviderInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkProviderInterface, withLink)
    PHP_PSR_ABSTRACT_ME(Link, EvolvableLinkProviderInterface, withoutLink)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkEvolvableLinkProviderInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Link, EvolvableLinkProviderInterface);
    zend_class_implements(PsrLinkEvolvableLinkProviderInterface_ce_ptr, 1, PsrLinkLinkProviderInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ PsrLinkLinkInterface -------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkLinkInterface_ce_ptr;

static zend_function_entry PsrLinkLinkInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(Link, LinkInterface, getHref)
    PHP_PSR_ABSTRACT_ME(Link, LinkInterface, isTemplated)
    PHP_PSR_ABSTRACT_ME(Link, LinkInterface, getRels)
    PHP_PSR_ABSTRACT_ME(Link, LinkInterface, getAttributes)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkLinkInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Link, LinkInterface);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LinkProviderInterface ------------------------------------------------ */

PHP_PSR_API zend_class_entry * PsrLinkLinkProviderInterface_ce_ptr;

static zend_function_entry PsrLinkLinkProviderInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(Link, LinkProviderInterface, getLinks)
    PHP_PSR_ABSTRACT_ME(Link, LinkProviderInterface, getLinksByRel)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkLinkProviderInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Link, LinkProviderInterface);
}

/* }}} ---------------------------------------------------------------------- */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_link)
{
    php_psr_register_PsrLinkLinkInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrLinkLinkProviderInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrLinkEvolvableLinkInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrLinkEvolvableLinkProviderInterface(INIT_FUNC_ARGS_PASSTHRU);

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
