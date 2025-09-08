module mux81(s, x, z);
    input [2:0] s;
    input [7:0] x;
    output z;

    wire [2:0] ns;
    wire [7:0] e;
    wire [7:0] sx;

    not n1(ns[0], s[0]);
    not n2(ns[1], s[1]);
    not n3(ns[2], s[2]);

    and31 enable1(ns[2], ns[1], ns[0], e[0]);
    and31 enable2(ns[2], ns[1], s[0], e[1]);
    and31 enable3(ns[2], s[1], ns[0], e[2]);
    and31 enable4(ns[2], s[1], s[0], e[3]);
    and31 enable5(s[2], ns[1], ns[0], e[4]);
    and31 enable6(s[2], ns[1], s[0], e[5]);
    and31 enable7(s[2], s[1], ns[0], e[6]);
    and31 enable8(s[2], s[1], s[0], e[7]);

    and8b a(x, e, sx);
    or81 o(sx, z);
endmodule
