module WB_InterConnect( // @[:@3854.2]
  input         clock, // @[:@3855.4]
  input         reset, // @[:@3856.4]
  input  [31:0] io_dbus_addr, // @[:@3857.4]
  input  [31:0] io_dbus_wdata, // @[:@3857.4]
  output [31:0] io_dbus_rdata, // @[:@3857.4]
  input         io_dbus_rd_en, // @[:@3857.4]
  input         io_dbus_wr_en, // @[:@3857.4]
  input  [1:0]  io_dbus_st_type, // @[:@3857.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3857.4]
  output        io_dbus_valid, // @[:@3857.4]
  input  [31:0] io_ibus_addr, // @[:@3857.4]
  output [31:0] io_ibus_inst, // @[:@3857.4]
  output        io_ibus_valid, // @[:@3857.4]
  output [31:0] io_imem_io_addr, // @[:@3857.4]
  input  [31:0] io_imem_io_rdata, // @[:@3857.4]
  output [31:0] io_imem_io_wdata, // @[:@3857.4]
  output        io_imem_io_wr_en, // @[:@3857.4]
  output [7:0]  io_dmem_io_addr, // @[:@3857.4]
  output [31:0] io_dmem_io_wdata, // @[:@3857.4]
  input  [31:0] io_dmem_io_rdata, // @[:@3857.4]
  output        io_dmem_io_wr_en, // @[:@3857.4]
  output [3:0]  io_dmem_io_st_type, // @[:@3857.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3857.4]
  output [31:0] io_wbm_m2s_data, // @[:@3857.4]
  output        io_wbm_m2s_we, // @[:@3857.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3857.4]
  output        io_wbm_m2s_stb, // @[:@3857.4]
  output        io_uart_tx, // @[:@3857.4]
  input         io_uart_rx, // @[:@3857.4]
  output        io_uart_irq, // @[:@3857.4]
  output        io_spi_cs, // @[:@3857.4]
  output        io_spi_clk, // @[:@3857.4]
  output        io_spi_mosi, // @[:@3857.4]
  input         io_spi_miso, // @[:@3857.4]
  output        io_spi_irq, // @[:@3857.4]
  input         io_motor_ack_i, // @[:@3857.4]
  input  [31:0] io_motor_data_i, // @[:@3857.4]
  output        io_motor_addr_sel // @[:@3857.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  dmem_reset; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [7:0] dmem_io_dmem_io_addr; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [31:0] dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [31:0] dmem_io_dmem_io_rdata; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 73:24:@3859.4]
  wire [3:0] dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 73:24:@3859.4]
  wire  imem_clock; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_reset; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_imem_io_addr; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_imem_io_rdata; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] imem_io_imem_io_wdata; // @[wb_interconnect.scala 74:24:@3862.4]
  wire  imem_io_imem_io_wr_en; // @[wb_interconnect.scala 74:24:@3862.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 75:24:@3865.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 75:24:@3865.4]
  wire  uart_clock; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_reset; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 76:24:@3868.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 76:24:@3868.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 76:24:@3868.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 76:24:@3868.4]
  wire  spi_clock; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_reset; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 77:24:@3871.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 77:24:@3871.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 77:24:@3871.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 77:24:@3871.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 77:24:@3871.4]
  wire [3:0] address; // @[wb_interconnect.scala 87:50:@3895.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 88:35:@3896.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 89:35:@3897.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 90:35:@3898.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 91:35:@3899.4]
  wire  motor_addr_match; // @[wb_interconnect.scala 92:35:@3900.4]
  reg  imem_sel; // @[wb_interconnect.scala 117:22:@3932.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 118:22:@3933.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 119:22:@3934.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 120:22:@3935.4]
  reg [31:0] _RAND_3;
  reg  motor_sel; // @[wb_interconnect.scala 121:22:@3936.4]
  reg [31:0] _RAND_4;
  wire [31:0] _T_92; // @[wb_interconnect.scala 133:41:@3947.4]
  wire [31:0] _T_93; // @[wb_interconnect.scala 132:39:@3948.4]
  wire [31:0] _T_94; // @[wb_interconnect.scala 131:37:@3949.4]
  wire [31:0] _T_95; // @[wb_interconnect.scala 130:35:@3950.4]
  wire  _T_98; // @[wb_interconnect.scala 138:41:@3953.4]
  wire  _T_99; // @[wb_interconnect.scala 137:39:@3954.4]
  wire  _T_100; // @[wb_interconnect.scala 136:37:@3955.4]
  wire  _T_101; // @[wb_interconnect.scala 135:35:@3956.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 73:24:@3859.4]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .io_wbs_m2s_addr(dmem_io_wbs_m2s_addr),
    .io_wbs_m2s_data(dmem_io_wbs_m2s_data),
    .io_wbs_m2s_we(dmem_io_wbs_m2s_we),
    .io_wbs_m2s_sel(dmem_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(dmem_io_wbs_m2s_stb),
    .io_wbs_ack_o(dmem_io_wbs_ack_o),
    .io_wbs_data_o(dmem_io_wbs_data_o),
    .io_dmem_io_addr(dmem_io_dmem_io_addr),
    .io_dmem_io_wdata(dmem_io_dmem_io_wdata),
    .io_dmem_io_rdata(dmem_io_dmem_io_rdata),
    .io_dmem_io_wr_en(dmem_io_dmem_io_wr_en),
    .io_dmem_io_st_type(dmem_io_dmem_io_st_type)
  );
  IMem_Interface imem ( // @[wb_interconnect.scala 74:24:@3862.4]
    .clock(imem_clock),
    .reset(imem_reset),
    .io_ibus_addr(imem_io_ibus_addr),
    .io_ibus_inst(imem_io_ibus_inst),
    .io_ibus_valid(imem_io_ibus_valid),
    .io_wbs_m2s_addr(imem_io_wbs_m2s_addr),
    .io_wbs_m2s_data(imem_io_wbs_m2s_data),
    .io_wbs_m2s_we(imem_io_wbs_m2s_we),
    .io_wbs_m2s_sel(imem_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(imem_io_wbs_m2s_stb),
    .io_wbs_ack_o(imem_io_wbs_ack_o),
    .io_wbs_data_o(imem_io_wbs_data_o),
    .io_imem_io_addr(imem_io_imem_io_addr),
    .io_imem_io_rdata(imem_io_imem_io_rdata),
    .io_imem_io_wdata(imem_io_imem_io_wdata),
    .io_imem_io_wr_en(imem_io_imem_io_wr_en)
  );
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 75:24:@3865.4]
    .io_dbus_addr(wbm_dbus_io_dbus_addr),
    .io_dbus_wdata(wbm_dbus_io_dbus_wdata),
    .io_dbus_rdata(wbm_dbus_io_dbus_rdata),
    .io_dbus_rd_en(wbm_dbus_io_dbus_rd_en),
    .io_dbus_wr_en(wbm_dbus_io_dbus_wr_en),
    .io_dbus_st_type(wbm_dbus_io_dbus_st_type),
    .io_dbus_ld_type(wbm_dbus_io_dbus_ld_type),
    .io_dbus_valid(wbm_dbus_io_dbus_valid),
    .io_wbm_m2s_addr(wbm_dbus_io_wbm_m2s_addr),
    .io_wbm_m2s_data(wbm_dbus_io_wbm_m2s_data),
    .io_wbm_m2s_we(wbm_dbus_io_wbm_m2s_we),
    .io_wbm_m2s_sel(wbm_dbus_io_wbm_m2s_sel),
    .io_wbm_m2s_stb(wbm_dbus_io_wbm_m2s_stb),
    .io_wbm_ack_i(wbm_dbus_io_wbm_ack_i),
    .io_wbm_data_i(wbm_dbus_io_wbm_data_i)
  );
  UART uart ( // @[wb_interconnect.scala 76:24:@3868.4]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_uart_select(uart_io_uart_select),
    .io_txd(uart_io_txd),
    .io_rxd(uart_io_rxd),
    .io_uartInt(uart_io_uartInt),
    .io_wbs_m2s_addr(uart_io_wbs_m2s_addr),
    .io_wbs_m2s_data(uart_io_wbs_m2s_data),
    .io_wbs_m2s_we(uart_io_wbs_m2s_we),
    .io_wbs_m2s_stb(uart_io_wbs_m2s_stb),
    .io_wbs_ack_o(uart_io_wbs_ack_o),
    .io_wbs_data_o(uart_io_wbs_data_o)
  );
  SPI spi ( // @[wb_interconnect.scala 77:24:@3871.4]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_spi_select(spi_io_spi_select),
    .io_spi_cs(spi_io_spi_cs),
    .io_spi_clk(spi_io_spi_clk),
    .io_spi_mosi(spi_io_spi_mosi),
    .io_spi_miso(spi_io_spi_miso),
    .io_spi_intr(spi_io_spi_intr),
    .io_wbs_m2s_addr(spi_io_wbs_m2s_addr),
    .io_wbs_m2s_data(spi_io_wbs_m2s_data),
    .io_wbs_m2s_we(spi_io_wbs_m2s_we),
    .io_wbs_m2s_stb(spi_io_wbs_m2s_stb),
    .io_wbs_ack_o(spi_io_wbs_ack_o),
    .io_wbs_data_o(spi_io_wbs_data_o)
  );
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 87:50:@3895.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 88:35:@3896.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 89:35:@3897.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 90:35:@3898.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 91:35:@3899.4]
  assign motor_addr_match = address == 4'h4; // @[wb_interconnect.scala 92:35:@3900.4]
  assign _T_92 = motor_sel ? io_motor_data_i : 32'h0; // @[wb_interconnect.scala 133:41:@3947.4]
  assign _T_93 = spi_sel ? spi_io_wbs_data_o : _T_92; // @[wb_interconnect.scala 132:39:@3948.4]
  assign _T_94 = uart_sel ? uart_io_wbs_data_o : _T_93; // @[wb_interconnect.scala 131:37:@3949.4]
  assign _T_95 = imem_sel ? imem_io_wbs_data_o : _T_94; // @[wb_interconnect.scala 130:35:@3950.4]
  assign _T_98 = motor_sel ? io_motor_ack_i : 1'h0; // @[wb_interconnect.scala 138:41:@3953.4]
  assign _T_99 = spi_sel ? spi_io_wbs_ack_o : _T_98; // @[wb_interconnect.scala 137:39:@3954.4]
  assign _T_100 = uart_sel ? uart_io_wbs_ack_o : _T_99; // @[wb_interconnect.scala 136:37:@3955.4]
  assign _T_101 = imem_sel ? imem_io_wbs_ack_o : _T_100; // @[wb_interconnect.scala 135:35:@3956.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 80:20:@3879.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 80:20:@3874.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 81:20:@3883.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 81:20:@3882.4]
  assign io_imem_io_addr = imem_io_imem_io_addr; // @[wb_interconnect.scala 83:20:@3889.4]
  assign io_imem_io_wdata = imem_io_imem_io_wdata; // @[wb_interconnect.scala 83:20:@3887.4]
  assign io_imem_io_wr_en = imem_io_imem_io_wr_en; // @[wb_interconnect.scala 83:20:@3886.4]
  assign io_dmem_io_addr = dmem_io_dmem_io_addr; // @[wb_interconnect.scala 84:20:@3894.4]
  assign io_dmem_io_wdata = dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 84:20:@3893.4]
  assign io_dmem_io_wr_en = dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 84:20:@3891.4]
  assign io_dmem_io_st_type = dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 84:20:@3890.4]
  assign io_wbm_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 114:14:@3931.4]
  assign io_wbm_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 114:14:@3930.4]
  assign io_wbm_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 114:14:@3929.4]
  assign io_wbm_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 114:14:@3928.4]
  assign io_wbm_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 114:14:@3927.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 144:24:@3961.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 145:24:@3962.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 150:24:@3965.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 151:24:@3966.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 152:24:@3967.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 153:24:@3968.4]
  assign io_motor_addr_sel = address == 4'h4; // @[wb_interconnect.scala 95:21:@3901.4]
  assign dmem_clock = clock; // @[:@3860.4]
  assign dmem_reset = reset; // @[:@3861.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 100:20:@3907.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 100:20:@3906.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 100:20:@3905.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 100:20:@3904.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 100:20:@3903.4]
  assign dmem_io_dmem_io_rdata = io_dmem_io_rdata; // @[wb_interconnect.scala 84:20:@3892.4]
  assign imem_clock = clock; // @[:@3863.4]
  assign imem_reset = reset; // @[:@3864.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 81:20:@3884.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 104:20:@3913.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 104:20:@3912.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 104:20:@3911.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 104:20:@3910.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 104:20:@3909.4]
  assign imem_io_imem_io_rdata = io_imem_io_rdata; // @[wb_interconnect.scala 83:20:@3888.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 80:20:@3881.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 80:20:@3880.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 80:20:@3878.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 80:20:@3877.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 80:20:@3876.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 80:20:@3875.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_101; // @[wb_interconnect.scala 134:26:@3958.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_95; // @[wb_interconnect.scala 129:26:@3952.4]
  assign uart_clock = clock; // @[:@3869.4]
  assign uart_reset = reset; // @[:@3870.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 142:24:@3959.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 143:24:@3960.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 107:20:@3919.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 107:20:@3918.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 107:20:@3917.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 107:20:@3915.4]
  assign spi_clock = clock; // @[:@3872.4]
  assign spi_reset = reset; // @[:@3873.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 148:24:@3963.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 149:24:@3964.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 110:19:@3925.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 110:19:@3924.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 110:19:@3923.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 110:19:@3921.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  imem_sel = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dmem_sel = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  uart_sel = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  spi_sel = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  motor_sel = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    imem_sel <= imem_addr_match & imem_io_wbs_m2s_stb;
    dmem_sel <= dmem_addr_match & dmem_io_wbs_m2s_stb;
    uart_sel <= uart_addr_match & uart_io_wbs_m2s_stb;
    spi_sel <= spi_addr_match & spi_io_wbs_m2s_stb;
    motor_sel <= motor_addr_match & io_wbm_m2s_stb;
  end
endmodule

module DMem_Interface( // @[:@1882.2]
  input         clock, // @[:@1883.4]
  input         reset, // @[:@1884.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@1885.4]
  input  [31:0] io_wbs_m2s_data, // @[:@1885.4]
  input         io_wbs_m2s_we, // @[:@1885.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@1885.4]
  input         io_wbs_m2s_stb, // @[:@1885.4]
  output        io_wbs_ack_o, // @[:@1885.4]
  output [31:0] io_wbs_data_o, // @[:@1885.4]
  output [7:0]  io_dmem_io_addr, // @[:@1885.4]
  output [31:0] io_dmem_io_wdata, // @[:@1885.4]
  input  [31:0] io_dmem_io_rdata, // @[:@1885.4]
  output        io_dmem_io_wr_en, // @[:@1885.4]
  output [3:0]  io_dmem_io_st_type // @[:@1885.4]
);
  wire [3:0] _T_45; // @[dmem_interface.scala 49:41:@1887.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 49:79:@1888.4]
  wire  dmem_select; // @[dmem_interface.scala 51:41:@1889.4]
  wire  _T_52; // @[dmem_interface.scala 52:26:@1890.4]
  wire  _T_54; // @[dmem_interface.scala 56:42:@1895.4]
  reg  ack2; // @[dmem_interface.scala 60:28:@1899.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 61:49:@1901.4]
  wire  _GEN_0; // @[dmem_interface.scala 63:21:@1902.4]
  reg  ack; // @[dmem_interface.scala 67:28:@1906.4]
  reg [31:0] _RAND_1;
  reg  rd_resp; // @[dmem_interface.scala 72:24:@1911.4]
  reg [31:0] _RAND_2;
  assign _T_45 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 49:41:@1887.4]
  assign dmem_addr_match = _T_45 == 4'h1; // @[dmem_interface.scala 49:79:@1888.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 51:41:@1889.4]
  assign _T_52 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 52:26:@1890.4]
  assign _T_54 = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 56:42:@1895.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 61:49:@1901.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 63:21:@1902.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 69:18:@1910.4]
  assign io_wbs_data_o = rd_resp ? io_dmem_io_rdata : 32'h0; // @[dmem_interface.scala 74:18:@1914.4]
  assign io_dmem_io_addr = io_wbs_m2s_addr[7:0]; // @[dmem_interface.scala 54:23:@1893.4]
  assign io_dmem_io_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 55:23:@1894.4]
  assign io_dmem_io_wr_en = _T_54 == 1'h0; // @[dmem_interface.scala 56:23:@1897.4]
  assign io_dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 57:23:@1898.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ack2 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ack = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd_resp = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack2 <= 1'h0;
    end else begin
      if (dmem_res_en) begin
        ack2 <= io_wbs_m2s_stb;
      end
    end
    if (reset) begin
      ack <= 1'h0;
    end else begin
      ack <= io_wbs_m2s_stb;
    end
    rd_resp <= _T_52 & dmem_select;
  end
endmodule

module IMem_Interface( // @[:@3015.2]
  input         clock, // @[:@3016.4]
  input         reset, // @[:@3017.4]
  input  [31:0] io_ibus_addr, // @[:@3018.4]
  output [31:0] io_ibus_inst, // @[:@3018.4]
  output        io_ibus_valid, // @[:@3018.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3018.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3018.4]
  input         io_wbs_m2s_we, // @[:@3018.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3018.4]
  input         io_wbs_m2s_stb, // @[:@3018.4]
  output        io_wbs_ack_o, // @[:@3018.4]
  output [31:0] io_wbs_data_o, // @[:@3018.4]
  output [31:0] io_imem_io_addr, // @[:@3018.4]
  input  [31:0] io_imem_io_rdata, // @[:@3018.4]
  output [31:0] io_imem_io_wdata, // @[:@3018.4]
  output        io_imem_io_wr_en // @[:@3018.4]
);
  wire  bmem_clock; // @[imem_interface.scala 51:20:@3020.4]
  wire  bmem_reset; // @[imem_interface.scala 51:20:@3020.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 51:20:@3020.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 51:20:@3020.4]
  wire [11:0] ibus_imem_addr; // @[imem_interface.scala 57:41:@3023.4]
  wire [11:0] wbs_imem_addr; // @[imem_interface.scala 59:44:@3025.4]
  reg  ack; // @[imem_interface.scala 64:31:@3026.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 65:27:@3027.4]
  reg [31:0] _RAND_1;
  wire  _T_55; // @[imem_interface.scala 67:24:@3028.4]
  wire  wb_rd_en; // @[imem_interface.scala 67:39:@3029.4]
  wire  wb_wr_en; // @[imem_interface.scala 68:38:@3030.4]
  wire [3:0] _T_56; // @[imem_interface.scala 73:46:@3031.4]
  wire  _T_58; // @[imem_interface.scala 73:84:@3032.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 73:29:@3033.4]
  wire  imem_wbs_write; // @[imem_interface.scala 74:46:@3034.4]
  wire  _T_62; // @[imem_interface.scala 80:33:@3037.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 80:46:@3038.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 81:32:@3040.4]
  reg [31:0] _RAND_2;
  wire  _T_67; // @[imem_interface.scala 82:22:@3041.4]
  wire [11:0] imem_addr; // @[imem_interface.scala 90:27:@3047.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 102:23:@3053.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 102:23:@3053.4]
  wire  _GEN_2; // @[imem_interface.scala 108:20:@3059.4]
  wire  _T_76; // @[imem_interface.scala 116:18:@3065.4]
  wire [7:0] _T_77; // @[imem_interface.scala 117:33:@3067.6]
  wire  _T_78; // @[imem_interface.scala 118:24:@3071.6]
  wire [7:0] _T_79; // @[imem_interface.scala 119:33:@3073.8]
  wire  _T_80; // @[imem_interface.scala 120:24:@3077.8]
  wire [7:0] _T_81; // @[imem_interface.scala 121:33:@3079.10]
  wire  _T_82; // @[imem_interface.scala 122:24:@3083.10]
  wire [7:0] _T_83; // @[imem_interface.scala 123:33:@3085.12]
  wire  _T_84; // @[imem_interface.scala 124:24:@3089.12]
  wire [15:0] _T_85; // @[imem_interface.scala 125:33:@3091.14]
  wire  _T_86; // @[imem_interface.scala 126:24:@3095.14]
  wire [15:0] _T_87; // @[imem_interface.scala 127:33:@3097.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 126:54:@3096.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 124:52:@3090.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 122:52:@3084.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 120:52:@3078.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 118:52:@3072.6]
  reg  bmem_ibus_sel; // @[imem_interface.scala 137:31:@3106.4]
  reg [31:0] _RAND_3;
  wire [3:0] _T_91; // @[imem_interface.scala 138:34:@3107.4]
  wire  _T_93; // @[imem_interface.scala 138:66:@3108.4]
  BMem bmem ( // @[imem_interface.scala 51:20:@3020.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[11:0]; // @[imem_interface.scala 57:41:@3023.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[11:0]; // @[imem_interface.scala 59:44:@3025.4]
  assign _T_55 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 67:24:@3028.4]
  assign wb_rd_en = _T_55 & io_wbs_m2s_stb; // @[imem_interface.scala 67:39:@3029.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 68:38:@3030.4]
  assign _T_56 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 73:46:@3031.4]
  assign _T_58 = _T_56 != 4'h0; // @[imem_interface.scala 73:84:@3032.4]
  assign imem_wbs_addr_match = _T_58 == 1'h0; // @[imem_interface.scala 73:29:@3033.4]
  assign imem_wbs_write = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 74:46:@3034.4]
  assign _T_62 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 80:33:@3037.4]
  assign imem_wbs_sel = _T_62 & imem_wbs_addr_match; // @[imem_interface.scala 80:46:@3038.4]
  assign _T_67 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 82:22:@3041.4]
  assign imem_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 90:27:@3047.4]
  assign rd_imem_inst = imem_ibus_valid ? io_imem_io_rdata : 32'h0; // @[imem_interface.scala 102:23:@3053.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : io_imem_io_rdata; // @[imem_interface.scala 102:23:@3053.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 108:20:@3059.4]
  assign _T_76 = wb_select == 4'h1; // @[imem_interface.scala 116:18:@3065.4]
  assign _T_77 = rd_imem_const[7:0]; // @[imem_interface.scala 117:33:@3067.6]
  assign _T_78 = wb_select == 4'h2; // @[imem_interface.scala 118:24:@3071.6]
  assign _T_79 = rd_imem_const[15:8]; // @[imem_interface.scala 119:33:@3073.8]
  assign _T_80 = wb_select == 4'h4; // @[imem_interface.scala 120:24:@3077.8]
  assign _T_81 = rd_imem_const[23:16]; // @[imem_interface.scala 121:33:@3079.10]
  assign _T_82 = wb_select == 4'h8; // @[imem_interface.scala 122:24:@3083.10]
  assign _T_83 = rd_imem_const[31:24]; // @[imem_interface.scala 123:33:@3085.12]
  assign _T_84 = wb_select == 4'h3; // @[imem_interface.scala 124:24:@3089.12]
  assign _T_85 = rd_imem_const[15:0]; // @[imem_interface.scala 125:33:@3091.14]
  assign _T_86 = wb_select == 4'hc; // @[imem_interface.scala 126:24:@3095.14]
  assign _T_87 = rd_imem_const[31:16]; // @[imem_interface.scala 127:33:@3097.16]
  assign _GEN_3 = _T_86 ? {{16'd0}, _T_87} : rd_imem_const; // @[imem_interface.scala 126:54:@3096.14]
  assign _GEN_4 = _T_84 ? {{16'd0}, _T_85} : _GEN_3; // @[imem_interface.scala 124:52:@3090.12]
  assign _GEN_5 = _T_82 ? {{24'd0}, _T_83} : _GEN_4; // @[imem_interface.scala 122:52:@3084.10]
  assign _GEN_6 = _T_80 ? {{24'd0}, _T_81} : _GEN_5; // @[imem_interface.scala 120:52:@3078.8]
  assign _GEN_7 = _T_78 ? {{24'd0}, _T_79} : _GEN_6; // @[imem_interface.scala 118:52:@3072.6]
  assign _T_91 = io_ibus_addr[15:12]; // @[imem_interface.scala 138:34:@3107.4]
  assign _T_93 = _T_91 == 4'h7; // @[imem_interface.scala 138:66:@3108.4]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 147:19:@3112.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 148:19:@3114.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 133:18:@3104.4]
  assign io_wbs_data_o = _T_76 ? {{24'd0}, _T_77} : _GEN_7; // @[imem_interface.scala 134:18:@3105.4]
  assign io_imem_io_addr = {{20'd0}, imem_addr}; // @[imem_interface.scala 91:19:@3048.4]
  assign io_imem_io_wdata = io_wbs_m2s_data; // @[imem_interface.scala 97:20:@3049.4]
  assign io_imem_io_wr_en = imem_wbs_write == 1'h0; // @[imem_interface.scala 98:20:@3051.4]
  assign bmem_clock = clock; // @[:@3021.4]
  assign bmem_reset = reset; // @[:@3022.4]
  assign bmem_io_bmem_addr = {{20'd0}, ibus_imem_addr}; // @[imem_interface.scala 140:21:@3110.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ack = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wb_select = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  imem_ibus_valid = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  bmem_ibus_sel = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack <= 1'h1;
    end else begin
      if (imem_wbs_sel) begin
        ack <= io_wbs_m2s_stb;
      end
    end
    wb_select <= io_wbs_m2s_sel;
    if (reset) begin
      imem_ibus_valid <= 1'h1;
    end else begin
      imem_ibus_valid <= _T_67;
    end
    if (reset) begin
      bmem_ibus_sel <= 1'h0;
    end else begin
      bmem_ibus_sel <= _T_93;
    end
  end
endmodule

module BMem( // @[:@1916.2]
  input         clock, // @[:@1917.4]
  input         reset, // @[:@1918.4]
  input  [31:0] io_bmem_addr, // @[:@1919.4]
  output [31:0] io_bmem_rdata // @[:@1919.4]
);
  wire [9:0] _T_9; // @[BMEM.scala 24:26:@1921.4]
  wire [9:0] addr; // @[BMEM.scala 24:33:@1922.4]
  reg [31:0] bmem_data; // @[BMEM.scala 25:26:@1923.4]
  reg [31:0] _RAND_0;
  wire  _T_14; // @[Conditional.scala 37:30:@1924.4]
  wire  _T_17; // @[Conditional.scala 37:30:@1929.6]
  wire  _T_20; // @[Conditional.scala 37:30:@1934.8]
  wire  _T_23; // @[Conditional.scala 37:30:@1939.10]
  wire  _T_26; // @[Conditional.scala 37:30:@1944.12]
  wire  _T_29; // @[Conditional.scala 37:30:@1949.14]
  wire  _T_32; // @[Conditional.scala 37:30:@1954.16]
  wire  _T_35; // @[Conditional.scala 37:30:@1959.18]
  wire  _T_38; // @[Conditional.scala 37:30:@1964.20]
  wire  _T_41; // @[Conditional.scala 37:30:@1969.22]
  wire  _T_44; // @[Conditional.scala 37:30:@1974.24]
  wire  _T_47; // @[Conditional.scala 37:30:@1979.26]
  wire  _T_50; // @[Conditional.scala 37:30:@1984.28]
  wire  _T_53; // @[Conditional.scala 37:30:@1989.30]
  wire  _T_56; // @[Conditional.scala 37:30:@1994.32]
  wire  _T_59; // @[Conditional.scala 37:30:@1999.34]
  wire  _T_62; // @[Conditional.scala 37:30:@2004.36]
  wire  _T_65; // @[Conditional.scala 37:30:@2009.38]
  wire  _T_68; // @[Conditional.scala 37:30:@2014.40]
  wire  _T_71; // @[Conditional.scala 37:30:@2019.42]
  wire  _T_74; // @[Conditional.scala 37:30:@2024.44]
  wire  _T_77; // @[Conditional.scala 37:30:@2029.46]
  wire  _T_80; // @[Conditional.scala 37:30:@2034.48]
  wire  _T_83; // @[Conditional.scala 37:30:@2039.50]
  wire  _T_86; // @[Conditional.scala 37:30:@2044.52]
  wire  _T_89; // @[Conditional.scala 37:30:@2049.54]
  wire  _T_92; // @[Conditional.scala 37:30:@2054.56]
  wire  _T_95; // @[Conditional.scala 37:30:@2059.58]
  wire  _T_98; // @[Conditional.scala 37:30:@2064.60]
  wire  _T_101; // @[Conditional.scala 37:30:@2069.62]
  wire  _T_104; // @[Conditional.scala 37:30:@2074.64]
  wire  _T_107; // @[Conditional.scala 37:30:@2079.66]
  wire  _T_110; // @[Conditional.scala 37:30:@2084.68]
  wire  _T_113; // @[Conditional.scala 37:30:@2089.70]
  wire  _T_116; // @[Conditional.scala 37:30:@2094.72]
  wire  _T_119; // @[Conditional.scala 37:30:@2099.74]
  wire  _T_122; // @[Conditional.scala 37:30:@2104.76]
  wire  _T_125; // @[Conditional.scala 37:30:@2109.78]
  wire  _T_128; // @[Conditional.scala 37:30:@2114.80]
  wire  _T_131; // @[Conditional.scala 37:30:@2119.82]
  wire  _T_134; // @[Conditional.scala 37:30:@2124.84]
  wire  _T_137; // @[Conditional.scala 37:30:@2129.86]
  wire  _T_140; // @[Conditional.scala 37:30:@2134.88]
  wire  _T_143; // @[Conditional.scala 37:30:@2139.90]
  wire  _T_146; // @[Conditional.scala 37:30:@2144.92]
  wire  _T_149; // @[Conditional.scala 37:30:@2149.94]
  wire  _T_152; // @[Conditional.scala 37:30:@2154.96]
  wire  _T_155; // @[Conditional.scala 37:30:@2159.98]
  wire  _T_158; // @[Conditional.scala 37:30:@2164.100]
  wire  _T_161; // @[Conditional.scala 37:30:@2169.102]
  wire  _T_164; // @[Conditional.scala 37:30:@2174.104]
  wire  _T_167; // @[Conditional.scala 37:30:@2179.106]
  wire  _T_170; // @[Conditional.scala 37:30:@2184.108]
  wire  _T_173; // @[Conditional.scala 37:30:@2189.110]
  wire  _T_176; // @[Conditional.scala 37:30:@2194.112]
  wire  _T_179; // @[Conditional.scala 37:30:@2199.114]
  wire  _T_182; // @[Conditional.scala 37:30:@2204.116]
  wire  _T_185; // @[Conditional.scala 37:30:@2209.118]
  wire  _T_188; // @[Conditional.scala 37:30:@2214.120]
  wire  _T_191; // @[Conditional.scala 37:30:@2219.122]
  wire  _T_194; // @[Conditional.scala 37:30:@2224.124]
  wire  _T_197; // @[Conditional.scala 37:30:@2229.126]
  wire  _T_200; // @[Conditional.scala 37:30:@2234.128]
  wire  _T_203; // @[Conditional.scala 37:30:@2239.130]
  wire  _T_206; // @[Conditional.scala 37:30:@2244.132]
  wire  _T_209; // @[Conditional.scala 37:30:@2249.134]
  wire  _T_212; // @[Conditional.scala 37:30:@2254.136]
  wire  _T_215; // @[Conditional.scala 37:30:@2259.138]
  wire  _T_218; // @[Conditional.scala 37:30:@2264.140]
  wire  _T_221; // @[Conditional.scala 37:30:@2269.142]
  wire  _T_224; // @[Conditional.scala 37:30:@2274.144]
  wire  _T_227; // @[Conditional.scala 37:30:@2279.146]
  wire  _T_230; // @[Conditional.scala 37:30:@2284.148]
  wire  _T_233; // @[Conditional.scala 37:30:@2289.150]
  wire  _T_236; // @[Conditional.scala 37:30:@2294.152]
  wire  _T_239; // @[Conditional.scala 37:30:@2299.154]
  wire  _T_242; // @[Conditional.scala 37:30:@2304.156]
  wire  _T_245; // @[Conditional.scala 37:30:@2309.158]
  wire  _T_248; // @[Conditional.scala 37:30:@2314.160]
  wire  _T_251; // @[Conditional.scala 37:30:@2319.162]
  wire  _T_254; // @[Conditional.scala 37:30:@2324.164]
  wire  _T_257; // @[Conditional.scala 37:30:@2329.166]
  wire  _T_260; // @[Conditional.scala 37:30:@2334.168]
  wire  _T_263; // @[Conditional.scala 37:30:@2339.170]
  wire  _T_266; // @[Conditional.scala 37:30:@2344.172]
  wire  _T_269; // @[Conditional.scala 37:30:@2349.174]
  wire  _T_272; // @[Conditional.scala 37:30:@2354.176]
  wire  _T_275; // @[Conditional.scala 37:30:@2359.178]
  wire  _T_278; // @[Conditional.scala 37:30:@2364.180]
  wire  _T_281; // @[Conditional.scala 37:30:@2369.182]
  wire  _T_284; // @[Conditional.scala 37:30:@2374.184]
  wire  _T_287; // @[Conditional.scala 37:30:@2379.186]
  wire  _T_290; // @[Conditional.scala 37:30:@2384.188]
  wire  _T_293; // @[Conditional.scala 37:30:@2389.190]
  wire  _T_296; // @[Conditional.scala 37:30:@2394.192]
  wire  _T_299; // @[Conditional.scala 37:30:@2399.194]
  wire  _T_302; // @[Conditional.scala 37:30:@2404.196]
  wire  _T_305; // @[Conditional.scala 37:30:@2409.198]
  wire  _T_308; // @[Conditional.scala 37:30:@2414.200]
  wire  _T_311; // @[Conditional.scala 37:30:@2419.202]
  wire  _T_314; // @[Conditional.scala 37:30:@2424.204]
  wire  _T_317; // @[Conditional.scala 37:30:@2429.206]
  wire  _T_320; // @[Conditional.scala 37:30:@2434.208]
  wire  _T_323; // @[Conditional.scala 37:30:@2439.210]
  wire  _T_326; // @[Conditional.scala 37:30:@2444.212]
  wire  _T_329; // @[Conditional.scala 37:30:@2449.214]
  wire  _T_332; // @[Conditional.scala 37:30:@2454.216]
  wire  _T_335; // @[Conditional.scala 37:30:@2459.218]
  wire  _T_338; // @[Conditional.scala 37:30:@2464.220]
  wire  _T_341; // @[Conditional.scala 37:30:@2469.222]
  wire  _T_344; // @[Conditional.scala 37:30:@2474.224]
  wire  _T_347; // @[Conditional.scala 37:30:@2479.226]
  wire  _T_350; // @[Conditional.scala 37:30:@2484.228]
  wire  _T_353; // @[Conditional.scala 37:30:@2489.230]
  wire  _T_356; // @[Conditional.scala 37:30:@2494.232]
  wire  _T_359; // @[Conditional.scala 37:30:@2499.234]
  wire  _T_362; // @[Conditional.scala 37:30:@2504.236]
  wire  _T_365; // @[Conditional.scala 37:30:@2509.238]
  wire  _T_368; // @[Conditional.scala 37:30:@2514.240]
  wire  _T_371; // @[Conditional.scala 37:30:@2519.242]
  wire  _T_374; // @[Conditional.scala 37:30:@2524.244]
  wire  _T_377; // @[Conditional.scala 37:30:@2529.246]
  wire  _T_380; // @[Conditional.scala 37:30:@2534.248]
  wire  _T_383; // @[Conditional.scala 37:30:@2539.250]
  wire  _T_386; // @[Conditional.scala 37:30:@2544.252]
  wire  _T_389; // @[Conditional.scala 37:30:@2549.254]
  wire  _T_392; // @[Conditional.scala 37:30:@2554.256]
  wire  _T_395; // @[Conditional.scala 37:30:@2559.258]
  wire  _T_398; // @[Conditional.scala 37:30:@2564.260]
  wire  _T_401; // @[Conditional.scala 37:30:@2569.262]
  wire  _T_404; // @[Conditional.scala 37:30:@2574.264]
  wire  _T_407; // @[Conditional.scala 37:30:@2579.266]
  wire  _T_410; // @[Conditional.scala 37:30:@2584.268]
  wire  _T_413; // @[Conditional.scala 37:30:@2589.270]
  wire  _T_416; // @[Conditional.scala 37:30:@2594.272]
  wire  _T_419; // @[Conditional.scala 37:30:@2599.274]
  wire  _T_422; // @[Conditional.scala 37:30:@2604.276]
  wire  _T_425; // @[Conditional.scala 37:30:@2609.278]
  wire  _T_428; // @[Conditional.scala 37:30:@2614.280]
  wire  _T_431; // @[Conditional.scala 37:30:@2619.282]
  wire  _T_434; // @[Conditional.scala 37:30:@2624.284]
  wire  _T_437; // @[Conditional.scala 37:30:@2629.286]
  wire  _T_440; // @[Conditional.scala 37:30:@2634.288]
  wire  _T_443; // @[Conditional.scala 37:30:@2639.290]
  wire  _T_446; // @[Conditional.scala 37:30:@2644.292]
  wire  _T_449; // @[Conditional.scala 37:30:@2649.294]
  wire  _T_452; // @[Conditional.scala 37:30:@2654.296]
  wire  _T_455; // @[Conditional.scala 37:30:@2659.298]
  wire  _T_458; // @[Conditional.scala 37:30:@2664.300]
  wire  _T_461; // @[Conditional.scala 37:30:@2669.302]
  wire  _T_464; // @[Conditional.scala 37:30:@2674.304]
  wire  _T_467; // @[Conditional.scala 37:30:@2679.306]
  wire  _T_470; // @[Conditional.scala 37:30:@2684.308]
  wire  _T_473; // @[Conditional.scala 37:30:@2689.310]
  wire  _T_476; // @[Conditional.scala 37:30:@2694.312]
  wire  _T_479; // @[Conditional.scala 37:30:@2699.314]
  wire  _T_482; // @[Conditional.scala 37:30:@2704.316]
  wire  _T_485; // @[Conditional.scala 37:30:@2709.318]
  wire  _T_488; // @[Conditional.scala 37:30:@2714.320]
  wire  _T_491; // @[Conditional.scala 37:30:@2719.322]
  wire  _T_494; // @[Conditional.scala 37:30:@2724.324]
  wire  _T_497; // @[Conditional.scala 37:30:@2729.326]
  wire  _T_500; // @[Conditional.scala 37:30:@2734.328]
  wire  _T_503; // @[Conditional.scala 37:30:@2739.330]
  wire  _T_506; // @[Conditional.scala 37:30:@2744.332]
  wire  _T_509; // @[Conditional.scala 37:30:@2749.334]
  wire  _T_512; // @[Conditional.scala 37:30:@2754.336]
  wire  _T_515; // @[Conditional.scala 37:30:@2759.338]
  wire  _T_518; // @[Conditional.scala 37:30:@2764.340]
  wire  _T_521; // @[Conditional.scala 37:30:@2769.342]
  wire  _T_524; // @[Conditional.scala 37:30:@2774.344]
  wire  _T_527; // @[Conditional.scala 37:30:@2779.346]
  wire  _T_530; // @[Conditional.scala 37:30:@2784.348]
  wire  _T_533; // @[Conditional.scala 37:30:@2789.350]
  wire  _T_536; // @[Conditional.scala 37:30:@2794.352]
  wire  _T_539; // @[Conditional.scala 37:30:@2799.354]
  wire  _T_542; // @[Conditional.scala 37:30:@2804.356]
  wire  _T_545; // @[Conditional.scala 37:30:@2809.358]
  wire  _T_548; // @[Conditional.scala 37:30:@2814.360]
  wire  _T_551; // @[Conditional.scala 37:30:@2819.362]
  wire  _T_554; // @[Conditional.scala 37:30:@2824.364]
  wire  _T_557; // @[Conditional.scala 37:30:@2829.366]
  wire  _T_560; // @[Conditional.scala 37:30:@2834.368]
  wire  _T_563; // @[Conditional.scala 37:30:@2839.370]
  wire  _T_566; // @[Conditional.scala 37:30:@2844.372]
  wire  _T_569; // @[Conditional.scala 37:30:@2849.374]
  wire  _T_572; // @[Conditional.scala 37:30:@2854.376]
  wire  _T_575; // @[Conditional.scala 37:30:@2859.378]
  wire  _T_578; // @[Conditional.scala 37:30:@2864.380]
  wire  _T_581; // @[Conditional.scala 37:30:@2869.382]
  wire  _T_584; // @[Conditional.scala 37:30:@2874.384]
  wire  _T_587; // @[Conditional.scala 37:30:@2879.386]
  wire  _T_590; // @[Conditional.scala 37:30:@2884.388]
  wire  _T_593; // @[Conditional.scala 37:30:@2889.390]
  wire  _T_596; // @[Conditional.scala 37:30:@2894.392]
  wire  _T_599; // @[Conditional.scala 37:30:@2899.394]
  wire  _T_602; // @[Conditional.scala 37:30:@2904.396]
  wire  _T_605; // @[Conditional.scala 37:30:@2909.398]
  wire  _T_608; // @[Conditional.scala 37:30:@2914.400]
  wire  _T_611; // @[Conditional.scala 37:30:@2919.402]
  wire  _T_614; // @[Conditional.scala 37:30:@2924.404]
  wire  _T_617; // @[Conditional.scala 37:30:@2929.406]
  wire  _T_620; // @[Conditional.scala 37:30:@2934.408]
  wire  _T_623; // @[Conditional.scala 37:30:@2939.410]
  wire  _T_626; // @[Conditional.scala 37:30:@2944.412]
  wire  _T_629; // @[Conditional.scala 37:30:@2949.414]
  wire  _T_632; // @[Conditional.scala 37:30:@2954.416]
  wire  _T_635; // @[Conditional.scala 37:30:@2959.418]
  wire  _T_638; // @[Conditional.scala 37:30:@2964.420]
  wire  _T_641; // @[Conditional.scala 37:30:@2969.422]
  wire  _T_644; // @[Conditional.scala 37:30:@2974.424]
  wire  _T_647; // @[Conditional.scala 37:30:@2979.426]
  wire  _T_650; // @[Conditional.scala 37:30:@2984.428]
  wire  _T_653; // @[Conditional.scala 37:30:@2989.430]
  wire  _T_656; // @[Conditional.scala 37:30:@2994.432]
  wire  _T_659; // @[Conditional.scala 37:30:@2999.434]
  wire  _T_662; // @[Conditional.scala 37:30:@3004.436]
  wire  _T_665; // @[Conditional.scala 37:30:@3009.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3010.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3005.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3000.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@2995.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@2990.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@2985.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@2980.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@2975.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@2970.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@2965.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@2960.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@2955.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@2950.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@2945.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@2940.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@2935.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@2930.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@2925.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2920.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2915.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2910.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2905.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2900.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2895.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2890.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2885.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2880.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2875.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2870.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2865.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2860.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2855.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2850.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2845.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2840.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2835.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2830.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2825.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2820.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2815.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2810.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2805.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2800.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2795.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2790.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2785.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2780.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2775.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2770.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2765.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2760.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2755.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2750.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2745.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2740.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2735.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2730.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2725.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2720.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2715.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2710.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2705.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2700.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2695.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2690.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2685.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2680.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2675.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2670.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2665.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2660.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2655.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2650.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2645.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2640.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2635.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2630.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2625.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2620.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2615.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2610.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2605.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2600.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2595.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2590.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2585.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2580.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2575.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2570.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2565.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2560.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2555.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2550.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2545.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2540.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2535.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2530.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2525.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2520.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2515.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2510.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2505.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2500.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2495.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2490.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2485.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2480.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2475.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2470.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2465.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2460.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2455.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2450.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2445.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2440.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2435.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2430.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2425.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2420.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2415.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2410.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2405.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2400.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2395.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2390.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2385.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2380.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2375.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2370.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2365.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2360.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2355.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2350.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2345.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2340.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2335.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2330.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2325.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2320.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2315.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2310.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2305.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2300.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2295.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2290.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2285.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2280.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2275.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2270.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2265.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2260.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2255.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2250.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2245.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2240.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2235.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2230.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2225.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2220.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2215.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2210.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2205.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2200.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2195.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2190.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2185.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2180.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2175.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2170.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2165.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2160.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2155.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2150.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2145.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2140.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2135.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2130.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2125.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2120.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2115.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2110.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2105.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2100.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2095.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2090.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2085.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2080.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2075.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2070.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2065.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2060.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2055.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2050.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2045.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2040.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2035.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2030.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2025.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2020.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2015.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2010.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2005.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2000.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@1995.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@1990.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@1985.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@1980.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@1975.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@1970.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@1965.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@1960.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@1955.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@1950.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@1945.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@1940.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@1935.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@1930.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@1925.4]
  assign _T_9 = io_bmem_addr[9:0]; // @[BMEM.scala 24:26:@1921.4]
  assign addr = _T_9 / 10'h4; // @[BMEM.scala 24:33:@1922.4]
  assign _T_14 = 10'h0 == addr; // @[Conditional.scala 37:30:@1924.4]
  assign _T_17 = 10'h1 == addr; // @[Conditional.scala 37:30:@1929.6]
  assign _T_20 = 10'h2 == addr; // @[Conditional.scala 37:30:@1934.8]
  assign _T_23 = 10'h3 == addr; // @[Conditional.scala 37:30:@1939.10]
  assign _T_26 = 10'h4 == addr; // @[Conditional.scala 37:30:@1944.12]
  assign _T_29 = 10'h5 == addr; // @[Conditional.scala 37:30:@1949.14]
  assign _T_32 = 10'h6 == addr; // @[Conditional.scala 37:30:@1954.16]
  assign _T_35 = 10'h7 == addr; // @[Conditional.scala 37:30:@1959.18]
  assign _T_38 = 10'h8 == addr; // @[Conditional.scala 37:30:@1964.20]
  assign _T_41 = 10'h9 == addr; // @[Conditional.scala 37:30:@1969.22]
  assign _T_44 = 10'ha == addr; // @[Conditional.scala 37:30:@1974.24]
  assign _T_47 = 10'hb == addr; // @[Conditional.scala 37:30:@1979.26]
  assign _T_50 = 10'hc == addr; // @[Conditional.scala 37:30:@1984.28]
  assign _T_53 = 10'hd == addr; // @[Conditional.scala 37:30:@1989.30]
  assign _T_56 = 10'he == addr; // @[Conditional.scala 37:30:@1994.32]
  assign _T_59 = 10'hf == addr; // @[Conditional.scala 37:30:@1999.34]
  assign _T_62 = 10'h10 == addr; // @[Conditional.scala 37:30:@2004.36]
  assign _T_65 = 10'h11 == addr; // @[Conditional.scala 37:30:@2009.38]
  assign _T_68 = 10'h12 == addr; // @[Conditional.scala 37:30:@2014.40]
  assign _T_71 = 10'h13 == addr; // @[Conditional.scala 37:30:@2019.42]
  assign _T_74 = 10'h14 == addr; // @[Conditional.scala 37:30:@2024.44]
  assign _T_77 = 10'h15 == addr; // @[Conditional.scala 37:30:@2029.46]
  assign _T_80 = 10'h16 == addr; // @[Conditional.scala 37:30:@2034.48]
  assign _T_83 = 10'h17 == addr; // @[Conditional.scala 37:30:@2039.50]
  assign _T_86 = 10'h18 == addr; // @[Conditional.scala 37:30:@2044.52]
  assign _T_89 = 10'h19 == addr; // @[Conditional.scala 37:30:@2049.54]
  assign _T_92 = 10'h1a == addr; // @[Conditional.scala 37:30:@2054.56]
  assign _T_95 = 10'h1b == addr; // @[Conditional.scala 37:30:@2059.58]
  assign _T_98 = 10'h1c == addr; // @[Conditional.scala 37:30:@2064.60]
  assign _T_101 = 10'h1d == addr; // @[Conditional.scala 37:30:@2069.62]
  assign _T_104 = 10'h1e == addr; // @[Conditional.scala 37:30:@2074.64]
  assign _T_107 = 10'h1f == addr; // @[Conditional.scala 37:30:@2079.66]
  assign _T_110 = 10'h20 == addr; // @[Conditional.scala 37:30:@2084.68]
  assign _T_113 = 10'h21 == addr; // @[Conditional.scala 37:30:@2089.70]
  assign _T_116 = 10'h22 == addr; // @[Conditional.scala 37:30:@2094.72]
  assign _T_119 = 10'h23 == addr; // @[Conditional.scala 37:30:@2099.74]
  assign _T_122 = 10'h24 == addr; // @[Conditional.scala 37:30:@2104.76]
  assign _T_125 = 10'h25 == addr; // @[Conditional.scala 37:30:@2109.78]
  assign _T_128 = 10'h26 == addr; // @[Conditional.scala 37:30:@2114.80]
  assign _T_131 = 10'h27 == addr; // @[Conditional.scala 37:30:@2119.82]
  assign _T_134 = 10'h28 == addr; // @[Conditional.scala 37:30:@2124.84]
  assign _T_137 = 10'h29 == addr; // @[Conditional.scala 37:30:@2129.86]
  assign _T_140 = 10'h2a == addr; // @[Conditional.scala 37:30:@2134.88]
  assign _T_143 = 10'h2b == addr; // @[Conditional.scala 37:30:@2139.90]
  assign _T_146 = 10'h2c == addr; // @[Conditional.scala 37:30:@2144.92]
  assign _T_149 = 10'h2d == addr; // @[Conditional.scala 37:30:@2149.94]
  assign _T_152 = 10'h2e == addr; // @[Conditional.scala 37:30:@2154.96]
  assign _T_155 = 10'h2f == addr; // @[Conditional.scala 37:30:@2159.98]
  assign _T_158 = 10'h30 == addr; // @[Conditional.scala 37:30:@2164.100]
  assign _T_161 = 10'h31 == addr; // @[Conditional.scala 37:30:@2169.102]
  assign _T_164 = 10'h32 == addr; // @[Conditional.scala 37:30:@2174.104]
  assign _T_167 = 10'h33 == addr; // @[Conditional.scala 37:30:@2179.106]
  assign _T_170 = 10'h34 == addr; // @[Conditional.scala 37:30:@2184.108]
  assign _T_173 = 10'h35 == addr; // @[Conditional.scala 37:30:@2189.110]
  assign _T_176 = 10'h36 == addr; // @[Conditional.scala 37:30:@2194.112]
  assign _T_179 = 10'h37 == addr; // @[Conditional.scala 37:30:@2199.114]
  assign _T_182 = 10'h38 == addr; // @[Conditional.scala 37:30:@2204.116]
  assign _T_185 = 10'h39 == addr; // @[Conditional.scala 37:30:@2209.118]
  assign _T_188 = 10'h3a == addr; // @[Conditional.scala 37:30:@2214.120]
  assign _T_191 = 10'h3b == addr; // @[Conditional.scala 37:30:@2219.122]
  assign _T_194 = 10'h3c == addr; // @[Conditional.scala 37:30:@2224.124]
  assign _T_197 = 10'h3d == addr; // @[Conditional.scala 37:30:@2229.126]
  assign _T_200 = 10'h3e == addr; // @[Conditional.scala 37:30:@2234.128]
  assign _T_203 = 10'h3f == addr; // @[Conditional.scala 37:30:@2239.130]
  assign _T_206 = 10'h40 == addr; // @[Conditional.scala 37:30:@2244.132]
  assign _T_209 = 10'h41 == addr; // @[Conditional.scala 37:30:@2249.134]
  assign _T_212 = 10'h42 == addr; // @[Conditional.scala 37:30:@2254.136]
  assign _T_215 = 10'h43 == addr; // @[Conditional.scala 37:30:@2259.138]
  assign _T_218 = 10'h44 == addr; // @[Conditional.scala 37:30:@2264.140]
  assign _T_221 = 10'h45 == addr; // @[Conditional.scala 37:30:@2269.142]
  assign _T_224 = 10'h46 == addr; // @[Conditional.scala 37:30:@2274.144]
  assign _T_227 = 10'h47 == addr; // @[Conditional.scala 37:30:@2279.146]
  assign _T_230 = 10'h48 == addr; // @[Conditional.scala 37:30:@2284.148]
  assign _T_233 = 10'h49 == addr; // @[Conditional.scala 37:30:@2289.150]
  assign _T_236 = 10'h4a == addr; // @[Conditional.scala 37:30:@2294.152]
  assign _T_239 = 10'h4b == addr; // @[Conditional.scala 37:30:@2299.154]
  assign _T_242 = 10'h4c == addr; // @[Conditional.scala 37:30:@2304.156]
  assign _T_245 = 10'h4d == addr; // @[Conditional.scala 37:30:@2309.158]
  assign _T_248 = 10'h4e == addr; // @[Conditional.scala 37:30:@2314.160]
  assign _T_251 = 10'h4f == addr; // @[Conditional.scala 37:30:@2319.162]
  assign _T_254 = 10'h50 == addr; // @[Conditional.scala 37:30:@2324.164]
  assign _T_257 = 10'h51 == addr; // @[Conditional.scala 37:30:@2329.166]
  assign _T_260 = 10'h52 == addr; // @[Conditional.scala 37:30:@2334.168]
  assign _T_263 = 10'h53 == addr; // @[Conditional.scala 37:30:@2339.170]
  assign _T_266 = 10'h54 == addr; // @[Conditional.scala 37:30:@2344.172]
  assign _T_269 = 10'h55 == addr; // @[Conditional.scala 37:30:@2349.174]
  assign _T_272 = 10'h56 == addr; // @[Conditional.scala 37:30:@2354.176]
  assign _T_275 = 10'h57 == addr; // @[Conditional.scala 37:30:@2359.178]
  assign _T_278 = 10'h58 == addr; // @[Conditional.scala 37:30:@2364.180]
  assign _T_281 = 10'h59 == addr; // @[Conditional.scala 37:30:@2369.182]
  assign _T_284 = 10'h5a == addr; // @[Conditional.scala 37:30:@2374.184]
  assign _T_287 = 10'h5b == addr; // @[Conditional.scala 37:30:@2379.186]
  assign _T_290 = 10'h5c == addr; // @[Conditional.scala 37:30:@2384.188]
  assign _T_293 = 10'h5d == addr; // @[Conditional.scala 37:30:@2389.190]
  assign _T_296 = 10'h5e == addr; // @[Conditional.scala 37:30:@2394.192]
  assign _T_299 = 10'h5f == addr; // @[Conditional.scala 37:30:@2399.194]
  assign _T_302 = 10'h60 == addr; // @[Conditional.scala 37:30:@2404.196]
  assign _T_305 = 10'h61 == addr; // @[Conditional.scala 37:30:@2409.198]
  assign _T_308 = 10'h62 == addr; // @[Conditional.scala 37:30:@2414.200]
  assign _T_311 = 10'h63 == addr; // @[Conditional.scala 37:30:@2419.202]
  assign _T_314 = 10'h64 == addr; // @[Conditional.scala 37:30:@2424.204]
  assign _T_317 = 10'h65 == addr; // @[Conditional.scala 37:30:@2429.206]
  assign _T_320 = 10'h66 == addr; // @[Conditional.scala 37:30:@2434.208]
  assign _T_323 = 10'h67 == addr; // @[Conditional.scala 37:30:@2439.210]
  assign _T_326 = 10'h68 == addr; // @[Conditional.scala 37:30:@2444.212]
  assign _T_329 = 10'h69 == addr; // @[Conditional.scala 37:30:@2449.214]
  assign _T_332 = 10'h6a == addr; // @[Conditional.scala 37:30:@2454.216]
  assign _T_335 = 10'h6b == addr; // @[Conditional.scala 37:30:@2459.218]
  assign _T_338 = 10'h6c == addr; // @[Conditional.scala 37:30:@2464.220]
  assign _T_341 = 10'h6d == addr; // @[Conditional.scala 37:30:@2469.222]
  assign _T_344 = 10'h6e == addr; // @[Conditional.scala 37:30:@2474.224]
  assign _T_347 = 10'h6f == addr; // @[Conditional.scala 37:30:@2479.226]
  assign _T_350 = 10'h70 == addr; // @[Conditional.scala 37:30:@2484.228]
  assign _T_353 = 10'h71 == addr; // @[Conditional.scala 37:30:@2489.230]
  assign _T_356 = 10'h72 == addr; // @[Conditional.scala 37:30:@2494.232]
  assign _T_359 = 10'h73 == addr; // @[Conditional.scala 37:30:@2499.234]
  assign _T_362 = 10'h74 == addr; // @[Conditional.scala 37:30:@2504.236]
  assign _T_365 = 10'h75 == addr; // @[Conditional.scala 37:30:@2509.238]
  assign _T_368 = 10'h76 == addr; // @[Conditional.scala 37:30:@2514.240]
  assign _T_371 = 10'h77 == addr; // @[Conditional.scala 37:30:@2519.242]
  assign _T_374 = 10'h78 == addr; // @[Conditional.scala 37:30:@2524.244]
  assign _T_377 = 10'h79 == addr; // @[Conditional.scala 37:30:@2529.246]
  assign _T_380 = 10'h7a == addr; // @[Conditional.scala 37:30:@2534.248]
  assign _T_383 = 10'h7b == addr; // @[Conditional.scala 37:30:@2539.250]
  assign _T_386 = 10'h7c == addr; // @[Conditional.scala 37:30:@2544.252]
  assign _T_389 = 10'h7d == addr; // @[Conditional.scala 37:30:@2549.254]
  assign _T_392 = 10'h7e == addr; // @[Conditional.scala 37:30:@2554.256]
  assign _T_395 = 10'h7f == addr; // @[Conditional.scala 37:30:@2559.258]
  assign _T_398 = 10'h80 == addr; // @[Conditional.scala 37:30:@2564.260]
  assign _T_401 = 10'h81 == addr; // @[Conditional.scala 37:30:@2569.262]
  assign _T_404 = 10'h82 == addr; // @[Conditional.scala 37:30:@2574.264]
  assign _T_407 = 10'h83 == addr; // @[Conditional.scala 37:30:@2579.266]
  assign _T_410 = 10'h84 == addr; // @[Conditional.scala 37:30:@2584.268]
  assign _T_413 = 10'h85 == addr; // @[Conditional.scala 37:30:@2589.270]
  assign _T_416 = 10'h86 == addr; // @[Conditional.scala 37:30:@2594.272]
  assign _T_419 = 10'h87 == addr; // @[Conditional.scala 37:30:@2599.274]
  assign _T_422 = 10'h88 == addr; // @[Conditional.scala 37:30:@2604.276]
  assign _T_425 = 10'h89 == addr; // @[Conditional.scala 37:30:@2609.278]
  assign _T_428 = 10'h8a == addr; // @[Conditional.scala 37:30:@2614.280]
  assign _T_431 = 10'h8b == addr; // @[Conditional.scala 37:30:@2619.282]
  assign _T_434 = 10'h8c == addr; // @[Conditional.scala 37:30:@2624.284]
  assign _T_437 = 10'h8d == addr; // @[Conditional.scala 37:30:@2629.286]
  assign _T_440 = 10'h8e == addr; // @[Conditional.scala 37:30:@2634.288]
  assign _T_443 = 10'h8f == addr; // @[Conditional.scala 37:30:@2639.290]
  assign _T_446 = 10'h90 == addr; // @[Conditional.scala 37:30:@2644.292]
  assign _T_449 = 10'h91 == addr; // @[Conditional.scala 37:30:@2649.294]
  assign _T_452 = 10'h92 == addr; // @[Conditional.scala 37:30:@2654.296]
  assign _T_455 = 10'h93 == addr; // @[Conditional.scala 37:30:@2659.298]
  assign _T_458 = 10'h94 == addr; // @[Conditional.scala 37:30:@2664.300]
  assign _T_461 = 10'h95 == addr; // @[Conditional.scala 37:30:@2669.302]
  assign _T_464 = 10'h96 == addr; // @[Conditional.scala 37:30:@2674.304]
  assign _T_467 = 10'h97 == addr; // @[Conditional.scala 37:30:@2679.306]
  assign _T_470 = 10'h98 == addr; // @[Conditional.scala 37:30:@2684.308]
  assign _T_473 = 10'h99 == addr; // @[Conditional.scala 37:30:@2689.310]
  assign _T_476 = 10'h9a == addr; // @[Conditional.scala 37:30:@2694.312]
  assign _T_479 = 10'h9b == addr; // @[Conditional.scala 37:30:@2699.314]
  assign _T_482 = 10'h9c == addr; // @[Conditional.scala 37:30:@2704.316]
  assign _T_485 = 10'h9d == addr; // @[Conditional.scala 37:30:@2709.318]
  assign _T_488 = 10'h9e == addr; // @[Conditional.scala 37:30:@2714.320]
  assign _T_491 = 10'h9f == addr; // @[Conditional.scala 37:30:@2719.322]
  assign _T_494 = 10'ha0 == addr; // @[Conditional.scala 37:30:@2724.324]
  assign _T_497 = 10'ha1 == addr; // @[Conditional.scala 37:30:@2729.326]
  assign _T_500 = 10'ha2 == addr; // @[Conditional.scala 37:30:@2734.328]
  assign _T_503 = 10'ha3 == addr; // @[Conditional.scala 37:30:@2739.330]
  assign _T_506 = 10'ha4 == addr; // @[Conditional.scala 37:30:@2744.332]
  assign _T_509 = 10'ha5 == addr; // @[Conditional.scala 37:30:@2749.334]
  assign _T_512 = 10'ha6 == addr; // @[Conditional.scala 37:30:@2754.336]
  assign _T_515 = 10'ha7 == addr; // @[Conditional.scala 37:30:@2759.338]
  assign _T_518 = 10'ha8 == addr; // @[Conditional.scala 37:30:@2764.340]
  assign _T_521 = 10'ha9 == addr; // @[Conditional.scala 37:30:@2769.342]
  assign _T_524 = 10'haa == addr; // @[Conditional.scala 37:30:@2774.344]
  assign _T_527 = 10'hab == addr; // @[Conditional.scala 37:30:@2779.346]
  assign _T_530 = 10'hac == addr; // @[Conditional.scala 37:30:@2784.348]
  assign _T_533 = 10'had == addr; // @[Conditional.scala 37:30:@2789.350]
  assign _T_536 = 10'hae == addr; // @[Conditional.scala 37:30:@2794.352]
  assign _T_539 = 10'haf == addr; // @[Conditional.scala 37:30:@2799.354]
  assign _T_542 = 10'hb0 == addr; // @[Conditional.scala 37:30:@2804.356]
  assign _T_545 = 10'hb1 == addr; // @[Conditional.scala 37:30:@2809.358]
  assign _T_548 = 10'hb2 == addr; // @[Conditional.scala 37:30:@2814.360]
  assign _T_551 = 10'hb3 == addr; // @[Conditional.scala 37:30:@2819.362]
  assign _T_554 = 10'hb4 == addr; // @[Conditional.scala 37:30:@2824.364]
  assign _T_557 = 10'hb5 == addr; // @[Conditional.scala 37:30:@2829.366]
  assign _T_560 = 10'hb6 == addr; // @[Conditional.scala 37:30:@2834.368]
  assign _T_563 = 10'hb7 == addr; // @[Conditional.scala 37:30:@2839.370]
  assign _T_566 = 10'hb8 == addr; // @[Conditional.scala 37:30:@2844.372]
  assign _T_569 = 10'hb9 == addr; // @[Conditional.scala 37:30:@2849.374]
  assign _T_572 = 10'hba == addr; // @[Conditional.scala 37:30:@2854.376]
  assign _T_575 = 10'hbb == addr; // @[Conditional.scala 37:30:@2859.378]
  assign _T_578 = 10'hbc == addr; // @[Conditional.scala 37:30:@2864.380]
  assign _T_581 = 10'hbd == addr; // @[Conditional.scala 37:30:@2869.382]
  assign _T_584 = 10'hbe == addr; // @[Conditional.scala 37:30:@2874.384]
  assign _T_587 = 10'hbf == addr; // @[Conditional.scala 37:30:@2879.386]
  assign _T_590 = 10'hc0 == addr; // @[Conditional.scala 37:30:@2884.388]
  assign _T_593 = 10'hc1 == addr; // @[Conditional.scala 37:30:@2889.390]
  assign _T_596 = 10'hc2 == addr; // @[Conditional.scala 37:30:@2894.392]
  assign _T_599 = 10'hc3 == addr; // @[Conditional.scala 37:30:@2899.394]
  assign _T_602 = 10'hc4 == addr; // @[Conditional.scala 37:30:@2904.396]
  assign _T_605 = 10'hc5 == addr; // @[Conditional.scala 37:30:@2909.398]
  assign _T_608 = 10'hc6 == addr; // @[Conditional.scala 37:30:@2914.400]
  assign _T_611 = 10'hc7 == addr; // @[Conditional.scala 37:30:@2919.402]
  assign _T_614 = 10'hc8 == addr; // @[Conditional.scala 37:30:@2924.404]
  assign _T_617 = 10'hc9 == addr; // @[Conditional.scala 37:30:@2929.406]
  assign _T_620 = 10'hca == addr; // @[Conditional.scala 37:30:@2934.408]
  assign _T_623 = 10'hcb == addr; // @[Conditional.scala 37:30:@2939.410]
  assign _T_626 = 10'hcc == addr; // @[Conditional.scala 37:30:@2944.412]
  assign _T_629 = 10'hcd == addr; // @[Conditional.scala 37:30:@2949.414]
  assign _T_632 = 10'hce == addr; // @[Conditional.scala 37:30:@2954.416]
  assign _T_635 = 10'hcf == addr; // @[Conditional.scala 37:30:@2959.418]
  assign _T_638 = 10'hd0 == addr; // @[Conditional.scala 37:30:@2964.420]
  assign _T_641 = 10'hd1 == addr; // @[Conditional.scala 37:30:@2969.422]
  assign _T_644 = 10'hd2 == addr; // @[Conditional.scala 37:30:@2974.424]
  assign _T_647 = 10'hd3 == addr; // @[Conditional.scala 37:30:@2979.426]
  assign _T_650 = 10'hd4 == addr; // @[Conditional.scala 37:30:@2984.428]
  assign _T_653 = 10'hd5 == addr; // @[Conditional.scala 37:30:@2989.430]
  assign _T_656 = 10'hd6 == addr; // @[Conditional.scala 37:30:@2994.432]
  assign _T_659 = 10'hd7 == addr; // @[Conditional.scala 37:30:@2999.434]
  assign _T_662 = 10'hd8 == addr; // @[Conditional.scala 37:30:@3004.436]
  assign _T_665 = 10'hd9 == addr; // @[Conditional.scala 37:30:@3009.438]
  assign _GEN_0 = _T_665 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3010.438]
  assign _GEN_1 = _T_662 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3005.436]
  assign _GEN_2 = _T_659 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3000.434]
  assign _GEN_3 = _T_656 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@2995.432]
  assign _GEN_4 = _T_653 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@2990.430]
  assign _GEN_5 = _T_650 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@2985.428]
  assign _GEN_6 = _T_647 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@2980.426]
  assign _GEN_7 = _T_644 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@2975.424]
  assign _GEN_8 = _T_641 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@2970.422]
  assign _GEN_9 = _T_638 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@2965.420]
  assign _GEN_10 = _T_635 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@2960.418]
  assign _GEN_11 = _T_632 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@2955.416]
  assign _GEN_12 = _T_629 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@2950.414]
  assign _GEN_13 = _T_626 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@2945.412]
  assign _GEN_14 = _T_623 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@2940.410]
  assign _GEN_15 = _T_620 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@2935.408]
  assign _GEN_16 = _T_617 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@2930.406]
  assign _GEN_17 = _T_614 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@2925.404]
  assign _GEN_18 = _T_611 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2920.402]
  assign _GEN_19 = _T_608 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2915.400]
  assign _GEN_20 = _T_605 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2910.398]
  assign _GEN_21 = _T_602 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2905.396]
  assign _GEN_22 = _T_599 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2900.394]
  assign _GEN_23 = _T_596 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2895.392]
  assign _GEN_24 = _T_593 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2890.390]
  assign _GEN_25 = _T_590 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2885.388]
  assign _GEN_26 = _T_587 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2880.386]
  assign _GEN_27 = _T_584 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2875.384]
  assign _GEN_28 = _T_581 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2870.382]
  assign _GEN_29 = _T_578 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2865.380]
  assign _GEN_30 = _T_575 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2860.378]
  assign _GEN_31 = _T_572 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2855.376]
  assign _GEN_32 = _T_569 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2850.374]
  assign _GEN_33 = _T_566 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2845.372]
  assign _GEN_34 = _T_563 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2840.370]
  assign _GEN_35 = _T_560 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2835.368]
  assign _GEN_36 = _T_557 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2830.366]
  assign _GEN_37 = _T_554 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2825.364]
  assign _GEN_38 = _T_551 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2820.362]
  assign _GEN_39 = _T_548 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2815.360]
  assign _GEN_40 = _T_545 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2810.358]
  assign _GEN_41 = _T_542 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2805.356]
  assign _GEN_42 = _T_539 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2800.354]
  assign _GEN_43 = _T_536 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2795.352]
  assign _GEN_44 = _T_533 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2790.350]
  assign _GEN_45 = _T_530 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2785.348]
  assign _GEN_46 = _T_527 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2780.346]
  assign _GEN_47 = _T_524 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2775.344]
  assign _GEN_48 = _T_521 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2770.342]
  assign _GEN_49 = _T_518 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2765.340]
  assign _GEN_50 = _T_515 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2760.338]
  assign _GEN_51 = _T_512 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2755.336]
  assign _GEN_52 = _T_509 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2750.334]
  assign _GEN_53 = _T_506 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2745.332]
  assign _GEN_54 = _T_503 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2740.330]
  assign _GEN_55 = _T_500 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2735.328]
  assign _GEN_56 = _T_497 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2730.326]
  assign _GEN_57 = _T_494 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2725.324]
  assign _GEN_58 = _T_491 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2720.322]
  assign _GEN_59 = _T_488 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2715.320]
  assign _GEN_60 = _T_485 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2710.318]
  assign _GEN_61 = _T_482 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2705.316]
  assign _GEN_62 = _T_479 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2700.314]
  assign _GEN_63 = _T_476 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2695.312]
  assign _GEN_64 = _T_473 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2690.310]
  assign _GEN_65 = _T_470 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2685.308]
  assign _GEN_66 = _T_467 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2680.306]
  assign _GEN_67 = _T_464 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2675.304]
  assign _GEN_68 = _T_461 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2670.302]
  assign _GEN_69 = _T_458 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2665.300]
  assign _GEN_70 = _T_455 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2660.298]
  assign _GEN_71 = _T_452 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2655.296]
  assign _GEN_72 = _T_449 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2650.294]
  assign _GEN_73 = _T_446 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2645.292]
  assign _GEN_74 = _T_443 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2640.290]
  assign _GEN_75 = _T_440 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2635.288]
  assign _GEN_76 = _T_437 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2630.286]
  assign _GEN_77 = _T_434 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2625.284]
  assign _GEN_78 = _T_431 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2620.282]
  assign _GEN_79 = _T_428 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2615.280]
  assign _GEN_80 = _T_425 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2610.278]
  assign _GEN_81 = _T_422 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2605.276]
  assign _GEN_82 = _T_419 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2600.274]
  assign _GEN_83 = _T_416 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2595.272]
  assign _GEN_84 = _T_413 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2590.270]
  assign _GEN_85 = _T_410 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2585.268]
  assign _GEN_86 = _T_407 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2580.266]
  assign _GEN_87 = _T_404 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2575.264]
  assign _GEN_88 = _T_401 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2570.262]
  assign _GEN_89 = _T_398 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2565.260]
  assign _GEN_90 = _T_395 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2560.258]
  assign _GEN_91 = _T_392 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2555.256]
  assign _GEN_92 = _T_389 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2550.254]
  assign _GEN_93 = _T_386 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2545.252]
  assign _GEN_94 = _T_383 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2540.250]
  assign _GEN_95 = _T_380 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2535.248]
  assign _GEN_96 = _T_377 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2530.246]
  assign _GEN_97 = _T_374 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2525.244]
  assign _GEN_98 = _T_371 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2520.242]
  assign _GEN_99 = _T_368 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2515.240]
  assign _GEN_100 = _T_365 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2510.238]
  assign _GEN_101 = _T_362 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2505.236]
  assign _GEN_102 = _T_359 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2500.234]
  assign _GEN_103 = _T_356 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2495.232]
  assign _GEN_104 = _T_353 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2490.230]
  assign _GEN_105 = _T_350 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2485.228]
  assign _GEN_106 = _T_347 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2480.226]
  assign _GEN_107 = _T_344 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2475.224]
  assign _GEN_108 = _T_341 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2470.222]
  assign _GEN_109 = _T_338 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2465.220]
  assign _GEN_110 = _T_335 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2460.218]
  assign _GEN_111 = _T_332 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2455.216]
  assign _GEN_112 = _T_329 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2450.214]
  assign _GEN_113 = _T_326 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2445.212]
  assign _GEN_114 = _T_323 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2440.210]
  assign _GEN_115 = _T_320 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2435.208]
  assign _GEN_116 = _T_317 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2430.206]
  assign _GEN_117 = _T_314 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2425.204]
  assign _GEN_118 = _T_311 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2420.202]
  assign _GEN_119 = _T_308 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2415.200]
  assign _GEN_120 = _T_305 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2410.198]
  assign _GEN_121 = _T_302 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2405.196]
  assign _GEN_122 = _T_299 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2400.194]
  assign _GEN_123 = _T_296 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2395.192]
  assign _GEN_124 = _T_293 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2390.190]
  assign _GEN_125 = _T_290 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2385.188]
  assign _GEN_126 = _T_287 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2380.186]
  assign _GEN_127 = _T_284 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2375.184]
  assign _GEN_128 = _T_281 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2370.182]
  assign _GEN_129 = _T_278 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2365.180]
  assign _GEN_130 = _T_275 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2360.178]
  assign _GEN_131 = _T_272 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2355.176]
  assign _GEN_132 = _T_269 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2350.174]
  assign _GEN_133 = _T_266 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2345.172]
  assign _GEN_134 = _T_263 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2340.170]
  assign _GEN_135 = _T_260 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2335.168]
  assign _GEN_136 = _T_257 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2330.166]
  assign _GEN_137 = _T_254 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2325.164]
  assign _GEN_138 = _T_251 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2320.162]
  assign _GEN_139 = _T_248 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2315.160]
  assign _GEN_140 = _T_245 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2310.158]
  assign _GEN_141 = _T_242 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2305.156]
  assign _GEN_142 = _T_239 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2300.154]
  assign _GEN_143 = _T_236 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2295.152]
  assign _GEN_144 = _T_233 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2290.150]
  assign _GEN_145 = _T_230 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2285.148]
  assign _GEN_146 = _T_227 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2280.146]
  assign _GEN_147 = _T_224 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2275.144]
  assign _GEN_148 = _T_221 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2270.142]
  assign _GEN_149 = _T_218 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2265.140]
  assign _GEN_150 = _T_215 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2260.138]
  assign _GEN_151 = _T_212 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2255.136]
  assign _GEN_152 = _T_209 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2250.134]
  assign _GEN_153 = _T_206 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2245.132]
  assign _GEN_154 = _T_203 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2240.130]
  assign _GEN_155 = _T_200 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2235.128]
  assign _GEN_156 = _T_197 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2230.126]
  assign _GEN_157 = _T_194 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2225.124]
  assign _GEN_158 = _T_191 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2220.122]
  assign _GEN_159 = _T_188 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2215.120]
  assign _GEN_160 = _T_185 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2210.118]
  assign _GEN_161 = _T_182 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2205.116]
  assign _GEN_162 = _T_179 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2200.114]
  assign _GEN_163 = _T_176 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2195.112]
  assign _GEN_164 = _T_173 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2190.110]
  assign _GEN_165 = _T_170 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2185.108]
  assign _GEN_166 = _T_167 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2180.106]
  assign _GEN_167 = _T_164 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2175.104]
  assign _GEN_168 = _T_161 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2170.102]
  assign _GEN_169 = _T_158 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2165.100]
  assign _GEN_170 = _T_155 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2160.98]
  assign _GEN_171 = _T_152 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2155.96]
  assign _GEN_172 = _T_149 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2150.94]
  assign _GEN_173 = _T_146 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2145.92]
  assign _GEN_174 = _T_143 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2140.90]
  assign _GEN_175 = _T_140 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2135.88]
  assign _GEN_176 = _T_137 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2130.86]
  assign _GEN_177 = _T_134 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2125.84]
  assign _GEN_178 = _T_131 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2120.82]
  assign _GEN_179 = _T_128 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2115.80]
  assign _GEN_180 = _T_125 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2110.78]
  assign _GEN_181 = _T_122 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2105.76]
  assign _GEN_182 = _T_119 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2100.74]
  assign _GEN_183 = _T_116 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2095.72]
  assign _GEN_184 = _T_113 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2090.70]
  assign _GEN_185 = _T_110 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2085.68]
  assign _GEN_186 = _T_107 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2080.66]
  assign _GEN_187 = _T_104 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2075.64]
  assign _GEN_188 = _T_101 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2070.62]
  assign _GEN_189 = _T_98 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2065.60]
  assign _GEN_190 = _T_95 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2060.58]
  assign _GEN_191 = _T_92 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2055.56]
  assign _GEN_192 = _T_89 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2050.54]
  assign _GEN_193 = _T_86 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2045.52]
  assign _GEN_194 = _T_83 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2040.50]
  assign _GEN_195 = _T_80 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2035.48]
  assign _GEN_196 = _T_77 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2030.46]
  assign _GEN_197 = _T_74 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2025.44]
  assign _GEN_198 = _T_71 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2020.42]
  assign _GEN_199 = _T_68 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2015.40]
  assign _GEN_200 = _T_65 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2010.38]
  assign _GEN_201 = _T_62 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2005.36]
  assign _GEN_202 = _T_59 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2000.34]
  assign _GEN_203 = _T_56 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@1995.32]
  assign _GEN_204 = _T_53 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@1990.30]
  assign _GEN_205 = _T_50 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@1985.28]
  assign _GEN_206 = _T_47 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@1980.26]
  assign _GEN_207 = _T_44 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@1975.24]
  assign _GEN_208 = _T_41 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@1970.22]
  assign _GEN_209 = _T_38 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@1965.20]
  assign _GEN_210 = _T_35 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@1960.18]
  assign _GEN_211 = _T_32 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@1955.16]
  assign _GEN_212 = _T_29 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@1950.14]
  assign _GEN_213 = _T_26 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@1945.12]
  assign _GEN_214 = _T_23 ? 32'hf810113 : _GEN_213; // @[Conditional.scala 39:67:@1940.10]
  assign _GEN_215 = _T_20 ? 32'hffffa117 : _GEN_214; // @[Conditional.scala 39:67:@1935.8]
  assign _GEN_216 = _T_17 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@1930.6]
  assign _GEN_217 = _T_14 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@1925.4]
  assign io_bmem_rdata = bmem_data; // @[BMEM.scala 248:17:@3013.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  bmem_data = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      bmem_data <= 32'h0;
    end else begin
      if (_T_14) begin
        bmem_data <= 32'h13;
      end else begin
        if (_T_17) begin
          bmem_data <= 32'h40006f;
        end else begin
          if (_T_20) begin
            bmem_data <= 32'hffffa117;
          end else begin
            if (_T_23) begin
              bmem_data <= 32'hf810113;
            end else begin
              if (_T_26) begin
                bmem_data <= 32'h513;
              end else begin
                if (_T_29) begin
                  bmem_data <= 32'h593;
                end else begin
                  if (_T_32) begin
                    bmem_data <= 32'h114000ef;
                  end else begin
                    if (_T_35) begin
                      bmem_data <= 32'hfe010113;
                    end else begin
                      if (_T_38) begin
                        bmem_data <= 32'h812e23;
                      end else begin
                        if (_T_41) begin
                          bmem_data <= 32'h2010413;
                        end else begin
                          if (_T_44) begin
                            bmem_data <= 32'h50793;
                          end else begin
                            if (_T_47) begin
                              bmem_data <= 32'hfef407a3;
                            end else begin
                              if (_T_50) begin
                                bmem_data <= 32'h37b7;
                              end else begin
                                if (_T_53) begin
                                  bmem_data <= 32'h27c783;
                                end else begin
                                  if (_T_56) begin
                                    bmem_data <= 32'hff7f693;
                                  end else begin
                                    if (_T_59) begin
                                      bmem_data <= 32'h37b7;
                                    end else begin
                                      if (_T_62) begin
                                        bmem_data <= 32'hfef44703;
                                      end else begin
                                        if (_T_65) begin
                                          bmem_data <= 32'he6e733;
                                        end else begin
                                          if (_T_68) begin
                                            bmem_data <= 32'hff77713;
                                          end else begin
                                            if (_T_71) begin
                                              bmem_data <= 32'he78123;
                                            end else begin
                                              if (_T_74) begin
                                                bmem_data <= 32'h13;
                                              end else begin
                                                if (_T_77) begin
                                                  bmem_data <= 32'h1c12403;
                                                end else begin
                                                  if (_T_80) begin
                                                    bmem_data <= 32'h2010113;
                                                  end else begin
                                                    if (_T_83) begin
                                                      bmem_data <= 32'h8067;
                                                    end else begin
                                                      if (_T_86) begin
                                                        bmem_data <= 32'hfe010113;
                                                      end else begin
                                                        if (_T_89) begin
                                                          bmem_data <= 32'h812e23;
                                                        end else begin
                                                          if (_T_92) begin
                                                            bmem_data <= 32'h2010413;
                                                          end else begin
                                                            if (_T_95) begin
                                                              bmem_data <= 32'h50793;
                                                            end else begin
                                                              if (_T_98) begin
                                                                bmem_data <= 32'hfef407a3;
                                                              end else begin
                                                                if (_T_101) begin
                                                                  bmem_data <= 32'h37b7;
                                                                end else begin
                                                                  if (_T_104) begin
                                                                    bmem_data <= 32'hfef44703;
                                                                  end else begin
                                                                    if (_T_107) begin
                                                                      bmem_data <= 32'he780a3;
                                                                    end else begin
                                                                      if (_T_110) begin
                                                                        bmem_data <= 32'h13;
                                                                      end else begin
                                                                        if (_T_113) begin
                                                                          bmem_data <= 32'h37b7;
                                                                        end else begin
                                                                          if (_T_116) begin
                                                                            bmem_data <= 32'h47c783;
                                                                          end else begin
                                                                            if (_T_119) begin
                                                                              bmem_data <= 32'hff7f793;
                                                                            end else begin
                                                                              if (_T_122) begin
                                                                                bmem_data <= 32'h107f793;
                                                                              end else begin
                                                                                if (_T_125) begin
                                                                                  bmem_data <= 32'hfe0788e3;
                                                                                end else begin
                                                                                  if (_T_128) begin
                                                                                    bmem_data <= 32'h37b7;
                                                                                  end else begin
                                                                                    if (_T_131) begin
                                                                                      bmem_data <= 32'h7c783;
                                                                                    end else begin
                                                                                      if (_T_134) begin
                                                                                        bmem_data <= 32'hff7f793;
                                                                                      end else begin
                                                                                        if (_T_137) begin
                                                                                          bmem_data <= 32'h78513;
                                                                                        end else begin
                                                                                          if (_T_140) begin
                                                                                            bmem_data <= 32'h1c12403;
                                                                                          end else begin
                                                                                            if (_T_143) begin
                                                                                              bmem_data <= 32'h2010113;
                                                                                            end else begin
                                                                                              if (_T_146) begin
                                                                                                bmem_data <= 32'h8067;
                                                                                              end else begin
                                                                                                if (_T_149) begin
                                                                                                  bmem_data <= 32'hfe010113;
                                                                                                end else begin
                                                                                                  if (_T_152) begin
                                                                                                    bmem_data <= 32'h812e23;
                                                                                                  end else begin
                                                                                                    if (_T_155) begin
                                                                                                      bmem_data <= 32'h2010413;
                                                                                                    end else begin
                                                                                                      if (_T_158) begin
                                                                                                        bmem_data <= 32'h50793;
                                                                                                      end else begin
                                                                                                        if (_T_161) begin
                                                                                                          bmem_data <= 32'hfef407a3;
                                                                                                        end else begin
                                                                                                          if (_T_164) begin
                                                                                                            bmem_data <= 32'h27b7;
                                                                                                          end else begin
                                                                                                            if (_T_167) begin
                                                                                                              bmem_data <= 32'hfef44703;
                                                                                                            end else begin
                                                                                                              if (_T_170) begin
                                                                                                                bmem_data <= 32'he78123;
                                                                                                              end else begin
                                                                                                                if (_T_173) begin
                                                                                                                  bmem_data <= 32'h13;
                                                                                                                end else begin
                                                                                                                  if (_T_176) begin
                                                                                                                    bmem_data <= 32'h1c12403;
                                                                                                                  end else begin
                                                                                                                    if (_T_179) begin
                                                                                                                      bmem_data <= 32'h2010113;
                                                                                                                    end else begin
                                                                                                                      if (_T_182) begin
                                                                                                                        bmem_data <= 32'h8067;
                                                                                                                      end else begin
                                                                                                                        if (_T_185) begin
                                                                                                                          bmem_data <= 32'hfe010113;
                                                                                                                        end else begin
                                                                                                                          if (_T_188) begin
                                                                                                                            bmem_data <= 32'h812e23;
                                                                                                                          end else begin
                                                                                                                            if (_T_191) begin
                                                                                                                              bmem_data <= 32'h2010413;
                                                                                                                            end else begin
                                                                                                                              if (_T_194) begin
                                                                                                                                bmem_data <= 32'h50793;
                                                                                                                              end else begin
                                                                                                                                if (_T_197) begin
                                                                                                                                  bmem_data <= 32'hfef407a3;
                                                                                                                                end else begin
                                                                                                                                  if (_T_200) begin
                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                  end else begin
                                                                                                                                    if (_T_203) begin
                                                                                                                                      bmem_data <= 32'h27b7;
                                                                                                                                    end else begin
                                                                                                                                      if (_T_206) begin
                                                                                                                                        bmem_data <= 32'h47c783;
                                                                                                                                      end else begin
                                                                                                                                        if (_T_209) begin
                                                                                                                                          bmem_data <= 32'hff7f793;
                                                                                                                                        end else begin
                                                                                                                                          if (_T_212) begin
                                                                                                                                            bmem_data <= 32'h27f793;
                                                                                                                                          end else begin
                                                                                                                                            if (_T_215) begin
                                                                                                                                              bmem_data <= 32'hfe0788e3;
                                                                                                                                            end else begin
                                                                                                                                              if (_T_218) begin
                                                                                                                                                bmem_data <= 32'h27b7;
                                                                                                                                              end else begin
                                                                                                                                                if (_T_221) begin
                                                                                                                                                  bmem_data <= 32'hfef44703;
                                                                                                                                                end else begin
                                                                                                                                                  if (_T_224) begin
                                                                                                                                                    bmem_data <= 32'he780a3;
                                                                                                                                                  end else begin
                                                                                                                                                    if (_T_227) begin
                                                                                                                                                      bmem_data <= 32'h13;
                                                                                                                                                    end else begin
                                                                                                                                                      if (_T_230) begin
                                                                                                                                                        bmem_data <= 32'h1c12403;
                                                                                                                                                      end else begin
                                                                                                                                                        if (_T_233) begin
                                                                                                                                                          bmem_data <= 32'h2010113;
                                                                                                                                                        end else begin
                                                                                                                                                          if (_T_236) begin
                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                          end else begin
                                                                                                                                                            if (_T_239) begin
                                                                                                                                                              bmem_data <= 32'hff010113;
                                                                                                                                                            end else begin
                                                                                                                                                              if (_T_242) begin
                                                                                                                                                                bmem_data <= 32'h112623;
                                                                                                                                                              end else begin
                                                                                                                                                                if (_T_245) begin
                                                                                                                                                                  bmem_data <= 32'h812423;
                                                                                                                                                                end else begin
                                                                                                                                                                  if (_T_248) begin
                                                                                                                                                                    bmem_data <= 32'h1010413;
                                                                                                                                                                  end else begin
                                                                                                                                                                    if (_T_251) begin
                                                                                                                                                                      bmem_data <= 32'h1000513;
                                                                                                                                                                    end else begin
                                                                                                                                                                      if (_T_254) begin
                                                                                                                                                                        bmem_data <= 32'hf75ff0ef;
                                                                                                                                                                      end else begin
                                                                                                                                                                        if (_T_257) begin
                                                                                                                                                                          bmem_data <= 32'h800513;
                                                                                                                                                                        end else begin
                                                                                                                                                                          if (_T_260) begin
                                                                                                                                                                            bmem_data <= 32'hed5ff0ef;
                                                                                                                                                                          end else begin
                                                                                                                                                                            if (_T_263) begin
                                                                                                                                                                              bmem_data <= 32'h54000ef;
                                                                                                                                                                            end else begin
                                                                                                                                                                              if (_T_266) begin
                                                                                                                                                                                bmem_data <= 32'h4f00513;
                                                                                                                                                                              end else begin
                                                                                                                                                                                if (_T_269) begin
                                                                                                                                                                                  bmem_data <= 32'hf91ff0ef;
                                                                                                                                                                                end else begin
                                                                                                                                                                                  if (_T_272) begin
                                                                                                                                                                                    bmem_data <= 32'h6b00513;
                                                                                                                                                                                  end else begin
                                                                                                                                                                                    if (_T_275) begin
                                                                                                                                                                                      bmem_data <= 32'hf89ff0ef;
                                                                                                                                                                                    end else begin
                                                                                                                                                                                      if (_T_278) begin
                                                                                                                                                                                        bmem_data <= 32'h1c000ef;
                                                                                                                                                                                      end else begin
                                                                                                                                                                                        if (_T_281) begin
                                                                                                                                                                                          bmem_data <= 32'h793;
                                                                                                                                                                                        end else begin
                                                                                                                                                                                          if (_T_284) begin
                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                          end else begin
                                                                                                                                                                                            if (_T_287) begin
                                                                                                                                                                                              bmem_data <= 32'hc12083;
                                                                                                                                                                                            end else begin
                                                                                                                                                                                              if (_T_290) begin
                                                                                                                                                                                                bmem_data <= 32'h812403;
                                                                                                                                                                                              end else begin
                                                                                                                                                                                                if (_T_293) begin
                                                                                                                                                                                                  bmem_data <= 32'h1010113;
                                                                                                                                                                                                end else begin
                                                                                                                                                                                                  if (_T_296) begin
                                                                                                                                                                                                    bmem_data <= 32'h8067;
                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                    if (_T_299) begin
                                                                                                                                                                                                      bmem_data <= 32'hff010113;
                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                      if (_T_302) begin
                                                                                                                                                                                                        bmem_data <= 32'h812623;
                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                        if (_T_305) begin
                                                                                                                                                                                                          bmem_data <= 32'h1010413;
                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                          if (_T_308) begin
                                                                                                                                                                                                            bmem_data <= 32'h2b7;
                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                            if (_T_311) begin
                                                                                                                                                                                                              bmem_data <= 32'h28067;
                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                              if (_T_314) begin
                                                                                                                                                                                                                bmem_data <= 32'h13;
                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                if (_T_317) begin
                                                                                                                                                                                                                  bmem_data <= 32'hc12403;
                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                  if (_T_320) begin
                                                                                                                                                                                                                    bmem_data <= 32'h1010113;
                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                    if (_T_323) begin
                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                      if (_T_326) begin
                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                        if (_T_329) begin
                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                          if (_T_332) begin
                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                            if (_T_335) begin
                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                              if (_T_338) begin
                                                                                                                                                                                                                                bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                if (_T_341) begin
                                                                                                                                                                                                                                  bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                  if (_T_344) begin
                                                                                                                                                                                                                                    bmem_data <= 32'h94000ef;
                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                    if (_T_347) begin
                                                                                                                                                                                                                                      bmem_data <= 32'hfea42223;
                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                      if (_T_350) begin
                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                        if (_T_353) begin
                                                                                                                                                                                                                                          bmem_data <= 32'h478793;
                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                          if (_T_356) begin
                                                                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                            if (_T_359) begin
                                                                                                                                                                                                                                              bmem_data <= 32'h80000ef;
                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                              if (_T_362) begin
                                                                                                                                                                                                                                                bmem_data <= 32'hfea42023;
                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                if (_T_365) begin
                                                                                                                                                                                                                                                  bmem_data <= 32'hfc042e23;
                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                  if (_T_368) begin
                                                                                                                                                                                                                                                    bmem_data <= 32'hfc042c23;
                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                    if (_T_371) begin
                                                                                                                                                                                                                                                      bmem_data <= 32'hfe042423;
                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                      if (_T_374) begin
                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                        if (_T_377) begin
                                                                                                                                                                                                                                                          bmem_data <= 32'hc78793;
                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                          if (_T_380) begin
                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                            if (_T_383) begin
                                                                                                                                                                                                                                                              bmem_data <= 32'h3c0006f;
                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                              if (_T_386) begin
                                                                                                                                                                                                                                                                bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                if (_T_389) begin
                                                                                                                                                                                                                                                                  bmem_data <= 32'h58000ef;
                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                  if (_T_392) begin
                                                                                                                                                                                                                                                                    bmem_data <= 32'hfca42c23;
                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                    if (_T_395) begin
                                                                                                                                                                                                                                                                      bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                      if (_T_398) begin
                                                                                                                                                                                                                                                                        bmem_data <= 32'h178713;
                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                        if (_T_401) begin
                                                                                                                                                                                                                                                                          bmem_data <= 32'hfee42423;
                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                          if (_T_404) begin
                                                                                                                                                                                                                                                                            bmem_data <= 32'h279793;
                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                            if (_T_407) begin
                                                                                                                                                                                                                                                                              bmem_data <= 32'hfdc42703;
                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                              if (_T_410) begin
                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                if (_T_413) begin
                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfd842703;
                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                  if (_T_416) begin
                                                                                                                                                                                                                                                                                    bmem_data <= 32'he7a023;
                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                    if (_T_419) begin
                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                      if (_T_422) begin
                                                                                                                                                                                                                                                                                        bmem_data <= 32'h478793;
                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                        if (_T_425) begin
                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                          if (_T_428) begin
                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe042783;
                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                            if (_T_431) begin
                                                                                                                                                                                                                                                                                              bmem_data <= 32'h27d793;
                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                              if (_T_434) begin
                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfe842703;
                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                if (_T_437) begin
                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfaf76ee3;
                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                  if (_T_440) begin
                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                    if (_T_443) begin
                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                      if (_T_446) begin
                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                        if (_T_449) begin
                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                          if (_T_452) begin
                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                            if (_T_455) begin
                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                              if (_T_458) begin
                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                if (_T_461) begin
                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                  if (_T_464) begin
                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                    if (_T_467) begin
                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                      if (_T_470) begin
                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                        if (_T_473) begin
                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                          if (_T_476) begin
                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                            if (_T_479) begin
                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                              if (_T_482) begin
                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h176713;
                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                if (_T_485) begin
                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                  if (_T_488) begin
                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                    if (_T_491) begin
                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h300513;
                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                      if (_T_494) begin
                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hde1ff0ef;
                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                        if (_T_497) begin
                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfdc42503;
                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                          if (_T_500) begin
                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h78000ef;
                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                            if (_T_503) begin
                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                              if (_T_506) begin
                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h300006f;
                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                if (_T_509) begin
                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h513;
                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                  if (_T_512) begin
                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hdc9ff0ef;
                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                    if (_T_515) begin
                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h50793;
                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                      if (_T_518) begin
                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h78713;
                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                        if (_T_521) begin
                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                          if (_T_524) begin
                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff040693;
                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                            if (_T_527) begin
                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hf687b3;
                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                              if (_T_530) begin
                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfee78c23;
                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                if (_T_533) begin
                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                  if (_T_536) begin
                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h178793;
                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                    if (_T_539) begin
                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                      if (_T_542) begin
                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42703;
                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                        if (_T_545) begin
                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h300793;
                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                          if (_T_548) begin
                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfce7f6e3;
                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                            if (_T_551) begin
                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                              if (_T_554) begin
                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                if (_T_557) begin
                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                  if (_T_560) begin
                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                    if (_T_563) begin
                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hffe77713;
                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                      if (_T_566) begin
                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                        if (_T_569) begin
                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                          if (_T_572) begin
                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                            if (_T_575) begin
                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                              if (_T_578) begin
                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                if (_T_581) begin
                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_584) begin
                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_587) begin
                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_590) begin
                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_593) begin
                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_596) begin
                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_599) begin
                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_602) begin
                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_605) begin
                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfdc42783;
                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_608) begin
                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hfef42423;
                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_611) begin
                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h200793;
                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_614) begin
                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_617) begin
                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h280006f;
                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_620) begin
                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_623) begin
                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hff040713;
                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_626) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_629) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff87c783;
                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_632) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_635) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hd25ff0ef;
                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_638) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_641) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfff78793;
                                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_644) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_647) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_650) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfc07dce3;
                                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_653) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_656) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_659) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_662) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_665) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                          end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                end
                                                                                                                                                                                                              end
                                                                                                                                                                                                            end
                                                                                                                                                                                                          end
                                                                                                                                                                                                        end
                                                                                                                                                                                                      end
                                                                                                                                                                                                    end
                                                                                                                                                                                                  end
                                                                                                                                                                                                end
                                                                                                                                                                                              end
                                                                                                                                                                                            end
                                                                                                                                                                                          end
                                                                                                                                                                                        end
                                                                                                                                                                                      end
                                                                                                                                                                                    end
                                                                                                                                                                                  end
                                                                                                                                                                                end
                                                                                                                                                                              end
                                                                                                                                                                            end
                                                                                                                                                                          end
                                                                                                                                                                        end
                                                                                                                                                                      end
                                                                                                                                                                    end
                                                                                                                                                                  end
                                                                                                                                                                end
                                                                                                                                                              end
                                                                                                                                                            end
                                                                                                                                                          end
                                                                                                                                                        end
                                                                                                                                                      end
                                                                                                                                                    end
                                                                                                                                                  end
                                                                                                                                                end
                                                                                                                                              end
                                                                                                                                            end
                                                                                                                                          end
                                                                                                                                        end
                                                                                                                                      end
                                                                                                                                    end
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule

module WBM_DBus( // @[:@3116.2]
  input  [31:0] io_dbus_addr, // @[:@3119.4]
  input  [31:0] io_dbus_wdata, // @[:@3119.4]
  output [31:0] io_dbus_rdata, // @[:@3119.4]
  input         io_dbus_rd_en, // @[:@3119.4]
  input         io_dbus_wr_en, // @[:@3119.4]
  input  [1:0]  io_dbus_st_type, // @[:@3119.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3119.4]
  output        io_dbus_valid, // @[:@3119.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3119.4]
  output [31:0] io_wbm_m2s_data, // @[:@3119.4]
  output        io_wbm_m2s_we, // @[:@3119.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3119.4]
  output        io_wbm_m2s_stb, // @[:@3119.4]
  input         io_wbm_ack_i, // @[:@3119.4]
  input  [31:0] io_wbm_data_i // @[:@3119.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3123.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3128.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3133.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3134.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3129.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3124.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3137.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3140.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3145.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3146.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3147.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3149.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3150.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3154.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3155.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3156.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3158.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3163.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3168.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3169.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3164.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3159.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3157.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3148.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3141.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3180.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3123.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3128.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3133.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3134.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3129.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3124.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3137.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3140.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3145.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3146.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3147.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3149.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3150.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3154.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3155.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3156.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3158.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3163.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3168.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3169.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3164.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3159.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3157.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3148.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3141.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3180.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3188.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3189.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3177.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3178.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3179.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3182.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3186.4]
endmodule

module UARTTx( // @[:@3191.2]
  input        clock, // @[:@3192.4]
  input        reset, // @[:@3193.4]
  output       io_in_ready, // @[:@3194.4]
  input        io_in_valid, // @[:@3194.4]
  input  [7:0] io_in_bits, // @[:@3194.4]
  output       io_out, // @[:@3194.4]
  input  [9:0] io_div // @[:@3194.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3196.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3197.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3198.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3199.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3200.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3202.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3203.4]
  wire  state1; // @[uart_tx.scala 33:31:@3204.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3208.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3207.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3207.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3220.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3221.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3222.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3223.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3224.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3225.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3226.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3229.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3230.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3231.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3233.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3234.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3236.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3228.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3228.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3228.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3219.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3219.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3219.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3197.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3202.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3203.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3204.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3208.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3207.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3207.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3220.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3221.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3222.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3223.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3224.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3225.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3226.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3229.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3230.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3231.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3233.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3234.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3236.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3228.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3228.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3228.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3219.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3219.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3219.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3206.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3201.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  prescaler = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  shifter = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      prescaler <= 10'h0;
    end else begin
      if (busy) begin
        if (pulse) begin
          prescaler <= _T_55;
        end else begin
          prescaler <= _T_59;
        end
      end
    end
    if (reset) begin
      counter <= 4'h0;
    end else begin
      if (busy) begin
        if (pulse) begin
          counter <= _T_64;
        end else begin
          if (state1) begin
            counter <= 4'hb;
          end
        end
      end else begin
        if (state1) begin
          counter <= 4'hb;
        end
      end
    end
    if (busy) begin
      if (pulse) begin
        shifter <= _T_67;
      end else begin
        if (state1) begin
          shifter <= _T_37;
        end
      end
    end else begin
      if (state1) begin
        shifter <= _T_37;
      end
    end
    if (reset) begin
      out <= 1'h1;
    end else begin
      if (busy) begin
        if (pulse) begin
          out <= _T_68;
        end
      end
    end
  end
endmodule
module UARTRx( // @[:@3241.2]
  input        clock, // @[:@3242.4]
  input        reset, // @[:@3243.4]
  input        io_in, // @[:@3244.4]
  output       io_out_valid, // @[:@3244.4]
  output [7:0] io_out_bits, // @[:@3244.4]
  input  [9:0] io_div // @[:@3244.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3246.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3247.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3248.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3249.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3250.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3251.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3252.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3253.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3254.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3255.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3256.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3257.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3258.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3259.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3259.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3260.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3261.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3265.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3266.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3268.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3270.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3271.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3273.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3273.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3273.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3269.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3269.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3269.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3269.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3285.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3286.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3287.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3295.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3296.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3289.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3289.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3289.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3284.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3284.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3284.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3284.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3284.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3282.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3282.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3282.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3282.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3282.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3282.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3267.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3267.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3267.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3267.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3247.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3249.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3250.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3251.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3252.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3253.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3254.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3255.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3256.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3258.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3259.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3259.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3266.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3268.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3270.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3271.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3273.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3273.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3273.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3269.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3269.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3269.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3269.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3285.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3286.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3287.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3295.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3296.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3289.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3289.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3289.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3284.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3284.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3284.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3284.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3284.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3282.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3267.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3267.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3267.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3267.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3263.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3264.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  data_count = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  prescaler = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  debounce = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  shifter = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  valid = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_35) begin
      if (_T_37) begin
        if (debounce_max) begin
          data_count <= 4'h8;
        end
      end
    end else begin
      if (state) begin
        if (pulse) begin
          data_count <= _T_46;
        end
      end
    end
    if (reset) begin
      prescaler <= 10'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          if (debounce_max) begin
            if (pulse) begin
              prescaler <= _T_21;
            end else begin
              prescaler <= _T_25;
            end
          end
        end
      end else begin
        if (state) begin
          if (pulse) begin
            prescaler <= _T_21;
          end else begin
            prescaler <= _T_25;
          end
        end
      end
    end
    if (reset) begin
      debounce <= 9'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          debounce <= _T_40;
        end
      end else begin
        if (state) begin
          if (pulse) begin
            if (data_last) begin
              debounce <= 9'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      shifter <= 8'h0;
    end else begin
      if (!(_T_35)) begin
        if (state) begin
          if (pulse) begin
            if (!(data_last)) begin
              shifter <= _T_50;
            end
          end
        end
      end
    end
    if (_T_35) begin
      valid <= 1'h0;
    end else begin
      if (state) begin
        if (pulse) begin
          valid <= data_last;
        end else begin
          valid <= 1'h0;
        end
      end else begin
        valid <= 1'h0;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else begin
      if (_T_35) begin
        if (_T_37) begin
          if (debounce_max) begin
            state <= 1'h1;
          end
        end
      end else begin
        if (state) begin
          if (pulse) begin
            if (data_last) begin
              state <= 1'h0;
            end
          end
        end
      end
    end
  end
endmodule
module UART( // @[:@3302.2]
  input         clock, // @[:@3303.4]
  input         reset, // @[:@3304.4]
  input         io_uart_select, // @[:@3305.4]
  output        io_txd, // @[:@3305.4]
  input         io_rxd, // @[:@3305.4]
  output        io_uartInt, // @[:@3305.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3305.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3305.4]
  input         io_wbs_m2s_we, // @[:@3305.4]
  input         io_wbs_m2s_stb, // @[:@3305.4]
  output        io_wbs_ack_o, // @[:@3305.4]
  output [31:0] io_wbs_data_o // @[:@3305.4]
);
  wire  txm_clock; // @[uart.scala 53:19:@3307.4]
  wire  txm_reset; // @[uart.scala 53:19:@3307.4]
  wire  txm_io_in_ready; // @[uart.scala 53:19:@3307.4]
  wire  txm_io_in_valid; // @[uart.scala 53:19:@3307.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 53:19:@3307.4]
  wire  txm_io_out; // @[uart.scala 53:19:@3307.4]
  wire [9:0] txm_io_div; // @[uart.scala 53:19:@3307.4]
  wire  rxm_clock; // @[uart.scala 54:19:@3310.4]
  wire  rxm_reset; // @[uart.scala 54:19:@3310.4]
  wire  rxm_io_in; // @[uart.scala 54:19:@3310.4]
  wire  rxm_io_out_valid; // @[uart.scala 54:19:@3310.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 54:19:@3310.4]
  wire [9:0] rxm_io_div; // @[uart.scala 54:19:@3310.4]
  reg  txen; // @[uart.scala 57:27:@3313.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 60:27:@3315.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 61:27:@3316.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 62:27:@3317.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 63:27:@3318.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 64:27:@3319.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 65:27:@3320.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 85:36:@3330.4]
  wire  _T_63; // @[uart.scala 86:21:@3331.4]
  wire  rd_en; // @[uart.scala 86:36:@3332.4]
  wire  wr_en; // @[uart.scala 87:35:@3333.4]
  wire  _T_70; // @[uart.scala 91:32:@3334.4]
  wire  sel_reg_rx; // @[uart.scala 91:56:@3335.4]
  wire  _T_71; // @[uart.scala 92:32:@3336.4]
  wire  sel_reg_tx; // @[uart.scala 92:56:@3337.4]
  wire  _T_72; // @[uart.scala 93:32:@3338.4]
  wire  sel_reg_baud; // @[uart.scala 93:54:@3339.4]
  wire  _T_73; // @[uart.scala 94:32:@3340.4]
  wire  sel_reg_control; // @[uart.scala 94:57:@3341.4]
  wire  _T_74; // @[uart.scala 95:32:@3342.4]
  wire  sel_reg_status; // @[uart.scala 95:56:@3343.4]
  wire  _T_75; // @[uart.scala 96:32:@3344.4]
  wire  sel_reg_int_mask; // @[uart.scala 96:58:@3345.4]
  reg  ack; // @[uart.scala 99:28:@3346.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 104:28:@3350.4]
  reg [31:0] _RAND_8;
  wire  _T_81; // @[uart.scala 106:14:@3351.4]
  wire  _T_82; // @[uart.scala 108:20:@3356.6]
  wire  _T_83; // @[uart.scala 110:20:@3361.8]
  wire  _T_84; // @[uart.scala 112:20:@3366.10]
  wire [7:0] _GEN_0; // @[uart.scala 112:34:@3367.10]
  wire [7:0] _GEN_1; // @[uart.scala 110:38:@3362.8]
  wire [9:0] _GEN_2; // @[uart.scala 108:36:@3357.6]
  wire [9:0] _GEN_3; // @[uart.scala 106:33:@3352.4]
  wire [7:0] _T_86; // @[uart.scala 120:31:@3374.4]
  wire [7:0] _T_89; // @[uart.scala 125:36:@3379.8]
  wire [7:0] _GEN_4; // @[uart.scala 134:32:@3394.12]
  wire [7:0] _GEN_5; // @[uart.scala 131:31:@3389.10]
  wire [7:0] _GEN_6; // @[uart.scala 131:31:@3389.10]
  wire [9:0] _GEN_7; // @[uart.scala 128:29:@3384.8]
  wire [7:0] _GEN_8; // @[uart.scala 128:29:@3384.8]
  wire [7:0] _GEN_9; // @[uart.scala 128:29:@3384.8]
  wire [7:0] _GEN_10; // @[uart.scala 124:22:@3378.6]
  wire [9:0] _GEN_12; // @[uart.scala 124:22:@3378.6]
  wire [7:0] _GEN_13; // @[uart.scala 124:22:@3378.6]
  wire [7:0] _GEN_14; // @[uart.scala 124:22:@3378.6]
  wire [7:0] _GEN_15; // @[uart.scala 123:15:@3377.4]
  wire  _GEN_16; // @[uart.scala 123:15:@3377.4]
  wire [9:0] _GEN_17; // @[uart.scala 123:15:@3377.4]
  wire [7:0] _GEN_18; // @[uart.scala 123:15:@3377.4]
  wire [7:0] _GEN_19; // @[uart.scala 123:15:@3377.4]
  wire [6:0] _T_94; // @[uart.scala 142:33:@3401.6]
  wire [7:0] _T_96; // @[Cat.scala 30:58:@3402.6]
  wire  _T_97; // @[uart.scala 143:20:@3406.6]
  wire [5:0] _T_99; // @[uart.scala 146:33:@3412.8]
  wire  _T_100; // @[uart.scala 146:65:@3413.8]
  wire [7:0] _T_102; // @[Cat.scala 30:58:@3415.8]
  wire [7:0] _GEN_20; // @[uart.scala 143:38:@3407.6]
  wire [7:0] _GEN_21; // @[uart.scala 140:25:@3399.4]
  wire [7:0] _GEN_22; // @[uart.scala 140:25:@3399.4]
  UARTTx txm ( // @[uart.scala 53:19:@3307.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 54:19:@3310.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 85:36:@3330.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[uart.scala 86:21:@3331.4]
  assign rd_en = _T_63 & io_wbs_m2s_stb; // @[uart.scala 86:36:@3332.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 87:35:@3333.4]
  assign _T_70 = addr == 8'h0; // @[uart.scala 91:32:@3334.4]
  assign sel_reg_rx = _T_70 & io_uart_select; // @[uart.scala 91:56:@3335.4]
  assign _T_71 = addr == 8'h1; // @[uart.scala 92:32:@3336.4]
  assign sel_reg_tx = _T_71 & io_uart_select; // @[uart.scala 92:56:@3337.4]
  assign _T_72 = addr == 8'h2; // @[uart.scala 93:32:@3338.4]
  assign sel_reg_baud = _T_72 & io_uart_select; // @[uart.scala 93:54:@3339.4]
  assign _T_73 = addr == 8'h3; // @[uart.scala 94:32:@3340.4]
  assign sel_reg_control = _T_73 & io_uart_select; // @[uart.scala 94:57:@3341.4]
  assign _T_74 = addr == 8'h4; // @[uart.scala 95:32:@3342.4]
  assign sel_reg_status = _T_74 & io_uart_select; // @[uart.scala 95:56:@3343.4]
  assign _T_75 = addr == 8'h5; // @[uart.scala 96:32:@3344.4]
  assign sel_reg_int_mask = _T_75 & io_uart_select; // @[uart.scala 96:58:@3345.4]
  assign _T_81 = rd_en & sel_reg_control; // @[uart.scala 106:14:@3351.4]
  assign _T_82 = rd_en & sel_reg_baud; // @[uart.scala 108:20:@3356.6]
  assign _T_83 = rd_en & sel_reg_status; // @[uart.scala 110:20:@3361.8]
  assign _T_84 = rd_en & sel_reg_rx; // @[uart.scala 112:20:@3366.10]
  assign _GEN_0 = _T_84 ? rx_data_r : 8'h0; // @[uart.scala 112:34:@3367.10]
  assign _GEN_1 = _T_83 ? status_r : _GEN_0; // @[uart.scala 110:38:@3362.8]
  assign _GEN_2 = _T_82 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 108:36:@3357.6]
  assign _GEN_3 = _T_81 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 106:33:@3352.4]
  assign _T_86 = status_r & int_mask_r; // @[uart.scala 120:31:@3374.4]
  assign _T_89 = io_wbs_m2s_data[7:0]; // @[uart.scala 125:36:@3379.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_89 : int_mask_r; // @[uart.scala 134:32:@3394.12]
  assign _GEN_5 = sel_reg_control ? _T_89 : control_r; // @[uart.scala 131:31:@3389.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 131:31:@3389.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_89} : baud_r; // @[uart.scala 128:29:@3384.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 128:29:@3384.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 128:29:@3384.8]
  assign _GEN_10 = sel_reg_tx ? _T_89 : tx_data_r; // @[uart.scala 124:22:@3378.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 124:22:@3378.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 124:22:@3378.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 124:22:@3378.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 123:15:@3377.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 123:15:@3377.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 123:15:@3377.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 123:15:@3377.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 123:15:@3377.4]
  assign _T_94 = status_r[7:1]; // @[uart.scala 142:33:@3401.6]
  assign _T_96 = {_T_94,1'h1}; // @[Cat.scala 30:58:@3402.6]
  assign _T_97 = wr_en & sel_reg_status; // @[uart.scala 143:20:@3406.6]
  assign _T_99 = status_r[7:2]; // @[uart.scala 146:33:@3412.8]
  assign _T_100 = status_r[0]; // @[uart.scala 146:65:@3413.8]
  assign _T_102 = {_T_99,txm_io_in_ready,_T_100}; // @[Cat.scala 30:58:@3415.8]
  assign _GEN_20 = _T_97 ? _T_89 : _T_102; // @[uart.scala 143:38:@3407.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 140:25:@3399.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_96 : _GEN_20; // @[uart.scala 140:25:@3399.4]
  assign io_txd = txm_io_out; // @[uart.scala 82:19:@3329.4]
  assign io_uartInt = _T_86 != 8'h0; // @[uart.scala 120:18:@3376.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 100:19:@3347.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 117:18:@3373.4]
  assign txm_clock = clock; // @[:@3308.4]
  assign txm_reset = reset; // @[:@3309.4]
  assign txm_io_in_valid = txen; // @[uart.scala 74:19:@3323.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 75:19:@3324.4]
  assign txm_io_div = baud_r; // @[uart.scala 76:19:@3325.4]
  assign rxm_clock = clock; // @[:@3311.4]
  assign rxm_reset = reset; // @[:@3312.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 81:19:@3328.4]
  assign rxm_io_div = baud_r; // @[uart.scala 78:19:@3327.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  txen = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tx_data_r = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rx_data_r = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  control_r = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  baud_r = _RAND_4[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  status_r = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  int_mask_r = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ack = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  rd_data = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      txen <= 1'h0;
    end else begin
      if (wr_en) begin
        txen <= sel_reg_tx;
      end else begin
        txen <= 1'h0;
      end
    end
    if (reset) begin
      tx_data_r <= 8'h4a;
    end else begin
      if (wr_en) begin
        if (sel_reg_tx) begin
          tx_data_r <= _T_89;
        end
      end
    end
    if (reset) begin
      rx_data_r <= 8'h0;
    end else begin
      if (rxm_io_out_valid) begin
        rx_data_r <= rxm_io_out_bits;
      end
    end
    if (reset) begin
      control_r <= 8'h0;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (!(sel_reg_baud)) begin
            if (sel_reg_control) begin
              control_r <= _T_89;
            end
          end
        end
      end
    end
    if (reset) begin
      baud_r <= 10'h8;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (sel_reg_baud) begin
            baud_r <= {{2'd0}, _T_89};
          end
        end
      end
    end
    if (reset) begin
      status_r <= 8'h0;
    end else begin
      if (rxm_io_out_valid) begin
        status_r <= _T_96;
      end else begin
        if (_T_97) begin
          status_r <= _T_89;
        end else begin
          status_r <= _T_102;
        end
      end
    end
    if (reset) begin
      int_mask_r <= 8'h1;
    end else begin
      if (wr_en) begin
        if (!(sel_reg_tx)) begin
          if (!(sel_reg_baud)) begin
            if (!(sel_reg_control)) begin
              if (sel_reg_int_mask) begin
                int_mask_r <= _T_89;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      ack <= 1'h0;
    end else begin
      ack <= io_wbs_m2s_stb;
    end
    if (reset) begin
      rd_data <= 8'h0;
    end else begin
      rd_data <= _GEN_3[7:0];
    end
  end
endmodule
module SPI( // @[:@3419.2]
  input         clock, // @[:@3420.4]
  input         reset, // @[:@3421.4]
  input         io_spi_select, // @[:@3422.4]
  output        io_spi_cs, // @[:@3422.4]
  output        io_spi_clk, // @[:@3422.4]
  output        io_spi_mosi, // @[:@3422.4]
  input         io_spi_miso, // @[:@3422.4]
  output        io_spi_intr, // @[:@3422.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3422.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3422.4]
  input         io_wbs_m2s_we, // @[:@3422.4]
  input         io_wbs_m2s_stb, // @[:@3422.4]
  output        io_wbs_ack_o, // @[:@3422.4]
  output [31:0] io_wbs_data_o // @[:@3422.4]
);
  reg  ack_o; // @[spi.scala 65:25:@3424.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 66:25:@3425.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 69:23:@3427.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 70:23:@3428.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 75:31:@3435.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 78:28:@3438.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 79:28:@3439.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 80:28:@3440.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 82:30:@3441.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 83:30:@3442.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 84:30:@3443.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 87:27:@3444.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 88:27:@3445.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 89:27:@3446.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 90:27:@3447.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 91:27:@3448.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 92:27:@3449.4]
  reg [31:0] _RAND_16;
  reg  bit_toe; // @[spi.scala 95:27:@3450.4]
  reg [31:0] _RAND_17;
  reg  bit_roe; // @[spi.scala 96:27:@3451.4]
  reg [31:0] _RAND_18;
  reg  bit_trdy; // @[spi.scala 97:27:@3452.4]
  reg [31:0] _RAND_19;
  reg  bit_rrdy; // @[spi.scala 98:27:@3453.4]
  reg [31:0] _RAND_20;
  reg  bit_tmt; // @[spi.scala 99:27:@3454.4]
  reg [31:0] _RAND_21;
  reg  bit_e; // @[spi.scala 100:27:@3455.4]
  reg [31:0] _RAND_22;
  wire [7:0] addr; // @[spi.scala 106:33:@3456.4]
  wire  _T_104; // @[spi.scala 108:19:@3457.4]
  wire  rd_en; // @[spi.scala 108:34:@3458.4]
  wire  wr_en; // @[spi.scala 109:33:@3461.4]
  wire  _T_115; // @[spi.scala 113:32:@3465.4]
  wire  sel_reg_rx; // @[spi.scala 113:54:@3466.4]
  wire  _T_116; // @[spi.scala 114:32:@3467.4]
  wire  sel_reg_tx; // @[spi.scala 114:54:@3468.4]
  wire  _T_118; // @[spi.scala 116:32:@3471.4]
  wire  sel_reg_control; // @[spi.scala 116:55:@3472.4]
  wire  _T_119; // @[spi.scala 117:32:@3473.4]
  wire  sel_reg_status; // @[spi.scala 117:54:@3474.4]
  wire  _T_120; // @[spi.scala 118:32:@3475.4]
  wire  sel_reg_ssmask; // @[spi.scala 118:55:@3476.4]
  wire [7:0] _GEN_0; // @[spi.scala 121:23:@3477.4]
  wire  _T_121; // @[spi.scala 126:14:@3480.4]
  wire  _T_122; // @[spi.scala 126:28:@3481.4]
  wire [7:0] latch_s_data; // @[:@3436.4 :@3437.4 spi.scala 110:16:@3464.4]
  wire [7:0] _GEN_1; // @[spi.scala 126:41:@3482.4]
  wire  _T_123; // @[spi.scala 131:19:@3485.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3492.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3499.4]
  wire  _T_138; // @[spi.scala 138:14:@3500.4]
  wire  _T_139; // @[spi.scala 139:30:@3502.6]
  wire  _T_140; // @[spi.scala 140:30:@3504.6]
  wire  _T_141; // @[spi.scala 141:30:@3506.6]
  wire  _T_142; // @[spi.scala 142:30:@3508.6]
  wire  _T_143; // @[spi.scala 143:30:@3510.6]
  wire  _T_144; // @[spi.scala 144:30:@3512.6]
  wire  _GEN_2; // @[spi.scala 138:34:@3501.4]
  wire  _GEN_3; // @[spi.scala 138:34:@3501.4]
  wire  _GEN_4; // @[spi.scala 138:34:@3501.4]
  wire  _GEN_5; // @[spi.scala 138:34:@3501.4]
  wire  _GEN_6; // @[spi.scala 138:34:@3501.4]
  wire  _GEN_7; // @[spi.scala 138:34:@3501.4]
  wire  _T_145; // @[spi.scala 147:37:@3515.4]
  wire  _T_146; // @[spi.scala 147:58:@3516.4]
  wire  _T_147; // @[spi.scala 147:47:@3517.4]
  wire  _T_148; // @[spi.scala 147:25:@3518.4]
  wire  _T_149; // @[spi.scala 147:83:@3519.4]
  wire  _T_150; // @[spi.scala 147:70:@3520.4]
  wire  _T_151; // @[spi.scala 147:108:@3521.4]
  wire  _T_155; // @[spi.scala 154:39:@3529.6]
  wire  _T_156; // @[spi.scala 154:30:@3530.6]
  wire  _GEN_8; // @[spi.scala 154:59:@3531.6]
  wire  _GEN_9; // @[spi.scala 152:15:@3524.4]
  wire  _T_160; // @[spi.scala 161:35:@3540.6]
  wire  _T_161; // @[spi.scala 161:30:@3541.6]
  wire  _GEN_10; // @[spi.scala 161:43:@3542.6]
  wire  _GEN_11; // @[spi.scala 159:15:@3535.4]
  reg [4:0] clock_cnt; // @[spi.scala 166:31:@3545.4]
  reg [31:0] _RAND_23;
  reg [5:0] data_cnt; // @[spi.scala 167:31:@3546.4]
  reg [31:0] _RAND_24;
  reg  pending_data; // @[spi.scala 168:31:@3547.4]
  reg [31:0] _RAND_25;
  reg [2:0] n_status; // @[spi.scala 170:31:@3550.4]
  reg [31:0] _RAND_26;
  reg [2:0] p_status; // @[spi.scala 171:31:@3551.4]
  reg [31:0] _RAND_27;
  wire  _T_174; // @[spi.scala 175:27:@3557.6]
  wire  _GEN_12; // @[spi.scala 175:40:@3558.6]
  wire  _GEN_13; // @[spi.scala 173:32:@3553.4]
  wire [7:0] _T_180; // @[spi.scala 181:78:@3564.6]
  wire [7:0] _T_181; // @[spi.scala 181:44:@3565.6]
  wire [7:0] _T_182; // @[spi.scala 181:12:@3566.6]
  wire [7:0] _T_183; // @[spi.scala 180:49:@3567.6]
  wire [7:0] _T_184; // @[spi.scala 180:21:@3568.6]
  wire [7:0] _GEN_14; // @[spi.scala 179:18:@3561.4]
  wire  _T_185; // @[spi.scala 185:16:@3572.4]
  wire  _GEN_15; // @[spi.scala 185:35:@3573.4]
  wire  _T_188; // @[spi.scala 201:21:@3579.4]
  wire  _T_190; // @[spi.scala 201:49:@3580.4]
  wire  _T_191; // @[spi.scala 201:35:@3581.4]
  wire  _T_192; // @[spi.scala 202:18:@3583.6]
  wire  _GEN_16; // @[spi.scala 201:67:@3582.4]
  wire  _T_196; // @[spi.scala 208:59:@3589.4]
  wire  _T_197; // @[spi.scala 208:39:@3590.4]
  wire  _T_199; // @[spi.scala 208:71:@3592.4]
  wire [8:0] _T_203; // @[Cat.scala 30:58:@3600.8]
  wire [8:0] _GEN_18; // @[spi.scala 208:99:@3593.4]
  wire  _T_204; // @[spi.scala 217:20:@3604.4]
  wire  _T_205; // @[spi.scala 217:47:@3605.4]
  wire  _T_206; // @[spi.scala 217:34:@3606.4]
  wire  _GEN_19; // @[spi.scala 219:33:@3611.6]
  wire  _GEN_20; // @[spi.scala 217:62:@3607.4]
  wire  _T_211; // @[spi.scala 223:49:@3615.4]
  wire  _T_212; // @[spi.scala 223:36:@3616.4]
  wire [5:0] _T_215; // @[spi.scala 226:30:@3621.6]
  wire [4:0] _T_216; // @[spi.scala 226:30:@3622.6]
  wire [4:0] _GEN_21; // @[spi.scala 223:63:@3617.4]
  wire [2:0] _GEN_22; // @[spi.scala 235:26:@3633.6]
  wire  _T_229; // @[spi.scala 246:27:@3652.8]
  wire  _T_233; // @[spi.scala 247:53:@3655.10]
  wire  _T_234; // @[spi.scala 247:40:@3656.10]
  wire [2:0] _GEN_24; // @[spi.scala 247:76:@3657.10]
  wire  _T_238; // @[spi.scala 253:53:@3668.12]
  wire  _T_239; // @[spi.scala 253:40:@3669.12]
  wire  _T_242; // @[spi.scala 253:69:@3671.12]
  wire [2:0] _GEN_25; // @[spi.scala 253:105:@3672.12]
  wire  _T_243; // @[spi.scala 258:27:@3680.12]
  wire [2:0] _GEN_27; // @[spi.scala 259:39:@3683.14]
  wire  _T_247; // @[spi.scala 266:27:@3693.14]
  wire  _T_251; // @[spi.scala 267:53:@3696.16]
  wire  _T_252; // @[spi.scala 267:40:@3697.16]
  wire [2:0] _GEN_28; // @[spi.scala 267:77:@3698.16]
  wire [2:0] _GEN_29; // @[spi.scala 266:44:@3694.14]
  wire [2:0] _GEN_30; // @[spi.scala 258:46:@3681.12]
  wire [2:0] _GEN_31; // @[spi.scala 252:41:@3666.10]
  wire [2:0] _GEN_32; // @[spi.scala 246:40:@3653.8]
  wire [2:0] _GEN_33; // @[spi.scala 240:40:@3642.6]
  wire [2:0] _GEN_34; // @[spi.scala 234:32:@3632.4]
  wire  _T_256; // @[spi.scala 276:32:@3710.4]
  wire  _T_259; // @[spi.scala 276:63:@3712.4]
  wire  _T_266; // @[spi.scala 278:73:@3721.6]
  wire  _T_269; // @[spi.scala 278:102:@3723.6]
  wire  _T_274; // @[spi.scala 280:45:@3730.8]
  wire  _T_277; // @[spi.scala 280:76:@3732.8]
  wire  _T_291; // @[spi.scala 282:133:@3745.10]
  wire  _T_292; // @[spi.scala 282:74:@3746.10]
  wire  _T_297; // @[spi.scala 282:174:@3750.10]
  wire [6:0] _T_299; // @[spi.scala 283:28:@3752.12]
  wire [5:0] _T_300; // @[spi.scala 283:28:@3753.12]
  wire [5:0] _GEN_35; // @[spi.scala 282:238:@3751.10]
  wire [5:0] _GEN_36; // @[spi.scala 280:113:@3733.8]
  wire [5:0] _GEN_37; // @[spi.scala 278:138:@3724.6]
  wire [5:0] _GEN_38; // @[spi.scala 276:99:@3713.4]
  reg  wait_one_tick_done; // @[spi.scala 286:37:@3756.4]
  reg [31:0] _RAND_28;
  wire  _T_321; // @[spi.scala 298:72:@3778.6]
  wire [8:0] _T_328; // @[Cat.scala 30:58:@3783.6]
  wire  _T_341; // @[spi.scala 302:80:@3797.10]
  wire [8:0] _T_348; // @[Cat.scala 30:58:@3802.10]
  wire  _GEN_42; // @[spi.scala 301:32:@3795.8]
  wire [8:0] _GEN_43; // @[spi.scala 301:32:@3795.8]
  wire  _GEN_44; // @[spi.scala 300:114:@3794.6]
  wire [8:0] _GEN_45; // @[spi.scala 300:114:@3794.6]
  wire  _GEN_46; // @[spi.scala 297:37:@3776.4]
  wire [8:0] _GEN_47; // @[spi.scala 297:37:@3776.4]
  wire  _GEN_48; // @[spi.scala 310:39:@3814.6]
  wire  _GEN_49; // @[spi.scala 308:36:@3809.4]
  wire  _T_355; // @[spi.scala 314:12:@3817.4]
  wire  _T_356; // @[spi.scala 314:22:@3818.4]
  wire  _T_357; // @[spi.scala 314:31:@3819.4]
  wire  _T_359; // @[spi.scala 316:24:@3824.6]
  wire  _GEN_50; // @[spi.scala 316:43:@3825.6]
  wire  _GEN_51; // @[spi.scala 314:46:@3820.4]
  wire  _T_364; // @[spi.scala 320:40:@3830.4]
  wire  _GEN_52; // @[spi.scala 321:22:@3832.6]
  wire  _GEN_53; // @[spi.scala 321:22:@3832.6]
  wire  _T_367; // @[spi.scala 326:24:@3840.6]
  wire  _GEN_54; // @[spi.scala 326:39:@3841.6]
  wire  _GEN_55; // @[spi.scala 326:39:@3841.6]
  wire  _GEN_56; // @[spi.scala 320:72:@3831.4]
  wire  _GEN_57; // @[spi.scala 320:72:@3831.4]
  wire  _T_370; // @[spi.scala 331:21:@3845.4]
  wire  _T_371; // @[spi.scala 331:34:@3846.4]
  wire  _GEN_58; // @[spi.scala 331:51:@3847.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 106:33:@3456.4]
  assign _T_104 = io_wbs_m2s_we == 1'h0; // @[spi.scala 108:19:@3457.4]
  assign rd_en = _T_104 & io_wbs_m2s_stb; // @[spi.scala 108:34:@3458.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 109:33:@3461.4]
  assign _T_115 = addr == 8'h0; // @[spi.scala 113:32:@3465.4]
  assign sel_reg_rx = _T_115 & io_spi_select; // @[spi.scala 113:54:@3466.4]
  assign _T_116 = addr == 8'h1; // @[spi.scala 114:32:@3467.4]
  assign sel_reg_tx = _T_116 & io_spi_select; // @[spi.scala 114:54:@3468.4]
  assign _T_118 = addr == 8'h3; // @[spi.scala 116:32:@3471.4]
  assign sel_reg_control = _T_118 & io_spi_select; // @[spi.scala 116:55:@3472.4]
  assign _T_119 = addr == 8'h4; // @[spi.scala 117:32:@3473.4]
  assign sel_reg_status = _T_119 & io_spi_select; // @[spi.scala 117:54:@3474.4]
  assign _T_120 = addr == 8'h5; // @[spi.scala 118:32:@3475.4]
  assign sel_reg_ssmask = _T_120 & io_spi_select; // @[spi.scala 118:55:@3476.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 121:23:@3477.4]
  assign _T_121 = wr_en & sel_reg_tx; // @[spi.scala 126:14:@3480.4]
  assign _T_122 = _T_121 & bit_trdy; // @[spi.scala 126:28:@3481.4]
  assign latch_s_data = io_wbs_m2s_data[7:0]; // @[:@3436.4 :@3437.4 spi.scala 110:16:@3464.4]
  assign _GEN_1 = _T_122 ? latch_s_data : reg_txdata; // @[spi.scala 126:41:@3482.4]
  assign _T_123 = bit_toe | bit_roe; // @[spi.scala 131:19:@3485.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3492.4]
  assign reg_control = {bit_sso,1'h0,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3499.4]
  assign _T_138 = wr_en & sel_reg_control; // @[spi.scala 138:14:@3500.4]
  assign _T_139 = latch_s_data[0]; // @[spi.scala 139:30:@3502.6]
  assign _T_140 = latch_s_data[1]; // @[spi.scala 140:30:@3504.6]
  assign _T_141 = latch_s_data[3]; // @[spi.scala 141:30:@3506.6]
  assign _T_142 = latch_s_data[4]; // @[spi.scala 142:30:@3508.6]
  assign _T_143 = latch_s_data[5]; // @[spi.scala 143:30:@3510.6]
  assign _T_144 = latch_s_data[7]; // @[spi.scala 144:30:@3512.6]
  assign _GEN_2 = _T_138 ? _T_139 : bit_iroe; // @[spi.scala 138:34:@3501.4]
  assign _GEN_3 = _T_138 ? _T_140 : bit_itoe; // @[spi.scala 138:34:@3501.4]
  assign _GEN_4 = _T_138 ? _T_141 : bit_itrdy; // @[spi.scala 138:34:@3501.4]
  assign _GEN_5 = _T_138 ? _T_142 : bit_irrdy; // @[spi.scala 138:34:@3501.4]
  assign _GEN_6 = _T_138 ? _T_143 : bit_ie; // @[spi.scala 138:34:@3501.4]
  assign _GEN_7 = _T_138 ? _T_144 : bit_sso; // @[spi.scala 138:34:@3501.4]
  assign _T_145 = bit_iroe & bit_roe; // @[spi.scala 147:37:@3515.4]
  assign _T_146 = bit_itoe & bit_toe; // @[spi.scala 147:58:@3516.4]
  assign _T_147 = _T_145 | _T_146; // @[spi.scala 147:47:@3517.4]
  assign _T_148 = bit_ie & _T_147; // @[spi.scala 147:25:@3518.4]
  assign _T_149 = bit_itrdy & bit_trdy; // @[spi.scala 147:83:@3519.4]
  assign _T_150 = _T_148 | _T_149; // @[spi.scala 147:70:@3520.4]
  assign _T_151 = bit_irrdy & bit_rrdy; // @[spi.scala 147:108:@3521.4]
  assign _T_155 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 154:39:@3529.6]
  assign _T_156 = io_wbs_m2s_stb & _T_155; // @[spi.scala 154:30:@3530.6]
  assign _GEN_8 = _T_156 ? 1'h1 : ack_o; // @[spi.scala 154:59:@3531.6]
  assign _GEN_9 = ack_o ? 1'h0 : _GEN_8; // @[spi.scala 152:15:@3524.4]
  assign _T_160 = ~ io_wbs_m2s_we; // @[spi.scala 161:35:@3540.6]
  assign _T_161 = io_wbs_m2s_stb & _T_160; // @[spi.scala 161:30:@3541.6]
  assign _GEN_10 = _T_161 ? 1'h1 : read_wait_done; // @[spi.scala 161:43:@3542.6]
  assign _GEN_11 = ack_o ? 1'h0 : _GEN_10; // @[spi.scala 159:15:@3535.4]
  assign _T_174 = n_status == 3'h1; // @[spi.scala 175:27:@3557.6]
  assign _GEN_12 = _T_174 ? 1'h0 : pending_data; // @[spi.scala 175:40:@3558.6]
  assign _GEN_13 = _T_121 ? 1'h1 : _GEN_12; // @[spi.scala 173:32:@3553.4]
  assign _T_180 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 181:78:@3564.6]
  assign _T_181 = sel_reg_control ? reg_control : _T_180; // @[spi.scala 181:44:@3565.6]
  assign _T_182 = sel_reg_status ? reg_status : _T_181; // @[spi.scala 181:12:@3566.6]
  assign _T_183 = sel_reg_tx ? reg_txdata : _T_182; // @[spi.scala 180:49:@3567.6]
  assign _T_184 = sel_reg_rx ? reg_rxdata : _T_183; // @[spi.scala 180:21:@3568.6]
  assign _GEN_14 = rd_en ? _T_184 : rd_data; // @[spi.scala 179:18:@3561.4]
  assign _T_185 = wr_en & sel_reg_ssmask; // @[spi.scala 185:16:@3572.4]
  assign _GEN_15 = _T_185 ? _T_139 : reg_ssmask; // @[spi.scala 185:35:@3573.4]
  assign _T_188 = n_status == 3'h3; // @[spi.scala 201:21:@3579.4]
  assign _T_190 = clock_cnt == 5'h3; // @[spi.scala 201:49:@3580.4]
  assign _T_191 = _T_188 & _T_190; // @[spi.scala 201:35:@3581.4]
  assign _T_192 = ~ sclk_r; // @[spi.scala 202:18:@3583.6]
  assign _GEN_16 = _T_191 ? _T_192 : sclk_r; // @[spi.scala 201:67:@3582.4]
  assign _T_196 = 1'h0 == sclk_r; // @[spi.scala 208:59:@3589.4]
  assign _T_197 = _T_190 & _T_196; // @[spi.scala 208:39:@3590.4]
  assign _T_199 = _T_197 & _T_188; // @[spi.scala 208:71:@3592.4]
  assign _T_203 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3600.8]
  assign _GEN_18 = _T_199 ? _T_203 : {{1'd0}, rx_shift_data}; // @[spi.scala 208:99:@3593.4]
  assign _T_204 = p_status == 3'h3; // @[spi.scala 217:20:@3604.4]
  assign _T_205 = n_status != 3'h3; // @[spi.scala 217:47:@3605.4]
  assign _T_206 = _T_204 & _T_205; // @[spi.scala 217:34:@3606.4]
  assign _GEN_19 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 219:33:@3611.6]
  assign _GEN_20 = _T_206 ? 1'h1 : _GEN_19; // @[spi.scala 217:62:@3607.4]
  assign _T_211 = n_status == 3'h0; // @[spi.scala 223:49:@3615.4]
  assign _T_212 = _T_190 | _T_211; // @[spi.scala 223:36:@3616.4]
  assign _T_215 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3621.6]
  assign _T_216 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3622.6]
  assign _GEN_21 = _T_212 ? 5'h0 : _T_216; // @[spi.scala 223:63:@3617.4]
  assign _GEN_22 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 235:26:@3633.6]
  assign _T_229 = n_status == 3'h2; // @[spi.scala 246:27:@3652.8]
  assign _T_233 = data_cnt == 6'h1; // @[spi.scala 247:53:@3655.10]
  assign _T_234 = _T_190 & _T_233; // @[spi.scala 247:40:@3656.10]
  assign _GEN_24 = _T_234 ? 3'h3 : 3'h2; // @[spi.scala 247:76:@3657.10]
  assign _T_238 = data_cnt == 6'h7; // @[spi.scala 253:53:@3668.12]
  assign _T_239 = _T_190 & _T_238; // @[spi.scala 253:40:@3669.12]
  assign _T_242 = _T_239 & sclk_r; // @[spi.scala 253:69:@3671.12]
  assign _GEN_25 = _T_242 ? 3'h4 : 3'h3; // @[spi.scala 253:105:@3672.12]
  assign _T_243 = n_status == 3'h4; // @[spi.scala 258:27:@3680.12]
  assign _GEN_27 = _T_190 ? 3'h5 : n_status; // @[spi.scala 259:39:@3683.14]
  assign _T_247 = n_status == 3'h5; // @[spi.scala 266:27:@3693.14]
  assign _T_251 = data_cnt == 6'h2; // @[spi.scala 267:53:@3696.16]
  assign _T_252 = _T_190 & _T_251; // @[spi.scala 267:40:@3697.16]
  assign _GEN_28 = _T_252 ? 3'h0 : 3'h5; // @[spi.scala 267:77:@3698.16]
  assign _GEN_29 = _T_247 ? _GEN_28 : 3'h0; // @[spi.scala 266:44:@3694.14]
  assign _GEN_30 = _T_243 ? _GEN_27 : _GEN_29; // @[spi.scala 258:46:@3681.12]
  assign _GEN_31 = _T_188 ? _GEN_25 : _GEN_30; // @[spi.scala 252:41:@3666.10]
  assign _GEN_32 = _T_229 ? _GEN_24 : _GEN_31; // @[spi.scala 246:40:@3653.8]
  assign _GEN_33 = _T_174 ? 3'h2 : _GEN_32; // @[spi.scala 240:40:@3642.6]
  assign _GEN_34 = _T_211 ? _GEN_22 : _GEN_33; // @[spi.scala 234:32:@3632.4]
  assign _T_256 = _T_229 & _T_190; // @[spi.scala 276:32:@3710.4]
  assign _T_259 = _T_256 & _T_233; // @[spi.scala 276:63:@3712.4]
  assign _T_266 = _T_191 & _T_238; // @[spi.scala 278:73:@3721.6]
  assign _T_269 = _T_266 & sclk_r; // @[spi.scala 278:102:@3723.6]
  assign _T_274 = _T_247 & _T_190; // @[spi.scala 280:45:@3730.8]
  assign _T_277 = _T_274 & _T_251; // @[spi.scala 280:76:@3732.8]
  assign _T_291 = _T_191 & sclk_r; // @[spi.scala 282:133:@3745.10]
  assign _T_292 = _T_256 | _T_291; // @[spi.scala 282:74:@3746.10]
  assign _T_297 = _T_292 | _T_274; // @[spi.scala 282:174:@3750.10]
  assign _T_299 = data_cnt + 6'h1; // @[spi.scala 283:28:@3752.12]
  assign _T_300 = data_cnt + 6'h1; // @[spi.scala 283:28:@3753.12]
  assign _GEN_35 = _T_297 ? _T_300 : data_cnt; // @[spi.scala 282:238:@3751.10]
  assign _GEN_36 = _T_277 ? 6'h0 : _GEN_35; // @[spi.scala 280:113:@3733.8]
  assign _GEN_37 = _T_269 ? 6'h0 : _GEN_36; // @[spi.scala 278:138:@3724.6]
  assign _GEN_38 = _T_259 ? 6'h0 : _GEN_37; // @[spi.scala 276:99:@3713.4]
  assign _T_321 = reg_txdata[7]; // @[spi.scala 298:72:@3778.6]
  assign _T_328 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3783.6]
  assign _T_341 = tx_shift_data[7]; // @[spi.scala 302:80:@3797.10]
  assign _T_348 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3802.10]
  assign _GEN_42 = wait_one_tick_done ? _T_341 : mosi_r; // @[spi.scala 301:32:@3795.8]
  assign _GEN_43 = wait_one_tick_done ? _T_348 : {{1'd0}, tx_shift_data}; // @[spi.scala 301:32:@3795.8]
  assign _GEN_44 = _T_291 ? _GEN_42 : mosi_r; // @[spi.scala 300:114:@3794.6]
  assign _GEN_45 = _T_291 ? _GEN_43 : {{1'd0}, tx_shift_data}; // @[spi.scala 300:114:@3794.6]
  assign _GEN_46 = _T_229 ? _T_321 : _GEN_44; // @[spi.scala 297:37:@3776.4]
  assign _GEN_47 = _T_229 ? _T_328 : _GEN_45; // @[spi.scala 297:37:@3776.4]
  assign _GEN_48 = _T_121 ? 1'h0 : bit_trdy; // @[spi.scala 310:39:@3814.6]
  assign _GEN_49 = _T_188 ? 1'h1 : _GEN_48; // @[spi.scala 308:36:@3809.4]
  assign _T_355 = bit_trdy == 1'h0; // @[spi.scala 314:12:@3817.4]
  assign _T_356 = _T_355 & wr_en; // @[spi.scala 314:22:@3818.4]
  assign _T_357 = _T_356 & sel_reg_tx; // @[spi.scala 314:31:@3819.4]
  assign _T_359 = wr_en & sel_reg_status; // @[spi.scala 316:24:@3824.6]
  assign _GEN_50 = _T_359 ? 1'h0 : bit_toe; // @[spi.scala 316:43:@3825.6]
  assign _GEN_51 = _T_357 ? 1'h1 : _GEN_50; // @[spi.scala 314:46:@3820.4]
  assign _T_364 = _T_243 & _T_190; // @[spi.scala 320:40:@3830.4]
  assign _GEN_52 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 321:22:@3832.6]
  assign _GEN_53 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 321:22:@3832.6]
  assign _T_367 = rd_en & sel_reg_rx; // @[spi.scala 326:24:@3840.6]
  assign _GEN_54 = _T_367 ? 1'h0 : bit_rrdy; // @[spi.scala 326:39:@3841.6]
  assign _GEN_55 = _T_367 ? 1'h0 : bit_roe; // @[spi.scala 326:39:@3841.6]
  assign _GEN_56 = _T_364 ? _GEN_52 : _GEN_55; // @[spi.scala 320:72:@3831.4]
  assign _GEN_57 = _T_364 ? _GEN_53 : _GEN_54; // @[spi.scala 320:72:@3831.4]
  assign _T_370 = n_status != 3'h0; // @[spi.scala 331:21:@3845.4]
  assign _T_371 = _T_370 | pending_data; // @[spi.scala 331:34:@3846.4]
  assign _GEN_58 = _T_371 ? 1'h0 : 1'h1; // @[spi.scala 331:51:@3847.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 198:13:@3578.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 204:16:@3586.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 306:15:@3807.4]
  assign io_spi_intr = _T_150 | _T_151; // @[spi.scala 147:14:@3523.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 157:15:@3534.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 183:18:@3571.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ack_o = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rd_data = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  sclk_r = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mosi_r = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  read_wait_done = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reg_rxdata = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_txdata = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_ssmask = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  rx_shift_data = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  tx_shift_data = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  rx_latch_flag = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  bit_iroe = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  bit_itoe = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  bit_itrdy = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  bit_irrdy = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  bit_ie = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  bit_sso = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  bit_toe = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  bit_roe = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  bit_trdy = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  bit_rrdy = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  bit_tmt = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  bit_e = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  clock_cnt = _RAND_23[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  data_cnt = _RAND_24[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  pending_data = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  n_status = _RAND_26[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  p_status = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  wait_one_tick_done = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ack_o <= 1'h0;
    end else begin
      if (ack_o) begin
        ack_o <= 1'h0;
      end else begin
        if (_T_156) begin
          ack_o <= 1'h1;
        end
      end
    end
    if (reset) begin
      rd_data <= 8'h0;
    end else begin
      if (rd_en) begin
        if (sel_reg_rx) begin
          rd_data <= reg_rxdata;
        end else begin
          if (sel_reg_tx) begin
            rd_data <= reg_txdata;
          end else begin
            if (sel_reg_status) begin
              rd_data <= reg_status;
            end else begin
              if (sel_reg_control) begin
                rd_data <= reg_control;
              end else begin
                if (sel_reg_ssmask) begin
                  rd_data <= {{7'd0}, reg_ssmask};
                end else begin
                  rd_data <= 8'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      sclk_r <= 1'h0;
    end else begin
      if (_T_191) begin
        sclk_r <= _T_192;
      end
    end
    if (reset) begin
      mosi_r <= 1'h0;
    end else begin
      if (_T_229) begin
        mosi_r <= _T_321;
      end else begin
        if (_T_291) begin
          if (wait_one_tick_done) begin
            mosi_r <= _T_341;
          end
        end
      end
    end
    if (reset) begin
      read_wait_done <= 1'h0;
    end else begin
      if (ack_o) begin
        read_wait_done <= 1'h0;
      end else begin
        if (_T_161) begin
          read_wait_done <= 1'h1;
        end
      end
    end
    if (reset) begin
      reg_rxdata <= 8'h0;
    end else begin
      if (rx_latch_flag) begin
        reg_rxdata <= rx_shift_data;
      end
    end
    if (reset) begin
      reg_txdata <= 8'h35;
    end else begin
      if (_T_122) begin
        reg_txdata <= latch_s_data;
      end
    end
    if (reset) begin
      reg_ssmask <= 1'h0;
    end else begin
      if (_T_185) begin
        reg_ssmask <= _T_139;
      end
    end
    if (reset) begin
      rx_shift_data <= 8'h0;
    end else begin
      rx_shift_data <= _GEN_18[7:0];
    end
    if (reset) begin
      tx_shift_data <= 8'h0;
    end else begin
      tx_shift_data <= _GEN_47[7:0];
    end
    if (reset) begin
      rx_latch_flag <= 1'h0;
    end else begin
      if (_T_206) begin
        rx_latch_flag <= 1'h1;
      end else begin
        if (rx_latch_flag) begin
          rx_latch_flag <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_iroe <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_iroe <= _T_139;
      end
    end
    if (reset) begin
      bit_itoe <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_itoe <= _T_140;
      end
    end
    if (reset) begin
      bit_itrdy <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_itrdy <= _T_141;
      end
    end
    if (reset) begin
      bit_irrdy <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_irrdy <= _T_142;
      end
    end
    if (reset) begin
      bit_ie <= 1'h0;
    end else begin
      if (_T_138) begin
        bit_ie <= _T_143;
      end
    end
    if (reset) begin
      bit_sso <= 1'h1;
    end else begin
      if (_T_138) begin
        bit_sso <= _T_144;
      end
    end
    if (reset) begin
      bit_toe <= 1'h0;
    end else begin
      if (_T_357) begin
        bit_toe <= 1'h1;
      end else begin
        if (_T_359) begin
          bit_toe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_roe <= 1'h0;
    end else begin
      if (_T_364) begin
        if (bit_rrdy) begin
          bit_roe <= 1'h1;
        end
      end else begin
        if (_T_367) begin
          bit_roe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_trdy <= 1'h1;
    end else begin
      if (_T_188) begin
        bit_trdy <= 1'h1;
      end else begin
        if (_T_121) begin
          bit_trdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_rrdy <= 1'h0;
    end else begin
      if (_T_364) begin
        if (!(bit_rrdy)) begin
          bit_rrdy <= 1'h1;
        end
      end else begin
        if (_T_367) begin
          bit_rrdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_tmt <= 1'h1;
    end else begin
      if (_T_371) begin
        bit_tmt <= 1'h0;
      end else begin
        bit_tmt <= 1'h1;
      end
    end
    if (reset) begin
      bit_e <= 1'h0;
    end else begin
      bit_e <= _T_123;
    end
    if (reset) begin
      clock_cnt <= 5'h0;
    end else begin
      if (_T_212) begin
        clock_cnt <= 5'h0;
      end else begin
        clock_cnt <= _T_216;
      end
    end
    if (reset) begin
      data_cnt <= 6'h0;
    end else begin
      if (_T_259) begin
        data_cnt <= 6'h0;
      end else begin
        if (_T_269) begin
          data_cnt <= 6'h0;
        end else begin
          if (_T_277) begin
            data_cnt <= 6'h0;
          end else begin
            if (_T_297) begin
              data_cnt <= _T_300;
            end
          end
        end
      end
    end
    if (reset) begin
      pending_data <= 1'h0;
    end else begin
      if (_T_121) begin
        pending_data <= 1'h1;
      end else begin
        if (_T_174) begin
          pending_data <= 1'h0;
        end
      end
    end
    if (reset) begin
      n_status <= 3'h0;
    end else begin
      if (_T_211) begin
        if (pending_data) begin
          n_status <= 3'h1;
        end else begin
          n_status <= 3'h0;
        end
      end else begin
        if (_T_174) begin
          n_status <= 3'h2;
        end else begin
          if (_T_229) begin
            if (_T_234) begin
              n_status <= 3'h3;
            end else begin
              n_status <= 3'h2;
            end
          end else begin
            if (_T_188) begin
              if (_T_242) begin
                n_status <= 3'h4;
              end else begin
                n_status <= 3'h3;
              end
            end else begin
              if (_T_243) begin
                if (_T_190) begin
                  n_status <= 3'h5;
                end
              end else begin
                if (_T_247) begin
                  if (_T_252) begin
                    n_status <= 3'h0;
                  end else begin
                    n_status <= 3'h5;
                  end
                end else begin
                  n_status <= 3'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      p_status <= 3'h0;
    end else begin
      p_status <= n_status;
    end
    if (reset) begin
      wait_one_tick_done <= 1'h0;
    end else begin
      wait_one_tick_done <= 1'h1;
    end
  end
endmodule