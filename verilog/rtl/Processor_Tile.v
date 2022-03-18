module Processor_Tile( // @[:@12682.2]
  input   clock, // @[:@12683.4]
  input   reset, // @[:@12684.4]
  output  io_uart_tx, // @[:@12685.4]
  input   io_uart_rx, // @[:@12685.4]
  output  io_spi_cs, // @[:@12685.4]
  output  io_spi_clk, // @[:@12685.4]
  output  io_spi_mosi, // @[:@12685.4]
  input   io_spi_miso, // @[:@12685.4]
  input   io_qei_ch_a, // @[:@12685.4]
  input   io_qei_ch_b, // @[:@12685.4]
  output  io_pwm_high, // @[:@12685.4]
  output  io_pwm_low // @[:@12685.4]
);
  wire  core_clock; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_reset; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_uart_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_spi_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_irq_motor_irq; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_ibus_addr; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_ibus_inst; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_ibus_valid; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_addr; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_wdata; // @[processor_tile.scala 48:32:@12687.4]
  wire [31:0] core_io_dbus_rdata; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_rd_en; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_wr_en; // @[processor_tile.scala 48:32:@12687.4]
  wire [1:0] core_io_dbus_st_type; // @[processor_tile.scala 48:32:@12687.4]
  wire [2:0] core_io_dbus_ld_type; // @[processor_tile.scala 48:32:@12687.4]
  wire  core_io_dbus_valid; // @[processor_tile.scala 48:32:@12687.4]
  wire  wb_inter_connect_clock; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_reset; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_addr; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_wdata; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_rd_en; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_wr_en; // @[processor_tile.scala 49:32:@12690.4]
  wire [1:0] wb_inter_connect_io_dbus_st_type; // @[processor_tile.scala 49:32:@12690.4]
  wire [2:0] wb_inter_connect_io_dbus_ld_type; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_ibus_addr; // @[processor_tile.scala 49:32:@12690.4]
  wire [31:0] wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_tx; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_rx; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_uart_irq; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_cs; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_clk; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_miso; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_spi_irq; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_qei_ch_a; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_qei_ch_b; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_pwm_high; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_pwm_low; // @[processor_tile.scala 49:32:@12690.4]
  wire  wb_inter_connect_io_motor_irq; // @[processor_tile.scala 49:32:@12690.4]
  Core core ( // @[processor_tile.scala 48:32:@12687.4]
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
  WB_InterConnect wb_inter_connect ( // @[processor_tile.scala 49:32:@12690.4]
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
    .io_uart_tx(wb_inter_connect_io_uart_tx),
    .io_uart_rx(wb_inter_connect_io_uart_rx),
    .io_uart_irq(wb_inter_connect_io_uart_irq),
    .io_spi_cs(wb_inter_connect_io_spi_cs),
    .io_spi_clk(wb_inter_connect_io_spi_clk),
    .io_spi_mosi(wb_inter_connect_io_spi_mosi),
    .io_spi_miso(wb_inter_connect_io_spi_miso),
    .io_spi_irq(wb_inter_connect_io_spi_irq),
    .io_qei_ch_a(wb_inter_connect_io_qei_ch_a),
    .io_qei_ch_b(wb_inter_connect_io_qei_ch_b),
    .io_pwm_high(wb_inter_connect_io_pwm_high),
    .io_pwm_low(wb_inter_connect_io_pwm_low),
    .io_motor_irq(wb_inter_connect_io_motor_irq)
  );
  assign io_uart_tx = wb_inter_connect_io_uart_tx; // @[processor_tile.scala 56:32:@12704.4]
  assign io_spi_cs = wb_inter_connect_io_spi_cs; // @[processor_tile.scala 61:32:@12707.4]
  assign io_spi_clk = wb_inter_connect_io_spi_clk; // @[processor_tile.scala 62:32:@12708.4]
  assign io_spi_mosi = wb_inter_connect_io_spi_mosi; // @[processor_tile.scala 63:32:@12709.4]
  assign io_pwm_high = wb_inter_connect_io_pwm_high; // @[processor_tile.scala 68:32:@12712.4]
  assign io_pwm_low = wb_inter_connect_io_pwm_low; // @[processor_tile.scala 69:32:@12713.4]
  assign core_clock = clock; // @[:@12688.4]
  assign core_reset = reset; // @[:@12689.4]
  assign core_io_irq_uart_irq = wb_inter_connect_io_uart_irq; // @[processor_tile.scala 58:32:@12706.4]
  assign core_io_irq_spi_irq = wb_inter_connect_io_spi_irq; // @[processor_tile.scala 65:32:@12711.4]
  assign core_io_irq_motor_irq = wb_inter_connect_io_motor_irq; // @[processor_tile.scala 72:32:@12716.4]
  assign core_io_ibus_inst = wb_inter_connect_io_ibus_inst; // @[processor_tile.scala 52:24:@12694.4]
  assign core_io_ibus_valid = wb_inter_connect_io_ibus_valid; // @[processor_tile.scala 52:24:@12693.4]
  assign core_io_dbus_rdata = wb_inter_connect_io_dbus_rdata; // @[processor_tile.scala 53:24:@12701.4]
  assign core_io_dbus_valid = wb_inter_connect_io_dbus_valid; // @[processor_tile.scala 53:24:@12696.4]
  assign wb_inter_connect_clock = clock; // @[:@12691.4]
  assign wb_inter_connect_reset = reset; // @[:@12692.4]
  assign wb_inter_connect_io_dbus_addr = core_io_dbus_addr; // @[processor_tile.scala 53:24:@12703.4]
  assign wb_inter_connect_io_dbus_wdata = core_io_dbus_wdata; // @[processor_tile.scala 53:24:@12702.4]
  assign wb_inter_connect_io_dbus_rd_en = core_io_dbus_rd_en; // @[processor_tile.scala 53:24:@12700.4]
  assign wb_inter_connect_io_dbus_wr_en = core_io_dbus_wr_en; // @[processor_tile.scala 53:24:@12699.4]
  assign wb_inter_connect_io_dbus_st_type = core_io_dbus_st_type; // @[processor_tile.scala 53:24:@12698.4]
  assign wb_inter_connect_io_dbus_ld_type = core_io_dbus_ld_type; // @[processor_tile.scala 53:24:@12697.4]
  assign wb_inter_connect_io_ibus_addr = core_io_ibus_addr; // @[processor_tile.scala 52:24:@12695.4]
  assign wb_inter_connect_io_uart_rx = io_uart_rx; // @[processor_tile.scala 57:32:@12705.4]
  assign wb_inter_connect_io_spi_miso = io_spi_miso; // @[processor_tile.scala 64:32:@12710.4]
  assign wb_inter_connect_io_qei_ch_a = io_qei_ch_a; // @[processor_tile.scala 70:32:@12714.4]
  assign wb_inter_connect_io_qei_ch_b = io_qei_ch_b; // @[processor_tile.scala 71:32:@12715.4]
endmodule
