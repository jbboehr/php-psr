
/* vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "zend_API.h"
#include "zend_interfaces.h"

#include "php_psr.h"

#define REGISTER_PSR_CLASS_CONST_STRING(ce, const_name, value) \
		zend_declare_class_constant_stringl(ce, const_name, sizeof(const_name)-1, value, sizeof(value)-1);


/* {{{ LogLevel ------------------------------------------------------------ */

zend_class_entry * PsrLogLogLevel_ce_ptr;

static inline void  php_psr_register_LogLevel(TSRMLS_D) {
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
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, emergency, arginfo_PsrLogLoggerInterface_emergency)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, alert, arginfo_PsrLogLoggerInterface_alert)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, critical, arginfo_PsrLogLoggerInterface_critical)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, error, arginfo_PsrLogLoggerInterface_error)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, warning, arginfo_PsrLogLoggerInterface_warning)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, notice, arginfo_PsrLogLoggerInterface_notice)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, info, arginfo_PsrLogLoggerInterface_info)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, debug, arginfo_PsrLogLoggerInterface_debug)
    ZEND_ABSTRACT_ME(PsrLogLoggerInterface, log, arginfo_PsrLogLoggerInterface_log)
    { NULL, NULL, NULL }
};

static inline void php_psr_register_LoggerInterface(TSRMLS_D) {
    zend_class_entry ce;
	INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerInterface", PsrLogLoggerInterface_methods);
	PsrLogLoggerInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ LoggerAwareInterface ------------------------------------------------- */

zend_class_entry * PsrLogLoggerAwareInterface_ce_ptr;

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogLoggerAwareInterface_setLogger, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
	ZEND_ARG_OBJ_INFO(0, logger, Psr\\Log\\LoggerInterface, 0)
ZEND_END_ARG_INFO();

static zend_function_entry PsrLogLoggerAwareInterface_methods[] = {
    ZEND_ABSTRACT_ME(PsrLogLoggerAwareInterface, setLogger, arginfo_PsrLogLoggerAwareInterface_setLogger)
    { NULL, NULL, NULL }
};

static inline void php_psr_register_LoggerAwareInterface(TSRMLS_D) {
    zend_class_entry ce;
	INIT_CLASS_ENTRY(ce, "Psr\\Log\\LoggerAwareInterface", PsrLogLoggerAwareInterface_methods);
	PsrLogLoggerAwareInterface_ce_ptr = zend_register_internal_interface(&ce);
}

/* }}} ---------------------------------------------------------------------- */
/* {{{ AbstractLogger ------------------------------------------------------- */

zend_class_entry * PsrLogAbstractLogger_ce_ptr;

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_emergency, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_alert, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_critical, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_error, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_warning, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_notice, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_info, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_PsrLogAbstractLogger_debug, ZEND_SEND_BY_VAL, ZEND_RETURN_VALUE, 1)
    ZEND_ARG_INFO(0, message)
    ZEND_ARG_ARRAY_INFO(0, context, 0)
ZEND_END_ARG_INFO()

static void php_psr_PsrLogAbstractLogger_log(const char * level, int level_len, INTERNAL_FUNCTION_PARAMETERS) {
    zval * _this_zval;
    zval * message;
    zval * context;
    zval * fname;
    zval * fparams[3];
    
    if( zend_parse_method_parameters(ZEND_NUM_ARGS() TSRMLS_CC, getThis(), "Oza", 
            &_this_zval, PsrLogAbstractLogger_ce_ptr, &message, &context) == FAILURE) {
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
    PHP_ME(PsrLogAbstractLogger, emergency, arginfo_PsrLogAbstractLogger_emergency, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, alert, arginfo_PsrLogAbstractLogger_alert, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, critical, arginfo_PsrLogAbstractLogger_critical, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, error, arginfo_PsrLogAbstractLogger_error, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, warning, arginfo_PsrLogAbstractLogger_warning, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, notice, arginfo_PsrLogAbstractLogger_notice, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, info, arginfo_PsrLogAbstractLogger_info, ZEND_ACC_PUBLIC)
    PHP_ME(PsrLogAbstractLogger, debug, arginfo_PsrLogAbstractLogger_debug, ZEND_ACC_PUBLIC)
    { NULL, NULL, NULL }
};

static inline void php_psr_register_AbstractLogger(TSRMLS_D) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "Psr\\Log\\AbstractLogger", PsrLogAbstractLogger_methods);
    PsrLogAbstractLogger_ce_ptr = zend_register_internal_class(&ce TSRMLS_CC);
	zend_class_implements(PsrLogAbstractLogger_ce_ptr, 1, PsrLogLoggerInterface_ce_ptr);
}
/* }}} ---------------------------------------------------------------------- */

static PHP_MINIT_FUNCTION(psr)
{
    php_psr_register_LogLevel(TSRMLS_C);
    php_psr_register_LoggerInterface(TSRMLS_C);
    php_psr_register_LoggerAwareInterface(TSRMLS_C);
    php_psr_register_AbstractLogger(TSRMLS_C);

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

zend_module_entry psr_module_entry = {
    STANDARD_MODULE_HEADER,
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

