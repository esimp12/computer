module xor8b(x, y, z);
    input [7:0] x;
    input [7:0] y;
    output [7:0] z;

    xor x0(z[0], y[0], x[0]);
    xor x1(z[1], y[1], x[1]);
    xor x2(z[2], y[2], x[2]);
    xor x3(z[3], y[3], x[3]);
    xor x4(z[4], y[4], x[4]);
    xor x5(z[5], y[5], x[5]);
    xor x6(z[6], y[6], x[6]);
    xor x7(z[7], y[7], x[7]);
endmodule
