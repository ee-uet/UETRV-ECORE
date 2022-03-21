# Run configs
set ::env(PDK_ROOT) {/home/ali112000/Desktop/mpw/pdk}
set ::env(BASE_SDC_FILE) {/openlane/scripts/base.sdc}
set ::env(BOTTOM_MARGIN_MULT) {4}
set ::env(CARRY_SELECT_ADDER_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/csa_map.v}
set ::env(CELLS_LEF) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef}
set ::env(CELLS_LEF_OPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef}
set ::env(CELL_CLK_PORT) {CLK}
set ::env(CELL_PAD) {2}
set ::env(CELL_PAD_EXCLUDE) {sky130_fd_sc_hd__tap* sky130_fd_sc_hd__decap* sky130_fd_sc_hd__fill*}
set ::env(CHECK_ASSIGN_STATEMENTS) {0}
set ::env(CHECK_UNMAPPED_CELLS) {1}
set ::env(CLK_BUFFER) {sky130_fd_sc_hd__clkbuf_4}
set ::env(CLK_BUFFER_INPUT) {A}
set ::env(CLK_BUFFER_OUTPUT) {X}
set ::env(CLOCK_BUFFER_FANOUT) {16}
set ::env(CLOCK_NET) {}
set ::env(CLOCK_PERIOD) {20}
set ::env(CLOCK_PORT) {clock}
set ::env(CLOCK_TREE_SYNTH) {1}
set ::env(CLOCK_WIRE_RC_LAYER) {met5}
set ::env(CONFIGS) {/openlane/configuration/lvs.tcl /openlane/configuration/extraction.tcl /openlane/configuration/general.tcl /openlane/configuration/checkers.tcl /openlane/configuration/cts.tcl /openlane/configuration/synthesis.tcl /openlane/configuration/floorplan.tcl /openlane/configuration/routing.tcl /openlane/configuration/placement.tcl}
set ::env(CTS_CLK_BUFFER_LIST) {sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8}
set ::env(CTS_CLK_MAX_WIRE_LENGTH) {0}
set ::env(CTS_DISABLE_POST_PROCESSING) {0}
set ::env(CTS_MAX_CAP) {1.53169}
set ::env(CTS_REPORT_TIMING) {1}
set ::env(CTS_ROOT_BUFFER) {sky130_fd_sc_hd__clkbuf_16}
set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) {50}
set ::env(CTS_SINK_CLUSTERING_SIZE) {25}
set ::env(CTS_SQR_CAP) {0.258e-3}
set ::env(CTS_SQR_RES) {0.125}
set ::env(CTS_TARGET_SKEW) {200}
set ::env(CTS_TECH_DIR) {N/A}
set ::env(CTS_TOLERANCE) {100}
set ::env(DATA_WIRE_RC_LAYER) {met2}
set ::env(DECAP_CELL) {sky130_fd_sc_hd__decap_}
set ::env(DEFAULT_MAX_TRAN) {0.75}
set ::env(DEF_UNITS_PER_MICRON) {1000}
set ::env(DESIGN_CONFIG) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/config.tcl}
set ::env(DESIGN_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core}
set ::env(DESIGN_IS_CORE) {0}
set ::env(DESIGN_NAME) {Core}
set ::env(DETAILED_ROUTER) {tritonroute}
set ::env(DIE_AREA) {0 0 500 500}
set ::env(DIODE_CELL) {sky130_fd_sc_hd__diode_2}
set ::env(DIODE_CELL_PIN) {DIODE}
set ::env(DIODE_INSERTION_STRATEGY) {4}
set ::env(DIODE_PADDING) {2}
set ::env(DRC_EXCLUDE_CELL_LIST) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/drc_exclude.cells}
set ::env(DRC_EXCLUDE_CELL_LIST_OPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/drc_exclude.cells}
set ::env(DRT_OPT_ITERS) {64}
set ::env(ECO_ENABLE) {0}
set ::env(ECO_FINISH) {0}
set ::env(ECO_ITER) {0}
set ::env(ECO_SKIP_PIN) {1}
set ::env(ECO_STARTED) {0}
set ::env(FAKEDIODE_CELL) {sky130_ef_sc_hd__fakediode_2}
set ::env(FILL_CELL) {sky130_fd_sc_hd__fill_}
set ::env(FILL_INSERTION) {1}
set ::env(FP_ASPECT_RATIO) {1}
set ::env(FP_CORE_MARGIN) {0}
set ::env(FP_CORE_UTIL) {50}
set ::env(FP_ENDCAP_CELL) {sky130_fd_sc_hd__decap_3}
set ::env(FP_IO_HEXTEND) {-1}
set ::env(FP_IO_HLAYER) {met3}
set ::env(FP_IO_HLENGTH) {4}
set ::env(FP_IO_HTHICKNESS_MULT) {2}
set ::env(FP_IO_MIN_DISTANCE) {3}
set ::env(FP_IO_MODE) {1}
set ::env(FP_IO_VEXTEND) {-1}
set ::env(FP_IO_VLAYER) {met2}
set ::env(FP_IO_VLENGTH) {4}
set ::env(FP_IO_VTHICKNESS_MULT) {2}
set ::env(FP_PDN_AUTO_ADJUST) {1}
set ::env(FP_PDN_CHECK_NODES) {1}
set ::env(FP_PDN_CORE_RING) {0}
set ::env(FP_PDN_CORE_RING_HOFFSET) {6}
set ::env(FP_PDN_CORE_RING_HSPACING) {1.7}
set ::env(FP_PDN_CORE_RING_HWIDTH) {1.6}
set ::env(FP_PDN_CORE_RING_VOFFSET) {6}
set ::env(FP_PDN_CORE_RING_VSPACING) {1.7}
set ::env(FP_PDN_CORE_RING_VWIDTH) {1.6}
set ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) {1}
set ::env(FP_PDN_ENABLE_MACROS_GRID) {1}
set ::env(FP_PDN_ENABLE_RAILS) {1}
set ::env(FP_PDN_HOFFSET) {16.65}
set ::env(FP_PDN_HORIZONTAL_HALO) {10}
set ::env(FP_PDN_HPITCH) {153.18}
set ::env(FP_PDN_HSPACING) {1.7}
set ::env(FP_PDN_HWIDTH) {1.6}
set ::env(FP_PDN_IRDROP) {1}
set ::env(FP_PDN_LOWER_LAYER) {met4}
set ::env(FP_PDN_RAILS_LAYER) {met1}
set ::env(FP_PDN_RAIL_OFFSET) {0}
set ::env(FP_PDN_RAIL_WIDTH) {0.48}
set ::env(FP_PDN_UPPER_LAYER) {met5}
set ::env(FP_PDN_VERTICAL_HALO) {10}
set ::env(FP_PDN_VOFFSET) {16.32}
set ::env(FP_PDN_VPITCH) {153.6}
set ::env(FP_PDN_VSPACING) {1.7}
set ::env(FP_PDN_VWIDTH) {1.6}
set ::env(FP_PIN_ORDER_CFG) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/pin_order.cfg}
set ::env(FP_SIZING) {absolute}
set ::env(FP_TAPCELL_DIST) {13}
set ::env(FP_TAP_HORIZONTAL_HALO) {10}
set ::env(FP_TAP_VERTICAL_HALO) {10}
set ::env(FP_WELLTAP_CELL) {sky130_fd_sc_hd__tapvpwrvgnd_1}
set ::env(FULL_ADDER_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/fa_map.v}
set ::env(GDS_FILES) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds}
set ::env(GDS_FILES_OPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds}
set ::env(GENERATE_FINAL_SUMMARY_REPORT) {1}
set ::env(GLB_CFG_FILE) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/config.tcl}
set ::env(GLB_OPTIMIZE_MIRRORING) {1}
set ::env(GLB_RESIZER_ALLOW_SETUP_VIOS) {0}
set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) {50}
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) {0.1}
set ::env(GLB_RESIZER_SETUP_MAX_BUFFER_PERCENT) {50}
set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) {0.05}
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) {0}
set ::env(GLB_RT_ADJUSTMENT) {0.3}
set ::env(GLB_RT_ALLOW_CONGESTION) {0}
set ::env(GLB_RT_ANT_ITERS) {3}
set ::env(GLB_RT_ESTIMATE_PARASITICS) {1}
set ::env(GLB_RT_LAYER_ADJUSTMENTS) {0.99,0,0,0,0,0}
set ::env(GLB_RT_MACRO_EXTENSION) {0}
set ::env(GLB_RT_MAX_DIODE_INS_ITERS) {1}
set ::env(GLB_RT_OVERFLOW_ITERS) {50}
set ::env(GLOBAL_ROUTER) {fastroute}
set ::env(GND_NETS) {vssd1}
set ::env(GND_PIN) {VGND}
set ::env(GPIO_PADS_LEF) { /home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_io/lef/sky130_ef_io.lef }
set ::env(GPIO_PADS_LEF_CORE_SIDE) { /home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/custom_cells/lef/sky130_fd_io_core.lef /home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/custom_cells/lef/sky130_ef_io_core.lef }
set ::env(GPIO_PADS_VERILOG) { /home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_io/verilog/sky130_ef_io.v /home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_io/verilog/sky130_ef_io__gpiov2_pad_wrapped.v }
set ::env(IO_PCT) {0.2}
set ::env(KLAYOUT_DRC_KLAYOUT_GDS) {0}
set ::env(KLAYOUT_DRC_TECH_SCRIPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/klayout/sky130A_mr.drc}
set ::env(KLAYOUT_PROPERTIES) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/klayout/sky130A.lyp}
set ::env(KLAYOUT_TECH) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/klayout/sky130A.lyt}
set ::env(KLAYOUT_XOR_GDS) {1}
set ::env(KLAYOUT_XOR_XML) {1}
set ::env(LAYERS_RC) { li1 1.499e-04 7.176e-02, met1 1.449e-04 8.929e-04, met2 1.331e-04 8.929e-04, met3 1.464e-04 1.567e-04, met4 1.297e-04 1.567e-04, met5 1.501e-04 1.781e-05}
set ::env(LEC_ENABLE) {0}
set ::env(LEFT_MARGIN_MULT) {12}
set ::env(LIB_FASTEST) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95.lib}
set ::env(LIB_SLOWEST) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib}
set ::env(LIB_SLOWEST_OPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib}
set ::env(LIB_SYNTH) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib}
set ::env(LIB_TYPICAL) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib}
set ::env(LOGS_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs}
set ::env(LVS_CONNECT_BY_LABEL) {0}
set ::env(LVS_INSERT_POWER_PINS) {1}
set ::env(MACRO_BLOCKAGES_LAYER) {li1 met1 met2 met3 met4}
set ::env(MAGIC_CONVERT_DRC_TO_RDB) {1}
set ::env(MAGIC_DISABLE_HIER_GDS) {1}
set ::env(MAGIC_DRC_USE_GDS) {1}
set ::env(MAGIC_EXT_USE_GDS) {0}
set ::env(MAGIC_GENERATE_GDS) {1}
set ::env(MAGIC_GENERATE_LEF) {1}
set ::env(MAGIC_GENERATE_MAGLEF) {1}
set ::env(MAGIC_INCLUDE_GDS_POINTERS) {0}
set ::env(MAGIC_MAGICRC) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/magic/sky130A.magicrc}
set ::env(MAGIC_PAD) {0}
set ::env(MAGIC_TECH_FILE) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/magic/sky130A.tech}
set ::env(MAGIC_WRITE_FULL_LEF) {0}
set ::env(MAGIC_ZEROIZE_ORIGIN) {0}
set ::env(NETGEN_SETUP_FILE) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl}
set ::env(NO_SYNTH_CELL_LIST) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/no_synth.cells}
set ::env(PDK) {sky130A}
set ::env(PDKPATH) {/home/ali112000/Desktop/mpw/pdk/sky130A}
set ::env(PDN_CFG) {/openlane/scripts/openroad/pdn_cfg.tcl}
set ::env(PLACE_SITE) {unithd}
set ::env(PLACE_SITE_HEIGHT) {2.720}
set ::env(PLACE_SITE_WIDTH) {0.460}
set ::env(PL_BASIC_PLACEMENT) {0}
set ::env(PL_ESTIMATE_PARASITICS) {1}
set ::env(PL_LIB) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib}
set ::env(PL_MACRO_CHANNEL) {0 0}
set ::env(PL_MACRO_HALO) {0 0}
set ::env(PL_MAX_DISPLACEMENT_X) {500}
set ::env(PL_MAX_DISPLACEMENT_Y) {100}
set ::env(PL_OPTIMIZE_MIRRORING) {1}
set ::env(PL_RANDOM_GLB_PLACEMENT) {0}
set ::env(PL_RANDOM_INITIAL_PLACEMENT) {0}
set ::env(PL_RESIZER_ALLOW_SETUP_VIOS) {0}
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) {1}
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) {1}
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) {1}
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) {50}
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) {0.1}
set ::env(PL_RESIZER_MAX_CAP_MARGIN) {20}
set ::env(PL_RESIZER_MAX_SLEW_MARGIN) {20}
set ::env(PL_RESIZER_MAX_WIRE_LENGTH) {0}
set ::env(PL_RESIZER_REPAIR_TIE_FANOUT) {1}
set ::env(PL_RESIZER_SETUP_MAX_BUFFER_PERCENT) {50}
set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) {0.05}
set ::env(PL_RESIZER_TIE_SEPERATION) {0}
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) {1}
set ::env(PL_ROUTABILITY_DRIVEN) {0}
set ::env(PL_SKIP_INITIAL_PLACEMENT) {0}
set ::env(PL_TARGET_DENSITY) {0.5}
set ::env(PL_TIME_DRIVEN) {0}
set ::env(PRIMARY_SIGNOFF_TOOL) {magic}
set ::env(PROCESS) {130}
set ::env(QUIT_ON_HOLD_VIOLATIONS) {1}
set ::env(QUIT_ON_ILLEGAL_OVERLAPS) {1}
set ::env(QUIT_ON_LVS_ERROR) {1}
set ::env(QUIT_ON_MAGIC_DRC) {1}
set ::env(QUIT_ON_SETUP_VIOLATIONS) {1}
set ::env(QUIT_ON_TIMING_VIOLATIONS) {1}
set ::env(QUIT_ON_TR_DRC) {1}
set ::env(RCX_CC_MODEL) {10}
set ::env(RCX_CONTEXT_DEPTH) {5}
set ::env(RCX_CORNER_COUNT) {1}
set ::env(RCX_COUPLING_THRESHOLD) {0.1}
set ::env(RCX_MAX_RESISTANCE) {50}
set ::env(RCX_MERGE_VIA_WIRE_RES) {1}
set ::env(RCX_RULES) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/rcx_rules.info}
set ::env(REPORTS_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports}
set ::env(RESULTS_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results}
set ::env(RE_BUFFER_CELL) {sky130_fd_sc_hd__buf_4}
set ::env(RIGHT_MARGIN_MULT) {12}
set ::env(RIPPLE_CARRY_ADDER_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/rca_map.v}
set ::env(ROOT_CLK_BUFFER) {sky130_fd_sc_hd__clkbuf_16}
set ::env(ROUTING_CORES) {2}
set ::env(RT_MAX_LAYER) {met4}
set ::env(RT_MIN_LAYER) {met1}
set ::env(RUN_CVC) {1}
set ::env(RUN_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core}
set ::env(RUN_KLAYOUT) {1}
set ::env(RUN_KLAYOUT_DRC) {0}
set ::env(RUN_KLAYOUT_XOR) {1}
set ::env(RUN_LVS) {1}
set ::env(RUN_MAGIC) {1}
set ::env(RUN_MAGIC_DRC) {1}
set ::env(RUN_ROUTING_DETAILED) {1}
set ::env(RUN_SIMPLE_CTS) {0}
set ::env(RUN_SPEF_EXTRACTION) {1}
set ::env(RUN_TAG) {Core}
set ::env(SAVE_FINAL_VIEWS) {1}
set ::env(SPEF_EDGE_CAP_FACTOR) {1}
set ::env(SPEF_EXTRACTOR) {openrcx}
set ::env(SPEF_WIRE_MODEL) {L}
set ::env(STA_REPORT_POWER) {1}
set ::env(STD_CELL_GROUND_PINS) {VGND VNB}
set ::env(STD_CELL_LIBRARY) {sky130_fd_sc_hd}
set ::env(STD_CELL_LIBRARY_CDL) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/cdl/sky130_fd_sc_hd.cdl}
set ::env(STD_CELL_LIBRARY_OPT) {sky130_fd_sc_hd}
set ::env(STD_CELL_LIBRARY_OPT_CDL) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/cdl/sky130_fd_sc_hd.cdl}
set ::env(STD_CELL_POWER_PINS) {VPWR VPB}
set ::env(SYNTH_ADDER_TYPE) {YOSYS}
set ::env(SYNTH_BIN) {yosys}
set ::env(SYNTH_BUFFERING) {1}
set ::env(SYNTH_CAP_LOAD) {33.442}
set ::env(SYNTH_CLOCK_TRANSITION) {0.15}
set ::env(SYNTH_CLOCK_UNCERTAINITY) {0.25}
set ::env(SYNTH_DRIVING_CELL) {sky130_fd_sc_hd__inv_2}
set ::env(SYNTH_DRIVING_CELL_PIN) {Y}
set ::env(SYNTH_FLAT_TOP) {0}
set ::env(SYNTH_LATCH_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/latch_map.v}
set ::env(SYNTH_MAX_FANOUT) {5}
set ::env(SYNTH_MIN_BUF_PORT) {sky130_fd_sc_hd__buf_2 A X}
set ::env(SYNTH_MUX4_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/mux4_map.v}
set ::env(SYNTH_MUX_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/mux2_map.v}
set ::env(SYNTH_NO_FLAT) {0}
set ::env(SYNTH_READ_BLACKBOX_LIB) {0}
set ::env(SYNTH_SCRIPT) {/openlane/scripts/yosys/synth.tcl}
set ::env(SYNTH_SHARE_RESOURCES) {1}
set ::env(SYNTH_SIZING) {0}
set ::env(SYNTH_STRATEGY) {AREA 0}
set ::env(SYNTH_TIEHI_PORT) {sky130_fd_sc_hd__conb_1 HI}
set ::env(SYNTH_TIELO_PORT) {sky130_fd_sc_hd__conb_1 LO}
set ::env(SYNTH_TIMING_DERATE) {0.05}
set ::env(SYNTH_TOP_LEVEL) {0}
set ::env(TAKE_LAYOUT_SCROT) {0}
set ::env(TAP_DECAP_INSERTION) {1}
set ::env(TECH_LEF) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef}
set ::env(TECH_LEF_OPT) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef}
set ::env(TERMINAL_OUTPUT) {>&@stdout}
set ::env(TMP_DIR) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp}
set ::env(TOP_MARGIN_MULT) {4}
set ::env(TRACKS_INFO_FILE) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/tracks.info}
set ::env(TRISTATE_BUFFER_MAP) {/home/ali112000/Desktop/mpw/pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/tribuff_map.v}
set ::env(USE_ARC_ANTENNA_CHECK) {1}
set ::env(USE_GPIO_PADS) {0}
set ::env(VDD_NETS) {vccd1}
set ::env(VDD_PIN) {VPWR}
set ::env(VERILOG_FILES) { /home/ali112000/mpw5/UETRV-ECORE/caravel/verilog/rtl/defines.v  /home/ali112000/mpw5/UETRV-ECORE/openlane/Core/../../verilog/rtl/Core.v}
set ::env(VIAS_RC) { mcon 9.249146E-3, via 4.5E-3, via2 3.368786E-3, via3 0.376635E-3, via4 0.00580E-3}
set ::env(WIDEN_SITE) {1}
set ::env(WIDEN_SITE_IS_FACTOR) {1}
set ::env(WIRE_RC_LAYER) {met1}
set ::env(YOSYS_REWRITE_VERILOG) {0}
set ::env(cts_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/cts}
set ::env(cts_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/cts}
set ::env(cts_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/cts}
set ::env(cts_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/cts}
set ::env(datetime) {2022.03.21_19.23.31}
set ::env(eco_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/eco}
set ::env(eco_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/eco}
set ::env(eco_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/eco}
set ::env(eco_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/eco}
set ::env(finishing_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/finishing}
set ::env(finishing_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/finishing}
set ::env(finishing_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/finishing}
set ::env(finishing_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/finishing}
set ::env(floorplan_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/floorplan}
set ::env(floorplan_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/floorplan}
set ::env(floorplan_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/floorplan}
set ::env(floorplan_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/floorplan}
set ::env(placement_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/placement}
set ::env(placement_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/placement}
set ::env(placement_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/placement}
set ::env(placement_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/placement}
set ::env(routing_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/routing}
set ::env(routing_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/routing}
set ::env(routing_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/routing}
set ::env(routing_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/routing}
set ::env(synthesis_logs) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/logs/synthesis}
set ::env(synthesis_reports) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/reports/synthesis}
set ::env(synthesis_results) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/results/synthesis}
set ::env(synthesis_tmpfiles) {/home/ali112000/mpw5/UETRV-ECORE/openlane/Core/runs/Core/tmp/synthesis}
set ::env(SYNTH_MAX_TRAN) {0.75}
set ::env(CURRENT_DEF) {0}
set ::env(CURRENT_GUIDE) {0}
set ::env(CURRENT_INDEX) 1
set ::env(CURRENT_NETLIST) {0}
set ::env(PREV_NETLIST) {0}
