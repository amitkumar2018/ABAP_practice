FUNCTION ZEXER43.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_NUM1) TYPE  I
*"     REFERENCE(IM_NUM2) TYPE  I
*"     REFERENCE(IM_FLAG) TYPE  C
*"----------------------------------------------------------------------


CASE im_flag.
    WHEN '+'.
  data(lv_sum) = im_num1 + im_num2.
      WRITE: |Sum { lv_sum }|.
    WHEN '-'.
    data(lv_diff) = im_num1 - im_num2.
      WRITE: |Subtract { lv_diff }|.
    WHEN '*'.
    data(lv_prod) = im_num1 * im_num2.
      WRITE: |Multiply { lv_prod }|.
    WHEN '/'.
    data(lv_quot) = im_num1 / im_num2.
      WRITE: |Division { lv_quot }|.
    WHEN '%'.
     data(lv_mod) = im_num1 MOD im_num2.
      WRITE: |Modulus { lv_mod }|.
    WHEN OTHERS.
      WRITE:'Please select a button'.
  ENDCASE.


ENDFUNCTION.