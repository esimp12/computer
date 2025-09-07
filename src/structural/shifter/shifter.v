module shifter(x, lr, z);
    input [7:0] x;
    input lr;
    output [7:0] z;

    mux m1(lr, 1'b0, x[1], z[0]);
    mux m2(lr, x[0], x[2], z[1]);
    mux m3(lr, x[1], x[3], z[2]);
    mux m4(lr, x[2], x[4], z[3]);
    mux m5(lr, x[3], x[5], z[4]);
    mux m6(lr, x[4], x[6], z[5]);
    mux m7(lr, x[5], x[7], z[6]);
    mux m8(lr, x[6], 1'b0, z[7]);
endmodule
