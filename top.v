`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 01:07:57 PM
// Design Name: 
// Module Name: top
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


module top(input clk,input ps2_clk,input ps2_data, output [7:0]dout 

    );
    wire [5:0]address_a;
    wire [7:0]key_code;
    wire we,valid,is_break_code,key_ready;
    wire [7:0]ascii;
    ps2_keyboard keyboard(.clk(clk),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.key_code(key_code),.is_break_code
    (is_break_code),.key_ready(key_ready));
    scan_to_ascii scan(.scan_code(key_code),.is_break_code(is_break_code),.ascii(ascii),.valid
    (valid));
    data_write write(.clk(clk),.key_ready(key_ready),.key_code(ascii),.write_enable(we),.address(address_a));
    memory memorywrite(.clk(clk),.we(we),.addr_a(address_a),.din_a(ascii),.dout_a(dout));
endmodule
