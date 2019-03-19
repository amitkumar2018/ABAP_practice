*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER36
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT z_abptrainshu_exer36.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER36
*Report Title: Join
*User: Shu
*Date: 03192019
************************************************************************
"Structure for work area
TYPES: BEGIN OF lty_something,
       carrid TYPE sflight-carrid,
       carrname TYPE scarr-carrname,
       connid TYPE sflight-connid,
       fldate TYPE sflight-fldate,
       url TYPE scarr-url,
  END OF lty_something.

"object of table
DATA: lt_table TYPE STANDARD TABLE OF lty_something,
      "optional table to loop into
      lwa_fill TYPE lty_something.

"field symbols is more maintainable than wa
FIELD-SYMBOLS:<lfs_name> TYPE lty_something.

"select with aliases
SELECT a~carrid
       a~connid
       a~fldate
       b~carrname
       b~url
  FROM sflight as a INNER JOIN scarr As b
  ON a~carrid = b~carrid
  INTO CORRESPONDING FIELDS OF TABLE lt_table
  WHERE a~carrid = 'LH'
  AND a~connid = 401.

"loop in fs, may have to clear if using wa instead of fs
LOOP AT lt_table ASSIGNING <lfs_name>.
  WRITE:  / <lfs_name>-carrid,
          / <lfs_name>-connid,
          / <lfs_name>-fldate,
          / <lfs_name>-carrname,
          / <lfs_name>-url.
ENDLOOP.

"unassign fs to release memory
UNASSIGN: <lfs_name>.

"check for errors.
WRITE:sy-subrc.