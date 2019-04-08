"Title: Child Subtraction
"Author: shu
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments
CLASS lcl_multiplication DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      multiplication IMPORTING multiim1 TYPE i
                         multiim2 TYPE i
               CHANGING  multians TYPE i.
ENDCLASS.

CLASS lcl_multiplication IMPLEMENTATION.
  METHOD multiplication.
    multians = multiim1 * multiim2.
    WRITE: | { multians } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                               im2 = im2
                      CHANGING ans = ans ).
    me->multiplication( EXPORTING
                 multiim1 = im1
                 multiim2 = im2
                 CHANGING multians = ans ).
  ENDMETHOD.
ENDCLASS.