module adder(x, y, c_in, s, c_out);
    input [7:0] x;
    input [7:0] y;
    input c_in;
    output [7:0] s;
    output c_out;
    wire [6:0] c;
    wire [7:0] ny;

    xor y0(ny[0], y[0], c_in);
    xor y1(ny[1], y[1], c_in);
    xor y2(ny[2], y[2], c_in);
    xor y3(ny[3], y[3], c_in);
    xor y4(ny[4], y[4], c_in);
    xor y5(ny[5], y[5], c_in);
    xor y6(ny[6], y[6], c_in);
    xor y7(ny[7], y[7], c_in);

    fulladd fa0(c_in, x[0], ny[0], s[0], c[0]);
    fulladd fa1(c[0], x[1], ny[1], s[1], c[1]);
    fulladd fa2(c[1], x[2], ny[2], s[2], c[2]);
    fulladd fa3(c[2], x[3], ny[3], s[3], c[3]);
    fulladd fa4(c[3], x[4], ny[4], s[4], c[4]);
    fulladd fa5(c[4], x[5], ny[5], s[5], c[5]);
    fulladd fa6(c[5], x[6], ny[6], s[6], c[6]);
    fulladd fa7(c[6], x[7], ny[7], s[7], c_out);
endmodule
