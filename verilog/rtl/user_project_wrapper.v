// SPDX-FileCopyrightText: 2022 EE, UET Lahore
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
// SPDX-FileContributor: Created by Muhammad Tahir <mtahir@uet.edu.pk>

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
  wire clock, reset, io_uart_tx, io_uart_rx, io_spi_clk, io_spi_cs;
  wire io_spi_mosi, io_spi_miso, io_qei_ch_a, io_qei_ch_b, io_pwm_high, io_pwm_low;
  wire  core_clock; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_reset; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_irq_uart_irq; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_irq_spi_irq; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_irq_motor_irq; // @[processor_tile.scala 60:32:@12767.4]
  wire [31:0] core_io_ibus_addr; // @[processor_tile.scala 60:32:@12767.4]
  wire [31:0] core_io_ibus_inst; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_ibus_valid; // @[processor_tile.scala 60:32:@12767.4]
  wire [31:0] core_io_dbus_addr; // @[processor_tile.scala 60:32:@12767.4]
  wire [31:0] core_io_dbus_wdata; // @[processor_tile.scala 60:32:@12767.4]
  wire [31:0] core_io_dbus_rdata; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_dbus_rd_en; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_dbus_wr_en; // @[processor_tile.scala 60:32:@12767.4]
  wire [1:0] core_io_dbus_st_type; // @[processor_tile.scala 60:32:@12767.4]
  wire [2:0] core_io_dbus_ld_type; // @[processor_tile.scala 60:32:@12767.4]
  wire  core_io_dbus_valid; // @[processor_tile.scala 60:32:@12767.4]
  wire  wb_inter_connect_clock; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_reset; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_dbus_addr; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_dbus_wdata; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_dbus_rd_en; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_dbus_wr_en; // @[processor_tile.scala 61:32:@12770.4]
  wire [1:0] wb_inter_connect_io_dbus_st_type; // @[processor_tile.scala 61:32:@12770.4]
  wire [2:0] wb_inter_connect_io_dbus_ld_type; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_ibus_addr; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 61:32:@12770.4]
  wire [8:0] wb_inter_connect_io_imem_io_addr; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_imem_io_rdata; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_imem_io_wdata; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_imem_io_wr_en; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_imem_io_cs; // @[processor_tile.scala 61:32:@12770.4]
  wire [3:0] wb_inter_connect_io_imem_io_st_type; // @[processor_tile.scala 61:32:@12770.4]
  wire [7:0] wb_inter_connect_io_dmem_io_addr; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_dmem_io_wdata; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_dmem_io_rdata; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_dmem_io_cs; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_dmem_io_wr_en; // @[processor_tile.scala 61:32:@12770.4]
  wire [3:0] wb_inter_connect_io_dmem_io_st_type; // @[processor_tile.scala 61:32:@12770.4]
  wire [15:0] wb_inter_connect_io_wbm_m2s_addr; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_wbm_m2s_data; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_wbm_m2s_we; // @[processor_tile.scala 61:32:@12770.4]
  wire [3:0] wb_inter_connect_io_wbm_m2s_sel; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_wbm_m2s_stb; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_uart_tx; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_uart_txen; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_uart_rx; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_uart_irq; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_cs; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_clk; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_miso; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_irq; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_cs_en; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_clk_en; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_spi_mosi_en; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_motor_ack_i; // @[processor_tile.scala 61:32:@12770.4]
  wire [31:0] wb_inter_connect_io_motor_data_i; // @[processor_tile.scala 61:32:@12770.4]
  wire  wb_inter_connect_io_motor_addr_sel; // @[processor_tile.scala 61:32:@12770.4]
  wire  motor_clock; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_reset; // @[processor_tile.scala 63:32:@12773.4]
  wire [15:0] motor_io_wbs_m2s_addr; // @[processor_tile.scala 63:32:@12773.4]
  wire [31:0] motor_io_wbs_m2s_data; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_wbs_m2s_we; // @[processor_tile.scala 63:32:@12773.4]
  wire [3:0] motor_io_wbs_m2s_sel; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_wbs_m2s_stb; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_wbs_ack_o; // @[processor_tile.scala 63:32:@12773.4]
  wire [31:0] motor_io_wbs_data_o; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_ba_match; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_motor_irq; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_qei_ch_a; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_qei_ch_b; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_pwm_high; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_pwm_low; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_pwm_high_en; // @[processor_tile.scala 63:32:@12773.4]
  wire  motor_io_pwm_low_en; // @[processor_tile.scala 63:32:@12773.4]
  wire  imem_clock; // @[processor_tile.scala 64:32:@12776.4]
  wire [8:0] imem_io_addr; // @[processor_tile.scala 64:32:@12776.4]
  wire [31:0] imem_io_rdata; // @[processor_tile.scala 64:32:@12776.4]
  wire [31:0] imem_io_wdata; // @[processor_tile.scala 64:32:@12776.4]
  wire  imem_io_wr_en; // @[processor_tile.scala 64:32:@12776.4]
  wire  imem_io_cs; // @[processor_tile.scala 64:32:@12776.4]
  wire [3:0] imem_io_st_type; // @[processor_tile.scala 64:32:@12776.4]
  wire  dmem_clock; // @[processor_tile.scala 65:32:@12779.4]
  wire [7:0] dmem_io_addr; // @[processor_tile.scala 65:32:@12779.4]
  wire [31:0] dmem_io_wdata; // @[processor_tile.scala 65:32:@12779.4]
  wire [31:0] dmem_io_rdata; // @[processor_tile.scala 65:32:@12779.4]
  wire  dmem_io_cs; // @[processor_tile.scala 65:32:@12779.4]
  wire  dmem_io_wr_en; // @[processor_tile.scala 65:32:@12779.4]
  wire [3:0] dmem_io_st_type; // @[processor_tile.scala 65:32:@12779.4]
  Core core ( // @[processor_tile.scala 60:32:@12767.4]
    .clock(core_clock),
    .reset(core_reset),
    .io_irq_uart_irq(core_io_irq_uart_irq),
    .io_irq_spi_irq(core_io_irq_spi_irq),
    .io_irq_motor_irq(core_io_irq_motor_irq),
    .io_ibus_addr(core_io_ibus_addr),
    .io_ibus_inst(core_io_ibus_inst),
    .io_ibus_valid(core_io_ibus_valid),
    .io_dbus_addr(core_io_dbus_addr),
    .io_dbus_wdata(core_io_dbus_wdata),
    .io_dbus_rdata(core_io_dbus_rdata),
    .io_dbus_rd_en(core_io_dbus_rd_en),
    .io_dbus_wr_en(core_io_dbus_wr_en),
    .io_dbus_st_type(core_io_dbus_st_type),
    .io_dbus_ld_type(core_io_dbus_ld_type),
    .io_dbus_valid(core_io_dbus_valid)
  );
  WB_InterConnect wb_inter_connect ( // @[processor_tile.scala 61:32:@12770.4]
    .clock(wb_inter_connect_clock),
    .reset(wb_inter_connect_reset),
    .io_dbus_addr(wb_inter_connect_io_dbus_addr),
    .io_dbus_wdata(wb_inter_connect_io_dbus_wdata),
    .io_dbus_rdata(wb_inter_connect_io_dbus_rdata),
    .io_dbus_rd_en(wb_inter_connect_io_dbus_rd_en),
    .io_dbus_wr_en(wb_inter_connect_io_dbus_wr_en),
    .io_dbus_st_type(wb_inter_connect_io_dbus_st_type),
    .io_dbus_ld_type(wb_inter_connect_io_dbus_ld_type),
    .io_dbus_valid(wb_inter_connect_io_dbus_valid),
    .io_ibus_addr(wb_inter_connect_io_ibus_addr),
    .io_ibus_inst(wb_inter_connect_io_ibus_inst),
    .io_ibus_valid(wb_inter_connect_io_ibus_valid),
    .io_imem_io_addr(wb_inter_connect_io_imem_io_addr),
    .io_imem_io_rdata(wb_inter_connect_io_imem_io_rdata),
    .io_imem_io_wdata(wb_inter_connect_io_imem_io_wdata),
    .io_imem_io_wr_en(wb_inter_connect_io_imem_io_wr_en),
    .io_imem_io_cs(wb_inter_connect_io_imem_io_cs),
    .io_imem_io_st_type(wb_inter_connect_io_imem_io_st_type),
    .io_dmem_io_addr(wb_inter_connect_io_dmem_io_addr),
    .io_dmem_io_wdata(wb_inter_connect_io_dmem_io_wdata),
    .io_dmem_io_rdata(wb_inter_connect_io_dmem_io_rdata),
    .io_dmem_io_cs(wb_inter_connect_io_dmem_io_cs),
    .io_dmem_io_wr_en(wb_inter_connect_io_dmem_io_wr_en),
    .io_dmem_io_st_type(wb_inter_connect_io_dmem_io_st_type),
    .io_wbm_m2s_addr(wb_inter_connect_io_wbm_m2s_addr),
    .io_wbm_m2s_data(wb_inter_connect_io_wbm_m2s_data),
    .io_wbm_m2s_we(wb_inter_connect_io_wbm_m2s_we),
    .io_wbm_m2s_sel(wb_inter_connect_io_wbm_m2s_sel),
    .io_wbm_m2s_stb(wb_inter_connect_io_wbm_m2s_stb),
    .io_uart_tx(wb_inter_connect_io_uart_tx),
    .io_uart_txen(wb_inter_connect_io_uart_txen),
    .io_uart_rx(wb_inter_connect_io_uart_rx),
    .io_uart_irq(wb_inter_connect_io_uart_irq),
    .io_spi_cs(wb_inter_connect_io_spi_cs),
    .io_spi_clk(wb_inter_connect_io_spi_clk),
    .io_spi_mosi(wb_inter_connect_io_spi_mosi),
    .io_spi_miso(wb_inter_connect_io_spi_miso),
    .io_spi_irq(wb_inter_connect_io_spi_irq),
    .io_spi_cs_en(wb_inter_connect_io_spi_cs_en),
    .io_spi_clk_en(wb_inter_connect_io_spi_clk_en),
    .io_spi_mosi_en(wb_inter_connect_io_spi_mosi_en),
    .io_motor_ack_i(wb_inter_connect_io_motor_ack_i),
    .io_motor_data_i(wb_inter_connect_io_motor_data_i),
    .io_motor_addr_sel(wb_inter_connect_io_motor_addr_sel)
  );
  Motor_Top motor ( // @[processor_tile.scala 63:32:@12773.4]
    .clock(motor_clock),
    .reset(motor_reset),
    .io_wbs_m2s_addr(motor_io_wbs_m2s_addr),
    .io_wbs_m2s_data(motor_io_wbs_m2s_data),
    .io_wbs_m2s_we(motor_io_wbs_m2s_we),
    .io_wbs_m2s_sel(motor_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(motor_io_wbs_m2s_stb),
    .io_wbs_ack_o(motor_io_wbs_ack_o),
    .io_wbs_data_o(motor_io_wbs_data_o),
    .io_ba_match(motor_io_ba_match),
    .io_motor_irq(motor_io_motor_irq),
    .io_qei_ch_a(motor_io_qei_ch_a),
    .io_qei_ch_b(motor_io_qei_ch_b),
    .io_pwm_high(motor_io_pwm_high),
    .io_pwm_low(motor_io_pwm_low),
    .io_pwm_high_en(motor_io_pwm_high_en),
    .io_pwm_low_en(motor_io_pwm_low_en)
  );
  sky130_sram_1kbyte_1rw1r_32x256_8 dmem (
  `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1),
  `endif
  // Port 0: RW
  .clk0(dmem_clock),
  .csb0(dmem_io_cs),
  .web0(dmem_io_wr_en),
  .wmask0(dmem_io_st_type),
  .addr0(dmem_io_addr),
  .din0(dmem_io_wdata),
  .dout0(dmem_io_rdata)
  ); 

   sky130_sram_1kbyte_1rw1r_32x256_8 imem (
  `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1),
  `endif
  // Port 0: RW
  .clk0(imem_clock),
  .csb0(imem_io_cs),
  .web0(imem_io_wr_en),
  .wmask0(dmem_io_st_type),
  .addr0(imem_io_addr),
  .din0(imem_io_wdata),
  .dout0(imem_io_rdata)
  ); 

  assign io_uart_tx = wb_inter_connect_io_uart_tx; // @[processor_tile.scala 77:32:@12811.4]
  assign io_uart_txen = wb_inter_connect_io_uart_txen; // @[processor_tile.scala 78:32:@12812.4]
  assign io_spi_cs = wb_inter_connect_io_spi_cs; // @[processor_tile.scala 83:32:@12815.4]
  assign io_spi_clk = wb_inter_connect_io_spi_clk; // @[processor_tile.scala 84:32:@12816.4]
  assign io_spi_mosi = wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 85:32:@12817.4]
  assign io_spi_cs_en = wb_inter_connect_io_spi_cs_en; // @[processor_tile.scala 89:32:@12820.4]
  assign io_spi_clk_en = wb_inter_connect_io_spi_clk_en; // @[processor_tile.scala 90:32:@12821.4]
  assign io_spi_mosi_en = wb_inter_connect_io_spi_mosi_en; // @[processor_tile.scala 91:32:@12822.4]
  assign io_pwm_high = motor_io_pwm_high; // @[processor_tile.scala 108:25:@12834.4]
  assign io_pwm_low = motor_io_pwm_low; // @[processor_tile.scala 109:25:@12835.4]
  assign io_pwm_high_en = motor_io_pwm_high_en; // @[processor_tile.scala 112:25:@12837.4]
  assign io_pwm_low_en = motor_io_pwm_low_en; // @[processor_tile.scala 113:25:@12838.4]
  assign core_clock = clock; // @[:@12768.4]
  assign core_reset = reset; // @[:@12769.4]
  assign core_io_irq_uart_irq = wb_inter_connect_io_uart_irq; // @[processor_tile.scala 80:32:@12814.4]
  assign core_io_irq_spi_irq = wb_inter_connect_io_spi_irq; // @[processor_tile.scala 87:32:@12819.4]
  assign core_io_irq_motor_irq = motor_io_motor_irq; // @[processor_tile.scala 110:25:@12836.4]
  assign core_io_ibus_inst = wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 73:24:@12801.4]
  assign core_io_ibus_valid = wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 73:24:@12800.4]
  assign core_io_dbus_rdata = wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 74:24:@12808.4]
  assign core_io_dbus_valid = wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 74:24:@12803.4]
  assign wb_inter_connect_clock = clock; // @[:@12771.4]
  assign wb_inter_connect_reset = reset; // @[:@12772.4]
  assign wb_inter_connect_io_dbus_addr = core_io_dbus_addr; // @[processor_tile.scala 74:24:@12810.4]
  assign wb_inter_connect_io_dbus_wdata = core_io_dbus_wdata; // @[processor_tile.scala 74:24:@12809.4]
  assign wb_inter_connect_io_dbus_rd_en = core_io_dbus_rd_en; // @[processor_tile.scala 74:24:@12807.4]
  assign wb_inter_connect_io_dbus_wr_en = core_io_dbus_wr_en; // @[processor_tile.scala 74:24:@12806.4]
  assign wb_inter_connect_io_dbus_st_type = core_io_dbus_st_type; // @[processor_tile.scala 74:24:@12805.4]
  assign wb_inter_connect_io_dbus_ld_type = core_io_dbus_ld_type; // @[processor_tile.scala 74:24:@12804.4]
  assign wb_inter_connect_io_ibus_addr = core_io_ibus_addr; // @[processor_tile.scala 73:24:@12802.4]
  assign wb_inter_connect_io_imem_io_rdata = imem_io_rdata; // @[processor_tile.scala 68:11:@12789.4]
  assign wb_inter_connect_io_dmem_io_rdata = dmem_io_rdata; // @[processor_tile.scala 69:11:@12797.4]
  assign wb_inter_connect_io_uart_rx = io_uart_rx; // @[processor_tile.scala 79:32:@12813.4]
  assign wb_inter_connect_io_spi_miso = io_spi_miso; // @[processor_tile.scala 86:32:@12818.4]
  assign wb_inter_connect_io_motor_ack_i = motor_io_wbs_ack_o; // @[processor_tile.scala 103:35:@12830.4]
  assign wb_inter_connect_io_motor_data_i = motor_io_wbs_data_o; // @[processor_tile.scala 102:36:@12829.4]
  assign motor_clock = clock; // @[:@12774.4]
  assign motor_reset = reset; // @[:@12775.4]
  assign motor_io_wbs_m2s_addr = wb_inter_connect_io_wbm_m2s_addr; // @[processor_tile.scala 101:28:@12828.4]
  assign motor_io_wbs_m2s_data = wb_inter_connect_io_wbm_m2s_data; // @[processor_tile.scala 101:28:@12827.4]
  assign motor_io_wbs_m2s_we = wb_inter_connect_io_wbm_m2s_we; // @[processor_tile.scala 101:28:@12826.4]
  assign motor_io_wbs_m2s_sel = wb_inter_connect_io_wbm_m2s_sel; // @[processor_tile.scala 101:28:@12825.4]
  assign motor_io_wbs_m2s_stb = wb_inter_connect_io_wbm_m2s_stb; // @[processor_tile.scala 101:28:@12824.4]
  assign motor_io_ba_match = wb_inter_connect_io_motor_addr_sel; // @[processor_tile.scala 105:25:@12831.4]
  assign motor_io_qei_ch_a = io_qei_ch_a; // @[processor_tile.scala 106:25:@12832.4]
  assign motor_io_qei_ch_b = io_qei_ch_b; // @[processor_tile.scala 107:25:@12833.4]
  assign imem_clock = clock; // @[:@12777.4]
  assign imem_io_addr = wb_inter_connect_io_imem_io_addr; // @[processor_tile.scala 68:11:@12790.4]
  assign imem_io_wdata = wb_inter_connect_io_imem_io_wdata; // @[processor_tile.scala 68:11:@12788.4]
  assign imem_io_wr_en = wb_inter_connect_io_imem_io_wr_en; // @[processor_tile.scala 68:11:@12787.4]
  assign imem_io_cs = wb_inter_connect_io_imem_io_cs; // @[processor_tile.scala 68:11:@12786.4]
  assign imem_io_st_type = wb_inter_connect_io_imem_io_st_type; // @[processor_tile.scala 68:11:@12785.4]
  assign dmem_clock = clock; // @[:@12780.4]
  assign dmem_io_addr = wb_inter_connect_io_dmem_io_addr; // @[processor_tile.scala 69:11:@12799.4]
  assign dmem_io_wdata = wb_inter_connect_io_dmem_io_wdata; // @[processor_tile.scala 69:11:@12798.4]
  assign dmem_io_cs = wb_inter_connect_io_dmem_io_cs; // @[processor_tile.scala 69:11:@12796.4]
  assign dmem_io_wr_en = wb_inter_connect_io_dmem_io_wr_en; // @[processor_tile.scala 69:11:@12795.4]
  assign dmem_io_st_type = wb_inter_connect_io_dmem_io_st_type; // @[processor_tile.scala 69:11:@12794.4]
  assign  clock = wb_clk_i; 
  assign  reset = wb_rst_i;
  assign  io_out[0] =  io_uart_tx;
  assign  io_oeb[0] =  io_uart_txen;
  assign  io_uart_rx = io_in[0];
  assign  io_out[1] = io_spi_cs; 
  assign  io_out[2] = io_spi_clk;
  assign  io_out[3] = io_spi_mosi;
  assign  io_oeb[1] = io_spi_cs_en; 
  assign  io_oeb[2] = io_spi_clk_en;
  assign  io_oeb[3] = io_spi_mosi_en;
  assign  io_spi_miso = io_in[1];
  assign  io_qei_ch_a = io_in[2];
  assign  io_qei_ch_b = io_in[3];
  assign  io_out[4] = io_pwm_high;
  assign  io_out[5] = io_pwm_low;
  assign  io_oeb[4] = io_pwm_high_en;
  assign  io_oeb[5] = io_pwm_low_en;
endmodule	// user_project_wrapper

`default_nettype wire
