"Function modules
"Shu
"03212019

"Link messages
REPORT Z_ABPTRAINSHU_EXER42 Message-Id z_exer42.

"Event and parameters
SELECTION-SCREEN BEGIN OF BLOCK rad1.
PARAMETERS:
            p_num1 TYPE i,
            p_num2 TYPE i,
            rb_sum RADIOBUTTON GROUP g1,
            rb_diff RADIOBUTTON GROUP g1,
            rb_prod RADIOBUTTON GROUP g1,
            rb_quot RADIOBUTTON GROUP g1,
            rb_mod RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK rad1.

"event to check radio buttons
AT SELECTION-SCREEN.
  IF rb_quot IS NOT INITIAL AND p_num2 = 0.
    MESSAGE e002 WITH p_num2.
  ENDIF.
  IF rb_mod IS NOT INITIAL AND p_num2 = 0.
    MESSAGE e002 WITH p_num2.
  ENDIF.

"event to change flag
  Start-of-selection.
  "Change flag for case
  IF rb_sum IS NOT INITIAL.
    Data(lv_flag) = '+'.
  ELSEIF rb_diff IS NOT INITIAL.
    lv_flag = '-'.
  ELSEIF rb_prod IS NOT INITIAL.
    lv_flag = '*'.
  ELSEIF rb_quot IS NOT INITIAL.
    lv_flag = '/'.
  ELSEIF rb_mod IS NOT INITIAL.
    lv_flag = '%'.
  ELSE.
    WRITE: 'Please select a button'.
  ENDIF.

"call function module exports here are imports in function module
Call FUNCTION 'ZEXER43'
  EXPORTING
     im_num1     = P_num1
     im_num2     = p_num2
     im_flag     = lv_flag.