`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 07:00:40 PM
// Design Name: 
// Module Name: MIPS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MIPS(
        input reset,
        input clk,
        output [15:0] test_value
    );
    wire [31:0] SrcA,SrcB,ALUResult,WriteData,ReadData;
    wire [2:0] ALUControl;
    wire ALU_Zero;
    wire [31:0] PC_IN,PC_OUT,PCPlus4,PCBranch,PCJump,forpc1;
    wire [31:0] Instr;
    wire [25:0] Instr_shifted;
    wire [4:0] Write_reg;
    wire [31:0] Result;
    wire [31:0] signlmm;
    wire [31:0] signlmm_shifted;
    wire RegDst,RegWrite,ALUSrc,MemWrite,MemtoReg,Branch,Jump;
    wire PCSrc;
    assign PCJump = {PCPlus4[31:28],2'b00,Instr_shifted};
    assign PCSrc = ALU_Zero & Branch;
    ALU alu (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Zero(ALU_Zero)
    );
    PC pc(
    .rst(reset),
    .clk(clk),
    .PC_IN(PC_IN),
    .PC_OUT(PC_OUT)
    );
    Instruction_memory IM (
    .A(PC_OUT),
    .RD(Instr)
    );
    MUX #(.N(5))Write_register(
        .In1(Instr[20:16]),
        .In2(Instr[15:11]),
        .out(Write_reg),
        .sel(RegDst)
    );
    
    MUX srcb_alu(
        .In1(WriteData),
        .In2(signlmm),
        .out(SrcB),
        .sel(ALUSrc)
    );

    Register_File RF (
    .clk(clk),
    .reset(reset),
    .A1(Instr[25:21]),
    .A2(Instr[20:16]),
    .A3(Write_reg),
    .WD3(Result),
    .WE3(RegWrite),
    .RD1(SrcA),
    .RD2(WriteData)
    );
    Data_Memory DM (
    .clk(clk),
    .reset(reset),
    .WE(MemWrite),
    .A(ALUResult),
    .WD(WriteData),
    .RD(ReadData),
    .test_value(test_value)
    );
    
    MUX for_Result(
        .In1(ALUResult),
        .In2(ReadData),
        .out(Result),
        .sel(MemtoReg)
    );  
      
    Control_Unit CU (
    .OPcode(Instr[31:26]),
    .funct(Instr[5:0]),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .MemtoReg(MemtoReg),
    .Branch(Branch),
    .jump(Jump),
    .ALUControl(ALUControl)
    );
    Sign_Extend SE (
        .In(Instr[15:0]),
        .Signlmm(signlmm)
    );
    shift_left_twice SIGNLMM(
    .in(signlmm),
    .out(signlmm_shifted)
    );
    shift_left_twice #(.N(26)) Instruc(
    .in(Instr[25:0]),
    .out(Instr_shifted)
    );
    Adder PC4 (
    .A(PC_OUT),
    .B(4),
    .C(PCPlus4)
    );
    Adder PCBrn (
    .A(signlmm_shifted),
    .B(PCPlus4),
    .C(PCBranch)
    );
    MUX for_pc1(
        .In1(PCPlus4),
        .In2(PCBranch),
        .out(forpc1),
        .sel(PCSrc)
    );
    MUX for_pc2(
        .In1(forpc1),
        .In2(PCJump),
        .out(PC_IN),
        .sel(Jump)
    );
endmodule
