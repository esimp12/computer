module sr_latch(s, r, c, q, q0);
    input s;
    input r;
    input c;
    output q;
    output q0;

    wire s1;
    wire r1;

    nand n1 (s1, s, c);
    nand n2 (r1, r, c);
    nand n3 (q, s1, q0);
    nand n4 (q0, r1, q);
endmodule
