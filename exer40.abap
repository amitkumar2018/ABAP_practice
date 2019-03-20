*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER40
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer40 MESSAGE-ID z_exer40.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER40
*Report Title: Load program event
*User: Shu
*Date: 03192019
************************************************************************

"Structure for work area.
"Only doing this for the write later even though it is not required
"Using data obtained, get Airline Code, Flight Connection Number,
" Flight date, Airfare and Local currency of airline from table SFLIGHT.

TYPES: BEGIN OF lty_spfli,
       carrid TYPE spfli-carrid,
       connid TYPE spfli-connid,
  END OF lty_spfli,

BEGIN OF lty_sflight,
       carrid TYPE sflight-carrid,
       connid TYPE sflight-connid,
       fldate TYPE sflight-fldate,
       price TYPE  sflight-price,
       currency TYPE sflight-currency,
  END OF lty_sflight.

"Table to fill with sql and loop from
DATA: lt_spfli TYPE STANDARD TABLE OF lty_spfli,
      lt_sflight TYPE STANDARD TABLE OF lty_sflight.


"Field Symbol to loop at
FIELD-SYMBOLS:<fs_sflight> TYPE lty_sflight.

LOAD-OF-PROGRAM.
  IF sy-tcode <> 'SE93'.
      MESSAGE X000.
  ENDIF.


"SQL statement from first table
SELECT carrid
       connid
  FROM spfli
  INTO TABLE lt_spfli.

"SQL statement from second statement
SELECT carrid
       connid
       fldate
       price
       currency
  FROM sflight
  INTO CORRESPONDING FIELDS OF TABLE lt_sflight
  FOR ALL ENTRIES IN lt_spfli
  WHERE carrid = lt_spfli-carrid
  AND   connid = lt_spfli-connid.

"check correct function
WRITE: sy-subrc.

"Loop to write contents
LOOP AT lt_sflight ASSIGNING <fs_sflight>.
  WRITE:  / <fs_sflight>-carrid,
          / <fs_sflight>-connid,
          / <fs_sflight>-fldate,
          / <fs_sflight>-price,
          / <fs_sflight>-currency.
ENDLOOP.

"Release memory from fs
UNASSIGN <fs_sflight>.