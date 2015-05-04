
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

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

#define REGISTER_PSR_CLASS_CONST_STRING(ce, const_name, value) \
        zend_declare_class_constant_stringl(ce, const_name, sizeof(const_name)-1, value, sizeof(value)-1 TSRMLS_CC);

/* {{{ InvalidArgumentException --------------------------------------------- */

zend_class_entry * PsrLogInvalidArgumentException_ce_ptr;

static inline void php_psr_register_InvalidArgumentException(INIT_FUNC_ARGS)
{
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\InvalidArgumentException", NULL);
    PsrLogInvalidArgumentException_ce_ptr = zend_register_internal_class_ex(&ce, spl_ce_InvalidArgumentException, NULL TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LogLevel ------------------------------------------------------------- */

zend_class_entry * PsrLogLogLevel_ce_ptr;

static inline void  php_psr_register_LogLevel(INIT_FUNC_ARGS) {
    zend_class_entry ce;

    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LogLevel", NULL);
    PsrLogLogLevel_ce_ptr = zend_register_internal_class(&ce TSRMLS_CC);

    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "EMERGENCY", "emergency");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "ALERT", "alert");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "CRITICAL", "critical");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "ERROR", "error");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "WARNING", "warning");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "NOTICE", "notice");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "INFO", "info");
    REGISTER_PSR_CLASS_CONST_STRING(PsrLogLogLevel_ce_ptr, "DEBUG", "debug");

}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LoggerInterface ------------------------------------------------------ */

zend_class_entry * PsrLogLoggerInterface_ce_ptr;

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_emergency, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_alert, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_critical, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_error, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_warning, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_notice, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_info, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_debug, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerInterface_log, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 2)
    ZEND_ARG_INFO(0, level)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

static zend_function_entry PsrLogLoggerInterface_methods[] = {
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, emergency, arginfo_PsrLogLoggerInterface_emergency)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, alert, arginfo_PsrLogLoggerInterface_alert)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, critical, arginfo_PsrLogLoggerInterface_critical)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, error, arginfo_PsrLogLoggerInterface_error)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, warning, arginfo_PsrLogLoggerInterface_warning)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, notice, arginfo_PsrLogLoggerInterface_notice)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, info, arginfo_PsrLogLoggerInterface_info)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, debug, arginfo_PsrLogLoggerInterface_debug)
    PHP_ABSTRACT_ME(PsrLogLoggerInterface, log, arginfo_PsrLogLoggerInterface_log)
    PHP_FE_END
};

static inline void php_psr_register_LoggerInterface(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerInterface", PsrLogLoggerInterface_methods);
    PsrLogLoggerInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LoggerAwareInterface ------------------------------------------------- */

zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerAwareInterface_setLogger, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_OBJ_INFO(0, logger, Psr\\Log\\LoggerInterface, 0)
ZEND_END_ARG_INFO();

static zend_function_entry PsrLogLoggerAwareInterface_methods[] = {
    PHP_ABSTRACT_ME(PsrLogLoggerAwareInterface, setLogger, arginfo_PsrLogLoggerAwareInterface_setLogger)
    PHP_FE_END
};

static inline void php_psr_register_LoggerAwareInterface(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerAwareInterface", PsrLogLoggerAwareInterface_methods);
    PsrLogLoggerAwareInterface_ce_ptr = zend_register_internal_interface(&ce TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ AbstractLogger ------------------------------------------------------- */

zend_class_entry * PsrLogAbstractLogger_ce_ptr;

static void php_psr_PsrLogAbstractLogger_log(const char * level, int level_len, INTERNAL_FUNCTION_PARAMETERS) {
    zval * _this_zval;
    zval * message;
    zval * context;
    zval * fname;
    zval * fparams[3];
    zend_class_entry * expected_ce = NULL; // PsrLogAbstractLogger_ce_ptr
    
    if( zend_parse_method_parameters(ZEND_NUM_ARGS() TSRMLS_CC, getThis(), "Oza", 
            &_this_zval, expected_ce, &message, &context) == FAILURE) {
        return;
    }

    // Alloc function name to call
    ALLOC_INIT_ZVAL(fname);
    ZVAL_STRINGL(fname, "log", sizeof("log")-1, 1);
    
    // Make function params
    MAKE_STD_ZVAL(fparams[0]);
    MAKE_STD_ZVAL(fparams[1]);
    MAKE_STD_ZVAL(fparams[2]);
    ZVAL_STRINGL(fparams[0], level, level_len, 0);
    ZVAL_ZVAL(fparams[1], message, 0, 0);
    ZVAL_ZVAL(fparams[2], context, 0, 0);

    call_user_function(&Z_OBJCE_P(_this_zval)->function_table, &_this_zval, fname, return_value, 3, fparams TSRMLS_CC);

    efree(fname);
    efree(fparams[0]);
    efree(fparams[1]);
    efree(fparams[2]);
}

PHP_METHOD(PsrLogAbstractLogger, emergency) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("emergency"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, alert) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("alert"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, critical) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("critical"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, error) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("error"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, warning) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("warning"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, notice) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("notice"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, info) {
    php_psr_PsrLogAbstractLogger_log(ZEND_STRL("info"), INTERNAL_FUNCTION_PARAM_PASSTHRU);
}

PHP_METHOD(PsrLogAbstractLogger, debug) {
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

static inline void php_psr_register_AbstractLogger(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\AbstractLogger", PsrLogAbstractLogger_methods);
    PsrLogAbstractLogger_ce_ptr = zend_register_internal_class(&ce TSRMLS_CC);
    zend_class_implements(PsrLogAbstractLogger_ce_ptr TSRMLS_CC, 1, PsrLogLoggerInterface_ce_ptr);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ NullLogger ----------------------------------------------------------- */

zend_class_entry * PsrLogNullLogger_ce_ptr;

PHP_METHOD(PsrLogNullLogger, log) {
    // noop
}

static zend_function_entry PsrLogNullLogger_methods[] = {
    PHP_ME(PsrLogNullLogger, log, arginfo_PsrLogLoggerInterface_log, ZEND_ACC_PUBLIC)
    PHP_FE_END
};

static inline void php_psr_register_NullLogger(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\NullLogger", PsrLogNullLogger_methods);
    PsrLogNullLogger_ce_ptr = zend_register_internal_class_ex(&ce, PsrLogAbstractLogger_ce_ptr, NULL TSRMLS_CC);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LoggerTrait ---------------------------------------------------------- */

#if PHP_API_VERSION >= 20100412

zend_class_entry * PsrLogLoggerTrait_ce_ptr;

static zend_function_entry PsrLogLoggerTrait_methods[] = {
    PHP_ME(PsrLogAbstractLogger, emergency, arginfo_PsrLogLoggerInterface_emergency, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, alert, arginfo_PsrLogLoggerInterface_alert, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, critical, arginfo_PsrLogLoggerInterface_critical, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, error, arginfo_PsrLogLoggerInterface_error, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, warning, arginfo_PsrLogLoggerInterface_warning, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, notice, arginfo_PsrLogLoggerInterface_notice, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, info, arginfo_PsrLogLoggerInterface_info, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, debug, arginfo_PsrLogLoggerInterface_debug, ZEND_ACC_PUBLIC)
    PHP_ABSTRACT_ME(PsrLogNullLogger, log, arginfo_PsrLogLoggerInterface_log)
    PHP_FE_END
};

static inline void php_psr_register_LoggerTrait(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerTrait", PsrLogLoggerTrait_methods);
    //ce.ce_flags |= ZEND_ACC_TRAIT;
    PsrLogLoggerTrait_ce_ptr = zend_register_internal_class(&ce TSRMLS_CC);
    PsrLogLoggerTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
}

#endif

/* }}} ---------------------------------------------------------------------- */
/* {{{ LoggerAwareTrait ----------------------------------------------------- */

#if PHP_API_VERSION >= 20100412

zend_class_entry * PsrLogLoggerAwareTrait_ce_ptr;

PHP_METHOD(PsrLogLoggerAwareTrait, setLogger) {
    zval * _this_zval;
    zval * logger;
    
    if( zend_parse_method_parameters(ZEND_NUM_ARGS() TSRMLS_CC, getThis(), "OO", 
            &_this_zval, NULL, &logger, PsrLogLoggerInterface_ce_ptr) == FAILURE) {
        return;
    }
    
	zend_update_property(Z_OBJCE_P(_this_zval), _this_zval, "logger", sizeof("logger")-1, logger TSRMLS_CC);
}

static zend_function_entry PsrLogLoggerAwareTrait_methods[] = {
    PHP_ME(PsrLogLoggerAwareTrait, setLogger, arginfo_PsrLogLoggerAwareInterface_setLogger, ZEND_ACC_PUBLIC)
    PHP_FE_END
};

static inline void php_psr_register_LoggerAwareTrait(INIT_FUNC_ARGS) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerAwareTrait", PsrLogLoggerAwareTrait_methods);
    //ce.ce_flags |= ZEND_ACC_TRAIT;
    PsrLogLoggerAwareTrait_ce_ptr = zend_register_internal_class(&ce TSRMLS_CC);
    PsrLogLoggerAwareTrait_ce_ptr->ce_flags |= ZEND_ACC_TRAIT;
	zend_declare_property_null(PsrLogLoggerAwareTrait_ce_ptr, "logger", sizeof("logger")-1, ZEND_ACC_PROTECTED TSRMLS_CC);
}

#endif

/* }}} ---------------------------------------------------------------------- */

static PHP_MINIT_FUNCTION(psr)
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

static PHP_MINFO_FUNCTION(psr)
{
    php_info_print_table_start();
    php_info_print_table_row(2, "Version", PHP_PSR_VERSION);
    php_info_print_table_row(2, "Released", PHP_PSR_RELEASE);
    php_info_print_table_row(2, "Authors", PHP_PSR_AUTHORS);
    php_info_print_table_end();
}

static const zend_module_dep psr_deps[] = {
	ZEND_MOD_REQUIRED("spl")
	ZEND_MOD_END
};

zend_module_entry psr_module_entry = {
    STANDARD_MODULE_HEADER_EX,
    NULL,
    psr_deps,
    PHP_PSR_NAME,                       /* Name */
    NULL,                               /* Functions */
    PHP_MINIT(psr),                     /* MINIT */
    NULL,                               /* MSHUTDOWN */
    NULL,                               /* RINIT */
    NULL,                               /* RSHUTDOWN */
    PHP_MINFO(psr),                     /* MINFO */
    PHP_PSR_VERSION,                    /* Version */
    STANDARD_MODULE_PROPERTIES
};

#ifdef COMPILE_DL_PSR
    ZEND_GET_MODULE(psr)      // Common for all PHP extensions which are build as shared modules  
#endif

