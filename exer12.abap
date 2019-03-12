*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER12
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer12.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER12
*Report Title:
*User:Shu
*Date:03122019
************************************************************************
TYPES: BEGIN OF ts_profile,
      empnm TYPE n,
      fname TYPE string,
      lname TYPE string,
      END OF ts_profile.

TYPES: BEGIN OF ls_food,
       amount TYPE n,
       name TYPE string,
       catergory TYPE string,
       END OF ls_food.

DATA: wa_profile TYPE ts_profile.
DATA: wf_profile TYPE ls_food.

wf_profile-amount = 1.
wf_profile-name = 'Steak'.
wf_profile-catergory = 'Beef'.
wa_profile-empnm = '1234567890'.
wa_profile-fname = 'First'.
wa_profile-lname = 'Last'.

WRITE: 'amount', wf_profile-amount,
       / 'Name', wf_profile-name,
       / 'Catergory', wf_profile-catergory,
       / 'Number', wa_profile-empnm,
       / 'fname', wa_profile-fname,
       / 'lname', wa_profile-lname.