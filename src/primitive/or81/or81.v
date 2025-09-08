module or81(x, z);
    input [7:0] x;
    output z;
    wire [5:0] w;

    or o1(w[0], x[0], x[1]);
    or o2(w[1], x[2], w[0]);
    or o3(w[2], x[3], w[1]);
    or o4(w[3], x[4], w[2]);
    or o5(w[4], x[5], w[3]);
    or o6(w[5], x[6], w[4]);
    or o7(z, x[7], w[5]);
endmodule
