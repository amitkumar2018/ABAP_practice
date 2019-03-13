*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER19
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer19.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER19
*Report Title: String Comparison Operators
*User:Shu
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
      lv_num1 TYPE p LENGTH 10,
      lv_num2 TYPE p LENGTH 10.

SELECTION-SCREEN BEGIN OF BLOCK rad1
                WITH FRAME TITLE text-001.
PARAMETERS:
            p_num1 TYPE i,
            p_num2 TYPE i,
            cb_sum AS CHECKBOX,
            cb_diff AS CHECKBOX,
            cb_prod AS CHECKBOX,
            cb_quot AS CHECKBOX,
            cb_mod AS CHECKBOX.
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


"conditionals
IF cb_sum = abap_true.
  WRITE: 'Sum ', lv_sum.
ELSEIF cb_diff = abap_true.
  WRITE: 'Subtract ', lv_diff2.
ELSEIF cb_prod = abap_true.
  WRITE: 'Multiply ', lv_prod.
ELSEIF cb_quot = abap_true.
  WRITE: 'Division', lv_quot.
ELSEIF cb_mod = abap_true.
  WRITE: 'Modulus ', lv_mod.
ELSE.
  WRITE:'Please select a checkbox'.
ENDIF.
