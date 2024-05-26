li a0, 16    #input
sqrt:
    li a0, 0  
    li a2, 1  
loop:
    mul t2,a0,a0   
    add a0,a0,a2   
    bge t2,a0,end  
    j loop 

end:
    addi a0,a0,-1 
    mv a0,a0  #output
    ret
ebreak


