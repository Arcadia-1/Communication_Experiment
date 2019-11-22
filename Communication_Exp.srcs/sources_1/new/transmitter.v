`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:22:01
// Design Name: 
// Module Name: transmitter
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


module transmitter(
    input clk,
    input reset,
    input data_i,
    output [`channel_width] data_o   
    );
    
    wire [`channel_width] encoded_signal;
    
    encoder EC(
        .clk(clk),
        .in(data_i),
        .out(encoded_signal),
        .reset(reset)
    );    
    assign data_o = encoded_signal;
    
//    modulator M(clk, encoded_signal, data_o);
    
endmodule
