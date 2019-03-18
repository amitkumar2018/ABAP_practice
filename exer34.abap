*&---------------------------------------------------------------------*
*& Report Z_ABPTRAINSHU_EXER34
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*


REPORT z_abptrainshu_exer34.
************************************************************************
*Report Name: Z_ABPTRAINSHU_EXER33
*Report Title: Selection options
*User: Shu
*Date: 03182019
************************************************************************
TABLES:spfli.

DATA: i_flight TYPE STANDARD TABLE OF spfli,
      wa_flight TYPE spfli,
      lv_flight TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK block1.
PARAMETERS:  p_carrid TYPE spfli-carrid,
             p_connid  TYPE spfli-connid.
SELECTION-SCREEN END OF BLOCK block1.

SELECT mandt
       carrid
       connid
       countryfr
       cityfrom
       airpfrom
       countryto
       cityto
       airpto
       fltime
       deptime
       arrtime
       distance
       distid
       fltype
       period
  FROM spfli
  INTO CORRESPONDING FIELDS OF TABLE i_flight
  WHERE carrid = p_carrid
  AND connid = p_connid.


LOOP AT i_flight INTO wa_flight.

  WRITE: / 'client', wa_flight-mandt,
         / 'airline code', wa_flight-carrid,
         / 'flight connection number', wa_flight-connid,
         / 'country key', wa_flight-countryfr,
         / 'departure city', wa_flight-cityfrom,
         / 'Depature airport',wa_flight-airpfrom,
         / 'Country key', wa_flight-countryto,
         / 'Arrival City', wa_flight-cityto,
         / 'Destination Airport', wa_flight-airpto,
         / 'Flight time', wa_flight-fltime,
         / 'Departure time', wa_flight-deptime,
         / 'Arrival time', wa_flight-arrtime,
         / 'Distance', wa_flight-distance,
         / 'Unit of distance', wa_flight-distid,
         / 'flight type', wa_flight-fltype,
         / 'Arrival in days', wa_flight-period.

ENDLOOP.
WRITE: / sy-subrc.