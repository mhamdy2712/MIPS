`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 03:03:27 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] PC_IN,
    output [31:0] PC_OUT,
    input rst,
    input clk
    );
    reg [31:0] pc;
    always @(posedge clk,negedge rst)
    begin
        if(~rst)
            pc <= 0;
        else
            pc <= PC_IN;
    end
    assign PC_OUT = pc;
endmodule
