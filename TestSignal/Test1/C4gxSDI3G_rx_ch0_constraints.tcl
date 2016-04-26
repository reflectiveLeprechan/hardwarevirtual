# ***************************************************
# SDI v12.0 constraints script for C4gxSDI3G_rx_ch0
# 
# Directions: Customize and run this script if using
#             custom pin names
# 
# ***************************************************

# Make your changes below this line
# ---------------------------------------------------

# Here are the clock pin names that you could change
set rx_coreclk_name "rx_coreclk"
set rx_serial_refclk_name "rx_serial_refclk"
set rx_serial_refclk1_name "rx_serial_refclk1"

# Do not make any changes beyond this line
# ---------------------------------------------------

package require ::quartus::flow
package require ::quartus::project
package require ::quartus::report
package require ::quartus::misc
package require ::quartus::device

set_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER "ON"

set sdc_file_prefix "C4gxSDI3G_rx_ch0_"

set current_project_dir [get_project_directory]
set numOfLines 0

set fexist [file exist "${current_project_dir}/${sdc_file_prefix}sdi.sdc"]
if { $fexist == 1 } {
    puts "INFO : SDI SDC Script Exists. Will patch file"
    set fp [open "${current_project_dir}/${sdc_file_prefix}sdi.sdc" r]
    set data [read $fp]
    set fdata ""
    foreach line [split $data \n] {
          lappend fdata $line
          incr numOfLines
    }
    close $fp
	
	set fp [open "${current_project_dir}/${sdc_file_prefix}sdi.sdc" w]
	set sfexist [file exist "${current_project_dir}/${sdc_file_prefix}sdi.sdc.sav"]
	if { $sfexist == 1 } {
	    puts "INFO : SDI Backup SDC File exists. Will not save backup copy"
	} else {
	    puts "INFO : Creating Back-up File" 
	    set fp_bk [open "${current_project_dir}/${sdc_file_prefix}sdi.sdc.sav" w]
	}
	
	for {set lineNum 0} {$lineNum < $numOfLines} {incr lineNum} {
	    set line [lindex $fdata $lineNum]
	    
	    if { $sfexist == 0 } {
	        puts $fp_bk $line
	    }
	    
		set found_rx_coreclk_name [regexp "set rx_coreclk_name" $line]
		set found_rx_serial_refclk_name [regexp "set rx_serial_refclk_name" $line]
		set found_rx_serial_refclk1_name [regexp "set rx_serial_refclk1_name" $line]
		if {$found_rx_coreclk_name == 1} {puts $fp "set rx_coreclk_name \"${rx_coreclk_name}\""
		} elseif {$found_rx_serial_refclk_name == 1} {puts $fp "set rx_serial_refclk_name \"${rx_serial_refclk_name}\""
		} elseif {$found_rx_serial_refclk1_name == 1} {puts $fp "set rx_serial_refclk1_name \"${rx_serial_refclk1_name}\""
		} else {puts $fp $line}
		set found_rx_coreclk_name 0
		set found_rx_serial_refclk_name 0
		set found_rx_serial_refclk1_name 0
		
		
	}
	close $fp
	
        if { $sfexist == 0 } {
	    close $fp_bk
        }

	export_assignments
	
} else {
    puts "ERROR : SDI SDC Script Does not Exist in this working directory."
    puts "ERROR : This script is unable to patch the SDC Script."
    error "ERROR : Please place this script and the SDC in the ${current_project_dir} directory."
}

