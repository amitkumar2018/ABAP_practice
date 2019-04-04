
"Title: Model for MVC Calculator
"Author: Shu
"Date: 04032019

"So here is the master plan doing MVC with ABAP.
"We are going to make a fat model and a reatively skinny controller
"This should help us stay a little DRY-er if we use multiple views

"All business logic lives in the model class
CLASS lcl_calmodel DEFINITION.
  "s for sets? Maybe?
  PUBLIC SECTION.
    DATA:  s_num1  TYPE i,
           s_num2  TYPE i,
           s_add   TYPE i,
           s_sub   TYPE i,
           s_multi TYPE i,
           s_div   TYPE i,
           s_flag  TYPE c.

    "Constructor passes in user defined values in program
    METHODS: constructor IMPORTING im_num1 TYPE i
                                   im_num2 TYPE i
                                   im_flag TYPE c,

      doaddition,
      dosubtraction,
      domultiplication,
      dodivision.


ENDCLASS.

"constructor imports from main program
CLASS lcl_calmodel IMPLEMENTATION.
  METHOD constructor.
    "Cond statement to check if either value is out of range.
    "If either value is out of range then both values equal one
    me->s_num1 = COND #(
        WHEN im_num1 > 100 OR im_num1 < 0 THEN 1
        WHEN im_num2 > 100 OR im_num2 < 0 THEN 1
        ELSE im_num1
        ).
    me->s_num2 = COND #(
        WHEN im_num1 > 100 OR im_num1 < 0 THEN 1
        WHEN im_num2 > 100 OR im_num2 < 0 THEN 1
        ELSE im_num2
        ).
    "me is the new this
    me->s_flag = im_flag.
  ENDMETHOD.
  "Methods to perform business logic
  METHOD doaddition.
    s_add = s_num1 + s_num2.
  ENDMETHOD.
  METHOD dosubtraction.
    s_sub = s_num1 - s_num2.
  ENDMETHOD.
  METHOD domultiplication.
    s_multi = s_num1 * s_num2.
  ENDMETHOD.
  METHOD dodivision.
    s_div = s_num1 / s_num2.
  ENDMETHOD.
ENDCLASS.