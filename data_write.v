`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 01:01:45 PM
// Design Name: 
// Module Name: data_write
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


module data_write(input clk,input key_ready,input[7:0]key_code,output reg write_enable,
output reg[5:0]address
    );
    reg[5:0]addr_counter=6'b000000;
    always@(posedge clk)begin
    if(key_ready)begin
    address<=addr_counter;
    write_enable<=1;
    addr_counter<=addr_counter+1;
    end
    else begin
    write_enable<=0;
    end
    end
    
endmodule
