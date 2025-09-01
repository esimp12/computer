module adder_tb;

    // Declare testbench signals
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire c;

    adder add (
        .x(a),
        .y(b),
        .c_in(1'b0),
        .s(s),
        .c_out(c)
    );

    initial begin
        // Apply test vectors
        a = 8'b00001111;
        b = 8'b00000011;
        #10; // Wait for 10 time units
        $display("c_in=%b, a=%b, b=%b, s=%b, c_out=%b", 1'b0, a, b, s, c); 

        // End the simulation
        $finish;
    end

endmodule
