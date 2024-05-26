#Fibonacci sequence generation in RISC-V
# Author: Amirreza Rahbar[400412238] , Amirhosein Wireman yazdi[400413467]

.text
.globl main

main:
    li t0,4092            #Set stack base address (0xffc in decimal)
    addi t0,t0,-48       #Adjust stack pointer
    sw s0,44(t0)          #Save s0 register
    addi s0,t0,48        #Set frame pointer
    sw zero,-20(s0)       #Initialize F(0) = 0
    li t1,1               #Initialize F(1) = 1
    sw t1,-24(s0)         #Save F(1)
    li t2,10              #Set number of terms to calculate
    sw t2,-32(s0)         #Save term count
    sw zero,-28(s0)       #Initialize loop counter
    j .L2                  #Jump to condition check
.L3:
    lw t3,-20(s0)         #Load F(n-2)
    lw t4,-24(s0)         #Load F(n-1)
    add t5,t3,t4          #Calculate F(n) = F(n-1) + F(n-2)
    sw t5,-36(s0)         #Store F(n)
    lw t4,-24(s0)         #Prepare for next iteration
    sw t4,-20(s0)         #Update F(n-2) = F(n-1)
    lw t5,-36(s0)         #Load F(n)
    sw t5,-24(s0)         #Update F(n-1) = F(n)
    lw t6,-28(s0)         #Load loop counter
    addi t6,t6,1          #Increment loop counter
    sw t6,-28(s0)         #Save updated counter
.L2:
    lw a1,-28(s0)         #Load loop counter
    lw a2,-32(s0)         #Load term count
    blt a1,a2,.L3         #Continue loop if counter < term count
    li a3,0               #Prepare to exit
    mv a0,a3              #Return 0
    lw s0,44(t0)          #Restore s0 register
    addi t0,t0,48         #Restore stack pointer
    ebreak                #End program execution
