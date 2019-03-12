*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER10
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer10.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER10
*Report Title: Constants
*User: Shu
*Date: 03122019
************************************************************************

DATA: text1 TYPE c LENGTH 20,
      text2 TYPE string.

CONSTANTS lc_number TYPE i VALUE 100.
CONSTANTS lc_birthdate TYPE d VALUE '19770310'.
CONSTANTS lc_dream_salary TYPE n LENGTH 9 VALUE '200000.15'.
CONSTANTS lc_hobby TYPE string VALUE 'Video Games'.

text1 = 'The number'.
text2 = 'is an interger'.

WRITE: text1, lc_number, text2,
 / lc_birthdate,
 / lc_dream_salary,
 / lc_hobby.