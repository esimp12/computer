module halfadd_tb;

    // Declare testbench signals
    reg a;
    reg b;
    wire s, c;

    // Instantiate the and_example module
    halfadd ha (
        .in1(a),
        .in2(b),
        .s(s),
        .c(c)
    );

    initial begin
        // Apply test vectors
        a = 0; b = 0;
        #10; // Wait for 10 time units
        $display("a=%b, b=%b, s=%b, c=%b", a, b, s, c); 

        a = 0; b = 1;
        #10;
        $display("a=%b, b=%b, s=%b, c=%b", a, b, s, c); 

        a = 1; b = 0;
        #10;
        $display("a=%b, b=%b, s=%b, c=%b", a, b, s, c); 

        a = 1; b = 1;
        #10;
        $display("a=%b, b=%b, s=%b, c=%b", a, b, s, c); 

        // End the simulation
        $finish;
    end

endmodule
