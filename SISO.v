// Serial-In Serial-Out (SISO) Shift Register
module SISO (
    input clk,         // Clock signal
    input reset,       // Active high reset
    input serial_in,   // Serial input
    output serial_out  // Serial output
);
    reg [3:0] shift_reg; // 4-bit shift register (you can change size)

    // Shift operation
    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000; // Clear register on reset
        else
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left and insert serial_in
    end

    assign serial_out = shift_reg[3]; // Output the last bit

endmodule
