.data
N:      .word 4
M:      .word 4

matrix:
    .word 1,  2,  3,  4
    .word 5,  6,  7,  8
    .word 9,  1,  2,  3
    .word 4,  5,  6,  7

result:
    .word 0        

.text
    .globl _start

_start:
    la   a2, N
    la   a3, M
    la   a4, matrix
    la   a5, result

    call process      
    call print_max    
    call exit

process:
    lw   t1, 0(a2)      
    lw   t2, 0(a3)      

    addi t4, x0, 0      
    addi s2, x0, -1 

process_row:
    addi t5, x0, 0      
    addi t3, x0, 0     

process_col:
    lw   t6, 0(a4)      
    addi a4, a4, 4      
    add  t5, t5, t6     

    addi t3, t3, 1
    blt  t3, t2, process_col

    ble  t5, s2, skip_update
    mv   s2, t5        

skip_update:
    addi t4, t4, 1
    blt  t4, t1, process_row

    sw   s2, 0(a5)

    ret

print_max:
    lw   a1, result      
    addi   a0, x0, 1         
    ecall
    ret

exit:
    addi a0, x0, 10
    ecall

