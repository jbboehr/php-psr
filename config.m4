
# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

# PSR --------------------------------------------------------------------------
PHP_ARG_ENABLE(psr, whether to enable psr support,
# Make sure that the comment is aligned:
[  --enable-psr Enable psr support])

# MAIN -------------------------------------------------------------------------
if test "$PHP_PSR" != "no"; then
    PHP_INSTALL_HEADERS([ext/psr], [php_psr.h psr_cache.h psr_container.h psr_http_message.h psr_log.h psr_link.h])
    PHP_NEW_EXTENSION(psr, psr.c psr_cache.c psr_container.c psr_http_message.c psr_link.c psr_log.c, $ext_shared)
fi

