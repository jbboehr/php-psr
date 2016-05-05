
#ifndef ZEND_ENGINE_3
typedef int strsize_t;
#define php5to7_register_internal_class_ex(class, parent) zend_register_internal_class_ex(class, parent, NULL TSRMLS_CC)
#else
typedef size_t strsize_t;
#define php5to7_register_internal_class_ex(class, parent) zend_register_internal_class_ex(class, parent)
#endif

