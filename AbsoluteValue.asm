// r0 = initial value
// r1 = result
// r2 = set to 1 if x is negative, 0 otherwise
// r3 = set to 1 if absolute value cant be computed, 0 otherwise
@0 // initial value to be computed is stored in register 0 
D=M // value 'x' is stored in D (data) register
@1
M=D // 'x' is then moved from D register to register 1
@POSITIVE // checking if x is positive:
D;JGE // if the value in D register (x) is greater than or equal to 0 (GE), the program will jump (J) to the label POSITIVE
@2 // accessing register 2 (the flag)
M=1 // if the program doesnt go to POSITIVE, x must be negative, therefore R2 is set to 1 as specified in the instructions
@32768 // the hack platform has 15-bit addressable memory, meaning memory addresses range from 0 to 32767, and 32768 is just outside the addressable range
D=A // storing the value 32768 in D register
@CHECK_OVERFLOW 
D=D-M // d = 32768 - x
D;JEQ // if the result of the above calculation is equal to 0 (EQ), it means that x requires more than 15 bits to store and cant be handled in this program
      // if this is the case, the program will jump to the label CHECK_OVERFLOW as the absolute value of x cant be found
// if the number requires less than 15 bits to store, the absolute value can be found and that process begins below
@R3
M=0 //R3 is set to 0 because the absolute value of x can be computed - if the program is here this must be the case as it didnt jump to then CHECK_OVERFLOW label
@0 // accessing R0
D=M // the value in R0 (x) is stored in D register
D=-D // calculating the absolute value of x: the value in D (x) is inverted because x must be negative
@1 // accessing R1
M=D // the value in D register (absolute value of x as calculated above) is stored in R1 as this is the end result
@END
0;JMP // the program jumps to the label END in any case (meaning of 0;JMP), because the absolute value of x has now been found and stored in the correct memory location
(POSITIVE) // label which the program jumps to in case x is positive
@2 // accessing R2
M=0 // '0' is stored in R2 because x is positive, per the instructions
@3 // accessing R3
M=0 // R3 is set to 0 as the absolute value can be computed
@R0 // accessing R0 where the initial value is stored
D=M // copying value in R0 to D register
@R1
M=D // storing initial value in R1 as the final result - if x is positive, the absolute value wouldnt change
@END
0;JMP // ending the program
(CHECK_OVERFLOW) // the program jumps to this label if x is too big
@3
M=1 // R3 is set to 1 as the absolute value cannot be computed
@END
0;JMP
(END)
