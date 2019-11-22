`timescale 1ns/1ns

module tracker(err, p_s, p_err, in);
    /* 
    This module convert a 2-bit input into a trackable record.
    Three tables are expected to be maintained:
        Error table [T, 4 * 4] error of each ending state of each step.
        Previous state table [T, 4 * 2] a mapping of each state and previous state.
    This module offers record to be recorded in the following 3 tables.
    */
    output [15:0] err; // accumulate error of each state
    output [7:0] p_s; // previous state
    input [15:0] p_err; // previous error
    input [1:0] in; // current input 2-bit code

    // unpack previous error
    wire [3:0] p_e0, p_e1, p_e2, p_e3;
    // state 00, bit 15:12
    assign p_e0 = p_err[15:12];
    // state 01, bit 11:8
    assign p_e1 = p_err[11:8];
    // state 10, bit 7:4
    assign p_e2 = p_err[7:4];
    // state 11, bit 3:0
    assign p_e3 = p_err[3:0];

    // compute error of current two inputs
    wire [1:0] e0, e1, e2, e3;
    assign e0 = in[0] + in[1]; // difference of 0 and input is number of 1 in input
    assign e1 = in[1] + 1 - in[0]; // difference of 1 and input
    assign e2 = 1 - in[1] + in[0]; // difference of 2 and input
    assign e3 = (~in[0]) + (~in[1]); // difference of 3 and input
    
    // accumulate error of each path
    // error from state x to state y is denoted as exy
    wire [3:0] e00, e01, e12, e13, e20, e21, e32, e33;
    assign e00 = e0 + p_e0; // path from 0 to 0 maps to output 0
    assign e01 = e3 + p_e0; // path from 0 to 1 maps to output 3
    assign e12 = e2 + p_e1; // path from 1 to 2 maps to output 2
    assign e13 = e1 + p_e1; // path from 1 to 3 maps to output 1
    assign e20 = e3 + p_e2; // path from 2 to 0 maps to output 3
    assign e21 = e0 + p_e2; // path from 2 to 1 maps to output 0
    assign e32 = e1 + p_e3; // path from 3 to 2 maps to output 1
    assign e33 = e2 + p_e3; // path from 3 to 3 maps to output 2

    // make a choice from previous states based on accumulated error
    wire [1:0] p_s0, p_s1, p_s2, p_s3;
    assign p_s0 = (e00 < e20)? 2'h0 : 2'h2;
    assign p_s1 = (e01 < e21)? 2'h0 : 2'h2;
    assign p_s2 = (e12 < e32)? 2'h1 : 2'h3;
    assign p_s3 = (e13 < e33)? 2'h1 : 2'h3;

    assign p_s = {p_s0, p_s1, p_s2, p_s3};

    // record corresponding path error
    wire [3:0] err0, err1, err2, err3;
    assign err0 = (e00 < e20)? e00 : e20;
    assign err1 = (e01 < e21)? e01 : e21;
    assign err2 = (e12 < e32)? e12 : e32;
    assign err3 = (e13 < e33)? e13 : e33;

    assign err = {err0, err1, err2, err3};

endmodule