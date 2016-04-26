//--------------------------------------------------------------------------//
// Title:       c4gx_f896_host.v                                            //
// Rev:         Rev 3                                                       //
// Created:     May 2010 		                                              //
//--------------------------------------------------------------------------//
// Description: Golden Top design contains all pins and I/O standards for   //
//              the Cyclone IV GX FPGA Development Board.                   //
//--------------------------------------------------------------------------//
// Revision History:                                                        //
// Rev 1:       First cut. KMS 20100515                                     //
// Rev 2:       Remove N signals from P/N pairs for most signals.  Added    //
//              transceiver pins.  DDR2 pinouts changed to match IP.        //
//              CKP 20100716                                                //
// Rev 3:       Removed ddr2 addr[15:13] not needed for 512Mb device. Added //
//              back HSMB signals that were missing due to LVDS-->2.5V/1.8V //
//              change.  Moved most HSMB pins as a result.  Moved clkin_sma,//
//              enet_tx_en.  Removed fsm_a[0,26].  CKP 20100722             //
// Rev 4:       Moved enet_intn and hsmb_tx_d_n[9] off of config pins and   //
//              changed hsmb signal to 2.5V due to vertical IO banks full.  //
//              CKP 20100726                                                //
//----------------------------------------------------------------------------
//------ 1 ------- 2 ------- 3 ------- 4 ------- 5 ------- 6 ------- 7 ------7
//------ 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------- 0 ------8
//----------------------------------------------------------------------------
//Copyright © 2010 Altera Corporation. All rights reserved.  Altera products  
//are protected under numerous U.S. and foreign patents, maskwork rights,     
//copyrights and other intellectual property laws.                            
//                                                                            
//This reference design file, and your use thereof, is subject to and         
//governed by the terms and conditions of the applicable Altera Reference     
//Design License Agreement.  By using this reference design file, you         
//indicate your acceptance of such terms and conditions between you and       
//Altera Corporation.  In the event that you do not agree with such terms and 
//conditions, you may not use the reference design file. Please promptly      
//destroy any copies you have made.                                           
//                                                                            
//This reference design file being provided on an "as-is" basis and as an     
//accommodation and therefore all warranties, representations or guarantees   
//of any kind (whether express, implied or statutory) including, without      
//limitation, warranties of merchantability, non-infringement, or fitness for 
//a particular purpose, are specifically disclaimed.  By making this          
//reference design file available, Altera expressly does not recommend,       
//suggest or require that this reference design file be used in combination   
//with any other product not provided by Altera.                              
//                                                                            



module c4gxsdi (
//--------------Clocks------------------
	input          clkin_50,             //2.5V    //Bank 8B
	input  [1:0]   clkin_sma_p,         //LVDS    //
	input          clkin_125m_p,         //LVDS    //


//--------------User-IO-----------------
	input          sys_resetn,           //1.8V    //TR=0, DEV_CLRn
	input          cpu_resetn,           //1.8V    //TR=0
	input  [7:0]   user_dipsw,           //1.8V    //TR=0
	output [7:0]   user_led,             //1.8V
	input  [3:0]   user_pb,              //1.8V    //TR=0

//-------------HSMC-Port-A--------------
	output   [1:0]    hsma_tx_p,         //1.5V PCML
   input    		   hsma_rx_p,         //1.5V PCML	
	inout		[3:0]		hsma_d,            //2.5V      //Bank
	output	[16:0]	hsma_tx_d_p,       //LVDS      //
	output	[16:0]	hsma_tx_d_n,       //LVDS      //
	input		[16:0]	hsma_rx_d_p,       //LVDS      //
   input             hsma_clk_in0,      //2.5V      //input only
	output				hsma_clk_out0,     //2.5V      //output only
	//input		[2:1]		hsma_clk_in_p,     //LVDS
	output	[2:1]		hsma_clk_out_p,    //LVDS
	output				hsma_tx_led,       //2.5V
	output				hsma_rx_led,       //2.5V
	inout					hsma_sda,          //2.5V      //TR=0
	output				hsma_scl,          //2.5V      //TR=0
	input					hsma_prsntn        //2.5V      //TR=0
	

);	

reg				u_reset_r1, u_reset_r2, reset ;
reg	[7:0]		u_dipsw_r1, u_dipsw_r2, dipsw ;
reg	[1:0]		tx_std ;

wire				gp_clk ;


///////////////////////////////////////////////////////////////////////////////
//debounce and set correct polarity of user signals
// cpu_resetn
// user_dipsw[7:0]
////////////////////


reg	[19:0]	db_count ;	//debounce counter
assign 		gp_clk = clkin_50 ;	//general purpose clock

always @ ( posedge gp_clk ) begin

	// this should create a pulse that is one clock long every
	//524288 clocks (1/2 Meg)
	if ( db_count[19] )
		db_count <= #1 0 ;
	else
		db_count <= #1 db_count + 1 ;
	
	// debounce and double register.
	if ( db_count[19] ) begin	// use db_count[19] as an enable
		u_reset_r1	<= #1 ~cpu_resetn ;
		u_reset_r2	<= #1 u_reset_r1 ;
		///////////////////////////////
		u_dipsw_r1	<= #1 user_dipsw ;
		u_dipsw_r2	<= #1 u_dipsw_r1 ;

		////////////////////////////////
		if ( u_reset_r2 == u_reset_r1 ) 
			reset	<= #1 u_reset_r2 ;	
		else
			reset	<= #1 1'b1 ; //keep in reset
	
		//////////////////////////////////////////////
		// if u_dipsw stable then allow dipsw to change
		begin : for_i_loop
		integer i ;
		for( i=0; i<8; i=i+1 ) begin 
		  if ( u_dipsw_r2[i] == u_dipsw_r1[i] ) 
			dipsw[i]	<= #1 u_dipsw_r2[i] ;
		  end
		end
		
		////////////////////////////////////////////////
		// set up the TX standard for color bar
		// pattern generator
		// not used for loop back since standard is 
		// the same as the RX channel
		if ( dipsw[1:0] == 2'b00 ) 	//sd
			tx_std	<= #1 2'b00 ;
		else if ( dipsw[1:0] == 2'b01 )	//hd
			tx_std	<= #1 2'b01 ;
		else if ( dipsw[1:0] == 2'b10 )	//3G
			tx_std	<= #1 2'b11 ;
		else 				//3G
			tx_std	<= #1 2'b11 ;
	end
end


/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

assign      user_led[7] = ~tx_std[1] ;     
assign      user_led[6] = ~tx_std[0] ; 
assign      user_led[5] = ~rx_p0_std[1] ;      
assign      user_led[4] = ~rx_p0_std[0] ;      

assign      user_led[3] = ~rx_p0_status[4] ; // frame acheived
//assign      user_led[2] = ~rx_p0_status[4] ; // reserved to ground due to CIV 2.97G limitation
assign      user_led[1] = ~rx_p0_status[3] ; // trs locked   
assign      user_led[0] = ~rx_p0_status[2] ; // alignment locked  

///////////////////////////////////////////////////////////////////////////////////////
// hsmc SDI instance

wire			gxb_refclk ;
wire			sdi_hsmc_clk ;	//to pll on the card
wire	[1:0]	eq_bypass ;	
wire	[1:0]	sdi_rate_sel ;
wire			sdi_clk_sel ;
wire			sdi_xtal_sel ;	
wire	[1:0]	sdi_clk_bp ;		// PLL Active / Bypass
wire			sdi_clk_oe ;
wire	[1:0]	sdi_clk_n ;
wire	[3:0]	sdi_clk_v ;
wire			sdi_clk_mltf ;
wire			sdi_clk_rst ;
wire			sdi_fb_clk ;
wire	[1:0]	sdi_led_tx_r ;
wire	[1:0]	sdi_led_tx_g ;
wire	[1:0]	sdi_led_rx_r ;
wire	[1:0]	sdi_led_rx_g ;

////////////////////////////////////////////////////////////////////
//assign	gxb_refclk = hsma_clk_in_p[2];
assign	sma_refclk = clkin_sma_p[0];
assign	sma_refclk1 = clkin_sma_p[1];
assign 	hsma_clk_out_p[2] = sdi_hsmc_clk ;

assign	hsma_tx_d_p[0]	= ~sdi_led_tx_g[0] ;
assign	hsma_tx_d_n[0]	= ~sdi_led_tx_g[1] ;
assign	hsma_tx_d_p[1]	= ~sdi_led_rx_r[1] ;
assign	hsma_tx_d_n[1]	= ~sdi_led_rx_g[1] ;
assign	hsma_tx_d_p[2]	= ~sdi_led_rx_r[0] ;
assign	hsma_tx_d_n[2]	= ~sdi_led_rx_g[0] ;
assign	hsma_tx_d_p[4]	= sdi_rate_sel[0] ;
assign	hsma_tx_d_n[4]	= sdi_rate_sel[1] ;
assign	hsma_tx_d_p[5]	= eq_bypass[0]	;
assign	hsma_tx_d_n[5]	= eq_bypass[1]	;
assign	hsma_tx_d_p[10]	= sdi_clk_sel	;
assign	hsma_tx_d_n[10]	= sdi_xtal_sel	;	
assign	hsma_tx_d_p[11]	= sdi_clk_bp[0]	;	// PLL Active / Bypass
assign	hsma_tx_d_n[11]	= sdi_clk_bp[1]	;
assign	hsma_tx_d_p[12]	= sdi_clk_oe ;
assign	hsma_tx_d_n[12]	= sdi_clk_n[0]	;
assign	hsma_tx_d_p[13]	= sdi_clk_n[1]	;
assign	hsma_tx_d_n[13]	= sdi_clk_v[0]	;
assign	hsma_tx_d_p[14]	= sdi_clk_v[1]	;
assign	hsma_tx_d_n[14]	= sdi_clk_v[2]	;
assign	hsma_tx_d_p[15]	= sdi_clk_v[3]	;
assign	hsma_tx_d_n[15]	= sdi_clk_mltf	;
assign	hsma_tx_d_p[16]	= sdi_clk_rst	;
assign	hsma_tx_d_n[16] = sdi_clk_oe ;

assign	hsma_d[0]	= ~sdi_led_tx_r[0] ;
assign	hsma_d[2]	= ~sdi_led_tx_r[1] ;

wire	[1:0]	rx_p0_std , rx_p1_std ;
wire	[10:0]	rx_p0_status, rx_p1_status ;


hsmc_sdi u0_hsmc_sdi(
	//inputs
	.reset 			( reset ) ,
	.gp_clk 			( gp_clk ) , 
	//.gxb_refclk 	( gxb_refclk ) , 
	.sma_refclk    ( sma_refclk) ,
	.sma_refclk1    ( sma_refclk1) ,
	.sdi_rx_p 		( hsma_rx_p  ) ,
	.dipsw 			( dipsw[7:0] ) ,
	.bar_75_100n	( dipsw[2] ) ,
	.patho			( dipsw[3] ) ,
	.tx_std			( tx_std ) ,
	
	//outputs
	.sdi_tx_p 		( hsma_tx_p[1:0]) ,
	.sdi_fb_clk_o	( sdi_hsmc_clk ) ,	//to pll on the card
	.eq_bypass_o 	( eq_bypass ) ,	
	.sdi_rate_sel_o( sdi_rate_sel ) ,
	.sdi_clk_sel_o ( sdi_clk_sel ) ,
	.sdi_xtal_sel_o( sdi_xtal_sel ) ,	
	.sdi_clk_bp_o 	( sdi_clk_bp ) ,	// PLL Active / Bypass
	.sdi_clk_oe_o 	( sdi_clk_oe ) ,	// 1 bit out
	.sdi_clk_n_o 	( sdi_clk_n ) ,		// 2 bits out
	.sdi_clk_v_o 	( sdi_clk_v ) ,		// 4 bits out
	.sdi_clk_mltf_o( sdi_clk_mltf ) ,
	.sdi_clk_rst_o ( sdi_clk_rst ) ,
	.rx_p0_std		( rx_p0_std ) ,		// 2 bits out
	.rx_p1_std		( rx_p1_std ) ,		// 2 bits out
	.rx_p0_status	( rx_p0_status ) ,	// 11 bits out
	.rx_p1_status	( rx_p1_status ) ,	// 11 bits out
	.sdi_led_tx_r_o ( sdi_led_tx_r ) ,	// 2 bits out
	.sdi_led_tx_g_o ( sdi_led_tx_g ) ,	// 2 bits out
	.sdi_led_rx_r_o ( sdi_led_rx_r ) ,	// 2 bits out
	.sdi_led_rx_g_o ( sdi_led_rx_g ) 	// 2 bits out
	);
endmodule
