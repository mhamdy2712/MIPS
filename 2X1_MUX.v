`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 04:27:36 PM
// Design Name: 
// Module Name: 2X1_MUX
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


module MUX
    #(parameter N=32)(
    input [N-1:0] In1,
    input [N-1:0] In2,
    input sel,
    output [N-1:0] out
    );
    assign out = sel ? In2 : In1;
endmodule
