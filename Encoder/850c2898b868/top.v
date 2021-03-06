`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:26 11/29/2014 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "firstchange.v"
`include "endchange.v"
`include "subkey_generate_better.v"
`include "Encryption.v"
module top(
    //input [64:1] key,       
    input [64:1] data_in,   
    //input mode,             
	  input clk,             
	 //input rst_n,            
    output [64:1] data_out  
        );
wire [64:1] key ;
assign key = 64'h0001;
wire mode;
assign mode = 1'b1;
wire rst_n;
assign rst_n = 1'b1;
wire [64:1] fstchgedout;
wire [56:1] fstchgekout;
firstchange fstchge_u1(.key(key),.data_in(data_in),.clk(clk),.rst_n(rst_n),.firstchangedout(fstchgedout),.firstchangekout(fstchgekout));

wire [48:1] k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16;
subkey_generate_better subkey_generate_u2(.key_in(key),.mode_in(mode),.subkey_out1(k1),.subkey_out2(k2),.subkey_out3(k3),.subkey_out4(k4),
                        .subkey_out5(k5),.subkey_out6(k6),.subkey_out7(k7),.subkey_out8(k8),.subkey_out9(k9),.subkey_out10(k10),
                        .subkey_out11(k11),.subkey_out12(k12),.subkey_out13(k13),.subkey_out14(k14),.subkey_out15(k15),.subkey_out16(k16));
                        
wire [32:1] L2,R2,L3,R3,L4,R4,L5,R5,L6,R6,L7,R7,L8,R8,L9,R9,L10,R10,L11,R11,L12,R12,L13,R13,L14,R14,L15,R15,L16,R16;
Encryption f1 (.L(fstchgedout[64:33]),.R(fstchgedout[32:1]),.subkey(k1),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R2),.new_L(L2));
Encryption f2 (.L(L2) ,.R(R2) ,.subkey(k2) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R3) ,.new_L(L3)) ;
Encryption f3 (.L(L3) ,.R(R3) ,.subkey(k3) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R4) ,.new_L(L4)) ;
Encryption f4 (.L(L4) ,.R(R4) ,.subkey(k4) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R5) ,.new_L(L5)) ;
Encryption f5 (.L(L5) ,.R(R5) ,.subkey(k5) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R6) ,.new_L(L6)) ;
Encryption f6 (.L(L6) ,.R(R6) ,.subkey(k6) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R7) ,.new_L(L7)) ;
Encryption f7 (.L(L7) ,.R(R7) ,.subkey(k7) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R8) ,.new_L(L8)) ;
Encryption f8 (.L(L8) ,.R(R8) ,.subkey(k8) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R9) ,.new_L(L9)) ;
Encryption f9 (.L(L9) ,.R(R9) ,.subkey(k9) ,.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R10),.new_L(L10));
Encryption f10(.L(L10),.R(R10),.subkey(k10),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R11),.new_L(L11));
Encryption f11(.L(L11),.R(R11),.subkey(k11),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R12),.new_L(L12));
Encryption f12(.L(L12),.R(R12),.subkey(k12),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R13),.new_L(L13));
Encryption f13(.L(L13),.R(R13),.subkey(k13),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R14),.new_L(L14));
Encryption f14(.L(L14),.R(R14),.subkey(k14),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R15),.new_L(L15));
Encryption f15(.L(L15),.R(R15),.subkey(k15),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(R16),.new_L(L16));

/*notice the last time sbox change specially*/
Encryption f16(.L(L16),.R(R16),.subkey(k16),.Encryp_clk(clk),.Encryp_rst_n(rst_n),.new_R(L17),.new_L(R17));

endchange endchange_u3(.endchange_L(L17),.endchange_R(R17),.endchange_clk(clk),.endchange_rst_n(rst_n),.endchange_dout(data_out));


endmodule
