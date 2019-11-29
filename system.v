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
`include "defines.v"

module system(
    input transmitter_rst,
    
    //receiver
    input receiver_LO,      //receiver's local oscillator
    input receiver_rst,
    output receiver_data_o
    );
    
    wire transmitter_data_i;
    wire [`Mwidth] m_sequence_reg;
    wire [`channel_width] signal_channel_i;
    wire [`channel_width] signal_channel_o;
    wire transmitter_clk;
    wire transmitter_data_clk;
    wire receiver_clk;

    Divider divider_rclk(
        .reset(receiver_rst),
        .in(receiver_LO),
        .out(receiver_clk),
        .times(16)
    );
    
    Divider divider_dataclk(
        .reset(receiver_rst),
        .in(receiver_clk),
        .out(transmitter_data_clk),
        .times(8)
    );

    assign transmitter_clk = receiver_clk;

    M_sequence MS(
        .sys_clk(transmitter_data_clk),
        .sys_rst_n(transmitter_rst),
        .out(transmitter_data_i),
        .shift(m_sequence_reg)
    );
    
    transmitter TX(
        .clk(transmitter_clk),
        .sysclk(receiver_LO),
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
