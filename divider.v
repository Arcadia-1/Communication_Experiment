module Divider(reset, in, out, times);
	 localparam width = 9;
    input       in, reset;
    input       [width:0] times;
    output reg  out;
	 
    reg [width: 0]  count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 0;
            count <= 0;
        end 
        else 
        begin
            count = count + 1;
            if(count == times) begin
                out   <= ~out;
                count <= 0;
            end
        end
    end
endmodule