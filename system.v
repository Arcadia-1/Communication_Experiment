`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:25:14
// Design Name: 
// Module Name: system
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


module system(
    input transmitter_clk,
    input transmitter_rst,
    input transmitter_data_i,
    
    //receiver
    input receiver_clk,     //receiver's clk
    input receiver_LO,      //receiver's local oscillator
    input receiver_rst,
    output receiver_data_o
    );
    
    wire [`channel_width] signal_channel_i;
    wire [`channel_width] signal_channel_o;
        
    transmitter TX(
        .clk(transmitter_clk),
        .reset(transmitter_rst),
        .data_i(transmitter_data_i),
        .data_o(signal_channel_i)
    );   
    
    channel CH(
        .data_i(signal_channel_i),
        .data_o(signal_channel_o)
    );
    
    receiver RX(
        .clk(receiver_clk),
        .sysclk(receiver_LO),
        .reset(receiver_rst),
        .data_i(signal_channel_o),
        .data_o(receiver_data_o)
    );
    
endmodule
