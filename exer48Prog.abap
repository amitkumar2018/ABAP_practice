REPORT z_abptrainshu_exer48_prog.
INCLUDE z_abptrainshu_exer48_model.
INCLUDE z_abptrainshu_exer48_contr.

"Title MVC Calculator program and view
"Author: Shu
"Date 04/02/19

"Purpose: This is the main program. It will call both model and controller,
" and creates the basic views

"Create parameter screen. intergers will be passed to model
INITIALIZATION.
  SELECTION-SCREEN BEGIN OF BLOCK rad1.
  PARAMETERS: p_num1  TYPE i,
              p_num2  TYPE i,
              rb_sum  RADIOBUTTON GROUP g1,
              rb_diff RADIOBUTTON GROUP g1,
              rb_prod RADIOBUTTON GROUP g1,
              rb_quot RADIOBUTTON GROUP g1.

  SELECTION-SCREEN END OF BLOCK rad1.

START-OF-SELECTION.
  "Change flag for case in model
  IF rb_sum IS NOT INITIAL.
    DATA(lv_flag) = '+'.
  ELSEIF rb_diff IS NOT INITIAL.
    lv_flag = '-'.
  ELSEIF rb_prod IS NOT INITIAL.
    lv_flag = '*'.
  ELSEIF rb_quot IS NOT INITIAL.
    lv_flag = '/'.
  ELSE.
    WRITE: 'Please select a button'.
  ENDIF.

  "Declaration
  DATA(lo_calmodel) = NEW lcl_calmodel( im_num1 = p_num1
                                         im_num2 = p_num2
                                         im_flag = lv_flag ).
  DATA(lo_calcontrol) = NEW lcl_calcontr( smodel = lo_calmodel ).

  lo_calcontrol->displayresult( ).