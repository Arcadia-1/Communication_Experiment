`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/02 20:51:54
// Design Name: 
// Module Name: running_light
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

module running_light(
	input clk,
	input rst,
	input data_i,
	output reg [7:0] light);

	always @(posedge rst,posedge clk) begin
		if (rst==1) begin
			light[7:0] <= 0;
		end else begin
			light[7:0] <= {data_i,light[7:1]};
		end
	end

endmodule
