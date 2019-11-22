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
    input [`channel_width] data_i,
    output data_o
    );
    
//    wire demodulated_signal;
//    demodulator DM(clk, data_i, demodulated_signal);

    wire [`decode_width] decode_signal;
    assign decode_signal = data_i;
    
   
    decoder DC (
        .o(data_o), 
        .clk(clk), 
        .sysclk(sysclk), 
        .in(decode_signal), 
        .reset(reset)
    );
    
endmodule
