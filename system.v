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
    input receiver_LO,      //receiver's local oscillator
    output receiver_data_o,
    
    input receiver_rst,
    input transmitter_rst,
    
    output m_sequence_out,
    
    output led_out_rst_t,   //transmitter reset display
    output led_out_rst_r,   //receirver reset display
        
    input channel_interrupt,     //error code control button
    output channel_led      //error code display
    );
    
    assign led_out_rst_t = transmitter_rst;
	assign led_out_rst_r = receiver_rst;
	 
//    wire [`Mwidth] m_sequence_reg;
    wire [`channel_width] signal_channel_i;
    wire [`channel_width] signal_channel_o;
    wire transmitter_clk;
    wire transmitter_data_clk;
    wire receiver_clk;
    
    wire number_right;
    wire number_wrong;

    Divider divider_rclk(
        .reset(receiver_rst),
        .in(receiver_LO),
        .out(receiver_clk),
        .times(128)
    );
    
    Divider divider_dataclk(
        .reset(receiver_rst),
        .in(receiver_clk),
        .out(transmitter_data_clk),
        .times(80)
    );

	assign transmitter_clk = receiver_clk; 
	
	M_sequence MS(
        .clk(transmitter_data_clk), 
        .reset(transmitter_rst),
        .data_o(m_sequence_out)
	);
	    
    transmitter TX(
        .clk(transmitter_clk),
        .sysclk(receiver_LO),
        .reset(transmitter_rst),
        .data_i(m_sequence_out),
        .data_o(signal_channel_i)
    );   
    
    channel CH(
        .data_i(signal_channel_i),
        .data_o(signal_channel_o),
        .channel_interrupt(channel_interrupt),
        .channel_led(channel_led)
    );
    
    receiver RX(
        .clk(receiver_clk),
        .sysclk(receiver_LO),
        .reset(receiver_rst),
        .data_i(signal_channel_o),
        .data_o(receiver_data_o)
    );
    
    error_counter EC(
        .data_i(m_sequence_out),
        .data_o(receiver_data_o),
        .signal_clk(transmitter_data_clk),
        .number_right(number_right),
        .number_wrong(number_wrong),
        .rst(transmitter_rst)
    );
    
endmodule
