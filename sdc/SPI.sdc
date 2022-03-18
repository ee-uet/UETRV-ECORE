###############################################################################
# Created by write_sdc
# Fri Mar 18 12:01:14 2022
###############################################################################
current_design SPI
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clock -period 20.0000 [get_ports {clock}]
set_clock_transition 0.1500 [get_clocks {clock}]
set_clock_uncertainty 0.2500 clock
set_propagated_clock [get_clocks {clock}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_miso}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_select}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[0]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[10]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[11]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[12]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[13]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[14]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[15]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[1]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[2]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[3]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[4]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[5]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[6]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[7]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[8]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_addr[9]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[0]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[10]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[11]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[12]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[13]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[14]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[15]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[16]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[17]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[18]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[19]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[1]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[20]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[21]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[22]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[23]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[24]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[25]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[26]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[27]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[28]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[29]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[2]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[30]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[31]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[3]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[4]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[5]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[6]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[7]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[8]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_data[9]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_stb}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_m2s_we}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {reset}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_clk}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_cs}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_intr}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_spi_mosi}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_ack_o}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[10]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[11]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[12]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[13]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[14]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[15]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[16]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[17]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[18]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[19]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[20]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[21]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[22]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[23]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[24]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[25]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[26]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[27]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[28]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[29]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[2]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[30]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[31]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[3]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[4]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[5]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[6]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[7]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[8]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_wbs_data_o[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {io_spi_clk}]
set_load -pin_load 0.0334 [get_ports {io_spi_cs}]
set_load -pin_load 0.0334 [get_ports {io_spi_intr}]
set_load -pin_load 0.0334 [get_ports {io_spi_mosi}]
set_load -pin_load 0.0334 [get_ports {io_wbs_ack_o}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[31]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[30]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[29]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[28]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[27]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[26]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[25]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[24]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[23]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[22]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[21]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[20]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[19]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[18]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[17]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[16]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[15]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[14]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[13]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[12]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[11]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[10]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[9]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[8]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[7]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[6]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[5]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[4]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[3]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[2]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[1]}]
set_load -pin_load 0.0334 [get_ports {io_wbs_data_o[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clock}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_spi_miso}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_spi_select}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_stb}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_we}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_addr[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[31]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[30]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[29]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[28]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[27]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[26]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[25]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[24]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[23]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[22]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[21]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[20]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_wbs_m2s_data[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
