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
  wire  core_clock; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_reset; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_irq_uart_irq; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_irq_spi_irq; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_irq_m1_irq; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_irq_m2_irq; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_irq_m3_irq; // @[soc_tile.scala 58:32:@30066.4]
  wire [31:0] core_io_ibus_addr; // @[soc_tile.scala 58:32:@30066.4]
  wire [31:0] core_io_ibus_inst; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_ibus_valid; // @[soc_tile.scala 58:32:@30066.4]
  wire [31:0] core_io_dbus_addr; // @[soc_tile.scala 58:32:@30066.4]
  wire [31:0] core_io_dbus_wdata; // @[soc_tile.scala 58:32:@30066.4]
  wire [31:0] core_io_dbus_rdata; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_dbus_rd_en; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_dbus_wr_en; // @[soc_tile.scala 58:32:@30066.4]
  wire [1:0] core_io_dbus_st_type; // @[soc_tile.scala 58:32:@30066.4]
  wire [2:0] core_io_dbus_ld_type; // @[soc_tile.scala 58:32:@30066.4]
  wire  core_io_dbus_valid; // @[soc_tile.scala 58:32:@30066.4]
  wire  wb_inter_connect_clock; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_reset; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_dbus_addr; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_dbus_wdata; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_dbus_rdata; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_dbus_rd_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_dbus_wr_en; // @[soc_tile.scala 59:32:@30069.4]
  wire [1:0] wb_inter_connect_io_dbus_st_type; // @[soc_tile.scala 59:32:@30069.4]
  wire [2:0] wb_inter_connect_io_dbus_ld_type; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_dbus_valid; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_ibus_addr; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_ibus_inst; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_ibus_valid; // @[soc_tile.scala 59:32:@30069.4]
  wire [8:0] wb_inter_connect_io_imem_io_addr; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_imem_io_rdata; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_imem_io_wdata; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_imem_io_wr_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_imem_io_cs; // @[soc_tile.scala 59:32:@30069.4]
  wire [3:0] wb_inter_connect_io_imem_io_st_type; // @[soc_tile.scala 59:32:@30069.4]
  wire [8:0] wb_inter_connect_io_dmem_io_addr; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_dmem_io_wdata; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_dmem_io_rdata; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_dmem_io_cs; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_dmem_io_wr_en; // @[soc_tile.scala 59:32:@30069.4]
  wire [3:0] wb_inter_connect_io_dmem_io_st_type; // @[soc_tile.scala 59:32:@30069.4]
  wire [15:0] wb_inter_connect_io_wbm_m2s_addr; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_wbm_m2s_data; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_wbm_m2s_we; // @[soc_tile.scala 59:32:@30069.4]
  wire [3:0] wb_inter_connect_io_wbm_m2s_sel; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_wbm_m2s_stb; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_uart_tx; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_uart_tx_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_uart_rx; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_uart_irq; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_cs; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_clk; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_mosi; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_miso; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_irq; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_cs_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_clk_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_spi_mosi_en; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m1_ack_i; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_m1_data_i; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m1_addr_sel; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m2_ack_i; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_m2_data_i; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m2_addr_sel; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m3_ack_i; // @[soc_tile.scala 59:32:@30069.4]
  wire [31:0] wb_inter_connect_io_m3_data_i; // @[soc_tile.scala 59:32:@30069.4]
  wire  wb_inter_connect_io_m3_addr_sel; // @[soc_tile.scala 59:32:@30069.4]
  wire  m1_clock; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_reset; // @[soc_tile.scala 61:32:@30072.4]
  wire [15:0] m1_io_wbs_m2s_addr; // @[soc_tile.scala 61:32:@30072.4]
  wire [31:0] m1_io_wbs_m2s_data; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_wbs_m2s_we; // @[soc_tile.scala 61:32:@30072.4]
  wire [3:0] m1_io_wbs_m2s_sel; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_wbs_m2s_stb; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_wbs_ack_o; // @[soc_tile.scala 61:32:@30072.4]
  wire [31:0] m1_io_wbs_data_o; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_qei_ch_a; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_qei_ch_b; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_pwm_high; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_pwm_low; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_ba_match; // @[soc_tile.scala 61:32:@30072.4]
  wire  m1_io_motor_irq; // @[soc_tile.scala 61:32:@30072.4]
  wire  m2_clock; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_reset; // @[soc_tile.scala 62:32:@30075.4]
  wire [15:0] m2_io_wbs_m2s_addr; // @[soc_tile.scala 62:32:@30075.4]
  wire [31:0] m2_io_wbs_m2s_data; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_wbs_m2s_we; // @[soc_tile.scala 62:32:@30075.4]
  wire [3:0] m2_io_wbs_m2s_sel; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_wbs_m2s_stb; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_wbs_ack_o; // @[soc_tile.scala 62:32:@30075.4]
  wire [31:0] m2_io_wbs_data_o; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_qei_ch_a; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_qei_ch_b; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_pwm_high; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_pwm_low; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_ba_match; // @[soc_tile.scala 62:32:@30075.4]
  wire  m2_io_motor_irq; // @[soc_tile.scala 62:32:@30075.4]
  wire  m3_clock; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_reset; // @[soc_tile.scala 63:32:@30078.4]
  wire [15:0] m3_io_wbs_m2s_addr; // @[soc_tile.scala 63:32:@30078.4]
  wire [31:0] m3_io_wbs_m2s_data; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_wbs_m2s_we; // @[soc_tile.scala 63:32:@30078.4]
  wire [3:0] m3_io_wbs_m2s_sel; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_wbs_m2s_stb; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_wbs_ack_o; // @[soc_tile.scala 63:32:@30078.4]
  wire [31:0] m3_io_wbs_data_o; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_qei_ch_a; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_qei_ch_b; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_pwm_high; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_pwm_low; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_ba_match; // @[soc_tile.scala 63:32:@30078.4]
  wire  m3_io_motor_irq; // @[soc_tile.scala 63:32:@30078.4]
  wire  imem_clock; // @[soc_tile.scala 65:32:@30081.4]
  wire [8:0] imem_io_addr; // @[soc_tile.scala 65:32:@30081.4]
  wire [31:0] imem_io_rdata; // @[soc_tile.scala 65:32:@30081.4]
  wire [31:0] imem_io_wdata; // @[soc_tile.scala 65:32:@30081.4]
  wire  imem_io_cs; // @[soc_tile.scala 65:32:@30081.4]
  wire  imem_io_wr_en; // @[soc_tile.scala 65:32:@30081.4]
  wire [3:0] imem_io_st_type; // @[soc_tile.scala 65:32:@30081.4]
  wire  dmem_clock; // @[soc_tile.scala 66:32:@30084.4]
  wire [8:0] dmem_io_addr; // @[soc_tile.scala 66:32:@30084.4]
  wire [31:0] dmem_io_wdata; // @[soc_tile.scala 66:32:@30084.4]
  wire [31:0] dmem_io_rdata; // @[soc_tile.scala 66:32:@30084.4]
  wire  dmem_io_cs; // @[soc_tile.scala 66:32:@30084.4]
  wire  dmem_io_wr_en; // @[soc_tile.scala 66:32:@30084.4]
  wire [3:0] dmem_io_st_type; // @[soc_tile.scala 66:32:@30084.4]
  Core core ( // @[soc_tile.scala 58:32:@30066.4]
    .clock(core_clock),
    .reset(core_reset),
    .io_irq_uart_irq(core_io_irq_uart_irq),
    .io_irq_spi_irq(core_io_irq_spi_irq),
    .io_irq_m1_irq(core_io_irq_m1_irq),
    .io_irq_m2_irq(core_io_irq_m2_irq),
    .io_irq_m3_irq(core_io_irq_m3_irq),
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
  WB_InterConnect wb_inter_connect ( // @[soc_tile.scala 59:32:@30069.4]
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
    .io_uart_tx_en(wb_inter_connect_io_uart_tx_en),
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
    .io_m1_ack_i(wb_inter_connect_io_m1_ack_i),
    .io_m1_data_i(wb_inter_connect_io_m1_data_i),
    .io_m1_addr_sel(wb_inter_connect_io_m1_addr_sel),
    .io_m2_ack_i(wb_inter_connect_io_m2_ack_i),
    .io_m2_data_i(wb_inter_connect_io_m2_data_i),
    .io_m2_addr_sel(wb_inter_connect_io_m2_addr_sel),
    .io_m3_ack_i(wb_inter_connect_io_m3_ack_i),
    .io_m3_data_i(wb_inter_connect_io_m3_data_i),
    .io_m3_addr_sel(wb_inter_connect_io_m3_addr_sel)
  );
  Motor_Top m1 ( // @[soc_tile.scala 61:32:@30072.4]
    .clock(m1_clock),
    .reset(m1_reset),
    .io_wbs_m2s_addr(m1_io_wbs_m2s_addr),
    .io_wbs_m2s_data(m1_io_wbs_m2s_data),
    .io_wbs_m2s_we(m1_io_wbs_m2s_we),
    .io_wbs_m2s_sel(m1_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(m1_io_wbs_m2s_stb),
    .io_wbs_ack_o(m1_io_wbs_ack_o),
    .io_wbs_data_o(m1_io_wbs_data_o),
    .io_motor_gpio_qei_ch_a(m1_io_motor_gpio_qei_ch_a),
    .io_motor_gpio_qei_ch_b(m1_io_motor_gpio_qei_ch_b),
    .io_motor_gpio_pwm_high(m1_io_motor_gpio_pwm_high),
    .io_motor_gpio_pwm_low(m1_io_motor_gpio_pwm_low),
    .io_motor_gpio_pwm_high_en(m1_io_motor_gpio_pwm_high_en),
    .io_motor_gpio_pwm_low_en(m1_io_motor_gpio_pwm_low_en),
    .io_ba_match(m1_io_ba_match),
    .io_motor_irq(m1_io_motor_irq)
  );
  Motor_Top m2 ( // @[soc_tile.scala 62:32:@30075.4]
    .clock(m2_clock),
    .reset(m2_reset),
    .io_wbs_m2s_addr(m2_io_wbs_m2s_addr),
    .io_wbs_m2s_data(m2_io_wbs_m2s_data),
    .io_wbs_m2s_we(m2_io_wbs_m2s_we),
    .io_wbs_m2s_sel(m2_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(m2_io_wbs_m2s_stb),
    .io_wbs_ack_o(m2_io_wbs_ack_o),
    .io_wbs_data_o(m2_io_wbs_data_o),
    .io_motor_gpio_qei_ch_a(m2_io_motor_gpio_qei_ch_a),
    .io_motor_gpio_qei_ch_b(m2_io_motor_gpio_qei_ch_b),
    .io_motor_gpio_pwm_high(m2_io_motor_gpio_pwm_high),
    .io_motor_gpio_pwm_low(m2_io_motor_gpio_pwm_low),
    .io_motor_gpio_pwm_high_en(m2_io_motor_gpio_pwm_high_en),
    .io_motor_gpio_pwm_low_en(m2_io_motor_gpio_pwm_low_en),
    .io_ba_match(m2_io_ba_match),
    .io_motor_irq(m2_io_motor_irq)
  );
  Motor_Top m3 ( // @[soc_tile.scala 63:32:@30078.4]
    .clock(m3_clock),
    .reset(m3_reset),
    .io_wbs_m2s_addr(m3_io_wbs_m2s_addr),
    .io_wbs_m2s_data(m3_io_wbs_m2s_data),
    .io_wbs_m2s_we(m3_io_wbs_m2s_we),
    .io_wbs_m2s_sel(m3_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(m3_io_wbs_m2s_stb),
    .io_wbs_ack_o(m3_io_wbs_ack_o),
    .io_wbs_data_o(m3_io_wbs_data_o),
    .io_motor_gpio_qei_ch_a(m3_io_motor_gpio_qei_ch_a),
    .io_motor_gpio_qei_ch_b(m3_io_motor_gpio_qei_ch_b),
    .io_motor_gpio_pwm_high(m3_io_motor_gpio_pwm_high),
    .io_motor_gpio_pwm_low(m3_io_motor_gpio_pwm_low),
    .io_motor_gpio_pwm_high_en(m3_io_motor_gpio_pwm_high_en),
    .io_motor_gpio_pwm_low_en(m3_io_motor_gpio_pwm_low_en),
    .io_ba_match(m3_io_ba_match),
    .io_motor_irq(m3_io_motor_irq)
  );
  sky130_sram_2kbyte_1rw1r_32x512_8 dmem (
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

  sky130_sram_2kbyte_1rw1r_32x512_8 imem (
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
  assign io_uart_tx = wb_inter_connect_io_uart_tx; // @[soc_tile.scala 78:32:@30110.4]
  assign io_uart_tx_en = wb_inter_connect_io_uart_tx_en; // @[soc_tile.scala 79:32:@30111.4]
  assign io_spi_cs = wb_inter_connect_io_spi_cs; // @[soc_tile.scala 84:32:@30114.4]
  assign io_spi_clk = wb_inter_connect_io_spi_clk; // @[soc_tile.scala 85:32:@30115.4]
  assign io_spi_mosi = wb_inter_connect_io_spi_mosi; // @[soc_tile.scala 86:32:@30116.4]
  assign io_spi_cs_en = wb_inter_connect_io_spi_cs_en; // @[soc_tile.scala 90:32:@30119.4]
  assign io_spi_clk_en = wb_inter_connect_io_spi_clk_en; // @[soc_tile.scala 91:32:@30120.4]
  assign io_spi_mosi_en = wb_inter_connect_io_spi_mosi_en; // @[soc_tile.scala 92:32:@30121.4]
  assign io_m1_io_pwm_high = m1_io_motor_gpio_pwm_high; // @[soc_tile.scala 102:20:@30134.4]
  assign io_m1_io_pwm_low = m1_io_motor_gpio_pwm_low; // @[soc_tile.scala 102:20:@30133.4]
  assign io_m1_io_pwm_high_en = m1_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 102:20:@30132.4]
  assign io_m1_io_pwm_low_en = m1_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 102:20:@30131.4]
  assign io_m2_io_pwm_high = m2_io_motor_gpio_pwm_high; // @[soc_tile.scala 110:20:@30149.4]
  assign io_m2_io_pwm_low = m2_io_motor_gpio_pwm_low; // @[soc_tile.scala 110:20:@30148.4]
  assign io_m2_io_pwm_high_en = m2_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 110:20:@30147.4]
  assign io_m2_io_pwm_low_en = m2_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 110:20:@30146.4]
  assign io_m3_io_pwm_high = m3_io_motor_gpio_pwm_high; // @[soc_tile.scala 118:20:@30164.4]
  assign io_m3_io_pwm_low = m3_io_motor_gpio_pwm_low; // @[soc_tile.scala 118:20:@30163.4]
  assign io_m3_io_pwm_high_en = m3_io_motor_gpio_pwm_high_en; // @[soc_tile.scala 118:20:@30162.4]
  assign io_m3_io_pwm_low_en = m3_io_motor_gpio_pwm_low_en; // @[soc_tile.scala 118:20:@30161.4]
  assign core_clock = clock; // @[:@30067.4]
  assign core_reset = reset; // @[:@30068.4]
  assign core_io_irq_uart_irq = wb_inter_connect_io_uart_irq; // @[soc_tile.scala 81:32:@30113.4]
  assign core_io_irq_spi_irq = wb_inter_connect_io_spi_irq; // @[soc_tile.scala 88:32:@30118.4]
  assign core_io_irq_m1_irq = m1_io_motor_irq; // @[soc_tile.scala 121:22:@30167.4]
  assign core_io_irq_m2_irq = m2_io_motor_irq; // @[soc_tile.scala 122:22:@30168.4]
  assign core_io_irq_m3_irq = m3_io_motor_irq; // @[soc_tile.scala 123:22:@30169.4]
  assign core_io_ibus_inst = wb_inter_connect_io_ibus_inst; // @[soc_tile.scala 74:24:@30100.4]
  assign core_io_ibus_valid = wb_inter_connect_io_ibus_valid; // @[soc_tile.scala 74:24:@30099.4]
  assign core_io_dbus_rdata = wb_inter_connect_io_dbus_rdata; // @[soc_tile.scala 75:24:@30107.4]
  assign core_io_dbus_valid = wb_inter_connect_io_dbus_valid; // @[soc_tile.scala 75:24:@30102.4]
  assign wb_inter_connect_clock = clock; // @[:@30070.4]
  assign wb_inter_connect_reset = reset; // @[:@30071.4]
  assign wb_inter_connect_io_dbus_addr = core_io_dbus_addr; // @[soc_tile.scala 75:24:@30109.4]
  assign wb_inter_connect_io_dbus_wdata = core_io_dbus_wdata; // @[soc_tile.scala 75:24:@30108.4]
  assign wb_inter_connect_io_dbus_rd_en = core_io_dbus_rd_en; // @[soc_tile.scala 75:24:@30106.4]
  assign wb_inter_connect_io_dbus_wr_en = core_io_dbus_wr_en; // @[soc_tile.scala 75:24:@30105.4]
  assign wb_inter_connect_io_dbus_st_type = core_io_dbus_st_type; // @[soc_tile.scala 75:24:@30104.4]
  assign wb_inter_connect_io_dbus_ld_type = core_io_dbus_ld_type; // @[soc_tile.scala 75:24:@30103.4]
  assign wb_inter_connect_io_ibus_addr = core_io_ibus_addr; // @[soc_tile.scala 74:24:@30101.4]
  assign wb_inter_connect_io_imem_io_rdata = imem_io_rdata; // @[soc_tile.scala 69:11:@30091.4]
  assign wb_inter_connect_io_dmem_io_rdata = dmem_io_rdata; // @[soc_tile.scala 70:11:@30096.4]
  assign wb_inter_connect_io_uart_rx = io_uart_rx; // @[soc_tile.scala 80:32:@30112.4]
  assign wb_inter_connect_io_spi_miso = io_spi_miso; // @[soc_tile.scala 87:32:@30117.4]
  assign wb_inter_connect_io_m1_ack_i = m1_io_wbs_ack_o; // @[soc_tile.scala 99:32:@30129.4]
  assign wb_inter_connect_io_m1_data_i = m1_io_wbs_data_o; // @[soc_tile.scala 98:33:@30128.4]
  assign wb_inter_connect_io_m2_ack_i = m2_io_wbs_ack_o; // @[soc_tile.scala 107:32:@30144.4]
  assign wb_inter_connect_io_m2_data_i = m2_io_wbs_data_o; // @[soc_tile.scala 106:33:@30143.4]
  assign wb_inter_connect_io_m3_ack_i = m3_io_wbs_ack_o; // @[soc_tile.scala 115:32:@30159.4]
  assign wb_inter_connect_io_m3_data_i = m3_io_wbs_data_o; // @[soc_tile.scala 114:33:@30158.4]
  assign m1_clock = clock; // @[:@30073.4]
  assign m1_reset = reset; // @[:@30074.4]
  assign m1_io_wbs_m2s_addr = wb_inter_connect_io_wbm_m2s_addr; // @[soc_tile.scala 97:25:@30127.4]
  assign m1_io_wbs_m2s_data = wb_inter_connect_io_wbm_m2s_data; // @[soc_tile.scala 97:25:@30126.4]
  assign m1_io_wbs_m2s_we = wb_inter_connect_io_wbm_m2s_we; // @[soc_tile.scala 97:25:@30125.4]
  assign m1_io_wbs_m2s_sel = wb_inter_connect_io_wbm_m2s_sel; // @[soc_tile.scala 97:25:@30124.4]
  assign m1_io_wbs_m2s_stb = wb_inter_connect_io_wbm_m2s_stb; // @[soc_tile.scala 97:25:@30123.4]
  assign m1_io_motor_gpio_qei_ch_a = io_m1_io_qei_ch_a; // @[soc_tile.scala 102:20:@30136.4]
  assign m1_io_motor_gpio_qei_ch_b = io_m1_io_qei_ch_b; // @[soc_tile.scala 102:20:@30135.4]
  assign m1_io_ba_match = wb_inter_connect_io_m1_addr_sel; // @[soc_tile.scala 101:21:@30130.4]
  assign m2_clock = clock; // @[:@30076.4]
  assign m2_reset = reset; // @[:@30077.4]
  assign m2_io_wbs_m2s_addr = wb_inter_connect_io_wbm_m2s_addr; // @[soc_tile.scala 105:25:@30142.4]
  assign m2_io_wbs_m2s_data = wb_inter_connect_io_wbm_m2s_data; // @[soc_tile.scala 105:25:@30141.4]
  assign m2_io_wbs_m2s_we = wb_inter_connect_io_wbm_m2s_we; // @[soc_tile.scala 105:25:@30140.4]
  assign m2_io_wbs_m2s_sel = wb_inter_connect_io_wbm_m2s_sel; // @[soc_tile.scala 105:25:@30139.4]
  assign m2_io_wbs_m2s_stb = wb_inter_connect_io_wbm_m2s_stb; // @[soc_tile.scala 105:25:@30138.4]
  assign m2_io_motor_gpio_qei_ch_a = io_m2_io_qei_ch_a; // @[soc_tile.scala 110:20:@30151.4]
  assign m2_io_motor_gpio_qei_ch_b = io_m2_io_qei_ch_b; // @[soc_tile.scala 110:20:@30150.4]
  assign m2_io_ba_match = wb_inter_connect_io_m2_addr_sel; // @[soc_tile.scala 109:21:@30145.4]
  assign m3_clock = clock; // @[:@30079.4]
  assign m3_reset = reset; // @[:@30080.4]
  assign m3_io_wbs_m2s_addr = wb_inter_connect_io_wbm_m2s_addr; // @[soc_tile.scala 113:25:@30157.4]
  assign m3_io_wbs_m2s_data = wb_inter_connect_io_wbm_m2s_data; // @[soc_tile.scala 113:25:@30156.4]
  assign m3_io_wbs_m2s_we = wb_inter_connect_io_wbm_m2s_we; // @[soc_tile.scala 113:25:@30155.4]
  assign m3_io_wbs_m2s_sel = wb_inter_connect_io_wbm_m2s_sel; // @[soc_tile.scala 113:25:@30154.4]
  assign m3_io_wbs_m2s_stb = wb_inter_connect_io_wbm_m2s_stb; // @[soc_tile.scala 113:25:@30153.4]
  assign m3_io_motor_gpio_qei_ch_a = io_m3_io_qei_ch_a; // @[soc_tile.scala 118:20:@30166.4]
  assign m3_io_motor_gpio_qei_ch_b = io_m3_io_qei_ch_b; // @[soc_tile.scala 118:20:@30165.4]
  assign m3_io_ba_match = wb_inter_connect_io_m3_addr_sel; // @[soc_tile.scala 117:21:@30160.4]
  assign imem_clock = clock; // @[:@30082.4]
  assign imem_io_addr = wb_inter_connect_io_imem_io_addr; // @[soc_tile.scala 69:11:@30092.4]
  assign imem_io_wdata = wb_inter_connect_io_imem_io_wdata; // @[soc_tile.scala 69:11:@30090.4]
  assign imem_io_cs = wb_inter_connect_io_imem_io_cs; // @[soc_tile.scala 69:11:@30089.4]
  assign imem_io_wr_en = wb_inter_connect_io_imem_io_wr_en; // @[soc_tile.scala 69:11:@30088.4]
  assign imem_io_st_type = wb_inter_connect_io_imem_io_st_type; // @[soc_tile.scala 69:11:@30087.4]
  assign dmem_clock = clock; // @[:@30085.4]
  assign dmem_io_addr = wb_inter_connect_io_dmem_io_addr; // @[soc_tile.scala 70:11:@30098.4]
  assign dmem_io_wdata = wb_inter_connect_io_dmem_io_wdata; // @[soc_tile.scala 70:11:@30097.4]
  assign dmem_io_cs = wb_inter_connect_io_dmem_io_cs; // @[soc_tile.scala 70:11:@30095.4]
  assign dmem_io_wr_en = wb_inter_connect_io_dmem_io_wr_en; // @[soc_tile.scala 70:11:@30094.4]
  assign dmem_io_st_type = wb_inter_connect_io_dmem_io_st_type; // @[soc_tile.scala 70:11:@30093.4]
  
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

  assign   io_m1_io_qei_ch_a = io_in[2];
  assign   io_m1_io_qei_ch_b = io_in[3];
  assign   io_out[4] = io_m1_io_pwm_high;
  assign   io_out[5] = io_m1_io_pwm_low;
  assign   io_oeb[4] = io_m1_io_pwm_high_en;
  assign   io_oeb[5] = io_m1_io_pwm_low_en;

  assign   io_m2_io_qei_ch_a = io_in[4];
  assign   io_m2_io_qei_ch_b = io_in[5];
  assign   io_out[6] = io_m2_io_pwm_high;
  assign   io_out[7] = io_m2_io_pwm_low;
  assign   io_oeb[6] = io_m2_io_pwm_high_en;
  assign   io_oeb[7] = io_m2_io_pwm_low_en;

  assign   io_m3_io_qei_ch_a = io_in[6];
  assign   io_m3_io_qei_ch_b = io_in[7];
  assign   io_out[8] = io_m3_io_pwm_high;
  assign   io_out[9] = io_m3_io_pwm_low;
  assign   io_oeb[8] = io_m3_io_pwm_high_en;
  assign   io_oeb[9] = io_m3_io_pwm_low_en;
endmodule	// user_project_wrapper

`default_nettype wire