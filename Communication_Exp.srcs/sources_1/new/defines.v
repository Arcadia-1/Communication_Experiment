`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:57:03
// Design Name: 
// Module Name: defines
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

`ifndef defines_v
`define defines_v

module defines;
    //global macros
    `define RstEnable           1'b1    //reset enable
    `define RstDisable          1'b0    //reset disable
    
    `define ReceiverRstEnable   1'b0    //reset enable
    `define ReceiverRstDisable  1'b1    //reset disable
    
    `define DataWidth           0       //exterior data width = 4
    `define DataBus             `DataWidth:0     //
    
    //simulation
    `define Period              64
    `define DataPeriod          148
    `define OscillatorPeriod    1
    
    
    //encoder
    
    //receiver
    `define decode_width        1:0
    
    
    //channel
    `define channel_width       1:0
    
    
endmodule

`endif