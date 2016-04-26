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
## Instance name: C4gxSDI3G_tx_ch1
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

set tx_pclk_name "tx_pclk"
set tx_serial_refclk_name "tx_serial_refclk"
create_clock -name $tx_pclk_name -period 6.734 -waveform { 0.000 3.367 } [get_ports $tx_pclk_name]
create_clock -name $tx_serial_refclk_name -period 6.734 -waveform { 0.000 3.367 } [get_ports $tx_serial_refclk_name]

#*************************
# Create Generated Clock *
#*************************


#********************
# Set Clock Latency *
#********************


#************************
# Set Clock Uncertainty *
#************************


#*******************
# Set Clock Groups *
#*******************

set_clock_groups -exclusive -group [get_clocks $tx_pclk_name] -group [get_clocks *sdi_megacore_top_inst|sdi_txrx_port_gen[0]*transmit*|clkout]

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

