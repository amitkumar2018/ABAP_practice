
"title: Controller for MVC Calculator
"author: Shu
"Date: 04042019
"Purpose: The controller serves as an in between from model to view
"it calls only the math function necessary for outputs

CLASS lcl_calcontr DEFINITION.
  PUBLIC SECTION.
    DATA: s_calmodel TYPE REF TO lcl_calmodel.

    METHODS: constructor IMPORTING smodel TYPE REF TO lcl_calmodel,
      doMath.

ENDCLASS.

CLASS lcl_calcontr IMPLEMENTATION.

  METHOD constructor.
    me->s_calmodel = smodel.
  ENDMETHOD.

  "This method does the calculations.
  "Needs to be called prior to view calling controller
  METHOD doMath.
    CASE me->s_calmodel->s_flag.
      WHEN '+'.
        me->s_calmodel->doaddition( ).
      WHEN '-'.
        me->s_calmodel->dosubtraction( ).
      WHEN '*'.
        me->s_calmodel->domultiplication( ).
      WHEN '/'.
        me->s_calmodel->dodivision( ).
      When others.
        WRITE: |Please select a function|.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.