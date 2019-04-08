"Title: Addition Controller
"Author: Shu
"Date: 04/08/2019
"Purpose: This controller controllers the subtraction behavior
"See Z_ABPTRAINSHU_EXER50_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrlsub DEFINITION.
  PUBLIC SECTION.
    DATA: s_submodel TYPE REF TO lcl_subtraction.
    METHODS: constructor IMPORTING ssubmodel TYPE REF TO lcl_subtraction,
                                   doSubtraction importing subim1 type i
                                                   subim2 type i
                                         Changing  ans    type i.
ENDCLASS.
CLASS lcl_cntrlsub IMPLEMENTATION.
  METHOD constructor.
    me->s_submodel = ssubmodel.
  ENDMETHOD.
  METHOD doSubtraction.
  me->s_submodel->calculate( exporting im1 = subim1
                                       im2 = subim2
                             changing  ans = ans ).
  ENDMETHOD.
ENDCLASS.