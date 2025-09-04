module halfadd(in1, in2, s, c);
    input in1;
    input in2;
    output s;
    output c;

    xor sum (s, in1, in2);
    and carry (c, in1, in2);
endmodule