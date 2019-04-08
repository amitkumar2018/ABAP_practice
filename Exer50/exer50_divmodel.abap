"Title: Child Subtraction
"Author: shu
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments

CLASS lcl_division DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      division IMPORTING divim1 TYPE i
                         divim2 TYPE i
               CHANGING  divans TYPE i.
ENDCLASS.

CLASS lcl_division IMPLEMENTATION.
  METHOD division.
    divans = divim1 / divim2.
    WRITE: | { divans } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                                im2 = im2
                      CHANGING  ans = ans ).
    me->division( EXPORTING
                 divim1 = im1
                 divim2 = im2
                 CHANGING divans = ans ).
  ENDMETHOD.
ENDCLASS.