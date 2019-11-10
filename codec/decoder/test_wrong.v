`timescale 10ns/10ns

module test_wrong;
    reg sysclk, clk, reset;
    reg [1:0] in;
    wire [1:0] out;
    wire en;
    parameter h_sys_cycle = 3;
    parameter h_cycle = 50 * h_sys_cycle;

    decoder d (
        .clk(clk),
        .sysclk(sysclk),
        .in(in),
        .reset(reset),
        .out(out),
        .en(en)
    );

    initial begin
        sysclk <= 0;
        clk <= 0;
        reset <= 1;
        in <= 0;
        #1 reset <= 0;
        #1 reset <= 1;
        #330 in <= 2'b00;
        #300 in <= 2'b11;
        #300 in <= 2'b11;
        #300 in <= 2'b00;
        #300 in <= 2'b01;
        #300 in <= 2'b10;
        #300 in <= 2'b01;
        #300 in <= 2'b11;
        #300 in <= 2'b11;
        #300 in <= 2'b10;
        #300 in <= 2'b00;
        #300 in <= 2'b00;
        #300 in <= 2'b11;
        #300 in <= 2'b00;
        #300 in <= 2'b11;
        #300 in <= 2'b10;
        #300 in <= 2'b11;
        #300 in <= 2'b00;
    end

    initial
        forever #h_sys_cycle
            sysclk = ~sysclk;

    initial
        forever #h_cycle
            clk = ~clk;

endmodule