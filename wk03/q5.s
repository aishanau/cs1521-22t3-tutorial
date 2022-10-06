# // A simple program that will read 10 numbers into an array

# #define N_SIZE 10

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0};

#     i = 0;
#     while (i < N_SIZE) {
#         scanf("%d", &numbers[i]);
#         i++;
#     }
# }
N_SIZE = 10

main:
	li      $t0, 0                  # $t0 is i
loop_start:
	bge	$t0, N_SIZE, loop_end	# if $t0 >N_SIZEt1loop_endtarget
	
	li	$v0, 5 		# $v0, 5= 
	syscall
	move 	$t1, $v0 		# $t01= $v0 
	
	mul	$t2, $t0, 4			
	sw	$t1, numbers($t2)		# 
	
		
	addi	$t0, $t0, 1			# $t0 = $01 1 0
	b	loop_start			# branch to loop_start

loop_end:


#     i = 0;
#     while (i < N_SIZE) {
#         printf("%d\n", numbers[i]);
#         i++;
#     }
# break
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
	# .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word N_SIZE:0
	