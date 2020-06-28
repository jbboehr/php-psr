dnl vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

dnl PSR --------------------------------------------------------------------------
PHP_ARG_ENABLE(psr, whether to enable psr support,
[  --enable-psr           Enable PSR support])

dnl MAIN -------------------------------------------------------------------------
if test "$PHP_PSR" != "no"; then
    AH_BOTTOM([
#ifdef __clang__
#include "main/php_config.h"
#/**/undef/**/ HAVE_ASM_GOTO
#endif
    ])’
    AC_DEFINE(HAVE_PSR, 1, [Whether you have PSR])
    PHP_NEW_EXTENSION(psr, php_psr.c psr_cache.c psr_container.c psr_http_message.c psr_link.c psr_log.c psr_simple_cache.c psr_http_server_handler.c psr_http_server_middleware.c psr_http_factory.c psr_http_client.c psr_event_dispatcher.c, $ext_shared)
    PHP_INSTALL_HEADERS([ext/psr], [php_psr.h psr_cache.h psr_container.h psr_http_message.h psr_link.h psr_log.h psr_simple_cache.h psr_http_server_handler.h psr_http_server_middleware.h psr_http_factory.h psr_http_client.h psr_event_dispatcher.h])
fi
