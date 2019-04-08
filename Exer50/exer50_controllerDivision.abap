"Title: Division Controller
"Author: Shu
"Date: 04/08/2019
"Purpose: This controller controllers the division behavior
"See Z_ABPTRAINSHU_EXER50_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrldiv DEFINITION.
  PUBLIC SECTION.
    DATA: s_divmodel TYPE REF TO lcl_division.
    METHODS: constructor IMPORTING sdivmodel TYPE REF TO lcl_division,
             doDivision importing divim1 type i
                                   divim2 type i
                        changing ans type i.
ENDCLASS.
CLASS lcl_cntrldiv IMPLEMENTATION.
  METHOD constructor.
    me->s_divmodel = sdivmodel.
  ENDMETHOD.
  Method doDivision.
    me->s_divmodel->calculate( exporting im1 = divim1
                                         im2 = divim2
                               Changing  ans = ans ).
    ENDMETHOD.
ENDCLASS.