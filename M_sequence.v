`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/22 21:28:55
// Design Name: 
// Module Name: M_sequence
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


module M_sequence(
    input sys_clk,
    input sys_rst_n,
    output out,
    output [`Mwidth] shift
    );

    reg [`Mwidth] rShift;//4λ��λ�Ĵ���
    reg rOut;
    wire feedback = rShift[ 0 ] ^ rShift[ 3 ];
    
    always @( posedge sys_clk ) begin
        if( sys_rst_n == `RstEnable ) begin //��ʼ��
            rShift <= 'b0110;
            rOut <= 1'b0;
        end else begin
            rShift <= { feedback,rShift[ 3:1 ] }; //��λ����
            rOut <= rShift[ 0 ];           
        end
    end

    assign out= rOut;
    assign shift = rShift;
    
endmodule

