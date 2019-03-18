*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER32
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer32.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER32
*Report Title: Select One
*User: Shu
*Date: 03182019
************************************************************************
" object type of table
DATA: wa_spfli TYPE spfli.

"SQL select single in object
SELECT SINGLE mandt
              carrid
              connid
              countryfr
              cityfrom
              airpfrom
              countryto
              cityto
              airpto
              fltime
              deptime
              arrtime
              distance
              distid
  from spfli
  into wa_spfli.

"system code to check for completion = 0
  Write sy-subrc.