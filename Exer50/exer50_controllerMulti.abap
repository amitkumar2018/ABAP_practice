"Title: Multiplication Controller
"Author: Shu
"Date: 04/08/2019
"Purpose: This controller controllers the multiplication behavior
"See Z_ABPTRAINSHU_EXER50_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrlmulti DEFINITION.
  PUBLIC SECTION.
    DATA: s_multimodel TYPE REF TO lcl_multiplication.
    METHODS: constructor IMPORTING smultimodel TYPE REF TO lcl_multiplication,
             doMultiply importing multiim1 type i
                                  multiim2 type i
                        changing  ans      type i.
ENDCLASS.
CLASS lcl_cntrlmulti IMPLEMENTATION.
  METHOD constructor.
    me->s_multimodel = smultimodel.
  ENDMETHOD.
  Method doMultiply.
   me->s_multimodel->calculate( exporting im1 = multiim1
                                          im2 = multiim2
                               Changing  ans = ans ).
    ENDMETHOD.
ENDCLASS.