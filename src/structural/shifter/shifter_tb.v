module shifter_tb;

    // Declare testbench signals
    reg [7:0] x;
    reg lr;
    wire [7:0] z;

    shifter shift (
        .x(x),
        .lr(lr),
        .z(z)
    );

    initial begin
        // Apply test vector 01001011 << 1 => 10010110
        x = 8'b01001011;
        lr = 1'b0; //shift left
        #10; // Wait for 10 time units
        $display("lr=%b, x=%b, z=%b", lr, x, z); 

        // Apply test vector 01001011 >> 1 => 00100101
        x = 8'b01001011;
        lr = 1'b1; //shift right
        #10; 
        $display("lr=%b, x=%b, z=%b", lr, x, z); 

        // End the simulation
        $finish;
    end

endmodule
