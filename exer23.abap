*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER23
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer23.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER23
*Report Title: Check Statements
*User:Shu
*Date:03132019
************************************************************************
SELECTION-SCREEN BEGIN OF BLOCK rad1
  WITH FRAME TITLE text-001.

PARAMETERS: p_nloops TYPE i,
            p_thresh TYPE i.

SELECTION-SCREEN END OF BLOCK rad1.

DO p_nloops TIMES.
  IF sy-index > p_thresh.
    WRITE: / sy-index.
  ENDIF.
ENDDO.