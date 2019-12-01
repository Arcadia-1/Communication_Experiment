`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 19:22:01
// Design Name: 
// Module Name: testbench
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

module testbench();
    reg transmitter_rst;
    reg receiver_LO;
    reg receiver_rst;
    
    wire data_o;
    reg channel_interrupt;
        
    initial begin
        receiver_LO = 1'b0;        
        forever #`OscillatorPeriod receiver_LO = ~receiver_LO;
    end
    
    initial begin
        transmitter_rst = `RstEnable;        
        repeat (3) #`ResetPeriod_Transmitter transmitter_rst = ~transmitter_rst;             
    end
        
    initial begin        
        receiver_rst = `ReceiverRstEnable;        
        repeat (3) #`ResetPeriod_Receiver receiver_rst = ~receiver_rst;       
    end    
    
    initial begin
        channel_interrupt = 0;
        forever begin
            #30000 channel_interrupt = 1;
            #120000 channel_interrupt = 0;
            
        end
    end
    
    system SYS(
        .transmitter_rst(transmitter_rst),         
        .receiver_LO(receiver_LO),       //receiver's local oscillator
        .receiver_rst(receiver_rst),
        .receiver_data_o(data_o),
        .channel_interrupt(channel_interrupt)
    );
    
endmodule
