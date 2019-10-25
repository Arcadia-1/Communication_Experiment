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
    input clk,
    input rst,
    input [`DataBus] data_i,
    output [`DataBus] data_o
    );
    
    wire signal_channel_i;
    wire signal_channel_o;
    
    always @ (posedge clk) begin
        if (rst == `RstEnable) begin
            ;
        end 
    end
    
    transmitter TX(clk, data_i, signal_channel_i);
    
    channel CH(clk, signal_channel_i, signal_channel_o);
    
    receiver RX(clk, signal_channel_o, data_o);
    
endmodule
