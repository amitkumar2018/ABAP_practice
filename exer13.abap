*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER13
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_ABPTRAINSHU_EXER13.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER13
*Report Title: Offset and Length
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

"Comment: variable name plus how many positions over (how many characters displayed)

WRITE: 'First initial ', ls_taco-fname(1),
       / 'Last initial ', ls_taco-lname(1),
       / 'Birth Month ' , ls_taco-bday+4(2),
       / 'Birth Day ', ls_taco-bday+6(2),
       / 'Birth Year ', ls_taco-bday(4).