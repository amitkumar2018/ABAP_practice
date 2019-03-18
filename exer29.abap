*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER29
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer29.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER29
*Report Title: Select SQL
*User: Shu
*Date:03182019
************************************************************************
"type of table
DATA: wa_spfli TYPE spfli.

"Table into object, write field of object
SELECT * FROM spfli
  INTO wa_spfli.
  WRITE: wa_spfli-mandt.
ENDSELECT.