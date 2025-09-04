module adder_tb;

    // Declare testbench signals
    reg [7:0] a;
    reg [7:0] b;
    reg c_in;
    wire [7:0] s;
    wire c;

    adder add (
        .x(a),
        .y(b),
        .c_in(c_in),
        .s(s),
        .c_out(c)
    );

    initial begin
        // Apply test vectors 15 + 3 = 18 (8'b00010010)
        a = 8'b00001111;
        b = 8'b00000011;
        c_in = 1'b0; // addition
        #10; // Wait for 10 time units
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c); 

        // Apply test vectors 15 - 3 = 12 (8'b00001100)
        a = 8'b00001111;
        b = 8'b00000011;
        c_in = 1'b1; // subtraction
        #10; // Wait for 10 time units
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", c_in, a, b, s, c); 

        // End the simulation
        $finish;
    end

endmodule
