`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 03:52:37 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] OPcode,
    input [5:0] funct,
    output jump,
    output MemtoReg,
    output MemWrite,
    output Branch,
    output ALUSrc,
    output RegDst,
    output RegWrite,
    output [2:0] ALUControl
    );
    wire [1:0] ALUOp;
    reg [2:0] Aluc;
    assign jump = OPcode==6'b000010;
    assign MemWrite = OPcode==6'b101011;
    assign RegWrite = (OPcode==6'b100011 || OPcode==6'b000000 || OPcode==6'b001000);
    assign RegDst = OPcode==6'b000000;
    assign ALUSrc = (OPcode==6'b100011 || OPcode==6'b101011 || OPcode==6'b001000);
    assign MemtoReg = (OPcode==6'b100011 || OPcode==6'b101011);
    assign Branch = OPcode==6'b000100;
    assign ALUOp = OPcode==6'b000000 ? 2'b10 : OPcode==6'b000100 ? 2'b01 : 2'b00;
    always @(*) begin
        case(ALUOp)
            2'b00: Aluc = 3'b010;
            2'b01: Aluc = 3'b100;
            2'b10: begin
                    case(funct)
                        6'b100000: Aluc = 3'b010;
                        6'b100010: Aluc = 3'b100;
                        6'b101010: Aluc = 3'b110;
                        6'b011100: Aluc = 3'b101;
                        default: Aluc = 3'b011;
                    endcase
                end
            default: Aluc = 3'b010;
        endcase
    end
    assign ALUControl = Aluc;
endmodule
