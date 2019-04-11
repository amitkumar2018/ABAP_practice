REPORT z_abptrainshu_exer51_program.
INCLUDE z_abptrainshu_exer51_model.
INCLUDE z_abptrainshu_exer51_addmodel.
INCLUDE z_abptrainshu_exer51_submodel.
INCLUDE z_abptrainshu_exer51_multmodel.
INCLUDE z_abptrainshu_exer51_divmodel.
INCLUDE z_abptrainshu_exer51_modmodel.
INCLUDE z_abptrainshu_exer51_addcntrl.
INCLUDE z_abptrainshu_exer51_subcntrl.
INCLUDE z_abptrainshu_exer51_multcntrl.
INCLUDE z_abptrainshu_exer51_divcntrl.
INCLUDE z_abptrainshu_exer51_modcntrl.


"Title MVC Calculator program
"Author: Shu
"Date 04/04/19

"Purpose: This is the main program. It will call both model and controller,
" and creates the basic views

"Create parameter screen. intergers will be passed to model

INITIALIZATION.
  DATA:  lv_useraction TYPE i,
         lv_ans        TYPE i.

  CLEAR: lv_useraction,
         lv_ans.

  SELECTION-SCREEN BEGIN OF BLOCK rad1.
  PARAMETERS: p_num1 TYPE i,
              p_num2 TYPE i,
              "Checbox controls if output is a write or message
              p_sum  AS CHECKBOX USER-COMMAND 1,
              p_diff AS CHECKBOX USER-COMMAND 2,
              p_prod AS CHECKBOX USER-COMMAND 3,
              p_quot AS CHECKBOX USER-COMMAND 4,
              p_modu AS CHECKBOX USER-COMMAND 5.

  SELECTION-SCREEN END OF BLOCK rad1.

  "Event listeners on checkboxes
  "This is to check that only one checkbox and operation is selected

AT SELECTION-SCREEN ON:p_sum, p_diff, p_prod, p_quot, p_modu.
  "sy-ucomm changes to a string upon execution.
  "and the case still gets call at execution too
  "This conditional keeps useraction from being reassigned
  "to a string which cases errors
  IF sy-ucomm >< 'ONLI'.
    lv_useraction = sy-ucomm.
  ENDIF.
  "Case statement to ensure only one checkbox is selected
  CASE lv_useraction.
    WHEN 1.
      CLEAR: p_diff, p_prod, p_quot, p_modu.
    WHEN 2.
      CLEAR: p_sum, p_prod, p_quot, p_modu.
    WHEN 3.
      CLEAR: p_sum, p_diff, p_quot, p_modu.
    WHEN 4.
      CLEAR: p_sum, p_diff, p_prod, p_modu.
    WHEN 5.
      CLEAR: p_sum, p_diff, p_prod, p_quot.
  ENDCASE.

AT SELECTION-SCREEN.
  "Conditional to check is interger fields are empty
  IF ( p_num1 IS INITIAL ) OR ( p_num2 IS INITIAL ).
    MESSAGE: | Please enter a value | TYPE 'E'.
  ENDIF.

  "Upon having user input, this condtional is executed
START-OF-SELECTION.

  "Create objects after user define inputs
  "Change flag for case in model
  IF p_sum = abap_true.
    "Set flag but truthfully, the code is written where setting flag in unnecessary
    DATA(lo_addmodel) = NEW lcl_addition( ).
    "load constructor         ).
    DATA(lo_saddcontroller) = NEW lcl_cntrladd( saddmodel = lo_addmodel ).
    "call method that calls inherited method on the add child.
    "Two write statements. One from the super and the other from the subclass
    lo_saddcontroller->doadd( EXPORTING addim1 = p_num1
                                        addim2 = p_num2
                           CHANGING ans = lv_ans ).

  ELSEIF p_diff = abap_true.
    DATA(lo_submodel) = NEW lcl_subtraction( ).
    DATA(lo_subcontroller) = NEW lcl_cntrlsub( ssubmodel = lo_submodel ).
    lo_subcontroller->dosubtraction( EXPORTING subim1 = p_num1
                                        subim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_prod = abap_true.
    DATA(lo_multimodel) = NEW lcl_multiplication( ).
    DATA(lo_multicontroller) = NEW lcl_cntrlmulti( smultimodel = lo_multimodel ).
    lo_multicontroller->domultiply( EXPORTING multiim1 = p_num1
                                        multiim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_quot = abap_true.
    DATA(lo_divmodel) = NEW lcl_division( ).
    DATA(lo_divcontroller) = NEW lcl_cntrldiv( sdivmodel = lo_divmodel ).
    lo_divcontroller->dodivision( EXPORTING divim1 = p_num1
                                        divim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSEIF p_modu = abap_true.
    DATA(lo_modmodel) = NEW lcl_modulus( ).
    DATA(lo_modcontroller) = NEW lcl_cntrlmod( smodmodel = lo_modmodel ).
    lo_modcontroller->domodulus( EXPORTING modim1 = p_num1
                                        modim2 = p_num2
                           CHANGING ans = lv_ans ).
  ELSE.
    WRITE: |Please select an operation|.
  ENDIF.