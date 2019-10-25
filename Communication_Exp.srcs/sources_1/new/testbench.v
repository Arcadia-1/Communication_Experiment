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


module testbench(

    );
    reg sysclk;
    reg reset;
    reg [`DataBus] data_i;
    wire [`DataBus] data_o;
    
    initial begin
        sysclk = 1'b0;
        forever #5 sysclk = ~sysclk;
    end
    
    initial begin
        reset = `RstEnable;
        #20 reset = `RstDisable;
//        #20000000 $stop;
    end
    
    initial begin
        data_i = `DataWidth'b0001;
        forever #24 data_i = data_i + 1;
    end
    
    system SYS(sysclk, reset, data_i, data_o);
    
endmodule
