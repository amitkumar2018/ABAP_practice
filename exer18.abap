*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER18
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer18.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER18
*Report Title: Date Calculations
*User:Shu
*Date:03132019
************************************************************************
DATA: lv_diff TYPE p,
      lv_diff2 TYPE p,
      lv_date_1 TYPE sy-datum,
      lv_date_2 TYPE sy-datum,
      lv_sum TYPE p,
      lv_prod TYPE p,
      lv_quot TYPE p DECIMALS 10 LENGTH 10,
      lv_squot TYPE string,
      lv_mod TYPE p,
      lv_num1 TYPE p LENGTH 10,
      lv_num2 TYPE p LENGTH 10.

* Initialize to value of System Date

lv_date_1 = sy-datum.
lv_date_2 = sy-datum.
lv_num1 = 150.
lv_num2 = 4.

*Set date 2 to first day of current month
lv_date_2+6(2) = '01'.

*Set date 2 to last day to previous month
lv_date_2 = lv_date_2 - 1.

*Calculate difference in days

lv_diff = lv_date_1 - lv_date_2.

lv_sum = lv_num1 + lv_num2.
lv_diff2 = lv_num1 - lv_num2.
lv_prod = lv_num1 * lv_num2.
lv_quot = lv_num1 / lv_num2.
lv_squot = lv_quot.
"lv_squot = trunc(lv_quot).
SHIFT lv_squot RIGHT DELETING TRAILING '0'.
"CONDENSE lv_squot.

lv_mod = lv_num1 MOD lv_num2.
WRITE:lv_diff,
      / lv_sum,
      / lv_diff2,
      / lv_prod,
      / lv_quot,
      / lv_squot,
      / lv_mod.