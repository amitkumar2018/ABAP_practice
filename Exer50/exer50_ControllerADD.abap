"Title: Addition Controller
"Author: Shu
"Date: 04/08/2019
"Purpose: This controller controllers the addition behavior
*************************************************************************************************
CLASS lcl_cntrladd DEFINITION.
  PUBLIC SECTION.
  "Figuring out I need 4 controllers for the four models was a pain.
  "Main limitation was the type ref to's
    DATA: s_addmodel TYPE REF TO lcl_addition.
    METHODS: constructor IMPORTING saddmodel TYPE REF TO lcl_addition,
             doAdd importing addim1 type i
                             addim2 type i
                   changing  ans    type i.
ENDCLASS.
CLASS lcl_cntrladd IMPLEMENTATION.
  METHOD constructor.
    me->s_addmodel = saddmodel.
  ENDMETHOD.
  METHOD doAdd.
    me->s_addmodel->calculate( exporting im1 = addim1
                                         im2 = addim2
                               Changing  ans = ans ).
    ENDMETHOD.
ENDCLASS.