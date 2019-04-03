"PROGRAM z_abptrainshu_exer48_model.
"Title: Model for MVC Calculator
"Author: Shu
"Date: 03272019

"So here is the master plan doing MVC with ABAP.
"We are going to make a fat model and a reatively skinny controller
"This should help us stay a little DRY-er if we use multiple views

"All business logic lives in the model class
CLASS lcl_calmodel DEFINITION.
  "s for selcetion screen variables
  PUBLIC SECTION.
    DATA:  s_num1  TYPE i,
           s_num2  TYPE i,
           s_add   TYPE i,
           s_sub   TYPE i,
           s_multi TYPE i,
           s_div   TYPE i,
           s_flag  TYPE c.

    METHODS: constructor IMPORTING im_num1 TYPE i
                              im_num2 TYPE i
                              im_flag TYPE c,

             doAddition,
             doSubtraction,
             doMultiplication,
             doDivision.


ENDCLASS.

"constructor imports from main program
CLASS lcl_calmodel IMPLEMENTATION.
  METHOD constructor.
    "me is the new this
    me->s_num1 = im_num1.
    me->s_num2 = im_num2.
    me->s_flag = im_flag.
  ENDMETHOD.
  "Methods to perform businee logic
METHOD doAddition.
    s_add = s_num1 + s_num2.
  ENDMETHOD.
  METHOD doSubtraction.
    s_sub = s_num1 - s_num2.
  ENDMETHOD.
  METHOD doMultiplication.
    s_multi = s_num1 * s_num2.
  ENDMETHOD.
  METHOD doDivision.
    s_div = s_num1 / s_num2.
  ENDMETHOD.
ENDCLASS.