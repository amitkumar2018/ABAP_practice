"Title: OOP Classes
"Author: Shu
"date:03252019
REPORT z_abptrainshu_exer46.

"Class definition
CLASS lcl_addsub DEFINITION.
  PUBLIC SECTION.
    METHODS:
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
  DATA: lo_addsub TYPE REF TO lcl_addsub.

"Create object to call methods
  CREATE OBJECT lo_addsub.

  lo_addsub->setadd12( EXPORTING num1 = p_num1
                                 num2 = p_num2 ).
  lo_addsub->setadd23( EXPORTING num3 = p_num3
                                 num2 = p_num2 ).
  lo_addsub->setsub12( EXPORTING num1 = p_num1
                                 num2 = p_num2 ).
  lo_addsub->setsub23( EXPORTING num3 = p_num3
                                 num2 = p_num2 ).