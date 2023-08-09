`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 03:30:35 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input clk,
    input WE3,
    input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    output [31:0] RD1,
    output [31:0] RD2
    );
    integer i;
    reg [31:0] mem [0:99];
    always @(posedge clk,negedge reset)
    begin
        if(~reset)
            for (i=0; i<100; i=i+1) mem[i] <= 2'b00;
        else if(WE3)
            mem[A3] <= WD3;
    end
    assign RD1 = mem[A1];
    assign RD2 = mem[A2];
endmodule
