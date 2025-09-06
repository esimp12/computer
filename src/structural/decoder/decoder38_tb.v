module decoder38_tb;

    // Declare testbench signals
    reg [2:0] a;
    wire [7:0] s;

    // Instantiate the and_example module
    decoder38 d38 (
        .a(a),
        .s(s)
    );

    initial begin
        // Apply test vectors
        a = 3'b000;
        #10; // Wait for 10 time units
        $display("a=%b, s=%b", a, s); 

        a = 3'b001;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b010;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b011;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b100;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b101;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b110;
        #10;
        $display("a=%b, s=%b", a, s); 

        a = 3'b111;
        #10;
        $display("a=%b, s=%b", a, s); 

        // End the simulation
        $finish;
    end
endmodule
