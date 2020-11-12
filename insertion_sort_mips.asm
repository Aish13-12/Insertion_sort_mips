.data
so_arr1:.space 40
so_arr2:.space 40 #Storing space for the arrays to be sorted(as number of elements given is 10)
str0:   .asciiz "Enter the number of elements:"
str1:   .asciiz "Enter the scale factor:"
str2:   .asciiz "Enter the common ratio:"
str3:   .asciiz "Ascending order:"
str4:   .asciiz "Descending order:"
str5:   .asciiz "Random order:"
str6:   .asciiz "Comparisions:"
        
.text
.globl main
main:   
li $v0, 4
la $a0, str0
syscall
li $v0, 5
syscall
move $t8, $v0
li $v0, 4
la $a0, str1  #Printing the arrays
syscall
li $v0, 5
syscall
move $t0, $v0
li $v0, 4
la $a0, str2
syscall
li $v0, 5
syscall
move $t1, $v0
li $t2, 0

#Populating the arrays with geometric sequences
pop_ar1: la $t4, so_arr1
         move $t5, $t8
         slt $t3, $t2, $t5
         beq $t3, $zero, exit3
         sll $t3, $t2, 2
         add $t3, $t3, $t4
         sw $t0, 0($t3)
         la $t4, so_arr2
         addi $t5, $t5, -1
         sll $t5, $t5, 2
         add $t4, $t4, $t5
         sll $t3, $t2, 2
         sub $t4, $t4, $t3
         sw $t0, 0($t4)
         mult $t0, $t1
         mflo $t0
         addi $t2, $t2, 1
         j pop_ar1
exit3: li $v0, 4
       la $a0, str3
       syscall
       la $a0, so_arr1
       li $t2, 0
       move $t0, $a0
       jal print_arr #Printing the array to be sorted
       la $a0, so_arr1
       jal sort_f     #Sorting the array
       addi $a0, $zero, 0xA #going to the next line in console
       addi $v0, $zero, 0xB 
       syscall
       li $v0, 4
       la $a0, str4
       syscall
       la $a0, so_arr2
       li $t2, 0
       move $t0, $a0
       jal print_arr
       la $a0, so_arr2
       jal sort_f
       addi $a0, $zero, 0xA 
       addi $v0, $zero, 0xB 
       syscall
       li $v0, 4
       la $a0, str5
       syscall
       la $a0, so_arr1
       addi $t8, $t8, -1
       move $t2, $t8
       move $t4, $a0
       jal shufl  #Shuffling the array 1 randomly
       li $t2, 0
       la $a0, so_arr1
       move $t0, $a0
       addi $t8, $t8, 1
       jal print_arr #Printing the shuffled array
       la $a0, so_arr1
       jal sort_f #Sorting the shuffled array
       li $v0, 10
       syscall
#Function to shuffle the array  
shufl: slti $t3, $t2, 0
       bne $t3, $zero, exit5
       li $a1, 10
       li $v0, 42
       syscall
       addi $t2, $t2, 1
       div $a0, $t2
       mfhi $t3
       addi $t2, $t2, -1
       sll $t5, $t2, 2
       add $t5, $t5, $t4
       sll $t3, $t3, 2
       add $t3, $t3, $t4
       lw $t6, 0($t3)
       lw $t7, 0($t5)
       sw $t6, 0($t5)
       sw $t7, 0($t3)
       addi $t2, $t2, -2
       j shufl
exit5:jr $ra
       
sort_f: move $a1, $t8
        sort:    addi $sp, $sp, -24
                 sw $ra, 20($sp) 
                 sw $s3, 16($sp)
                 sw $s2, 12($sp)
                 sw $s1, 8($sp)
                 sw $s0, 4($sp)
                 sw $s4, 0($sp)
                 move $s2, $a0
                 move $s3, $a1
                 move $s0, $zero
                 move $s4, $zero
                 for1tst: slt $t0, $s0, $s3
                          beq $t0, $zero, exit1
                          addi $s1, $s0, -1
                 for2tst: slti $t0, $s1, 0
                          bne $t0, $zero, exit2
                          sll $t1, $s1, 2
                          add $t2, $s2, $t1
                          lw $t3, 0($t2)
                          lw $t4, 4($t2)
                          slt $t0, $t4, $t3
                          addi $s4, $s4, 1
                          beq $t0, $zero, exit2
                          move $a0, $s2
                          move $a1, $s1
                          sll $t1, $a1, 2
                          add $t1, $a0, $t1
                          lw $t0, 0($t1)
                          lw $t2, 4($t1)
                          sw $t2, 0($t1)
                          sw $t0, 4($t1)
                          addi $s1, $s1, -1
                          j for2tst     
                 exit2:   addi $s0, $s0, 1
                          j for1tst
                 exit1:   li $v0, 1
                          move $a0, $s4 #Printing the number of comparisions
                          syscall
                          lw $s4, 0($sp) 
                          lw $s0, 4($sp)
                          lw $s1, 8($sp)
                          lw $s2, 12($sp)
                          lw $s3, 16($sp)
                          lw $ra, 20($sp)
                          addi $sp, $sp, 24
                          jr $ra
                         
print_arr:slt $t3, $t2, $t8
          beq $t3, $zero, exit4
          sll $t3, $t2, 2
          add $t3, $t3, $t0
          lw $t1, 0($t3)
          li $v0, 1  
          move $a0, $t1
          syscall
          li $a0, 32
          li $v0, 11  
          syscall
          addi $t2, $t2, 1
          j print_arr
exit4:li $a0, 32
      li $v0, 11  
      syscall
      li $v0, 4
      la $a0, str6
      syscall
      jr $ra

                                     

    
         

          

