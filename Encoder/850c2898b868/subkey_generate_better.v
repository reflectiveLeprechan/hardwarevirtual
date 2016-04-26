`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:26 11/29/2014 
// Design Name: 
// Module Name:    subkey_generate 
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
module subkey_generate_better(
	  //subkey_rst_n,
	  key_in, 
	  mode_in,//mode_in=1, Encryption; mode_in=0, Decryption.
	  subkey_out1,subkey_out2,subkey_out3,subkey_out4,
	  subkey_out5,subkey_out6,subkey_out7,subkey_out8,
	  subkey_out9,subkey_out10,subkey_out11,subkey_out12,subkey_out13,
	  subkey_out14,subkey_out15,subkey_out16   //16 subkey generated the same time
    );
//input subkey_rst_n;
input  [64:1] key_in;
input         mode_in;
output [48:1] subkey_out1,subkey_out2,subkey_out3,subkey_out4,subkey_out5;
output [48:1] subkey_out6,subkey_out7,subkey_out8,subkey_out9,subkey_out10,subkey_out11;
output [48:1] subkey_out12,subkey_out13,subkey_out14,subkey_out15,subkey_out16;
wire subkey1,subkey2,subkey3,subkey4,subkey5,subkey6,subkey7,subkey8;
wire subkey9,subkey10,subkey11,subkey12,subkey13,subkey14,subkey15,subkey16;

/* generate 16 subkey*/
assign subkey1 = {key_in[26],key_in[2] ,key_in[50],key_in[11],key_in[36],key_in[33],key_in[49],key_in[44],key_in[18],key_in[25],key_in[35],key_in[58],
                  key_in[19],key_in[51],key_in[42],key_in[41],key_in[60],key_in[9] ,key_in[10],key_in[17],key_in[52],key_in[43],key_in[34],key_in[57],
                  key_in[38],key_in[13],key_in[55],key_in[7] ,key_in[53],key_in[20],key_in[63],key_in[46],key_in[21],key_in[6] ,key_in[39],key_in[45],
                  key_in[14],key_in[37],key_in[54],key_in[12],key_in[31],key_in[5] ,key_in[61],key_in[13],key_in[29],key_in[15],key_in[4] ,key_in[47] };
                  
assign subkey2 = {key_in[34],key_in[10],key_in[58],key_in[19],key_in[44],key_in[41],key_in[57],key_in[52],key_in[26],key_in[33],key_in[43],key_in[1] ,
                  key_in[27],key_in[59],key_in[50],key_in[49],key_in[52],key_in[17],key_in[18],key_in[25],key_in[60],key_in[51],key_in[42],key_in[36],
                  key_in[46],key_in[21],key_in[63],key_in[15],key_in[61],key_in[28],key_in[4] ,key_in[54],key_in[29],key_in[14],key_in[47],key_in[53],
                  key_in[22],key_in[45],key_in[62],key_in[20],key_in[39],key_in[13],key_in[6] ,key_in[21],key_in[37],key_in[23],key_in[12],key_in[55] };

assign subkey3 = {key_in[50],key_in[26],key_in[9] ,key_in[35],key_in[60],key_in[57],key_in[44],key_in[3] ,key_in[42],key_in[49],key_in[59],key_in[17],
                  key_in[43],key_in[10],key_in[1] ,key_in[36],key_in[19],key_in[33],key_in[34],key_in[41],key_in[11],key_in[2] ,key_in[58],key_in[52],
                  key_in[62],key_in[37],key_in[12],key_in[31],key_in[14],key_in[13],key_in[20],key_in[7] ,key_in[45],key_in[30],key_in[63],key_in[6] ,
                  key_in[38],key_in[61],key_in[15],key_in[5] ,key_in[55],key_in[29],key_in[22],key_in[37],key_in[53],key_in[39],key_in[28],key_in[4]  };
                  
assign subkey4 = {key_in[1] ,key_in[42],key_in[25],key_in[51],key_in[11],key_in[44],key_in[60],key_in[19],key_in[58],key_in[36],key_in[10],key_in[33],
                  key_in[59],key_in[26],key_in[17],key_in[52],key_in[35],key_in[49],key_in[50],key_in[57],key_in[27],key_in[18],key_in[9] ,key_in[3] ,
                  key_in[15],key_in[53],key_in[28],key_in[47],key_in[30],key_in[29],key_in[5] ,key_in[23],key_in[61],key_in[46],key_in[12],key_in[22],
                  key_in[54],key_in[14],key_in[31],key_in[21],key_in[4] ,key_in[45],key_in[38],key_in[53],key_in[6] ,key_in[55],key_in[13],key_in[20] };
                  
assign subkey5 = {key_in[17],key_in[58],key_in[41],key_in[2] ,key_in[27],key_in[60],key_in[11],key_in[35],key_in[9] ,key_in[52],key_in[26],key_in[49],
                  key_in[10],key_in[42],key_in[33],key_in[3] ,key_in[51],key_in[36],key_in[1] ,key_in[44],key_in[43],key_in[34],key_in[25],key_in[19],
                  key_in[31],key_in[6] ,key_in[13],key_in[63],key_in[46],key_in[45],key_in[21],key_in[39],key_in[14],key_in[62],key_in[28],key_in[38],
                  key_in[7] ,key_in[30],key_in[47],key_in[37],key_in[20],key_in[61],key_in[54],key_in[6] ,key_in[22],key_in[4] ,key_in[29],key_in[5]  };
                  
assign subkey6 = {key_in[33],key_in[9] ,key_in[57],key_in[18],key_in[43],key_in[11],key_in[27],key_in[51],key_in[25],key_in[3] ,key_in[42],key_in[36],
                  key_in[26],key_in[58],key_in[49],key_in[19],key_in[2] ,key_in[52],key_in[17],key_in[60],key_in[59],key_in[50],key_in[41],key_in[35],
                  key_in[47],key_in[22],key_in[29],key_in[12],key_in[62],key_in[61],key_in[37],key_in[55],key_in[30],key_in[15],key_in[13],key_in[54],
                  key_in[23],key_in[46],key_in[63],key_in[53],key_in[5] ,key_in[14],key_in[7] ,key_in[22],key_in[38],key_in[20],key_in[45],key_in[21] };
                  
assign subkey7 = {key_in[49],key_in[25],key_in[44],key_in[34],key_in[59],key_in[27],key_in[43],key_in[2] ,key_in[41],key_in[19],key_in[58],key_in[52],
                  key_in[42],key_in[9] ,key_in[36],key_in[35],key_in[18],key_in[3] ,key_in[33],key_in[11],key_in[10],key_in[1] ,key_in[57],key_in[51],
                  key_in[63],key_in[38],key_in[45],key_in[28],key_in[15],key_in[14],key_in[53],key_in[4] ,key_in[46],key_in[31],key_in[29],key_in[7] ,
                  key_in[39],key_in[62],key_in[12],key_in[6] ,key_in[21],key_in[30],key_in[23],key_in[38],key_in[54],key_in[5] ,key_in[61],key_in[37] };
                  
assign subkey8 = {key_in[36],key_in[41],key_in[60],key_in[50],key_in[10],key_in[43],key_in[59],key_in[18],key_in[57],key_in[35],key_in[9] ,key_in[3] ,
                  key_in[58],key_in[25],key_in[52],key_in[51],key_in[34],key_in[19],key_in[49],key_in[27],key_in[26],key_in[17],key_in[44],key_in[2] ,
                  key_in[12],key_in[54],key_in[61],key_in[13],key_in[31],key_in[30],key_in[6] ,key_in[20],key_in[62],key_in[47],key_in[45],key_in[23],
                  key_in[55],key_in[15],key_in[28],key_in[22],key_in[37],key_in[46],key_in[39],key_in[54],key_in[7] ,key_in[21],key_in[14],key_in[53] };
                  
assign subkey9 = {key_in[44],key_in[49],key_in[3] ,key_in[58],key_in[18],key_in[51],key_in[2] ,key_in[26],key_in[36],key_in[43],key_in[17],key_in[11],
                  key_in[1] ,key_in[33],key_in[60],key_in[59],key_in[42],key_in[27],key_in[57],key_in[35],key_in[34],key_in[25],key_in[52],key_in[10],
                  key_in[20],key_in[62],key_in[6] ,key_in[21],key_in[39],key_in[38],key_in[14],key_in[28],key_in[7] ,key_in[55],key_in[53],key_in[31],
                  key_in[63],key_in[23],key_in[5] ,key_in[30],key_in[45],key_in[54],key_in[47],key_in[62],key_in[15],key_in[29],key_in[22],key_in[61] };
                  
assign subkey10= {key_in[60],key_in[36],key_in[19],key_in[9] ,key_in[34],key_in[2] ,key_in[18],key_in[42],key_in[52],key_in[59],key_in[33],key_in[27],
                  key_in[17],key_in[49],key_in[11],key_in[10],key_in[58],key_in[43],key_in[44],key_in[51],key_in[50],key_in[41],key_in[3] ,key_in[26],
                  key_in[5] ,key_in[15],key_in[22],key_in[37],key_in[55],key_in[54],key_in[30],key_in[13],key_in[23],key_in[4] ,key_in[6] ,key_in[47],
                  key_in[12],key_in[39],key_in[21],key_in[46],key_in[61],key_in[7] ,key_in[63],key_in[15],key_in[31],key_in[45],key_in[38],key_in[14] };
                  
assign subkey11= {key_in[11],key_in[52],key_in[35],key_in[25],key_in[50],key_in[18],key_in[34],key_in[58],key_in[3] ,key_in[10],key_in[49],key_in[43],
                  key_in[33],key_in[36],key_in[27],key_in[26],key_in[9] ,key_in[59],key_in[60],key_in[2] ,key_in[1] ,key_in[57],key_in[19],key_in[42],
                  key_in[21],key_in[31],key_in[38],key_in[53],key_in[4] ,key_in[7] ,key_in[46],key_in[29],key_in[39],key_in[20],key_in[22],key_in[63],
                  key_in[28],key_in[55],key_in[37],key_in[62],key_in[14],key_in[23],key_in[12],key_in[31],key_in[47],key_in[61],key_in[54],key_in[30] };
                  
assign subkey12= {key_in[27],key_in[3] ,key_in[51],key_in[41],key_in[1] ,key_in[34],key_in[50],key_in[9] ,key_in[19],key_in[26],key_in[36],key_in[59],
                  key_in[49],key_in[52],key_in[43],key_in[42],key_in[25],key_in[10],key_in[11],key_in[18],key_in[17],key_in[44],key_in[35],key_in[58],
                  key_in[37],key_in[47],key_in[54],key_in[6] ,key_in[20],key_in[27],key_in[62],key_in[45],key_in[55],key_in[5] ,key_in[38],key_in[12],
                  key_in[13],key_in[4] ,key_in[53],key_in[15],key_in[30],key_in[39],key_in[28],key_in[37],key_in[36],key_in[14],key_in[7] ,key_in[46] };
                  
assign subkey13= {key_in[43],key_in[19],key_in[2] ,key_in[57],key_in[17],key_in[50],key_in[1] ,key_in[25],key_in[35],key_in[42],key_in[52],key_in[10],
                  key_in[36],key_in[3] ,key_in[59],key_in[58],key_in[41],key_in[26],key_in[27],key_in[34],key_in[33],key_in[60],key_in[51],key_in[9] ,
                  key_in[53],key_in[63],key_in[7] ,key_in[22],key_in[5] ,key_in[39],key_in[15],key_in[61],key_in[4] ,key_in[21],key_in[54],key_in[28],
                  key_in[29],key_in[20],key_in[6] ,key_in[31],key_in[46],key_in[55],key_in[13],key_in[63],key_in[12],key_in[30],key_in[23],key_in[62] };
                  
assign subkey14= {key_in[61],key_in[35],key_in[18],key_in[44],key_in[33],key_in[1] ,key_in[17],key_in[41],key_in[51],key_in[58],key_in[3] ,key_in[26],
                  key_in[52],key_in[19],key_in[10],key_in[9] ,key_in[57],key_in[42],key_in[43],key_in[50],key_in[49],key_in[11],key_in[2] ,key_in[25],
                  key_in[6] ,key_in[12],key_in[23],key_in[38],key_in[21],key_in[55],key_in[31],key_in[14],key_in[20],key_in[37],key_in[7] ,key_in[13],
                  key_in[45],key_in[5] ,key_in[22],key_in[47],key_in[62],key_in[4] ,key_in[29],key_in[12],key_in[28],key_in[46],key_in[39],key_in[15] };
                  
assign subkey15= {key_in[10],key_in[51],key_in[34],key_in[60],key_in[49],key_in[17],key_in[33],key_in[57],key_in[2] ,key_in[9] ,key_in[19],key_in[42],
                  key_in[3] ,key_in[35],key_in[26],key_in[25],key_in[44],key_in[58],key_in[59],key_in[1] ,key_in[36],key_in[27],key_in[18],key_in[41],
                  key_in[22],key_in[28],key_in[39],key_in[54],key_in[37],key_in[4] ,key_in[47],key_in[30],key_in[5] ,key_in[53],key_in[23],key_in[29],
                  key_in[61],key_in[21],key_in[38],key_in[63],key_in[15],key_in[20],key_in[45],key_in[28],key_in[13],key_in[62],key_in[55],key_in[31] };
                  
assign subkey16= {key_in[18],key_in[59],key_in[42],key_in[3] ,key_in[57],key_in[25],key_in[41],key_in[36],key_in[10],key_in[17],key_in[27],key_in[50],
                  key_in[11],key_in[43],key_in[34],key_in[33],key_in[52],key_in[1] ,key_in[2] ,key_in[9] ,key_in[44],key_in[35],key_in[26],key_in[49],
                  key_in[30],key_in[5] ,key_in[47],key_in[62],key_in[45],key_in[12],key_in[55],key_in[38],key_in[13],key_in[61],key_in[31],key_in[37],
                  key_in[6] ,key_in[29],key_in[46],key_in[4] ,key_in[23],key_in[28],key_in[53],key_in[5] ,key_in[21],key_in[7] ,key_in[63],key_in[39] };
                  

/*always @(subkey_rst_n)
if (!subkey_rst_n)
   begin 
	   subkey_out1  = 48'h0;
	   subkey_out2  = 48'h0;
	   subkey_out3  = 48'h0;
	   subkey_out4  = 48'h0;
	   subkey_out5  = 48'h0;
	   subkey_out6  = 48'h0;
	   subkey_out7  = 48'h0;
	   subkey_out8  = 48'h0;
	   subkey_out9  = 48'h0;
	   subkey_out10 = 48'h0;
	   subkey_out11 = 48'h0;
	   subkey_out12 = 48'h0;
	   subkey_out13 = 48'h0;
	   subkey_out14 = 48'h0;
	   subkey_out15 = 48'h0;
	   subkey_out16 = 48'h0;   
	 end
else
   begin*/
assign	 subkey_out1 = mode_in ? subkey1 : subkey16;//mode_in=1, Encryption; mode_in=0, Decryption.
assign 	subkey_out2 = mode_in ? subkey2 : subkey15;
assign	 subkey_out3 = mode_in ? subkey3 : subkey14;
assign	 subkey_out4 = mode_in ? subkey4 : subkey13;
assign	 subkey_out5 = mode_in ? subkey5 : subkey12;
assign	 subkey_out6 = mode_in ? subkey6 : subkey11;
assign	 subkey_out7 = mode_in ? subkey7 : subkey10;
assign	 subkey_out8 = mode_in ? subkey8 : subkey9;
assign	 subkey_out9 = mode_in ? subkey9 : subkey8;
assign	 subkey_out10= mode_in ? subkey10: subkey7;
assign	 subkey_out11= mode_in ? subkey11: subkey6;
assign	 subkey_out12= mode_in ? subkey12: subkey5;
assign	 subkey_out13= mode_in ? subkey13: subkey4;
assign	 subkey_out14= mode_in ? subkey14: subkey3;
assign	 subkey_out15= mode_in ? subkey15: subkey2;
assign	 subkey_out16= mode_in ? subkey16: subkey1;
	 //end
 	
endmodule
