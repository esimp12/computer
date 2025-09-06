module decoder24(a, s);
    input [1:0] a;
    wire [1:0] d1out;
    wire [1:0] d2out;
    output [3:0] s;

    decoder12 d1(a[0], d1out);
    decoder12 d2(a[1], d2out);
    and a1(s[0], d1out[0], d2out[0]);
    and a2(s[1], d1out[1], d2out[0]);
    and a3(s[2], d1out[0], d2out[1]);
    and a4(s[3], d1out[1], d2out[1]);
endmodule
