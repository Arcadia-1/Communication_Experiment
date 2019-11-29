`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:43:02
// Design Name: 
// Module Name: demodulator
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

module demodulator(
    input clk,
    input reset,
    input data_i,
    output reg [1:0] data_o
    );
    
    //Your code here
    reg         	count_1; //1period
    reg             count_2;
	reg [6:0] 		clk_count;
    reg [1:0]       temp;
    reg [1:0]       temp_1;
    
    always @(posedge clk or negedge reset) 
    begin
		if (~reset) //1
        begin
			count_1 <= 1'b0;
			count_2 <= 1'b0;
            clk_count <= 6'b0;
            temp    <= 2'b00;
            temp_1  <= 2'b01;
		end 
        else if (data_i == 1'b1 && count_1 == 1'b0 && count_2 == 1'b0)
        begin
                count_1 <= 1'b1;
        end
        else if (data_i == 1'b0 && count_1 == 1'b1)
        begin
                count_2 <= 1;
                clk_count <= clk_count + 6'b1;
        end
        else if (data_i == 1'b1 && count_1 == 1'b1 && count_2 == 1'b1)
        begin
            count_2 <= 1'b0;
            temp_1  <=  (clk_count < 6'd2)?2'b00:
                        (clk_count < 6'd4)?2'b01:
                        (clk_count < 6'd8)?2'b10:2'b11;
            data_o <= (temp_1 == temp)?temp:temp_1;
            temp <= temp_1;
            clk_count <= 6'b0;
        end
	end
    
    
    
endmodule
