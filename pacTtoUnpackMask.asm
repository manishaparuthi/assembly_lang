;submitted by:manisha paruthi
;rollno:19
;prog info
;convert 16 digit packed bcd no into unpacked bcd no.using masking
DATA SEGMENT
                    
    PACKED      DB  19H,79H,45H,34H,51H,89H,64H,23H     ;packed array
    UNPACKED    DB  16 DUP(?)                           ;unpacked array
    
DATA ENDS  



CODE SEGMENT 
    
    ASSUME  DS:DATA
    ASSUME  CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,8H
            
            MOV SI,0 
            MOV DI,0 
            
            MOV BL,0FH           ;used for masking
            
    PTOUMASK:                   
                                 
            XOR AX,AX            ;initialize ax to zero 
            
	        MOV AL,PACKED[SI]
	        MOV AH,PACKED[SI]
                  
	        ROR AH,4             ;right rotate ah by 4 bits
	        
	        AND AL,BL            ;masking (and with 00001111)
	        AND AH,BL            ;masking (and with 00001111)
	        
	        INC SI   
	        
	        MOV UNPACKED[DI], AH
	        INC DI
	        MOV UNPACKED[DI],AL
	        INC DI        
	        
            LOOP PTOUMASK 
            
            
CODE ENDS  
    END START
