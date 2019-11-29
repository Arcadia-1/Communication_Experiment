module Divider(reset, in, out, times);
    input       in, reset;
    input       [6:0] times;
    output reg  out;
    reg [6: 0]  count;

    always @ (posedge in or negedge reset) 
    begin
        if(~reset) 
        begin
            out   <= 1'b0;
            count <= 6'b0;
        end 
        else 
        begin
            count = count + 6'b1;
            if(count == times) begin
                out   <= ~out;
                count <= 6'd0;
            end
        end
    end
endmodule