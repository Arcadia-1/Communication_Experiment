`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 20:35:36
// Design Name: 
// Module Name: channel
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

module channel(
    input [`channel_width] data_i,
    output [`channel_width] data_o,
    
    input channel_interrupt,
    output channel_led
    );
    
    assign data_o = channel_interrupt ? 0:data_i;
    assign channel_led = channel_interrupt;
    
endmodule
