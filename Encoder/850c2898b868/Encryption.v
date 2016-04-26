`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:28 11/30/2014 
// Design Name: 
// Module Name:    Encryption 
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
module Encryption(
    input [32:1] L,  //connected to the firstchangedout [63:32]
    input [32:1] R,  //connected to the firstchangedout [31:0 ]
    input [48:1] subkey,  //connected to the subkey_out [47:0 ]
    input Encryp_clk,     //same to the subkey_clk
    input Encryp_rst_n,   //same to the subkey_rst_n
//  input En,            //work controler
    output reg [32:1] new_R,
    output reg [32:1] new_L
    );
    


wire [48:1] Expend_R_out;
wire [48:1] subkey_xor_Expend_R;

/*Expend the R from 32bit to 48 bit*/
 assign Expend_R_out = { R[32],R[1] ,R[2] ,R[3] ,R[4] ,R[5],
		                    R[4] ,R[5] ,R[6] ,R[7] ,R[8] ,R[9],
								        R[8] ,R[9] ,R[10],R[11],R[12],R[13],
								        R[12],R[13],R[14],R[15],R[16],R[17],
								        R[16],R[17],R[18],R[19],R[20],R[21],
								        R[20],R[21],R[22],R[23],R[24],R[25],
								        R[24],R[25],R[26],R[27],R[28],R[29],
								        R[28],R[29],R[30],R[31],R[32],R[1] };
/*subkey xor Expend_R*/								        
assign subkey_xor_Expend_R = (subkey ^ Expend_R_out);
								        
/*devide subkey_xor_Expend_R into 8 group*/
wire [6:1] S_xor_R_1;
wire [6:1] S_xor_R_2;
wire [6:1] S_xor_R_3;
wire [6:1] S_xor_R_4;
wire [6:1] S_xor_R_5;
wire [6:1] S_xor_R_6;
wire [6:1] S_xor_R_7;
wire [6:1] S_xor_R_8;
assign {S_xor_R_1,S_xor_R_2,S_xor_R_3,S_xor_R_4,S_xor_R_5,S_xor_R_6,S_xor_R_7,S_xor_R_8} = subkey_xor_Expend_R[48:1];

/*8 s change array parameters
reg [4:1] s1 [1:64] = {4'd14,4'd4 ,4'd13,4'd1 ,4'd2 ,4'd15,4'd11,4'd8 ,4'd3 ,4'd10,4'd6 ,4'd12,4'd5 ,4'd9 ,4'd0 ,4'd7 ,
                            4'd0 ,4'd15,4'd7 ,4'd4 ,4'd14,4'd2 ,4'd13,4'd1 ,4'd10,4'd6 ,4'd12,4'd11,4'd9 ,4'd5 ,4'd3 ,4'd8 ,
							              4'd4 ,4'd1 ,4'd14,4'd8 ,4'd13,4'd6 ,4'd2 ,4'd11,4'd15,4'd12,4'd9 ,4'd7 ,4'd3 ,4'd10,4'd5 ,4'd0 ,
							              4'd15,4'd12,4'd8 ,4'd2 ,4'd4 ,4'd9 ,4'd1 ,4'd7 ,4'd5 ,4'd11,4'd3 ,4'd14,4'd10,4'd0 ,4'd6 ,4'd13 };

reg [4:1] s2 [1:64] = {4'd15,4'd1 ,4'd8 ,4'd14,4'd6 ,4'd11,4'd3 ,4'd4 ,4'd9 ,4'd7 ,4'd2 ,4'd13,4'd12,4'd0 ,4'd5 ,4'd10,
                            4'd3 ,4'd13,4'd4 ,4'd7 ,4'd15,4'd2 ,4'd8 ,4'd14,4'd12,4'd0 ,4'd1 ,4'd10,4'd6 ,4'd9 ,4'd11,4'd5 ,
                            4'd0 ,4'd14,4'd7 ,4'd11,4'd10,4'd4 ,4'd13,4'd1 ,4'd5 ,4'd8 ,4'd12,4'd6 ,4'd9 ,4'd3 ,4'd2 ,4'd15,
                            4'd13,4'd8 ,4'd10,4'd1 ,4'd3 ,4'd15,4'd4 ,4'd2 ,4'd11,4'd6 ,4'd7 ,4'd12,4'd0 ,4'd5 ,4'd14,4'd9  };

reg [4:1] s3 [1:64] = {4'd10,4'd0 ,4'd9 ,4'd14,4'd6 ,4'd3 ,4'd15,4'd5 ,4'd1 ,4'd13,4'd12,4'd7 ,4'd11,4'd4 ,4'd2 ,4'd8 ,
                            4'd13,4'd7 ,4'd0 ,4'd9 ,4'd3 ,4'd4 ,4'd6 ,4'd10,4'd2 ,4'd8 ,4'd5 ,4'd14,4'd12,4'd11,4'd15,4'd1 ,
                            4'd13,4'd6 ,4'd4 ,4'd9 ,4'd8 ,4'd15,4'd3 ,4'd0 ,4'd11,4'd1 ,4'd2 ,4'd12,4'd5 ,4'd10,4'd14,4'd7 ,
                            4'd1 ,4'd10,4'd13,4'd0 ,4'd6 ,4'd9 ,4'd8 ,4'd7 ,4'd4 ,4'd15,4'd14,4'd3 ,4'd11,4'd5 ,4'd2 ,4'd12 };

reg [4:1] s4 [1:64] = {4'd7 ,4'd13,4'd14,4'd3 ,4'd0 ,4'd6 ,4'd9 ,4'd10,4'd1 ,4'd2 ,4'd8 ,4'd5 ,4'd11,4'd12,4'd4 ,4'd15,
                            4'd13,4'd8 ,4'd11,4'd5 ,4'd6 ,4'd15,4'd0 ,4'd3 ,4'd4 ,4'd7 ,4'd2 ,4'd12,4'd1 ,4'd10,4'd14,4'd9 ,
                            4'd10,4'd6 ,4'd9 ,4'd0 ,4'd12,4'd11,4'd7 ,4'd13,4'd15,4'd1 ,4'd3 ,4'd14,4'd5 ,4'd2 ,4'd8 ,4'd4 ,
                            4'd3 ,4'd15,4'd0 ,4'd6 ,4'd10,4'd1 ,4'd13,4'd8 ,4'd9 ,4'd4 ,4'd5 ,4'd11,4'd12,4'd7 ,4'd2 ,4'd14 };

reg [4:1] s5 [1:64] = {4'd2 ,4'd12,4'd4 ,4'd1 ,4'd7 ,4'd10,4'd11,4'd6 ,4'd8 ,4'd5 ,4'd3 ,4'd15,4'd13,4'd0 ,4'd14,4'd9 ,
                            4'd14,4'd11,4'd2 ,4'd12,4'd4 ,4'd7 ,4'd13,4'd1 ,4'd5 ,4'd0 ,4'd15,4'd10,4'd3 ,4'd9 ,4'd8 ,4'd6 ,
                            4'd4 ,4'd2 ,4'd1 ,4'd11,4'd10,4'd13,4'd7 ,4'd8 ,4'd15,4'd9 ,4'd12,4'd5 ,4'd6 ,4'd3 ,4'd0 ,4'd14,
                            4'd11,4'd8 ,4'd12,4'd7 ,4'd1 ,4'd14,4'd2 ,4'd13,4'd6 ,4'd15,4'd0 ,4'd9 ,4'd10,4'd4 ,4'd5 ,4'd3  };

reg [4:1] s6 [1:64] = {4'd12,4'd1 ,4'd10,4'd15,4'd9 ,4'd2 ,4'd6 ,4'd8 ,4'd0 ,4'd13,4'd3 ,4'd4 ,4'd14,4'd7 ,4'd5 ,4'd11,
                            4'd10,4'd15,4'd4 ,4'd2 ,4'd7 ,4'd12,4'd9 ,4'd5 ,4'd6 ,4'd1 ,4'd13,4'd14,4'd0 ,4'd11,4'd3 ,4'd8 ,
                            4'd9 ,4'd14,4'd15,4'd5 ,4'd2 ,4'd8 ,4'd12,4'd3 ,4'd7 ,4'd0 ,4'd4 ,4'd10,4'd1 ,4'd13,4'd11,4'd6 ,
                            4'd4 ,4'd3 ,4'd2 ,4'd12,4'd9 ,4'd5 ,4'd15,4'd10,4'd11,4'd14,4'd1 ,4'd7 ,4'd6 ,4'd0 ,4'd8 ,4'd13 };							  

reg [4:1] s7 [1:64] = {4'd4 ,4'd11,4'd2 ,4'd14,4'd15,4'd0 ,4'd8 ,4'd13,4'd3 ,4'd12,4'd9 ,4'd7 ,4'd5 ,4'd10,4'd6 ,4'd1 ,
                            4'd13,4'd0 ,4'd11,4'd7 ,4'd4 ,4'd9 ,4'd1 ,4'd10,4'd14,4'd3 ,4'd5 ,4'd12,4'd2 ,4'd15,4'd8 ,4'd6 ,
                            4'd1 ,4'd4 ,4'd11,4'd13,4'd12,4'd3 ,4'd7 ,4'd14,4'd10,4'd15,4'd6 ,4'd8 ,4'd0 ,4'd5 ,4'd9 ,4'd2 ,
                            4'd6 ,4'd11,4'd13,4'd8 ,4'd1 ,4'd4 ,4'd10,4'd7 ,4'd9 ,4'd5 ,4'd0 ,4'd15,4'd14,4'd2 ,4'd3 ,4'd12 };

reg [4:1] s8 [1:64] = {4'd13,4'd2 ,4'd8 ,4'd4 ,4'd6 ,4'd15,4'd11,4'd1 ,4'd10,4'd9 ,4'd3 ,4'd14,4'd5 ,4'd0 ,4'd12,4'd7 ,
                            4'd1 ,4'd15,4'd13,4'd8 ,4'd10,4'd3 ,4'd7 ,4'd4 ,4'd12,4'd5 ,4'd6 ,4'd11,4'd0 ,4'd14,4'd9 ,4'd2 ,
                            4'd7 ,4'd11,4'd4 ,4'd1 ,4'd9 ,4'd12,4'd14,4'd2 ,4'd0 ,4'd6 ,4'd10,4'd13,4'd15,4'd3 ,4'd5 ,4'd8 ,
                            4'd2 ,4'd1 ,4'd14,4'd7 ,4'd4 ,4'd10,4'd8 ,4'd13,4'd15,4'd12,4'd9 ,4'd0 ,4'd3 ,4'd5 ,4'd6 ,4'd11 };

*/

/*s change*/
reg [4:1]s1_out,s2_out,s3_out,s4_out,s5_out,s6_out,s7_out,s8_out; /*8 output from sbox*/
wire [32:1] s_out;
assign s_out = {s1_out,s2_out,s3_out,s4_out,s5_out,s6_out,s7_out,s8_out};
//sbox_1 change				  
always @(S_xor_R_1)		
  begin
    case (S_xor_R_1)
      6'b000000 : s1_out = 4'd14;
      6'b000001 : s1_out = 4'd0 ;
      6'b000010 : s1_out = 4'd4 ;
      6'b000011 : s1_out = 4'd15;
      6'b000100 : s1_out = 4'd13;
      6'b000101 : s1_out = 4'd7 ;
      6'b000110 : s1_out = 4'd1 ;
      6'b000111 : s1_out = 4'd4 ;
      6'b001000 : s1_out = 4'd2 ;
      6'b001001 : s1_out = 4'd14;
      6'b001010 : s1_out = 4'd15;
      6'b001011 : s1_out = 4'd2 ;
      6'b001100 : s1_out = 4'd11;
      6'b001101 : s1_out = 4'd13;
      6'b001110 : s1_out = 4'd8 ;
      6'b001111 : s1_out = 4'd1 ;
      6'b010000 : s1_out = 4'd3 ;
      6'b010001 : s1_out = 4'd10;
      6'b010010 : s1_out = 4'd10;
      6'b010011 : s1_out = 4'd6 ;
      6'b010100 : s1_out = 4'd6 ;
      6'b010101 : s1_out = 4'd12;
      6'b010110 : s1_out = 4'd12;
      6'b010111 : s1_out = 4'd11;
      6'b011000 : s1_out = 4'd5 ;
      6'b011001 : s1_out = 4'd9 ;
      6'b011010 : s1_out = 4'd9 ;
      6'b011011 : s1_out = 4'd5 ;
      6'b011100 : s1_out = 4'd0 ;
      6'b011101 : s1_out = 4'd3 ;
      6'b011110 : s1_out = 4'd7 ;
      6'b011111 : s1_out = 4'd8 ;
      6'b100000 : s1_out = 4'd4 ;
      6'b100001 : s1_out = 4'd15;
      6'b100010 : s1_out = 4'd1 ;
      6'b100011 : s1_out = 4'd12;
      6'b100100 : s1_out = 4'd14;
      6'b100101 : s1_out = 4'd8 ;
      6'b100110 : s1_out = 4'd8;
      6'b100111 : s1_out = 4'd2 ;
      6'b101000 : s1_out = 4'd13;
      6'b101001 : s1_out = 4'd4 ;
      6'b101010 : s1_out = 4'd6 ;
      6'b101011 : s1_out = 4'd9 ;
      6'b101100 : s1_out = 4'd2 ;
      6'b101101 : s1_out = 4'd1 ;
      6'b101110 : s1_out = 4'd11;
      6'b101111 : s1_out = 4'd7 ;
      6'b110000 : s1_out = 4'd15;
      6'b110001 : s1_out = 4'd5 ;
      6'b110010 : s1_out = 4'd12;
      6'b110011 : s1_out = 4'd11;
      6'b110100 : s1_out = 4'd9 ;
      6'b110101 : s1_out = 4'd3 ;
      6'b110110 : s1_out = 4'd7 ;
      6'b110111 : s1_out = 4'd14;
      6'b111000 : s1_out = 4'd3 ;
      6'b111001 : s1_out = 4'd10;
      6'b111010 : s1_out = 4'd10;
      6'b111011 : s1_out = 4'd0 ;
      6'b111100 : s1_out = 4'd5 ;
      6'b111101 : s1_out = 4'd6 ;
      6'b111110 : s1_out = 4'd0 ;
      6'b111111 : s1_out = 4'd13;  
    endcase
  end
//sbox_2 change 
always @(S_xor_R_2)		
  begin
    case (S_xor_R_2)
      6'b000000 : s2_out = 4'd15;
      6'b000001 : s2_out = 4'd3 ;
      6'b000010 : s2_out = 4'd1 ;
      6'b000011 : s2_out = 4'd13;
      6'b000100 : s2_out = 4'd8 ;
      6'b000101 : s2_out = 4'd4 ;
      6'b000110 : s2_out = 4'd14;
      6'b000111 : s2_out = 4'd7 ;
      6'b001000 : s2_out = 4'd6 ;
      6'b001001 : s2_out = 4'd15;
      6'b001010 : s2_out = 4'd11;
      6'b001011 : s2_out = 4'd2 ;
      6'b001100 : s2_out = 4'd3 ;
      6'b001101 : s2_out = 4'd8 ;
      6'b001110 : s2_out = 4'd4 ;
      6'b001111 : s2_out = 4'd14;
      6'b010000 : s2_out = 4'd9 ;
      6'b010001 : s2_out = 4'd12;
      6'b010010 : s2_out = 4'd7 ;
      6'b010011 : s2_out = 4'd0 ;
      6'b010100 : s2_out = 4'd2 ;
      6'b010101 : s2_out = 4'd1 ;
      6'b010110 : s2_out = 4'd13;
      6'b010111 : s2_out = 4'd10;
      6'b011000 : s2_out = 4'd12;
      6'b011001 : s2_out = 4'd6 ;
      6'b011010 : s2_out = 4'd0 ;
      6'b011011 : s2_out = 4'd9 ;
      6'b011100 : s2_out = 4'd5 ;
      6'b011101 : s2_out = 4'd11;
      6'b011110 : s2_out = 4'd10;
      6'b011111 : s2_out = 4'd5 ;
      6'b100000 : s2_out = 4'd0 ;
      6'b100001 : s2_out = 4'd13;
      6'b100010 : s2_out = 4'd14;
      6'b100011 : s2_out = 4'd8 ;
      6'b100100 : s2_out = 4'd7 ;
      6'b100101 : s2_out = 4'd10;
      6'b100110 : s2_out = 4'd11;
      6'b100111 : s2_out = 4'd1 ;
      6'b101000 : s2_out = 4'd10;
      6'b101001 : s2_out = 4'd3 ;
      6'b101010 : s2_out = 4'd4 ;
      6'b101011 : s2_out = 4'd15;
      6'b101100 : s2_out = 4'd13;
      6'b101101 : s2_out = 4'd4 ;
      6'b101110 : s2_out = 4'd1 ;
      6'b101111 : s2_out = 4'd2 ;
      6'b110000 : s2_out = 4'd5 ;
      6'b110001 : s2_out = 4'd11;
      6'b110010 : s2_out = 4'd8 ;
      6'b110011 : s2_out = 4'd6 ;
      6'b110100 : s2_out = 4'd12;
      6'b110101 : s2_out = 4'd7 ;
      6'b110110 : s2_out = 4'd6 ;
      6'b110111 : s2_out = 4'd12;
      6'b111000 : s2_out = 4'd9 ;
      6'b111001 : s2_out = 4'd0 ;
      6'b111010 : s2_out = 4'd3 ;
      6'b111011 : s2_out = 4'd5 ;
      6'b111100 : s2_out = 4'd2 ;
      6'b111101 : s2_out = 4'd14;
      6'b111110 : s2_out = 4'd15;
      6'b111111 : s2_out = 4'd9 ;  
    endcase
  end
  //sbox_3 change 
  always @(S_xor_R_3)		
  begin
    case (S_xor_R_3)
      6'b000000 : s3_out = 4'd10;
      6'b000001 : s3_out = 4'd13;
      6'b000010 : s3_out = 4'd0 ;
      6'b000011 : s3_out = 4'd7 ;
      6'b000100 : s3_out = 4'd9 ;
      6'b000101 : s3_out = 4'd0 ;
      6'b000110 : s3_out = 4'd14;
      6'b000111 : s3_out = 4'd9 ;
      6'b001000 : s3_out = 4'd6 ;
      6'b001001 : s3_out = 4'd3 ;
      6'b001010 : s3_out = 4'd3 ;
      6'b001011 : s3_out = 4'd4 ;
      6'b001100 : s3_out = 4'd15;
      6'b001101 : s3_out = 4'd6 ;
      6'b001110 : s3_out = 4'd5 ;
      6'b001111 : s3_out = 4'd10;
      6'b010000 : s3_out = 4'd1 ;
      6'b010001 : s3_out = 4'd2 ;
      6'b010010 : s3_out = 4'd13;
      6'b010011 : s3_out = 4'd8 ;
      6'b010100 : s3_out = 4'd12;
      6'b010101 : s3_out = 4'd5 ;
      6'b010110 : s3_out = 4'd7 ;
      6'b010111 : s3_out = 4'd14;
      6'b011000 : s3_out = 4'd11;
      6'b011001 : s3_out = 4'd12;
      6'b011010 : s3_out = 4'd4 ;
      6'b011011 : s3_out = 4'd11;
      6'b011100 : s3_out = 4'd2 ;
      6'b011101 : s3_out = 4'd15;
      6'b011110 : s3_out = 4'd8 ;
      6'b011111 : s3_out = 4'd1 ;
      6'b100000 : s3_out = 4'd13;
      6'b100001 : s3_out = 4'd1 ;
      6'b100010 : s3_out = 4'd6 ;
      6'b100011 : s3_out = 4'd10;
      6'b100100 : s3_out = 4'd4 ;
      6'b100101 : s3_out = 4'd13;
      6'b100110 : s3_out = 4'd9 ;
      6'b100111 : s3_out = 4'd0 ;
      6'b101000 : s3_out = 4'd8 ;
      6'b101001 : s3_out = 4'd6 ;
      6'b101010 : s3_out = 4'd15;
      6'b101011 : s3_out = 4'd9 ;
      6'b101100 : s3_out = 4'd3 ;
      6'b101101 : s3_out = 4'd8 ;
      6'b101110 : s3_out = 4'd0 ;
      6'b101111 : s3_out = 4'd7 ;
      6'b110000 : s3_out = 4'd11;
      6'b110001 : s3_out = 4'd4 ;
      6'b110010 : s3_out = 4'd1 ;
      6'b110011 : s3_out = 4'd15;
      6'b110100 : s3_out = 4'd2 ;
      6'b110101 : s3_out = 4'd14;
      6'b110110 : s3_out = 4'd12;
      6'b110111 : s3_out = 4'd3 ;
      6'b111000 : s3_out = 4'd5 ;
      6'b111001 : s3_out = 4'd11;
      6'b111010 : s3_out = 4'd10;
      6'b111011 : s3_out = 4'd5 ;
      6'b111100 : s3_out = 4'd14 ;
      6'b111101 : s3_out = 4'd2 ;
      6'b111110 : s3_out = 4'd7 ;
      6'b111111 : s3_out = 4'd12;  
    endcase
  end
  //sbox_4 change
  always @(S_xor_R_4)		
  begin
    case (S_xor_R_4)
      6'b000000 : s4_out = 4'd7;
      6'b000001 : s4_out = 4'd13;
      6'b000010 : s4_out = 4'd13;
      6'b000011 : s4_out = 4'd8 ;
      6'b000100 : s4_out = 4'd14;
      6'b000101 : s4_out = 4'd11;
      6'b000110 : s4_out = 4'd3 ;
      6'b000111 : s4_out = 4'd5 ;
      6'b001000 : s4_out = 4'd0 ;
      6'b001001 : s4_out = 4'd6 ;
      6'b001010 : s4_out = 4'd6 ;
      6'b001011 : s4_out = 4'd15;
      6'b001100 : s4_out = 4'd9 ;
      6'b001101 : s4_out = 4'd0 ;
      6'b001110 : s4_out = 4'd10;
      6'b001111 : s4_out = 4'd3 ;
      6'b010000 : s4_out = 4'd1 ;
      6'b010001 : s4_out = 4'd4 ;
      6'b010010 : s4_out = 4'd2 ;
      6'b010011 : s4_out = 4'd7 ;
      6'b010100 : s4_out = 4'd8 ;
      6'b010101 : s4_out = 4'd2 ;
      6'b010110 : s4_out = 4'd5 ;
      6'b010111 : s4_out = 4'd12;
      6'b011000 : s4_out = 4'd11;
      6'b011001 : s4_out = 4'd1 ;
      6'b011010 : s4_out = 4'd12;
      6'b011011 : s4_out = 4'd10;
      6'b011100 : s4_out = 4'd4 ;
      6'b011101 : s4_out = 4'd14;
      6'b011110 : s4_out = 4'd15;
      6'b011111 : s4_out = 4'd9 ;
      6'b100000 : s4_out = 4'd10;
      6'b100001 : s4_out = 4'd3 ;
      6'b100010 : s4_out = 4'd6 ;
      6'b100011 : s4_out = 4'd15;
      6'b100100 : s4_out = 4'd9 ;
      6'b100101 : s4_out = 4'd0 ;
      6'b100110 : s4_out = 4'd0 ;
      6'b100111 : s4_out = 4'd6 ;
      6'b101000 : s4_out = 4'd12;
      6'b101001 : s4_out = 4'd10;
      6'b101010 : s4_out = 4'd11;
      6'b101011 : s4_out = 4'd1 ;
      6'b101100 : s4_out = 4'd7 ;
      6'b101101 : s4_out = 4'd13;
      6'b101110 : s4_out = 4'd13;
      6'b101111 : s4_out = 4'd8 ;
      6'b110000 : s4_out = 4'd15;
      6'b110001 : s4_out = 4'd9 ;
      6'b110010 : s4_out = 4'd1 ;
      6'b110011 : s4_out = 4'd4 ;
      6'b110100 : s4_out = 4'd3 ;
      6'b110101 : s4_out = 4'd5;
      6'b110110 : s4_out = 4'd14;
      6'b110111 : s4_out = 4'd11;
      6'b111000 : s4_out = 4'd5 ;
      6'b111001 : s4_out = 4'd12;
      6'b111010 : s4_out = 4'd2 ;
      6'b111011 : s4_out = 4'd7 ;
      6'b111100 : s4_out = 4'd8 ;
      6'b111101 : s4_out = 4'd2 ;
      6'b111110 : s4_out = 4'd4 ;
      6'b111111 : s4_out = 4'd14;  
    endcase
  end
  //sbox_5 change 
  always @(S_xor_R_5)		
  begin
    case (S_xor_R_5)
      6'b000000 : s5_out = 4'd2;
      6'b000001 : s5_out = 4'd14;
      6'b000010 : s5_out = 4'd12;
      6'b000011 : s5_out = 4'd11;
      6'b000100 : s5_out = 4'd4 ;
      6'b000101 : s5_out = 4'd2 ;
      6'b000110 : s5_out = 4'd1 ;
      6'b000111 : s5_out = 4'd12;
      6'b001000 : s5_out = 4'd7 ;
      6'b001001 : s5_out = 4'd4 ;
      6'b001010 : s5_out = 4'd10;
      6'b001011 : s5_out = 4'd7 ;
      6'b001100 : s5_out = 4'd11;
      6'b001101 : s5_out = 4'd13;
      6'b001110 : s5_out = 4'd6 ;
      6'b001111 : s5_out = 4'd1 ;
      6'b010000 : s5_out = 4'd8 ;
      6'b010001 : s5_out = 4'd5 ;
      6'b010010 : s5_out = 4'd5 ;
      6'b010011 : s5_out = 4'd0 ;
      6'b010100 : s5_out = 4'd3 ;
      6'b010101 : s5_out = 4'd15;
      6'b010110 : s5_out = 4'd15;
      6'b010111 : s5_out = 4'd10;
      6'b011000 : s5_out = 4'd13 ;
      6'b011001 : s5_out = 4'd3 ;
      6'b011010 : s5_out = 4'd0 ;
      6'b011011 : s5_out = 4'd9 ;
      6'b011100 : s5_out = 4'd14;
      6'b011101 : s5_out = 4'd8 ;
      6'b011110 : s5_out = 4'd9 ;
      6'b011111 : s5_out = 4'd6 ;
      6'b100000 : s5_out = 4'd4 ;
      6'b100001 : s5_out = 4'd11;
      6'b100010 : s5_out = 4'd2 ;
      6'b100011 : s5_out = 4'd8 ;
      6'b100100 : s5_out = 4'd1 ;
      6'b100101 : s5_out = 4'd12;
      6'b100110 : s5_out = 4'd11;
      6'b100111 : s5_out = 4'd7 ;
      6'b101000 : s5_out = 4'd10;
      6'b101001 : s5_out = 4'd1 ;
      6'b101010 : s5_out = 4'd13;
      6'b101011 : s5_out = 4'd14;
      6'b101100 : s5_out = 4'd7 ;
      6'b101101 : s5_out = 4'd2 ;
      6'b101110 : s5_out = 4'd8 ;
      6'b101111 : s5_out = 4'd13;
      6'b110000 : s5_out = 4'd15;
      6'b110001 : s5_out = 4'd6 ;
      6'b110010 : s5_out = 4'd9 ;
      6'b110011 : s5_out = 4'd15;
      6'b110100 : s5_out = 4'd12;
      6'b110101 : s5_out = 4'd0 ;
      6'b110110 : s5_out = 4'd5 ;
      6'b110111 : s5_out = 4'd9 ;
      6'b111000 : s5_out = 4'd6 ;
      6'b111001 : s5_out = 4'd10;
      6'b111010 : s5_out = 4'd3 ;
      6'b111011 : s5_out = 4'd4 ;
      6'b111100 : s5_out = 4'd0 ;
      6'b111101 : s5_out = 4'd5 ;
      6'b111110 : s5_out = 4'd14;
      6'b111111 : s5_out = 4'd3 ;  
    endcase
  end
  //sbox_6 change 
  always @(S_xor_R_6)		
  begin
    case (S_xor_R_6)
      6'b000000 : s6_out = 4'd12;
      6'b000001 : s6_out = 4'd10;
      6'b000010 : s6_out = 4'd1 ;
      6'b000011 : s6_out = 4'd15;
      6'b000100 : s6_out = 4'd10;
      6'b000101 : s6_out = 4'd4 ;
      6'b000110 : s6_out = 4'd15;
      6'b000111 : s6_out = 4'd2 ;
      6'b001000 : s6_out = 4'd9 ;
      6'b001001 : s6_out = 4'd7 ;
      6'b001010 : s6_out = 4'd2 ;
      6'b001011 : s6_out = 4'd12;
      6'b001100 : s6_out = 4'd6 ;
      6'b001101 : s6_out = 4'd9 ;
      6'b001110 : s6_out = 4'd8 ;
      6'b001111 : s6_out = 4'd5 ;
      6'b010000 : s6_out = 4'd0 ;
      6'b010001 : s6_out = 4'd6 ;
      6'b010010 : s6_out = 4'd13;
      6'b010011 : s6_out = 4'd1 ;
      6'b010100 : s6_out = 4'd3 ;
      6'b010101 : s6_out = 4'd13;
      6'b010110 : s6_out = 4'd4 ;
      6'b010111 : s6_out = 4'd14;
      6'b011000 : s6_out = 4'd14;
      6'b011001 : s6_out = 4'd0 ;
      6'b011010 : s6_out = 4'd7 ;
      6'b011011 : s6_out = 4'd11;
      6'b011100 : s6_out = 4'd5 ;
      6'b011101 : s6_out = 4'd3 ;
      6'b011110 : s6_out = 4'd11;
      6'b011111 : s6_out = 4'd8 ;
      6'b100000 : s6_out = 4'd9 ;
      6'b100001 : s6_out = 4'd4 ;
      6'b100010 : s6_out = 4'd14;
      6'b100011 : s6_out = 4'd3 ;
      6'b100100 : s6_out = 4'd15;
      6'b100101 : s6_out = 4'd2 ;
      6'b100110 : s6_out = 4'd5 ;
      6'b100111 : s6_out = 4'd12;
      6'b101000 : s6_out = 4'd2 ;
      6'b101001 : s6_out = 4'd9 ;
      6'b101010 : s6_out = 4'd8 ;
      6'b101011 : s6_out = 4'd5 ;
      6'b101100 : s6_out = 4'd12;
      6'b101101 : s6_out = 4'd15;
      6'b101110 : s6_out = 4'd3 ;
      6'b101111 : s6_out = 4'd10;
      6'b110000 : s6_out = 4'd7 ;
      6'b110001 : s6_out = 4'd11;
      6'b110010 : s6_out = 4'd0 ;
      6'b110011 : s6_out = 4'd14;
      6'b110100 : s6_out = 4'd4 ;
      6'b110101 : s6_out = 4'd1 ;
      6'b110110 : s6_out = 4'd10;
      6'b110111 : s6_out = 4'd7 ;
      6'b111000 : s6_out = 4'd1 ;
      6'b111001 : s6_out = 4'd6 ;
      6'b111010 : s6_out = 4'd13;
      6'b111011 : s6_out = 4'd0 ;
      6'b111100 : s6_out = 4'd11;
      6'b111101 : s6_out = 4'd8 ;
      6'b111110 : s6_out = 4'd6 ;
      6'b111111 : s6_out = 4'd13;  
    endcase
  end
  //sbox_7 change 
  always @(S_xor_R_7)		
  begin
    case (S_xor_R_7)
      6'b000000 : s7_out = 4'd4 ;
      6'b000001 : s7_out = 4'd13;
      6'b000010 : s7_out = 4'd11;
      6'b000011 : s7_out = 4'd0 ;
      6'b000100 : s7_out = 4'd2 ;
      6'b000101 : s7_out = 4'd11;
      6'b000110 : s7_out = 4'd14;
      6'b000111 : s7_out = 4'd7 ;
      6'b001000 : s7_out = 4'd15;
      6'b001001 : s7_out = 4'd4 ;
      6'b001010 : s7_out = 4'd0 ;
      6'b001011 : s7_out = 4'd9 ;
      6'b001100 : s7_out = 4'd8 ;
      6'b001101 : s7_out = 4'd1 ;
      6'b001110 : s7_out = 4'd13;
      6'b001111 : s7_out = 4'd10;
      6'b010000 : s7_out = 4'd3 ;
      6'b010001 : s7_out = 4'd14;
      6'b010010 : s7_out = 4'd12;
      6'b010011 : s7_out = 4'd3 ;
      6'b010100 : s7_out = 4'd9 ;
      6'b010101 : s7_out = 4'd5 ;
      6'b010110 : s7_out = 4'd7 ;
      6'b010111 : s7_out = 4'd12;
      6'b011000 : s7_out = 4'd5 ;
      6'b011001 : s7_out = 4'd2 ;
      6'b011010 : s7_out = 4'd10;
      6'b011011 : s7_out = 4'd15;
      6'b011100 : s7_out = 4'd6 ;
      6'b011101 : s7_out = 4'd8 ;
      6'b011110 : s7_out = 4'd1 ;
      6'b011111 : s7_out = 4'd6 ;
      6'b100000 : s7_out = 4'd1 ;
      6'b100001 : s7_out = 4'd6 ;
      6'b100010 : s7_out = 4'd4 ;
      6'b100011 : s7_out = 4'd11;
      6'b100100 : s7_out = 4'd11;
      6'b100101 : s7_out = 4'd13;
      6'b100110 : s7_out = 4'd13;
      6'b100111 : s7_out = 4'd8 ;
      6'b101000 : s7_out = 4'd12;
      6'b101001 : s7_out = 4'd1 ;
      6'b101010 : s7_out = 4'd3 ;
      6'b101011 : s7_out = 4'd4 ;
      6'b101100 : s7_out = 4'd7 ;
      6'b101101 : s7_out = 4'd10;
      6'b101110 : s7_out = 4'd14;
      6'b101111 : s7_out = 4'd7 ;
      6'b110000 : s7_out = 4'd10;
      6'b110001 : s7_out = 4'd9 ;
      6'b110010 : s7_out = 4'd15;
      6'b110011 : s7_out = 4'd5 ;
      6'b110100 : s7_out = 4'd6 ;
      6'b110101 : s7_out = 4'd0 ;
      6'b110110 : s7_out = 4'd8 ;
      6'b110111 : s7_out = 4'd15;
      6'b111000 : s7_out = 4'd0 ;
      6'b111001 : s7_out = 4'd14;
      6'b111010 : s7_out = 4'd5 ;
      6'b111011 : s7_out = 4'd2 ;
      6'b111100 : s7_out = 4'd9 ;
      6'b111101 : s7_out = 4'd3 ;
      6'b111110 : s7_out = 4'd2 ;
      6'b111111 : s7_out = 4'd12;  
    endcase
  end
  //sbox_8 change
  always @(S_xor_R_8)		
  begin
    case (S_xor_R_8)
      6'b000000 : s8_out = 4'd13;
      6'b000001 : s8_out = 4'd1 ;
      6'b000010 : s8_out = 4'd2 ;
      6'b000011 : s8_out = 4'd15;
      6'b000100 : s8_out = 4'd8 ;
      6'b000101 : s8_out = 4'd13;
      6'b000110 : s8_out = 4'd4 ;
      6'b000111 : s8_out = 4'd8 ;
      6'b001000 : s8_out = 4'd6 ;
      6'b001001 : s8_out = 4'd10;
      6'b001010 : s8_out = 4'd15;
      6'b001011 : s8_out = 4'd3 ;
      6'b001100 : s8_out = 4'd11;
      6'b001101 : s8_out = 4'd7 ;
      6'b001110 : s8_out = 4'd1 ;
      6'b001111 : s8_out = 4'd4 ;
      6'b010000 : s8_out = 4'd10;
      6'b010001 : s8_out = 4'd12;
      6'b010010 : s8_out = 4'd9 ;
      6'b010011 : s8_out = 4'd5 ;
      6'b010100 : s8_out = 4'd3 ;
      6'b010101 : s8_out = 4'd6 ;
      6'b010110 : s8_out = 4'd14;
      6'b010111 : s8_out = 4'd11;
      6'b011000 : s8_out = 4'd5 ;
      6'b011001 : s8_out = 4'd0 ;
      6'b011010 : s8_out = 4'd0 ;
      6'b011011 : s8_out = 4'd14;
      6'b011100 : s8_out = 4'd12;
      6'b011101 : s8_out = 4'd9 ;
      6'b011110 : s8_out = 4'd7 ;
      6'b011111 : s8_out = 4'd2 ;
      6'b100000 : s8_out = 4'd7 ;
      6'b100001 : s8_out = 4'd2 ;
      6'b100010 : s8_out = 4'd11;
      6'b100011 : s8_out = 4'd1 ;
      6'b100100 : s8_out = 4'd4 ;
      6'b100101 : s8_out = 4'd14;
      6'b100110 : s8_out = 4'd1 ;
      6'b100111 : s8_out = 4'd7 ;
      6'b101000 : s8_out = 4'd9 ;
      6'b101001 : s8_out = 4'd4 ;
      6'b101010 : s8_out = 4'd12;
      6'b101011 : s8_out = 4'd10;
      6'b101100 : s8_out = 4'd14;
      6'b101101 : s8_out = 4'd8 ;
      6'b101110 : s8_out = 4'd2 ;
      6'b101111 : s8_out = 4'd13;
      6'b110000 : s8_out = 4'd0 ;
      6'b110001 : s8_out = 4'd15;
      6'b110010 : s8_out = 4'd6 ;
      6'b110011 : s8_out = 4'd12;
      6'b110100 : s8_out = 4'd10;
      6'b110101 : s8_out = 4'd9 ;
      6'b110110 : s8_out = 4'd13;
      6'b110111 : s8_out = 4'd0 ;
      6'b111000 : s8_out = 4'd15;
      6'b111001 : s8_out = 4'd3 ;
      6'b111010 : s8_out = 4'd3 ;
      6'b111011 : s8_out = 4'd5 ;
      6'b111100 : s8_out = 4'd5 ;
      6'b111101 : s8_out = 4'd6 ;
      6'b111110 : s8_out = 4'd8 ;
      6'b111111 : s8_out = 4'd11;  
    endcase
  end
//direct change
wire [32:1] directchange_out;
assign directchange_out = {s_out[16],s_out[7],s_out[20],s_out[21],s_out[29],s_out[12],s_out[28],s_out[17],
                           s_out[1],s_out[15],s_out[23],s_out[26],s_out[5],s_out[18],s_out[31],s_out[10],
                           s_out[2],s_out[8],s_out[24],s_out[14],s_out[32],s_out[27],s_out[3],s_out[9],
                           s_out[19],s_out[13],s_out[30],s_out[6],s_out[22],s_out[11],s_out[4],s_out[25]};
                          
/*directchange_out xor L*/
wire [32:1] directchange_xor_L;
assign  directchange_xor_L = directchange_out ^ L;           
/*regist-output*/
always @(posedge Encryp_clk or negedge Encryp_rst_n)
if (!Encryp_rst_n)
    begin
	    new_R <= 32'h0;
	    new_L <= 32'h0;
	 end
else
    begin
      new_R <= directchange_xor_L;
      new_L <= R; 
	  end
endmodule
