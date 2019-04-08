"Title: Child Addition
"Author: shu
"Purpose: This is an child of the model class. It preforms the addition operation.

CLASS lcl_addition DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
  "redefining calculate method on parent
    METHODS: calculate REDEFINITION,
      addition IMPORTING addim1 TYPE i
                         addim2 TYPE i
               CHANGING  addans TYPE i.
ENDCLASS.

CLASS lcl_addition IMPLEMENTATION.
  "This gets called in calculate method
  METHOD addition.
    addans = addim1 + addim2.
    WRITE: | { addans } |.
  ENDMETHOD.

"Calculate uses the parent and adds the child method
  METHOD calculate.
    super->calculate( EXPORTING
                               im1 = im1
                               im2 = im2
                      CHANGING ans = ans ).
    me->addition(      EXPORTING
                               addim1 = im1
                               addim2 = im2
                      CHANGING addans = ans ).
  ENDMETHOD.
ENDCLASS.