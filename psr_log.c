
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

/* {{{ Psr\Log\InvalidArgumentException */

PHPAPI zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;

static zend_always_inline void php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\InvalidArgumentException", NULL);
    PsrLogInvalidArgumentException_ce_ptr = REGISTER_PSR_CLASS_EX(&ce, spl_ce_InvalidArgumentException);
}

/* }}} Psr\Log\InvalidArgumentException */
/* {{{ Psr\Log\LogLevel */

PHPAPI zend_class_entry * PsrLogLogLevel_ce_ptr;

static zend_always_inline void php_psr_register_LogLevel(INIT_FUNC_ARGS)
{
    zend_class_entry ce;

    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LogLevel", NULL);
    PsrLogLogLevel_ce_ptr = REGISTER_PSR_CLASS(&ce);

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

PHPAPI zend_class_entry * PsrLogLoggerInterface_ce_ptr;

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

static zend_always_inline void php_psr_register_LoggerInterface(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerInterface", PsrLogLoggerInterface_methods);
    PsrLogLoggerInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Log\LoggerInterface */
/* {{{ Psr\Log\LoggerAwareInterface */

PHPAPI zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;

static zend_function_entry PsrLogLoggerAwareInterface_methods[] = {
    PHP_PSR_ABSTRACT_ME(PsrLogLoggerAwareInterface, setLogger)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerAwareInterface(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerAwareInterface", PsrLogLoggerAwareInterface_methods);
    PsrLogLoggerAwareInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} Psr\Log\LoggerAwareInterface */
/* {{{ Psr\Log\AbstractLogger */

PHPAPI zend_class_entry * PsrLogAbstractLogger_ce_ptr;

static void php_psr_PsrLogAbstractLogger_log(const char * level_str, strsize_t level_len, INTERNAL_FUNCTION_PARAMETERS)
{
    zval * _this_zval;
    zval * message;
    zval * context;
    zval fname = {0};
    zend_class_entry * expected_ce = NULL; // PsrLogAbstractLogger_ce_ptr
#if PHP_MAJOR_VERSION < 7
    zval * fparams[3];
#else
    zval fparams[3];
#endif

#ifndef FAST_ZPP
    if( zend_parse_method_parameters(ZEND_NUM_ARGS() TSRMLS_CC, getThis(), "Oza", 
            &_this_zval, expected_ce, &message, &context) == FAILURE) {
        return;
    }
#else
	_this_zval = getThis();
	ZEND_PARSE_PARAMETERS_START(1, 2)
		Z_PARAM_ZVAL(message)
		Z_PARAM_OPTIONAL
		Z_PARAM_ARRAY(context)
	ZEND_PARSE_PARAMETERS_END();
#endif

#if PHP_MAJOR_VERSION < 7
    // Alloc function name to call
    INIT_ZVAL(fname);
    ZVAL_STRINGL(&fname, "log", sizeof("log")-1, 1);
    
    // Make function params
    ALLOC_INIT_ZVAL(fparams[0]);
    ALLOC_INIT_ZVAL(fparams[1]);
    ALLOC_INIT_ZVAL(fparams[2]);
    ZVAL_STRINGL(fparams[0], level_str, level_len, 1);
    ZVAL_ZVAL(fparams[1], message, 1, 0);
    ZVAL_ZVAL(fparams[2], context, 1, 0);

    call_user_function(&Z_OBJCE_P(_this_zval)->function_table, &_this_zval, &fname, return_value, 3, fparams TSRMLS_CC);

    zval_dtor(fparams[0]);
    zval_dtor(fparams[1]);
    zval_dtor(fparams[2]);
	zval_dtor(&fname);
#else
    // Alloc function name to call
    ZVAL_STRINGL(&fname, "log", sizeof("log")-1);
    
    // Make function params
    ZVAL_STRINGL(&fparams[0], level_str, level_len);
    ZVAL_ZVAL(&fparams[1], message, 0, 0);
    ZVAL_ZVAL(&fparams[2], context, 0, 0);

    call_user_function(&Z_OBJCE_P(_this_zval)->function_table, _this_zval, &fname, return_value, 3, fparams TSRMLS_CC);

    zval_dtor(&fparams[0]);
    zval_dtor(&fname);
#endif
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
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\AbstractLogger", PsrLogAbstractLogger_methods);
    PsrLogAbstractLogger_ce_ptr = REGISTER_PSR_CLASS(&ce);
    zend_class_implements(PsrLogAbstractLogger_ce_ptr TSRMLS_CC, 1, PsrLogLoggerInterface_ce_ptr);
}

/* }}} Psr\Log\AbstractLogger */
/* {{{ Psr\Log\NullLogger */

PHPAPI zend_class_entry * PsrLogNullLogger_ce_ptr;

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
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\NullLogger", PsrLogNullLogger_methods);
    PsrLogNullLogger_ce_ptr = REGISTER_PSR_CLASS_EX(&ce, PsrLogAbstractLogger_ce_ptr);
}

/* }}} Psr\Log\NullLogger */
/* {{{ Psr\Log\LoggerTrait */

#if PHP_API_VERSION >= 20100412

PHPAPI zend_class_entry * PsrLogLoggerTrait_ce_ptr;

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
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerTrait", PsrLogLoggerTrait_methods);
    PsrLogLoggerTrait_ce_ptr = REGISTER_PSR_CLASS(&ce);
    PsrLogLoggerTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
}

#endif

/* }}} Psr\Log\LoggerTrait */
/* {{{ Psr\Log\LoggerAwareTrait */

#if PHP_API_VERSION >= 20100412

PHPAPI zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;

PHP_METHOD(PsrLogLoggerAwareTrait, setLogger)
{
    zval * _this_zval;
    zval * logger;

#ifndef FAST_ZPP
    if( zend_parse_method_parameters(ZEND_NUM_ARGS() TSRMLS_CC, getThis(), "OO", 
            &_this_zval, NULL, &logger, PsrLogLoggerInterface_ce_ptr) == FAILURE) {
        return;
    }
#else
	_this_zval = getThis();
	ZEND_PARSE_PARAMETERS_START(1, 1)
		Z_PARAM_OBJECT_OF_CLASS(logger, PsrLogLoggerInterface_ce_ptr)
	ZEND_PARSE_PARAMETERS_END();
#endif

    zend_update_property(Z_OBJCE_P(_this_zval), _this_zval, "logger", sizeof("logger")-1, logger TSRMLS_CC);
}

static zend_function_entry PsrLogLoggerAwareTrait_methods[] = {
    PHP_ME(PsrLogLoggerAwareTrait, setLogger, arginfo_PsrLogLoggerAwareInterface_setLogger, ZEND_ACC_PUBLIC | PHP_PSR_EXTRA_TRAIT_FLAGS)
    PHP_FE_END
};

static zend_always_inline void php_psr_register_LoggerAwareTrait(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerAwareTrait", PsrLogLoggerAwareTrait_methods);
    //ce.ce_flags |= ZEND_ACC_TRAIT;
    PsrLogLoggerAwareTrait_ce_ptr = REGISTER_PSR_CLASS(&ce);
    PsrLogLoggerAwareTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
    zend_declare_property_null(PsrLogLoggerAwareTrait_ce_ptr, "logger", sizeof("logger")-1, ZEND_ACC_PROTECTED TSRMLS_CC);
}

#endif

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
#if PHP_API_VERSION >= 20100412
    php_psr_register_LoggerTrait(INIT_FUNC_ARGS_PASSTHRU);
    php_psr_register_LoggerAwareTrait(INIT_FUNC_ARGS_PASSTHRU);
#endif

    return SUCCESS;
}
/* }}} */

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: noet sw=4 ts=4
 */

