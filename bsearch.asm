;submitted by:manisha paruthi
;rollno:19
;prog info
;search using binary search
data segment
    array   db    40h,50h,52H,60h,70h,80h,81h 
    idx     dw      ?       ;currently working index
    lower   dw      ?       ;current lower
    upper   dw      ?       ;current upper
    element db      78h     ;element to be tested is 50h
    success db      10,13,  "Element is present in the array $"     ;string to represent success message
    fail    db      10,13,  "Element is not present in the array $" ;string to represent failure message
data ends 




code segment
    assume ds:data , cs:code  
    
    start:
          mov ax,data ;populating ds with starting address of data segment using ax
          mov ds,ax
          mov ax,0h
          mov cx,7h
          
          
          mov bx, OFFSET ARRAY    ;lea bx,array ;initializing bx with starting adress of array 
          mov lower,0h            ;initialzing lower to 0
          mov upper,6h            ;initializing upper to size-1 of array
          
      
      bsearch: 
          
          mov dx,upper 
          add dx,lower
          mov ax,dx 
          mov dx,0
          mov dl,2h
          div dl     ;mid element=dx
          ;mov cx,2h
          ;div cl
          ;mov ah,0h
          mov ah,0 
          mov dl,0
          mov si,ax
          mov dl,element  
          cmp dl,byte ptr bx[si] 
          je  equal  
          
          call ilower
          loop bsearch 
          
          mov ah,09              ; print fail message using interrupt
          mov dx,OFFSET fail
          int 21H 
          mov ah, 4CH
	      int 21H 
          
          
    
       ilower	proc	near

	            cmp	byte ptr bx[si], dl
	            jl	dupper
	            mov	upper, si
	            ret

          dupper:	mov	lower,si
	            ret
	            
	            
       ilower endp 
       
       
            
    equal:
         ;inc si 
         ;mov idx,si                 
         
         mov ah,09
         mov dx,OFFSET success
         int 21H 
  			
           
         mov ah, 4CH
	     int 21H
         
              
code ends
   end start