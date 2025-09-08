module and31(a, b, c, z);
    input a, b, c;
    output z;

    wire w1;

    and a1(w1, a, b);
    and a2(z, c, w1);
endmodule
