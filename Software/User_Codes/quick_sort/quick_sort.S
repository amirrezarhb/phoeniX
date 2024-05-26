# QuickSort in RISC-V assembly
# Author: Amirreza Rahbar[400412238] , Amirhosein Wireman yazdi[400413467]
.globl _start

_start:
    # Initialize stack pointer to a larger stack space
    lui sp,0x2          # sp = 0x20000000
    addi sp,sp,0        

    # Create stack space
    addi sp,sp,-64      # Allocate 64 bytes

    # Save s0
    sw s0,60(sp)       

    # Update s0
    addi s0,sp,64       

    # Initialize array[] in memory
    li t0,6
    sw t0,-48(s0)      
    sw t0,-44(s0)      
    li t1,1
    sw t1,-40(s0)      
    li t2,2
    sw t2,-36(s0)      
    li t3,4
    sw t3,-32(s0)      

    # Set up arguments for quickSort call
    addi a0,s0,-48     
    li a1,0            
    li a2,4            

    # Call quickSort
    jal ra,quicksort   

    # Load sorted elements back to registers for inspection
    lw t4,-48(s0)  
    lw t5,-44(s0)  
    lw t6,-40(s0)  
    lw a1,-36(s0)  
    lw a2,-32(s0)  

    # Restore registers and exit
    lw s0,60(sp)       
    addi sp,sp,64      
    ebreak             

quicksort:
    # Function prologue
    addi sp,sp,-40     
    sw ra,36(sp)       
    sw s0,32(sp)       
    sw s1,28(sp)       
    sw s2,24(sp)       
    sw s3,20(sp)       
    sw s4,16(sp)       
    sw s5,12(sp)       
    sw s6,8(sp)        
    sw s7,4(sp)        

    # Base case: if low >= high, return
    bge a1,a2,qs_return

    # Save arguments for recursive calls
    add s0,a0,zero     
    add s1,a1,zero     
    add s2,a2,zero     

    # Call partition function
    jal ra,partition   
    add s3,a0,zero     

    # Recursive call to quicksort for left part
    add a0,s0,zero     
    add a1,s1,zero     
    addi a2,s3,-1      
    jal ra,quicksort   

    # Recursive call to quicksort for right part
    add a0,s0,zero     
    addi a1,s3,1       
    add a2,s2,zero     
    jal ra,quicksort   

qs_return:
    # Function epilogue
    lw ra,36(sp)       
    lw s0,32(sp)       
    lw s1,28(sp)       
    lw s2,24(sp)       
    lw s3,20(sp)       
    lw s4,16(sp)       
    lw s5,12(sp)       
    lw s6,8(sp)        
    lw s7,4(sp)        
    addi sp,sp,40      
    jr ra              

partition:
    # Function prologue
    addi sp,sp,-32     
    sw ra,28(sp)       
    sw s0,24(sp)       
    sw s1,20(sp)       
    sw s2,16(sp)       
    sw s3,12(sp)       
    sw t0,8(sp)        
    sw t1,4(sp)        
    sw t2,0(sp)        

    # Pivot is array[high]
    slli t0,a2,2       
    add t0,a0,t0       
    lw t1,0(t0)        

    addi s0,a1,-1      

    add s1,a1,zero     

partition_loop:
    bge s1,a2,partition_end

    # Load array[j] into t3
    slli t2,s1,2       
    add t2,a0,t2       
    lw t3,0(t2)        

    ble t3,t1,partition_if 
    j partition_continue

partition_if:
    addi s0,s0,1       
    slli t4,s0,2       
    add t4,a0,t4       
    lw t5,0(t4)        
    sw t5,0(t2)        
    sw t3,0(t4)        

partition_continue:
    addi s1,s1,1       
    j partition_loop   

partition_end:
    addi s0,s0,1       
    slli t4,s0,2       
    add t4,a0,t4       
    lw t3,0(t4)        
    slli t5,a2,2       
    add t5,a0,t5       
    lw t6,0(t5)        
    sw t3,0(t5)        
    sw t6,0(t4)        

    add a0,s0,zero     

    # Function epilogue
    lw ra,28(sp)       
    lw s0,24(sp)       
    lw s1,20(sp)       
    lw s2,16(sp)       
    lw s3,12(sp)       
    lw t0,8(sp)        
    lw t1,4(sp)        
    lw t2,0(sp)        
    addi sp,sp,32      
    jr ra              
    ebreak
