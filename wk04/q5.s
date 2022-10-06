# Sum 4 numbers using function calls.

#     int z = sum4(11, 13, 17, 19);
main:
main__prologue:
	push    $ra 
	
main__body:
        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        
        jal     sum4

	move    $a0, $v0
	
	li      $v0, 1
	syscall
	
	li      $a0, '\n'
	li      $v0, 11
	syscall 
	
main__epilogue:
	pop     $ra
	
        li      $v0, 0          # return 0 from function main
        jr      $ra             # return from function main





# int sum4(int a, int b, int c, int d) {
#     int e = sum2(a, b);
#     int f = sum2(c, d);
#     return sum2(e, f);
# }

sum4:
sum4__prologue:
	push    $ra
	push    $s0
	push    $s1
	push    $s2
sum4__body:
	
	move    $s0, $a2
	move    $s1, $a3
	
	jal     sum2
	
	move    $s2, $v0
	
	move    $a0, $s0
	move    $a1, $s1
	
	jal     sum2
	
	move    $a1, $v0
	move    $a0, $s2
	
	jal     sum2            # puts return value into $v0 
	

sum4__epilogue:
	pop     $s2
	pop     $s1
	pop     $s0
	pop     $ra
	
	jr      $ra					# jump to $ra
	


sum2:  
	# return x + y;
	add     $v0, $a0, $a1
	jr      $ra






