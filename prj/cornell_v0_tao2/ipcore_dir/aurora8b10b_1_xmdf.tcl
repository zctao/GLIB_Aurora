# The package naming convention is <core_name>_xmdf
package provide aurora8b10b_1_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::aurora8b10b_1_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::aurora8b10b_1_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name aurora8b10b_1
}
# ::aurora8b10b_1_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::aurora8b10b_1_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be magically
# available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
utilities_xmdf::xmdfSetData $instance FileSet $fcount toplevel true
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/aurora8b10b_1_exdes.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/aurora8b10b_1_tb.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdlsim
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_mti.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_mti.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/timing/simulate_mti.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/timing/simulate_mti.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_isim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/simulation/functional/simulate_ncsim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_axi_to_ll.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_ll_to_axi.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type xco
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vho
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_aurora_lane_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_aurora_pkg.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/aurora8b10b_1_exdes.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_channel_err_detect.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_channel_init_sm.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_chbond_count_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_chbond_count_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/clock_module/aurora8b10b_1_clock_module.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_err_detect_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/traffic_gen_check/aurora8b10b_1_frame_check.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/traffic_gen_check/aurora8b10b_1_frame_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_global_logic.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_idle_and_ver_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_lane_init_sm_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_left_align_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_left_align_mux.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/aurora8b10b_1_reset_logic.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/gt/aurora8b10b_1_transceiver_wrapper.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/gt/aurora8b10b_1_gtx.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_output_mux.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_output_switch_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_rx_ll_deframer.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_rx_ll_pdu_datapath.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_rx_ll.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_sideband_output.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/cc_manager/aurora8b10b_1_standard_cc_module.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_storage_ce_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_storage_count_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_storage_mux.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_storage_switch_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_sym_dec_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_sym_gen_4byte.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_tx_ll_control.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_tx_ll_datapath.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_tx_ll.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_valid_data_counter.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/v6_icon.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/example_design/v6_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/src/aurora8b10b_1_hotplug.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/planAhead_ise.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/planAhead_ise.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/planAhead_ise.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_1/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
}
# ::gen_comp_name_xmdf::xmdfApplyParams
