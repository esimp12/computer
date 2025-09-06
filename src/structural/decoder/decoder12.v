module decoder12(a, s);
    input a;
    output [1:0] s;
    
    not na(s[1], a);
    assign s[0] = a;
endmodule
