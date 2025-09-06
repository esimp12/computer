module decoder12_tb;

    // Declare testbench signals
    reg a;
    wire [1:0] s;

    // Instantiate the and_example module
    decoder12 d12 (
        .a(a),
        .s(s)
    );

    initial begin
        // Apply test vectors
        a = 0;
        #10; // Wait for 10 time units
        $display("a=%b, s=%b", a, s); 

        a = 1;
        #10;
        $display("a=%b, s=%b", a, s); 

        // End the simulation
        $finish;
    end
endmodule
