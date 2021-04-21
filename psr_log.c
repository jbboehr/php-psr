
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
#include "psr_log.h"

#define PHP_PSR_LOCAL_PSR_NAME Log
#define PHP_PSR_LOCAL_VERSION_NAME v1
#include "psr_private.h"

/* Needed to work around https://bugs.php.net/bug.php?id=69579 */
#define PHP_PSR_EXTRA_TRAIT_FLAGS ZEND_ACC_ARENA_ALLOCATED

/* {{{ Psr\Log\InvalidArgumentException */

PHP_PSR_API zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;
#define PsrLogInvalidArgumentException_methods NULL

static zend_always_inline void php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, InvalidArgumentException, spl_ce_InvalidArgumentException);
}

/* }}} Psr\Log\InvalidArgumentException */
/* {{{ Psr\Log\LogLevel */

PHP_PSR_API zend_class_entry * PsrLogLogLevel_ce_ptr;
#define PsrLogLogLevel_methods NULL

static zend_always_inline void php_psr_register_LogLevel(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, LogLevel, NULL);

    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "EMERGENCY", "emergency");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "ALERT", "alert");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "CRITICAL", "critical");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "ERROR", "error");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "WARNING", "warning");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "NOTICE", "notice");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "INFO", "info");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "DEBUG", "debug");

}

/* }}} Psr\Log\LogLevel */
/* {{{ Psr\Log\LoggerInterface */

PHP_PSR_API zend_class_entry * PsrLogLoggerInterface_ce_ptr;

static zend_function_entry PsrLogLoggerInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, emergency)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, alert)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, critical)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, error)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, warning)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, notice)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, info)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, debug)
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerInterface, log)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Log, LoggerInterface);
}

/* }}} Psr\Log\LoggerInterface */
/* {{{ Psr\Log\LoggerAwareInterface */

PHP_PSR_API zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;

static zend_function_entry PsrLogLoggerAwareInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerAwareInterface, setLogger)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerAwareInterface(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_INTERFACE(Log, LoggerAwareInterface);
}

/* }}} Psr\Log\LoggerAwareInterface */
/* {{{ Psr\Log\AbstractLogger */

PHP_PSR_API zend_class_entry * PsrLogAbstractLogger_ce_ptr;

static void php_psr_PsrLogAbstractLogger_log(const char * level_str, size_t level_len, INTERNAL_FUNCTION_PARAMETERS)
{
    zval * _this_zval = getThis();
    zval * message;
    zval * context = NULL;
    zval fname = {0};
    zval fparams[3];

	ZEND_PARSE_PARAMETERS_START(1, 2)
		Z_PARAM_ZVAL(message)
		Z_PARAM_OPTIONAL
		Z_PARAM_ARRAY(context)
	ZEND_PARSE_PARAMETERS_END();

    // Alloc function name to call
    ZVAL_STRINGL(&fname, "log", sizeof("log")-1);

    // Make function params
    ZVAL_STRINGL(&fparams[0], level_str, level_len);
    ZVAL_ZVAL(&fparams[1], message, 0, 0);
    if( context && Z_TYPE_P(context) == IS_ARRAY ) {
        ZVAL_ZVAL(&fparams[2], context, 1, 0);
    } else {
        array_init(&fparams[2]);
    }

    call_user_function(&Z_OBJCE_P(_this_zval)->function_table, _this_zval, &fname, return_value, 3, fparams);

    zval_ptr_dtor(&fparams[0]);
    zval_ptr_dtor(&fparams[2]);
    zval_ptr_dtor(&fname);
}

PHP_METHOD(PsrLogAbstractLogger, emergency)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("emergency"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, alert)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("alert"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, critical)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("critical"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, error)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("error"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, warning)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("warning"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, notice)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("notice"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, info)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("info"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, debug)
{
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("debug"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

static zend_function_entry PsrLogAbstractLogger_methods[] = {
    PHP_ME(PsrLogAbstractLogger, emergency, arginfo_PsrLogLoggerInterface_emergency, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, alert, arginfo_PsrLogLoggerInterface_alert, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, critical, arginfo_PsrLogLoggerInterface_critical, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, error, arginfo_PsrLogLoggerInterface_error, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, warning, arginfo_PsrLogLoggerInterface_warning, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, notice, arginfo_PsrLogLoggerInterface_notice, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, info, arginfo_PsrLogLoggerInterface_info, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, debug, arginfo_PsrLogLoggerInterface_debug, ZEND_ACC_PUBLIC)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_AbstractLogger(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, AbstractLogger, NULL);
    zend_class_implements(PsrLogAbstractLogger_ce_ptr, 1, PsrLogLoggerInterface_ce_ptr);
}

/* }}} Psr\Log\AbstractLogger */
/* {{{ Psr\Log\NullLogger */

PHP_PSR_API zend_class_entry * PsrLogNullLogger_ce_ptr;

PHP_METHOD(PsrLogNullLogger, log)
{
    // noop
}

static zend_function_entry PsrLogNullLogger_methods[] = {
    PHP_ME(PsrLogNullLogger, log, arginfo_PsrLogLoggerInterface_log, ZEND_ACC_PUBLIC)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_NullLogger(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, NullLogger, PsrLogAbstractLogger_ce_ptr);
}

/* }}} Psr\Log\NullLogger */
/* {{{ Psr\Log\LoggerTrait */

PHP_PSR_API zend_class_entry * PsrLogLoggerTrait_ce_ptr;

static zend_function_entry PsrLogLoggerTrait_methods[] = {
    PHP_ME(PsrLogAbstractLogger, emergency, arginfo_PsrLogLoggerInterface_emergency, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, alert, arginfo_PsrLogLoggerInterface_alert, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, critical, arginfo_PsrLogLoggerInterface_critical, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, error, arginfo_PsrLogLoggerInterface_error, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, warning, arginfo_PsrLogLoggerInterface_warning, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, notice, arginfo_PsrLogLoggerInterface_notice, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, info, arginfo_PsrLogLoggerInterface_info, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ME(PsrLogAbstractLogger, debug, arginfo_PsrLogLoggerInterface_debug, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_ABSTRACT_ME(PsrLogNullLogger, log, arginfo_PsrLogLoggerInterface_log)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerTrait(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, LoggerTrait, NULL);
    PsrLogLoggerTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
}

/* }}} Psr\Log\LoggerTrait */
/* {{{ Psr\Log\LoggerAwareTrait */

PHP_PSR_API zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;

PHP_METHOD(PsrLogLoggerAwareTrait, setLogger)
{
    zval * _this_zval = getThis();
    zval * logger;

	ZEND_PARSE_PARAMETERS_START(1, 1)
		Z_PARAM_OBJECT_OF_CLASS(logger, PsrLogLoggerInterface_ce_ptr)
	ZEND_PARSE_PARAMETERS_END();

#if PHP_VERSION_ID < 80000
    zend_update_property(Z_OBJCE_P(_this_zval), _this_zval, "logger", sizeof("logger")-1, logger);
#else
    zend_update_property(Z_OBJCE_P(_this_zval), Z_OBJ_P(_this_zval), "logger", sizeof("logger")-1, logger);
#endif
}

static zend_function_entry PsrLogLoggerAwareTrait_methods[] = {
    PHP_ME(PsrLogLoggerAwareTrait, setLogger, arginfo_PsrLogLoggerAwareInterface_setLogger, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerAwareTrait(INIT_FUNC_ARGS)
{
    PHP_PSR_REGISTER_CLASS(Log, LoggerAwareTrait, NULL);
    PsrLogLoggerAwareTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
    zend_declare_property_null(PsrLogLoggerAwareTrait_ce_ptr, "logger", sizeof("logger")-1, ZEND_ACC_PROTECTED);
}

/* }}} Psr\Log\LoggerAwareTrait */

/* {{{ PHP_MINIT_FUNCTION */
PHP_MINIT_FUNCTION(psr_log)
{
    php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LogLevel(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LoggerInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LoggerAwareInterface(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_AbstractLogger(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_NullLogger(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LoggerTrait(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LoggerAwareTrait(INIT_FUNC_ARGS_PASSTHRU);

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
