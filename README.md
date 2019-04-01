# ABAP_practice
This repo serves to hold my ABAP training exercises. This readme serves to hold my fustrations about how all of this is easier in C#.

### Frequently used T-codes

SE11  "ABAP Dictionary"   
SE16  "Data Browser"  
SE16N "General Table Display" 
SE24  "Class Builder"  
SE37  "Function"  
SE38  "ABAP Editor"  
SE80  "Object Navigator"  
SE91  "Message Maintenance"  
SE93  "Maintain Transaction"  

SM30  "Maintain Table Views"   
SM36  "Define Background Job"    
SM37  "Simple Job Selection"      

MM01 "Create Material"  
MM02 "Change Material"  
MM03 "Display Material"  

XD01 "Customer Create"  
XD02 "Customer Change"  
XD03 "Customer Display"  

XK01 "Create Vendor"  
XK02 "Change Vendor"  
xk03 "Display Vendor"  

### Keyboard Shortcuts

CRTL+,  "Line and Block Comments"
CRTL+.  "Line and Block unCo

### Hackey way to get to SM36 if you don't have access

* Got to SE93
* Enter SM36 into the "Transaction Code" Field and hit F8
* Click the error message on bottom left and record message number info from pop up(for me this is EU059)
* type "/h" in top box and hit enter
* then hit F8 to start debugger
* In Debugger, got to breakpoints->Breakpoint at -> Breakpoint at message 
* Enter the number from previous error message into "Number" Field (not ID)
* Enter first letter from previous error message into TY. field and hit enter
* Hit F8 to bring you the message line
* on the line above selected line, click to set breakpoint
* Right click on breakpoint ad select "goto statement"
* Select "Desktop 3" in debugger window
* Click `sy-subrc` and it will populate into the left window.
* in the left window, click on the edit/ pencil button
* Change the value of sy-subrc from 4 to 0 and hit enter
* F8 to countine program and now you should have access
