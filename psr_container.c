
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include <Zend/zend_exceptions.h>
#include "php_psr.h"
#include "psr_container.h"

/* {{{ ContainerExceptionInterface ------------------------------------------ */

PHP_PSR_API zend_class_entry * PsrContainerContainerExceptionInterface_ce_ptr;

static zend_always_inline void php_psr_register_PsrContainerContainerExceptionInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Container\\ContainerExceptionInterface", NULL);
    PsrContainerContainerExceptionInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ ContainerInterface --------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrContainerContainerInterface_ce_ptr;

static zend_function_entry PsrContainerContainerInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME_STRICT(PsrContainerContainerInterface, get)
    PHP_PSR_ABSTRACT_ME_STRICT(PsrContainerContainerInterface, has)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrContainerContainerInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Container\\ContainerInterface", PsrContainerContainerInterface_methods);
    PsrContainerContainerInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ NotFoundException ---------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrContainerNotFoundExceptionInterface_ce_ptr;

static zend_always_inline void php_psr_register_PsrContainerNotFoundExceptionInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Container\\NotFoundExceptionInterface", NULL);
    PsrContainerNotFoundExceptionInterface_ce_ptr = zend_register_internal_interface(&ce);
    zend_class_implements(PsrContainerNotFoundExceptionInterface_ce_ptr, 1, PsrContainerContainerExceptionInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_container)
{
    php_psr_register_PsrContainerContainerExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrContainerContainerInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_PsrContainerNotFoundExceptionInterface(INIT_FUNC_ARGS_PASSTHRU);

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
