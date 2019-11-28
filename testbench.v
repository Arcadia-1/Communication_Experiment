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


module testbench();
    reg transmitter_clk;
    reg transmitter_rst;
    reg transmitter_data_clk;
    
    reg receiver_clk;
    reg receiver_LO;
    reg receiver_rst;
    
    wire data_o;
    
    initial begin
        receiver_clk = 1'b0;
        forever #`ClkPeriod receiver_clk = ~receiver_clk;
    end
    
    initial begin
        transmitter_clk = 1'b0;
        forever #`ClkPeriod transmitter_clk = ~transmitter_clk;
    end
    
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
        transmitter_data_clk = 0;
        forever #`DataPeriod transmitter_data_clk = ~transmitter_data_clk;
    end
    
    system SYS(
        .transmitter_clk(transmitter_clk),
        .transmitter_rst(transmitter_rst), 
        .transmitter_data_clk(transmitter_data_clk),    //m sequence's clk
        
        .receiver_clk(receiver_clk),     //receiver's clk
        .receiver_LO(receiver_LO),       //receiver's local oscillator
        .receiver_rst(receiver_rst),
        .receiver_data_o(data_o)
    );
    
endmodule
