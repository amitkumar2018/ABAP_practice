*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER22
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_ABPTRAINSHU_EXER22.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER22
*Report Title: Do Loops
*User: Shu
*Date:03132019
************************************************************************
DATA: count type i value 13.

Do count times.
  Write: / 'Count ', count,
         / 'Sy-index ', Sy-index.
  ENDDO.