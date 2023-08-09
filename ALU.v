`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 02:47:54 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    output [31:0] ALUResult,
    output Zero
    );
    assign Zero = ALUResult == 0;
    reg [31:0] result;
    always @(*) begin
        case(ALUControl)
        0: result = SrcA & SrcB;
        1: result = SrcA | SrcB;
        2: result = SrcA + SrcB;
        4: result = SrcA - SrcB;
        5: result = SrcA * SrcB;
        6: result = SrcA < SrcB;
        default: result = 'bx;
        endcase
    end
    assign ALUResult = result;
endmodule
