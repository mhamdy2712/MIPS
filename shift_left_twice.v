`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 04:25:09 PM
// Design Name: 
// Module Name: shift_left_twice
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


module shift_left_twice
    #(parameter N=32)(
    input [N-1:0] in,
    output [N-1:0] out
    );
    assign out = in<<2;
endmodule
