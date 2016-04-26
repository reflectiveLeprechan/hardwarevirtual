`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:42 11/29/2014 
// Design Name: 
// Module Name:    endchange 
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
module endchange(
    input [32:1] endchange_L,
    input [32:1] endchange_R,
    input endchange_clk,
    input endchange_rst_n,
	 output reg [64:1] endchange_dout
    );
   
/*combine L and R,as to endchange_din*/
wire [64:1] endchange_din;
assign endchange_din = { endchange_L , endchange_R };
always @(posedge endchange_clk or negedge endchange_rst_n)
if (!endchange_rst_n)
    begin 
	   endchange_dout <= 64'h00000000;
	 end
else
    begin
	   endchange_dout <= { endchange_din[57],endchange_din[49],endchange_din[41],endchange_din[33],endchange_din[25],endchange_din[17],endchange_din[9],
		                     endchange_din[1] ,endchange_din[58],endchange_din[50],endchange_din[42],endchange_din[34],endchange_din[26],endchange_din[18],
								         endchange_din[10],endchange_din[2], endchange_din[59],endchange_din[51],endchange_din[43],endchange_din[35],endchange_din[27],
								         endchange_din[19],endchange_din[11],endchange_din[3], endchange_din[60],endchange_din[52],endchange_din[44],endchange_din[36],
		                     endchange_din[63],endchange_din[55],endchange_din[47],endchange_din[39],endchange_din[31],endchange_din[23],endchange_din[15],
								         endchange_din[7], endchange_din[62],endchange_din[54],endchange_din[46],endchange_din[38],endchange_din[30],endchange_din[22],
                         endchange_din[14],endchange_din[6], endchange_din[61],endchange_din[53],endchange_din[45],endchange_din[37],endchange_din[29],
		                     endchange_din[21] ,endchange_din[13],endchange_din[5],endchange_din[28],endchange_din[20],endchange_din[12],endchange_din[4] };
	 end
	 
endmodule
