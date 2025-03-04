@0 //get x
D=M
@1
M=D // put x into reg1 
@POSITIVE
D;JGE // if x is positive, go to positive func
@2
M=1 // setting r2 to 1 if x is negative
@32768 // max num?
D=A
@CHECK_OVERFLOW
D=D-M // d = 32768 - x?????
D;JEQ // if zero go to check overflow
@0
D=M // get x
D=-D // invert x
@1
M=D // set r1 to 1 (result, absol val of x) this is normal case
@END
0;JMP //end program now
(POSITIVE)
@2
M=0 //set r2 as 0 bc x is pos
@3
M=0 // operation can be done, r3 is 0
@END
0;JMP //end
(CHECK_OVERFLOW) // just sets r3 as 1 if x if bigger than the max
@3
M=1 // cant be done
@END
0;JMP
(END)
