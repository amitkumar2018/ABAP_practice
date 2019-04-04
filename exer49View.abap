"Title: View for MVC Calculator
"Author: Shu
"Date: 04/4/2019
"Purpose: This View handles write statements and messages for the MVC Calculator
********************************************************************************
CLASS lcl_calview DEFINITION.
  PUBLIC SECTION.
    DATA: s_calcontr TYPE REF TO lcl_calcontr.

    METHODS: constructor IMPORTING g_calcontr TYPE REF TO lcl_calcontr,
             writedisplay,
             messagedisplay.

ENDCLASS.

CLASS lcl_calview IMPLEMENTATION.
"Constructor to link view and controller
  METHOD constructor.
    me->s_calcontr = g_calcontr.
  ENDMETHOD.
  "Write method to display write statements
  METHOD writedisplay.
    CASE me->s_calcontr->s_calmodel->s_flag.
      WHEN '+'.
        WRITE: |Sum is { s_calcontr->s_calmodel->s_add }|.
      WHEN '-'.
        WRITE: |Subtraction is { s_calcontr->s_calmodel->s_sub }|.
      WHEN '*'.
        WRITE: |Product is { s_calcontr->s_calmodel->s_multi }|.
      WHEN '/'.
        WRITE: |Quotient is { s_calcontr->s_calmodel->s_div }|.
      WHEN OTHERS.
        WRITE: |Please select a function|.
    ENDCASE.
  ENDMETHOD.
  "Method to dispaly inormation messages
  METHOD messagedisplay.
    CASE me->s_calcontr->s_calmodel->s_flag.
      WHEN '+'.
        MESSAGE: |Sum is { s_calcontr->s_calmodel->s_add }| TYPE 'I'.
      WHEN '-'.
        MESSAGE: |Subtraction is { s_calcontr->s_calmodel->s_sub }| TYPE 'I'.
      WHEN '*'.
        MESSAGE: |Product is { s_calcontr->s_calmodel->s_multi }| TYPE 'I'.
      WHEN '/'.
        MESSAGE: |Quotient is { s_calcontr->s_calmodel->s_div }| TYPE 'I'.
      WHEN OTHERS.
        MESSAGE: |Please select a function| TYPE 'E'.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.