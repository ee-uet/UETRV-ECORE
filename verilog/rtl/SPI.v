module SPI( // @[:@3499.2]
  input         clock, // @[:@3500.4]
  input         reset, // @[:@3501.4]
  input         io_spi_select, // @[:@3502.4]
  output        io_spi_cs, // @[:@3502.4]
  output        io_spi_clk, // @[:@3502.4]
  output        io_spi_mosi, // @[:@3502.4]
  input         io_spi_miso, // @[:@3502.4]
  output        io_spi_intr, // @[:@3502.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3502.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3502.4]
  input         io_wbs_m2s_we, // @[:@3502.4]
  input         io_wbs_m2s_stb, // @[:@3502.4]
  output        io_wbs_ack_o, // @[:@3502.4]
  output [31:0] io_wbs_data_o // @[:@3502.4]
);
  reg  ack_o; // @[spi.scala 65:25:@3504.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 66:25:@3505.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 69:23:@3507.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 70:23:@3508.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 75:31:@3515.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 78:28:@3518.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 79:28:@3519.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 80:28:@3520.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 82:30:@3521.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 83:30:@3522.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 84:30:@3523.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 87:27:@3524.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 88:27:@3525.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 89:27:@3526.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 90:27:@3527.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 91:27:@3528.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 92:27:@3529.4]
  reg [31:0] _RAND_16;
  reg  bit_toe; // @[spi.scala 95:27:@3530.4]
  reg [31:0] _RAND_17;
  reg  bit_roe; // @[spi.scala 96:27:@3531.4]
  reg [31:0] _RAND_18;
  reg  bit_trdy; // @[spi.scala 97:27:@3532.4]
  reg [31:0] _RAND_19;
  reg  bit_rrdy; // @[spi.scala 98:27:@3533.4]
  reg [31:0] _RAND_20;
  reg  bit_tmt; // @[spi.scala 99:27:@3534.4]
  reg [31:0] _RAND_21;
  reg  bit_e; // @[spi.scala 100:27:@3535.4]
  reg [31:0] _RAND_22;
  wire [7:0] addr; // @[spi.scala 106:33:@3536.4]
  wire  _T_104; // @[spi.scala 108:19:@3537.4]
  wire  rd_en; // @[spi.scala 108:34:@3538.4]
  wire  wr_en; // @[spi.scala 109:33:@3541.4]
  wire  _T_115; // @[spi.scala 113:32:@3545.4]
  wire  sel_reg_rx; // @[spi.scala 113:54:@3546.4]
  wire  _T_116; // @[spi.scala 114:32:@3547.4]
  wire  sel_reg_tx; // @[spi.scala 114:54:@3548.4]
  wire  _T_118; // @[spi.scala 116:32:@3551.4]
  wire  sel_reg_control; // @[spi.scala 116:55:@3552.4]
  wire  _T_119; // @[spi.scala 117:32:@3553.4]
  wire  sel_reg_status; // @[spi.scala 117:54:@3554.4]
  wire  _T_120; // @[spi.scala 118:32:@3555.4]
  wire  sel_reg_ssmask; // @[spi.scala 118:55:@3556.4]
  wire [7:0] _GEN_0; // @[spi.scala 121:23:@3557.4]
  wire  _T_121; // @[spi.scala 126:14:@3560.4]
  wire  _T_122; // @[spi.scala 126:28:@3561.4]
  wire [7:0] latch_s_data; // @[:@3516.4 :@3517.4 spi.scala 110:16:@3544.4]
  wire [7:0] _GEN_1; // @[spi.scala 126:41:@3562.4]
  wire  _T_123; // @[spi.scala 131:19:@3565.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3572.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3579.4]
  wire  _T_138; // @[spi.scala 138:14:@3580.4]
  wire  _T_139; // @[spi.scala 139:30:@3582.6]
  wire  _T_140; // @[spi.scala 140:30:@3584.6]
  wire  _T_141; // @[spi.scala 141:30:@3586.6]
  wire  _T_142; // @[spi.scala 142:30:@3588.6]
  wire  _T_143; // @[spi.scala 143:30:@3590.6]
  wire  _T_144; // @[spi.scala 144:30:@3592.6]
  wire  _GEN_2; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_3; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_4; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_5; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_6; // @[spi.scala 138:34:@3581.4]
  wire  _GEN_7; // @[spi.scala 138:34:@3581.4]
  wire  _T_145; // @[spi.scala 147:37:@3595.4]
  wire  _T_146; // @[spi.scala 147:58:@3596.4]
  wire  _T_147; // @[spi.scala 147:47:@3597.4]
  wire  _T_148; // @[spi.scala 147:25:@3598.4]
  wire  _T_149; // @[spi.scala 147:83:@3599.4]
  wire  _T_150; // @[spi.scala 147:70:@3600.4]
  wire  _T_151; // @[spi.scala 147:108:@3601.4]
  wire  _T_155; // @[spi.scala 154:39:@3609.6]
  wire  _T_156; // @[spi.scala 154:30:@3610.6]
  wire  _GEN_8; // @[spi.scala 154:59:@3611.6]
  wire  _GEN_9; // @[spi.scala 152:15:@3604.4]
  wire  _T_160; // @[spi.scala 161:35:@3620.6]
  wire  _T_161; // @[spi.scala 161:30:@3621.6]
  wire  _GEN_10; // @[spi.scala 161:43:@3622.6]
  wire  _GEN_11; // @[spi.scala 159:15:@3615.4]
  reg [4:0] clock_cnt; // @[spi.scala 166:31:@3625.4]
  reg [31:0] _RAND_23;
  reg [5:0] data_cnt; // @[spi.scala 167:31:@3626.4]
  reg [31:0] _RAND_24;
  reg  pending_data; // @[spi.scala 168:31:@3627.4]
  reg [31:0] _RAND_25;
  reg [2:0] n_status; // @[spi.scala 170:31:@3630.4]
  reg [31:0] _RAND_26;
  reg [2:0] p_status; // @[spi.scala 171:31:@3631.4]
  reg [31:0] _RAND_27;
  wire  _T_174; // @[spi.scala 175:27:@3637.6]
  wire  _GEN_12; // @[spi.scala 175:40:@3638.6]
  wire  _GEN_13; // @[spi.scala 173:32:@3633.4]
  wire [7:0] _T_180; // @[spi.scala 181:78:@3644.6]
  wire [7:0] _T_181; // @[spi.scala 181:44:@3645.6]
  wire [7:0] _T_182; // @[spi.scala 181:12:@3646.6]
  wire [7:0] _T_183; // @[spi.scala 180:49:@3647.6]
  wire [7:0] _T_184; // @[spi.scala 180:21:@3648.6]
  wire [7:0] _GEN_14; // @[spi.scala 179:18:@3641.4]
  wire  _T_185; // @[spi.scala 185:16:@3652.4]
  wire  _GEN_15; // @[spi.scala 185:35:@3653.4]
  wire  _T_188; // @[spi.scala 201:21:@3659.4]
  wire  _T_190; // @[spi.scala 201:49:@3660.4]
  wire  _T_191; // @[spi.scala 201:35:@3661.4]
  wire  _T_192; // @[spi.scala 202:18:@3663.6]
  wire  _GEN_16; // @[spi.scala 201:67:@3662.4]
  wire  _T_196; // @[spi.scala 208:59:@3669.4]
  wire  _T_197; // @[spi.scala 208:39:@3670.4]
  wire  _T_199; // @[spi.scala 208:71:@3672.4]
  wire [8:0] _T_203; // @[Cat.scala 30:58:@3680.8]
  wire [8:0] _GEN_18; // @[spi.scala 208:99:@3673.4]
  wire  _T_204; // @[spi.scala 217:20:@3684.4]
  wire  _T_205; // @[spi.scala 217:47:@3685.4]
  wire  _T_206; // @[spi.scala 217:34:@3686.4]
  wire  _GEN_19; // @[spi.scala 219:33:@3691.6]
  wire  _GEN_20; // @[spi.scala 217:62:@3687.4]
  wire  _T_211; // @[spi.scala 223:49:@3695.4]
  wire  _T_212; // @[spi.scala 223:36:@3696.4]
  wire [5:0] _T_215; // @[spi.scala 226:30:@3701.6]
  wire [4:0] _T_216; // @[spi.scala 226:30:@3702.6]
  wire [4:0] _GEN_21; // @[spi.scala 223:63:@3697.4]
  wire [2:0] _GEN_22; // @[spi.scala 235:26:@3713.6]
  wire  _T_229; // @[spi.scala 246:27:@3732.8]
  wire  _T_233; // @[spi.scala 247:53:@3735.10]
  wire  _T_234; // @[spi.scala 247:40:@3736.10]
  wire [2:0] _GEN_24; // @[spi.scala 247:76:@3737.10]
  wire  _T_238; // @[spi.scala 253:53:@3748.12]
  wire  _T_239; // @[spi.scala 253:40:@3749.12]
  wire  _T_242; // @[spi.scala 253:69:@3751.12]
  wire [2:0] _GEN_25; // @[spi.scala 253:105:@3752.12]
  wire  _T_243; // @[spi.scala 258:27:@3760.12]
  wire [2:0] _GEN_27; // @[spi.scala 259:39:@3763.14]
  wire  _T_247; // @[spi.scala 266:27:@3773.14]
  wire  _T_251; // @[spi.scala 267:53:@3776.16]
  wire  _T_252; // @[spi.scala 267:40:@3777.16]
  wire [2:0] _GEN_28; // @[spi.scala 267:77:@3778.16]
  wire [2:0] _GEN_29; // @[spi.scala 266:44:@3774.14]
  wire [2:0] _GEN_30; // @[spi.scala 258:46:@3761.12]
  wire [2:0] _GEN_31; // @[spi.scala 252:41:@3746.10]
  wire [2:0] _GEN_32; // @[spi.scala 246:40:@3733.8]
  wire [2:0] _GEN_33; // @[spi.scala 240:40:@3722.6]
  wire [2:0] _GEN_34; // @[spi.scala 234:32:@3712.4]
  wire  _T_256; // @[spi.scala 276:32:@3790.4]
  wire  _T_259; // @[spi.scala 276:63:@3792.4]
  wire  _T_266; // @[spi.scala 278:73:@3801.6]
  wire  _T_269; // @[spi.scala 278:102:@3803.6]
  wire  _T_274; // @[spi.scala 280:45:@3810.8]
  wire  _T_277; // @[spi.scala 280:76:@3812.8]
  wire  _T_291; // @[spi.scala 282:133:@3825.10]
  wire  _T_292; // @[spi.scala 282:74:@3826.10]
  wire  _T_297; // @[spi.scala 282:174:@3830.10]
  wire [6:0] _T_299; // @[spi.scala 283:28:@3832.12]
  wire [5:0] _T_300; // @[spi.scala 283:28:@3833.12]
  wire [5:0] _GEN_35; // @[spi.scala 282:238:@3831.10]
  wire [5:0] _GEN_36; // @[spi.scala 280:113:@3813.8]
  wire [5:0] _GEN_37; // @[spi.scala 278:138:@3804.6]
  wire [5:0] _GEN_38; // @[spi.scala 276:99:@3793.4]
  reg  wait_one_tick_done; // @[spi.scala 286:37:@3836.4]
  reg [31:0] _RAND_28;
  wire  _T_321; // @[spi.scala 298:72:@3858.6]
  wire [8:0] _T_328; // @[Cat.scala 30:58:@3863.6]
  wire  _T_341; // @[spi.scala 302:80:@3877.10]
  wire [8:0] _T_348; // @[Cat.scala 30:58:@3882.10]
  wire  _GEN_42; // @[spi.scala 301:32:@3875.8]
  wire [8:0] _GEN_43; // @[spi.scala 301:32:@3875.8]
  wire  _GEN_44; // @[spi.scala 300:114:@3874.6]
  wire [8:0] _GEN_45; // @[spi.scala 300:114:@3874.6]
  wire  _GEN_46; // @[spi.scala 297:37:@3856.4]
  wire [8:0] _GEN_47; // @[spi.scala 297:37:@3856.4]
  wire  _GEN_48; // @[spi.scala 310:39:@3894.6]
  wire  _GEN_49; // @[spi.scala 308:36:@3889.4]
  wire  _T_355; // @[spi.scala 314:12:@3897.4]
  wire  _T_356; // @[spi.scala 314:22:@3898.4]
  wire  _T_357; // @[spi.scala 314:31:@3899.4]
  wire  _T_359; // @[spi.scala 316:24:@3904.6]
  wire  _GEN_50; // @[spi.scala 316:43:@3905.6]
  wire  _GEN_51; // @[spi.scala 314:46:@3900.4]
  wire  _T_364; // @[spi.scala 320:40:@3910.4]
  wire  _GEN_52; // @[spi.scala 321:22:@3912.6]
  wire  _GEN_53; // @[spi.scala 321:22:@3912.6]
  wire  _T_367; // @[spi.scala 326:24:@3920.6]
  wire  _GEN_54; // @[spi.scala 326:39:@3921.6]
  wire  _GEN_55; // @[spi.scala 326:39:@3921.6]
  wire  _GEN_56; // @[spi.scala 320:72:@3911.4]
  wire  _GEN_57; // @[spi.scala 320:72:@3911.4]
  wire  _T_370; // @[spi.scala 331:21:@3925.4]
  wire  _T_371; // @[spi.scala 331:34:@3926.4]
  wire  _GEN_58; // @[spi.scala 331:51:@3927.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 106:33:@3536.4]
  assign _T_104 = io_wbs_m2s_we == 1'h0; // @[spi.scala 108:19:@3537.4]
  assign rd_en = _T_104 & io_wbs_m2s_stb; // @[spi.scala 108:34:@3538.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 109:33:@3541.4]
  assign _T_115 = addr == 8'h0; // @[spi.scala 113:32:@3545.4]
  assign sel_reg_rx = _T_115 & io_spi_select; // @[spi.scala 113:54:@3546.4]
  assign _T_116 = addr == 8'h1; // @[spi.scala 114:32:@3547.4]
  assign sel_reg_tx = _T_116 & io_spi_select; // @[spi.scala 114:54:@3548.4]
  assign _T_118 = addr == 8'h3; // @[spi.scala 116:32:@3551.4]
  assign sel_reg_control = _T_118 & io_spi_select; // @[spi.scala 116:55:@3552.4]
  assign _T_119 = addr == 8'h4; // @[spi.scala 117:32:@3553.4]
  assign sel_reg_status = _T_119 & io_spi_select; // @[spi.scala 117:54:@3554.4]
  assign _T_120 = addr == 8'h5; // @[spi.scala 118:32:@3555.4]
  assign sel_reg_ssmask = _T_120 & io_spi_select; // @[spi.scala 118:55:@3556.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 121:23:@3557.4]
  assign _T_121 = wr_en & sel_reg_tx; // @[spi.scala 126:14:@3560.4]
  assign _T_122 = _T_121 & bit_trdy; // @[spi.scala 126:28:@3561.4]
  assign latch_s_data = io_wbs_m2s_data[7:0]; // @[:@3516.4 :@3517.4 spi.scala 110:16:@3544.4]
  assign _GEN_1 = _T_122 ? latch_s_data : reg_txdata; // @[spi.scala 126:41:@3562.4]
  assign _T_123 = bit_toe | bit_roe; // @[spi.scala 131:19:@3565.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3572.4]
  assign reg_control = {bit_sso,1'h0,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3579.4]
  assign _T_138 = wr_en & sel_reg_control; // @[spi.scala 138:14:@3580.4]
  assign _T_139 = latch_s_data[0]; // @[spi.scala 139:30:@3582.6]
  assign _T_140 = latch_s_data[1]; // @[spi.scala 140:30:@3584.6]
  assign _T_141 = latch_s_data[3]; // @[spi.scala 141:30:@3586.6]
  assign _T_142 = latch_s_data[4]; // @[spi.scala 142:30:@3588.6]
  assign _T_143 = latch_s_data[5]; // @[spi.scala 143:30:@3590.6]
  assign _T_144 = latch_s_data[7]; // @[spi.scala 144:30:@3592.6]
  assign _GEN_2 = _T_138 ? _T_139 : bit_iroe; // @[spi.scala 138:34:@3581.4]
  assign _GEN_3 = _T_138 ? _T_140 : bit_itoe; // @[spi.scala 138:34:@3581.4]
  assign _GEN_4 = _T_138 ? _T_141 : bit_itrdy; // @[spi.scala 138:34:@3581.4]
  assign _GEN_5 = _T_138 ? _T_142 : bit_irrdy; // @[spi.scala 138:34:@3581.4]
  assign _GEN_6 = _T_138 ? _T_143 : bit_ie; // @[spi.scala 138:34:@3581.4]
  assign _GEN_7 = _T_138 ? _T_144 : bit_sso; // @[spi.scala 138:34:@3581.4]
  assign _T_145 = bit_iroe & bit_roe; // @[spi.scala 147:37:@3595.4]
  assign _T_146 = bit_itoe & bit_toe; // @[spi.scala 147:58:@3596.4]
  assign _T_147 = _T_145 | _T_146; // @[spi.scala 147:47:@3597.4]
  assign _T_148 = bit_ie & _T_147; // @[spi.scala 147:25:@3598.4]
  assign _T_149 = bit_itrdy & bit_trdy; // @[spi.scala 147:83:@3599.4]
  assign _T_150 = _T_148 | _T_149; // @[spi.scala 147:70:@3600.4]
  assign _T_151 = bit_irrdy & bit_rrdy; // @[spi.scala 147:108:@3601.4]
  assign _T_155 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 154:39:@3609.6]
  assign _T_156 = io_wbs_m2s_stb & _T_155; // @[spi.scala 154:30:@3610.6]
  assign _GEN_8 = _T_156 ? 1'h1 : ack_o; // @[spi.scala 154:59:@3611.6]
  assign _GEN_9 = ack_o ? 1'h0 : _GEN_8; // @[spi.scala 152:15:@3604.4]
  assign _T_160 = ~ io_wbs_m2s_we; // @[spi.scala 161:35:@3620.6]
  assign _T_161 = io_wbs_m2s_stb & _T_160; // @[spi.scala 161:30:@3621.6]
  assign _GEN_10 = _T_161 ? 1'h1 : read_wait_done; // @[spi.scala 161:43:@3622.6]
  assign _GEN_11 = ack_o ? 1'h0 : _GEN_10; // @[spi.scala 159:15:@3615.4]
  assign _T_174 = n_status == 3'h1; // @[spi.scala 175:27:@3637.6]
  assign _GEN_12 = _T_174 ? 1'h0 : pending_data; // @[spi.scala 175:40:@3638.6]
  assign _GEN_13 = _T_121 ? 1'h1 : _GEN_12; // @[spi.scala 173:32:@3633.4]
  assign _T_180 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 181:78:@3644.6]
  assign _T_181 = sel_reg_control ? reg_control : _T_180; // @[spi.scala 181:44:@3645.6]
  assign _T_182 = sel_reg_status ? reg_status : _T_181; // @[spi.scala 181:12:@3646.6]
  assign _T_183 = sel_reg_tx ? reg_txdata : _T_182; // @[spi.scala 180:49:@3647.6]
  assign _T_184 = sel_reg_rx ? reg_rxdata : _T_183; // @[spi.scala 180:21:@3648.6]
  assign _GEN_14 = rd_en ? _T_184 : rd_data; // @[spi.scala 179:18:@3641.4]
  assign _T_185 = wr_en & sel_reg_ssmask; // @[spi.scala 185:16:@3652.4]
  assign _GEN_15 = _T_185 ? _T_139 : reg_ssmask; // @[spi.scala 185:35:@3653.4]
  assign _T_188 = n_status == 3'h3; // @[spi.scala 201:21:@3659.4]
  assign _T_190 = clock_cnt == 5'h3; // @[spi.scala 201:49:@3660.4]
  assign _T_191 = _T_188 & _T_190; // @[spi.scala 201:35:@3661.4]
  assign _T_192 = ~ sclk_r; // @[spi.scala 202:18:@3663.6]
  assign _GEN_16 = _T_191 ? _T_192 : sclk_r; // @[spi.scala 201:67:@3662.4]
  assign _T_196 = 1'h0 == sclk_r; // @[spi.scala 208:59:@3669.4]
  assign _T_197 = _T_190 & _T_196; // @[spi.scala 208:39:@3670.4]
  assign _T_199 = _T_197 & _T_188; // @[spi.scala 208:71:@3672.4]
  assign _T_203 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3680.8]
  assign _GEN_18 = _T_199 ? _T_203 : {{1'd0}, rx_shift_data}; // @[spi.scala 208:99:@3673.4]
  assign _T_204 = p_status == 3'h3; // @[spi.scala 217:20:@3684.4]
  assign _T_205 = n_status != 3'h3; // @[spi.scala 217:47:@3685.4]
  assign _T_206 = _T_204 & _T_205; // @[spi.scala 217:34:@3686.4]
  assign _GEN_19 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 219:33:@3691.6]
  assign _GEN_20 = _T_206 ? 1'h1 : _GEN_19; // @[spi.scala 217:62:@3687.4]
  assign _T_211 = n_status == 3'h0; // @[spi.scala 223:49:@3695.4]
  assign _T_212 = _T_190 | _T_211; // @[spi.scala 223:36:@3696.4]
  assign _T_215 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3701.6]
  assign _T_216 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3702.6]
  assign _GEN_21 = _T_212 ? 5'h0 : _T_216; // @[spi.scala 223:63:@3697.4]
  assign _GEN_22 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 235:26:@3713.6]
  assign _T_229 = n_status == 3'h2; // @[spi.scala 246:27:@3732.8]
  assign _T_233 = data_cnt == 6'h1; // @[spi.scala 247:53:@3735.10]
  assign _T_234 = _T_190 & _T_233; // @[spi.scala 247:40:@3736.10]
  assign _GEN_24 = _T_234 ? 3'h3 : 3'h2; // @[spi.scala 247:76:@3737.10]
  assign _T_238 = data_cnt == 6'h7; // @[spi.scala 253:53:@3748.12]
  assign _T_239 = _T_190 & _T_238; // @[spi.scala 253:40:@3749.12]
  assign _T_242 = _T_239 & sclk_r; // @[spi.scala 253:69:@3751.12]
  assign _GEN_25 = _T_242 ? 3'h4 : 3'h3; // @[spi.scala 253:105:@3752.12]
  assign _T_243 = n_status == 3'h4; // @[spi.scala 258:27:@3760.12]
  assign _GEN_27 = _T_190 ? 3'h5 : n_status; // @[spi.scala 259:39:@3763.14]
  assign _T_247 = n_status == 3'h5; // @[spi.scala 266:27:@3773.14]
  assign _T_251 = data_cnt == 6'h2; // @[spi.scala 267:53:@3776.16]
  assign _T_252 = _T_190 & _T_251; // @[spi.scala 267:40:@3777.16]
  assign _GEN_28 = _T_252 ? 3'h0 : 3'h5; // @[spi.scala 267:77:@3778.16]
  assign _GEN_29 = _T_247 ? _GEN_28 : 3'h0; // @[spi.scala 266:44:@3774.14]
  assign _GEN_30 = _T_243 ? _GEN_27 : _GEN_29; // @[spi.scala 258:46:@3761.12]
  assign _GEN_31 = _T_188 ? _GEN_25 : _GEN_30; // @[spi.scala 252:41:@3746.10]
  assign _GEN_32 = _T_229 ? _GEN_24 : _GEN_31; // @[spi.scala 246:40:@3733.8]
  assign _GEN_33 = _T_174 ? 3'h2 : _GEN_32; // @[spi.scala 240:40:@3722.6]
  assign _GEN_34 = _T_211 ? _GEN_22 : _GEN_33; // @[spi.scala 234:32:@3712.4]
  assign _T_256 = _T_229 & _T_190; // @[spi.scala 276:32:@3790.4]
  assign _T_259 = _T_256 & _T_233; // @[spi.scala 276:63:@3792.4]
  assign _T_266 = _T_191 & _T_238; // @[spi.scala 278:73:@3801.6]
  assign _T_269 = _T_266 & sclk_r; // @[spi.scala 278:102:@3803.6]
  assign _T_274 = _T_247 & _T_190; // @[spi.scala 280:45:@3810.8]
  assign _T_277 = _T_274 & _T_251; // @[spi.scala 280:76:@3812.8]
  assign _T_291 = _T_191 & sclk_r; // @[spi.scala 282:133:@3825.10]
  assign _T_292 = _T_256 | _T_291; // @[spi.scala 282:74:@3826.10]
  assign _T_297 = _T_292 | _T_274; // @[spi.scala 282:174:@3830.10]
  assign _T_299 = data_cnt + 6'h1; // @[spi.scala 283:28:@3832.12]
  assign _T_300 = data_cnt + 6'h1; // @[spi.scala 283:28:@3833.12]
  assign _GEN_35 = _T_297 ? _T_300 : data_cnt; // @[spi.scala 282:238:@3831.10]
  assign _GEN_36 = _T_277 ? 6'h0 : _GEN_35; // @[spi.scala 280:113:@3813.8]
  assign _GEN_37 = _T_269 ? 6'h0 : _GEN_36; // @[spi.scala 278:138:@3804.6]
  assign _GEN_38 = _T_259 ? 6'h0 : _GEN_37; // @[spi.scala 276:99:@3793.4]
  assign _T_321 = reg_txdata[7]; // @[spi.scala 298:72:@3858.6]
  assign _T_328 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3863.6]
  assign _T_341 = tx_shift_data[7]; // @[spi.scala 302:80:@3877.10]
  assign _T_348 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3882.10]
  assign _GEN_42 = wait_one_tick_done ? _T_341 : mosi_r; // @[spi.scala 301:32:@3875.8]
  assign _GEN_43 = wait_one_tick_done ? _T_348 : {{1'd0}, tx_shift_data}; // @[spi.scala 301:32:@3875.8]
  assign _GEN_44 = _T_291 ? _GEN_42 : mosi_r; // @[spi.scala 300:114:@3874.6]
  assign _GEN_45 = _T_291 ? _GEN_43 : {{1'd0}, tx_shift_data}; // @[spi.scala 300:114:@3874.6]
  assign _GEN_46 = _T_229 ? _T_321 : _GEN_44; // @[spi.scala 297:37:@3856.4]
  assign _GEN_47 = _T_229 ? _T_328 : _GEN_45; // @[spi.scala 297:37:@3856.4]
  assign _GEN_48 = _T_121 ? 1'h0 : bit_trdy; // @[spi.scala 310:39:@3894.6]
  assign _GEN_49 = _T_188 ? 1'h1 : _GEN_48; // @[spi.scala 308:36:@3889.4]
  assign _T_355 = bit_trdy == 1'h0; // @[spi.scala 314:12:@3897.4]
  assign _T_356 = _T_355 & wr_en; // @[spi.scala 314:22:@3898.4]
  assign _T_357 = _T_356 & sel_reg_tx; // @[spi.scala 314:31:@3899.4]
  assign _T_359 = wr_en & sel_reg_status; // @[spi.scala 316:24:@3904.6]
  assign _GEN_50 = _T_359 ? 1'h0 : bit_toe; // @[spi.scala 316:43:@3905.6]
  assign _GEN_51 = _T_357 ? 1'h1 : _GEN_50; // @[spi.scala 314:46:@3900.4]
  assign _T_364 = _T_243 & _T_190; // @[spi.scala 320:40:@3910.4]
  assign _GEN_52 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 321:22:@3912.6]
  assign _GEN_53 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 321:22:@3912.6]
  assign _T_367 = rd_en & sel_reg_rx; // @[spi.scala 326:24:@3920.6]
  assign _GEN_54 = _T_367 ? 1'h0 : bit_rrdy; // @[spi.scala 326:39:@3921.6]
  assign _GEN_55 = _T_367 ? 1'h0 : bit_roe; // @[spi.scala 326:39:@3921.6]
  assign _GEN_56 = _T_364 ? _GEN_52 : _GEN_55; // @[spi.scala 320:72:@3911.4]
  assign _GEN_57 = _T_364 ? _GEN_53 : _GEN_54; // @[spi.scala 320:72:@3911.4]
  assign _T_370 = n_status != 3'h0; // @[spi.scala 331:21:@3925.4]
  assign _T_371 = _T_370 | pending_data; // @[spi.scala 331:34:@3926.4]
  assign _GEN_58 = _T_371 ? 1'h0 : 1'h1; // @[spi.scala 331:51:@3927.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 198:13:@3658.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 204:16:@3666.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 306:15:@3887.4]
  assign io_spi_intr = _T_150 | _T_151; // @[spi.scala 147:14:@3603.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 157:15:@3614.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 183:18:@3651.4]
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
