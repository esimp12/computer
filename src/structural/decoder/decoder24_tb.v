module decoder24_tb;

    // Declare testbench signals
    reg [1:0] a;
    wire [3:0] s;

    // Instantiate the and_example module
    decoder24 d24 (
        .a(a),
        .s(s)
    );

    initial begin
        // Apply test vectors
        a = 2'b00;
        #10; // Wait for 10 time units
        $display("a=%b, s=%b", a, s); 

        a = 2'b01;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 2'b10;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 2'b11;
        #10;
        $display("a=%b, s=%b", a, s); 

        // End the simulation
        $finish;
    end
endmodule
