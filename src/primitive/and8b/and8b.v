module and8b(x, y, z);
    input [7:0] x;
    input [7:0] y;
    output [7:0] z;

    and a0(z[0], y[0], x[0]);
    and a1(z[1], y[1], x[1]);
    and a2(z[2], y[2], x[2]);
    and a3(z[3], y[3], x[3]);
    and a4(z[4], y[4], x[4]);
    and a5(z[5], y[5], x[5]);
    and a6(z[6], y[6], x[6]);
    and a7(z[7], y[7], x[7]);
endmodule
