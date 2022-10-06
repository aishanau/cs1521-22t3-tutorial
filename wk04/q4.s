
NUM_ROWS = 3
NUM_COLUMNS = 4

main:

	# li      $a0, 3
	# li      $a1, 4
	# la      $a2, M
	# li      $a3, 2
	# jal     change

main__row_loop_init:                    # for (int row = 0; row < NUM_ROWS; row++) {
        li      $t0, 0                  # row = 0

main__row_loop_body:                    # while (row < NUM_ROWS) 
        bge     $t0, NUM_ROWS, main__row_loop_end

main__col_loop_init:                    # for (int col = 0; col < NUM_COLUMNS; col++) {
        li      $t1, 0                  # col = 0;

main__col_loop_body:                    # while (col < NUM_COLUMNS) 
        bge     $t1, NUM_COLUMNS, main__col_loop_end      
        

        mul     $t2, $t0, NUM_COLUMNS     
        add     $t3, $t2, $t1 
        mul     $t3, $t3, 4
        la      $t4, M                  
        add     $t5, $t3, $t4           

        lw      $a0, ($t5)              
        
        li      $v0, 1                 # printf("%c", flag[row][col])
        syscall

main__col_loop_iter:
        addi    $t1, $t1, 1             # col++
        j       main__col_loop_body

main__col_loop_end:
main__row_loop_iter:
        li      $a0, '\n'               # printf("%c", '\n')
        li      $v0, 11
        syscall
        addi    $t0, $t0, 1             # row++
        j       main__row_loop_body

main__row_loop_end:
	li      $v0, 0
	jr      $ra
	


change:
	# TODO this function
	jr      $ra




	.data
M:      .word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8
	