*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER30
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer30.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER30
*Report Title: Select
*User:Shu
*Date: 03182019
************************************************************************
"class
TYPES: BEGIN OF ts_spfli,
       carrid TYPE spfli-carrid,
       connid TYPE spfli-connid,
       countryfr TYPE spfli-countryfr,
  END OF ts_spfli.

"object
DATA: wa_spfli TYPE ts_spfli.

"Fill object and write to check object
SELECT carrid
       connid
       countryfr
  FROM spfli
  INTO wa_spfli.
  Write: wa_spfli-carrid.
ENDSELECT.