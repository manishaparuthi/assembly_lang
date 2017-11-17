;submitted by: manisha paruthi
;rollno:  19
;Program to compute factorial of a number using recursion.


DATA SEGMENT

    ELEMENT DB 7H                  ;elemnt whose factorial is to be calculated.
    FACT    DW ?                   ; result of factorial.

DATA ENDS                        


CODE SEGMENT                  

    ASSUME DS:DATA CS:CODE

    START:                    


           MOV AX,DATA        ;populating ds with address of data segment. 
           MOV DS,AX

           XOR AX,AX               ;AX is initialised with 0
           MOV AX,1H              ;initialize ax with 1
           MOV DL,ELEMENT
           MOV DH,0H 
           CALL FACTORIAL          ;Calling the procedure
           


           
           FACTORIAL PROC         
            MOV BX,DX             ;Mov ELEMENT in the bx register
            CMP BX,1            ;Compare BX with 1
            JE EXIT             ;if bx is 1 jump to finish label
            MUL DL            ;otherwise multiply no by ax
            DEC DL            ;and decrease the no
            
            CALL FACTORIAL         ;calling function recursivey
           FACTORIAL ENDP          ;end of procedure
           
    EXIT:
        MOV FACT,AX      ;move the factorial in AX to result
CODE ENDS                     ;end of code segment 
END START                     ;end of programstart
