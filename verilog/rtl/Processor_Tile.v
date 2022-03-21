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
module Processor_Tile( // @[:@12742.2]
  input   clock, // @[:@12743.4]
  input   reset, // @[:@12744.4]
  output  io_uart_tx, // @[:@12745.4]
  input   io_uart_rx, // @[:@12745.4]
  output  io_spi_cs, // @[:@12745.4]
  output  io_spi_clk, // @[:@12745.4]
  output  io_spi_mosi, // @[:@12745.4]
  input   io_spi_miso, // @[:@12745.4]
  input   io_qei_ch_a, // @[:@12745.4]
  input   io_qei_ch_b, // @[:@12745.4]
  output  io_pwm_high, // @[:@12745.4]
  output  io_pwm_low // @[:@12745.4]
);
  wire  core_clock; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_reset; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_irq_uart_irq; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_irq_spi_irq; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_irq_motor_irq; // @[processor_tile.scala 52:32:@12747.4]
  wire [31:0] core_io_ibus_addr; // @[processor_tile.scala 52:32:@12747.4]
  wire [31:0] core_io_ibus_inst; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_ibus_valid; // @[processor_tile.scala 52:32:@12747.4]
  wire [31:0] core_io_dbus_addr; // @[processor_tile.scala 52:32:@12747.4]
  wire [31:0] core_io_dbus_wdata; // @[processor_tile.scala 52:32:@12747.4]
  wire [31:0] core_io_dbus_rdata; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_dbus_rd_en; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_dbus_wr_en; // @[processor_tile.scala 52:32:@12747.4]
  wire [1:0] core_io_dbus_st_type; // @[processor_tile.scala 52:32:@12747.4]
  wire [2:0] core_io_dbus_ld_type; // @[processor_tile.scala 52:32:@12747.4]
  wire  core_io_dbus_valid; // @[processor_tile.scala 52:32:@12747.4]
  wire  wb_inter_connect_clock; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_reset; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_dbus_addr; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_dbus_wdata; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_dbus_rd_en; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_dbus_wr_en; // @[processor_tile.scala 53:32:@12750.4]
  wire [1:0] wb_inter_connect_io_dbus_st_type; // @[processor_tile.scala 53:32:@12750.4]
  wire [2:0] wb_inter_connect_io_dbus_ld_type; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_ibus_addr; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 53:32:@12750.4]
  wire [8:0] wb_inter_connect_io_imem_io_addr; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_imem_io_rdata; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_imem_io_wdata; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_imem_io_wr_en; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_imem_io_cs; // @[processor_tile.scala 53:32:@12750.4]
  wire [7:0] wb_inter_connect_io_dmem_io_addr; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_dmem_io_wdata; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_dmem_io_rdata; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_dmem_io_cs; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_dmem_io_wr_en; // @[processor_tile.scala 53:32:@12750.4]
  wire [3:0] wb_inter_connect_io_dmem_io_st_type; // @[processor_tile.scala 53:32:@12750.4]
  wire [15:0] wb_inter_connect_io_wbm_m2s_addr; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_wbm_m2s_data; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_wbm_m2s_we; // @[processor_tile.scala 53:32:@12750.4]
  wire [3:0] wb_inter_connect_io_wbm_m2s_sel; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_wbm_m2s_stb; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_uart_tx; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_uart_rx; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_uart_irq; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_spi_cs; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_spi_clk; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_spi_miso; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_spi_irq; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_motor_ack_i; // @[processor_tile.scala 53:32:@12750.4]
  wire [31:0] wb_inter_connect_io_motor_data_i; // @[processor_tile.scala 53:32:@12750.4]
  wire  wb_inter_connect_io_motor_addr_sel; // @[processor_tile.scala 53:32:@12750.4]
  wire  motor_clock; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_reset; // @[processor_tile.scala 55:32:@12753.4]
  wire [15:0] motor_io_wbs_m2s_addr; // @[processor_tile.scala 55:32:@12753.4]
  wire [31:0] motor_io_wbs_m2s_data; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_wbs_m2s_we; // @[processor_tile.scala 55:32:@12753.4]
  wire [3:0] motor_io_wbs_m2s_sel; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_wbs_m2s_stb; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_wbs_ack_o; // @[processor_tile.scala 55:32:@12753.4]
  wire [31:0] motor_io_wbs_data_o; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_ba_match; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_motor_irq; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_qei_ch_a; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_qei_ch_b; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_pwm_high; // @[processor_tile.scala 55:32:@12753.4]
  wire  motor_io_pwm_low; // @[processor_tile.scala 55:32:@12753.4]
  wire  imem_clock; // @[processor_tile.scala 56:32:@12756.4]
  wire [8:0] imem_io_addr; // @[processor_tile.scala 56:32:@12756.4]
  wire [31:0] imem_io_rdata; // @[processor_tile.scala 56:32:@12756.4]
  wire [31:0] imem_io_wdata; // @[processor_tile.scala 56:32:@12756.4]
  wire  imem_io_wr_en; // @[processor_tile.scala 56:32:@12756.4]
  wire  imem_io_cs; // @[processor_tile.scala 56:32:@12756.4]
  wire  dmem_clock; // @[processor_tile.scala 57:32:@12759.4]
  wire [7:0] dmem_io_addr; // @[processor_tile.scala 57:32:@12759.4]
  wire [31:0] dmem_io_wdata; // @[processor_tile.scala 57:32:@12759.4]
  wire [31:0] dmem_io_rdata; // @[processor_tile.scala 57:32:@12759.4]
  wire  dmem_io_cs; // @[processor_tile.scala 57:32:@12759.4]
  wire  dmem_io_wr_en; // @[processor_tile.scala 57:32:@12759.4]
  wire [3:0] dmem_io_st_type; // @[processor_tile.scala 57:32:@12759.4]
  Core core ( // @[processor_tile.scala 52:32:@12747.4]
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
  WB_InterConnect wb_inter_connect ( // @[processor_tile.scala 53:32:@12750.4]
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
    .io_uart_rx(wb_inter_connect_io_uart_rx),
    .io_uart_irq(wb_inter_connect_io_uart_irq),
    .io_spi_cs(wb_inter_connect_io_spi_cs),
    .io_spi_clk(wb_inter_connect_io_spi_clk),
    .io_spi_mosi(wb_inter_connect_io_spi_mosi),
    .io_spi_miso(wb_inter_connect_io_spi_miso),
    .io_spi_irq(wb_inter_connect_io_spi_irq),
    .io_motor_ack_i(wb_inter_connect_io_motor_ack_i),
    .io_motor_data_i(wb_inter_connect_io_motor_data_i),
    .io_motor_addr_sel(wb_inter_connect_io_motor_addr_sel)
  );
  Motor_Top motor ( // @[processor_tile.scala 55:32:@12753.4]
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
    .io_pwm_low(motor_io_pwm_low)
  );
  IMem imem ( // @[processor_tile.scala 56:32:@12756.4]
    .clock(imem_clock),
    .io_addr(imem_io_addr),
    .io_rdata(imem_io_rdata),
    .io_wdata(imem_io_wdata),
    .io_wr_en(imem_io_wr_en),
    .io_cs(imem_io_cs)
  );
  DMem dmem ( // @[processor_tile.scala 57:32:@12759.4]
    .clock(dmem_clock),
    .io_addr(dmem_io_addr),
    .io_wdata(dmem_io_wdata),
    .io_rdata(dmem_io_rdata),
    .io_cs(dmem_io_cs),
    .io_wr_en(dmem_io_wr_en),
    .io_st_type(dmem_io_st_type)
  );
  assign io_uart_tx = wb_inter_connect_io_uart_tx; // @[processor_tile.scala 69:32:@12791.4]
  assign io_spi_cs = wb_inter_connect_io_spi_cs; // @[processor_tile.scala 74:32:@12794.4]
  assign io_spi_clk = wb_inter_connect_io_spi_clk; // @[processor_tile.scala 75:32:@12795.4]
  assign io_spi_mosi = wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 76:32:@12796.4]
  assign io_pwm_high = motor_io_pwm_high; // @[processor_tile.scala 95:24:@12810.4]
  assign io_pwm_low = motor_io_pwm_low; // @[processor_tile.scala 96:24:@12811.4]
  assign core_clock = clock; // @[:@12748.4]
  assign core_reset = reset; // @[:@12749.4]
  assign core_io_irq_uart_irq = wb_inter_connect_io_uart_irq; // @[processor_tile.scala 71:32:@12793.4]
  assign core_io_irq_spi_irq = wb_inter_connect_io_spi_irq; // @[processor_tile.scala 78:32:@12798.4]
  assign core_io_irq_motor_irq = motor_io_motor_irq; // @[processor_tile.scala 97:25:@12812.4]
  assign core_io_ibus_inst = wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 65:24:@12781.4]
  assign core_io_ibus_valid = wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 65:24:@12780.4]
  assign core_io_dbus_rdata = wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 66:24:@12788.4]
  assign core_io_dbus_valid = wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 66:24:@12783.4]
  assign wb_inter_connect_clock = clock; // @[:@12751.4]
  assign wb_inter_connect_reset = reset; // @[:@12752.4]
  assign wb_inter_connect_io_dbus_addr = core_io_dbus_addr; // @[processor_tile.scala 66:24:@12790.4]
  assign wb_inter_connect_io_dbus_wdata = core_io_dbus_wdata; // @[processor_tile.scala 66:24:@12789.4]
  assign wb_inter_connect_io_dbus_rd_en = core_io_dbus_rd_en; // @[processor_tile.scala 66:24:@12787.4]
  assign wb_inter_connect_io_dbus_wr_en = core_io_dbus_wr_en; // @[processor_tile.scala 66:24:@12786.4]
  assign wb_inter_connect_io_dbus_st_type = core_io_dbus_st_type; // @[processor_tile.scala 66:24:@12785.4]
  assign wb_inter_connect_io_dbus_ld_type = core_io_dbus_ld_type; // @[processor_tile.scala 66:24:@12784.4]
  assign wb_inter_connect_io_ibus_addr = core_io_ibus_addr; // @[processor_tile.scala 65:24:@12782.4]
  assign wb_inter_connect_io_imem_io_rdata = imem_io_rdata; // @[processor_tile.scala 60:11:@12769.4]
  assign wb_inter_connect_io_dmem_io_rdata = dmem_io_rdata; // @[processor_tile.scala 61:11:@12777.4]
  assign wb_inter_connect_io_uart_rx = io_uart_rx; // @[processor_tile.scala 70:32:@12792.4]
  assign wb_inter_connect_io_spi_miso = io_spi_miso; // @[processor_tile.scala 77:32:@12797.4]
  assign wb_inter_connect_io_motor_ack_i = motor_io_wbs_ack_o; // @[processor_tile.scala 90:35:@12806.4]
  assign wb_inter_connect_io_motor_data_i = motor_io_wbs_data_o; // @[processor_tile.scala 89:36:@12805.4]
  assign motor_clock = clock; // @[:@12754.4]
  assign motor_reset = reset; // @[:@12755.4]
  assign motor_io_wbs_m2s_addr = wb_inter_connect_io_wbm_m2s_addr; // @[processor_tile.scala 88:28:@12804.4]
  assign motor_io_wbs_m2s_data = wb_inter_connect_io_wbm_m2s_data; // @[processor_tile.scala 88:28:@12803.4]
  assign motor_io_wbs_m2s_we = wb_inter_connect_io_wbm_m2s_we; // @[processor_tile.scala 88:28:@12802.4]
  assign motor_io_wbs_m2s_sel = wb_inter_connect_io_wbm_m2s_sel; // @[processor_tile.scala 88:28:@12801.4]
  assign motor_io_wbs_m2s_stb = wb_inter_connect_io_wbm_m2s_stb; // @[processor_tile.scala 88:28:@12800.4]
  assign motor_io_ba_match = wb_inter_connect_io_motor_addr_sel; // @[processor_tile.scala 92:24:@12807.4]
  assign motor_io_qei_ch_a = io_qei_ch_a; // @[processor_tile.scala 93:24:@12808.4]
  assign motor_io_qei_ch_b = io_qei_ch_b; // @[processor_tile.scala 94:24:@12809.4]
  assign imem_clock = clock; // @[:@12757.4]
  assign imem_io_addr = wb_inter_connect_io_imem_io_addr; // @[processor_tile.scala 60:11:@12770.4]
  assign imem_io_wdata = wb_inter_connect_io_imem_io_wdata; // @[processor_tile.scala 60:11:@12768.4]
  assign imem_io_wr_en = wb_inter_connect_io_imem_io_wr_en; // @[processor_tile.scala 60:11:@12767.4]
  assign imem_io_cs = wb_inter_connect_io_imem_io_cs; // @[processor_tile.scala 60:11:@12766.4]
  assign dmem_clock = clock; // @[:@12760.4]
  assign dmem_io_addr = wb_inter_connect_io_dmem_io_addr; // @[processor_tile.scala 61:11:@12779.4]
  assign dmem_io_wdata = wb_inter_connect_io_dmem_io_wdata; // @[processor_tile.scala 61:11:@12778.4]
  assign dmem_io_cs = wb_inter_connect_io_dmem_io_cs; // @[processor_tile.scala 61:11:@12776.4]
  assign dmem_io_wr_en = wb_inter_connect_io_dmem_io_wr_en; // @[processor_tile.scala 61:11:@12775.4]
  assign dmem_io_st_type = wb_inter_connect_io_dmem_io_st_type; // @[processor_tile.scala 61:11:@12774.4]
endmodule
