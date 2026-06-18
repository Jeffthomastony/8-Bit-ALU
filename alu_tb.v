module eightbitALU_tb;
    reg[7:0] t_A;
    reg[7:0] t_B;
    reg[2:0] t_ALU_C;
    wire[7:0] t_ALU_O;

eightbitALU uut(
    .A(t_A),
    .B(t_B),
    .ALU_C(t_ALU_C),
    .ALU_O(t_ALU_O)
);

initial begin
    $dumpfile("aluWaveform.vcd");
    $dumpvars(0, eightbitALU_tb);
end 

initial begin 
    // Test Addition
    t_A = 8'd10;
    t_B = 8'd5;
    t_ALU_C = 3'b000; // Addition
    #10;

    // Test Subtraction
    t_A = 8'd10;
    t_B = 8'd5;
    t_ALU_C = 3'b001; // Subtraction
    #10;

    t_A = 8'd255; // Max 8-bit value
    t_B = 8'd1;
    t_ALU_C = 3'b000; // Should give 0 due to overflow
    #10; 
    
    $finish;
end
endmodule
