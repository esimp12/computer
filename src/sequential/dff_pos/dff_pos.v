module dff_pos(d, c, q, q0);
    input d;
    input c;
    output q;
    output q0;

    wire c0;
    wire dq;
    wire dq0;

    not cnot (c0, c);
    d_latch dl (d, c0, dq, dq0);
    sr_latch srl (dq, dq0, c, q, q0);
endmodule
