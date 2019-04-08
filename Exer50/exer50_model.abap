"title: This is the super/parent class
"Author: Shu
"Purpose: This is the super/parent class.
"The four operations inherit this class

CLASS lcl_calmodel DEFINITION.
  PUBLIC SECTION.
    DATA: operation TYPE c.

    METHODS:
      calculate IMPORTING im1 TYPE i
                          im2 TYPE i
                CHANGING  ans TYPE i.
ENDCLASS.

CLASS lcl_calmodel IMPLEMENTATION.
  METHOD calculate.
    ans = 0.
    "ans is always 0 when children inherit and calls this method
    "Call child method that calculates correct ans
    WRITE: |Super Class Variable { ans } and stuff|.
  ENDMETHOD.
ENDCLASS.