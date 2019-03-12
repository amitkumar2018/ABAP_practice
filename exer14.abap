*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER14
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_ABPTRAINSHU_EXER14.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER14
*Report Title: Concatenate
*User: Shu
*Date: 03122019
************************************************************************
TYPES: Begin Of us_profile,
       empnm TYPE n,
       fname TYPE string,
       lname TYPE string,
       bday TYPE d,
       dream_salary type n,
       hobbies TYPE string,
       END OF us_profile.

DATA: ls_taco TYPE us_profile.

      ls_taco-empnm = '11111'.
      ls_taco-fname = 'Shu'.
      ls_taco-lname = 'Sajid'.
      ls_taco-bday = '19770310'.
      ls_taco-dream_salary = '200000'.
      ls_taco-hobbies = 'Video Games'.

 DATA full_name Type string.

"https://help.sap.com/doc/abapdocu_751_index_htm/7.51/en-US/abapconcatenate.htm
CONCATENATE ls_taco-fname ls_taco-lname INTO full_name SEPARATED BY space.

Write: full_name.