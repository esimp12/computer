module mux(s, a, b, z);
    input s;
    input a, b;
    output z;

    wire ns, sa, sb;

    not inv_s (ns, s);
    and select_a (sa, a, ns);
    and select_b (sb, b, s);
    or out (z, sa, sb);
endmodule
