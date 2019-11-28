`timescale 1ns/1ns

module argmin_getter_cond(out, state, in0, in1, in2, in3, s0, s1, s2, s3);
    input [3:0] in0, in1, in2, in3;
    input [1:0] s0, s1, s2, s3;
    input [1:0] state;
    output [1:0] out;

    assign out = (state[0])? ((in1 < in3)? s1 : s3) :
                    ((in0 < in2)? s0 : s2);
endmodule

module argmin_getter(out, in0, in1, in2, in3);
    input [3:0] in0, in1, in2, in3;
    output [1:0] out;

    wire [3:0] min01, min23;
    wire [1:0] s01, s23;
    assign s01 = (in0 < in1)? 2'h0 : 2'h1;
    assign s23 = (in2 < in3)? 2'h2 : 2'h3;
    assign min01 = (in0 < in1)? in0 : in1;
    assign min23 = (in2 < in3)? in2 : in3;
    assign out = (min01 < min23)? s01 : s23;
endmodule

module min_getter(out, in0, in1, in2, in3);
    input [3:0] in0, in1, in2, in3;
    output [3:0] out;
    wire [3:0] min01, min23;

    assign min01 = (in0 < in1)? in0 : in1;
    assign min23 = (in2 < in3)? in2 : in3;
    assign out = (min01 < min23)? min01 : min23;
endmodule

module decoder(o, enable, clk, sysclk, in, reset);
    output o; // output
    output reg enable; // whether the output could be used, could be ignored
    input clk, sysclk; // it would be better if sysclk is 64X faster than clk
    input [1:0] in; // 2 bit input
    input reset;

    parameter COUNTER_SIZE = 5;
    parameter BUFF_SIZE = 2 ** COUNTER_SIZE;
    parameter OBUF_SIZE = 2*BUFF_SIZE;

    reg [15:0] err_buf [BUFF_SIZE-1:0];
    reg [7:0] state_buf [BUFF_SIZE-1:0];
    reg [OBUF_SIZE-1:0] out_buf;

    wire [15:0] out_err;
    wire [7:0] out_state;

    reg [COUNTER_SIZE-1:0] counter;
    reg [COUNTER_SIZE-1:0] out_counter;
    reg [1:0] cur_state;
    reg [COUNTER_SIZE-1:0] counter_record;
    reg [COUNTER_SIZE+1:0] buf_tail;
    reg en;
    reg [1:0] cur_min;

    reg [3:0] minerr;
    reg [1:0] consecutive_counter;
    reg [15:0] prev_err;

    reg out_signal;
    reg setter;

    wire [15:0] in_err;
    wire [7:0] in_state;
    wire [3:0] min;
    wire [1:0] argmin_cond;
    wire [1:0] argmin;
    wire out;

    reg [COUNTER_SIZE:0] pointer;

    assign o = out_buf[pointer];
    assign out_err = err_buf[counter_record - out_counter];
    assign out_state = state_buf[counter_record - out_counter];
    assign out = (cur_state[0])? 1'b1 : 1'b0;

    assign out_cond = (&consecutive_counter) & minerr >= min;

    argmin_getter_cond amin_cond(
        .out(argmin_cond),
        .state(cur_state),
        .in0(out_err[15:12]),
        .in1(out_err[11:8]),
        .in2(out_err[7:4]),
        .in3(out_err[3:0]),
        .s0(out_state[7:6]),
        .s1(out_state[5:4]),
        .s2(out_state[3:2]),
        .s3(out_state[1:0])
    );

    argmin_getter amin(
        .out(argmin),
        .in0(in_err[15:12]),
        .in1(in_err[11:8]),
        .in2(in_err[7:4]),
        .in3(in_err[3:0])
    );

    min_getter m(
        .out(min),
        .in0(in_err[15:12]),
        .in1(in_err[11:8]),
        .in2(in_err[7:4]),
        .in3(in_err[3:0])
    );

    tracker t(
        .err(in_err),
        .p_s(in_state),
        .p_err(prev_err),
        .in(in)
    );

    integer i;
    always @(negedge reset or posedge clk)
        if (~reset) begin
            for (i = 0; i < BUFF_SIZE; i = i + 1) begin
                err_buf[i] <= 16'h0000;
                state_buf[i] <= 8'h00;
            end
            prev_err <= 16'h0000;
            counter <= 0;
            minerr <= 4'h0;
            consecutive_counter <= 2'h0;
            counter_record <= 0;
            buf_tail <= 0;
            pointer <= 0;
            enable <= 1'b0;
            out_signal <= 1'b0;
            cur_min <= 2'b00;
        end else begin
            if (out_cond) begin
                cur_min <= argmin;
                out_signal <= 1'b1;
                consecutive_counter <= 2'h0;
                counter_record <= counter;
                minerr <= 4'h0;
                prev_err <= {
                    in_err[15:12] - minerr, 
                    in_err[11:8] - minerr, 
                    in_err[7:4] - minerr, 
                    in_err[3:0] - minerr
                };
                counter <= 0;
            end else if (min > minerr) begin
                out_signal <= 1'b0;
                minerr <= min;
                consecutive_counter <= 2'h0;
                prev_err <= in_err;
                counter <= counter + 1;
            end else begin
                out_signal <= 1'b0;
                consecutive_counter = consecutive_counter + 1;
                prev_err <= in_err;
                counter <= counter + 1;
            end

            err_buf[counter] <= in_err;
            state_buf[counter] <= in_state;

            if (|counter_record) begin
                counter_record <= 0;
                buf_tail <= (buf_tail + counter_record + 1) % OBUF_SIZE;
            end

            if (enable) begin
                pointer <= pointer + 1;
            end

            if (buf_tail > 31)
                enable <= 1'b1;

        end

    always @(negedge reset or posedge sysclk)
        if (~reset) begin
            out_buf <= 32'h00000000;
            out_counter <= 0;
            cur_state <= 2'h0;
            en <= 1'b0;
            setter <= 1'b0;
        end
        else begin
            if (out_signal & (~setter)) begin
                setter <= 1;
                en <= 1'b1;
                cur_state <= cur_min;
            end
            else if (en) begin
                out_counter <= out_counter + 1;
                out_buf[(buf_tail+counter_record-out_counter)%OBUF_SIZE] <= out;
                if (out_counter < counter_record) begin
                    cur_state <= argmin_cond;
                end else begin
                    out_counter <= 0;
                    en <= 1'b0;
                end 
            end

            if (~out_signal)
                setter <= 1'b0;
        end

endmodule


