module decoder38(a, s);
    input [2:0] a;
    wire [3:0] d1out;
    wire [1:0] d2out;
    output [7:0] s;

    decoder24 d1(a[1:0], d1out);
    decoder12 d2(a[2], d2out);

    and a1(s[0], d1out[0], d2out[0]);
    and a2(s[1], d1out[1], d2out[0]);
    and a3(s[2], d1out[2], d2out[0]);
    and a4(s[3], d1out[3], d2out[0]);

    and a5(s[4], d1out[0], d2out[1]);
    and a6(s[5], d1out[1], d2out[1]);
    and a7(s[6], d1out[2], d2out[1]);
    and a8(s[7], d1out[3], d2out[1]);
endmodule
