`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/30 15:39:39
// Design Name: 
// Module Name: error_counter
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


module error_counter #(parameter width = 12)(
    input wire data_i,
    input wire data_o,
    input wire rst,
    input wire signal_clk,
    output reg [width:0] number_right,
    output reg [width:0] number_wrong
    );
    
    reg [width:0] number_total;
    
    always @ (posedge rst, posedge signal_clk) begin
        if (rst) begin
            number_right <= 0;
            number_wrong <= 0;
            number_total <= 0;
        end else begin
            number_total = number_total + 1;
            
            if (data_o == data_i) begin
                number_right = number_right + 1;
            end else begin 
                number_wrong = number_wrong + 1;
            end
        end
        
    end
    
endmodule








