`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:43:02
// Design Name: 
// Module Name: modulator
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


module modulator (
    input wire clk,
    input wire reset,
    input [1:0] in,
    output wire out    
   );
    
	wire	signal2, signal4, signal8, signal16;
	Divider2 divider2(.reset(reset), .in(clk), .out(signal2));
	Divider2 divider4(.reset(reset), .in(signal2), .out(signal4));
	Divider2 divider8(.reset(reset), .in(signal4), .out(signal8));
	Divider2 divider16(.reset(reset), .in(signal8), .out(signal16));

	assign out 	= 	(in==2'd0)?signal2:
				(in==2'd1)?signal4:
				(in==2'd2)?signal8:
				(in==2'd3)?signal16:1'd0;
endmodule

module Divider2(reset, in, out);            // divide by 2
    input		in, reset;
    output reg	out;
    reg	[3: 0] 	count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 1'b0;
        end 
        else 
        begin
            count = count + 1'b1;
            if(count == 4'd1) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule
