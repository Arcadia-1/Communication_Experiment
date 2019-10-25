`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 20:35:36
// Design Name: 
// Module Name: channel
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


module channel(
    input clk,
    input data_i,
    output reg data_o
    );
    
    always @ (posedge clk) begin
        data_o <= data_i;
    end
    
endmodule
