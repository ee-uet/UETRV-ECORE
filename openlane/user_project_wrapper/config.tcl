# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) WB_InterConnect
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/WB_Interconnect.v"

## Clock configurations
set ::env(CLOCK_PORT) "clock"

set ::env(CLOCK_PERIOD) "20"

## Internal Macros

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/UART.v"

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/UART.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/UART.gds"

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
