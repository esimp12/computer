module fulladd(c_in, a, b, s_out, c_out);
    input c_in;
    input a;
    input b;
    output s_out;
    output c_out;

    wire s1;
    wire c1;
    wire c2;

    halfadd ha1 (
        .in1(a),
        .in2(b),
        .s(s1),
        .c(c1)
    );
    halfadd ha2 (
        .in1(c_in),
        .in2(s1),
        .s(s_out),
        .c(c2)
    );
    or carry (c_out, c1, c2);
endmodule
