REPORT z_abptrainshu_exer52.

"Title MVC Calculator program
"Author: Shu
"Date 04/04/19

"Purpose: This is the main program. It will call both model and controller,
" and creates the basic views

" Exception Class
CLASS lcx_error DEFINITION
  INHERITING FROM cx_static_check.
ENDCLASS.
CLASS lcl_calmodel DEFINITION.
  PUBLIC SECTION.
    DATA: operation TYPE c.

    METHODS:
      calculate IMPORTING im1 TYPE i
                          im2 TYPE i
                CHANGING  ans TYPE i,
      constructor.
ENDCLASS.

CLASS lcl_calmodel IMPLEMENTATION.
  METHOD constructor.
    WRITE: / |SUPER Sonstructor|.
  ENDMETHOD.

  METHOD calculate.
    ans = 0.

    "ans is always 0 when children inherit and calls this method
    "Call child method that calculates correct ans
    WRITE: |Super Class Variable { ans } and stuff|.
  ENDMETHOD.
ENDCLASS.
"Title: Child Addition
"Author: shu
"Date: 04/11/2019
"Purpose: This is an child of the model class. It preforms the addition operation.

CLASS lcl_addition DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    "redefining calculate method on parent
    METHODS: calculate REDEFINITION,
      constructor,
      addition IMPORTING addim1 TYPE i
                         addim2 TYPE i
               CHANGING  addans TYPE i.
ENDCLASS.

CLASS lcl_addition IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: |Child Constructor.|.
  ENDMETHOD.

  "This gets called in calculate method
  METHOD addition.
    addans = addim1 + addim2.
    WRITE: | { addans } |.
  ENDMETHOD.

  "Calculate uses the parent and adds the child method
  METHOD calculate.
    super->calculate( EXPORTING
                               im1 = im1
                               im2 = im2
                      CHANGING ans = ans ).
    me->addition(      EXPORTING
                               addim1 = im1
                               addim2 = im2
                      CHANGING addans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Child Subtraction
"Author: shu
"Date04/11/2019
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments

CLASS lcl_subtraction DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      constructor,
      subtraction IMPORTING subim1 TYPE i
                            subim2 TYPE i
                  CHANGING  subans TYPE i.
ENDCLASS.

CLASS lcl_subtraction IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: |Child Constructor.|.
  ENDMETHOD.
  METHOD subtraction.
    subans = subim1 - subim2.
    WRITE: | { subans } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                                im2 = im2
                      CHANGING  ans = ans ).
    me->subtraction( EXPORTING
                 subim1 = im1
                 subim2 = im2
                 CHANGING subans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Child Subtraction
"Author: shu
"Date:04/11/2019
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments
CLASS lcl_multiplication DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      constructor,
      multiplication IMPORTING multiim1 TYPE i
                               multiim2 TYPE i
                     CHANGING  multians TYPE i.
ENDCLASS.

CLASS lcl_multiplication IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: |Child Constructor.|.
  ENDMETHOD.
  METHOD multiplication.
    multians = multiim1 * multiim2.
    WRITE: | { multians } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                               im2 = im2
                      CHANGING ans = ans ).
    me->multiplication( EXPORTING
                 multiim1 = im1
                 multiim2 = im2
                 CHANGING multians = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Child Subtraction
"Author: shu
"Date: 04/11/2019
"Purpose: This is an child of the model class.
"It preforms the subtraction operation.
"See Z_ABPTRAINSHU_EXER51_ADD for more comments

CLASS lcl_division DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      constructor,
      division IMPORTING divim1 TYPE i
                         divim2 TYPE i
               CHANGING  divans TYPE i.
ENDCLASS.

CLASS lcl_division IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: |Child Constructor.|.
  ENDMETHOD.
  METHOD division.
    divans = divim1 / divim2.
    WRITE: | { divans } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                                im2 = im2
                      CHANGING  ans = ans ).
    me->division( EXPORTING
                 divim1 = im1
                 divim2 = im2
                 CHANGING divans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Child Subtraction
"Author: shu
"Date:04/11/2019
"Purpose: This is an child of the model class.
"It preforms the Modulus operation.
"See Z_ABPTRAINSHU_EXER50_ADD for more comments

CLASS lcl_modulus DEFINITION INHERITING FROM lcl_calmodel.
  PUBLIC SECTION.
    METHODS: calculate REDEFINITION,
      constructor,
      modulus IMPORTING modim1 TYPE i
                        modim2 TYPE i
              CHANGING  modans TYPE i.
ENDCLASS.

CLASS lcl_modulus IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: |Child Constructor.|.
  ENDMETHOD.
  METHOD modulus.
    modans = modim1 / modim2.
    WRITE: | { modans } |.
  ENDMETHOD.

  METHOD calculate.
    super->calculate( EXPORTING im1 = im1
                                im2 = im2
                      CHANGING  ans = ans ).
    me->modulus( EXPORTING
                 modim1 = im1
                 modim2 = im2
                 CHANGING modans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Addition Controller
"Author: Shu
"Date: 04/11/2019
"Purpose: This controller controllers the addition behavior
*************************************************************************************************
CLASS lcl_cntrladd DEFINITION.
  PUBLIC SECTION.
    "Figuring out I need 4 controllers for the four models was a pain.
    "Main limitation was the type ref to's
    DATA: s_addmodel TYPE REF TO lcl_addition.
    METHODS: constructor IMPORTING saddmodel TYPE REF TO lcl_addition,
      doadd IMPORTING addim1 TYPE i
                      addim2 TYPE i
            CHANGING  ans    TYPE i.
ENDCLASS.
CLASS lcl_cntrladd IMPLEMENTATION.
  METHOD constructor.
    me->s_addmodel = saddmodel.
  ENDMETHOD.
  METHOD doadd.
    me->s_addmodel->calculate( EXPORTING im1 = addim1
                                         im2 = addim2
                               CHANGING  ans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Subtraction Controller
"Author: Shu
"Date: 04/11/2019
"Purpose: This controller controllers the subtraction behavior
"See Z_ABPTRAINSHU_EXER51_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrlsub DEFINITION.
  PUBLIC SECTION.
    DATA: s_submodel TYPE REF TO lcl_subtraction.
    METHODS: constructor IMPORTING ssubmodel TYPE REF TO lcl_subtraction,
      dosubtraction IMPORTING subim1 TYPE i
                              subim2 TYPE i
                    CHANGING  ans    TYPE i.
ENDCLASS.
CLASS lcl_cntrlsub IMPLEMENTATION.
  METHOD constructor.
    me->s_submodel = ssubmodel.
  ENDMETHOD.
  METHOD dosubtraction.
    me->s_submodel->calculate( EXPORTING im1 = subim1
                                         im2 = subim2
                               CHANGING  ans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Multiplication Controller
"Author: Shu
"Date: 04/11/2019
"Purpose: This controller controllers the multiplication behavior
"See Z_ABPTRAINSHU_EXER51_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrlmulti DEFINITION.
  PUBLIC SECTION.
    DATA: s_multimodel TYPE REF TO lcl_multiplication.
    METHODS: constructor IMPORTING smultimodel TYPE REF TO lcl_multiplication,
      domultiply IMPORTING multiim1 TYPE i
                           multiim2 TYPE i
                 CHANGING  ans      TYPE i.
ENDCLASS.
CLASS lcl_cntrlmulti IMPLEMENTATION.
  METHOD constructor.
    me->s_multimodel = smultimodel.
  ENDMETHOD.
  METHOD domultiply.
    me->s_multimodel->calculate( EXPORTING im1 = multiim1
                                           im2 = multiim2
                                CHANGING  ans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: Division Controller
"Author: Shu
"Date: 04/08/2019
"Purpose: This controller controllers the division behavior
"See Z_ABPTRAINSHU_EXER51_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrldiv DEFINITION.
  PUBLIC SECTION.
    DATA: s_divmodel TYPE REF TO lcl_division.
    METHODS: constructor IMPORTING sdivmodel TYPE REF TO lcl_division,
      dodivision IMPORTING divim1 TYPE i
                           divim2 TYPE i
                 CHANGING  ans    TYPE i.
ENDCLASS.
CLASS lcl_cntrldiv IMPLEMENTATION.
  METHOD constructor.
    me->s_divmodel = sdivmodel.
  ENDMETHOD.
  METHOD dodivision.
    me->s_divmodel->calculate( EXPORTING im1 = divim1
                                         im2 = divim2
                               CHANGING  ans = ans ).
  ENDMETHOD.
ENDCLASS.
"Title: modision Controller
"Author: Shu
"Date: 04/11/2019
"Purpose: This controller controllers the modulus behavior
"See Z_ABPTRAINSHU_EXER51_CNTRADD for comments of functionality
*************************************************************************************************
CLASS lcl_cntrlmod DEFINITION.
  PUBLIC SECTION.
    DATA: s_modmodel TYPE REF TO lcl_modulus.
    METHODS: constructor IMPORTING smodmodel TYPE REF TO lcl_modulus,
      domodulus IMPORTING modim1 TYPE i
                          modim2 TYPE i
                CHANGING  ans    TYPE i.
ENDCLASS.
CLASS lcl_cntrlmod IMPLEMENTATION.
  METHOD constructor.
    me->s_modmodel = smodmodel.
  ENDMETHOD.
  METHOD domodulus.
    me->s_modmodel->calculate( EXPORTING im1 = modim1
                                         im2 = modim2
                               CHANGING  ans = ans ).
  ENDMETHOD.
ENDCLASS.
"Create parameter screen. intergers will be passed to model

INITIALIZATION.
  DATA: oref          TYPE REF TO cx_root,
        extext        TYPE string,
        lv_useraction TYPE i,
        lv_ans        TYPE i.

  CLEAR: lv_useraction,
         lv_ans.

  SELECTION-SCREEN BEGIN OF BLOCK rad1
                            WITH FRAME TITLE title.
  "Tired something a little different.
  "I wanted to add lables for content without having to use text symbols
  "I placed comments before the parameters so The label will
  "be right of the field.
  "Then I had to write another initilaztion event to declare the comments
  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) input1 FOR FIELD p_num1.
  PARAMETERS: p_num1 TYPE i.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) input2 FOR FIELD p_num2.
  PARAMETERS:p_num2 TYPE i.
  SELECTION-SCREEN END OF LINE.

  "Checbox controls if output is a write or message
  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) add FOR FIELD p_sum.
  PARAMETERS: p_sum  AS CHECKBOX USER-COMMAND 1.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) sub FOR FIELD p_diff.
  PARAMETERS: p_diff AS CHECKBOX USER-COMMAND 2.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) multi FOR FIELD p_prod.
  PARAMETERS:p_prod AS CHECKBOX USER-COMMAND 3.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) div FOR FIELD p_quot.
  PARAMETERS:p_quot AS CHECKBOX USER-COMMAND 4.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN COMMENT (18) mod FOR FIELD p_modu.
  PARAMETERS:p_modu AS CHECKBOX USER-COMMAND 5.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN END OF BLOCK rad1.

INITIALIZATION.
  title = |Eat it Aaron!|.
  input1 = |Enter First Value|.
  input2 = |Enter Second Value|.
  add = |Addition|.
  sub = |Subtraction|.
  multi = |Mulitiplication|.
  div = |Division|.
  mod = |Modulus|.

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
*  IF ( p_num1 IS INITIAL ) OR ( p_num2 IS INITIAL ).
*    MESSAGE: | Please enter a value | TYPE 'E'.
*  ENDIF.
  TRY.
      IF ( p_num1 > 100 OR p_num1 < 0 ) OR ( p_num2 > 100 OR p_num2 < 0 ).
        RAISE EXCEPTION TYPE lcx_error.
      ENDIF.
    CATCH lcx_error.
      MESSAGE: |Values must be between 0 - 100| TYPE 'W'.
  ENDTRY.

  "title: This is the super/parent class
  "Author: Shu
  "Date: 4/11/2019
  "Purpose: This is the super/parent class.
  "The four operations inherit this class


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