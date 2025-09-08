module alu(opcode, A, B, D);
    input [2:0] opcode;
    input [7:0] A;
    input [7:0] B;
    output [7:0] D;

    // flags
    wire C;  // carry out
    
    // logical outputs
    wire [7:0] AND;     // 000
    wire [7:0] OR;      // 001
    wire [7:0] NOT;     // 010
    wire [7:0] XOR;     // 011

    // addition/shift outputs
    wire [7:0] ADD;     // 100
    wire [7:0] SUB;     // 101
    wire [7:0] LSL;     // 110
    wire [7:0] LSR;     // 111

    // Logical operations
    and8b and_output (A, B, AND); 
    or8b or_output (A, B, OR); 
    not8b not_output (A, NOT); 
    xor8b xor_output (A, B, XOR); 

    // Addition & Shifters
    adder add_output (A, B, 1'b0, ADD, C);
    adder sub_output (A, B, 1'b1, SUB, C);
    shifter lsl_output (A, 1'b0, LSL);
    shifter lsr_output (A, 1'b1, LSR);

    // Select output based on opcode
    mux81 m1 (opcode, {AND[0], OR[0], NOT[0], XOR[0], ADD[0], SUB[0], LSL[0], LSR[0]}, D[0]);
    mux81 m2 (opcode, {AND[1], OR[1], NOT[1], XOR[1], ADD[1], SUB[1], LSL[1], LSR[1]}, D[1]);
    mux81 m3 (opcode, {AND[2], OR[2], NOT[2], XOR[2], ADD[2], SUB[2], LSL[2], LSR[2]}, D[2]);
    mux81 m4 (opcode, {AND[3], OR[3], NOT[3], XOR[3], ADD[3], SUB[3], LSL[3], LSR[3]}, D[3]);
    mux81 m5 (opcode, {AND[4], OR[4], NOT[4], XOR[4], ADD[4], SUB[4], LSL[4], LSR[4]}, D[4]);
    mux81 m6 (opcode, {AND[5], OR[5], NOT[5], XOR[5], ADD[5], SUB[5], LSL[5], LSR[5]}, D[5]);
    mux81 m7 (opcode, {AND[6], OR[6], NOT[6], XOR[6], ADD[6], SUB[6], LSL[6], LSR[6]}, D[6]);
    mux81 m8 (opcode, {AND[7], OR[7], NOT[7], XOR[7], ADD[7], SUB[7], LSL[7], LSR[7]}, D[7]);

endmodule
