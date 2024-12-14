`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:52:58 PM
// Design Name: 
// Module Name: scan_to_ascii
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


module scan_to_ascii(input [7:0]scan_code,input is_break_code,output reg[7:0]ascii,output reg 
valid
    );
    always@(*)begin
    valid=1'b0;
    ascii=8'h00;
    if(!is_break_code)begin
    case(scan_code)
    8'h1C:ascii="A";
    default:ascii=8'h00;
    endcase
    valid=(ascii!=8'h00);
    end
    end
endmodule
