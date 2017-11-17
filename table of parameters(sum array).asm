; submitted by: manisha paruthi
; rollno 19
; table of parameters.
DATA SEGMENT

    ARRAY DW 1H,2H,3H,4H,5H         ;ARRAY
    SUM DW 0H                    ;SUM VARIABLE TO HOLD SUM OF ARRAY ELEMENTS
    TABLE DW 2DUP(0)             ;TABLE VARIABLE TOHOLD ADDRESS OF SUM AND ARRAY 

DATA ENDS

STACK SEGMENT

    DW 100DUP(0)                 ;TOS :TOP OF STACK
    TOS LABEL WORD

STACK ENDS

CODE SEGMENT

    ASSUME DS:DATA,SS:STACK,CS:CODE

    START:

          MOV AX,DATA
          MOV DS,AX
          MOV AX,STACK                             ;POPULATING SS AND DS WITH ADRESS 
         MOV SS,AX                                 ;DATA AND STACK SEGMENt

          
          MOV AX,0
          MOV SP,OFFSET TOS                        ; use table of parameters to access
          MOV TABLE,OFFSET ARRAY                   ; array
          MOV TABLE+2,OFFSET SUM                   ; sum
          MOV BX,OFFSET TABLE                      ; mov address of table to bx register
          
          CALL SUMARRAY                           ; call sum array peocedure.
        
     
     SUMARRAY PROC NEAR                           ; SUMARRAY procedure.
        
        MOV SI,[BX]                               ; move address of array([bx]) in si
        MOV CX,5H                                 ; initialize counter
        MOV DI,[BX+2]                             ; move sum to di
       
       NEXT:
     
          ADD AX,[SI]
          INC SI
          INC SI
          LOOP NEXT 
     
          MOV [DI],AX                           ; stores result to sum.
     
     SUMARRAY ENDP
     
CODE ENDS

END START
\        