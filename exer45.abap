"Intro to OOP
"Shu
"03252019

REPORT z_abptrainshu_exer45.

"Parameters for user input
PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i,
            p_num3 TYPE i.

"On program load create these variables
INITIALIZATION.
  DATA: lv_add12 TYPE i,
        lv_add23 TYPE i,
        lv_sub12 TYPE i,
        lv_sub23 TYPE i.

  Clear: lv_add12,
         lv_add23,
         lv_sub12,
         lv_sub23.

"At user input screen, assign these values and input validation
AT SELECTION-SCREEN.
  CALL FUNCTION 'ZABPTRAINSHU_EXER45A'
    EXPORTING
      im_num1 = p_num1
      im_num2 = p_num2
      im_num3 = p_num3.

"at user execute assign exports to local variables
START-OF-SELECTION.
  CALL FUNCTION 'ZABPTRAINSHU_EXER45B'
    IMPORTING
      em_add12 = lv_add12
      em_add23 = lv_add23.
  CALL FUNCTION 'ZABPTRAINSHU_EXER45C'
    IMPORTING
      em_sub12 = lv_sub12
      em_sub23 = lv_sub23.

"Write outputs
  WRITE: / |Sum 1 and 2 { lv_add12 } |,
         / |Sum 2 and 3 { lv_add23 } |,
         / |Subtract 1 and 2 { lv_sub12 } |,
         / |Subtract 2 and 3 { lv_sub23 } |.