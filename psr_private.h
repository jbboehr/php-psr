
#define PHP_PSR_ABSTRACT_ME(p, c, f) PHP_ABSTRACT_ME(p ## c, f, PHP_PSR_ARGINFO(p, c, f))
#define PHP_PSR_ABSTRACT_ME_WITH_FLAGS(p, c, f, fl) ZEND_FENTRY(f, NULL, PHP_PSR_ARGINFO(p, c, f), fl)

static zend_always_inline zend_class_entry* php_psr_register_interface(
    const char* class_name,
    size_t class_name_len,
    const char* class_alias,
    size_t class_alias_len,
    zend_function_entry* methods

) {
    zend_class_entry ce;
    zend_class_entry *class_entry;
    INIT_CLASS_ENTRY_EX(ce, class_name, class_name_len, methods);
    class_entry = zend_register_internal_interface(&ce);
    zend_register_class_alias_ex(class_alias, class_alias_len, class_entry, 1);
    return class_entry;
}

#define PHP_PSR_REGISTER_INTERFACE_EX(class_name, methods, ce) do { \
        ce = php_psr_register_interface( \
            PHP_PSR_CLASS_NAMESPACE "\\" class_name, \
            sizeof(PHP_PSR_CLASS_NAMESPACE "\\" class_name)-1, \
            PHP_PSR_ALIAS_NAMESPACE "\\" class_name, \
            sizeof(PHP_PSR_ALIAS_NAMESPACE "\\" class_name)-1, \
            methods \
        ); \
    } while (0)

#define PHP_PSR_REGISTER_INTERFACE(psr_name, class_name) do { \
        PHP_PSR_REGISTER_INTERFACE_EX(#psr_name "\\" #class_name, Psr ## psr_name ## class_name ## _methods ,  Psr ## psr_name ## class_name ## _ce_ptr); \
    } while(0)

#define PHP_PSR_REGISTER_INTERFACE2(psr_name, ns_name, class_name) do { \
        PHP_PSR_REGISTER_INTERFACE_EX(#psr_name "\\" #ns_name "\\" #class_name, Psr ## psr_name ## ns_name ## class_name ## _methods ,  Psr ## psr_name ## ns_name ## class_name ## _ce_ptr); \
    } while(0)



static zend_always_inline zend_class_entry* php_psr_register_class(
    const char* class_name,
    size_t class_name_len,
    const char* class_alias,
    size_t class_alias_len,
    zend_function_entry* methods,
    zend_class_entry* parent_ce
) {
    zend_class_entry ce;
    zend_class_entry *class_entry;
    INIT_CLASS_ENTRY_EX(ce, class_name, class_name_len, methods);
    class_entry = zend_register_internal_class_ex(&ce, parent_ce);
    zend_register_class_alias_ex(class_alias, class_alias_len, class_entry, 1);
    return class_entry;
}

#define PHP_PSR_REGISTER_CLASS_EX(class_name, methods, ce, parent_ce) do { \
        ce = php_psr_register_class( \
            PHP_PSR_CLASS_NAMESPACE "\\" class_name, \
            sizeof(PHP_PSR_CLASS_NAMESPACE "\\" class_name)-1, \
            PHP_PSR_ALIAS_NAMESPACE "\\" class_name, \
            sizeof(PHP_PSR_ALIAS_NAMESPACE "\\" class_name)-1, \
            methods, \
            parent_ce \
        ); \
    } while (0)

#define PHP_PSR_REGISTER_CLASS(psr_name, class_name, parent_ce) do { \
        PHP_PSR_REGISTER_CLASS_EX(#psr_name "\\" #class_name, Psr ## psr_name ## class_name ## _methods ,  Psr ## psr_name ## class_name ## _ce_ptr, parent_ce); \
    } while(0)
