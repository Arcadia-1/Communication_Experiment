`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:22:01
// Design Name: 
// Module Name: receiver
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


module receiver(
    input clk,
    input sysclk,
    input reset,
    input data_i,
    output data_o
    );
    
    
    
    wire [`decode_width] decode_signal;
    
    demodulator DM(
        .clk(sysclk),
        .reset(reset),
        .data_i(data_i),
        .data_o(decode_signal));
       
    decoder DC (
        .o(data_o), 
        .clk(clk), 
        .sysclk(sysclk), 
        .in(decode_signal), 
        .reset(reset)
    );
    
endmodule
