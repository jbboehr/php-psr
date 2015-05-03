
# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

# PSR --------------------------------------------------------------------------
PHP_ARG_ENABLE(psr, whether to enable psr support,
# Make sure that the comment is aligned:
[  --enable-psr Enable psr support])

# MAIN -------------------------------------------------------------------------
if test "$PHP_PSR" != "no"; then
    PHP_NEW_EXTENSION(psr, psr.c, $ext_shared, , $PHP_PSR_FLAGS)
fi

