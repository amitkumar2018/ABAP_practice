REPORT z_abptrainshu_exer9.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER9
*Report Title:
*User: Shu
*Date: 3-12-2019
************************************************************************
DATA: text1 TYPE c LENGTH 20,
      text2 TYPE string,
      number TYPE i.
text1 = 'The number'.
number = 100.
text2 = 'is an integer'.

WRITE: text1, number, text2.

DATA: lv_employee_number TYPE string,
      lv_first_name(10) TYPE c,
      lv_last_name(10) TYPE c,
      lv_birthdate TYPE sy-datum,
      lv_dream_salary(6) TYPE p
                          DECIMALS 2,
      lv_salary TYPE string,
      lv_hobby TYPE STRING
               VALUE 'Video Games'.


CLEAR: lv_employee_number,
       lv_first_name,
       lv_last_name,
       lv_birthdate,
lv_dream_salary.
"lv_hobby.

"Variable assignments
lv_employee_number = '11111'.
lv_first_name = 'Shu'.
lv_last_name = 'Sajid'.
lv_birthdate = '19770310'.
lv_dream_salary = '200000.50'.
lv_salary = lv_dream_salary.
CONDENSE: lv_salary.
WRITE: / '***************************************************',
       / lv_employee_number,
       / lv_first_name,
       / lv_last_name,
       / lv_birthdate,

       / lv_hobby,
       / lv_salary,
       / '*****************************************************'.