# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
# 

# Constants
NUM_ROWS = 6
NUM_COLUMNS = 12

# Registers:
# - row in $t0
# - col in $t1

main:

main__row_loop_init:
	li      $t0, 0
main__row_loop_body:
	bge     $t0, NUM_ROWS, main__row_loop_end

	
main__col_loop_init:
	li      $t1, 0
main__col_loop_body:
	bge     $t1, NUM_COLUMNS, main__col_loop_end
	
	# print out here 
	mul     $t2, $t0, NUM_COLUMNS
	add     $t2, $t2, $t1
	lb	$a0, flag($t2)		# 
	
	li      $v0, 11
	syscall
	
	add     $t1, $t1, 1
	b	main__col_loop_body			# branch tomain__col_loop_body
	
	
main__col_loop_end:
	
	li      $a0, '\n'
	li      $v0, 11
	syscall
	
	add     $t0, $t0, 1
	b       main__row_loop_body			# branch t
	
main__row_loop_end:


main__end:
                                        # End of the program.
        li      $v0, 0                  # return 0
        jr      $ra


.data
# This label inside the data region refers to the bytes of the flag. 
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
