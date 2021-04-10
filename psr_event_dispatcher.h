
#ifndef PSR_EVENT_DISPATCHER_H
#define PSR_EVENT_DISPATCHER_H

#include "php.h"
#include "php_psr.h"

#define PHP_PSR_EVENT_DISPATCHER_VERSION "1.0.0"

extern PHP_PSR_API zend_class_entry * PsrEventDispatcherEventDispatcherInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrEventDispatcherListenerProviderInterface_ce_ptr;
extern PHP_PSR_API zend_class_entry * PsrEventDispatcherStoppableEventInterface_ce_ptr;

extern PHP_MINIT_FUNCTION(psr_event_dispatcher);

PHP_PSR_BEGIN_ARG_INFO(PsrEventDispatcherEventDispatcherInterface, dispatch, 1)
    ZEND_ARG_TYPE_INFO(0, event, IS_OBJECT, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrEventDispatcherListenerProviderInterface, getListenersForEvent, 1, IS_ITERABLE, 0)
    ZEND_ARG_TYPE_INFO(0, event, IS_OBJECT, 0)
PHP_PSR_END_ARG_INFO()

PHP_PSR_BEGIN_ARG_WITH_RETURN_TYPE_INFO(PsrEventDispatcherStoppableEventInterface, isPropagationStopped, 0, _IS_BOOL, 0)
PHP_PSR_END_ARG_INFO()

#endif /* PSR_EVENT_DISPATCHER_H */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
