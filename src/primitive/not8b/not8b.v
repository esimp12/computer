module not8b(x, y);
    input [7:0] x;
    output [7:0] y;

    not n0(y[0], x[0]);
    not n1(y[1], x[1]);
    not n2(y[2], x[2]);
    not n3(y[3], x[3]);
    not n4(y[4], x[4]);
    not n5(y[5], x[5]);
    not n6(y[6], x[6]);
    not n7(y[7], x[7]);
endmodule
