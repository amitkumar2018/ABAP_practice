*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER20
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer20.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER20
*Report Title:
*User: Shu
*Date:03132019
************************************************************************

DATA: lv_diff TYPE p, "example variable
      lv_diff2 TYPE p, "Shu variable
      lv_date_1 TYPE sy-datum,
      lv_date_2 TYPE sy-datum,
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

* Initialize to value of System Date

lv_date_1 = sy-datum.
lv_date_2 = sy-datum.
lv_num1 = p_num1.
lv_num2 = p_num2.

*Set date 2 to first day of current month
lv_date_2+6(2) = '01'.

*Set date 2 to last day to previous month
lv_date_2 = lv_date_2 - 1.

*Calculate difference in days

lv_diff = lv_date_1 - lv_date_2.

"Reports
lv_sum = lv_num1 + lv_num2.
lv_diff2 = lv_num1 - lv_num2.
lv_prod = lv_num1 * lv_num2.
lv_quot = lv_num1 / lv_num2.
lv_squot = lv_quot.
SHIFT lv_squot RIGHT DELETING TRAILING '0'.
lv_mod = lv_num1 MOD lv_num2.

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

"Case
CASE lv_flag.
  WHEN '+'.
    WRITE: 'Sum ', lv_sum.
  WHEN '-'.
    WRITE: 'Subtract ', lv_diff2.
  WHEN '*'.
    WRITE: 'Multiply ', lv_prod.
  WHEN '/'.
    WRITE: 'Division', lv_quot.
  WHEN '%'.
    WRITE: 'Modulus ', lv_mod.
  WHEN OTHERS.
    WRITE:'Please select a button'.
ENDCASE.