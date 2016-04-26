## Copyright (C) 1991-2009 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 9.0 Build 132 02/25/2009 SJ Full Version"

## DATE    "Mon OCT 12 15:52:38 2009"

##
## DEVICE  "EP4SGX230KF40C3ES"
##


#**************************************************************
# Time Information
#**************************************************************
set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {CLKIN_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clkin_50}]
create_clock -name {HSMA_CLK_IN_P2} -period 6.734 -waveform { 0.000 3.367 } [get_ports {hsma_clk_in_p[2]}]
create_clock -name {SMA_CLK} -period 6.734 -waveform { 0.000 3.367 } [get_ports {clkin_sma_p[0]}]
create_clock -name {SMA_CLK1} -period 6.734 -waveform { 0.000 3.367 } [get_ports {clkin_sma_p[1]}]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks
create_generated_clock -name {TX_P0_PCLK_27m} -source [get_pins {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[0]}] -master_clock {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[0]} [get_pins {u0_hsmc_sdi|tx_p0_pclk|combout}] -add
create_generated_clock -name {TX_P1_PCLK_27m} -source [get_pins {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[1]}] -master_clock {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[1]} [get_pins {u0_hsmc_sdi|tx_p1_pclk|combout}] -add
create_generated_clock -name {TX_P0_PCLK_74m25} -source [get_pins {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[0]}] -master_clock {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[0]} [get_pins {u0_hsmc_sdi|tx_p0_pclk|combout}] -add
create_generated_clock -name {TX_P1_PCLK_74m25} -source [get_pins {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[1]}] -master_clock {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[1]} [get_pins {u0_hsmc_sdi|tx_p1_pclk|combout}] -add
create_generated_clock -name {TX_P0_PCLK_148m} -source [get_pins {u0_hsmc_sdi|u0_C4gxSDI3G_tx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout}] -master_clock {u0_hsmc_sdi|u0_C4gxSDI3G_tx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout} [get_pins {u0_hsmc_sdi|tx_p0_pclk|combout}] -add
create_generated_clock -name {TX_P1_PCLK_148m} -source [get_pins {u0_hsmc_sdi|u1_C4gxSDI3G_tx_ch1|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout}] -master_clock {u0_hsmc_sdi|u1_C4gxSDI3G_tx_ch1|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout} [get_pins {u0_hsmc_sdi|tx_p1_pclk|combout}] -add


#**************************************************************
# Set Clock Latency
#**************************************************************


#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************


#**************************************************************
# Set Output Delay
#**************************************************************


#**************************************************************
# Set Clock Groups
#**************************************************************
set_clock_groups -asynchronous -group [get_clocks {CLKIN_50}] -group [get_clocks {HSMA_CLK_IN_P2}] -group [get_clocks {SMA_CLK}] -group [get_clocks {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {TX_P0_PCLK_27m TX_P0_PCLK_74m25 TX_P0_PCLK_148m TX_P1_PCLK_27m TX_P1_PCLK_74m25 TX_P1_PCLK_148m}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}] 
set_clock_groups -exclusive -group [get_clocks {TX_P0_PCLK_148m}] -group [get_clocks {TX_P0_PCLK_27m}] -group [get_clocks {TX_P0_PCLK_74m25}] 
set_clock_groups -exclusive -group [get_clocks {TX_P1_PCLK_148m}] -group [get_clocks {TX_P1_PCLK_27m}] -group [get_clocks {TX_P1_PCLK_74m25}] 
set_clock_groups -exclusive -group [get_clocks {HSMA_CLK_IN_P2}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
set_clock_groups -exclusive -group [get_clocks {SMA_CLK}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
#set_clock_groups -exclusive -group [get_clocks {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[2]}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
set_clock_groups -exclusive -group [get_clocks {TX_P0_PCLK_27m TX_P0_PCLK_74m25 TX_P0_PCLK_148m}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_tx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout u0_hsmc_sdi|u1_C4gxSDI3G_tx_ch1|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout}]
set_clock_groups -exclusive -group [get_clocks {TX_P1_PCLK_27m TX_P1_PCLK_74m25 TX_P1_PCLK_148m}] -group [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_tx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout u0_hsmc_sdi|u1_C4gxSDI3G_tx_ch1|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_tx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|transmit_pcs0|clkout}]

#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_tr_gxb_interface:gen_u_gxb_if.u_gxb_if|sdi_tr_gxb_ctrl_s2gx:alt2gxb_ctrl.u_gxb2_ctrl|t_rx_std.STD_HD}] -to [get_clocks {TX_P1_PCLK_27m TX_P1_PCLK_74m25 TX_P1_PCLK_148m}]
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_tr_gxb_interface:gen_u_gxb_if.u_gxb_if|sdi_tr_gxb_ctrl_s2gx:alt2gxb_ctrl.u_gxb2_ctrl|t_rx_std.STD_3G}] -to [get_clocks {TX_P1_PCLK_27m TX_P1_PCLK_74m25 TX_P1_PCLK_148m}]
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_tr_gxb_interface:gen_u_gxb_if.u_gxb_if|sdi_tr_gxb_ctrl_s2gx:alt2gxb_ctrl.u_gxb2_ctrl|t_rx_std.STD_HD}] -to [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_tr_gxb_interface:gen_u_gxb_if.u_gxb_if|sdi_tr_gxb_ctrl_s2gx:alt2gxb_ctrl.u_gxb2_ctrl|t_rx_std.STD_3G}] -to [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_receive:rx_gen.u_receive|sdi_aligner_fsm:u_align|t_stored_trs_a_bn}] -to [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
set_false_path -from [get_registers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_receive:rx_gen.u_receive|sdi_aligner_fsm:u_align|t_stored_trs_a_bn}] -to [get_clocks {TX_P1_PCLK_27m TX_P1_PCLK_74m25 TX_P1_PCLK_148m}]
#set_false_path -from [get_registers {u0_hsmc_sdi|u6_pll_pclks|altpll_component|auto_generated|pll1|clk[2]}] -to [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}]
#set_false_path -from [get_clocks {u0_hsmc_sdi|u0_C4gxSDI3G_rx_ch0|sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}] -to [get_clocks {CLKIN_50}]

#**************************************************************
# Set Multicycle Path
#**************************************************************
set_multicycle_path -setup -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] 2
set_multicycle_path -hold -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] 1
set_multicycle_path -setup -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_rx_ch0:u0_C4gxSDI3G_rx_ch0|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_rx_ch0:u0_C4gxSDI3G_rx_ch0|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] 2
set_multicycle_path -hold -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_rx_ch0:u0_C4gxSDI3G_rx_ch0|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_rx_ch0:u0_C4gxSDI3G_rx_ch0|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] 1
set_multicycle_path -setup -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|lp_fifo:fifo_p1|dcfifo:dcfifo_component|dcfifo_4sh1:auto_generated|*}] 2
set_multicycle_path -hold -end -from [get_keepers {hsmc_sdi:u0_hsmc_sdi|C4gxSDI3G_tx_ch1:u1_C4gxSDI3G_tx_ch1|sdi_megacore_top:sdi_megacore_top_inst|sdi_txrx_port:sdi_txrx_port_gen[0].u_txrx_port|sdi_format:format_gen.u_format|*}] -to [get_keepers {hsmc_sdi:u0_hsmc_sdi|lp_fifo:fifo_p1|dcfifo:dcfifo_component|dcfifo_4sh1:auto_generated|*}] 1

#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

