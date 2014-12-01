# The package naming convention is <core_name>_xmdf
package provide aurora8b10b_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::aurora8b10b_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::aurora8b10b_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name aurora8b10b
}
# ::aurora8b10b_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::aurora8b10b_xmdf::xmdfApplyParams { instance } {

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
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
utilities_xmdf::xmdfSetData $instance FileSet $fcount toplevel true
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/aurora8b10b_exdes.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/aurora8b10b_tb.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilogsim
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_mti.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_mti.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/timing/simulate_mti.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/timing/simulate_mti.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_isim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/simulation/functional/simulate_ncsim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_axi_to_ll.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_ll_to_axi.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type xco
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type veo
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_aurora_lane_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_aurora_lane_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_aurora_lane_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/aurora8b10b_exdes.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_channel_err_detect.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_channel_init_sm.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_chbond_count_dec_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_chbond_count_dec_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/clock_module/aurora8b10b_clock_module.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_err_detect_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_err_detect_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_err_detect_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/traffic_gen_check/aurora8b10b_frame_check.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/traffic_gen_check/aurora8b10b_frame_gen.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_global_logic.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_idle_and_ver_gen.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_lane_init_sm_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_lane_init_sm_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_lane_init_sm_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_left_align_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_left_align_mux.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/aurora8b10b_reset_logic.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/gt/aurora8b10b_transceiver_wrapper.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/gt/aurora8b10b_gtx.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_output_mux.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_output_switch_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_rx_ll_deframer.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_rx_ll.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_rx_ll_pdu_datapath.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_sideband_output.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/cc_manager/aurora8b10b_standard_cc_module.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_storage_ce_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_storage_count_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_storage_mux.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_storage_switch_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_sym_dec_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_sym_gen_4byte.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_tx_ll_control.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_tx_ll_datapath.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_tx_ll.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_valid_data_counter.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/v6_icon.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/example_design/v6_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/src/aurora8b10b_hotplug.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/planAhead_ise.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/planAhead_ise.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/planAhead_ise.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path aurora8b10b/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
}
# ::gen_comp_name_xmdf::xmdfApplyParams
