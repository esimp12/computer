module add8b_tb;

    // Declare testbench signals
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire c;

    add8b add (
        .x(a),
        .y(b),
        .s(s),
        .c_out(c)
    );

    initial begin
        // Apply test vectors
        a = 8'b00001111;
        b = 8'b00000011;
        #10; // Wait for 10 time units
        $display("a=%b, b=%b, s=%b, c=%b", a, b, s, c); 

        // End the simulation
        $finish;
    end

endmodule
