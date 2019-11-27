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
    input sysclk,
    input data_i,
    output data_o   
    );
    
    wire [`decode_width] encoded_signal;
    
    encoder EC(
        .clk(clk),
        .in(data_i),
        .out(encoded_signal),
        .reset(reset)
    );    
    
    modulator M(
        .clk(sysclk),        
        .reset(~reset),
        .in(encoded_signal),
        .out(data_o)    
   );    
    
endmodule
