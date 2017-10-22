;submitted by:manisha paruthi
;rollno: 19
;proginfo

;program to add the elements of array double word size


DATA SEGMENT                         ;data segment
 
    ARRAY   DD 349fH,567H,7fdbH,3abcdH,a45H,45678eabH 
    
    SUM     DD 0H                    ;variable that stores sum of elements of array

DATA ENDS                            ;segment ends


CODE SEGMENT                         ;code segment
    
    ASSUME DS:DATA
    ASSUME CS:CODE        

    START:                           
    
            MOV  AX,DATA
            MOV  DS,AX                ;populating ds with address of data segment
            
            XOR  AX,AX
            MOV  SI,0H
            LEA  BX,ARRAY             ;loads bx  with address of array
            MOV  CX,06H               ;initiaize counter
            
    SUMDOUBLE:  
            MOV  AX,WORD PTR SUM      ;move lower 16 bits to ax   
            ADC  AX,WORD PTR BX[SI]   ;add lower 16 bits of current index and storing in sum  
            MOV  WORD PTR SUM,AX                
            
            MOV  AX,WORD PTR SUM+2    ;move lower 16 bits to ax
            ADC  AX,WORD PTR BX[SI+2] ;add lower 16 bits of current index and storing in sum 
            MOV  WORD PTR SUM+2,AX    
            INC  SI
            INC  SI
            INC  SI                                   
            INC  SI
            LOOP SUMDOUBLE            ;repeat until counter is zero
 
CODE ENDS                             ;end segment
    END START                        




