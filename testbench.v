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
    
    reg receiver_clk;
    reg receiver_LO;
    reg receiver_rst;
    
    reg data_i;
    wire data_o;
    
    initial begin
        transmitter_clk = 1'b0;
        receiver_clk = 1'b0;
        
        forever #`Period begin 
            transmitter_clk = ~transmitter_clk;
            receiver_clk = ~receiver_clk;
        end
    end
    
    initial begin
        receiver_LO = 1'b0;
        
        forever #`OscillatorPeriod begin 
            receiver_LO = ~receiver_LO;
        end
    end
    
    initial begin
        
    end
    
    initial begin
        
        data_i = 0;
        
        transmitter_rst = `RstEnable;
        receiver_rst = `ReceiverRstEnable;
        
        #2 begin
            transmitter_rst = `RstDisable;
            receiver_rst = `ReceiverRstDisable;
        end
        
        #2 begin
            transmitter_rst = `RstEnable;
            receiver_rst = `ReceiverRstEnable;
        end
        
        #2 begin
            transmitter_rst = `RstDisable;
            receiver_rst = `ReceiverRstDisable;
        end
        
        #2 begin
            transmitter_rst = `RstEnable;
            receiver_rst = `ReceiverRstEnable;
        end
        
        #2 begin
            transmitter_rst = `RstDisable;
            receiver_rst = `ReceiverRstDisable;
        end
        
        
        forever begin
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 0;
            #`DataPeriod data_i = 1;
            #`DataPeriod data_i = 1;
        end
    end
    
    system SYS(
        .transmitter_clk(transmitter_clk),
        .transmitter_rst(transmitter_rst), 
        .transmitter_data_i(data_i), 
        
        .receiver_clk(receiver_clk),     //receiver's clk
        .receiver_LO(receiver_LO),      //receiver's local oscillator
        .receiver_rst(receiver_rst),
        .receiver_data_o(data_o)
    );
    
endmodule
