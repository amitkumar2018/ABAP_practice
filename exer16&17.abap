*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER16
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer16.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER16
*Report Title:
*User:Shu
*Date:03132019
************************************************************************
SELECTION-SCREEN BEGIN OF BLOCK rad1
                WITH FRAME TITLE text-001.
PARAMETERS: p_empnum TYPE i,
            p_fname TYPE c LENGTH 20,
            p_lname TYPE c LENGTH 20,
            p_bday TYPE d,
            p_salary TYPE n LENGTH 10,
            rb_male RADIOBUTTON GROUP g1,
            rb_femal RADIOBUTTON GROUP g1,
            cb_drive AS CHECKBOX,
            p_hobby TYPE c LENGTH 20.
SELECTION-SCREEN END OF BLOCK rad1.
"Length has no effect on types d and string