;submitted by:manisha paruthi
;rollno:19
;prog info
;convert 16 digit packed bcd no into unpacked bcd no.using shift


DATA SEGMENT
                    
    PACKED      DB  12H,34H,56H,78H,90H,23H,45H,67H
    UNPACKED    DB  16 DUP(?)
    
DATA ENDS

CODE SEGMENT
    
    ASSUME  DS:DATA , CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,08h
            MOV SI,0 
            MOV DI,0 
            
    PTOUSHIFT:
            XOR AX,AX 
	          MOV AL,PACKED[SI]
   	        INC SI
   	        
	          SHL AX,4
   	        SHR AL,4 
   	        
	        MOV UNPACKED[DI], AH
	        INC DI
	        MOV UNPACKED[DI],AL
	        INC DI       
	        
            LOOP PTOUSHIFT
CODE ENDS  
    END START