*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER33
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer33.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER33
*Report Title: Selection options
*User: Shu
*Date: 03182019
************************************************************************
TABLES:spfli.
Data wa_flight type spfli.
SELECTION-SCREEN BEGIN OF BLOCK block1.
PARAMETERS:  p_carrid TYPE spfli-carrid,
             p_connid  TYPE spfli-connid.
SELECTION-SCREEN END OF BLOCK block1.
SELECT * FROM spfli
  INTO wa_flight
  WHERE carrid = p_carrid
  AND connid = p_connid.
  write: wa_flight-cityto.
ENDSELECT.
Write: / sy-subrc.