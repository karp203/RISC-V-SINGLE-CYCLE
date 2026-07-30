package risc_pkg;

  // RISC-V Opcodes
  typedef enum logic [6:0] {
        OPCODE_R_TYPE = 7'h33,
        OPCODE_I_LOAD = 7'h03,
        OPCODE_I_ALU  = 7'h13,
        OPCODE_I_JALR = 7'h67,
        OPCODE_S_TYPE = 7'h23,
        OPCODE_B_TYPE = 7'h63,
        OPCODE_LUI    = 7'h37,
        OPCODE_AUIPC  = 7'h17,
        OPCODE_JAL    = 7'h6F
  } opcode_t;


  // ALU Operations
  typedef enum logic [3:0] {
        ALU_ADD  = 4'd0,
        ALU_SUB  = 4'd1,
        ALU_SLL  = 4'd2,
        ALU_SLT   = 4'd3,
        ALU_SLTU  = 4'd4,
        ALU_XOR  = 4'd5,
        ALU_SRL  = 4'd6,
        ALU_SRA  = 4'd7,
        ALU_OR  = 4'd8,
        ALU_AND = 4'd9
  } alu_op_t;


  // Memory Access Size
  typedef enum logic [1:0] {
        MEM_BYTE = 2'b00,
        MEM_HALF = 2'b01,
        MEM_WORD = 2'b10
  } mem_size_t;


  // Branch Instructions (funct3)
  typedef enum logic [2:0] {
        B_BEQ  = 3'b000,
        B_BNE  = 3'b001,
        B_BLT  = 3'b100,
        B_BGE  = 3'b101,
        B_BLTU = 3'b110,
        B_BGEU = 3'b111
  } b_type_instr_t;


  // R-Type ALU Instructions
  // (funct7[5], funct3)
  typedef enum logic [3:0] {
        R_ADD  = 4'b0000,
        R_SUB  = 4'b1000,
        R_SLL  = 4'b0001,
        R_SLT  = 4'b0010,
        R_SLTU = 4'b0011,
        R_XOR  = 4'b0100,
        R_SRL  = 4'b0101,
        R_SRA  = 4'b1101,
        R_OR   = 4'b0110,
        R_AND  = 4'b0111
  } r_type_funct_t;


  // I-Type ALU Instructions
  // (opcode[4], funct3)
  typedef enum logic [3:0] {
        I_LB = 4'h0;
        I_LH = 4'h1;
        I_LW = 4'h2;
        I_LBU = 4'h4;
        I_LHU = 4'h5;
        I_ADDI = 4'h8;
        I_SLTI = 4'hA;
        I_SLTIU = 4'hB;
        I_XORI = 4'hC;
        I_ORI = 4'hE;
        I_ANDI = 4'hF;
        I_SLLI = 4'h9;
        I_SRLI_SRAT = 4'hD;
  } i_type_instr_t;


  // Store Instructions (funct3)
  typedef enum logic [2:0] {
        S_SB = 3'b000,
        S_SH = 3'b001,
        S_SW = 3'b010
  } s_type_instr_t;


  // Register Writeback Source
  typedef enum logic [1:0] {
        WB_SRC_ALU = 2'd0,
        WB_SRC_MEM = 2'd1,
        WB_SRC_IMM = 2'd2,
        WB_SRC_PC4 = 2'd3
  } wb_src_t;


  // Control Signals
  typedef struct packed {
        logic mem_valid;
        logic mem_write;
        mem_size_t mem_size;
        logic load_zero_extend;
        logic rf_write_enable;
        logic pc_src_select;
        logic alu_src_a_select;
        logic alu_src_b_select;
        wb_src_t wb_src;
        alu_op_t alu_op;
  } control_t;

endpackage