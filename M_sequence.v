`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/22 21:28:55
// Design Name: 
// Module Name: M_sequence
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
`include "defines.v"

module M_sequence #(parameter N = 9)(
    input wire clk, 
    input wire reset,
    output wire data_o
);    
    reg [N:0] shift_reg;

//    wire feedback = shift_reg[4] ^ shift_reg[3] ^ shift_reg[0];   //N = 4    
    wire feedback = shift_reg[9] ^ shift_reg[5] ^ shift_reg[0]; //N=9
                        
    always @(posedge clk, posedge reset) begin 
        if (reset) begin
            shift_reg <= 1;
        end else begin
            shift_reg <= {feedback,shift_reg[N:1]};
        end
    end
    
    assign data_o = shift_reg[0];
endmodule  