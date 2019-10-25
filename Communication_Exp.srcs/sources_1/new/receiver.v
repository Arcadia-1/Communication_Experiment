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
    input data_i,
    output [`DataBus] data_o   
    );
    
    wire demodulated_signal;    
    
    demodulator DM(clk, data_i, demodulated_signal);
    decoder DC(clk, demodulated_signal, data_o);
endmodule
