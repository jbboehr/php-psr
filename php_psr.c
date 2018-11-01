
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "ext/spl/spl_exceptions.h"
#include "zend_API.h"
#include "zend_interfaces.h"

#include "php5to7.h"

#include "php_psr.h"
#include "psr_cache.h"
#include "psr_container.h"
#include "psr_http_message.h"
#include "psr_link.h"
#include "psr_log.h"
#include "psr_simple_cache.h"
#include "psr_http_server_handler.h"
#include "psr_http_server_middleware.h"
#include "psr_http_factory.h"
#include "psr_http_client.h"

static PHP_MINIT_FUNCTION(psr)
{
    PHP_MINIT(psr_cache)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_container)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_http_message)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_link)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_log)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_simple_cache)(INIT_FUNC_ARGS_PASSTHRU);
#ifdef ZEND_ENGINE_3
    PHP_MINIT(psr_http_server_handler)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_http_server_middleware)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_http_factory)(INIT_FUNC_ARGS_PASSTHRU);
    PHP_MINIT(psr_http_client)(INIT_FUNC_ARGS_PASSTHRU);
#endif
    return SUCCESS;
}

static PHP_MINFO_FUNCTION(psr)
{
    php_info_print_table_start();
    php_info_print_table_row(2, "Version", PHP_PSR_VERSION);
    php_info_print_table_row(2, "Released", PHP_PSR_RELEASE);
    php_info_print_table_row(2, "Authors", PHP_PSR_AUTHORS);
    php_info_print_table_row(2, "PSR-3 Log Version", PHP_PSR_LOG_VERSION);
    php_info_print_table_row(2, "PSR-6 Cache Version", PHP_PSR_CACHE_VERSION);
    php_info_print_table_row(2, "PSR-7 Http Message Version", PHP_PSR_HTTP_MESSAGE_VERSION);
    php_info_print_table_row(2, "PSR-11 Container Version", PHP_PSR_CONTAINER_VERSION);
    php_info_print_table_row(2, "PSR-13 Link Version", PHP_PSR_LOG_VERSION);
#ifdef ZEND_ENGINE_3
    php_info_print_table_row(2, "PSR-15 HTTP Handlers (Server Handler)", PHP_PSR_HTTP_SERVER_HANDLER_VERSION);
    php_info_print_table_row(2, "PSR-15 HTTP Handlers (Middleware)", PHP_PSR_HTTP_SERVER_MIDDLEWARE_VERSION);
#endif
    php_info_print_table_row(2, "PSR-16 Simple Cache Version", PHP_PSR_SIMPLE_CACHE_VERSION);
#ifdef ZEND_ENGINE_3
    php_info_print_table_row(2, "PSR-17 HTTP Factories", PHP_PSR_HTTP_FACTORY_VERSION);
    php_info_print_table_row(2, "PSR-18 HTTP Client", PHP_PSR_HTTP_CLIENT_VERSION);
#endif
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

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 * vim600: fdm=marker
 * vim: et sw=4 ts=4
 */
