;submitted by:manisha paruthi
;rollno:19
;prog info
;search using linear search
data segment
    
    array     db 11h,23h,17h,19h,41h,79h
    var       db 17h 
    index     dw ? 
    found     db 10,13,"Element present in the arary $"
    notfound  db 10,13,"Element not present in the arary $"
    
data ends

code segment
    assume ds:data,cs:code
    start:
          mov ax,data    ;populating ds with adress of data segment
          mov ds,ax
           
          mov si,0h
          mov ax,0h      
          
          lea bx,array   ;load bx with address of array
          
          mov al,var 
          mov cx,6h      ;initialize cx with count(size of array)
          
          
      lsearch:
           
           cmp al,byte ptr bx[si]       ;compare element  with current element of array
           je  success                  ;if equal then success
                                        
          
           
           inc si  
           loop lsearch 
           
           
           mov	ah, 09H
	       mov	dx,OFFSET notfound  	; if the element is  not found
	       int	21H
           mov	ah, 4CH			        ; to forcefully terminate the program
	       int	21H  
	       
	       
    
      success: 
           mov	ah, 09H
	       mov	dx,OFFSET found  	    ; if the element is found
	       int	21H                 
           mov	ah, 4CH			        ; to forcefully terminate the program
	       int	21H
	       
	        
	  
	       
	           
     
code ends
    end start    
     
