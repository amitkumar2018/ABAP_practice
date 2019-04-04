REPORT Z_ABPTRAINSHU_EXER49_PROGRAM.
Include Z_ABPTRAINSHU_EXER49_Model.
Include Z_ABPTRAINSHU_EXER49_Control.
Include Z_ABPTRAINSHU_EXER49_View.
"Title MVC Calculator program
"Author: Shu
"Date 04/04/19

"Purpose: This is the main program. It will call both model and controller,
" and creates the basic views

"Create parameter screen. intergers will be passed to model
INITIALIZATION.
  SELECTION-SCREEN BEGIN OF BLOCK rad1.
  PARAMETERS: p_num1  TYPE i,
              p_num2  TYPE i,
              "Checbox controls if output is a write or message
              p_chk   AS CHECKBOX,
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
  "It is like a series of dominos. make object of model and assign inputs
  DATA(lo_calmodel) = NEW lcl_calmodel( im_num1 = p_num1
                                         im_num2 = p_num2
                                         im_flag = lv_flag ).
  "Make object of controller and pass in object of model
  DATA(lo_calcontrol) = NEW lcl_calcontr( smodel = lo_calmodel ).
  "Do the math to generate values
  lo_calcontrol->domath( ).
  "Make object of view and pass in controller
  DATA(lo_calview) = NEW lcl_calview( g_calcontr = lo_calcontrol ).
  "Checkbox value determines which method is called
  IF p_chk is INITIAL.
  lo_calview->writedisplay( ).
  Else.
  lo_calview->messagedisplay( ).
  ENDIF.
  "Nothing else follows Stop reading


  "I said "STOP"