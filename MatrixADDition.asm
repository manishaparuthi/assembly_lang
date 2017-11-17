;submitted by: manisha paruthi
;rollno 19
;matrix addition


DATA SEGMENT
    MatA    DB 01h,01h,01h
            DB 02h,02h,02h
            DB 03h,04h,03h
            
    MatB    DB 01h,02h,03h
            DB 01h,04h,06h
            DB 02h,03h,02h
              
    Result  DB 9 DUP (?)
    
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE   ;assssume ds is associated with data
    
    START:
        MOV AX,DATA       ;populating ds and cs
        MOV DS,AX 
        
        XOR AX,AX          ; ax=0
        MOV BP,0
        MOV DI,0 
        MOV CX,3
        
    LOOP1: PUSH CX         ; cx is pushed for indexing in loop1 
    
           MOV CX,3        ; cx is used for loop2
           MOV DI,0
    
    LOOP2: MOV AL,MatA[BP][DI]        ; add corresponding elements
           ADD AL,MatB[BP][DI]

           MOV Result[BP][DI],AL      ; stores the corresponding in to Result matrix.
           
           INC DI 
           XOR AX,AX
           
           LOOP LOOP2
           
           POP CX 
           ADD BP,3
           LOOP LOOP1
           
CODE ENDS
END START

           
           
           
           
        