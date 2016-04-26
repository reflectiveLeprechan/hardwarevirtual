// megafunction wizard: %ALTGX%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt_c3gxb 

// ============================================================
// File Name: rc_c4gxb_rx.v
// Megafunction Name(s):
// 			alt_c3gxb
//
// Simulation Library Files(s):
// 			altera_mf;cycloneiv_hssi
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 10.0 Internal Build 167 03/30/2010 PN Full Version
// ************************************************************


//Copyright (C) 1991-2010 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module rc_c4gxb_rx (
	cal_blk_clk,
	gxb_powerdown,
	pll_areset,
	pll_configupdate,
	pll_inclk,
	pll_scanclk,
	pll_scanclkena,
	pll_scandata,
	reconfig_clk,
	pll_clkswitch,
	pll_inclk1,
	reconfig_togxb,
	rx_analogreset,
	rx_bitslip,
	rx_datain,
	rx_digitalreset,
	rx_locktodata,
	rx_locktorefclk,
	pll_locked,
	pll_reconfig_done,
	pll_scandataout,
	reconfig_fromgxb,
	rx_clkout,
	rx_dataout);

	input	  cal_blk_clk;
	input	[0:0]  gxb_powerdown;
	input	[0:0]  pll_areset;
	input	[0:0]  pll_configupdate;
	input	  pll_inclk;
	input	[0:0]  pll_scanclk;
	input	[0:0]  pll_scanclkena;
	input	[0:0]  pll_scandata;
	input	  reconfig_clk;
	input	[3:0]  reconfig_togxb;
	input	[0:0]  rx_analogreset;
	input	[0:0]  rx_bitslip;
	input	[0:0]  rx_datain;
	input	[0:0]  rx_digitalreset;
	input	[0:0]  rx_locktodata;
	input	[0:0]  rx_locktorefclk;
	input          pll_clkswitch;
	input          pll_inclk1;
	output	[0:0]  pll_locked;
	output	[0:0]  pll_reconfig_done;
	output	[0:0]  pll_scandataout;
	output	[4:0]  reconfig_fromgxb;
	output	[0:0]  rx_clkout;
	output	[19:0]  rx_dataout;

        parameter starting_channel_number = 4;
	parameter pll_inclk_period = 6734;
	parameter rx_data_rate = 2970;
        parameter effective_data_rate = "2970 Mbps";
	parameter input_clock_frequency = "148.50MHz";
        parameter rx_enable_second_order_loop = "false";
        parameter rx_loop_1_digital_filter = 8;
        parameter pll_en_switchover = "false";
        parameter pll_inclk1_period = 6741;
   
	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1;
	wire [4:0] sub_wire2;
	wire [0:0] sub_wire3;
	wire [0:0] sub_wire4;
	wire [19:0] sub_wire5;
	wire [0:0] pll_locked = sub_wire0[0:0];
	wire [0:0] pll_reconfig_done = sub_wire1[0:0];
	wire [4:0] reconfig_fromgxb = sub_wire2[4:0];
	wire [0:0] pll_scandataout = sub_wire3[0:0];
	wire [0:0] rx_clkout = sub_wire4[0:0];
	wire [19:0] rx_dataout = sub_wire5[19:0];

	alt_c3gxb	alt_c3gxb_component (
				.pll_configupdate (pll_configupdate),
				.pll_inclk (pll_inclk),
				.reconfig_togxb (reconfig_togxb),
				.rx_bitslip (rx_bitslip),
				.cal_blk_clk (cal_blk_clk),
				.pll_scanclk (pll_scanclk),
				.pll_scanclkena (pll_scanclkena),
				.pll_scandata (pll_scandata),
				.reconfig_clk (reconfig_clk),
				.rx_analogreset (rx_analogreset),
				.rx_datain (rx_datain),
				.rx_digitalreset (rx_digitalreset),
				.pll_areset (pll_areset),
				.rx_locktodata (rx_locktodata),
				.rx_locktorefclk (rx_locktorefclk),
				.gxb_powerdown (gxb_powerdown),
				.pll_locked (sub_wire0),
				.pll_reconfig_done (sub_wire1),
				.reconfig_fromgxb (sub_wire2),
				.pll_scandataout (sub_wire3),
				.rx_clkout (sub_wire4),
				.pll_clkswitch(pll_clkswitch),
				.pll_inclk1(pll_inclk1),
				.rx_dataout (sub_wire5)
				// synopsys translate_off
				,
				.cal_blk_powerdown (),
				.coreclkout (),
				.fixedclk (),
				.fixedclk_fast (),
				.hip_tx_clkout (),
				.pipe8b10binvpolarity (),
				.pipedatavalid (),
				.pipeelecidle (),
				.pipephydonestatus (),
				.pipestatus (),
				.pll_powerdown (),
				.powerdn (),
				.rx_a1a2size (),
				.rx_a1a2sizeout (),
				.rx_a1detect (),
				.rx_a2detect (),
				.rx_bistdone (),
				.rx_bisterr (),
				.rx_bitslipboundaryselectout (),
				.rx_byteorderalignstatus (),
				.rx_channelaligned (),
				.rx_coreclk (),
				.rx_ctrldetect (),
				.rx_disperr (),
				.rx_elecidleinfersel (),
				.rx_enabyteord (),
				.rx_enapatternalign (),
				.rx_errdetect (),
				.rx_freqlocked (),
				.rx_invpolarity (),
				.rx_k1detect (),
				.rx_k2detect (),
				.rx_patterndetect (),
				.rx_phase_comp_fifo_error (),
				.rx_phfifooverflow (),
				.rx_phfifordenable (),
				.rx_phfiforeset (),
				.rx_phfifounderflow (),
				.rx_phfifowrdisable (),
				.rx_pipebufferstat (),
				.rx_powerdown (),
				.rx_prbscidenable (),
				.rx_recovclkout (),
				.rx_revbitorderwa (),
				.rx_revseriallpbkout (),
				.rx_rlv (),
				.rx_rmfifodatadeleted (),
				.rx_rmfifodatainserted (),
				.rx_rmfifoempty (),
				.rx_rmfifofull (),
				.rx_rmfifordena (),
				.rx_rmfiforeset (),
				.rx_rmfifowrena (),
				.rx_runningdisp (),
				.rx_seriallpbkin (),
				.rx_signaldetect (),
				.rx_syncstatus (),
				.tx_bitslipboundaryselect (),
				.tx_clkout (),
				.tx_coreclk (),
				.tx_ctrlenable (),
				.tx_datain (),
				.tx_datainfull (),
				.tx_dataout (),
				.tx_detectrxloop (),
				.tx_digitalreset (),
				.tx_dispval (),
				.tx_forcedisp (),
				.tx_forcedispcompliance (),
				.tx_forceelecidle (),
				.tx_invpolarity (),
				.tx_phase_comp_fifo_error (),
				.tx_phfifooverflow (),
				.tx_phfiforeset (),
				.tx_phfifounderflow (),
				.tx_revparallellpbken (),
				.tx_revseriallpbkin (),
				.tx_seriallpbkout ()
				// synopsys translate_on
				);
	defparam
		alt_c3gxb_component.starting_channel_number = starting_channel_number,
		alt_c3gxb_component.effective_data_rate = effective_data_rate,
		alt_c3gxb_component.input_clock_frequency = input_clock_frequency,
		alt_c3gxb_component.pll_inclk_period = pll_inclk_period,
		alt_c3gxb_component.reconfig_dprio_mode = 18,
		alt_c3gxb_component.rx_cru_inclock0_period = pll_inclk_period,
		alt_c3gxb_component.rx_data_rate = rx_data_rate,
		alt_c3gxb_component.rx_enable_second_order_loop = rx_enable_second_order_loop,
		alt_c3gxb_component.rx_loop_1_digital_filter = rx_loop_1_digital_filter,
		alt_c3gxb_component.sim_en_pll_fs_res = "true",
		alt_c3gxb_component.lpm_hint = "CBX_HDL_LANGUAGE=Verilog",
		alt_c3gxb_component.enable_pll_inclk_alt_drive_rx_cru = "true",
		alt_c3gxb_component.enable_pll_inclk_drive_rx_cru = "true",
		alt_c3gxb_component.equalizer_dcgain_setting = 0,
		alt_c3gxb_component.gen_reconfig_pll = "false",
		alt_c3gxb_component.gx_channel_type = "",		
		alt_c3gxb_component.intended_device_family = "Cyclone IV GX",
		alt_c3gxb_component.intended_device_speed_grade = "6",
		alt_c3gxb_component.intended_device_variant = "ANY",
		alt_c3gxb_component.loopback_mode = "none",	
		alt_c3gxb_component.lpm_type = "alt_c3gxb",
		alt_c3gxb_component.number_of_channels = 1,
		alt_c3gxb_component.operation_mode = "rx",
		alt_c3gxb_component.pll_bandwidth_type = "Auto",
		alt_c3gxb_component.pll_control_width = 1,
		alt_c3gxb_component.protocol = "basic",
		alt_c3gxb_component.receiver_termination = "oct_100_ohms",	
		alt_c3gxb_component.rx_8b_10b_mode = "none",
		alt_c3gxb_component.rx_align_pattern = "0101111100",
		alt_c3gxb_component.rx_align_pattern_length = 10,
		alt_c3gxb_component.rx_allow_align_polarity_inversion = "false",
		alt_c3gxb_component.rx_allow_pipe_polarity_inversion = "false",
		alt_c3gxb_component.rx_bitslip_enable = "true",
		alt_c3gxb_component.rx_byte_ordering_mode = "NONE",
		alt_c3gxb_component.rx_channel_width = 20,
		alt_c3gxb_component.rx_common_mode = "0.82v",	
		alt_c3gxb_component.rx_datapath_low_latency_mode = "false",
		alt_c3gxb_component.rx_datapath_protocol = "basic",		
		alt_c3gxb_component.rx_data_rate_remainder = 0,
		alt_c3gxb_component.rx_digitalreset_port_width = 1,
		alt_c3gxb_component.rx_enable_bit_reversal = "false",
		alt_c3gxb_component.rx_enable_deep_align_byte_swap = "false",
		alt_c3gxb_component.rx_enable_lock_to_data_sig = "true",
		alt_c3gxb_component.rx_enable_lock_to_refclk_sig = "true",
		alt_c3gxb_component.rx_enable_self_test_mode = "false",
		alt_c3gxb_component.rx_flip_rx_out = "false",
		alt_c3gxb_component.rx_force_signal_detect = "true",
		alt_c3gxb_component.rx_phfiforegmode = "false",
		alt_c3gxb_component.rx_ppmselect = 8,
		alt_c3gxb_component.rx_rate_match_fifo_mode = "none",
		alt_c3gxb_component.rx_run_length = 40,
		alt_c3gxb_component.rx_run_length_enable = "true",
		alt_c3gxb_component.rx_signal_detect_threshold = 8,
		alt_c3gxb_component.rx_use_align_state_machine = "false",
		alt_c3gxb_component.rx_use_clkout = "true",
		alt_c3gxb_component.rx_use_coreclk = "false",
		alt_c3gxb_component.rx_use_deserializer_double_data_mode = "false",
		alt_c3gxb_component.rx_use_deskew_fifo = "false",
		alt_c3gxb_component.rx_use_double_data_mode = "true",
		alt_c3gxb_component.use_calibration_block = "true",
		alt_c3gxb_component.equalization_setting = 5,
		alt_c3gxb_component.gxb_powerdown_width = 1,
		alt_c3gxb_component.number_of_quads = 1,
		alt_c3gxb_component.pll_divide_by = "1",
		alt_c3gxb_component.pll_multiply_by = "10",
		alt_c3gxb_component.reconfig_calibration = "true",
		alt_c3gxb_component.reconfig_fromgxb_port_width = 5,
		alt_c3gxb_component.reconfig_pll_control_width = 1,
		alt_c3gxb_component.reconfig_togxb_port_width = 4,
		alt_c3gxb_component.rx_deskew_pattern = "0",
		alt_c3gxb_component.rx_dwidth_factor = 2,
		alt_c3gxb_component.rx_signal_detect_loss_threshold = "1",
		alt_c3gxb_component.rx_signal_detect_valid_threshold = "14",
		alt_c3gxb_component.rx_use_external_termination = "false",
		alt_c3gxb_component.rx_word_aligner_num_byte = 1,
		alt_c3gxb_component.rx_reconfig_clk_scheme = "indv_clk_source",
		alt_c3gxb_component.pll_en_switchover = pll_en_switchover,
		alt_c3gxb_component.pll_inclk1_period = pll_inclk1_period,
		alt_c3gxb_component.number_of_rx_pll = 1,
		alt_c3gxb_component.top_module_name = "rc_c4gxb_rx";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
// Retrieval info: PRIVATE: NUM_KEYS NUMERIC "0"
// Retrieval info: PRIVATE: RECONFIG_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: RECONFIG_SUBPROTOCOL STRING "none"
// Retrieval info: PRIVATE: RX_ENABLE_DC_COUPLING STRING "false"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIZ_BASE_DATA_RATE STRING "2970"
// Retrieval info: PRIVATE: WIZ_BASE_DATA_RATE_ENABLE STRING "0"
// Retrieval info: PRIVATE: WIZ_DATA_RATE STRING "2970"
// Retrieval info: PRIVATE: WIZ_DPRIO_INCLK_FREQ_ARRAY STRING "37.125 38.076923 39.078947 40.135135 41.25 42.428571 43.67647 45.0 46.40625 47.903225 49.5 51.206896 53.035714 55.0 57.115384 59.4 61.875 64.565217 67.5 70.714285"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A STRING "2000"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B STRING "N/A"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_DPRIO_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_FREQ STRING "37.125"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK0_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK1_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK2_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK3_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK4_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK5_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_FREQ STRING "250"
// Retrieval info: PRIVATE: WIZ_DPRIO_REF_CLK6_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_ENABLE_EQUALIZER_CTRL NUMERIC "1"
// Retrieval info: PRIVATE: WIZ_EQUALIZER_CTRL_SETTING NUMERIC "1"
// Retrieval info: PRIVATE: WIZ_FORCE_DEFAULT_SETTINGS NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ STRING "148.5"
// Retrieval info: PRIVATE: WIZ_INCLK_FREQ_ARRAY STRING "37.125 38.076923 39.078947 40.135135 41.25 42.428571 43.67647 45.0 46.40625 47.903225 49.5 51.206896 53.035714 55.0 57.115384 59.4 61.875 64.565217 67.5 70.714285"
// Retrieval info: PRIVATE: WIZ_INPUT_A STRING "2970"
// Retrieval info: PRIVATE: WIZ_INPUT_A_UNIT STRING "Mbps"
// Retrieval info: PRIVATE: WIZ_INPUT_B STRING "148.5"
// Retrieval info: PRIVATE: WIZ_INPUT_B_UNIT STRING "MHz"
// Retrieval info: PRIVATE: WIZ_INPUT_SELECTION NUMERIC "0"
// Retrieval info: PRIVATE: WIZ_PROTOCOL STRING "Basic"
// Retrieval info: PRIVATE: WIZ_SUBPROTOCOL STRING "None"
// Retrieval info: PRIVATE: WIZ_WORD_ALIGN_FLIP_PATTERN STRING "0"
// Retrieval info: PARAMETER: STARTING_CHANNEL_NUMBER NUMERIC "0"
// Retrieval info: CONSTANT: EFFECTIVE_DATA_RATE STRING "2970 Mbps"
// Retrieval info: CONSTANT: ENABLE_PLL_INCLK_ALT_DRIVE_RX_CRU STRING "true"
// Retrieval info: CONSTANT: ENABLE_PLL_INCLK_DRIVE_RX_CRU STRING "true"
// Retrieval info: CONSTANT: EQUALIZER_DCGAIN_SETTING NUMERIC "0"
// Retrieval info: CONSTANT: GEN_RECONFIG_PLL STRING "false"
// Retrieval info: CONSTANT: GX_CHANNEL_TYPE STRING ""
// Retrieval info: CONSTANT: INPUT_CLOCK_FREQUENCY STRING "148.5 MHz"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
// Retrieval info: CONSTANT: INTENDED_DEVICE_SPEED_GRADE STRING "6"
// Retrieval info: CONSTANT: INTENDED_DEVICE_VARIANT STRING "ANY"
// Retrieval info: CONSTANT: LOOPBACK_MODE STRING "none"
// Retrieval info: CONSTANT: LPM_TYPE STRING "alt_c3gxb"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "rx"
// Retrieval info: CONSTANT: PLL_BANDWIDTH_TYPE STRING "Auto"
// Retrieval info: CONSTANT: PLL_CONTROL_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: PLL_INCLK_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RECEIVER_TERMINATION STRING "oct_100_ohms"
// Retrieval info: CONSTANT: RECONFIG_DPRIO_MODE NUMERIC "18"
// Retrieval info: CONSTANT: RX_8B_10B_MODE STRING "none"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN STRING "0101111100"
// Retrieval info: CONSTANT: RX_ALIGN_PATTERN_LENGTH NUMERIC "10"
// Retrieval info: CONSTANT: RX_ALLOW_ALIGN_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_ALLOW_PIPE_POLARITY_INVERSION STRING "false"
// Retrieval info: CONSTANT: RX_BITSLIP_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_BYTE_ORDERING_MODE STRING "NONE"
// Retrieval info: CONSTANT: RX_CHANNEL_WIDTH NUMERIC "20"
// Retrieval info: CONSTANT: RX_COMMON_MODE STRING "0.82v"
// Retrieval info: CONSTANT: RX_CRU_INCLOCK0_PERIOD NUMERIC "6734"
// Retrieval info: CONSTANT: RX_DATAPATH_LOW_LATENCY_MODE STRING "false"
// Retrieval info: CONSTANT: RX_DATAPATH_PROTOCOL STRING "basic"
// Retrieval info: CONSTANT: RX_DATA_RATE NUMERIC "2970"
// Retrieval info: CONSTANT: RX_DATA_RATE_REMAINDER NUMERIC "0"
// Retrieval info: CONSTANT: RX_DIGITALRESET_PORT_WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: RX_ENABLE_BIT_REVERSAL STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_DEEP_ALIGN_BYTE_SWAP STRING "false"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_DATA_SIG STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_LOCK_TO_REFCLK_SIG STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_SELF_TEST_MODE STRING "false"
// Retrieval info: CONSTANT: RX_FLIP_RX_OUT STRING "false"
// Retrieval info: CONSTANT: RX_FORCE_SIGNAL_DETECT STRING "true"
// Retrieval info: CONSTANT: RX_PHFIFOREGMODE STRING "false"
// Retrieval info: CONSTANT: RX_PPMSELECT NUMERIC "8"
// Retrieval info: CONSTANT: RX_RATE_MATCH_FIFO_MODE STRING "none"
// Retrieval info: CONSTANT: RX_RUN_LENGTH NUMERIC "40"
// Retrieval info: CONSTANT: RX_RUN_LENGTH_ENABLE STRING "true"
// Retrieval info: CONSTANT: RX_SIGNAL_DETECT_THRESHOLD NUMERIC "2"
// Retrieval info: CONSTANT: RX_USE_ALIGN_STATE_MACHINE STRING "false"
// Retrieval info: CONSTANT: RX_USE_CLKOUT STRING "true"
// Retrieval info: CONSTANT: RX_USE_CORECLK STRING "false"
// Retrieval info: CONSTANT: RX_USE_DESERIALIZER_DOUBLE_DATA_MODE STRING "false"
// Retrieval info: CONSTANT: RX_USE_DESKEW_FIFO STRING "false"
// Retrieval info: CONSTANT: RX_USE_DOUBLE_DATA_MODE STRING "true"
// Retrieval info: CONSTANT: RX_ENABLE_SECOND_ORDER_LOOP STRING "false"
// Retrieval info: CONSTANT: RX_LOOP_1_DIGITAL_FILTER NUMERIC "8"
// Retrieval info: CONSTANT: USE_CALIBRATION_BLOCK STRING "true"
// Retrieval info: CONSTANT: equalization_setting NUMERIC "5"
// Retrieval info: CONSTANT: gxb_powerdown_width NUMERIC "1"
// Retrieval info: CONSTANT: number_of_quads NUMERIC "1"
// Retrieval info: CONSTANT: pll_divide_by STRING "1"
// Retrieval info: CONSTANT: pll_multiply_by STRING "10"
// Retrieval info: CONSTANT: reconfig_calibration STRING "true"
// Retrieval info: CONSTANT: reconfig_fromgxb_port_width NUMERIC "5"
// Retrieval info: CONSTANT: reconfig_pll_control_width NUMERIC "1"
// Retrieval info: CONSTANT: reconfig_togxb_port_width NUMERIC "4"
// Retrieval info: CONSTANT: rx_deskew_pattern STRING "0"
// Retrieval info: CONSTANT: rx_dwidth_factor NUMERIC "2"
// Retrieval info: CONSTANT: rx_signal_detect_loss_threshold STRING "1"
// Retrieval info: CONSTANT: rx_signal_detect_valid_threshold STRING "1"
// Retrieval info: CONSTANT: rx_use_external_termination STRING "false"
// Retrieval info: CONSTANT: rx_word_aligner_num_byte NUMERIC "1"
// Retrieval info: CONSTANT: top_module_name STRING "rc_c4gxb_rx"
// Retrieval info: USED_PORT: cal_blk_clk 0 0 0 0 INPUT NODEFVAL "cal_blk_clk"
// Retrieval info: USED_PORT: gxb_powerdown 0 0 1 0 INPUT NODEFVAL "gxb_powerdown[0..0]"
// Retrieval info: USED_PORT: pll_areset 0 0 1 0 INPUT NODEFVAL "pll_areset[0..0]"
// Retrieval info: USED_PORT: pll_configupdate 0 0 1 0 INPUT NODEFVAL "pll_configupdate[0..0]"
// Retrieval info: USED_PORT: pll_inclk 0 0 0 0 INPUT NODEFVAL "pll_inclk"
// Retrieval info: USED_PORT: pll_locked 0 0 1 0 OUTPUT NODEFVAL "pll_locked[0..0]"
// Retrieval info: USED_PORT: pll_reconfig_done 0 0 1 0 OUTPUT NODEFVAL "pll_reconfig_done[0..0]"
// Retrieval info: USED_PORT: pll_scanclk 0 0 1 0 INPUT NODEFVAL "pll_scanclk[0..0]"
// Retrieval info: USED_PORT: pll_scanclkena 0 0 1 0 INPUT NODEFVAL "pll_scanclkena[0..0]"
// Retrieval info: USED_PORT: pll_scandata 0 0 1 0 INPUT NODEFVAL "pll_scandata[0..0]"
// Retrieval info: USED_PORT: pll_scandataout 0 0 1 0 OUTPUT NODEFVAL "pll_scandataout[0..0]"
// Retrieval info: USED_PORT: reconfig_clk 0 0 0 0 INPUT NODEFVAL "reconfig_clk"
// Retrieval info: USED_PORT: reconfig_fromgxb 0 0 5 0 OUTPUT NODEFVAL "reconfig_fromgxb[4..0]"
// Retrieval info: USED_PORT: reconfig_togxb 0 0 4 0 INPUT NODEFVAL "reconfig_togxb[3..0]"
// Retrieval info: USED_PORT: rx_analogreset 0 0 1 0 INPUT NODEFVAL "rx_analogreset[0..0]"
// Retrieval info: USED_PORT: rx_bitslip 0 0 1 0 INPUT NODEFVAL "rx_bitslip[0..0]"
// Retrieval info: USED_PORT: rx_clkout 0 0 1 0 OUTPUT NODEFVAL "rx_clkout[0..0]"
// Retrieval info: USED_PORT: rx_datain 0 0 1 0 INPUT NODEFVAL "rx_datain[0..0]"
// Retrieval info: USED_PORT: rx_dataout 0 0 20 0 OUTPUT NODEFVAL "rx_dataout[19..0]"
// Retrieval info: USED_PORT: rx_digitalreset 0 0 1 0 INPUT NODEFVAL "rx_digitalreset[0..0]"
// Retrieval info: USED_PORT: rx_locktodata 0 0 1 0 INPUT NODEFVAL "rx_locktodata[0..0]"
// Retrieval info: USED_PORT: rx_locktorefclk 0 0 1 0 INPUT NODEFVAL "rx_locktorefclk[0..0]"
// Retrieval info: CONNECT: @cal_blk_clk 0 0 0 0 cal_blk_clk 0 0 0 0
// Retrieval info: CONNECT: @gxb_powerdown 0 0 1 0 gxb_powerdown 0 0 1 0
// Retrieval info: CONNECT: @pll_areset 0 0 1 0 pll_areset 0 0 1 0
// Retrieval info: CONNECT: @pll_configupdate 0 0 1 0 pll_configupdate 0 0 1 0
// Retrieval info: CONNECT: @pll_inclk 0 0 0 0 pll_inclk 0 0 0 0
// Retrieval info: CONNECT: @pll_scanclk 0 0 1 0 pll_scanclk 0 0 1 0
// Retrieval info: CONNECT: @pll_scanclkena 0 0 1 0 pll_scanclkena 0 0 1 0
// Retrieval info: CONNECT: @pll_scandata 0 0 1 0 pll_scandata 0 0 1 0
// Retrieval info: CONNECT: @reconfig_clk 0 0 0 0 reconfig_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_togxb 0 0 4 0 reconfig_togxb 0 0 4 0
// Retrieval info: CONNECT: @rx_analogreset 0 0 1 0 rx_analogreset 0 0 1 0
// Retrieval info: CONNECT: @rx_bitslip 0 0 1 0 rx_bitslip 0 0 1 0
// Retrieval info: CONNECT: @rx_datain 0 0 1 0 rx_datain 0 0 1 0
// Retrieval info: CONNECT: @rx_digitalreset 0 0 1 0 rx_digitalreset 0 0 1 0
// Retrieval info: CONNECT: @rx_locktodata 0 0 1 0 rx_locktodata 0 0 1 0
// Retrieval info: CONNECT: @rx_locktorefclk 0 0 1 0 rx_locktorefclk 0 0 1 0
// Retrieval info: CONNECT: pll_locked 0 0 1 0 @pll_locked 0 0 1 0
// Retrieval info: CONNECT: pll_reconfig_done 0 0 1 0 @pll_reconfig_done 0 0 1 0
// Retrieval info: CONNECT: pll_scandataout 0 0 1 0 @pll_scandataout 0 0 1 0
// Retrieval info: CONNECT: reconfig_fromgxb 0 0 5 0 @reconfig_fromgxb 0 0 5 0
// Retrieval info: CONNECT: rx_clkout 0 0 1 0 @rx_clkout 0 0 1 0
// Retrieval info: CONNECT: rx_dataout 0 0 20 0 @rx_dataout 0 0 20 0
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL rc_c4gxb_rx_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
// Retrieval info: LIB_FILE: cycloneiv_hssi
