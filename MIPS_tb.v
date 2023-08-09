`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 09:18:55 PM
// Design Name: 
// Module Name: MIPS_tb
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


module MIPS_tb(

    );
    parameter clk_cycle = 100;
    reg clk,reset;
    wire [15:0] test_value;
    always begin
        clk=0;
        #(0.5*clk_cycle);
        clk=1;
        #(0.5*clk_cycle);
    end
    MIPS my_mips (
    .clk(clk),
    .reset(reset),
    .test_value(test_value)
    );
    initial begin
        reset = 0;
        #(clk_cycle);
        reset = 1;
        #(clk_cycle);
    end
endmodule
