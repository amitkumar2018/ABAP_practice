
REPORT z_abptrainshu_exer47.
"Title: OOP Classes
"Author: Shu
"date:03252019


"Class definition
CLASS lcl_addsub DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING num1 TYPE i
                  num2 TYPE i
                  num3 TYPE i,
      setadd12
        IMPORTING num1 TYPE i
                  num2 TYPE i,
      setadd23
        IMPORTING num3 TYPE i
                  num2 TYPE i,
      setsub12
        IMPORTING num1 TYPE i
                  num2 TYPE i,
      setsub23
        IMPORTING num3 TYPE i
                  num2 TYPE i.


  PRIVATE SECTION.
    DATA:
      clv_add12 TYPE i,
      clv_add23 TYPE i,
      clv_sub12 TYPE i,
      clv_sub23 TYPE i.
ENDCLASS.

"Class implementation
CLASS lcl_addsub IMPLEMENTATION.
  "constructors are called at object creation
  METHOD constructor.
    WRITE: / num1.
  ENDMETHOD.

  METHOD setadd12.
    clv_add12 = num1 + num2.
    WRITE: / | ADD 1 and 2 = { clv_add12 } |.
  ENDMETHOD.

  METHOD setadd23.
    clv_add23 = num2 + num3.
    WRITE: / | ADD 2 and 3 = { clv_add23 } |.
  ENDMETHOD.

  METHOD setsub12.
    clv_sub12 = num1 - num2.
    WRITE: / | Subtract 1 and 2 = { clv_sub12 } |.
  ENDMETHOD.

  METHOD setsub23.
    clv_sub23 = num2 - num3.
    WRITE: / | Subtract 2 and 3 = { clv_sub23 } |.
  ENDMETHOD.

ENDCLASS.

INITIALIZATION.
  PARAMETERS: p_num1 TYPE i,
              p_num2 TYPE i,
              p_num3 TYPE i.

START-OF-SELECTION.
  IF ( p_num1 IS NOT INITIAL AND p_num1 < 0 OR p_num1 > 100 ).
    p_num1 = 1.
  ENDIF.
  IF ( p_num2 IS NOT INITIAL AND p_num2 < 0 OR p_num2 > 100 ).
    p_num2 = 1.
  ENDIF.
  IF ( p_num3 IS NOT INITIAL AND p_num3 < 0 OR p_num3 > 100 ).
    p_num3 = 1.
  ENDIF.


  DATA(o_addsub) = NEW lcl_addsub( num1 = p_num1
                                   num2 = p_num2
                                   num3 = p_num3 ).
  o_addsub->setadd12( EXPORTING num1 = p_num1
                                 num2 = p_num2 ).
  o_addsub->setadd23( EXPORTING num2 = p_num2
                                 num3 = p_num3 ).
  o_addsub->setsub12( EXPORTING num1 = p_num1
                                 num2 = p_num2 ).
  o_addsub->setsub23( EXPORTING num2 = p_num2
                                 num3 = p_num3 ).