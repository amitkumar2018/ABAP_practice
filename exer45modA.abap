FUNCTION zabptrainshu_exer45a.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_NUM1) TYPE  I
*"     REFERENCE(IM_NUM2) TYPE  I
*"     REFERENCE(IM_NUM3) TYPE  I
*"----------------------------------------------------------------------
*Data: im_num1 type i,
*      im_num2 type i,
*      im_num3 type i.

  CLEAR: gv_num1,
         gv_num2,
         gv_num3.

  IF ( im_num1 IS NOT INITIAL AND im_num1 > 100 OR  im_num1 < 0 )
     OR ( im_num2 IS NOT INITIAL AND im_num2 > 100 OR im_num2 < 0 )
    OR ( im_num3 IS NOT INITIAL AND im_num3 > 100 OR im_num3 < 0 ).
    MESSAGE |Values must be between 0 and 100| TYPE 'E'.
    ELSEIF ( im_num1 is INITIAL )
      or ( im_num2 is initial )
      or ( im_num3 is initial ).
      Message: | All Fields must be completed | TYPE 'E'.
  ELSE.
    gv_num1 = im_num1.
    gv_num2 = im_num2.
    gv_num3 = im_num3.
  ENDIF.



ENDFUNCTION.