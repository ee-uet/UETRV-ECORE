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

module Interlink_Module( // @[:@4045.2]
  input         clock, // @[:@4046.4]
  input         reset, // @[:@4047.4]
  input  [31:0] io_bus_adr_i, // @[:@4048.4]
  input  [3:0]  io_bus_sel_i, // @[:@4048.4]
  input         io_bus_we_i, // @[:@4048.4]
  input         io_bus_cyc_i, // @[:@4048.4]
  input         io_bus_stb_i, // @[:@4048.4]
  output        io_bus_ack_o, // @[:@4048.4]
  output [31:0] io_bus_dat_o, // @[:@4048.4]
  output        io_tmr_val_we, // @[:@4048.4]
  input  [31:0] io_tmr_val_do, // @[:@4048.4]
  output        io_tmr_dat_we, // @[:@4048.4]
  input  [31:0] io_tmr_dat_do, // @[:@4048.4]
  output        io_tmr_duty_we, // @[:@4048.4]
  input  [31:0] io_tmr_duty_do, // @[:@4048.4]
  output        io_tmr_cfg_we, // @[:@4048.4]
  input  [31:0] io_tmr_cfg_do, // @[:@4048.4]
  output        io_qei_count_we, // @[:@4048.4]
  input  [31:0] io_qei_count_do, // @[:@4048.4]
  output        io_qei_cfg_we, // @[:@4048.4]
  input  [31:0] io_qei_cfg_do, // @[:@4048.4]
  input  [15:0] io_qei_speed_do, // @[:@4048.4]
  output        io_pid_kp_we, // @[:@4048.4]
  input  [15:0] io_pid_kp_do, // @[:@4048.4]
  output        io_pid_ki_we, // @[:@4048.4]
  input  [15:0] io_pid_ki_do, // @[:@4048.4]
  output        io_pid_kd_we, // @[:@4048.4]
  input  [15:0] io_pid_kd_do, // @[:@4048.4]
  output        io_pid_ref_we, // @[:@4048.4]
  input  [15:0] io_pid_ref_do, // @[:@4048.4]
  output        io_pid_fb_we, // @[:@4048.4]
  input  [15:0] io_pid_fb_do, // @[:@4048.4]
  output        io_pid_cfg_we, // @[:@4048.4]
  input  [15:0] io_pid_cfg_do, // @[:@4048.4]
  input         io_ba_match // @[:@4048.4]
);
  wire  bus_valid; // @[interlink.scala 89:53:@4050.4]
  wire [11:0] reg_offset; // @[interlink.scala 98:35:@4057.4]
  wire  _T_78; // @[interlink.scala 100:50:@4058.4]
  wire  _T_79; // @[interlink.scala 100:81:@4059.4]
  wire  tmr_cfg_sel; // @[interlink.scala 100:66:@4060.4]
  wire  _T_83; // @[interlink.scala 101:81:@4064.4]
  wire  tmr_val_sel; // @[interlink.scala 101:66:@4065.4]
  wire  _T_87; // @[interlink.scala 102:81:@4069.4]
  wire  tmr_dat_sel; // @[interlink.scala 102:66:@4070.4]
  wire  _T_91; // @[interlink.scala 103:81:@4074.4]
  wire  tmr_duty_sel; // @[interlink.scala 103:66:@4075.4]
  wire  _T_94; // @[interlink.scala 105:72:@4078.4]
  wire  _T_95; // @[interlink.scala 105:76:@4079.4]
  wire  _T_121; // @[interlink.scala 112:35:@4105.4]
  wire  _T_122; // @[interlink.scala 112:50:@4106.4]
  wire  tmr_sel; // @[interlink.scala 112:65:@4107.4]
  wire [31:0] _T_123; // @[interlink.scala 114:26:@4108.4]
  wire [31:0] _T_124; // @[interlink.scala 113:57:@4109.4]
  wire [31:0] tmr_do; // @[interlink.scala 113:26:@4110.4]
  wire  _T_128; // @[interlink.scala 118:81:@4113.4]
  wire  qei_count_sel; // @[interlink.scala 118:66:@4114.4]
  wire  _T_138; // @[interlink.scala 122:81:@4124.4]
  wire  qei_cfg_sel; // @[interlink.scala 122:66:@4125.4]
  wire  _T_148; // @[interlink.scala 126:81:@4135.4]
  wire  qei_speed_sel; // @[interlink.scala 126:66:@4136.4]
  wire  _T_155; // @[interlink.scala 130:37:@4144.4]
  wire  qei_sel; // @[interlink.scala 130:52:@4145.4]
  wire [31:0] _T_156; // @[interlink.scala 131:59:@4146.4]
  wire [15:0] _T_236; // @[interlink.scala 187:46:@4248.4]
  wire [31:0] qei_speed_do; // @[interlink.scala 125:27:@4133.4 interlink.scala 187:21:@4249.4]
  wire [31:0] qei_do; // @[interlink.scala 131:26:@4147.4]
  wire  _T_160; // @[interlink.scala 135:81:@4150.4]
  wire  pid_kp_sel; // @[interlink.scala 135:66:@4151.4]
  wire  _T_170; // @[interlink.scala 139:81:@4161.4]
  wire  pid_ki_sel; // @[interlink.scala 139:66:@4162.4]
  wire  _T_180; // @[interlink.scala 143:81:@4172.4]
  wire  pid_kd_sel; // @[interlink.scala 143:66:@4173.4]
  wire  _T_190; // @[interlink.scala 147:81:@4183.4]
  wire  pid_ref_sel; // @[interlink.scala 147:66:@4184.4]
  wire  _T_200; // @[interlink.scala 151:81:@4194.4]
  wire  pid_fb_sel; // @[interlink.scala 151:66:@4195.4]
  wire  _T_210; // @[interlink.scala 155:81:@4205.4]
  wire  pid_cfg_sel; // @[interlink.scala 155:66:@4206.4]
  wire  _T_217; // @[interlink.scala 158:34:@4214.4]
  wire  _T_218; // @[interlink.scala 158:48:@4215.4]
  wire  _T_219; // @[interlink.scala 158:62:@4216.4]
  wire  _T_220; // @[interlink.scala 158:77:@4217.4]
  wire  pid_sel; // @[interlink.scala 158:91:@4218.4]
  wire [15:0] _T_221; // @[interlink.scala 162:46:@4219.4]
  wire [15:0] _T_222; // @[interlink.scala 161:46:@4220.4]
  wire [15:0] _T_223; // @[interlink.scala 160:46:@4221.4]
  wire [15:0] _T_224; // @[interlink.scala 159:53:@4222.4]
  wire [15:0] pid_do; // @[interlink.scala 159:26:@4223.4]
  reg  wb_ack_o; // @[interlink.scala 165:30:@4224.4]
  reg [31:0] _RAND_0;
  reg [31:0] wb_data_o; // @[interlink.scala 166:30:@4225.4]
  reg [31:0] _RAND_1;
  wire [15:0] _T_229; // @[interlink.scala 167:92:@4226.4]
  wire [15:0] _T_231; // @[interlink.scala 167:69:@4227.4]
  wire [31:0] _T_232; // @[interlink.scala 167:48:@4228.4]
  wire [31:0] _T_233; // @[interlink.scala 167:27:@4229.4]
  wire  _T_234; // @[interlink.scala 168:32:@4231.4]
  wire  _T_235; // @[interlink.scala 168:43:@4232.4]
  assign bus_valid = io_bus_stb_i & io_bus_cyc_i; // @[interlink.scala 89:53:@4050.4]
  assign reg_offset = io_bus_adr_i[11:0]; // @[interlink.scala 98:35:@4057.4]
  assign _T_78 = bus_valid & io_ba_match; // @[interlink.scala 100:50:@4058.4]
  assign _T_79 = reg_offset == 12'h0; // @[interlink.scala 100:81:@4059.4]
  assign tmr_cfg_sel = _T_78 & _T_79; // @[interlink.scala 100:66:@4060.4]
  assign _T_83 = reg_offset == 12'h4; // @[interlink.scala 101:81:@4064.4]
  assign tmr_val_sel = _T_78 & _T_83; // @[interlink.scala 101:66:@4065.4]
  assign _T_87 = reg_offset == 12'h8; // @[interlink.scala 102:81:@4069.4]
  assign tmr_dat_sel = _T_78 & _T_87; // @[interlink.scala 102:66:@4070.4]
  assign _T_91 = reg_offset == 12'hc; // @[interlink.scala 103:81:@4074.4]
  assign tmr_duty_sel = _T_78 & _T_91; // @[interlink.scala 103:66:@4075.4]
  assign _T_94 = io_bus_sel_i[0]; // @[interlink.scala 105:72:@4078.4]
  assign _T_95 = _T_94 & io_bus_we_i; // @[interlink.scala 105:76:@4079.4]
  assign _T_121 = tmr_cfg_sel | tmr_val_sel; // @[interlink.scala 112:35:@4105.4]
  assign _T_122 = _T_121 | tmr_dat_sel; // @[interlink.scala 112:50:@4106.4]
  assign tmr_sel = _T_122 | tmr_duty_sel; // @[interlink.scala 112:65:@4107.4]
  assign _T_123 = tmr_duty_sel ? io_tmr_duty_do : io_tmr_dat_do; // @[interlink.scala 114:26:@4108.4]
  assign _T_124 = tmr_val_sel ? io_tmr_val_do : _T_123; // @[interlink.scala 113:57:@4109.4]
  assign tmr_do = tmr_cfg_sel ? io_tmr_cfg_do : _T_124; // @[interlink.scala 113:26:@4110.4]
  assign _T_128 = reg_offset == 12'h100; // @[interlink.scala 118:81:@4113.4]
  assign qei_count_sel = _T_78 & _T_128; // @[interlink.scala 118:66:@4114.4]
  assign _T_138 = reg_offset == 12'h108; // @[interlink.scala 122:81:@4124.4]
  assign qei_cfg_sel = _T_78 & _T_138; // @[interlink.scala 122:66:@4125.4]
  assign _T_148 = reg_offset == 12'h104; // @[interlink.scala 126:81:@4135.4]
  assign qei_speed_sel = _T_78 & _T_148; // @[interlink.scala 126:66:@4136.4]
  assign _T_155 = qei_count_sel | qei_cfg_sel; // @[interlink.scala 130:37:@4144.4]
  assign qei_sel = _T_155 | qei_speed_sel; // @[interlink.scala 130:52:@4145.4]
  assign _T_156 = qei_cfg_sel ? io_qei_cfg_do : io_qei_count_do; // @[interlink.scala 131:59:@4146.4]
  assign _T_236 = $unsigned(io_qei_speed_do); // @[interlink.scala 187:46:@4248.4]
  assign qei_speed_do = {{16'd0}, _T_236}; // @[interlink.scala 125:27:@4133.4 interlink.scala 187:21:@4249.4]
  assign qei_do = qei_speed_sel ? qei_speed_do : _T_156; // @[interlink.scala 131:26:@4147.4]
  assign _T_160 = reg_offset == 12'h200; // @[interlink.scala 135:81:@4150.4]
  assign pid_kp_sel = _T_78 & _T_160; // @[interlink.scala 135:66:@4151.4]
  assign _T_170 = reg_offset == 12'h204; // @[interlink.scala 139:81:@4161.4]
  assign pid_ki_sel = _T_78 & _T_170; // @[interlink.scala 139:66:@4162.4]
  assign _T_180 = reg_offset == 12'h208; // @[interlink.scala 143:81:@4172.4]
  assign pid_kd_sel = _T_78 & _T_180; // @[interlink.scala 143:66:@4173.4]
  assign _T_190 = reg_offset == 12'h20c; // @[interlink.scala 147:81:@4183.4]
  assign pid_ref_sel = _T_78 & _T_190; // @[interlink.scala 147:66:@4184.4]
  assign _T_200 = reg_offset == 12'h210; // @[interlink.scala 151:81:@4194.4]
  assign pid_fb_sel = _T_78 & _T_200; // @[interlink.scala 151:66:@4195.4]
  assign _T_210 = reg_offset == 12'h214; // @[interlink.scala 155:81:@4205.4]
  assign pid_cfg_sel = _T_78 & _T_210; // @[interlink.scala 155:66:@4206.4]
  assign _T_217 = pid_kp_sel | pid_ki_sel; // @[interlink.scala 158:34:@4214.4]
  assign _T_218 = _T_217 | pid_kd_sel; // @[interlink.scala 158:48:@4215.4]
  assign _T_219 = _T_218 | pid_ref_sel; // @[interlink.scala 158:62:@4216.4]
  assign _T_220 = _T_219 | pid_fb_sel; // @[interlink.scala 158:77:@4217.4]
  assign pid_sel = _T_220 | pid_cfg_sel; // @[interlink.scala 158:91:@4218.4]
  assign _T_221 = pid_fb_sel ? $signed(io_pid_fb_do) : $signed(io_pid_cfg_do); // @[interlink.scala 162:46:@4219.4]
  assign _T_222 = pid_ref_sel ? $signed(io_pid_ref_do) : $signed(_T_221); // @[interlink.scala 161:46:@4220.4]
  assign _T_223 = pid_kd_sel ? $signed(io_pid_kd_do) : $signed(_T_222); // @[interlink.scala 160:46:@4221.4]
  assign _T_224 = pid_ki_sel ? $signed(io_pid_ki_do) : $signed(_T_223); // @[interlink.scala 159:53:@4222.4]
  assign pid_do = pid_kp_sel ? $signed(io_pid_kp_do) : $signed(_T_224); // @[interlink.scala 159:26:@4223.4]
  assign _T_229 = $unsigned(pid_do); // @[interlink.scala 167:92:@4226.4]
  assign _T_231 = pid_sel ? _T_229 : 16'h0; // @[interlink.scala 167:69:@4227.4]
  assign _T_232 = qei_sel ? qei_do : {{16'd0}, _T_231}; // @[interlink.scala 167:48:@4228.4]
  assign _T_233 = tmr_sel ? tmr_do : _T_232; // @[interlink.scala 167:27:@4229.4]
  assign _T_234 = tmr_sel | qei_sel; // @[interlink.scala 168:32:@4231.4]
  assign _T_235 = _T_234 | pid_sel; // @[interlink.scala 168:43:@4232.4]
  assign io_bus_ack_o = wb_ack_o; // @[interlink.scala 171:21:@4235.4]
  assign io_bus_dat_o = wb_data_o; // @[interlink.scala 170:21:@4234.4]
  assign io_tmr_val_we = tmr_val_sel ? _T_95 : 1'h0; // @[interlink.scala 174:21:@4236.4]
  assign io_tmr_dat_we = tmr_dat_sel ? _T_95 : 1'h0; // @[interlink.scala 176:21:@4238.4]
  assign io_tmr_duty_we = tmr_duty_sel ? _T_95 : 1'h0; // @[interlink.scala 178:21:@4240.4]
  assign io_tmr_cfg_we = tmr_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 180:21:@4242.4]
  assign io_qei_count_we = qei_count_sel ? _T_95 : 1'h0; // @[interlink.scala 183:21:@4244.4]
  assign io_qei_cfg_we = qei_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 185:21:@4246.4]
  assign io_pid_kp_we = pid_kp_sel ? _T_95 : 1'h0; // @[interlink.scala 189:21:@4250.4]
  assign io_pid_ki_we = pid_ki_sel ? _T_95 : 1'h0; // @[interlink.scala 191:21:@4252.4]
  assign io_pid_kd_we = pid_kd_sel ? _T_95 : 1'h0; // @[interlink.scala 193:21:@4254.4]
  assign io_pid_ref_we = pid_ref_sel ? _T_95 : 1'h0; // @[interlink.scala 195:21:@4256.4]
  assign io_pid_fb_we = pid_fb_sel ? _T_95 : 1'h0; // @[interlink.scala 197:21:@4258.4]
  assign io_pid_cfg_we = pid_cfg_sel ? _T_95 : 1'h0; // @[interlink.scala 199:21:@4260.4]
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
  wb_ack_o = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wb_data_o = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      wb_ack_o <= 1'h0;
    end else begin
      wb_ack_o <= _T_235;
    end
    if (reset) begin
      wb_data_o <= 32'h0;
    end else begin
      if (tmr_sel) begin
        if (tmr_cfg_sel) begin
          wb_data_o <= io_tmr_cfg_do;
        end else begin
          if (tmr_val_sel) begin
            wb_data_o <= io_tmr_val_do;
          end else begin
            if (tmr_duty_sel) begin
              wb_data_o <= io_tmr_duty_do;
            end else begin
              wb_data_o <= io_tmr_dat_do;
            end
          end
        end
      end else begin
        if (qei_sel) begin
          if (qei_speed_sel) begin
            wb_data_o <= qei_speed_do;
          end else begin
            if (qei_cfg_sel) begin
              wb_data_o <= io_qei_cfg_do;
            end else begin
              wb_data_o <= io_qei_count_do;
            end
          end
        end else begin
          wb_data_o <= {{16'd0}, _T_231};
        end
      end
    end
  end
endmodule
module PWM( // @[:@4263.2]
  input         clock, // @[:@4264.4]
  input         reset, // @[:@4265.4]
  input         io_reg_val_we, // @[:@4266.4]
  input  [31:0] io_reg_val_di, // @[:@4266.4]
  output [31:0] io_reg_val_do, // @[:@4266.4]
  input         io_reg_cfg_we, // @[:@4266.4]
  input  [31:0] io_reg_cfg_di, // @[:@4266.4]
  output [31:0] io_reg_cfg_do, // @[:@4266.4]
  input         io_reg_dat_we, // @[:@4266.4]
  input  [31:0] io_reg_dat_di, // @[:@4266.4]
  output [31:0] io_reg_dat_do, // @[:@4266.4]
  input         io_reg_duty_we, // @[:@4266.4]
  input  [31:0] io_reg_duty_di, // @[:@4266.4]
  output [31:0] io_reg_duty_do, // @[:@4266.4]
  input  [15:0] io_reg_pid_out, // @[:@4266.4]
  output        io_pwm_h, // @[:@4266.4]
  output        io_pwm_l, // @[:@4266.4]
  output        io_pwm_h_en, // @[:@4266.4]
  output        io_pwm_l_en, // @[:@4266.4]
  output        io_irq_out, // @[:@4266.4]
  output        io_rawirq_out // @[:@4266.4]
);
  reg [31:0] value_cur; // @[pwm.scala 47:32:@4268.4]
  reg [31:0] _RAND_0;
  reg [31:0] value_reload; // @[pwm.scala 48:32:@4269.4]
  reg [31:0] _RAND_1;
  reg [31:0] pwm_duty; // @[pwm.scala 49:32:@4270.4]
  reg [31:0] _RAND_2;
  reg [31:0] reg_duty; // @[pwm.scala 50:32:@4271.4]
  reg [31:0] _RAND_3;
  reg  enable; // @[pwm.scala 57:32:@4275.4]
  reg [31:0] _RAND_4;
  reg  stop_out; // @[pwm.scala 59:32:@4276.4]
  reg [31:0] _RAND_5;
  reg  irq_out; // @[pwm.scala 60:32:@4277.4]
  reg [31:0] _RAND_6;
  reg  lastenable; // @[pwm.scala 63:28:@4278.4]
  reg [31:0] _RAND_7;
  reg  updown; // @[pwm.scala 66:32:@4279.4]
  reg [31:0] _RAND_8;
  reg  irq_ena; // @[pwm.scala 69:32:@4280.4]
  reg [31:0] _RAND_9;
  reg  pid_out_sel; // @[pwm.scala 72:32:@4281.4]
  reg [31:0] _RAND_10;
  reg [3:0] pwm_db; // @[pwm.scala 75:32:@4282.4]
  reg [31:0] _RAND_11;
  wire [31:0] _GEN_0; // @[pwm.scala 79:24:@4284.4]
  wire [15:0] _T_69; // @[pwm.scala 85:40:@4289.8]
  wire [31:0] _GEN_1; // @[pwm.scala 84:22:@4288.6]
  wire [31:0] _GEN_2; // @[pwm.scala 83:18:@4287.4]
  reg [31:0] proc_offset; // @[pwm.scala 91:24:@4296.4]
  reg [31:0] _RAND_12;
  reg  pwm_ld; // @[pwm.scala 92:24:@4297.4]
  reg [31:0] _RAND_13;
  reg  pwm_hd; // @[pwm.scala 93:24:@4298.4]
  reg [31:0] _RAND_14;
  wire [4:0] _GEN_25; // @[pwm.scala 96:30:@4299.4]
  wire [4:0] pwm_db_twice; // @[pwm.scala 96:30:@4299.4]
  wire [31:0] _GEN_26; // @[pwm.scala 98:37:@4300.4]
  wire  _T_74; // @[pwm.scala 98:37:@4300.4]
  wire [32:0] _T_75; // @[pwm.scala 98:84:@4301.4]
  wire [32:0] _T_76; // @[pwm.scala 98:84:@4302.4]
  wire [31:0] _T_77; // @[pwm.scala 98:84:@4303.4]
  wire  _T_78; // @[pwm.scala 98:67:@4304.4]
  wire  _T_79; // @[pwm.scala 98:54:@4305.4]
  wire  _T_80; // @[pwm.scala 99:36:@4306.4]
  wire [31:0] _T_84; // @[pwm.scala 99:26:@4310.4]
  wire [31:0] _GEN_30; // @[pwm.scala 100:48:@4313.4]
  wire [32:0] _T_86; // @[pwm.scala 100:48:@4313.4]
  wire [32:0] _T_87; // @[pwm.scala 100:48:@4314.4]
  wire [31:0] _T_88; // @[pwm.scala 100:48:@4315.4]
  wire  _T_90; // @[pwm.scala 101:34:@4318.4]
  wire [32:0] _T_91; // @[pwm.scala 101:79:@4319.4]
  wire [32:0] _T_92; // @[pwm.scala 101:79:@4320.4]
  wire [31:0] _T_93; // @[pwm.scala 101:79:@4321.4]
  wire  _T_94; // @[pwm.scala 101:63:@4322.4]
  wire  _T_98; // @[pwm.scala 110:34:@4332.4]
  wire  _T_99; // @[pwm.scala 110:32:@4333.4]
  wire [2:0] _T_103; // @[Cat.scala 30:58:@4337.4]
  wire [28:0] _T_105; // @[Cat.scala 30:58:@4339.4]
  wire  _T_107; // @[pwm.scala 115:35:@4343.6]
  wire  _T_108; // @[pwm.scala 116:35:@4345.6]
  wire  _T_109; // @[pwm.scala 117:35:@4347.6]
  wire  _T_110; // @[pwm.scala 118:35:@4349.6]
  wire [3:0] _T_111; // @[pwm.scala 119:36:@4351.6]
  wire [4:0] _T_113; // @[pwm.scala 119:42:@4352.6]
  wire [3:0] _T_114; // @[pwm.scala 119:42:@4353.6]
  wire  _GEN_3; // @[pwm.scala 114:23:@4342.4]
  wire  _GEN_4; // @[pwm.scala 114:23:@4342.4]
  wire  _GEN_5; // @[pwm.scala 114:23:@4342.4]
  wire  _GEN_6; // @[pwm.scala 114:23:@4342.4]
  wire [3:0] _GEN_7; // @[pwm.scala 114:23:@4342.4]
  wire [31:0] _GEN_8; // @[pwm.scala 124:29:@4358.4]
  wire [32:0] _T_118; // @[pwm.scala 130:39:@4362.4]
  wire [31:0] value_cur_plus; // @[pwm.scala 130:39:@4363.4]
  wire [32:0] _T_121; // @[pwm.scala 131:39:@4365.4]
  wire [32:0] _T_122; // @[pwm.scala 131:39:@4366.4]
  wire [31:0] value_cur_minus; // @[pwm.scala 131:39:@4367.4]
  wire  _T_131; // @[pwm.scala 141:23:@4380.8]
  wire  _T_135; // @[pwm.scala 144:25:@4384.10]
  wire  _T_138; // @[pwm.scala 149:33:@4390.12]
  wire [31:0] _GEN_9; // @[pwm.scala 149:58:@4391.12]
  wire [31:0] _GEN_11; // @[pwm.scala 144:38:@4385.10]
  wire  _GEN_12; // @[pwm.scala 144:38:@4385.10]
  wire  _T_146; // @[pwm.scala 164:35:@4408.12]
  wire [31:0] _GEN_13; // @[pwm.scala 164:50:@4409.12]
  wire [31:0] _GEN_15; // @[pwm.scala 159:38:@4403.10]
  wire  _GEN_16; // @[pwm.scala 159:38:@4403.10]
  wire [31:0] _GEN_17; // @[pwm.scala 143:31:@4383.8]
  wire  _GEN_18; // @[pwm.scala 143:31:@4383.8]
  wire  _GEN_19; // @[pwm.scala 138:39:@4377.6]
  wire [31:0] _GEN_20; // @[pwm.scala 138:39:@4377.6]
  wire  _GEN_21; // @[pwm.scala 138:39:@4377.6]
  wire [31:0] _GEN_22; // @[pwm.scala 136:29:@4372.4]
  wire  _GEN_23; // @[pwm.scala 136:29:@4372.4]
  wire  _GEN_24; // @[pwm.scala 136:29:@4372.4]
  assign _GEN_0 = io_reg_duty_we ? io_reg_duty_di : reg_duty; // @[pwm.scala 79:24:@4284.4]
  assign _T_69 = $unsigned(io_reg_pid_out); // @[pwm.scala 85:40:@4289.8]
  assign _GEN_1 = pid_out_sel ? {{16'd0}, _T_69} : reg_duty; // @[pwm.scala 84:22:@4288.6]
  assign _GEN_2 = stop_out ? _GEN_1 : pwm_duty; // @[pwm.scala 83:18:@4287.4]
  assign _GEN_25 = {{1'd0}, pwm_db}; // @[pwm.scala 96:30:@4299.4]
  assign pwm_db_twice = _GEN_25 << 1'h1; // @[pwm.scala 96:30:@4299.4]
  assign _GEN_26 = {{27'd0}, pwm_db_twice}; // @[pwm.scala 98:37:@4300.4]
  assign _T_74 = pwm_duty >= _GEN_26; // @[pwm.scala 98:37:@4300.4]
  assign _T_75 = value_reload - _GEN_26; // @[pwm.scala 98:84:@4301.4]
  assign _T_76 = $unsigned(_T_75); // @[pwm.scala 98:84:@4302.4]
  assign _T_77 = _T_76[31:0]; // @[pwm.scala 98:84:@4303.4]
  assign _T_78 = pwm_duty <= _T_77; // @[pwm.scala 98:67:@4304.4]
  assign _T_79 = _T_74 & _T_78; // @[pwm.scala 98:54:@4305.4]
  assign _T_80 = pwm_duty < _GEN_26; // @[pwm.scala 99:36:@4306.4]
  assign _T_84 = _T_80 ? {{27'd0}, pwm_db_twice} : _T_77; // @[pwm.scala 99:26:@4310.4]
  assign _GEN_30 = {{28'd0}, pwm_db}; // @[pwm.scala 100:48:@4313.4]
  assign _T_86 = proc_offset - _GEN_30; // @[pwm.scala 100:48:@4313.4]
  assign _T_87 = $unsigned(_T_86); // @[pwm.scala 100:48:@4314.4]
  assign _T_88 = _T_87[31:0]; // @[pwm.scala 100:48:@4315.4]
  assign _T_90 = value_cur > proc_offset; // @[pwm.scala 101:34:@4318.4]
  assign _T_91 = value_reload - _GEN_30; // @[pwm.scala 101:79:@4319.4]
  assign _T_92 = $unsigned(_T_91); // @[pwm.scala 101:79:@4320.4]
  assign _T_93 = _T_92[31:0]; // @[pwm.scala 101:79:@4321.4]
  assign _T_94 = value_cur < _T_93; // @[pwm.scala 101:63:@4322.4]
  assign _T_98 = ~ irq_out; // @[pwm.scala 110:34:@4332.4]
  assign _T_99 = stop_out & _T_98; // @[pwm.scala 110:32:@4333.4]
  assign _T_103 = {irq_ena,updown,enable}; // @[Cat.scala 30:58:@4337.4]
  assign _T_105 = {24'h0,pwm_db,pid_out_sel}; // @[Cat.scala 30:58:@4339.4]
  assign _T_107 = io_reg_cfg_di[0]; // @[pwm.scala 115:35:@4343.6]
  assign _T_108 = io_reg_cfg_di[1]; // @[pwm.scala 116:35:@4345.6]
  assign _T_109 = io_reg_cfg_di[2]; // @[pwm.scala 117:35:@4347.6]
  assign _T_110 = io_reg_cfg_di[3]; // @[pwm.scala 118:35:@4349.6]
  assign _T_111 = io_reg_cfg_di[7:4]; // @[pwm.scala 119:36:@4351.6]
  assign _T_113 = _T_111 + 4'h2; // @[pwm.scala 119:42:@4352.6]
  assign _T_114 = _T_111 + 4'h2; // @[pwm.scala 119:42:@4353.6]
  assign _GEN_3 = io_reg_cfg_we ? _T_107 : enable; // @[pwm.scala 114:23:@4342.4]
  assign _GEN_4 = io_reg_cfg_we ? _T_108 : updown; // @[pwm.scala 114:23:@4342.4]
  assign _GEN_5 = io_reg_cfg_we ? _T_109 : irq_ena; // @[pwm.scala 114:23:@4342.4]
  assign _GEN_6 = io_reg_cfg_we ? _T_110 : pid_out_sel; // @[pwm.scala 114:23:@4342.4]
  assign _GEN_7 = io_reg_cfg_we ? _T_114 : pwm_db; // @[pwm.scala 114:23:@4342.4]
  assign _GEN_8 = io_reg_val_we ? io_reg_val_di : value_reload; // @[pwm.scala 124:29:@4358.4]
  assign _T_118 = value_cur + 32'h1; // @[pwm.scala 130:39:@4362.4]
  assign value_cur_plus = value_cur + 32'h1; // @[pwm.scala 130:39:@4363.4]
  assign _T_121 = value_cur - 32'h1; // @[pwm.scala 131:39:@4365.4]
  assign _T_122 = $unsigned(_T_121); // @[pwm.scala 131:39:@4366.4]
  assign value_cur_minus = _T_122[31:0]; // @[pwm.scala 131:39:@4367.4]
  assign _T_131 = irq_ena ? _T_99 : 1'h0; // @[pwm.scala 141:23:@4380.8]
  assign _T_135 = lastenable == 1'h0; // @[pwm.scala 144:25:@4384.10]
  assign _T_138 = value_cur == value_reload; // @[pwm.scala 149:33:@4390.12]
  assign _GEN_9 = _T_138 ? 32'h0 : value_cur_plus; // @[pwm.scala 149:58:@4391.12]
  assign _GEN_11 = _T_135 ? 32'h0 : _GEN_9; // @[pwm.scala 144:38:@4385.10]
  assign _GEN_12 = _T_135 ? 1'h0 : _T_138; // @[pwm.scala 144:38:@4385.10]
  assign _T_146 = value_cur == 32'h0; // @[pwm.scala 164:35:@4408.12]
  assign _GEN_13 = _T_146 ? value_reload : value_cur_minus; // @[pwm.scala 164:50:@4409.12]
  assign _GEN_15 = _T_135 ? value_reload : _GEN_13; // @[pwm.scala 159:38:@4403.10]
  assign _GEN_16 = _T_135 ? 1'h0 : _T_146; // @[pwm.scala 159:38:@4403.10]
  assign _GEN_17 = updown ? _GEN_11 : _GEN_15; // @[pwm.scala 143:31:@4383.8]
  assign _GEN_18 = updown ? _GEN_12 : _GEN_16; // @[pwm.scala 143:31:@4383.8]
  assign _GEN_19 = enable ? _T_131 : irq_out; // @[pwm.scala 138:39:@4377.6]
  assign _GEN_20 = enable ? _GEN_17 : value_cur; // @[pwm.scala 138:39:@4377.6]
  assign _GEN_21 = enable ? _GEN_18 : stop_out; // @[pwm.scala 138:39:@4377.6]
  assign _GEN_22 = io_reg_dat_we ? io_reg_dat_di : _GEN_20; // @[pwm.scala 136:29:@4372.4]
  assign _GEN_23 = io_reg_dat_we ? irq_out : _GEN_19; // @[pwm.scala 136:29:@4372.4]
  assign _GEN_24 = io_reg_dat_we ? stop_out : _GEN_21; // @[pwm.scala 136:29:@4372.4]
  assign io_reg_val_do = value_reload; // @[pwm.scala 123:19:@4356.4]
  assign io_reg_cfg_do = {_T_105,_T_103}; // @[pwm.scala 113:20:@4341.4]
  assign io_reg_dat_do = value_cur; // @[pwm.scala 129:19:@4361.4]
  assign io_reg_duty_do = pwm_duty; // @[pwm.scala 78:23:@4283.4]
  assign io_pwm_h = pwm_hd & enable; // @[pwm.scala 102:20:@4326.4]
  assign io_pwm_l = pwm_ld & enable; // @[pwm.scala 103:20:@4328.4]
  assign io_pwm_h_en = enable; // @[pwm.scala 105:20:@4329.4]
  assign io_pwm_l_en = enable; // @[pwm.scala 106:20:@4330.4]
  assign io_irq_out = irq_out; // @[pwm.scala 109:20:@4331.4]
  assign io_rawirq_out = stop_out & _T_98; // @[pwm.scala 110:20:@4334.4]
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
  value_cur = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value_reload = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  pwm_duty = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_duty = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enable = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  stop_out = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  irq_out = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  lastenable = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  updown = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  irq_ena = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  pid_out_sel = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  pwm_db = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  proc_offset = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  pwm_ld = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  pwm_hd = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value_cur <= 32'h0;
    end else begin
      if (io_reg_dat_we) begin
        value_cur <= io_reg_dat_di;
      end else begin
        if (enable) begin
          if (updown) begin
            if (_T_135) begin
              value_cur <= 32'h0;
            end else begin
              if (_T_138) begin
                value_cur <= 32'h0;
              end else begin
                value_cur <= value_cur_plus;
              end
            end
          end else begin
            if (_T_135) begin
              value_cur <= value_reload;
            end else begin
              if (_T_146) begin
                value_cur <= value_reload;
              end else begin
                value_cur <= value_cur_minus;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      value_reload <= 32'hff;
    end else begin
      if (io_reg_val_we) begin
        value_reload <= io_reg_val_di;
      end
    end
    if (reset) begin
      pwm_duty <= 32'h0;
    end else begin
      if (stop_out) begin
        if (pid_out_sel) begin
          pwm_duty <= {{16'd0}, _T_69};
        end else begin
          pwm_duty <= reg_duty;
        end
      end
    end
    if (reset) begin
      reg_duty <= 32'h0;
    end else begin
      if (io_reg_duty_we) begin
        reg_duty <= io_reg_duty_di;
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        enable <= _T_107;
      end
    end
    if (reset) begin
      stop_out <= 1'h0;
    end else begin
      if (!(io_reg_dat_we)) begin
        if (enable) begin
          if (updown) begin
            if (_T_135) begin
              stop_out <= 1'h0;
            end else begin
              stop_out <= _T_138;
            end
          end else begin
            if (_T_135) begin
              stop_out <= 1'h0;
            end else begin
              stop_out <= _T_146;
            end
          end
        end
      end
    end
    if (reset) begin
      irq_out <= 1'h0;
    end else begin
      if (!(io_reg_dat_we)) begin
        if (enable) begin
          if (irq_ena) begin
            irq_out <= _T_99;
          end else begin
            irq_out <= 1'h0;
          end
        end
      end
    end
    lastenable <= enable;
    if (reset) begin
      updown <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        updown <= _T_108;
      end
    end
    if (reset) begin
      irq_ena <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        irq_ena <= _T_109;
      end
    end
    if (reset) begin
      pid_out_sel <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        pid_out_sel <= _T_110;
      end
    end
    if (reset) begin
      pwm_db <= 4'h2;
    end else begin
      if (io_reg_cfg_we) begin
        pwm_db <= _T_114;
      end
    end
    if (_T_79) begin
      proc_offset <= pwm_duty;
    end else begin
      if (_T_80) begin
        proc_offset <= {{27'd0}, pwm_db_twice};
      end else begin
        proc_offset <= _T_77;
      end
    end
    pwm_ld <= _T_90 & _T_94;
    pwm_hd <= value_cur < _T_88;
  end
endmodule
module Quad_Encoder( // @[:@4421.2]
  input         clock, // @[:@4422.4]
  input         reset, // @[:@4423.4]
  input         io_quad_a, // @[:@4424.4]
  input         io_quad_b, // @[:@4424.4]
  input         io_raw_irq, // @[:@4424.4]
  input         io_reg_count_we, // @[:@4424.4]
  input  [31:0] io_reg_count_di, // @[:@4424.4]
  output [31:0] io_reg_count_do, // @[:@4424.4]
  input         io_reg_cfg_we, // @[:@4424.4]
  input  [31:0] io_reg_cfg_di, // @[:@4424.4]
  output [31:0] io_reg_cfg_do, // @[:@4424.4]
  output [15:0] io_reg_speed_do, // @[:@4424.4]
  output        io_fb_period // @[:@4424.4]
);
  reg [2:0] quad_a_delayed; // @[qei.scala 35:33:@4426.4]
  reg [31:0] _RAND_0;
  reg [2:0] quad_b_delayed; // @[qei.scala 36:33:@4427.4]
  reg [31:0] _RAND_1;
  reg [31:0] count_reg; // @[qei.scala 37:33:@4428.4]
  reg [31:0] _RAND_2;
  reg [15:0] count_reg_2; // @[qei.scala 38:33:@4429.4]
  reg [31:0] _RAND_3;
  reg [15:0] period_count; // @[qei.scala 39:33:@4430.4]
  reg [31:0] _RAND_4;
  reg  speed_enable; // @[qei.scala 41:33:@4431.4]
  reg [31:0] _RAND_5;
  reg  count_sel_2x; // @[qei.scala 42:33:@4432.4]
  reg [31:0] _RAND_6;
  reg [15:0] qei_output; // @[qei.scala 44:33:@4434.4]
  reg [31:0] _RAND_7;
  reg [15:0] qei_speed_count; // @[qei.scala 45:33:@4435.4]
  reg [31:0] _RAND_8;
  reg [15:0] qei_period_count; // @[qei.scala 46:33:@4436.4]
  reg [31:0] _RAND_9;
  reg  period_sel; // @[qei.scala 47:33:@4437.4]
  reg [31:0] _RAND_10;
  wire  _T_51; // @[qei.scala 51:44:@4439.4]
  wire  _T_52; // @[qei.scala 51:63:@4440.4]
  wire [2:0] _T_54; // @[Cat.scala 30:58:@4442.4]
  wire  _T_55; // @[qei.scala 52:44:@4444.4]
  wire  _T_56; // @[qei.scala 52:63:@4445.4]
  wire [2:0] _T_58; // @[Cat.scala 30:58:@4447.4]
  wire  _T_61; // @[qei.scala 54:75:@4450.4]
  wire  count_2x; // @[qei.scala 54:60:@4451.4]
  wire  _T_68; // @[qei.scala 55:78:@4458.4]
  wire  _T_69; // @[qei.scala 55:111:@4459.4]
  wire  count_4x; // @[qei.scala 55:96:@4460.4]
  wire  count_direction; // @[qei.scala 56:60:@4465.4]
  wire  count_pulses; // @[qei.scala 57:29:@4468.4]
  wire [32:0] _T_76; // @[qei.scala 64:36:@4471.8]
  wire [31:0] _T_77; // @[qei.scala 64:36:@4472.8]
  wire [32:0] _T_79; // @[qei.scala 66:36:@4476.8]
  wire [32:0] _T_80; // @[qei.scala 66:36:@4477.8]
  wire [31:0] _T_81; // @[qei.scala 66:36:@4478.8]
  wire [31:0] _GEN_0; // @[qei.scala 63:27:@4470.6]
  wire [31:0] _GEN_1; // @[qei.scala 62:22:@4469.4]
  wire  _T_82; // @[qei.scala 71:20:@4482.4]
  wire [16:0] _T_85; // @[qei.scala 76:38:@4489.8]
  wire [15:0] _T_86; // @[qei.scala 76:38:@4490.8]
  wire [15:0] _GEN_2; // @[qei.scala 72:23:@4484.6]
  wire [15:0] _GEN_3; // @[qei.scala 72:23:@4484.6]
  wire [15:0] _GEN_4; // @[qei.scala 71:37:@4483.4]
  wire [15:0] _GEN_5; // @[qei.scala 71:37:@4483.4]
  wire  _T_89; // @[qei.scala 85:29:@4500.8]
  wire [16:0] _T_92; // @[qei.scala 89:40:@4506.10]
  wire [15:0] _T_93; // @[qei.scala 89:40:@4507.10]
  wire [15:0] _GEN_6; // @[qei.scala 85:40:@4501.8]
  wire [15:0] _GEN_7; // @[qei.scala 85:40:@4501.8]
  wire [15:0] _GEN_8; // @[qei.scala 82:24:@4495.6]
  wire [15:0] _GEN_9; // @[qei.scala 82:24:@4495.6]
  wire [15:0] _GEN_10; // @[qei.scala 81:20:@4494.4]
  wire [15:0] _GEN_11; // @[qei.scala 81:20:@4494.4]
  wire [15:0] _T_94; // @[qei.scala 94:30:@4511.4]
  wire [1:0] _T_96; // @[Cat.scala 30:58:@4513.4]
  wire [29:0] _T_97; // @[Cat.scala 30:58:@4514.4]
  wire  _T_101; // @[qei.scala 106:40:@4526.8]
  wire  _T_102; // @[qei.scala 107:40:@4528.8]
  wire  _T_103; // @[qei.scala 108:40:@4530.8]
  wire  _GEN_12; // @[qei.scala 105:28:@4525.6]
  wire  _GEN_13; // @[qei.scala 105:28:@4525.6]
  wire  _GEN_14; // @[qei.scala 105:28:@4525.6]
  wire [31:0] _GEN_15; // @[qei.scala 103:25:@4521.4]
  wire  _GEN_16; // @[qei.scala 103:25:@4521.4]
  wire  _GEN_17; // @[qei.scala 103:25:@4521.4]
  wire  _GEN_18; // @[qei.scala 103:25:@4521.4]
  assign _T_51 = quad_a_delayed[1]; // @[qei.scala 51:44:@4439.4]
  assign _T_52 = quad_a_delayed[0]; // @[qei.scala 51:63:@4440.4]
  assign _T_54 = {_T_51,_T_52,io_quad_a}; // @[Cat.scala 30:58:@4442.4]
  assign _T_55 = quad_b_delayed[1]; // @[qei.scala 52:44:@4444.4]
  assign _T_56 = quad_b_delayed[0]; // @[qei.scala 52:63:@4445.4]
  assign _T_58 = {_T_55,_T_56,io_quad_b}; // @[Cat.scala 30:58:@4447.4]
  assign _T_61 = quad_a_delayed[2]; // @[qei.scala 54:75:@4450.4]
  assign count_2x = _T_51 ^ _T_61; // @[qei.scala 54:60:@4451.4]
  assign _T_68 = count_2x ^ _T_55; // @[qei.scala 55:78:@4458.4]
  assign _T_69 = quad_b_delayed[2]; // @[qei.scala 55:111:@4459.4]
  assign count_4x = _T_68 ^ _T_69; // @[qei.scala 55:96:@4460.4]
  assign count_direction = _T_51 ^ _T_69; // @[qei.scala 56:60:@4465.4]
  assign count_pulses = count_sel_2x ? count_2x : count_4x; // @[qei.scala 57:29:@4468.4]
  assign _T_76 = count_reg + 32'h1; // @[qei.scala 64:36:@4471.8]
  assign _T_77 = count_reg + 32'h1; // @[qei.scala 64:36:@4472.8]
  assign _T_79 = count_reg - 32'h1; // @[qei.scala 66:36:@4476.8]
  assign _T_80 = $unsigned(_T_79); // @[qei.scala 66:36:@4477.8]
  assign _T_81 = _T_80[31:0]; // @[qei.scala 66:36:@4478.8]
  assign _GEN_0 = count_direction ? _T_77 : _T_81; // @[qei.scala 63:27:@4470.6]
  assign _GEN_1 = count_pulses ? _GEN_0 : count_reg; // @[qei.scala 62:22:@4469.4]
  assign _T_82 = io_raw_irq | count_pulses; // @[qei.scala 71:20:@4482.4]
  assign _T_85 = count_reg_2 + 16'h1; // @[qei.scala 76:38:@4489.8]
  assign _T_86 = count_reg_2 + 16'h1; // @[qei.scala 76:38:@4490.8]
  assign _GEN_2 = io_raw_irq ? count_reg_2 : qei_speed_count; // @[qei.scala 72:23:@4484.6]
  assign _GEN_3 = io_raw_irq ? 16'h0 : _T_86; // @[qei.scala 72:23:@4484.6]
  assign _GEN_4 = _T_82 ? _GEN_2 : qei_speed_count; // @[qei.scala 71:37:@4483.4]
  assign _GEN_5 = _T_82 ? _GEN_3 : count_reg_2; // @[qei.scala 71:37:@4483.4]
  assign _T_89 = period_count == 16'hff; // @[qei.scala 85:29:@4500.8]
  assign _T_92 = period_count + 16'h1; // @[qei.scala 89:40:@4506.10]
  assign _T_93 = period_count + 16'h1; // @[qei.scala 89:40:@4507.10]
  assign _GEN_6 = _T_89 ? period_count : qei_period_count; // @[qei.scala 85:40:@4501.8]
  assign _GEN_7 = _T_89 ? 16'h0 : _T_93; // @[qei.scala 85:40:@4501.8]
  assign _GEN_8 = count_pulses ? period_count : _GEN_6; // @[qei.scala 82:24:@4495.6]
  assign _GEN_9 = count_pulses ? 16'h0 : _GEN_7; // @[qei.scala 82:24:@4495.6]
  assign _GEN_10 = period_sel ? _GEN_8 : qei_period_count; // @[qei.scala 81:20:@4494.4]
  assign _GEN_11 = period_sel ? _GEN_9 : period_count; // @[qei.scala 81:20:@4494.4]
  assign _T_94 = period_sel ? qei_period_count : qei_speed_count; // @[qei.scala 94:30:@4511.4]
  assign _T_96 = {speed_enable,count_sel_2x}; // @[Cat.scala 30:58:@4513.4]
  assign _T_97 = {29'h0,period_sel}; // @[Cat.scala 30:58:@4514.4]
  assign _T_101 = io_reg_cfg_di[0]; // @[qei.scala 106:40:@4526.8]
  assign _T_102 = io_reg_cfg_di[1]; // @[qei.scala 107:40:@4528.8]
  assign _T_103 = io_reg_cfg_di[2]; // @[qei.scala 108:40:@4530.8]
  assign _GEN_12 = io_reg_cfg_we ? _T_101 : count_sel_2x; // @[qei.scala 105:28:@4525.6]
  assign _GEN_13 = io_reg_cfg_we ? _T_102 : speed_enable; // @[qei.scala 105:28:@4525.6]
  assign _GEN_14 = io_reg_cfg_we ? _T_103 : period_sel; // @[qei.scala 105:28:@4525.6]
  assign _GEN_15 = io_reg_count_we ? io_reg_count_di : _GEN_1; // @[qei.scala 103:25:@4521.4]
  assign _GEN_16 = io_reg_count_we ? count_sel_2x : _GEN_12; // @[qei.scala 103:25:@4521.4]
  assign _GEN_17 = io_reg_count_we ? speed_enable : _GEN_13; // @[qei.scala 103:25:@4521.4]
  assign _GEN_18 = io_reg_count_we ? period_sel : _GEN_14; // @[qei.scala 103:25:@4521.4]
  assign io_reg_count_do = count_reg; // @[qei.scala 49:23:@4438.4]
  assign io_reg_cfg_do = {_T_97,_T_96}; // @[qei.scala 97:24:@4516.4]
  assign io_reg_speed_do = $signed(qei_output); // @[qei.scala 100:24:@4519.4]
  assign io_fb_period = period_sel; // @[qei.scala 101:24:@4520.4]
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
  quad_a_delayed = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  quad_b_delayed = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  count_reg = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  count_reg_2 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  period_count = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  speed_enable = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  count_sel_2x = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  qei_output = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  qei_speed_count = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  qei_period_count = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  period_sel = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      quad_a_delayed <= 3'h0;
    end else begin
      quad_a_delayed <= _T_54;
    end
    if (reset) begin
      quad_b_delayed <= 3'h0;
    end else begin
      quad_b_delayed <= _T_58;
    end
    if (reset) begin
      count_reg <= 32'h0;
    end else begin
      if (io_reg_count_we) begin
        count_reg <= io_reg_count_di;
      end else begin
        if (count_pulses) begin
          if (count_direction) begin
            count_reg <= _T_77;
          end else begin
            count_reg <= _T_81;
          end
        end
      end
    end
    if (reset) begin
      count_reg_2 <= 16'h0;
    end else begin
      if (_T_82) begin
        if (io_raw_irq) begin
          count_reg_2 <= 16'h0;
        end else begin
          count_reg_2 <= _T_86;
        end
      end
    end
    if (reset) begin
      period_count <= 16'h0;
    end else begin
      if (period_sel) begin
        if (count_pulses) begin
          period_count <= 16'h0;
        end else begin
          if (_T_89) begin
            period_count <= 16'h0;
          end else begin
            period_count <= _T_93;
          end
        end
      end
    end
    if (reset) begin
      speed_enable <= 1'h1;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          speed_enable <= _T_102;
        end
      end
    end
    if (reset) begin
      count_sel_2x <= 1'h1;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          count_sel_2x <= _T_101;
        end
      end
    end
    if (reset) begin
      qei_output <= 16'h0;
    end else begin
      if (period_sel) begin
        qei_output <= qei_period_count;
      end else begin
        qei_output <= qei_speed_count;
      end
    end
    if (reset) begin
      qei_speed_count <= 16'h0;
    end else begin
      if (_T_82) begin
        if (io_raw_irq) begin
          qei_speed_count <= count_reg_2;
        end
      end
    end
    if (reset) begin
      qei_period_count <= 16'h1fff;
    end else begin
      if (period_sel) begin
        if (count_pulses) begin
          qei_period_count <= period_count;
        end else begin
          if (_T_89) begin
            qei_period_count <= period_count;
          end
        end
      end
    end
    if (reset) begin
      period_sel <= 1'h0;
    end else begin
      if (!(io_reg_count_we)) begin
        if (io_reg_cfg_we) begin
          period_sel <= _T_103;
        end
      end
    end
  end
endmodule
module vedic_2x2( // @[:@4534.2]
  input  [1:0] io_a, // @[:@4537.4]
  input  [1:0] io_b, // @[:@4537.4]
  output [3:0] io_c // @[:@4537.4]
);
  wire  _T_11; // @[multiplier.scala 25:21:@4539.4]
  wire  _T_12; // @[multiplier.scala 25:31:@4540.4]
  wire  result0; // @[multiplier.scala 25:25:@4541.4]
  wire  _T_13; // @[multiplier.scala 26:21:@4542.4]
  wire  temp0; // @[multiplier.scala 26:25:@4544.4]
  wire  _T_16; // @[multiplier.scala 27:31:@4546.4]
  wire  temp1; // @[multiplier.scala 27:25:@4547.4]
  wire  temp2; // @[multiplier.scala 28:25:@4550.4]
  wire  result1; // @[multiplier.scala 31:23:@4551.4]
  wire  temp3; // @[multiplier.scala 32:23:@4552.4]
  wire  result2; // @[multiplier.scala 34:23:@4553.4]
  wire  result3; // @[multiplier.scala 35:23:@4554.4]
  wire [1:0] _T_19; // @[Cat.scala 30:58:@4555.4]
  wire [1:0] _T_20; // @[Cat.scala 30:58:@4556.4]
  assign _T_11 = io_a[0]; // @[multiplier.scala 25:21:@4539.4]
  assign _T_12 = io_b[0]; // @[multiplier.scala 25:31:@4540.4]
  assign result0 = _T_11 & _T_12; // @[multiplier.scala 25:25:@4541.4]
  assign _T_13 = io_a[1]; // @[multiplier.scala 26:21:@4542.4]
  assign temp0 = _T_13 & _T_12; // @[multiplier.scala 26:25:@4544.4]
  assign _T_16 = io_b[1]; // @[multiplier.scala 27:31:@4546.4]
  assign temp1 = _T_11 & _T_16; // @[multiplier.scala 27:25:@4547.4]
  assign temp2 = _T_13 & _T_16; // @[multiplier.scala 28:25:@4550.4]
  assign result1 = temp0 ^ temp1; // @[multiplier.scala 31:23:@4551.4]
  assign temp3 = temp0 & temp1; // @[multiplier.scala 32:23:@4552.4]
  assign result2 = temp2 ^ temp3; // @[multiplier.scala 34:23:@4553.4]
  assign result3 = temp2 & temp3; // @[multiplier.scala 35:23:@4554.4]
  assign _T_19 = {result1,result0}; // @[Cat.scala 30:58:@4555.4]
  assign _T_20 = {result3,result2}; // @[Cat.scala 30:58:@4556.4]
  assign io_c = {_T_20,_T_19}; // @[multiplier.scala 37:15:@4558.4]
endmodule
module vedic_4x4( // @[:@4638.2]
  input  [3:0] io_a, // @[:@4641.4]
  input  [3:0] io_b, // @[:@4641.4]
  output [7:0] io_c // @[:@4641.4]
);
  wire [1:0] z1_io_a; // @[multiplier.scala 64:23:@4654.4]
  wire [1:0] z1_io_b; // @[multiplier.scala 64:23:@4654.4]
  wire [3:0] z1_io_c; // @[multiplier.scala 64:23:@4654.4]
  wire [1:0] z2_io_a; // @[multiplier.scala 69:23:@4662.4]
  wire [1:0] z2_io_b; // @[multiplier.scala 69:23:@4662.4]
  wire [3:0] z2_io_c; // @[multiplier.scala 69:23:@4662.4]
  wire [1:0] z3_io_a; // @[multiplier.scala 73:23:@4670.4]
  wire [1:0] z3_io_b; // @[multiplier.scala 73:23:@4670.4]
  wire [3:0] z3_io_c; // @[multiplier.scala 73:23:@4670.4]
  wire [1:0] z4_io_a; // @[multiplier.scala 78:23:@4678.4]
  wire [1:0] z4_io_b; // @[multiplier.scala 78:23:@4678.4]
  wire [3:0] z4_io_c; // @[multiplier.scala 78:23:@4678.4]
  wire [3:0] q0; // @[multiplier.scala 49:21:@4643.4 multiplier.scala 67:15:@4661.4]
  wire [1:0] _T_31; // @[multiplier.scala 83:37:@4686.4]
  wire [3:0] temp1; // @[Cat.scala 30:58:@4687.4]
  wire [3:0] q1; // @[multiplier.scala 50:21:@4644.4 multiplier.scala 72:15:@4669.4]
  wire [4:0] _T_34; // @[multiplier.scala 84:26:@4690.4]
  wire [3:0] q4; // @[multiplier.scala 84:26:@4691.4]
  wire [3:0] q2; // @[multiplier.scala 51:21:@4645.4 multiplier.scala 76:15:@4677.4]
  wire [5:0] temp2; // @[Cat.scala 30:58:@4694.4]
  wire [3:0] q3; // @[multiplier.scala 52:21:@4646.4 multiplier.scala 81:15:@4685.4]
  wire [5:0] temp3; // @[Cat.scala 30:58:@4697.4]
  wire [6:0] _T_42; // @[multiplier.scala 87:24:@4699.4]
  wire [5:0] q5; // @[multiplier.scala 87:24:@4700.4]
  wire [5:0] temp4; // @[Cat.scala 30:58:@4703.4]
  wire [6:0] _T_47; // @[multiplier.scala 89:24:@4705.4]
  wire [5:0] q6; // @[multiplier.scala 89:24:@4706.4]
  wire [1:0] result1; // @[multiplier.scala 91:19:@4708.4]
  vedic_2x2 z1 ( // @[multiplier.scala 64:23:@4654.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_2x2 z2 ( // @[multiplier.scala 69:23:@4662.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_2x2 z3 ( // @[multiplier.scala 73:23:@4670.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_2x2 z4 ( // @[multiplier.scala 78:23:@4678.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign q0 = z1_io_c; // @[multiplier.scala 49:21:@4643.4 multiplier.scala 67:15:@4661.4]
  assign _T_31 = q0[3:2]; // @[multiplier.scala 83:37:@4686.4]
  assign temp1 = {2'h0,_T_31}; // @[Cat.scala 30:58:@4687.4]
  assign q1 = z2_io_c; // @[multiplier.scala 50:21:@4644.4 multiplier.scala 72:15:@4669.4]
  assign _T_34 = q1 + temp1; // @[multiplier.scala 84:26:@4690.4]
  assign q4 = q1 + temp1; // @[multiplier.scala 84:26:@4691.4]
  assign q2 = z3_io_c; // @[multiplier.scala 51:21:@4645.4 multiplier.scala 76:15:@4677.4]
  assign temp2 = {2'h0,q2}; // @[Cat.scala 30:58:@4694.4]
  assign q3 = z4_io_c; // @[multiplier.scala 52:21:@4646.4 multiplier.scala 81:15:@4685.4]
  assign temp3 = {q3,2'h0}; // @[Cat.scala 30:58:@4697.4]
  assign _T_42 = temp2 + temp3; // @[multiplier.scala 87:24:@4699.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 87:24:@4700.4]
  assign temp4 = {2'h0,q4}; // @[Cat.scala 30:58:@4703.4]
  assign _T_47 = temp4 + q5; // @[multiplier.scala 89:24:@4705.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 89:24:@4706.4]
  assign result1 = q0[1:0]; // @[multiplier.scala 91:19:@4708.4]
  assign io_c = {q6,result1}; // @[multiplier.scala 94:15:@4711.4]
  assign z1_io_a = io_a[1:0]; // @[multiplier.scala 65:15:@4658.4]
  assign z1_io_b = io_b[1:0]; // @[multiplier.scala 66:15:@4660.4]
  assign z2_io_a = io_a[3:2]; // @[multiplier.scala 70:15:@4666.4]
  assign z2_io_b = io_b[1:0]; // @[multiplier.scala 71:15:@4668.4]
  assign z3_io_a = io_a[1:0]; // @[multiplier.scala 74:15:@4674.4]
  assign z3_io_b = io_b[3:2]; // @[multiplier.scala 75:15:@4676.4]
  assign z4_io_a = io_a[3:2]; // @[multiplier.scala 79:15:@4682.4]
  assign z4_io_b = io_b[3:2]; // @[multiplier.scala 80:15:@4684.4]
endmodule
module vedic_8x8( // @[:@5250.2]
  input  [7:0]  io_a, // @[:@5253.4]
  input  [7:0]  io_b, // @[:@5253.4]
  output [15:0] io_c // @[:@5253.4]
);
  wire [3:0] z1_io_a; // @[multiplier.scala 188:22:@5267.4]
  wire [3:0] z1_io_b; // @[multiplier.scala 188:22:@5267.4]
  wire [7:0] z1_io_c; // @[multiplier.scala 188:22:@5267.4]
  wire [3:0] z2_io_a; // @[multiplier.scala 193:22:@5275.4]
  wire [3:0] z2_io_b; // @[multiplier.scala 193:22:@5275.4]
  wire [7:0] z2_io_c; // @[multiplier.scala 193:22:@5275.4]
  wire [3:0] z3_io_a; // @[multiplier.scala 198:22:@5283.4]
  wire [3:0] z3_io_b; // @[multiplier.scala 198:22:@5283.4]
  wire [7:0] z3_io_c; // @[multiplier.scala 198:22:@5283.4]
  wire [3:0] z4_io_a; // @[multiplier.scala 203:22:@5291.4]
  wire [3:0] z4_io_b; // @[multiplier.scala 203:22:@5291.4]
  wire [7:0] z4_io_c; // @[multiplier.scala 203:22:@5291.4]
  wire [15:0] q0; // @[multiplier.scala 171:20:@5255.4 multiplier.scala 191:14:@5274.4]
  wire [3:0] _T_31; // @[multiplier.scala 210:36:@5299.4]
  wire [7:0] temp1; // @[Cat.scala 30:58:@5300.4]
  wire [15:0] q1; // @[multiplier.scala 172:20:@5256.4 multiplier.scala 196:14:@5282.4]
  wire [7:0] _T_33; // @[multiplier.scala 211:19:@5302.4]
  wire [8:0] _T_34; // @[multiplier.scala 211:25:@5303.4]
  wire [7:0] q4; // @[multiplier.scala 211:25:@5304.4]
  wire [15:0] q2; // @[multiplier.scala 173:20:@5257.4 multiplier.scala 201:14:@5290.4]
  wire [7:0] _T_37; // @[multiplier.scala 212:36:@5306.4]
  wire [11:0] temp2; // @[Cat.scala 30:58:@5307.4]
  wire [15:0] q3; // @[multiplier.scala 174:20:@5258.4 multiplier.scala 206:14:@5298.4]
  wire [7:0] _T_39; // @[multiplier.scala 213:23:@5309.4]
  wire [11:0] temp3; // @[Cat.scala 30:58:@5310.4]
  wire [12:0] _T_42; // @[multiplier.scala 214:23:@5312.4]
  wire [11:0] q5; // @[multiplier.scala 214:23:@5313.4]
  wire [11:0] temp4; // @[Cat.scala 30:58:@5316.4]
  wire [12:0] _T_47; // @[multiplier.scala 218:23:@5318.4]
  wire [11:0] q6; // @[multiplier.scala 218:23:@5319.4]
  wire [3:0] result1; // @[multiplier.scala 220:19:@5321.4]
  vedic_4x4 z1 ( // @[multiplier.scala 188:22:@5267.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_4x4 z2 ( // @[multiplier.scala 193:22:@5275.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_4x4 z3 ( // @[multiplier.scala 198:22:@5283.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_4x4 z4 ( // @[multiplier.scala 203:22:@5291.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign q0 = {{8'd0}, z1_io_c}; // @[multiplier.scala 171:20:@5255.4 multiplier.scala 191:14:@5274.4]
  assign _T_31 = q0[7:4]; // @[multiplier.scala 210:36:@5299.4]
  assign temp1 = {4'h0,_T_31}; // @[Cat.scala 30:58:@5300.4]
  assign q1 = {{8'd0}, z2_io_c}; // @[multiplier.scala 172:20:@5256.4 multiplier.scala 196:14:@5282.4]
  assign _T_33 = q1[7:0]; // @[multiplier.scala 211:19:@5302.4]
  assign _T_34 = _T_33 + temp1; // @[multiplier.scala 211:25:@5303.4]
  assign q4 = _T_33 + temp1; // @[multiplier.scala 211:25:@5304.4]
  assign q2 = {{8'd0}, z3_io_c}; // @[multiplier.scala 173:20:@5257.4 multiplier.scala 201:14:@5290.4]
  assign _T_37 = q2[7:0]; // @[multiplier.scala 212:36:@5306.4]
  assign temp2 = {4'h0,_T_37}; // @[Cat.scala 30:58:@5307.4]
  assign q3 = {{8'd0}, z4_io_c}; // @[multiplier.scala 174:20:@5258.4 multiplier.scala 206:14:@5298.4]
  assign _T_39 = q3[7:0]; // @[multiplier.scala 213:23:@5309.4]
  assign temp3 = {_T_39,4'h0}; // @[Cat.scala 30:58:@5310.4]
  assign _T_42 = temp2 + temp3; // @[multiplier.scala 214:23:@5312.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 214:23:@5313.4]
  assign temp4 = {4'h0,q4}; // @[Cat.scala 30:58:@5316.4]
  assign _T_47 = temp4 + q5; // @[multiplier.scala 218:23:@5318.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 218:23:@5319.4]
  assign result1 = q0[3:0]; // @[multiplier.scala 220:19:@5321.4]
  assign io_c = {q6,result1}; // @[multiplier.scala 224:15:@5324.4]
  assign z1_io_a = io_a[3:0]; // @[multiplier.scala 189:14:@5271.4]
  assign z1_io_b = io_b[3:0]; // @[multiplier.scala 190:14:@5273.4]
  assign z2_io_a = io_a[7:4]; // @[multiplier.scala 194:14:@5279.4]
  assign z2_io_b = io_b[3:0]; // @[multiplier.scala 195:14:@5281.4]
  assign z3_io_a = io_a[3:0]; // @[multiplier.scala 199:14:@5287.4]
  assign z3_io_b = io_b[7:4]; // @[multiplier.scala 200:14:@5289.4]
  assign z4_io_a = io_a[7:4]; // @[multiplier.scala 204:14:@5295.4]
  assign z4_io_b = io_b[7:4]; // @[multiplier.scala 205:14:@5297.4]
endmodule
module vedic_16x16( // @[:@7089.2]
  input  [15:0] io_a, // @[:@7092.4]
  input  [15:0] io_b, // @[:@7092.4]
  output [31:0] io_c // @[:@7092.4]
);
  wire [7:0] z1_io_a; // @[multiplier.scala 254:30:@7114.4]
  wire [7:0] z1_io_b; // @[multiplier.scala 254:30:@7114.4]
  wire [15:0] z1_io_c; // @[multiplier.scala 254:30:@7114.4]
  wire [7:0] z2_io_a; // @[multiplier.scala 259:30:@7122.4]
  wire [7:0] z2_io_b; // @[multiplier.scala 259:30:@7122.4]
  wire [15:0] z2_io_c; // @[multiplier.scala 259:30:@7122.4]
  wire [7:0] z3_io_a; // @[multiplier.scala 264:30:@7130.4]
  wire [7:0] z3_io_b; // @[multiplier.scala 264:30:@7130.4]
  wire [15:0] z3_io_c; // @[multiplier.scala 264:30:@7130.4]
  wire [3:0] z4_io_a; // @[multiplier.scala 269:30:@7138.4]
  wire [3:0] z4_io_b; // @[multiplier.scala 269:30:@7138.4]
  wire [7:0] z4_io_c; // @[multiplier.scala 269:30:@7138.4]
  wire [15:0] _T_22; // @[multiplier.scala 250:25:@7105.4]
  wire [15:0] _T_23; // @[multiplier.scala 250:25:@7106.4]
  wire [15:0] _T_24; // @[multiplier.scala 250:38:@7107.4]
  wire [16:0] _T_26; // @[multiplier.scala 250:41:@7108.4]
  wire [15:0] in1_complement; // @[multiplier.scala 250:41:@7109.4]
  wire  _T_27; // @[multiplier.scala 251:32:@7110.4]
  wire [15:0] _T_29; // @[multiplier.scala 251:64:@7112.4]
  wire [15:0] input1; // @[multiplier.scala 251:27:@7113.4]
  wire [7:0] _T_32; // @[multiplier.scala 260:31:@7125.4]
  wire [7:0] _T_35; // @[multiplier.scala 266:29:@7135.4]
  wire [15:0] q0; // @[multiplier.scala 236:28:@7094.4 multiplier.scala 257:22:@7121.4]
  wire [7:0] _T_39; // @[multiplier.scala 275:44:@7146.4]
  wire [15:0] _T_40; // @[Cat.scala 30:58:@7147.4]
  wire [15:0] q1; // @[multiplier.scala 237:28:@7095.4 multiplier.scala 262:22:@7129.4]
  wire [17:0] temp1; // @[multiplier.scala 241:28:@7098.4 multiplier.scala 275:22:@7148.4]
  wire [17:0] _GEN_0; // @[multiplier.scala 276:34:@7150.4]
  wire [18:0] _T_42; // @[multiplier.scala 276:34:@7150.4]
  wire [17:0] _T_43; // @[multiplier.scala 276:34:@7151.4]
  wire [15:0] q2; // @[multiplier.scala 238:28:@7096.4 multiplier.scala 267:22:@7137.4]
  wire [23:0] temp2; // @[Cat.scala 30:58:@7154.4]
  wire [15:0] q3; // @[multiplier.scala 239:28:@7097.4 multiplier.scala 272:22:@7145.4]
  wire [23:0] temp3; // @[Cat.scala 30:58:@7157.4]
  wire [24:0] _T_50; // @[multiplier.scala 279:31:@7159.4]
  wire [23:0] q5; // @[multiplier.scala 279:31:@7160.4]
  wire [15:0] q4; // @[multiplier.scala 246:28:@7102.4 multiplier.scala 276:22:@7152.4]
  wire [23:0] temp4; // @[Cat.scala 30:58:@7163.4]
  wire [24:0] _T_55; // @[multiplier.scala 281:31:@7165.4]
  wire [23:0] q6; // @[multiplier.scala 281:31:@7166.4]
  wire [7:0] result1; // @[multiplier.scala 283:26:@7168.4]
  wire [31:0] result; // @[Cat.scala 30:58:@7170.4]
  wire [31:0] _T_57; // @[multiplier.scala 286:28:@7171.4]
  wire [31:0] _T_58; // @[multiplier.scala 286:43:@7172.4]
  wire [32:0] _T_60; // @[multiplier.scala 286:46:@7173.4]
  wire [31:0] _T_61; // @[multiplier.scala 286:46:@7174.4]
  wire [31:0] result_complement; // @[multiplier.scala 286:46:@7175.4]
  wire [31:0] _T_63; // @[multiplier.scala 288:70:@7177.4]
  vedic_8x8 z1 ( // @[multiplier.scala 254:30:@7114.4]
    .io_a(z1_io_a),
    .io_b(z1_io_b),
    .io_c(z1_io_c)
  );
  vedic_8x8 z2 ( // @[multiplier.scala 259:30:@7122.4]
    .io_a(z2_io_a),
    .io_b(z2_io_b),
    .io_c(z2_io_c)
  );
  vedic_8x8 z3 ( // @[multiplier.scala 264:30:@7130.4]
    .io_a(z3_io_a),
    .io_b(z3_io_b),
    .io_c(z3_io_c)
  );
  vedic_4x4 z4 ( // @[multiplier.scala 269:30:@7138.4]
    .io_a(z4_io_a),
    .io_b(z4_io_b),
    .io_c(z4_io_c)
  );
  assign _T_22 = ~ io_a; // @[multiplier.scala 250:25:@7105.4]
  assign _T_23 = $signed(_T_22); // @[multiplier.scala 250:25:@7106.4]
  assign _T_24 = $unsigned(_T_23); // @[multiplier.scala 250:38:@7107.4]
  assign _T_26 = _T_24 + 16'h1; // @[multiplier.scala 250:41:@7108.4]
  assign in1_complement = _T_24 + 16'h1; // @[multiplier.scala 250:41:@7109.4]
  assign _T_27 = io_a[15]; // @[multiplier.scala 251:32:@7110.4]
  assign _T_29 = $unsigned(io_a); // @[multiplier.scala 251:64:@7112.4]
  assign input1 = _T_27 ? in1_complement : _T_29; // @[multiplier.scala 251:27:@7113.4]
  assign _T_32 = input1[15:8]; // @[multiplier.scala 260:31:@7125.4]
  assign _T_35 = io_b[15:8]; // @[multiplier.scala 266:29:@7135.4]
  assign q0 = z1_io_c; // @[multiplier.scala 236:28:@7094.4 multiplier.scala 257:22:@7121.4]
  assign _T_39 = q0[15:8]; // @[multiplier.scala 275:44:@7146.4]
  assign _T_40 = {8'h0,_T_39}; // @[Cat.scala 30:58:@7147.4]
  assign q1 = z2_io_c; // @[multiplier.scala 237:28:@7095.4 multiplier.scala 262:22:@7129.4]
  assign temp1 = {{2'd0}, _T_40}; // @[multiplier.scala 241:28:@7098.4 multiplier.scala 275:22:@7148.4]
  assign _GEN_0 = {{2'd0}, q1}; // @[multiplier.scala 276:34:@7150.4]
  assign _T_42 = _GEN_0 + temp1; // @[multiplier.scala 276:34:@7150.4]
  assign _T_43 = _GEN_0 + temp1; // @[multiplier.scala 276:34:@7151.4]
  assign q2 = z3_io_c; // @[multiplier.scala 238:28:@7096.4 multiplier.scala 267:22:@7137.4]
  assign temp2 = {8'h0,q2}; // @[Cat.scala 30:58:@7154.4]
  assign q3 = {{8'd0}, z4_io_c}; // @[multiplier.scala 239:28:@7097.4 multiplier.scala 272:22:@7145.4]
  assign temp3 = {q3,8'h0}; // @[Cat.scala 30:58:@7157.4]
  assign _T_50 = temp2 + temp3; // @[multiplier.scala 279:31:@7159.4]
  assign q5 = temp2 + temp3; // @[multiplier.scala 279:31:@7160.4]
  assign q4 = _T_43[15:0]; // @[multiplier.scala 246:28:@7102.4 multiplier.scala 276:22:@7152.4]
  assign temp4 = {8'h0,q4}; // @[Cat.scala 30:58:@7163.4]
  assign _T_55 = temp4 + q5; // @[multiplier.scala 281:31:@7165.4]
  assign q6 = temp4 + q5; // @[multiplier.scala 281:31:@7166.4]
  assign result1 = q0[7:0]; // @[multiplier.scala 283:26:@7168.4]
  assign result = {q6,result1}; // @[Cat.scala 30:58:@7170.4]
  assign _T_57 = ~ result; // @[multiplier.scala 286:28:@7171.4]
  assign _T_58 = $signed(_T_57); // @[multiplier.scala 286:43:@7172.4]
  assign _T_60 = $signed(_T_58) + $signed(32'sh1); // @[multiplier.scala 286:46:@7173.4]
  assign _T_61 = $signed(_T_58) + $signed(32'sh1); // @[multiplier.scala 286:46:@7174.4]
  assign result_complement = $signed(_T_61); // @[multiplier.scala 286:46:@7175.4]
  assign _T_63 = $signed(result); // @[multiplier.scala 288:70:@7177.4]
  assign io_c = _T_27 ? $signed(result_complement) : $signed(_T_63); // @[multiplier.scala 289:22:@7179.4]
  assign z1_io_a = input1[7:0]; // @[multiplier.scala 255:22:@7118.4]
  assign z1_io_b = io_b[7:0]; // @[multiplier.scala 256:22:@7120.4]
  assign z2_io_a = input1[15:8]; // @[multiplier.scala 260:22:@7126.4]
  assign z2_io_b = io_b[7:0]; // @[multiplier.scala 261:22:@7128.4]
  assign z3_io_a = input1[7:0]; // @[multiplier.scala 265:22:@7134.4]
  assign z3_io_b = io_b[15:8]; // @[multiplier.scala 266:22:@7136.4]
  assign z4_io_a = _T_32[3:0]; // @[multiplier.scala 270:22:@7142.4]
  assign z4_io_b = _T_35[3:0]; // @[multiplier.scala 271:22:@7144.4]
endmodule
module PID_Controller( // @[:@12475.2]
  input         clock, // @[:@12476.4]
  input         reset, // @[:@12477.4]
  input         io_fb_period, // @[:@12478.4]
  input         io_raw_irq, // @[:@12478.4]
  input         io_reg_kp_we, // @[:@12478.4]
  input  [15:0] io_reg_kp_di, // @[:@12478.4]
  output [15:0] io_reg_kp_do, // @[:@12478.4]
  input         io_reg_ki_we, // @[:@12478.4]
  input  [15:0] io_reg_ki_di, // @[:@12478.4]
  output [15:0] io_reg_ki_do, // @[:@12478.4]
  input         io_reg_kd_we, // @[:@12478.4]
  input  [15:0] io_reg_kd_di, // @[:@12478.4]
  output [15:0] io_reg_kd_do, // @[:@12478.4]
  input         io_reg_ref_we, // @[:@12478.4]
  input  [15:0] io_reg_ref_di, // @[:@12478.4]
  output [15:0] io_reg_ref_do, // @[:@12478.4]
  input         io_reg_fb_we, // @[:@12478.4]
  input  [15:0] io_reg_fb_di, // @[:@12478.4]
  output [15:0] io_reg_fb_do, // @[:@12478.4]
  input         io_reg_cfg_we, // @[:@12478.4]
  input  [15:0] io_reg_cfg_di, // @[:@12478.4]
  output [15:0] io_reg_cfg_do, // @[:@12478.4]
  input  [15:0] io_speed_fb_in, // @[:@12478.4]
  output [15:0] io_pid_out // @[:@12478.4]
);
  wire [15:0] mul_kp_io_a; // @[pid.scala 110:25:@12528.4]
  wire [15:0] mul_kp_io_b; // @[pid.scala 110:25:@12528.4]
  wire [31:0] mul_kp_io_c; // @[pid.scala 110:25:@12528.4]
  wire [15:0] mul_ki_io_a; // @[pid.scala 116:25:@12536.4]
  wire [15:0] mul_ki_io_b; // @[pid.scala 116:25:@12536.4]
  wire [31:0] mul_ki_io_c; // @[pid.scala 116:25:@12536.4]
  wire [15:0] mul_kd_io_a; // @[pid.scala 122:25:@12544.4]
  wire [15:0] mul_kd_io_b; // @[pid.scala 122:25:@12544.4]
  wire [31:0] mul_kd_io_c; // @[pid.scala 122:25:@12544.4]
  reg [15:0] kp; // @[pid.scala 56:26:@12480.4]
  reg [31:0] _RAND_0;
  reg [15:0] ki; // @[pid.scala 57:26:@12481.4]
  reg [31:0] _RAND_1;
  reg [15:0] kd; // @[pid.scala 58:26:@12482.4]
  reg [31:0] _RAND_2;
  reg [15:0] ref$; // @[pid.scala 59:26:@12483.4]
  reg [31:0] _RAND_3;
  reg [15:0] feedback; // @[pid.scala 60:26:@12484.4]
  reg [31:0] _RAND_4;
  reg [15:0] sigma_old; // @[pid.scala 61:26:@12485.4]
  reg [31:0] _RAND_5;
  reg  fb_sel; // @[pid.scala 62:26:@12486.4]
  reg [31:0] _RAND_6;
  reg [15:0] e_prev1; // @[pid.scala 64:26:@12487.4]
  reg [31:0] _RAND_7;
  reg [15:0] e_prev2; // @[pid.scala 65:26:@12488.4]
  reg [31:0] _RAND_8;
  reg [15:0] reg_pid_out; // @[pid.scala 66:28:@12489.4]
  reg [31:0] _RAND_9;
  wire [15:0] _GEN_0; // @[pid.scala 70:22:@12491.4]
  wire [15:0] _GEN_1; // @[pid.scala 75:22:@12495.4]
  wire [15:0] _GEN_2; // @[pid.scala 80:22:@12499.4]
  wire [15:0] _GEN_3; // @[pid.scala 86:23:@12503.4]
  wire [15:0] _GEN_4; // @[pid.scala 93:24:@12508.6]
  wire [15:0] _GEN_5; // @[pid.scala 92:16:@12507.4]
  wire [31:0] _T_70; // @[Cat.scala 30:58:@12515.4]
  wire [31:0] _T_71; // @[pid.scala 100:49:@12516.4]
  wire  _T_72; // @[pid.scala 102:28:@12519.6]
  wire  _GEN_6; // @[pid.scala 101:23:@12518.4]
  wire [16:0] _T_73; // @[pid.scala 106:27:@12522.4]
  wire [15:0] _T_74; // @[pid.scala 106:27:@12523.4]
  wire [16:0] _T_75; // @[pid.scala 107:27:@12525.4]
  wire [15:0] _T_76; // @[pid.scala 107:27:@12526.4]
  wire [15:0] sigma_new; // @[pid.scala 107:27:@12527.4]
  wire [15:0] _T_78; // @[pid.scala 113:30:@12534.4]
  wire [15:0] prop_out; // @[pid.scala 113:43:@12535.4]
  wire [15:0] _T_80; // @[pid.scala 119:33:@12542.4]
  wire [15:0] integral_out; // @[pid.scala 119:46:@12543.4]
  wire [15:0] _T_82; // @[pid.scala 125:35:@12550.4]
  wire [15:0] derivative_out; // @[pid.scala 125:48:@12551.4]
  wire [16:0] _T_83; // @[pid.scala 128:28:@12552.4]
  wire [15:0] _T_84; // @[pid.scala 128:28:@12553.4]
  wire [15:0] pi_sum; // @[pid.scala 128:28:@12554.4]
  wire  _T_85; // @[pid.scala 129:34:@12555.4]
  wire  _T_86; // @[pid.scala 129:54:@12556.4]
  wire  _T_87; // @[pid.scala 129:39:@12557.4]
  wire  _T_88; // @[pid.scala 129:69:@12558.4]
  wire  _T_90; // @[pid.scala 129:62:@12559.4]
  wire  _T_91; // @[pid.scala 129:59:@12560.4]
  wire  _T_94; // @[pid.scala 130:26:@12562.4]
  wire  _T_97; // @[pid.scala 130:43:@12564.4]
  wire  _T_98; // @[pid.scala 130:40:@12565.4]
  wire  _T_100; // @[pid.scala 130:61:@12567.4]
  wire  pi_sum_overflow; // @[pid.scala 129:75:@12568.4]
  wire [16:0] _T_101; // @[pid.scala 135:29:@12571.8]
  wire [15:0] _T_102; // @[pid.scala 135:29:@12572.8]
  wire [15:0] _T_103; // @[pid.scala 135:29:@12573.8]
  wire [16:0] _T_104; // @[pid.scala 137:24:@12577.8]
  wire [15:0] _T_105; // @[pid.scala 137:24:@12578.8]
  wire [15:0] _T_106; // @[pid.scala 137:24:@12579.8]
  wire [15:0] _GEN_7; // @[pid.scala 134:23:@12570.6]
  wire [16:0] _T_107; // @[pid.scala 141:27:@12584.6]
  wire [15:0] _T_108; // @[pid.scala 141:27:@12585.6]
  wire [15:0] _T_109; // @[pid.scala 141:27:@12586.6]
  wire [15:0] _GEN_8; // @[pid.scala 132:20:@12569.4]
  wire [15:0] _GEN_9; // @[pid.scala 132:20:@12569.4]
  wire [15:0] _GEN_10; // @[pid.scala 132:20:@12569.4]
  wire [15:0] _GEN_11; // @[pid.scala 132:20:@12569.4]
  wire  _T_110; // @[pid.scala 144:54:@12589.4]
  wire  _T_111; // @[pid.scala 144:40:@12590.4]
  wire [15:0] _GEN_12; // @[pid.scala 100:17:@12517.4]
  vedic_16x16 mul_kp ( // @[pid.scala 110:25:@12528.4]
    .io_a(mul_kp_io_a),
    .io_b(mul_kp_io_b),
    .io_c(mul_kp_io_c)
  );
  vedic_16x16 mul_ki ( // @[pid.scala 116:25:@12536.4]
    .io_a(mul_ki_io_a),
    .io_b(mul_ki_io_b),
    .io_c(mul_ki_io_c)
  );
  vedic_16x16 mul_kd ( // @[pid.scala 122:25:@12544.4]
    .io_a(mul_kd_io_a),
    .io_b(mul_kd_io_b),
    .io_c(mul_kd_io_c)
  );
  assign _GEN_0 = io_reg_kp_we ? $signed(io_reg_kp_di) : $signed(kp); // @[pid.scala 70:22:@12491.4]
  assign _GEN_1 = io_reg_ki_we ? $signed(io_reg_ki_di) : $signed(ki); // @[pid.scala 75:22:@12495.4]
  assign _GEN_2 = io_reg_kd_we ? $signed(io_reg_kd_di) : $signed(kd); // @[pid.scala 80:22:@12499.4]
  assign _GEN_3 = io_reg_ref_we ? $signed(io_reg_ref_di) : $signed(ref$); // @[pid.scala 86:23:@12503.4]
  assign _GEN_4 = io_reg_fb_we ? $signed(io_reg_fb_di) : $signed(feedback); // @[pid.scala 93:24:@12508.6]
  assign _GEN_5 = fb_sel ? $signed(_GEN_4) : $signed(io_speed_fb_in); // @[pid.scala 92:16:@12507.4]
  assign _T_70 = {31'h0,fb_sel}; // @[Cat.scala 30:58:@12515.4]
  assign _T_71 = $signed(_T_70); // @[pid.scala 100:49:@12516.4]
  assign _T_72 = io_reg_cfg_di[0]; // @[pid.scala 102:28:@12519.6]
  assign _GEN_6 = io_reg_cfg_we ? _T_72 : fb_sel; // @[pid.scala 101:23:@12518.4]
  assign _T_73 = $signed(e_prev1) - $signed(e_prev2); // @[pid.scala 106:27:@12522.4]
  assign _T_74 = $signed(e_prev1) - $signed(e_prev2); // @[pid.scala 106:27:@12523.4]
  assign _T_75 = $signed(e_prev1) + $signed(sigma_old); // @[pid.scala 107:27:@12525.4]
  assign _T_76 = $signed(e_prev1) + $signed(sigma_old); // @[pid.scala 107:27:@12526.4]
  assign sigma_new = $signed(_T_76); // @[pid.scala 107:27:@12527.4]
  assign _T_78 = mul_kp_io_c[15:0]; // @[pid.scala 113:30:@12534.4]
  assign prop_out = $signed(_T_78); // @[pid.scala 113:43:@12535.4]
  assign _T_80 = mul_ki_io_c[15:0]; // @[pid.scala 119:33:@12542.4]
  assign integral_out = $signed(_T_80); // @[pid.scala 119:46:@12543.4]
  assign _T_82 = mul_kd_io_c[15:0]; // @[pid.scala 125:35:@12550.4]
  assign derivative_out = $signed(_T_82); // @[pid.scala 125:48:@12551.4]
  assign _T_83 = $signed(prop_out) + $signed(integral_out); // @[pid.scala 128:28:@12552.4]
  assign _T_84 = $signed(prop_out) + $signed(integral_out); // @[pid.scala 128:28:@12553.4]
  assign pi_sum = $signed(_T_84); // @[pid.scala 128:28:@12554.4]
  assign _T_85 = prop_out[15]; // @[pid.scala 129:34:@12555.4]
  assign _T_86 = integral_out[15]; // @[pid.scala 129:54:@12556.4]
  assign _T_87 = _T_85 & _T_86; // @[pid.scala 129:39:@12557.4]
  assign _T_88 = pi_sum[15]; // @[pid.scala 129:69:@12558.4]
  assign _T_90 = _T_88 == 1'h0; // @[pid.scala 129:62:@12559.4]
  assign _T_91 = _T_87 & _T_90; // @[pid.scala 129:59:@12560.4]
  assign _T_94 = _T_85 == 1'h0; // @[pid.scala 130:26:@12562.4]
  assign _T_97 = _T_86 == 1'h0; // @[pid.scala 130:43:@12564.4]
  assign _T_98 = _T_94 & _T_97; // @[pid.scala 130:40:@12565.4]
  assign _T_100 = _T_98 & _T_88; // @[pid.scala 130:61:@12567.4]
  assign pi_sum_overflow = _T_91 | _T_100; // @[pid.scala 129:75:@12568.4]
  assign _T_101 = $signed(feedback) - $signed(ref$); // @[pid.scala 135:29:@12571.8]
  assign _T_102 = $signed(feedback) - $signed(ref$); // @[pid.scala 135:29:@12572.8]
  assign _T_103 = $signed(_T_102); // @[pid.scala 135:29:@12573.8]
  assign _T_104 = $signed(ref$) - $signed(feedback); // @[pid.scala 137:24:@12577.8]
  assign _T_105 = $signed(ref$) - $signed(feedback); // @[pid.scala 137:24:@12578.8]
  assign _T_106 = $signed(_T_105); // @[pid.scala 137:24:@12579.8]
  assign _GEN_7 = io_fb_period ? $signed(_T_103) : $signed(_T_106); // @[pid.scala 134:23:@12570.6]
  assign _T_107 = $signed(pi_sum) + $signed(derivative_out); // @[pid.scala 141:27:@12584.6]
  assign _T_108 = $signed(pi_sum) + $signed(derivative_out); // @[pid.scala 141:27:@12585.6]
  assign _T_109 = $signed(_T_108); // @[pid.scala 141:27:@12586.6]
  assign _GEN_8 = io_raw_irq ? $signed(_GEN_7) : $signed(e_prev1); // @[pid.scala 132:20:@12569.4]
  assign _GEN_9 = io_raw_irq ? $signed(e_prev1) : $signed(e_prev2); // @[pid.scala 132:20:@12569.4]
  assign _GEN_10 = io_raw_irq ? $signed(sigma_new) : $signed(sigma_old); // @[pid.scala 132:20:@12569.4]
  assign _GEN_11 = io_raw_irq ? $signed(_T_109) : $signed(reg_pid_out); // @[pid.scala 132:20:@12569.4]
  assign _T_110 = reg_pid_out[15]; // @[pid.scala 144:54:@12589.4]
  assign _T_111 = pi_sum_overflow | _T_110; // @[pid.scala 144:40:@12590.4]
  assign io_reg_kp_do = kp; // @[pid.scala 69:17:@12490.4]
  assign io_reg_ki_do = ki; // @[pid.scala 74:17:@12494.4]
  assign io_reg_kd_do = kd; // @[pid.scala 79:17:@12498.4]
  assign io_reg_ref_do = ref$; // @[pid.scala 85:17:@12502.4]
  assign io_reg_fb_do = feedback; // @[pid.scala 90:17:@12506.4]
  assign _GEN_12 = _T_71[15:0]; // @[pid.scala 100:17:@12517.4]
  assign io_reg_cfg_do = $signed(_GEN_12); // @[pid.scala 100:17:@12517.4]
  assign io_pid_out = _T_111 ? $signed(16'sh0) : $signed(reg_pid_out); // @[pid.scala 144:17:@12592.4]
  assign mul_kp_io_a = e_prev1; // @[pid.scala 111:17:@12531.4]
  assign mul_kp_io_b = $unsigned(kp); // @[pid.scala 112:17:@12533.4]
  assign mul_ki_io_a = $signed(_T_76); // @[pid.scala 117:17:@12539.4]
  assign mul_ki_io_b = $unsigned(ki); // @[pid.scala 118:17:@12541.4]
  assign mul_kd_io_a = $signed(_T_74); // @[pid.scala 123:17:@12547.4]
  assign mul_kd_io_b = $unsigned(kd); // @[pid.scala 124:17:@12549.4]
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
  kp = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ki = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  kd = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ref$ = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  feedback = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  sigma_old = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  fb_sel = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  e_prev1 = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  e_prev2 = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reg_pid_out = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      kp <= 16'sh1;
    end else begin
      if (io_reg_kp_we) begin
        kp <= io_reg_kp_di;
      end
    end
    if (reset) begin
      ki <= 16'sh0;
    end else begin
      if (io_reg_ki_we) begin
        ki <= io_reg_ki_di;
      end
    end
    if (reset) begin
      kd <= 16'sh0;
    end else begin
      if (io_reg_kd_we) begin
        kd <= io_reg_kd_di;
      end
    end
    if (reset) begin
      ref$ <= 16'sh14;
    end else begin
      if (io_reg_ref_we) begin
        ref$ <= io_reg_ref_di;
      end
    end
    if (reset) begin
      feedback <= 16'sh0;
    end else begin
      if (fb_sel) begin
        if (io_reg_fb_we) begin
          feedback <= io_reg_fb_di;
        end
      end else begin
        feedback <= io_speed_fb_in;
      end
    end
    if (reset) begin
      sigma_old <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        sigma_old <= sigma_new;
      end
    end
    if (reset) begin
      fb_sel <= 1'h0;
    end else begin
      if (io_reg_cfg_we) begin
        fb_sel <= _T_72;
      end
    end
    if (reset) begin
      e_prev1 <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        if (io_fb_period) begin
          e_prev1 <= _T_103;
        end else begin
          e_prev1 <= _T_106;
        end
      end
    end
    if (reset) begin
      e_prev2 <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        e_prev2 <= e_prev1;
      end
    end
    if (reset) begin
      reg_pid_out <= 16'sh0;
    end else begin
      if (io_raw_irq) begin
        reg_pid_out <= _T_109;
      end
    end
  end
endmodule
module Motor_Top( // @[:@12594.2]
  input         clock, // @[:@12595.4]
  input         reset, // @[:@12596.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@12597.4]
  input  [31:0] io_wbs_m2s_data, // @[:@12597.4]
  input         io_wbs_m2s_we, // @[:@12597.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@12597.4]
  input         io_wbs_m2s_stb, // @[:@12597.4]
  output        io_wbs_ack_o, // @[:@12597.4]
  output [31:0] io_wbs_data_o, // @[:@12597.4]
  input         io_motor_gpio_qei_ch_a, // @[:@12597.4]
  input         io_motor_gpio_qei_ch_b, // @[:@12597.4]
  output        io_motor_gpio_pwm_high, // @[:@12597.4]
  output        io_motor_gpio_pwm_low, // @[:@12597.4]
  output        io_motor_gpio_pwm_high_en, // @[:@12597.4]
  output        io_motor_gpio_pwm_low_en, // @[:@12597.4]
  input         io_ba_match, // @[:@12597.4]
  output        io_motor_irq // @[:@12597.4]
);
  wire  interlink_clock; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_reset; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_bus_adr_i; // @[motor_top.scala 42:26:@12599.4]
  wire [3:0] interlink_io_bus_sel_i; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_bus_we_i; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_bus_cyc_i; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_bus_stb_i; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_bus_ack_o; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_bus_dat_o; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_tmr_val_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_tmr_val_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_tmr_dat_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_tmr_dat_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_tmr_duty_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_tmr_duty_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_tmr_cfg_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_tmr_cfg_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_qei_count_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_qei_count_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_qei_cfg_we; // @[motor_top.scala 42:26:@12599.4]
  wire [31:0] interlink_io_qei_cfg_do; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_qei_speed_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_kp_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_kp_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_ki_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_ki_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_kd_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_kd_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_ref_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_ref_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_fb_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_fb_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_pid_cfg_we; // @[motor_top.scala 42:26:@12599.4]
  wire [15:0] interlink_io_pid_cfg_do; // @[motor_top.scala 42:26:@12599.4]
  wire  interlink_io_ba_match; // @[motor_top.scala 42:26:@12599.4]
  wire  pwm_clock; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_reset; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_reg_val_we; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_val_di; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_val_do; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_reg_cfg_we; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_cfg_di; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_cfg_do; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_reg_dat_we; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_dat_di; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_dat_do; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_reg_duty_we; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_duty_di; // @[motor_top.scala 58:37:@12610.4]
  wire [31:0] pwm_io_reg_duty_do; // @[motor_top.scala 58:37:@12610.4]
  wire [15:0] pwm_io_reg_pid_out; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_pwm_h; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_pwm_l; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_pwm_h_en; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_pwm_l_en; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_irq_out; // @[motor_top.scala 58:37:@12610.4]
  wire  pwm_io_rawirq_out; // @[motor_top.scala 58:37:@12610.4]
  wire  qei_clock; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_reset; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_quad_a; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_quad_b; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_raw_irq; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_reg_count_we; // @[motor_top.scala 88:37:@12632.4]
  wire [31:0] qei_io_reg_count_di; // @[motor_top.scala 88:37:@12632.4]
  wire [31:0] qei_io_reg_count_do; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_reg_cfg_we; // @[motor_top.scala 88:37:@12632.4]
  wire [31:0] qei_io_reg_cfg_di; // @[motor_top.scala 88:37:@12632.4]
  wire [31:0] qei_io_reg_cfg_do; // @[motor_top.scala 88:37:@12632.4]
  wire [15:0] qei_io_reg_speed_do; // @[motor_top.scala 88:37:@12632.4]
  wire  qei_io_fb_period; // @[motor_top.scala 88:37:@12632.4]
  wire  pid_clock; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_reset; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_fb_period; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_raw_irq; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_kp_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_kp_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_kp_do; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_ki_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_ki_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_ki_do; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_kd_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_kd_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_kd_do; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_ref_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_ref_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_ref_do; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_fb_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_fb_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_fb_do; // @[motor_top.scala 104:37:@12645.4]
  wire  pid_io_reg_cfg_we; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_cfg_di; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_reg_cfg_do; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_speed_fb_in; // @[motor_top.scala 104:37:@12645.4]
  wire [15:0] pid_io_pid_out; // @[motor_top.scala 104:37:@12645.4]
  wire [7:0] _T_52; // @[motor_top.scala 109:41:@12651.4]
  wire [7:0] _T_53; // @[motor_top.scala 109:53:@12652.4]
  wire [15:0] _T_58; // @[motor_top.scala 121:41:@12666.4]
  Interlink_Module interlink ( // @[motor_top.scala 42:26:@12599.4]
    .clock(interlink_clock),
    .reset(interlink_reset),
    .io_bus_adr_i(interlink_io_bus_adr_i),
    .io_bus_sel_i(interlink_io_bus_sel_i),
    .io_bus_we_i(interlink_io_bus_we_i),
    .io_bus_cyc_i(interlink_io_bus_cyc_i),
    .io_bus_stb_i(interlink_io_bus_stb_i),
    .io_bus_ack_o(interlink_io_bus_ack_o),
    .io_bus_dat_o(interlink_io_bus_dat_o),
    .io_tmr_val_we(interlink_io_tmr_val_we),
    .io_tmr_val_do(interlink_io_tmr_val_do),
    .io_tmr_dat_we(interlink_io_tmr_dat_we),
    .io_tmr_dat_do(interlink_io_tmr_dat_do),
    .io_tmr_duty_we(interlink_io_tmr_duty_we),
    .io_tmr_duty_do(interlink_io_tmr_duty_do),
    .io_tmr_cfg_we(interlink_io_tmr_cfg_we),
    .io_tmr_cfg_do(interlink_io_tmr_cfg_do),
    .io_qei_count_we(interlink_io_qei_count_we),
    .io_qei_count_do(interlink_io_qei_count_do),
    .io_qei_cfg_we(interlink_io_qei_cfg_we),
    .io_qei_cfg_do(interlink_io_qei_cfg_do),
    .io_qei_speed_do(interlink_io_qei_speed_do),
    .io_pid_kp_we(interlink_io_pid_kp_we),
    .io_pid_kp_do(interlink_io_pid_kp_do),
    .io_pid_ki_we(interlink_io_pid_ki_we),
    .io_pid_ki_do(interlink_io_pid_ki_do),
    .io_pid_kd_we(interlink_io_pid_kd_we),
    .io_pid_kd_do(interlink_io_pid_kd_do),
    .io_pid_ref_we(interlink_io_pid_ref_we),
    .io_pid_ref_do(interlink_io_pid_ref_do),
    .io_pid_fb_we(interlink_io_pid_fb_we),
    .io_pid_fb_do(interlink_io_pid_fb_do),
    .io_pid_cfg_we(interlink_io_pid_cfg_we),
    .io_pid_cfg_do(interlink_io_pid_cfg_do),
    .io_ba_match(interlink_io_ba_match)
  );
  PWM pwm ( // @[motor_top.scala 58:37:@12610.4]
    .clock(pwm_clock),
    .reset(pwm_reset),
    .io_reg_val_we(pwm_io_reg_val_we),
    .io_reg_val_di(pwm_io_reg_val_di),
    .io_reg_val_do(pwm_io_reg_val_do),
    .io_reg_cfg_we(pwm_io_reg_cfg_we),
    .io_reg_cfg_di(pwm_io_reg_cfg_di),
    .io_reg_cfg_do(pwm_io_reg_cfg_do),
    .io_reg_dat_we(pwm_io_reg_dat_we),
    .io_reg_dat_di(pwm_io_reg_dat_di),
    .io_reg_dat_do(pwm_io_reg_dat_do),
    .io_reg_duty_we(pwm_io_reg_duty_we),
    .io_reg_duty_di(pwm_io_reg_duty_di),
    .io_reg_duty_do(pwm_io_reg_duty_do),
    .io_reg_pid_out(pwm_io_reg_pid_out),
    .io_pwm_h(pwm_io_pwm_h),
    .io_pwm_l(pwm_io_pwm_l),
    .io_pwm_h_en(pwm_io_pwm_h_en),
    .io_pwm_l_en(pwm_io_pwm_l_en),
    .io_irq_out(pwm_io_irq_out),
    .io_rawirq_out(pwm_io_rawirq_out)
  );
  Quad_Encoder qei ( // @[motor_top.scala 88:37:@12632.4]
    .clock(qei_clock),
    .reset(qei_reset),
    .io_quad_a(qei_io_quad_a),
    .io_quad_b(qei_io_quad_b),
    .io_raw_irq(qei_io_raw_irq),
    .io_reg_count_we(qei_io_reg_count_we),
    .io_reg_count_di(qei_io_reg_count_di),
    .io_reg_count_do(qei_io_reg_count_do),
    .io_reg_cfg_we(qei_io_reg_cfg_we),
    .io_reg_cfg_di(qei_io_reg_cfg_di),
    .io_reg_cfg_do(qei_io_reg_cfg_do),
    .io_reg_speed_do(qei_io_reg_speed_do),
    .io_fb_period(qei_io_fb_period)
  );
  PID_Controller pid ( // @[motor_top.scala 104:37:@12645.4]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_fb_period(pid_io_fb_period),
    .io_raw_irq(pid_io_raw_irq),
    .io_reg_kp_we(pid_io_reg_kp_we),
    .io_reg_kp_di(pid_io_reg_kp_di),
    .io_reg_kp_do(pid_io_reg_kp_do),
    .io_reg_ki_we(pid_io_reg_ki_we),
    .io_reg_ki_di(pid_io_reg_ki_di),
    .io_reg_ki_do(pid_io_reg_ki_do),
    .io_reg_kd_we(pid_io_reg_kd_we),
    .io_reg_kd_di(pid_io_reg_kd_di),
    .io_reg_kd_do(pid_io_reg_kd_do),
    .io_reg_ref_we(pid_io_reg_ref_we),
    .io_reg_ref_di(pid_io_reg_ref_di),
    .io_reg_ref_do(pid_io_reg_ref_do),
    .io_reg_fb_we(pid_io_reg_fb_we),
    .io_reg_fb_di(pid_io_reg_fb_di),
    .io_reg_fb_do(pid_io_reg_fb_do),
    .io_reg_cfg_we(pid_io_reg_cfg_we),
    .io_reg_cfg_di(pid_io_reg_cfg_di),
    .io_reg_cfg_do(pid_io_reg_cfg_do),
    .io_speed_fb_in(pid_io_speed_fb_in),
    .io_pid_out(pid_io_pid_out)
  );
  assign _T_52 = io_wbs_m2s_data[7:0]; // @[motor_top.scala 109:41:@12651.4]
  assign _T_53 = $signed(_T_52); // @[motor_top.scala 109:53:@12652.4]
  assign _T_58 = io_wbs_m2s_data[15:0]; // @[motor_top.scala 121:41:@12666.4]
  assign io_wbs_ack_o = interlink_io_bus_ack_o; // @[motor_top.scala 55:29:@12609.4]
  assign io_wbs_data_o = interlink_io_bus_dat_o; // @[motor_top.scala 54:29:@12608.4]
  assign io_motor_gpio_pwm_high = pwm_io_pwm_h; // @[motor_top.scala 82:29:@12628.4]
  assign io_motor_gpio_pwm_low = pwm_io_pwm_l; // @[motor_top.scala 83:29:@12629.4]
  assign io_motor_gpio_pwm_high_en = pwm_io_pwm_h_en; // @[motor_top.scala 84:29:@12630.4]
  assign io_motor_gpio_pwm_low_en = pwm_io_pwm_l_en; // @[motor_top.scala 85:29:@12631.4]
  assign io_motor_irq = pwm_io_irq_out; // @[motor_top.scala 79:29:@12627.4]
  assign interlink_clock = clock; // @[:@12600.4]
  assign interlink_reset = reset; // @[:@12601.4]
  assign interlink_io_bus_adr_i = {{16'd0}, io_wbs_m2s_addr}; // @[motor_top.scala 51:29:@12605.4]
  assign interlink_io_bus_sel_i = io_wbs_m2s_sel; // @[motor_top.scala 52:29:@12606.4]
  assign interlink_io_bus_we_i = io_wbs_m2s_we; // @[motor_top.scala 53:29:@12607.4]
  assign interlink_io_bus_cyc_i = 1'h1; // @[motor_top.scala 50:29:@12604.4]
  assign interlink_io_bus_stb_i = io_wbs_m2s_stb; // @[motor_top.scala 49:29:@12603.4]
  assign interlink_io_tmr_val_do = pwm_io_reg_val_do; // @[motor_top.scala 62:29:@12615.4]
  assign interlink_io_tmr_dat_do = pwm_io_reg_dat_do; // @[motor_top.scala 70:29:@12621.4]
  assign interlink_io_tmr_duty_do = pwm_io_reg_duty_do; // @[motor_top.scala 73:29:@12624.4]
  assign interlink_io_tmr_cfg_do = pwm_io_reg_cfg_do; // @[motor_top.scala 66:29:@12618.4]
  assign interlink_io_qei_count_do = qei_io_reg_count_do; // @[motor_top.scala 95:29:@12640.4]
  assign interlink_io_qei_cfg_do = qei_io_reg_cfg_do; // @[motor_top.scala 99:29:@12643.4]
  assign interlink_io_qei_speed_do = qei_io_reg_speed_do; // @[motor_top.scala 101:29:@12644.4]
  assign interlink_io_pid_kp_do = pid_io_reg_kp_do; // @[motor_top.scala 110:29:@12654.4]
  assign interlink_io_pid_ki_do = pid_io_reg_ki_do; // @[motor_top.scala 114:29:@12659.4]
  assign interlink_io_pid_kd_do = pid_io_reg_kd_do; // @[motor_top.scala 118:29:@12664.4]
  assign interlink_io_pid_ref_do = pid_io_reg_ref_do; // @[motor_top.scala 122:29:@12669.4]
  assign interlink_io_pid_fb_do = pid_io_reg_fb_do; // @[motor_top.scala 126:29:@12674.4]
  assign interlink_io_pid_cfg_do = pid_io_reg_cfg_do; // @[motor_top.scala 130:29:@12679.4]
  assign interlink_io_ba_match = io_ba_match; // @[motor_top.scala 46:29:@12602.4]
  assign pwm_clock = clock; // @[:@12611.4]
  assign pwm_reset = reset; // @[:@12612.4]
  assign pwm_io_reg_val_we = interlink_io_tmr_val_we; // @[motor_top.scala 60:29:@12613.4]
  assign pwm_io_reg_val_di = io_wbs_m2s_data; // @[motor_top.scala 61:29:@12614.4]
  assign pwm_io_reg_cfg_we = interlink_io_tmr_cfg_we; // @[motor_top.scala 64:29:@12616.4]
  assign pwm_io_reg_cfg_di = io_wbs_m2s_data; // @[motor_top.scala 65:29:@12617.4]
  assign pwm_io_reg_dat_we = interlink_io_tmr_dat_we; // @[motor_top.scala 68:29:@12619.4]
  assign pwm_io_reg_dat_di = io_wbs_m2s_data; // @[motor_top.scala 69:29:@12620.4]
  assign pwm_io_reg_duty_we = interlink_io_tmr_duty_we; // @[motor_top.scala 71:29:@12622.4]
  assign pwm_io_reg_duty_di = io_wbs_m2s_data; // @[motor_top.scala 72:29:@12623.4]
  assign pwm_io_reg_pid_out = pid_io_pid_out; // @[motor_top.scala 78:29:@12626.4]
  assign qei_clock = clock; // @[:@12633.4]
  assign qei_reset = reset; // @[:@12634.4]
  assign qei_io_quad_a = io_motor_gpio_qei_ch_a; // @[motor_top.scala 89:29:@12635.4]
  assign qei_io_quad_b = io_motor_gpio_qei_ch_b; // @[motor_top.scala 90:29:@12636.4]
  assign qei_io_raw_irq = pwm_io_rawirq_out; // @[motor_top.scala 91:29:@12637.4]
  assign qei_io_reg_count_we = interlink_io_qei_count_we; // @[motor_top.scala 93:29:@12638.4]
  assign qei_io_reg_count_di = io_wbs_m2s_data; // @[motor_top.scala 94:29:@12639.4]
  assign qei_io_reg_cfg_we = interlink_io_qei_cfg_we; // @[motor_top.scala 97:29:@12641.4]
  assign qei_io_reg_cfg_di = io_wbs_m2s_data; // @[motor_top.scala 98:29:@12642.4]
  assign pid_clock = clock; // @[:@12646.4]
  assign pid_reset = reset; // @[:@12647.4]
  assign pid_io_fb_period = qei_io_fb_period; // @[motor_top.scala 105:29:@12648.4]
  assign pid_io_raw_irq = pwm_io_rawirq_out; // @[motor_top.scala 133:29:@12681.4]
  assign pid_io_reg_kp_we = interlink_io_pid_kp_we; // @[motor_top.scala 108:29:@12650.4]
  assign pid_io_reg_kp_di = {{8{_T_53[7]}},_T_53}; // @[motor_top.scala 109:29:@12653.4]
  assign pid_io_reg_ki_we = interlink_io_pid_ki_we; // @[motor_top.scala 112:29:@12655.4]
  assign pid_io_reg_ki_di = {{8{_T_53[7]}},_T_53}; // @[motor_top.scala 113:29:@12658.4]
  assign pid_io_reg_kd_we = interlink_io_pid_kd_we; // @[motor_top.scala 116:29:@12660.4]
  assign pid_io_reg_kd_di = {{8{_T_53[7]}},_T_53}; // @[motor_top.scala 117:29:@12663.4]
  assign pid_io_reg_ref_we = interlink_io_pid_ref_we; // @[motor_top.scala 120:29:@12665.4]
  assign pid_io_reg_ref_di = $signed(_T_58); // @[motor_top.scala 121:29:@12668.4]
  assign pid_io_reg_fb_we = interlink_io_pid_fb_we; // @[motor_top.scala 124:29:@12670.4]
  assign pid_io_reg_fb_di = $signed(_T_58); // @[motor_top.scala 125:29:@12673.4]
  assign pid_io_reg_cfg_we = interlink_io_pid_cfg_we; // @[motor_top.scala 128:29:@12675.4]
  assign pid_io_reg_cfg_di = $signed(_T_58); // @[motor_top.scala 129:29:@12678.4]
  assign pid_io_speed_fb_in = qei_io_reg_speed_do; // @[motor_top.scala 106:29:@12649.4]
endmodule