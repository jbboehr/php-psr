
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"

#include "php_psr.h"
#include "psr_link.h"

/* {{{ EvolvableLinkInterface ----------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkInterface_ce_ptr;

static zend_function_entry PsrLinkEvolvableLinkInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkInterface, withHref)
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkInterface, withRel)
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkInterface, withoutRel)
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkInterface, withAttribute)
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkInterface, withoutAttribute)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkEvolvableLinkInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Link\\EvolvableLinkInterface", PsrLinkEvolvableLinkInterface_methods);
    PsrLinkEvolvableLinkInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrLinkEvolvableLinkInterface_ce_ptr, 1, PsrLinkLinkInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ PsrLinkEvolvableLinkProviderInterface -------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkEvolvableLinkProviderInterface_ce_ptr;

static zend_function_entry PsrLinkEvolvableLinkProviderInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkProviderInterface, withLink)
    PHP_PSR_ABSTRACT_ME(PsrLinkEvolvableLinkProviderInterface, withoutLink)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkEvolvableLinkProviderInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Link\\EvolvableLinkProviderInterface", PsrLinkEvolvableLinkProviderInterface_methods);
    PsrLinkEvolvableLinkProviderInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrLinkEvolvableLinkProviderInterface_ce_ptr, 1, PsrLinkLinkProviderInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ PsrLinkLinkInterface -------------------------------- */

PHP_PSR_API zend_class_entry * PsrLinkLinkInterface_ce_ptr;

static zend_function_entry PsrLinkLinkInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkInterface, getHref)
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkInterface, isTemplated)
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkInterface, getRels)
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkInterface, getAttributes)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkLinkInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Link\\LinkInterface", PsrLinkLinkInterface_methods);
    PsrLinkLinkInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LinkProviderInterface ------------------------------------------------ */

PHP_PSR_API zend_class_entry * PsrLinkLinkProviderInterface_ce_ptr;

static zend_function_entry PsrLinkLinkProviderInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkProviderInterface, getLinks)
    PHP_PSR_ABSTRACT_ME(PsrLinkLinkProviderInterface, getLinksByRel)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrLinkLinkProviderInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Link\\LinkProviderInterface", PsrLinkLinkProviderInterface_methods);
    PsrLinkLinkProviderInterface_ce_ptr = zend_register_internal_interface(&ce);
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
