module or8b(x, y, z);
    input [7:0] x;
    input [7:0] y;
    output [7:0] z;

    or o0(z[0], y[0], x[0]);
    or o1(z[1], y[1], x[1]);
    or o2(z[2], y[2], x[2]);
    or o3(z[3], y[3], x[3]);
    or o4(z[4], y[4], x[4]);
    or o5(z[5], y[5], x[5]);
    or o6(z[6], y[6], x[6]);
    or o7(z[7], y[7], x[7]);
endmodule
