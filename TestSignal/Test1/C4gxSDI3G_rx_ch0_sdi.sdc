## 
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

##
## Instance name: C4gxSDI3G_rx_ch0
## Version: SDI 12.0
##


#*******************
# Time Information *
#*******************

derive_pll_clocks
derive_clock_uncertainty

#***************
# Create Clock *
#***************


set rx_serial_refclk_name "rx_serial_refclk"
set rx_serial_refclk1_name "rx_serial_refclk1"
set rx_coreclk_name "rx_coreclk"
create_clock -name $rx_serial_refclk_name -period 6.734 -waveform { 0.000 3.367 } [get_ports $rx_serial_refclk_name]
create_clock -name $rx_serial_refclk1_name -period 6.741 -waveform { 0.000 3.371 } [get_ports $rx_serial_refclk1_name]
create_clock -name $rx_coreclk_name -period 6.734 -waveform { 0.000 3.367 } [get_ports $rx_coreclk_name]

#*************************
# Create Generated Clock *
#*************************

create_generated_clock -divide_by 5 -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|pll0|pll1|icdrclk} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|pll0|pll1|icdrclk} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout}
create_generated_clock -divide_by 5 -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|pll0|pll1|icdrclk} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|pll0|pll1|icdrclk~1} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout~1} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout} -add
create_generated_clock -divide_by 2 -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk}
create_generated_clock -divide_by 2 -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pma0|clockout~1} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk~1} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk} -add
create_generated_clock -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout}
create_generated_clock -source {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk} -master_clock {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|recoveredclk~1} -name {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout~1} {sdi_megacore_top_inst|sdi_txrx_port_gen[0].u_txrx_port|gen_rx_alt_c4gxb.u_gxb|alt_c3gxb_component|auto_generated|receive_pcs0|clkout} -add

#********************
# Set Clock Latency *
#********************


#************************
# Set Clock Uncertainty *
#************************


#*******************
# Set Clock Groups *
#*******************

set_clock_groups -exclusive -group [get_clocks $rx_serial_refclk_name] -group [get_clocks {*sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout~1}]
set_clock_groups -exclusive -group [get_clocks $rx_serial_refclk1_name] -group [get_clocks {*sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout~1}]
set_clock_groups -exclusive -group [get_clocks *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout] -group [get_clocks *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout~1]
set_clock_groups -exclusive -group [get_clocks $rx_coreclk_name] -group [get_clocks {*sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*receive*|clkout~1}]

#******************
# Set Input Delay *
#******************


#*******************
# Set Output Delay *
#*******************


#*****************
# Set False Path *
#*****************


#**********************
# Set Multicycle Path *
#**********************


#********************
# Set Maximum Delay *
#********************


#********************
# Set Minimum Delay *
#********************


#***********************
# Set Input Transition *
#***********************

