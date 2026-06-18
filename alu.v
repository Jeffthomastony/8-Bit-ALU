module eightbitALU (
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALU_C,
    output reg [7:0] ALU_O 
);

always @(*) begin
    case (ALU_C)
    3'B000: ALU_O = A + B; // Addition
    3'B001: ALU_O = A- B; // Subtraction
    3'B010: ALU_O = A & B; // AND
    3'B011: ALU_O = A | B; // OR
    3'B100: ALU_O = ~A; // NOT
    3'B101: ALU_O = A ^ B; // XOR
    3'B110: ALU_O = A << 1; // Logical Shift Left
    3'B111: ALU_O = A >> 1; // Logical Shift Right
    default: ALU_O = 8'B00000000; // Default case, i.e if ALU_C is not recognized, output zero
    endcase
end
endmodule
