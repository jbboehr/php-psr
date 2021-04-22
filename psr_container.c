
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include <Zend/zend_exceptions.h>
#include "php_psr.h"
#include "psr_container.h"
#include "psr_private.h"

/* {{{ ContainerExceptionInterface ------------------------------------------ */

PHP_PSR_API zend_class_entry * PsrContainerContainerExceptionInterface_ce_ptr;
#define PsrContainerContainerExceptionInterface_methods NULL

static zend_always_inline void php_psr_register_PsrContainerContainerExceptionInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Container, ContainerExceptionInterface);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ ContainerInterface --------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrContainerContainerInterface_ce_ptr;

static zend_function_entry PsrContainerContainerInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME_WITH_FLAGS(Container, ContainerInterface, get, ZEND_ACC_PUBLIC | ZEND_ACC_ABSTRACT | ZEND_ACC_STRICT_TYPES)
    PHP_PSR_ABSTRACT_ME_WITH_FLAGS(Container, ContainerInterface, has, ZEND_ACC_PUBLIC | ZEND_ACC_ABSTRACT | ZEND_ACC_STRICT_TYPES)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_PsrContainerContainerInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Container, ContainerInterface);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ NotFoundException ---------------------------------------------------- */

PHP_PSR_API zend_class_entry * PsrContainerNotFoundExceptionInterface_ce_ptr;
#define PsrContainerNotFoundExceptionInterface_methods NULL

static zend_always_inline void php_psr_register_PsrContainerNotFoundExceptionInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Container, NotFoundExceptionInterface);
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
