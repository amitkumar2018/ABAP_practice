REPORT z_abptrainshu_exer50_program.
INCLUDE z_abptrainshu_exer50_model.
INCLUDE z_abptrainshu_exer50_add.
INCLUDE z_abptrainshu_exer50_sub.
INCLUDE z_abptrainshu_exer50_mulit.
INCLUDE z_abptrainshu_exer50_division.
*INCLUDE z_abptrainshu_exer50_control. "no longer needed, wrote four controllers
INCLUDE z_abptrainshu_exer50_cntradd.
INCLUDE z_abptrainshu_exer50_cntrsub.
INCLUDE z_abptrainshu_exer50_cntrmulti.
INCLUDE z_abptrainshu_exer50_cntrdiv.
*INCLUDE z_abptrainshu_exer50_view. "Super class has a write statement
"Title MVC Calculator program
"Author: Shu
"Date 04/04/19

"Purpose: This is the main program. It will call both model and controller,
" and creates the basic views

"Create parameter screen. intergers will be passed to model

INITIALIZATION.
  DATA: lv_flag TYPE c,
        lv_ans  TYPE i.

  CLEAR: lv_flag,
         lv_ans.

  SELECTION-SCREEN BEGIN OF BLOCK rad1.
  PARAMETERS: p_num1 TYPE i,
              p_num2 TYPE i,
              "Checbox controls if output is a write or message
              "p_chk serves no purpose in this program since model create write statements
              p_chk  AS CHECKBOX,
              p_sum  AS CHECKBOX,
              p_diff AS CHECKBOX,
              p_prod AS CHECKBOX,
              p_quot AS CHECKBOX.

  SELECTION-SCREEN END OF BLOCK rad1.

START-OF-SELECTION.
  "Create objects after user define inputs
  "Change flag for case in model
  IF p_sum IS NOT INITIAL.
    "Set flag but truthfully, the code is written where setting flag in unnecessary
    lv_flag = '+'.
    DATA(lo_addmodel) = NEW lcl_addition( ).
    "I don't need to pass anything into the model. Values get pass from controller
*    lo_addmodel->addition( EXPORTING addim1 = p_num1
*                                     addim2 = p_num2
*                            CHANGING addans = lv_ans
    "load constructor         ).
    DATA(lo_sddcontroller) = NEW lcl_cntrladd( saddmodel = lo_addmodel ).
    "call method that calls inherited method on the add child.
    "Two write statements. One from the super and the other from the subclass
    lo_sddcontroller->doadd( EXPORTING addim1 = p_num1
                                        addim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_diff IS NOT INITIAL.
    lv_flag = '-'.
    DATA(lo_submodel) = NEW lcl_subtraction( ).
*    lo_submodel->subtraction( EXPORTING subim1 = p_num1
*                                     subim2 = p_num2
*                            CHANGING subans = lv_ans          ).
    DATA(lo_subcontroller) = NEW lcl_cntrlsub( ssubmodel = lo_submodel ).
    lo_subcontroller->dosubtraction( EXPORTING subim1 = p_num1
                                        subim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_prod IS NOT INITIAL.
    lv_flag = '*'.
    DATA(lo_multimodel) = NEW lcl_multiplication( ).
*    lo_multimodel->multiplication( EXPORTING multiim1 = p_num1
*                                     multiim2 = p_num2
*                            CHANGING multians = lv_ans ).
    DATA(lo_multicontroller) = NEW lcl_cntrlmulti( smultimodel = lo_multimodel ).
    lo_multicontroller->doMultiply( EXPORTING multiim1 = p_num1
                                        multiim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_quot IS NOT INITIAL.
    lv_flag = '/'.
    DATA(lo_divmodel) = NEW lcl_division( ).
*    lo_divmodel->division( Exporting divim1 = p_num1
*                                     divim2 = p_num2
*                            changing divans = lv_ans ).
    DATA(lo_divcontroller) = NEW lcl_cntrldiv( sdivmodel = lo_divmodel ).
    lo_divcontroller->doDivision( EXPORTING divim1 = p_num1
                                        divim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSE.
    WRITE: 'Please select a button'.
  ENDIF.