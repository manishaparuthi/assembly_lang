;submitted by:manisha paruthi
;rollno:19
;prog info
;move one block of data to another
data segment
   block1 db    23h,45h,67h,56h,12h    ;block1 or source block
   block2 db    5dup(0)                ;block2 or destination block

data ends

code segment
    assume ds:data , cs:code  
    
    start:
          mov ax,data
          mov ds,ax         ;populates ds with adress of data segment to data segment register
          
          mov si,0
          mov di,0 
          
          
          lea bx,block1     ;loads effective address of memory loaction named
                            ; array1 to bx register
                            
          lea bp,block2     ;loads effective address of memory loaction named
                            ; array2 to bp register
          
          mov cx,05h        ;number of times the loop to be executed
     
     
     next: 
          mov al,bx[si]     ;copies the byte content addressed
                            ; by bx and si registers to al register
          
          mov bp[di],al     ;copies the content of al register to memory 
                            ;location addressed by bp and di registers
          
          inc si            ; si=si+1
                    
          inc di            ; di=di+1
          loop next         ;loop condition on cx is checked
 code ends
      end start
