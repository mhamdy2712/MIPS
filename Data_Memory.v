`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 04:30:18 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,reset,
    input WE,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD,
    output [15:0] test_value
    );
    integer i;
    reg [31:0] mem [0:99];
    always @(posedge clk,negedge reset)
    begin
        if(~reset)
            for (i=0; i<100; i=i+1) mem[i] <= 2'b00;
        else if(WE)
            mem[A] <= WD;
    end
    assign RD = mem[A];
    assign test_value = mem[0][15:0];
endmodule

