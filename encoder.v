`timescale 1ns/1ns

module encoder(out, clk, in, reset);
    output [1:0] out;
    input clk, in, reset;

    reg [2:0] buffer;

    always @(negedge reset or posedge clk)
        if (~reset)
            buffer <= 3'h0;
        else
            buffer <= {buffer[1:0], in};

    assign out[1] = ^buffer;
    assign out[0] = buffer[2] ^ buffer[0];
endmodule
