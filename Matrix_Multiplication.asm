data segment  
    
    mat1 db 01h,02h,01h
         db 03h,04h,02h
         db 04h,02h,01h
         
    mat2 db 03h,05h,02h
         db 04h,06h,03h
         db 03h,04h,02h
         
    res dw 9 dup (0)
    
    row1 dw 03h
    col1 dw 03h
    row2 dw 03h
    col2 dw 03h
    
data ends

stack segment  

    dw 20 dup(?)
    tos label word

stack ends

code segment
    
    assume ds: data, cs: code , ss: stack
    
    start: mov ax,data
           mov ds,ax
           
           mov ax,stack
           mov ss,ax
           mov sp,offset tos ; initialise top of stack segment
                  
           mov cx,row1
           
           ; Comparision to check whether no of columns of first matrix 
           ; equals to no of rows of second matrix
           
           mov bx,col1
           cmp bx,row2
           jnz terminate       ; if not equal , then forcefully terminate the program
           
           call Multiplication ; else call procedure for multiplication
           
    terminate: mov ah,4ch
               int 21h
                  
     
    Multiplication proc near   ; Multiplication Procedure         
                   
           push bx             ; Pushing all registers onto stack to save their present contents
           push ax
           push si
           push dx
           push di
               
           mov si,0            ; initialising all registers with value 0
           mov di,0
           mov bx,0
           
                               ; outer most loop
    loop1: push cx    
           mov cx,col2
           
    loop2: push cx             ; inner loop
           mov dx,0
           mov ax,0
           
           mov cx,col1
           
    loop3: mov al,mat1[si]    ; innermost loop
           mul mat2[di]
           add dx,ax
           inc si
           add di,col2
           loop loop3         ; each iteration of this loop generates a result for a specific
                              ; row at specific column and storing the result dx
           
           
           mov res[bx],dx     ; storing the result in res after each complete iteration of 
           inc bx             ; innermost loop
           inc bx
           
           sub si,col1        ; new value for si = si - col1
                                                                         
           mov ah,0
           mov al,byte ptr row2
           mul byte ptr col2
           sub ax,1
           sub di,ax          ; new value for di = (col2*row1) - 1
           
           pop cx
           loop loop2         ; completion of inner loop when cx=0
            
           add si,col1 
           mov di,0           ; reset di
           pop cx
           loop loop1 
 
           pop di             ; popping the status of registers before calling procedure
           pop dx
           pop si
           pop ax
           pop bx
           
           ret               ; returning from the procedure
           
   Multiplication endp       ; end of procedure
    
           
code ends
end start
