`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:40:33 PM
// Design Name: 
// Module Name: ps2_keyboard
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


module ps2_keyboard(input clk,input ps2_clk,input ps2_data,output reg[7:0] key_code,output reg key_ready,
output reg is_break_code
    );
    reg[10:0]shift_reg=11'h00;
    reg[3:0]bit_count=4'b0;
    reg receiving=1'b0;
    always@(posedge ps2_clk)begin
    if(!receiving)begin
    if(ps2_data==0)begin
    receiving<=1'b1;
    bit_count<=4'b0;
    end
    end
    else begin
    shift_reg<={ps2_data,shift_reg[10:1]};
    bit_count<=bit_count+1;
    if(bit_count==10)begin
    receiving<=1'b0;
    key_code<=shift_reg[8:1];
    key_ready<=1'b1;
    if(key_code==8'hF0)begin
    is_break_code<=1'b1;
    end
    else
    is_break_code<=1'b0;
    end
    end
    end
endmodule
