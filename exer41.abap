*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER41
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer41 MESSAGE-ID z_exer41.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER41
*Report Title:More Events
*User:Shu
*Date:03202019
************************************************************************
"Create a new program with an input parameter for CARRID
TYPES: BEGIN OF lty_output,
       carrid TYPE scarr-carrid,
       cityfrom TYPE spfli-cityfrom,
  END OF lty_output.

DATA:lt_output TYPE STANDARD TABLE OF lty_output.

FIELD-SYMBOLS:<fs_output> TYPE lty_output.

SELECTION-SCREEN BEGIN OF BLOCK block1.
PARAMETER: p_carrid(3) TYPE c.
SELECTION-SCREEN END OF BLOCK block1.
"Display an error message at the selection-screen
"if the CARRID value is not in table SCARR




AT SELECTION-SCREEN.
  SELECT a~carrid
       b~carrid
       b~cityfrom
  FROM scarr AS a INNER JOIN spfli AS b
  ON a~carrid = b~carrid
  INTO CORRESPONDING FIELDS OF TABLE lt_output
      WHERE a~carrid = p_carrid.
  IF
    sy-subrc >< 0.
    MESSAGE e000.
  ENDIF.

  START-OF-SELECTION.
  LOOP AT lt_output ASSIGNING <fs_output>.
    WRITE: / <fs_output>-carrid,
           / <fs_output>-cityfrom.
  ENDLOOP.



  "Display all the rows from SPFLI that match the inputted CARRID
  "You may choose which columns to display from SPFLI