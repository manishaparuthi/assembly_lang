;submitted by:manisha paruthi
;rollno:19
;prog info
;convert 16 digit packed bcd no into unpacked bcd no.using rotate
DATA SEGMENT 
                   
    PACKED      DB  12H,34H,56H,78H,90H,23H,45H,67H   ;packed array
    UNPACKED    DB  16 DUP(?)                         ;unpacked array
    
DATA ENDS
            
            
          
CODE SEGMENT                                    ;code segment
    
    
    ASSUME  DS:DATA 
    ASSUME  CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,08H
            MOV SI,0 
            MOV DI,0 
            
    PTOUROTATE:
            XOR AX,AX 
		    MOV AL,PACKED[SI]
		    
		    ROL AX,4
		    ROR AL,4 
		    
		    MOV UNPACKED[DI], AH
		    INC DI
		    MOV UNPACKED[DI],AL
		    INC DI  
		     
		    INC SI  
		    
            LOOP PTOUROTATE  
            
            
CODE ENDS  
    END START



