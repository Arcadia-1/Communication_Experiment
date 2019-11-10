`timescale 10ns/10ns

module test;
    reg sysclk, reset, in;
    wire [1:0] out;
    parameter h_cycle = 3;

    encoder e (
        .clk(sysclk),
        .in(in),
        .reset(reset),
        .out(out));

    initial begin
        sysclk <= 0;
        reset <= 1;
        in <= 0;
        #1 reset <= 0;
        #1 reset <= 1;
        #6 in <= 0;
        #6 in <= 1;
        #6 in <= 0;
        #6 in <= 1;
        #6 in <= 1;
        #6 in <= 1;
        #6 in <= 0;
        #6 in <= 0;
        #6 in <= 1;
        #6 in <= 0;
        #6 in <= 1;
        #6 in <= 0;
        #6 in <= 0;
        #6 in <= 0;
        #6 in <= 1;
        #6 in <= 0;
    end

    initial
        forever #h_cycle
            sysclk = ~sysclk;

endmodule