"! <p class="shorttext synchronized">Query Config for Method search</p>
CLASS zcl_sat_clif_meth_query_config DEFINITION
  PUBLIC
  INHERITING FROM zcl_sat_clsintf_query_config
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.
    METHODS zif_sat_object_search_config~get_type          REDEFINITION.
    METHODS zif_sat_object_search_config~get_option_config REDEFINITION.
    METHODS zif_sat_object_search_config~has_option        REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA mt_method_options        TYPE zif_sat_ty_object_search=>ty_t_query_filter.
    DATA mv_option_prefix_pattern TYPE string.
ENDCLASS.


CLASS zcl_sat_clif_meth_query_config IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).

    DELETE mt_options WHERE    name = c_class_intf_search_option-attribute
                            OR name = c_class_intf_search_option-method.

    DATA(lr_object_filters) = REF #( ms_search_type-inputs[
                                         name = zif_sat_c_object_search=>c_search_fields-object_filter_input_key ]-filters ).

    DELETE lr_object_filters->* WHERE    name = c_class_intf_search_option-attribute
                                      OR name = c_class_intf_search_option-method.

    " TODO: add filters for method:
    " - param (any)
    " - type (constructor,handler)
    " - flag (optional,abstract,final,class_exceptions)
    " - exposure (private,protected,public)
    " - level (static, instance)
    " - desc (description of method)
  ENDMETHOD.

  METHOD zif_sat_object_search_config~get_type.
    rv_type = zif_sat_c_object_search=>c_search_type-method.
  ENDMETHOD.

  METHOD zif_sat_object_search_config~get_option_config.
    IF iv_target = zif_sat_c_object_search=>c_search_fields-method_filter_input_key.
      rs_option = mt_method_options[ name = iv_option ].
    ELSE.
      rs_option = super->zif_sat_object_search_config~get_option_config( iv_option ).
    ENDIF.
  ENDMETHOD.

  METHOD zif_sat_object_search_config~has_option.
    IF iv_target = zif_sat_c_object_search=>c_search_fields-method_filter_input_key.
      rf_has_option = xsdbool( line_exists( mt_method_options[ name = iv_option ] ) ).
    ELSE.
      rf_has_option = super->zif_sat_object_search_config~has_option( iv_option = iv_option iv_target = iv_target ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
