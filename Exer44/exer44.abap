"Intro to ALV
"Shu
"03222019
REPORT z_abptrainshu_exer44.

TYPES: BEGIN OF t_person,
         fname(15)    TYPE c,
         lname(15)    TYPE c,
         birthyear(4) TYPE i,
         age(4)      TYPE p,
       END OF t_person.

DATA: i_fieldcat TYPE slis_t_fieldcat_alv,
      i_person   TYPE STANDARD TABLE OF t_person.

i_person = Value #( ( fname = 'Jon' lname = 'Snow' birthyear = 1995 age = 24 )
                    ( fname = 'Thea' lname = ' the Destroyer' birthyear = 1994 age = 25 )
                    ( fname = 'Chelsea' lname = 'de Amo' birthyear = 1998 age = 21 )
                    ( fname = 'AyAron' lname = 'OG' birthyear = 1987 age = 31 ) ).

i_fieldcat = Value #( ( Fieldname = 'fname' seltext_l = 'First Name' )
                      ( Fieldname = 'lname' seltext_l = 'Last Name' )
                      ( Fieldname = 'birthyear' seltext_l = 'Birth Year' )
                      ( Fieldname = 'age' seltext_l = 'Age' ) ).


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    it_fieldcat  = i_fieldcat
  TABLES
    t_outtab      = i_person
  EXCEPTIONS
    program_error = 1
    OTHERS        = 2.
IF sy-subrc <> 0.
  MESSAGE |An error Occured!| TYPE 'E'.
ENDIF.