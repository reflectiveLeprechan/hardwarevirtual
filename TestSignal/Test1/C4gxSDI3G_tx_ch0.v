// megafunction wizard: %SDI v12.0%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			sdi_megacore_top
// ============================================================
// Generated by SDI 12.0 [Altera, IP Toolbench 1.3.0 Build 263]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2012 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.


module C4gxSDI3G_tx_ch0 (
	rst_tx,
	tx_pclk,
	tx_serial_refclk,
	txdata,
	tx_trs,
	tx_ln,
	enable_ln,
	enable_crc,
	gxb4_cal_clk,
	sdi_reconfig_clk,
	sdi_gxb_powerdown,
	sdi_reconfig_togxb,
	tx_std,
	sdi_tx,
	tx_status,
	gxb_tx_clkout,
	sdi_reconfig_fromgxb);

	parameter QTB = "on";
	parameter QTB_direction = "Tx";
	parameter QTB_test_pattern = "false";
	parameter QTB_num_channels = "1";
	parameter QTB_standard = "MR";
	parameter QTB_rate_flag = "false";
	parameter QTB_crc_flag = "false";
	parameter QTB_enable_soft_serdes = "false";
	parameter QTB_tx_clk_option = "no_pll";
	parameter QTB_rx_clk_option = "no_pll";
	parameter QTB_fvh_flag = "false";
	parameter QTB_os_mode = "false";
	parameter QTB_serdes_type = " ";
	parameter QTB_tcvr_protocol_select = "tcvr_protocol";
	parameter QTB_starting_channel_number = "8";
	parameter QTB_tolerate_missed_eav = "1";
	parameter QTB_debugMode = "false";
	parameter QTB_enable_pll_reconfig = "false";
	parameter QTB_enable_tx_clk_mux = "false";
	parameter QTB_enable_ssc = "false";
	parameter QTB_devicefamily = "Cyclone IV GX";
	parameter QTB_dlparam = "false";
	parameter QTB_dsparam = "false";
	parameter QTB_duplex = "false";
	parameter QTB_hdparam = "false";
	parameter QTB_mrparam = "true";
	parameter QTB_multiXcvrText0 = "Device Behavior for Multiple Transceivers";
	parameter QTB_multiXcvrText1 = "Cyclone IV GX EP4CGX30CF23,50,75,110,150 have 3MPLLs per quad. 30CF23,";
	parameter QTB_multiXcvrText2 = "50,75 have local clock divider allowing 1MPLL driving all the receiver channels.";
	parameter QTB_multiXcvrText3 = "Channel reconfiguration is supported in these devices. The other 2MPLLs";
	parameter QTB_multiXcvrText4 = "allow each transmitter to run at one of two independent rates. 110,150 have";
	parameter QTB_multiXcvrText5 = "no local clock divider, which prevents them from operating independently.";
	parameter QTB_multiXcvrText6 = "2MPLLs for receiver channel independently and 1MPLL shared among the";
	parameter QTB_multiXcvrText7 = "transmitter channels. PLL reconfiguration is the only option for 110,150.";
	parameter QTB_rx = "false";
	parameter QTB_sdparam = "false";
	parameter QTB_starting_channel_text_0 = "Each SDI core must have a unique starting channel number.";
	parameter QTB_starting_channel_text_1 = "See ALTERA GXB or SDI user guide for more info.";
	parameter QTB_threegparam = "false";
	parameter QTB_tx = "true";

	input		rst_tx;
	input		tx_pclk;
	input		tx_serial_refclk;
	input	[19:0]	txdata;
	input	[0:0]	tx_trs;
	input	[21:0]	tx_ln;
	input	[0:0]	enable_ln;
	input	[0:0]	enable_crc;
	input		gxb4_cal_clk;
	input		sdi_reconfig_clk;
	input		sdi_gxb_powerdown;
	input	[3:0]	sdi_reconfig_togxb;
	input	[1:0]	tx_std;
	output	[0:0]	sdi_tx;
	output	[0:0]	tx_status;
	output	[0:0]	gxb_tx_clkout;
	output	[16:0]	sdi_reconfig_fromgxb;


	sdi_megacore_top	sdi_megacore_top_inst(
		.rst_tx(rst_tx),
		.tx_pclk(tx_pclk),
		.tx_serial_refclk(tx_serial_refclk),
		.txdata(txdata),
		.tx_trs(tx_trs),
		.tx_ln(tx_ln),
		.enable_ln(enable_ln),
		.enable_crc(enable_crc),
		.gxb4_cal_clk(gxb4_cal_clk),
		.sdi_reconfig_clk(sdi_reconfig_clk),
		.sdi_gxb_powerdown(sdi_gxb_powerdown),
		.sdi_reconfig_togxb(sdi_reconfig_togxb),
		.tx_std(tx_std),
		.sdi_tx(sdi_tx),
		.tx_status(tx_status),
		.gxb_tx_clkout(gxb_tx_clkout),
		.sdi_reconfig_fromgxb(sdi_reconfig_fromgxb));

	defparam
		sdi_megacore_top_inst.ENABLE_TX_LOGIC = 1'b1,
		sdi_megacore_top_inst.ENABLE_RX_LOGIC = 1'b0,
		sdi_megacore_top_inst.enable_pattern_generator = 1'b0,
		sdi_megacore_top_inst.num_chs = 1,
		sdi_megacore_top_inst.enable_rate_flags = 1'b0,
		sdi_megacore_top_inst.generate_hd_blocks = 1'b1,
		sdi_megacore_top_inst.generate_sd_blocks = 1'b1,
		sdi_megacore_top_inst.enable_hard_serdes = 1'b1,
		sdi_megacore_top_inst.enable_crc_flag_port = 1'b0,
		sdi_megacore_top_inst.enable_soft_serdes = 1'b0,
		sdi_megacore_top_inst.INCLUDE_TX_PLL = 1'b0,
		sdi_megacore_top_inst.INCLUDE_RX_PLL = 1'b0,
		sdi_megacore_top_inst.enable_fvh_flag_port = 1'b0,
		sdi_megacore_top_inst.ENABLE_RX_GXB = 1'b0,
		sdi_megacore_top_inst.ENABLE_TX_GXB = 1'b1,
		sdi_megacore_top_inst.ENABLE_HD_DUAL_LINK = 1'b0,
		sdi_megacore_top_inst.ENABLE_2X_HD_TX = 1'b0,
		sdi_megacore_top_inst.ENABLE_3G = 1'b1,
		sdi_megacore_top_inst.ENABLE_RX_SS = 1'b0,
		sdi_megacore_top_inst.ENABLE_TX_SS = 1'b0,
		sdi_megacore_top_inst.USE_CYCLONE_CLOCKING = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT2GXB = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT4GXB = 1'b0,
		sdi_megacore_top_inst.SELECT_ALT_C4GXB = 1'b1,
		sdi_megacore_top_inst.ENABLE_PLL_RECONFIG = 1'b0,
		sdi_megacore_top_inst.ENABLE_SSC = 1'b0,
		sdi_megacore_top_inst.STARTING_CHANNEL_NUMBER = 8,
		sdi_megacore_top_inst.STARTING_CHANNEL_NUMBER_LINK_B = 12,
		sdi_megacore_top_inst.TOLERATE_CONSECUTIVE_MISSED_EAV = 1,
		sdi_megacore_top_inst.SELECT_FAMILY = "Cyclone IV GX",
		sdi_megacore_top_inst.ENABLE_TX_CLK_MUX = 1'b0,
		sdi_megacore_top_inst.SELECT_CUSTOMPHY = 1'b0;
endmodule

// =========================================================
// SDI Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, SDI Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="SDI MegaCore Function"  version="12.0"  build="263"  iptb_version="1.3.0 Build 263"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION active_core="sdi_megacore_top" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "direction" value="Tx"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "test_pattern" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "num_channels" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "standard" value="MR"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rate_flag" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "crc_flag" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_soft_serdes" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "tx_clk_option" value="no_pll"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rx_clk_option" value="no_pll"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "fvh_flag" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "os_mode" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "serdes_type" value=" "  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "tcvr_protocol_select" value="tcvr_protocol"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_number" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "tolerate_missed_eav" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "debugMode" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_pll_reconfig" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_tx_clk_mux" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "enable_ssc" value="false"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "devicefamily" value="Cyclone IV GX"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "dlparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "dsparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "duplex" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "hdparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "mrparam" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText0" value="Device Behavior for Multiple Transceivers"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText1" value="Cyclone IV GX EP4CGX30CF23,50,75,110,150 have 3MPLLs per quad. 30CF23,"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText2" value="50,75 have local clock divider allowing 1MPLL driving all the receiver channels."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText3" value="Channel reconfiguration is supported in these devices. The other 2MPLLs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText4" value="allow each transmitter to run at one of two independent rates. 110,150 have"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText5" value="no local clock divider, which prevents them from operating independently."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText6" value="2MPLLs for receiver channel independently and 1MPLL shared among the"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "multiXcvrText7" value="transmitter channels. PLL reconfiguration is the only option for 110,150."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "rx" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "sdparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_text_0" value="Each SDI core must have a unique starting channel number."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "starting_channel_text_1" value="See ALTERA GXB or SDI user guide for more info."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "threegparam" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "tx" value="true"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="VERILOG"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "gb_enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "filename" value="C4gxSDI3G_tx_ch0_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="C4gxSDI3G_tx_ch0.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:     <NAMESPACE name = "quartus_settings">
// Retrieval info:      <PRIVATE name = "WEB_BROWSER" value="/usr/bin/firefox"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "LICENSE_FILE" value="2000@pg-swphsrv:1700@goto:1800@ttc-licsrv"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "DEVICE" value="EP4CGX150DF31C7"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Cyclone IV GX"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <CONSTANTS>
// Retrieval info:     <CONSTANT name = "ENABLE_TX_LOGIC" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_LOGIC" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_pattern_generator" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "num_chs" value="1"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "enable_rate_flags" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "generate_hd_blocks" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "generate_sd_blocks" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_hard_serdes" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_crc_flag_port" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_soft_serdes" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "INCLUDE_TX_PLL" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "INCLUDE_RX_PLL" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "enable_fvh_flag_port" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_GXB" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_HD_DUAL_LINK" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_2X_HD_TX" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_3G" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_RX_SS" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_SS" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "USE_CYCLONE_CLOCKING" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT2GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT4GXB" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_ALT_C4GXB" value="1"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_PLL_RECONFIG" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_SSC" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "STARTING_CHANNEL_NUMBER" value="8"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "STARTING_CHANNEL_NUMBER_LINK_B" value="12"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "TOLERATE_CONSECUTIVE_MISSED_EAV" value="1"  type="INTEGER" />
// Retrieval info:     <CONSTANT name = "SELECT_FAMILY" value="Cyclone IV GX"  type="STRING" />
// Retrieval info:     <CONSTANT name = "ENABLE_TX_CLK_MUX" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SELECT_CUSTOMPHY" value="0"  type="HDL_VECTOR"  radix="BINARY"  width="1"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:    </CONSTANTS>
// Retrieval info:    <PORTS>
// Retrieval info:     <PORT name = "rst_tx" direction="INPUT"  connect_to="rst_tx"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "tx_pclk" direction="INPUT"  connect_to="tx_pclk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "tx_serial_refclk" direction="INPUT"  connect_to="tx_serial_refclk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_tx" direction="OUTPUT"  connect_to="sdi_tx"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "txdata" direction="INPUT"  connect_to="txdata"  default="NODEFVAL"  high_width="19"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "tx_trs" direction="INPUT"  connect_to="tx_trs"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "tx_ln" direction="INPUT"  connect_to="tx_ln"  default="NODEFVAL"  high_width="21"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "tx_status" direction="OUTPUT"  connect_to="tx_status"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "enable_ln" direction="INPUT"  connect_to="enable_ln"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "enable_crc" direction="INPUT"  connect_to="enable_crc"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "gxb4_cal_clk" direction="INPUT"  connect_to="gxb4_cal_clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "gxb_tx_clkout" direction="OUTPUT"  connect_to="gxb_tx_clkout"  default="NODEFVAL"  high_width="0"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_clk" direction="INPUT"  connect_to="sdi_reconfig_clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_gxb_powerdown" direction="INPUT"  connect_to="sdi_gxb_powerdown"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_togxb" direction="INPUT"  connect_to="sdi_reconfig_togxb"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "sdi_reconfig_fromgxb" direction="OUTPUT"  connect_to="sdi_reconfig_fromgxb"  default="NODEFVAL"  high_width="16"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "tx_std" direction="INPUT"  connect_to="tx_std"  default="NODEFVAL"  high_width="1"  low_width="0"  description="" />
// Retrieval info:    </PORTS>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
