module d_latch(d, c, q, q0);
    input d;
    input c;
    output q;
    output q0;

    wire s;
    wire r;
    wire d0;

    not dnot (d0, d);

    nand s1 (s, d, c);
    nand r1 (r, d0, c);

    nand n1 (q, s, q0);
    nand n2 (q0, r, q);
endmodule
