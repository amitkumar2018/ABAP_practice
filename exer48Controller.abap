
"title: Controller for MVC Calculator
"author: Shu
"Date: 03282019
"Purpose: The controller serves as an in between from model to view
"In this case I use it to control what write statement is produced
"Probably should have used a view class with the write statements in the calss
"but I am tired of looking at it
CLASS lcl_calcontr DEFINITION.
  PUBLIC SECTION.
    DATA: s_calmodel TYPE REF TO lcl_calmodel.

    METHODS: constructor IMPORTING smodel TYPE REF TO lcl_calmodel,
      displayresult.

ENDCLASS.

CLASS lcl_calcontr IMPLEMENTATION.
  METHOD constructor.
    me->s_calmodel = smodel.
  ENDMETHOD.
  "One method to control them all, one method to bind them!
  METHOD displayresult.
    CASE me->s_calmodel->s_flag.
      WHEN '+'.
        me->s_calmodel->doaddition( ).
        WRITE: |Sum is { s_calmodel->s_add }|.
      WHEN '-'.
        me->s_calmodel->dosubtraction( ).
        WRITE: |Subtraction is { s_calmodel->s_sub }|.
      WHEN '*'.
        me->s_calmodel->domultiplication( ).
        WRITE: |Product is { s_calmodel->s_multi }|.
      WHEN '/'.
        me->s_calmodel->dodivision( ).
        WRITE: |Quotient is { s_calmodel->s_div }|.
      When others.
        WRITE: |Please select a function|.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.