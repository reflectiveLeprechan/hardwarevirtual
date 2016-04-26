
module hsmc_sdi(
	input				reset ,			// module reset
	input				gp_clk ,		// 50MHz clock
	//input				gxb_refclk , 	// SERDES reference clock
	input				sma_refclk , 	// SMA input reference clock
	input				sma_refclk1 , 	// SMA input reference clock
	input				sdi_rx_p ,	// sdi serial input
	input		[7:0]	dipsw ,		// dip switch
	///////////////////////
	// color bars
	// 1 = 75% 
	// 0 = 100%  
	input				bar_75_100n, 	
	///////////////////////////////////
	// 1 = pathological pattern output
	// 0 = color bars (see 75 / 100%)
	input				patho, 		
	//////////////////////////////
	// TX standard
	// 	00 = SD 
	// 	01 = HD 
	// 	10 = 3G 
	input		[1:0]	tx_std,		
	output	[1:0]	sdi_tx_p ,	// SERDES high speed data output
	output	[1:0]	sdi_rate_sel_o ,	// 1 = sd, 0 = hd (no use)
	////////////////////////////////////////////////////////////////
	// pin for ICS810001-22 - video clock generator at daughter card
	output 			sdi_clk_sel_o ,		// 0 = sdi_fb_clk_o, 1 = extclk_in
	output			sdi_xtal_sel_o ,	// 0 = 27MHz, 1 = 26.973MHz
	output	[1:0]	sdi_clk_bp_o ,		// PLL Active / Bypass
	output			sdi_clk_oe_o ,		// 1 = drive, 0 = tristate
	output	[1:0]	sdi_clk_n_o ,		// see datasheet
	output	[3:0]	sdi_clk_v_o ,		// see datasheet
	output			sdi_clk_mltf_o ,	// see datasheet
	output			sdi_clk_rst_o ,		// hsmc sdi pll reset
	output	[1:0]	eq_bypass_o ,		// 1 = bypass RX eq, 0 = use eq.
	output			sdi_fb_clk_o ,		// to pll on daughter card
	/////////////////////////////////////
	// RX standard
	// 	00 = sd
	// 	01 = hd	
	// 	11 = 3G	
	output	[1:0]	rx_p0_std ,
	output	[1:0]	rx_p1_std ,
	///////////////////////// 
	// RX status bits
	// 0 : pll locked
	// 1 : RX in reset
	// 2 : alignment (word)
	// 3 : trs locked
	// 4 : frame locked
	output	[10:0]	rx_p0_status,		
	output	[10:0]	rx_p1_status,
	/////////////////////////////////////
	// HSMC LED status indicators 
	// red 		: SD (270 Mbps)
	// orange 	: HD (1.485Gbps)
	// green	: 3G (2.970Gbps)
	output	[1:0]	sdi_led_tx_r_o ,
	output	[1:0]	sdi_led_tx_g_o ,
	output	[1:0]	sdi_led_rx_r_o ,
	output	[1:0]	sdi_led_rx_g_o 
);

reg 			[3:0]	sdi_clk_v ;							// ICS810001-22 VCXO PLL divider selection pins
reg					sdi_fb_clk;							// clk source 0 for ICS810001-22
reg 					sdi_clk_sel;                	// 0 = sdi_fb_clk_o, 1 = extclk_in
reg			[1:0]	sdi_led_tx_g, sdi_led_tx_r ; 	// red and green led for the SDI transmitters
reg			[1:0]	sdi_led_rx_g, sdi_led_rx_r ;	// red and green led for the SDI receivers

///////////////////////////////////////////////////////////////////////////
// Set ICS810001-22 (video clock generator at daughter card) for 148.5 MHz.
assign	sdi_clk_sel_o	= sdi_clk_sel ;	// 0 = sdi_fb_clk_o, 1 = extclk_in
assign	sdi_xtal_sel_o	= 1'b0 ;	// 0 = 27MHz, 1 = 26.973MHz
assign 	sdi_clk_v_o		= sdi_clk_v ;
assign	sdi_clk_bp_o	= 2'b11 ;	// PLL Bypass(00)/Active(01=bypass FemtoClock Frq Mul,10,11)
assign	sdi_clk_oe_o	= 1'b1 ;	// 1 = drive, 0 = tristate
assign	sdi_clk_n_o		= 2'b00 ;	// PLL output divider 00=4,01=8,10=12,11=18
assign	sdi_clk_mltf_o	= 1'b0 ;	// PLL FemtoClock Frq Multiplier 0=x22 , 1=x24
assign	sdi_clk_rst_o	= 1'b0 ;	// hsmc sdi pll reset
assign	eq_bypass_o		= 2'b00 ;	// 1 = bypass RX eq, 0 = use eq.
assign	sdi_fb_clk_o	= sdi_fb_clk ; 		//to pll on the card

// HSMC LED status indicators
assign	sdi_led_tx_g_o	= sdi_led_tx_g ;
assign	sdi_led_tx_r_o	= sdi_led_tx_r ;
assign	sdi_led_rx_g_o	= sdi_led_rx_g ;
assign	sdi_led_rx_r_o	= sdi_led_rx_r ;
assign	sdi_rate_sel_o	= 2'b00 ;	// no use

///////////////////////////////////////////////////////
// double registered on pclk due to clk domain crossing
// tx_std : SD(00), HD(01), 3G(11)
reg	[1:0]	tx_std_r1, tx_std_r2, tx_std_r3 ;

always@(posedge tx_p0_pclk) begin 		
		tx_std_r1 	<= #1 tx_std ;
        tx_std_r2 	<= #1 tx_std_r1 ;
        tx_std_r3	<= #1 tx_std_r2 ;
end

/////////////////////////////////////////////////////////////////////
//assign io signals to the generic HSMC I/O of the S4GX board
//

reg     	rx_p0_clk_div2 ;

always @ (posedge rx_p0_clk ) 
	rx_p0_clk_div2 <=  ~rx_p0_clk_div2 ;
	

// with a ref freq of 27MHz you can use a sdi_clk_v values of 
// 0000 M and P dividers set to 1000 (ex: input 27Mhz, VCXO 27Mhz)
// 0101	M and P dividers set to 4004 (ex: input 27Mhz, VCXO 27Mhz)
// 1010 M and P dividers set to 92   (ex: input 27Mhz, VCXO 27Mhz)
// 1001 M set to 92 and P set to 253 (ex: input 74.25Mhz, VCXO 27Mhz)


wire clk_27M_ref; // temp
//////////////////////////////////////////////////////////////////////////
//this needs to be adjusted to accept the clock either from port0 or port1
always @ ( 	rx_p0_std or rx_p0_status[3] or rx_p0_clk or rx_p0_clk_div2 or
		clk_27M_ref )
	begin 
		casex ( { rx_p0_status[3], rx_p0_std } )
				
				// if no inputs on RX p1 or p2 then use the host known reference
		3'b0_xx	: begin
			sdi_clk_sel = 1'b1;
			sdi_fb_clk	= clk_27M_ref ;
			sdi_clk_v	= 4'b1010 ;	//this can be 0000, 0101, 1010
			end

		///////////////////
		// rx Port0 	
		3'b1_01 :	begin
				sdi_clk_sel = 1'b0;
				sdi_fb_clk 	= rx_p0_clk ;
				sdi_clk_v	= 4'b1001 ;
				end
				
		3'b1_10 :	begin 
				sdi_clk_sel = 1'b0;
				sdi_fb_clk	= rx_p0_clk_div2 ;
				sdi_clk_v	= 4'b1001 ;
				end		
				
		3'b1_11 :	begin 
				sdi_clk_sel = 1'b0;
				sdi_fb_clk	= rx_p0_clk_div2 ;
				sdi_clk_v	= 4'b1001 ;
				end
				
		3'b1_00 : 	begin
				sdi_clk_sel = 1'b0;
				sdi_fb_clk	= rx_p0_data_valid [1] ;
				sdi_clk_v	= 4'b0000 ;
				end
			
		default : 	begin 
				sdi_clk_sel = 1'b1;
				sdi_fb_clk	= clk_27M_ref ;
				sdi_clk_v	= 4'b1010 ;
				end
		endcase
	end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// generate proper clocks 
///////////////////////////////////////////////////////////////////////////////
// PLL used to generate parallel domain clocks from incoming 148.5MHz clock.
// Alternatively, logic could be used to generate these /2 and /11 clocks.


wire		pclk_27;
wire		pclk_74;


pll_tx_pclks u6_pll_pclks (
      .areset    (1'b0),
      .inclk0    (sma_refclk1),	//gxb_refclk 148.5Mhz
      .c0        (pclk_27),
      .c1        (pclk_74),
		.c2		  (pclk_148),
      );

		
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// the clk_27M_ref is generated from an XO only to have a ref
// for the external PLL on the daughter card. It is used when that 
// pll does not have a reference to lock to. for example no sdi
// input connected to the card or/and no video sync signal. 
// this way the clean up pll has a source to lock to and not just hunting
// or pegged high or low.


pll_50to27MHz	u0_pll_50to27MHz (
	.areset 	( 1'b0 ),
	.inclk0 	( gp_clk ),	//50MHz input
	.c0 		( clk_27M_ref ),//27MHz output
	.locked 	( locked_sig )
	);

	
////////////////////////////////////////////////////////////////////////////////////////////
//////////Reset Synchronizer//////////////////////////
	
wire reset_sync; 
altera_std_synchronizer u_altera_std_synchronizer(
    .reset_n(1'b1),
    .clk    (pclk_148),
    .din		(reset),
	 .dout	(reset_sync)
	 );
	
////////////////////////////////////////////////////////////////////////////////////////////
// if transmit video standard changes, reset colorbar transmitter
reg          tx_rst;
reg [3:0]    tx_rstcount;

always @ (posedge tx_p0_pclk or posedge reset_sync) begin
	if ( reset_sync ) begin
           	tx_rst 		<= #1 1'b1;
           	tx_rstcount	<= #1 0;
           end
        else begin
        /////////////////////////////////////////////
		//check to see if the tx standard has changed
		//if it has then set the reset bit for the 
		//pattern generator
		if (tx_std_r3 != tx_std_r1)  begin
			tx_rstcount	<= #1 0 ;
			tx_rst		<= #1 1'b1 ;
			end
		
		//////////////////////////////////
		//use msb as the terminal count
		//and to unset the reset bit
		if ( tx_rstcount[3] )  
			tx_rst <= #1 1'b0 ;
		else  
			tx_rstcount	<= #1 tx_rstcount + 1 ;
	end 
end 
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// Reconfig instance, used for all rx ports in design
// Triple rate SDI rx cores require reconfiguration using DPRIO.  
// The code below handles the reconfiguration for multiple SDI cores using a single controller.

wire 	[1:0]	sdi_start_reconfig;
wire 	[3:0]	sdi_reconfig_togxb;
wire 	[19:0] 	rc_fromgxb;		//4 x 5 = 20
wire 	[3:0]	multi_reconfig_done;
wire			sdi_reconfig_clk;

assign  		sdi_reconfig_clk = gp_clk ;   

// transmit recieve DPRIO core
/////////////////// for offset cancellation purpose ///////////////////////////////////////

alt4gxb_gxb_reconfig    sdi_alt2gxb_reconfig_inst
     (
    .reconfig_clk(sdi_reconfig_clk ),                        // common input
    .reconfig_togxb(sdi_reconfig_togxb),                    // 4 bits output
    .reconfig_fromgxb(rc_fromgxb),                				// 4*5 bits input
    .busy(busy)
		);
///////////////////////////Pll reconfiguration//////////////////////////////////////////////


pll_reconfig_control pll_reconfig_control_ch0(
		.rst						( reset_sync ),
		.sys_clk					( sdi_reconfig_clk ),
		.start_reconfig		( sdi_start_reconfig[0] ),
		.std_select				(rx_p0_std),
		.serdes_status			(),
		.rx_pll_outclk			(),
		.sdi_ref					(),
		.pll_areset				(pll_ch0_areset),
		.pll_configupdate		(pll_ch0_configupdate),
		.pll_scanclk			(pll_ch0_scanclk),
		.pll_scanclkena		(pll_ch0_scanclkena),
		.pll_scandata			(pll_ch0_scandata),
		.pll_scandataout		(pll_ch0_scandataout),
		.pll_scandone			(pll_ch0_scandone)

);



////////////////////////////////////////////////////////////////////////////////////////////
// test pattern generator p0
wire 	[19:0]	gen_txdata_p0;
wire 	[10:0]	gen_ln_p0 ;
wire        	gen_trs_p0 ;
   
sdi_pattern_gen  u0_patgen (
      .clk             ( tx_p0_pclk ),	
      .rst             ( tx_rst ),	
      .hd_sdn          ( tx_std_r2[0] ),
      .bar_75_100n     ( bar_75_100n ),
      .enable          ( 1'b1 ),
      .patho           ( patho ),
      .blank           ( 1'b0 ),
      .no_color        ( 1'b0 ),
      .dout            ( gen_txdata_p0 ),
      .trs             ( gen_trs_p0 ),
      .ln              ( gen_ln_p0 ),
      .select_std      ( tx_std_r2[1] ? 
      				2'b00 : tx_std_r2[0] ?
      				2'b01 :2'b11
      				)
      );

////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// adjust transmit parallel clock depending on the standard. 
// If 3G use 148M clock, 
// If HD use 74M clock,
// If SD use 27M clock.
////////////////////////////////////////////////////////////////////////////////
// clock mux for p1
wire tx_p1_pclk ;
wire tx_p1_clkout;

assign     tx_p1_pclk = rx_p0_std[1] ? tx_p1_clkout : (rx_p0_std[0] ? pclk_74 : pclk_27);
//////////////////////////////////////////////////////////////////////////////
// clock mux for p0

wire tx_p0_pclk ;
wire tx_p0_clkout;
   

	assign     tx_p0_pclk = tx_std_r2[1] ? tx_p0_clkout : (tx_std_r1[0] ? pclk_74 : pclk_27);


////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// Loopback fifo & registers.
wire [7:0]		rdusedw_p1;
wire [19:0] 	fifo_data_p1; 
reg         	rdreq_p1;

// start to read from fifo when half full for p1
always @ (posedge tx_p1_pclk or posedge reset_sync) begin
	if ( reset_sync )
		rdreq_p1 	<= #1 1'b0 ;
	else if ( rdusedw_p1[7] )
		rdreq_p1 	<= #1 1'b1 ;
end


lp_fifo  fifo_p1 (
      .aclr     ( reset_sync | ~rx_p0_status[3] ), 
    .wrclk    ( ~rx_p0_clk ),
    .wrreq    ( rx_p0_data_valid[0] ),
      .data     ( rx_p0_data ),			// input from core/generator
      .rdclk    ( tx_p1_pclk ), 
      .rdreq    ( rdreq_p1 ),
      .q        ( fifo_data_p1 ),
      .rdusedw  ( rdusedw_p1 )
     );

////////////////////////////////////////////////////////////////////////////////////////////
// Control register for 'txdata_p0' and 'txdata_p1' 

reg [19:0] 	txdata_p1, txdata_p0 ;
reg			txtrs_p1, txtrs_p0 ;
reg [10:0]	txln_p1, txln_p0 ;
reg [1:0]	tx_std_p1, tx_std_p0 ;
wire  [19:0] fifo_data_p1_temp;

reg enable_ln_p1 , enable_ln_p0 ;
/////////////////////////////////////////////////////////////////////////////////
// register and mux for fifo data (loopback) for 'txdata_p1'
// use the parallel tx clock for this to determine what to transmit

always @ (posedge tx_p1_pclk or posedge reset_sync) begin
	if ( reset_sync ) 
		begin
		txdata_p1 	<= #1 20'h0_0000 ;
		txtrs_p1	<= #1  0 ;
		txln_p1		<= #1  0 ;
		end
		
	///////////////////////////////////////////////
	// use loopback fifo and output what is received
	else 
		begin
		tx_std_p1		<= #1 rx_p0_std ;
		enable_ln_p1	<= #1 1'b0 ;
		end
	
end

/////////////////////////////////////////////////////////////////
// register for pattern gen data for 'txdata_p0'
// use the parallel tx clock for this  

always @ (posedge tx_p0_pclk or posedge reset_sync) begin
	if ( reset_sync ) 
		begin
		txdata_p0 	<= #1 20'h0_0000 ;
		txtrs_p0	<= #1  0 ;
		txln_p0		<= #1  0 ;
		end

	/////////////////////////////////////
	// output data from pattern generator
	else 	
		begin
		txdata_p0	<= #1 gen_txdata_p0 ;
		txtrs_p0	<= #1 gen_trs_p0 ;
		txln_p0		<= #1 gen_ln_p0 ;
		tx_std_p0	<= #1 tx_std_r3 ;
		enable_ln_p0	<= #1 1'b1 ;
		end
end
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////
// C4GX SDI instance here
//////////////////////////////
wire	[19:0]	rx_p0_data, rx_p1_data ;
wire 	[1:0]	rx_p0_data_valid, rx_p1_data_valid ;

// C4GX SDI tx only mega-core instance
C4gxSDI3G_tx_ch0 u0_C4gxSDI3G_tx_ch0 (
	//common
	.rst_tx				( reset_sync | tx_rst ),	//input 	
	.gxb4_cal_clk		( gp_clk ), 	//input
	.sdi_gxb_powerdown	( 1'b0 ), 	//input
	
	//core config settings
	.enable_ln	( enable_ln_p0 ), 	//input [0:0]
	.enable_crc	( 1'b1 ), 	//input [0:0]

	
	//tx inputs
	.tx_pclk			( tx_p0_pclk ),	//input 	
	.tx_serial_refclk 	( sma_refclk), //input - from HSMC 148.5 vcxo
	.txdata				( txdata_p0 ), //input [19:0]
	.tx_trs				( txtrs_p0 ), 	//input [0:0]  - not used	
	.tx_ln				( {11'b0,txln_p0} ), //input [21:0] - not used

	.tx_std				( tx_std_p0 ),	//input	[1:0]
	
	//tx outputs
	.sdi_tx			( sdi_tx_p[0] ), //output [0:0]
	.tx_status		( tx_p0_stat ), //output [0:0]	- not used
	.gxb_tx_clkout	( tx_p0_clkout ), //output [0:0]
	
	// reconfig inputs
	.sdi_reconfig_clk	( sdi_reconfig_clk ), //input 	
	.sdi_reconfig_togxb	( sdi_reconfig_togxb ), //input [3:0]	
	
	//reconfig outputs
	.sdi_reconfig_fromgxb	( rc_fromgxb[4:0] ) //output [4:0]	
);


////////////////////////////////////////////////////////////////////////////
// C4GX SDI tx only mega-core instance

C4gxSDI3G_tx_ch1 u1_C4gxSDI3G_tx_ch1 (
	//common
	.rst_tx				( reset_sync | tx_rst ),	//input 	
	.gxb4_cal_clk		( gp_clk ), 	//input
	.sdi_gxb_powerdown	( 1'b0 ), 	//input
	
	//core config settings
	.enable_ln	( enable_ln_p1 ), 	//input [0:0]
	.enable_crc	( 1'b1 ), 	//input [0:0]
	
	//tx inputs
	.tx_pclk			( tx_p1_pclk ),	//input 	
	.tx_serial_refclk 	( sma_refclk), //input - from HSMC 148.5 vcxo
	.txdata				( fifo_data_p1 ), //input [19:0]
	.tx_trs				( ), 	//input [0:0]  - not used	
	.tx_ln				( ), //input [21:0] - not used
	.tx_std				( tx_std_p1 ),	//input	[1:0]
	
	//tx outputs
	.sdi_tx			( sdi_tx_p[1] ), //output [0:0]
	.tx_status		( tx_p1_stat ), //output [0:0]	- not used
	.gxb_tx_clkout	( tx_p1_clkout ), //output [0:0]
	
	// reconfig inputs
	.sdi_reconfig_clk	( sdi_reconfig_clk ), //input 	
	.sdi_reconfig_togxb	( sdi_reconfig_togxb ), //input [3:0]	
	
	//reconfig outputs
	.sdi_reconfig_fromgxb	( rc_fromgxb[9:5] ) //output [4:0]	
);


////////////////////////////////////////////////////////////////////////////
// S4GX SDI rx only mega-core instance
// sdirx_x1
C4gxSDI3G_rx_ch0 u0_C4gxSDI3G_rx_ch0 (
	//common
	.rst_rx	( reset_sync ),	//input 	
	.gxb4_cal_clk	( gp_clk ), 	//input
	.sdi_gxb_powerdown	( 1'b0 ), 	//input
	
	//core config settings
	.en_sync_switch		( 1'b0 ), 	//input	
	.enable_hd_search	( 1'b1 ), 	//input 	
	.enable_sd_search	( 1'b1 ), 	//input 	
	.enable_3g_search	( 1'b1 ), 	//input 	
	
	//rx inputs
	.rx_serial_refclk	( sma_refclk  ), //input
	.rx_coreclk             (pclk_148),
	.sdi_rx	( sdi_rx_p ), //input [0:0]
	.rx_serial_refclk1 (),
	.rx_serial_refclk_clkswitch  ( 1'b0 ),
	.refclk_rate (1'b1),
	
	//rx outputs
	.rxdata    		( rx_p0_data ), //output [19:0]	
	.rx_data_valid_out     	( rx_p0_data_valid ), //output [1:0]	
	.rx_clk    		( rx_p0_clk ), //output 	
	.rx_status 		( rx_p0_status ), //output [10:0]	
	//.rx_ln     		( rx_p0_ln ), //output [21:0]	  
	.rx_std       		( rx_p0_std ), //output [1:0]		
	.rx_video_format  (),
	
	//reconfig inputs
	.sdi_reconfig_clk	( sdi_reconfig_clk ), //input 	
	.sdi_reconfig_togxb	( sdi_reconfig_togxb ), //input [3:0]	


	//reconfig outputs
	.sdi_reconfig_fromgxb	( rc_fromgxb[14:10] ), //output [4:0]	
	.sdi_start_reconfig  	( sdi_start_reconfig[0] ),  //output 	
	
	//not used
	.rx_anc_data     	( rx_p0_anc_d ), //output [19:0]	
	.rx_anc_valid    	( rx_p0_anc_v ), //output [3:0]	
	.rx_anc_error    	( rx_p0_anc_er ), //output [3:0]	
	.rx_std_flag_hd_sdn	(  ), //output [0:0]	
	.rx_F      		( rx_p0_F ), //output [1:0]	
	.rx_V      		( rx_p0_V ), //output [1:0]	
	.rx_H      		( rx_p0_H ), //output [1:0]	
	.rx_AP     		( rx_p0_AP ), //output [1:0]	
	.rx_xyz	(),
	.xyz_valid	(),
	.rx_eav	(),
	.rx_trs	() ,
	.pll_areset			(pll_ch0_areset),
	.pll_configupdate	(pll_ch0_configupdate),
	.pll_scanclk		(pll_ch0_scanclk),
	.pll_scanclkena	(pll_ch0_scanclkena),
	.pll_scandata		(pll_ch0_scandata),
	.pll_scandataout	(pll_ch0_scandataout),
	.pll_scandone		(pll_ch0_scandone)
);


////////////////////////////////////////////////////////////////////////////////////////////
// Set led 'sdi_led_tx_r, sdi_led_tx_g, sdi_led_rx_r, sdi_led_rx_g'.
// Received & transmit video standard. 00 = SD, 01 = HD, 11 = 3G.

always @ ( tx_std[1] or tx_std[0]  )
	begin 
		case ( tx_std[1:0] )
		2'b00	: begin	// red only for 270 Mbps
				sdi_led_tx_r[0] = 1'b1 ;
				sdi_led_tx_g[0] = 1'b0 ;
			  end
		2'b01	: begin	// red and green for 1.48Gbps
				sdi_led_tx_r[0] = 1'b1 ;
				sdi_led_tx_g[0] = 1'b1 ;
			  end
			  
		2'b10	: begin	// green only for 3 Gbps
				sdi_led_tx_r[0] = 1'b0 ;
				sdi_led_tx_g[0] = 1'b1 ;
			  end
			  
		2'b11	: begin	// green only for 3 Gbps
				sdi_led_tx_r[0] = 1'b0 ;
				sdi_led_tx_g[0] = 1'b1 ;
			  end
		default : begin	// red only for 270 Mbps
				sdi_led_tx_r[0] = 1'b1 ;
				sdi_led_tx_g[0] = 1'b0 ;
			  end
		endcase
	end

///////////////////////////////////////////////////////////
always @ ( tx_std_p1[1] or tx_std_p1[0]  )
	begin 
		case ( tx_std_p1[1:0] )
		2'b00	: begin	// red only for 270 Mbps
				sdi_led_tx_r[1] = 1'b1 ;
				sdi_led_tx_g[1] = 1'b0 ;
			  end
		2'b01	: begin	// red and green for 1.48Gbps
				sdi_led_tx_r[1] = 1'b1 ;
				sdi_led_tx_g[1] = 1'b1 ;
			  end
			  
		2'b10	: begin	// green only for 3 Gbps
				sdi_led_tx_r[1] = 1'b0 ;
				sdi_led_tx_g[1] = 1'b1 ;
			  end
		2'b11	: begin	// green only for 3 Gbps
				sdi_led_tx_r[1] = 1'b0 ;
				sdi_led_tx_g[1] = 1'b1 ;
			  end
		default : begin	// red only for 270 Mbps
				sdi_led_tx_r[1] = 1'b1 ;
				sdi_led_tx_g[1] = 1'b0 ;
			  end
		endcase
	end

///////////////////////////////////////////////////////////
always @ ( rx_p1_std )
	begin 
		case ( rx_p1_std )
		2'b00	: begin	// red only for 270 Mbps
				sdi_led_rx_r[1] = 1'b1 ;
				sdi_led_rx_g[1] = 1'b0 ;
			  end
		2'b01	: begin	// red and green for 1.48Gbps
				sdi_led_rx_r[1] = 1'b1 ;
				sdi_led_rx_g[1] = 1'b1 ;
			  end
			  
		2'b10	: begin	// green only for 3 Gbps
				sdi_led_rx_r[1] = 1'b0 ;
				sdi_led_rx_g[1] = 1'b1 ;
			  end
		2'b11	: begin	// green only for 3 Gbps
				sdi_led_rx_r[1] = 1'b0 ;
				sdi_led_rx_g[1] = 1'b1 ;
			  end
		default : begin	// red only for 270 Mbps
				sdi_led_rx_r[1] = 1'b1 ;
				sdi_led_rx_g[1] = 1'b0 ;
			  end
		endcase
	end

///////////////////////////////////////////////////////////
always @ ( rx_p0_std )
	begin 
		case ( rx_p0_std )
		2'b00	: begin	// red only for 270 Mbps
				sdi_led_rx_r[0] = 1'b1 ;
				sdi_led_rx_g[0] = 1'b0 ;
			  end
		2'b01	: begin	// red and green for 1.48Gbps
				sdi_led_rx_r[0] = 1'b1 ;
				sdi_led_rx_g[0] = 1'b1 ;
			  end
			  
		2'b10	: begin	// green only for 3 Gbps
				sdi_led_rx_r[0] = 1'b0 ;
				sdi_led_rx_g[0] = 1'b1 ;
			  end
		2'b11	: begin	// green only for 3 Gbps
				sdi_led_rx_r[0] = 1'b0 ;
				sdi_led_rx_g[0] = 1'b1 ;
			  end
		default : begin	// red only for 270 Mbps
				sdi_led_rx_r[0] = 1'b1 ;
				sdi_led_rx_g[0] = 1'b0 ;
			  end
		endcase
	end



endmodule




