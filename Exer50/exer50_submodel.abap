"Title: Child Subtraction
"Author: shu
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments

CLASS lcl_subtraction DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
             subtraction IMPORTING subim1 TYPE i
                                   subim2 TYPE i
                         CHANGING  subans TYPE i.
ENDCLASS.

CLASS lcl_subtraction IMPLEMENTATION.
  METHOD subtraction.
    subans = subim1 - subim2.
    WRITE: | { subans } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                                im2 = im2
                      CHANGING  ans = ans ).
    me->subtraction( EXPORTING
                 subim1 = im1
                 subim2 = im2
                 CHANGING subans = ans ).
  ENDMETHOD.
ENDCLASS.