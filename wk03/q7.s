# // A simple program that adds 42 to each element of an array

# #define N_SIZE 10

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};
#     int numbers[N_SIZE]; 
#       .space N_SIZE*4

#     i = 0;
#     while (i < N_SIZE) {
#         if (numbers[i] < 0) {
#             numbers[i] += 42;
#         }
#         i++;
#     }
# }
N_SIZE = 10

main:

	li      $t0, 0                  # $t0 is i
loop_start:
	bge	$t0, N_SIZE, loop_end	# if $t0 >N_SIZEt1loop_endtarget
	
	
	mul	$t2, $t0, 4			
	lw	$a0, numbers($t2)		# 
	
	bge $a0, 0, greater_than_equal_to_zero
    
    addi $a0, $a0, 42
	sw	$a0, numbers($t2)		# 
    
greater_than_equal_to_zero:
	addi	$t0, $t0, 1			# $t0 = $01 1 0
	b	loop_start			# branch to loop_start

loop_end:

	li      $t0, 0                  # $t0 is i
loop_print_start:
	bge	$t0, N_SIZE, loop_print_end	# if $t0 >N_SIZEt1loop_print_endtarget
	
	
	mul	$t2, $t0, 4			
	lw	$a0, numbers($t2)		# 
	
	li	$v0, 1 		# $v0, 5= 
	syscall
		
	la	$a0, '\n'		# 
	li	$v0, 11 		# $v0, 5= 
	syscall
	
	addi	$t0, $t0, 1			# $t0 = $01 1 0
	b	loop_print_start			# branch to loop_start

loop_print_end:
	li		$v0, 0		# $v0 = 0
	jr		$ra					# jump to $ra
	

	.data

numbers: 
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9