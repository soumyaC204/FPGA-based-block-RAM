`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:29:26 PM
// Design Name: 
// Module Name: memory
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


module memory
(input clk,input we, input[5:0]addr_a,input [7:0]din_a,output
[7:0]dout_a);
reg [7:0]ram[2**5:0];
reg[5:0]addr_a_reg;
always@(posedge clk)begin
if(we)begin
ram[addr_a]<=din_a;
addr_a_reg<=addr_a;
 end
 end
 assign dout_a=ram[addr_a_reg];
endmodule
