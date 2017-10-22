 ;submitted by: manisha paruthi
 ;rollno:19
 ;prog info:
 ;unpacked to packed using rotate

 DATA SEGMENT    
    
    
    UNPACKED    DB      02H,01H,04H,02H,02H,03H,05H,04H,06H,05H,04H,06H,02H,07H,01H,08H 
                         ;initializing the elements
    PACKED      DB      8DUP(0H)
    
    
 DATA ENDS    
 
 CODE SEGMENT     
    
    ASSUME  DS:DATA,CS:CODE
    
    
 START:
 
        MOV AX,DATA           ;populating ds with adress of data segment
        MOV DS,AX       
        MOV AX,0 
        MOV SI,0 
        MOV DI,0 
        MOV CX,08H
 
 UTOPROTATE: 
       
        XOR AX,AX
        MOV AH,UNPACKED[SI]
        INC SI 
        MOV AL,UNPACKED[SI]
        INC SI   
        
        ROL AL,4      ;shifting left the lower bits of AX
        ROR AX,4      ;shifting right
                
        MOV PACKED[DI],AL
        INC DI                
        
        LOOP UTOPROTATE 
 
 CODE ENDS
 END START




