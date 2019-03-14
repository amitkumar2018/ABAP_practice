*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER24
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer24 MESSAGE-ID ytestmsgid.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER24
*Report Title: Messages
*User: Shu
*Date: 03142019
************************************************************************

"SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
"PARAMETERS: p_field1 TYPE i,
"            p_field2 TYPE c,
"            p_field3 TYPE string.
"SELECTION-SCREEN END OF BLOCK b1.

"MESSAGE I001 WITH p_field1 p_field2 p_field3.

DATA: lv_diff2 TYPE p,
      lv_sum TYPE p,
      lv_prod TYPE p,
      lv_quot TYPE p DECIMALS 10 LENGTH 10,
      lv_squot TYPE string,
      lv_mod TYPE p,
      lv_flag TYPE c,
      lv_num1 TYPE p LENGTH 10,
      lv_num2 TYPE p LENGTH 10.

SELECTION-SCREEN BEGIN OF BLOCK rad1
                WITH FRAME TITLE text-001.
PARAMETERS:
            p_num1 TYPE i,
            p_num2 TYPE i,
            rb_sum RADIOBUTTON GROUP g1,
            rb_diff RADIOBUTTON GROUP g1,
            rb_prod RADIOBUTTON GROUP g1,
            rb_quot RADIOBUTTON GROUP g1,
            rb_mod RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK rad1.

INITIALIZATION.
  CLEAR: lv_diff2,
         lv_sum,
         lv_prod,
         lv_quot,
         lv_squot,
         lv_mod,
         lv_flag,
         lv_num1,
         lv_num2.

AT SELECTION-SCREEN.
  IF rb_quot IS NOT INITIAL AND p_num2 = 0.
    MESSAGE e002 WITH p_num2.
  ENDIF.
  IF rb_mod IS NOT INITIAL AND p_num2 = 0.
    MESSAGE e002 WITH p_num2.
  ENDIF.

START-OF-SELECTION.
"This is redundant to assign to another variable.
  lv_num1 = p_num1.
  lv_num2 = p_num2.

"Change flag for case
  IF rb_sum IS NOT INITIAL.
    lv_flag = '+'.
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

  "Case to change flag and do functions
  CASE lv_flag.
    WHEN '+'.
  lv_sum = lv_num1 + lv_num2.
      WRITE: 'Sum ', lv_sum.
    WHEN '-'.
      lv_diff2 = lv_num1 - lv_num2.
      WRITE: 'Subtract ', lv_diff2.
    WHEN '*'.
      lv_prod = lv_num1 * lv_num2.
      WRITE: 'Multiply ', lv_prod.
    WHEN '/'.
      lv_quot = lv_num1 / lv_num2.
        lv_squot = lv_quot.
  SHIFT lv_squot RIGHT DELETING TRAILING '0'.
      WRITE: 'Division', lv_quot.
    WHEN '%'.
      lv_mod = lv_num1 MOD lv_num2.
      WRITE: 'Modulus ', lv_mod.
    WHEN OTHERS.
      WRITE:'Please select a button'.
  ENDCASE.