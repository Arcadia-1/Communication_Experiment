module testmodulate;
	reg clk;
	reg [1:0]in;
	reg reset;
	wire out;

	modulate mtest(.clk(clk),.reset(reset),.in(in),.out(out));

	always
	begin
		#2 clk = ~clk;
	end

	initial
	begin
		reset 	<=	1'b1;
		#5 reset <= 1'b0;
		#5 reset <= 1'b1;
		clk <= 1'b0;
		in 	<= 2'd0;
		#512 in <= 2'd1;
		#512 in <= 2'd2;
		#512 in <= 2'd3;
		#512 in <= 2'd0;
		#512 in <= 2'd2;
		#512 in <= 2'd0;
		#512 in <= 2'd3;
		#512 in <= 2'd1;
		#512 in <= 2'd3;
		#512 in <= 2'd2;
		#512 in <= 2'd1;
		#512 in <= 2'd0;
	end


endmodule