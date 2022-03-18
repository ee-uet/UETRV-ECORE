module WB_InterConnect( // @[:@12568.2]
  input         clock, // @[:@12569.4]
  input         reset, // @[:@12570.4]
  input  [31:0] io_dbus_addr, // @[:@12571.4]
  input  [31:0] io_dbus_wdata, // @[:@12571.4]
  output [31:0] io_dbus_rdata, // @[:@12571.4]
  input         io_dbus_rd_en, // @[:@12571.4]
  input         io_dbus_wr_en, // @[:@12571.4]
  input  [1:0]  io_dbus_st_type, // @[:@12571.4]
  input  [2:0]  io_dbus_ld_type, // @[:@12571.4]
  output        io_dbus_valid, // @[:@12571.4]
  input  [31:0] io_ibus_addr, // @[:@12571.4]
  output [31:0] io_ibus_inst, // @[:@12571.4]
  output        io_ibus_valid, // @[:@12571.4]
  output        io_uart_tx, // @[:@12571.4]
  input         io_uart_rx, // @[:@12571.4]
  output        io_uart_irq, // @[:@12571.4]
  output        io_spi_cs, // @[:@12571.4]
  output        io_spi_clk, // @[:@12571.4]
  output        io_spi_mosi, // @[:@12571.4]
  input         io_spi_miso, // @[:@12571.4]
  output        io_spi_irq, // @[:@12571.4]
  input         io_qei_ch_a, // @[:@12571.4]
  input         io_qei_ch_b, // @[:@12571.4]
  output        io_pwm_high, // @[:@12571.4]
  output        io_pwm_low, // @[:@12571.4]
  output        io_motor_irq // @[:@12571.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_reset; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 61:24:@12573.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 61:24:@12573.4]
  wire  imem_clock; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_reset; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 62:24:@12576.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 62:24:@12576.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 63:24:@12579.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 63:24:@12579.4]
  wire  uart_clock; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_reset; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 64:24:@12582.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 64:24:@12582.4]
  wire  spi_clock; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_reset; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 65:24:@12585.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 65:24:@12585.4]
  wire  motor_clock; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_reset; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [15:0] motor_io_wbs_m2s_addr; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [31:0] motor_io_wbs_m2s_data; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_m2s_we; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [3:0] motor_io_wbs_m2s_sel; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_m2s_stb; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_wbs_ack_o; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [31:0] motor_io_wbs_data_o; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_ba_match; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_motor_irq; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_qei_ch_a; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_qei_ch_b; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_pwm_high; // @[wb_interconnect.scala 66:24:@12588.4]
  wire  motor_io_pwm_low; // @[wb_interconnect.scala 66:24:@12588.4]
  wire [3:0] address; // @[wb_interconnect.scala 73:50:@12602.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 74:35:@12603.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 75:35:@12604.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 76:35:@12605.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 77:35:@12606.4]
  wire  motor_addr_match; // @[wb_interconnect.scala 78:35:@12607.4]
  reg  imem_sel; // @[wb_interconnect.scala 97:22:@12638.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 98:22:@12639.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 99:22:@12640.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 100:22:@12641.4]
  reg [31:0] _RAND_3;
  reg  motor_sel; // @[wb_interconnect.scala 101:22:@12642.4]
  reg [31:0] _RAND_4;
  wire [31:0] _T_64; // @[wb_interconnect.scala 113:41:@12653.4]
  wire [31:0] _T_65; // @[wb_interconnect.scala 112:39:@12654.4]
  wire [31:0] _T_66; // @[wb_interconnect.scala 111:37:@12655.4]
  wire [31:0] _T_67; // @[wb_interconnect.scala 110:35:@12656.4]
  wire  _T_70; // @[wb_interconnect.scala 118:41:@12659.4]
  wire  _T_71; // @[wb_interconnect.scala 117:39:@12660.4]
  wire  _T_72; // @[wb_interconnect.scala 116:37:@12661.4]
  wire  _T_73; // @[wb_interconnect.scala 115:35:@12662.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 61:24:@12573.4]
    .clock(dmem_clock),
    .reset(dmem_reset),
    .io_wbs_m2s_addr(dmem_io_wbs_m2s_addr),
    .io_wbs_m2s_data(dmem_io_wbs_m2s_data),
    .io_wbs_m2s_we(dmem_io_wbs_m2s_we),
    .io_wbs_m2s_sel(dmem_io_wbs_m2s_sel),
    .io_wbs_m2s_stb(dmem_io_wbs_m2s_stb),
    .io_wbs_ack_o(dmem_io_wbs_ack_o),
    .io_wbs_data_o(dmem_io_wbs_data_o)
  );
  IMem_Interface imem ( // @[wb_interconnect.scala 62:24:@12576.4]
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
    .io_wbs_data_o(imem_io_wbs_data_o)
  );
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 63:24:@12579.4]
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
  UART uart ( // @[wb_interconnect.scala 64:24:@12582.4]
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
  SPI spi ( // @[wb_interconnect.scala 65:24:@12585.4]
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
  Motor_Top motor ( // @[wb_interconnect.scala 66:24:@12588.4]
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
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 73:50:@12602.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 74:35:@12603.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 75:35:@12604.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 76:35:@12605.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 77:35:@12606.4]
  assign motor_addr_match = address == 4'h4; // @[wb_interconnect.scala 78:35:@12607.4]
  assign _T_64 = motor_sel ? motor_io_wbs_data_o : 32'h0; // @[wb_interconnect.scala 113:41:@12653.4]
  assign _T_65 = spi_sel ? spi_io_wbs_data_o : _T_64; // @[wb_interconnect.scala 112:39:@12654.4]
  assign _T_66 = uart_sel ? uart_io_wbs_data_o : _T_65; // @[wb_interconnect.scala 111:37:@12655.4]
  assign _T_67 = imem_sel ? imem_io_wbs_data_o : _T_66; // @[wb_interconnect.scala 110:35:@12656.4]
  assign _T_70 = motor_sel ? motor_io_wbs_ack_o : 1'h0; // @[wb_interconnect.scala 118:41:@12659.4]
  assign _T_71 = spi_sel ? spi_io_wbs_ack_o : _T_70; // @[wb_interconnect.scala 117:39:@12660.4]
  assign _T_72 = uart_sel ? uart_io_wbs_ack_o : _T_71; // @[wb_interconnect.scala 116:37:@12661.4]
  assign _T_73 = imem_sel ? imem_io_wbs_ack_o : _T_72; // @[wb_interconnect.scala 115:35:@12662.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 69:20:@12596.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 69:20:@12591.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 70:20:@12600.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 70:20:@12599.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 124:24:@12667.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 125:24:@12668.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 130:24:@12671.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 131:24:@12672.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 132:24:@12673.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 133:24:@12674.4]
  assign io_pwm_high = motor_io_pwm_high; // @[wb_interconnect.scala 139:24:@12678.4]
  assign io_pwm_low = motor_io_pwm_low; // @[wb_interconnect.scala 140:24:@12679.4]
  assign io_motor_irq = motor_io_motor_irq; // @[wb_interconnect.scala 141:24:@12680.4]
  assign dmem_clock = clock; // @[:@12574.4]
  assign dmem_reset = reset; // @[:@12575.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 81:20:@12613.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 81:20:@12612.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 81:20:@12611.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 81:20:@12610.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 81:20:@12609.4]
  assign imem_clock = clock; // @[:@12577.4]
  assign imem_reset = reset; // @[:@12578.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 70:20:@12601.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 85:20:@12619.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 85:20:@12618.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 85:20:@12617.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 85:20:@12616.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 85:20:@12615.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 69:20:@12598.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 69:20:@12597.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 69:20:@12595.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 69:20:@12594.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 69:20:@12593.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 69:20:@12592.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_73; // @[wb_interconnect.scala 114:26:@12664.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_67; // @[wb_interconnect.scala 109:26:@12658.4]
  assign uart_clock = clock; // @[:@12583.4]
  assign uart_reset = reset; // @[:@12584.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 122:24:@12665.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 123:24:@12666.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 88:20:@12625.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 88:20:@12624.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 88:20:@12623.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 88:20:@12621.4]
  assign spi_clock = clock; // @[:@12586.4]
  assign spi_reset = reset; // @[:@12587.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 128:24:@12669.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 129:24:@12670.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 91:19:@12631.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 91:19:@12630.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 91:19:@12629.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 91:19:@12627.4]
  assign motor_clock = clock; // @[:@12589.4]
  assign motor_reset = reset; // @[:@12590.4]
  assign motor_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 94:20:@12637.4]
  assign motor_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 94:20:@12636.4]
  assign motor_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 94:20:@12635.4]
  assign motor_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 94:20:@12634.4]
  assign motor_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 94:20:@12633.4]
  assign motor_io_ba_match = address == 4'h4; // @[wb_interconnect.scala 136:24:@12675.4]
  assign motor_io_qei_ch_a = io_qei_ch_a; // @[wb_interconnect.scala 137:24:@12676.4]
  assign motor_io_qei_ch_b = io_qei_ch_b; // @[wb_interconnect.scala 138:24:@12677.4]
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
    motor_sel <= motor_addr_match & motor_io_wbs_m2s_stb;
  end
endmodule
