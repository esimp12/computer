module fulladd_tb;

    // Declare testbench signals
    reg a;
    reg b;
    reg c_in;
    wire s, c_out;

    // Instantiate the and_example module
    fulladd fa (
        .c_in(c_in),
        .a(a),
        .b(b),
        .s_out(s),
        .c_out(c_out)
    );

    initial begin
        // Apply test vectors
        c_in = 0; a = 0; b = 0;
        #10; // Wait for 10 time units
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 0; a = 0; b = 1;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 0; a = 1; b = 0;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 0; a = 1; b = 1;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 1; a = 0; b = 0;
        #10; 
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 1; a = 0; b = 1;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 1; a = 1; b = 0;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        c_in = 1; a = 1; b = 1;
        #10;
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c_out); 

        // End the simulation
        $finish;
    end

endmodule
