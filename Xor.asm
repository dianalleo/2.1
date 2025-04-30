@0 // the first value used in the XOR operation is stored in register 0
D=M // the value from register 0 is moved to the D (data) register
@1 // the second value used in the XOR operation is stored in M (memory)
D=D|M // bitwise OR operation performed using the values in D and M registers, and then the result is stored in D
@3 // accessing register 3
M=D // storing the result of OR operation (currently in D register) in register 3
@0 // accessing register 0 
D=M // value in M is stored in register 0 (originally from register 3, the result of OR)
@1 // going to register 1
D=D&M // AND operation performed using values from registers 0 and 1 (as these are in D and M), result is stored in D
@4 // going to register 4
M=D // storing the result of AND operation in register 4
@3 
D=M // storing the value from register 3 in D (result of OR)
@4
D=D-M // XOR can be performed by doing (x OR y) - (x AND y). here D initially holds the result of OR, and M holds the result of AND
@2
M=D // the final result of the XOR operation is stored in register 2
