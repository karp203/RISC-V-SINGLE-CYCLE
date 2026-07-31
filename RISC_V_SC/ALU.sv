import risc_pkg::*;

module alu(
    input logic [31:0] alu_a,
    input logic [31:0] alu_b,

    input alu_op_t alu_op,

    output logic [31:0] alu_res
);

    // Wires
    logic signed [31:0] signed_a;
    logic signed [31:0] signed_b;

    assign signed_a = alu_a;
    assign signed_b = alu_b;

    // ALU
    always_comb begin
        
        alu_res = 32'h0;

        case (alu_op) 

            ALU_ADD : alu_res = alu_a + alu_b;
            ALU_SUB : alu_res = alu_a - alu_b;

            ALU_SLL : alu_res = alu_a << alu_b[4:0];
            ALU_SRL : alu_res = alu_a >> alu_b[4:0];
            ALU_SRA : alu_res = alu_a >> alu_b[4:0];

            ALU_OR : alu_res = alu_a | alu_b;
            ALU_AND : alu_res = alu_a & alu_b;
            ALU_XOR : alu_res = alu_a ^ alu_b;

            ALU_SLTU : alu_res = (alu_a < alu_b) ? 32'h1 : 32'h0;
            ALU_SLT : alu_res = (signed_a < signed_b) ? 32'h1 : 32'h0;
        endcase
    end 

endmodule