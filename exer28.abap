*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER28
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer28.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER28
*Report Title: Populate and Display Internal Tables
*User: Shu
*Date:03152019
************************************************************************

"Create Structure kindof like a model in c#
TYPES: BEGIN OF l_person,
         lv_fname TYPE string,
         lv_lname TYPE string,
         lv_byear TYPE i,
         lv_index TYPE sy-index,
       END OF l_person.

"Create Standard table and variables used in the loop.
DATA: i_person_table TYPE STANDARD TABLE OF l_person,
      l_tlines TYPE i,
      l_year TYPE i,
      l_age TYPE i.

"Form for user input
PARAMETERS: p_fname TYPE string,
              p_lname TYPE string,
              p_byear TYPE i,
              p_count TYPE i.

"Created Field Symbol The field-symbol is much like a pointer,
"but one that you can only access in a dereferenced form.
" In other words, it will hold, internally,
"the memory address of the variable that was assigned to it,
"but it will not allow you to see the memory address,
"only the data that is stored in the variable that it points to.
" This can be proved, because if you change the contents of a
"field-symbol that points to an internal table line,
"you'll see that the changes will be made directly in the line
FIELD-SYMBOLS: <fs_person> TYPE l_person.

"Loop by user input
DO p_count TIMES.
  "Insert into table
  APPEND INITIAL LINE TO i_person_table ASSIGNING <fs_person>.
  <fs_person>-lv_fname = p_fname.
  <fs_person>-lv_lname = p_lname.
  <fs_person>-lv_byear = p_byear.
  <fs_person>-lv_index = sy-index.

  "Calculate age and year
  l_year = sy-datum+0(4) - sy-tabix.
  l_age =  l_year - <fs_person>-lv_byear.

  "Output fields
  WRITE: / 'Year ', l_year, 'Age ', l_age,
         / <fs_person>-lv_fname,
          <fs_person>-lv_lname,
          <fs_person>-lv_byear,
         / <fs_person>-lv_index.
ENDDO.
UNASSIGN <fs_person>.

"table to lines
DESCRIBE TABLE i_person_table LINES l_tlines.
WRITE: / l_tlines.