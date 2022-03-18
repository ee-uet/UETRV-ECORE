module UART( // @[:@3382.2]
  input         clock, // @[:@3383.4]
  input         reset, // @[:@3384.4]
  input         io_uart_select, // @[:@3385.4]
  output        io_txd, // @[:@3385.4]
  input         io_rxd, // @[:@3385.4]
  output        io_uartInt, // @[:@3385.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3385.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3385.4]
  input         io_wbs_m2s_we, // @[:@3385.4]
  input         io_wbs_m2s_stb, // @[:@3385.4]
  output        io_wbs_ack_o, // @[:@3385.4]
  output [31:0] io_wbs_data_o // @[:@3385.4]
);
  wire  txm_clock; // @[uart.scala 53:19:@3387.4]
  wire  txm_reset; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_in_ready; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_in_valid; // @[uart.scala 53:19:@3387.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 53:19:@3387.4]
  wire  txm_io_out; // @[uart.scala 53:19:@3387.4]
  wire [9:0] txm_io_div; // @[uart.scala 53:19:@3387.4]
  wire  rxm_clock; // @[uart.scala 54:19:@3390.4]
  wire  rxm_reset; // @[uart.scala 54:19:@3390.4]
  wire  rxm_io_in; // @[uart.scala 54:19:@3390.4]
  wire  rxm_io_out_valid; // @[uart.scala 54:19:@3390.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 54:19:@3390.4]
  wire [9:0] rxm_io_div; // @[uart.scala 54:19:@3390.4]
  reg  txen; // @[uart.scala 57:27:@3393.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 60:27:@3395.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 61:27:@3396.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 62:27:@3397.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 63:27:@3398.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 64:27:@3399.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 65:27:@3400.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 85:36:@3410.4]
  wire  _T_63; // @[uart.scala 86:21:@3411.4]
  wire  rd_en; // @[uart.scala 86:36:@3412.4]
  wire  wr_en; // @[uart.scala 87:35:@3413.4]
  wire  _T_70; // @[uart.scala 91:32:@3414.4]
  wire  sel_reg_rx; // @[uart.scala 91:56:@3415.4]
  wire  _T_71; // @[uart.scala 92:32:@3416.4]
  wire  sel_reg_tx; // @[uart.scala 92:56:@3417.4]
  wire  _T_72; // @[uart.scala 93:32:@3418.4]
  wire  sel_reg_baud; // @[uart.scala 93:54:@3419.4]
  wire  _T_73; // @[uart.scala 94:32:@3420.4]
  wire  sel_reg_control; // @[uart.scala 94:57:@3421.4]
  wire  _T_74; // @[uart.scala 95:32:@3422.4]
  wire  sel_reg_status; // @[uart.scala 95:56:@3423.4]
  wire  _T_75; // @[uart.scala 96:32:@3424.4]
  wire  sel_reg_int_mask; // @[uart.scala 96:58:@3425.4]
  reg  ack; // @[uart.scala 99:28:@3426.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 104:28:@3430.4]
  reg [31:0] _RAND_8;
  wire  _T_81; // @[uart.scala 106:14:@3431.4]
  wire  _T_82; // @[uart.scala 108:20:@3436.6]
  wire  _T_83; // @[uart.scala 110:20:@3441.8]
  wire  _T_84; // @[uart.scala 112:20:@3446.10]
  wire [7:0] _GEN_0; // @[uart.scala 112:34:@3447.10]
  wire [7:0] _GEN_1; // @[uart.scala 110:38:@3442.8]
  wire [9:0] _GEN_2; // @[uart.scala 108:36:@3437.6]
  wire [9:0] _GEN_3; // @[uart.scala 106:33:@3432.4]
  wire [7:0] _T_86; // @[uart.scala 120:31:@3454.4]
  wire [7:0] _T_89; // @[uart.scala 125:36:@3459.8]
  wire [7:0] _GEN_4; // @[uart.scala 134:32:@3474.12]
  wire [7:0] _GEN_5; // @[uart.scala 131:31:@3469.10]
  wire [7:0] _GEN_6; // @[uart.scala 131:31:@3469.10]
  wire [9:0] _GEN_7; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_8; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_9; // @[uart.scala 128:29:@3464.8]
  wire [7:0] _GEN_10; // @[uart.scala 124:22:@3458.6]
  wire [9:0] _GEN_12; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_13; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_14; // @[uart.scala 124:22:@3458.6]
  wire [7:0] _GEN_15; // @[uart.scala 123:15:@3457.4]
  wire  _GEN_16; // @[uart.scala 123:15:@3457.4]
  wire [9:0] _GEN_17; // @[uart.scala 123:15:@3457.4]
  wire [7:0] _GEN_18; // @[uart.scala 123:15:@3457.4]
  wire [7:0] _GEN_19; // @[uart.scala 123:15:@3457.4]
  wire [6:0] _T_94; // @[uart.scala 142:33:@3481.6]
  wire [7:0] _T_96; // @[Cat.scala 30:58:@3482.6]
  wire  _T_97; // @[uart.scala 143:20:@3486.6]
  wire [5:0] _T_99; // @[uart.scala 146:33:@3492.8]
  wire  _T_100; // @[uart.scala 146:65:@3493.8]
  wire [7:0] _T_102; // @[Cat.scala 30:58:@3495.8]
  wire [7:0] _GEN_20; // @[uart.scala 143:38:@3487.6]
  wire [7:0] _GEN_21; // @[uart.scala 140:25:@3479.4]
  wire [7:0] _GEN_22; // @[uart.scala 140:25:@3479.4]
  UARTTx txm ( // @[uart.scala 53:19:@3387.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 54:19:@3390.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 85:36:@3410.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[uart.scala 86:21:@3411.4]
  assign rd_en = _T_63 & io_wbs_m2s_stb; // @[uart.scala 86:36:@3412.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 87:35:@3413.4]
  assign _T_70 = addr == 8'h0; // @[uart.scala 91:32:@3414.4]
  assign sel_reg_rx = _T_70 & io_uart_select; // @[uart.scala 91:56:@3415.4]
  assign _T_71 = addr == 8'h1; // @[uart.scala 92:32:@3416.4]
  assign sel_reg_tx = _T_71 & io_uart_select; // @[uart.scala 92:56:@3417.4]
  assign _T_72 = addr == 8'h2; // @[uart.scala 93:32:@3418.4]
  assign sel_reg_baud = _T_72 & io_uart_select; // @[uart.scala 93:54:@3419.4]
  assign _T_73 = addr == 8'h3; // @[uart.scala 94:32:@3420.4]
  assign sel_reg_control = _T_73 & io_uart_select; // @[uart.scala 94:57:@3421.4]
  assign _T_74 = addr == 8'h4; // @[uart.scala 95:32:@3422.4]
  assign sel_reg_status = _T_74 & io_uart_select; // @[uart.scala 95:56:@3423.4]
  assign _T_75 = addr == 8'h5; // @[uart.scala 96:32:@3424.4]
  assign sel_reg_int_mask = _T_75 & io_uart_select; // @[uart.scala 96:58:@3425.4]
  assign _T_81 = rd_en & sel_reg_control; // @[uart.scala 106:14:@3431.4]
  assign _T_82 = rd_en & sel_reg_baud; // @[uart.scala 108:20:@3436.6]
  assign _T_83 = rd_en & sel_reg_status; // @[uart.scala 110:20:@3441.8]
  assign _T_84 = rd_en & sel_reg_rx; // @[uart.scala 112:20:@3446.10]
  assign _GEN_0 = _T_84 ? rx_data_r : 8'h0; // @[uart.scala 112:34:@3447.10]
  assign _GEN_1 = _T_83 ? status_r : _GEN_0; // @[uart.scala 110:38:@3442.8]
  assign _GEN_2 = _T_82 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 108:36:@3437.6]
  assign _GEN_3 = _T_81 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 106:33:@3432.4]
  assign _T_86 = status_r & int_mask_r; // @[uart.scala 120:31:@3454.4]
  assign _T_89 = io_wbs_m2s_data[7:0]; // @[uart.scala 125:36:@3459.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_89 : int_mask_r; // @[uart.scala 134:32:@3474.12]
  assign _GEN_5 = sel_reg_control ? _T_89 : control_r; // @[uart.scala 131:31:@3469.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 131:31:@3469.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_89} : baud_r; // @[uart.scala 128:29:@3464.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 128:29:@3464.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 128:29:@3464.8]
  assign _GEN_10 = sel_reg_tx ? _T_89 : tx_data_r; // @[uart.scala 124:22:@3458.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 124:22:@3458.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 124:22:@3458.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 124:22:@3458.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 123:15:@3457.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 123:15:@3457.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 123:15:@3457.4]
  assign _T_94 = status_r[7:1]; // @[uart.scala 142:33:@3481.6]
  assign _T_96 = {_T_94,1'h1}; // @[Cat.scala 30:58:@3482.6]
  assign _T_97 = wr_en & sel_reg_status; // @[uart.scala 143:20:@3486.6]
  assign _T_99 = status_r[7:2]; // @[uart.scala 146:33:@3492.8]
  assign _T_100 = status_r[0]; // @[uart.scala 146:65:@3493.8]
  assign _T_102 = {_T_99,txm_io_in_ready,_T_100}; // @[Cat.scala 30:58:@3495.8]
  assign _GEN_20 = _T_97 ? _T_89 : _T_102; // @[uart.scala 143:38:@3487.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 140:25:@3479.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_96 : _GEN_20; // @[uart.scala 140:25:@3479.4]
  assign io_txd = txm_io_out; // @[uart.scala 82:19:@3409.4]
  assign io_uartInt = _T_86 != 8'h0; // @[uart.scala 120:18:@3456.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 100:19:@3427.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 117:18:@3453.4]
  assign txm_clock = clock; // @[:@3388.4]
  assign txm_reset = reset; // @[:@3389.4]
  assign txm_io_in_valid = txen; // @[uart.scala 74:19:@3403.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 75:19:@3404.4]
  assign txm_io_div = baud_r; // @[uart.scala 76:19:@3405.4]
  assign rxm_clock = clock; // @[:@3391.4]
  assign rxm_reset = reset; // @[:@3392.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 81:19:@3408.4]
  assign rxm_io_div = baud_r; // @[uart.scala 78:19:@3407.4]
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

module UARTTx( // @[:@3271.2]
  input        clock, // @[:@3272.4]
  input        reset, // @[:@3273.4]
  output       io_in_ready, // @[:@3274.4]
  input        io_in_valid, // @[:@3274.4]
  input  [7:0] io_in_bits, // @[:@3274.4]
  output       io_out, // @[:@3274.4]
  input  [9:0] io_div // @[:@3274.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3276.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3277.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3278.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3279.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3280.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3282.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3283.4]
  wire  state1; // @[uart_tx.scala 33:31:@3284.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3288.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3287.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3287.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3300.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3301.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3302.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3303.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3304.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3305.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3306.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3309.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3310.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3311.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3313.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3314.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3316.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3308.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3308.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3308.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3299.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3299.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3299.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3277.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3282.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3283.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3284.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3288.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3287.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3287.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3300.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3301.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3302.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3303.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3304.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3305.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3306.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3309.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3310.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3311.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3313.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3314.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3316.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3308.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3299.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3299.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3299.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3286.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3281.4]
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

module UARTRx( // @[:@3321.2]
  input        clock, // @[:@3322.4]
  input        reset, // @[:@3323.4]
  input        io_in, // @[:@3324.4]
  output       io_out_valid, // @[:@3324.4]
  output [7:0] io_out_bits, // @[:@3324.4]
  input  [9:0] io_div // @[:@3324.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3326.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3327.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3328.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3329.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3330.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3331.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3332.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3333.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3334.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3335.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3336.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3337.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3338.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3339.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3339.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3340.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3341.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3345.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3346.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3348.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3350.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3351.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3353.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3353.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3353.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3349.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3349.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3349.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3349.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3365.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3366.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3367.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3375.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3376.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3369.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3369.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3369.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3364.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3364.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3364.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3364.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3364.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3362.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3362.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3362.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3362.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3362.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3362.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3347.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3347.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3347.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3347.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3327.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3329.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3330.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3331.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3332.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3333.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3334.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3335.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3336.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3338.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3339.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3339.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3346.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3348.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3350.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3351.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3353.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3349.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3349.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3365.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3366.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3367.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3375.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3376.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3369.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3364.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3362.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3347.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3347.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3343.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3344.4]
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
