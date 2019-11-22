module modulate (clk,reset,in,out);
	input 	clk;
	input 	reset;
	input 	[1:0] in;
	output wire	out;
	wire	signal2, signal4, signal8, signal16;
	Divider2 divider2(.reset(reset), .in(clk), .out(signal2));
	Divider4 divider4(.reset(reset), .in(clk), .out(signal4));
	Divider8 divider8(.reset(reset), .in(clk), .out(signal8));
	Divider16 divider16(.reset(reset), .in(clk), .out(signal16));

	assign out 	= 	(in==2'd0)?signal2:
					(in==2'd1)?signal4:
					(in==2'd2)?signal8:
					(in==2'd3)?signal16:1'd0;
endmodule

module Divider2(reset, in, out);            // divide by 2
    input		in, reset;
    output reg	out;
    reg	[3: 0] 	count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 1'b0;
        end 
        else 
        begin
            count = count + 1'b1;
            if(count == 4'd1) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule

module Divider4(reset, in, out);            // divide by 4
    input		in, reset;
    output reg	out;
    reg	[3: 0] 	count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 1'b0;
        end 
        else 
        begin
            count = count + 1'b1;
            if(count == 4'd3) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule

module Divider8(reset, in, out);            // divide by 8
    input		in, reset;
    output reg	out;
    reg	[3: 0] 	count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 1'b0;
        end 
        else 
        begin
            count = count + 1'b1;
            if(count == 4'd7) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule

module Divider16(reset, in, out);            // divide by 16
    input		in, reset;
    output reg	out;
    reg	[3: 0] 	count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 1'b0;
        end 
        else 
        begin
            count = count + 1'b1;
            if(count == 4'd15) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule