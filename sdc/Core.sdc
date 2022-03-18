###############################################################################
# Created by write_sdc
# Fri Mar 18 10:12:36 2022
###############################################################################
current_design Core
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clock -period 20.0000 [get_ports {clock}]
set_clock_transition 0.1500 [get_clocks {clock}]
set_clock_uncertainty 0.2500 clock
set_propagated_clock [get_clocks {clock}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[0]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[10]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[11]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[12]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[13]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[14]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[15]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[16]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[17]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[18]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[19]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[1]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[20]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[21]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[22]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[23]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[24]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[25]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[26]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[27]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[28]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[29]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[2]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[30]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[31]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[3]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[4]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[5]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[6]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[7]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[8]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rdata[9]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_valid}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[0]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[10]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[11]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[12]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[13]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[14]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[15]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[16]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[17]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[18]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[19]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[1]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[20]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[21]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[22]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[23]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[24]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[25]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[26]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[27]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[28]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[29]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[2]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[30]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[31]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[3]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[4]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[5]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[6]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[7]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[8]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_inst[9]}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_valid}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_irq_motor_irq}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_irq_spi_irq}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_irq_uart_irq}]
set_input_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {reset}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[10]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[11]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[12]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[13]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[14]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[15]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[16]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[17]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[18]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[19]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[20]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[21]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[22]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[23]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[24]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[25]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[26]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[27]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[28]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[29]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[2]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[30]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[31]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[3]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[4]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[5]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[6]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[7]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[8]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_addr[9]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_ld_type[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_ld_type[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_ld_type[2]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_rd_en}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_st_type[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_st_type[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[10]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[11]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[12]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[13]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[14]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[15]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[16]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[17]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[18]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[19]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[20]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[21]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[22]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[23]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[24]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[25]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[26]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[27]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[28]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[29]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[2]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[30]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[31]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[3]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[4]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[5]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[6]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[7]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[8]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wdata[9]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_dbus_wr_en}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[0]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[10]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[11]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[12]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[13]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[14]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[15]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[16]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[17]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[18]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[19]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[1]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[20]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[21]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[22]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[23]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[24]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[25]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[26]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[27]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[28]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[29]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[2]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[30]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[31]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[3]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[4]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[5]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[6]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[7]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[8]}]
set_output_delay 4.0000 -clock [get_clocks {clock}] -add_delay [get_ports {io_ibus_addr[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {io_dbus_rd_en}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wr_en}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[31]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[30]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[29]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[28]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[27]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[26]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[25]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[24]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[23]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[22]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[21]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[20]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[19]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[18]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[17]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[16]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[15]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[14]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[13]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[12]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[11]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[10]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[9]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[8]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[7]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[6]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[5]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[4]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[3]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[2]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[1]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_addr[0]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_ld_type[2]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_ld_type[1]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_ld_type[0]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_st_type[1]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_st_type[0]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[31]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[30]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[29]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[28]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[27]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[26]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[25]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[24]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[23]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[22]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[21]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[20]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[19]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[18]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[17]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[16]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[15]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[14]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[13]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[12]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[11]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[10]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[9]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[8]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[7]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[6]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[5]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[4]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[3]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[2]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[1]}]
set_load -pin_load 0.0334 [get_ports {io_dbus_wdata[0]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[31]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[30]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[29]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[28]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[27]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[26]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[25]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[24]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[23]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[22]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[21]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[20]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[19]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[18]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[17]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[16]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[15]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[14]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[13]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[12]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[11]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[10]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[9]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[8]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[7]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[6]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[5]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[4]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[3]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[2]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[1]}]
set_load -pin_load 0.0334 [get_ports {io_ibus_addr[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clock}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_valid}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_valid}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_irq_motor_irq}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_irq_spi_irq}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_irq_uart_irq}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[31]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[30]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[29]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[28]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[27]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[26]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[25]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[24]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[23]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[22]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[21]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[20]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_dbus_rdata[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[31]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[30]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[29]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[28]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[27]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[26]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[25]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[24]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[23]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[22]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[21]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[20]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[19]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[18]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[17]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[16]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[15]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[14]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[13]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[12]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[11]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[10]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[9]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[8]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_ibus_inst[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
