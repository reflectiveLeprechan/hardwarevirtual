`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:43 11/29/2014 
// Design Name: 
// Module Name:    firstchange 
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
module firstchange(
    input [64:1] key,
    input [64:1] data_in,
    input clk,
    input rst_n,
    output reg [64:1] firstchangedout,
    output reg [56:1] firstchangekout
    );
always @(posedge clk or negedge rst_n) //�첽��λ
if(!rst_n)
   begin 
	  firstchangedout <= 64'h00000000;
	  firstchangekout <= 56'h0000000;
	end
else
   begin 
     firstchangedout <= { data_in[58],data_in[50],data_in[42],data_in[34],data_in[26],data_in[18],data_in[10],data_in[2],
                          data_in[60],data_in[52],data_in[44],data_in[36],data_in[28],data_in[20],data_in[12],data_in[4],
                          data_in[62],data_in[54],data_in[46],data_in[38],data_in[30],data_in[22],data_in[14],data_in[6],
                          data_in[64],data_in[56],data_in[48],data_in[40],data_in[32],data_in[24],data_in[16],data_in[8],
								  data_in[57],data_in[49],data_in[41],data_in[33],data_in[25],data_in[17],data_in[9], data_in[1],
                          data_in[59],data_in[51],data_in[43],data_in[35],data_in[27],data_in[19],data_in[11],data_in[3],
                          data_in[61],data_in[53],data_in[45],data_in[37],data_in[29],data_in[21],data_in[13],data_in[5],
                          data_in[63],data_in[55],data_in[47],data_in[39],data_in[31],data_in[23],data_in[15],data_in[7]};
								  
	  firstchangekout <= { data_in[57],data_in[49],data_in[41], data_in[33],data_in[25],data_in[17],data_in[9],
                          data_in[1],data_in[58],data_in[50], data_in[42],data_in[34],data_in[26],data_in[18],
                          data_in[10],data_in[2],data_in[59], data_in[51],data_in[43],data_in[35],data_in[27],
                          data_in[19],data_in[11],data_in[3], data_in[60],data_in[52],data_in[44],data_in[36],
								  data_in[63],data_in[55],data_in[47],data_in[39],data_in[31],data_in[23],data_in[15],
                          data_in[7], data_in[62],data_in[54],data_in[46],data_in[38],data_in[30],data_in[22],
                          data_in[14],data_in[6], data_in[61],data_in[53],data_in[45],data_in[37],data_in[29],
                          data_in[21],data_in[13],data_in[5], data_in[28],data_in[20],data_in[12], data_in[4]};
	end		  
	
endmodule
