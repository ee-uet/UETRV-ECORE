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
module DMem( // @[:@12681.2]
  input         clock, // @[:@12682.4]
  input  [7:0]  io_addr, // @[:@12684.4]
  input  [31:0] io_wdata, // @[:@12684.4]
  output [31:0] io_rdata, // @[:@12684.4]
  input         io_cs, // @[:@12684.4]
  input         io_wr_en, // @[:@12684.4]
  input  [3:0]  io_st_type // @[:@12684.4]
);
  reg [7:0] dmem [0:1023]; // @[dmemory.scala 26:26:@12686.4]
  reg [31:0] _RAND_0;
  wire [7:0] dmem__T_65_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_65_addr; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_69_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_69_addr; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_73_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_73_addr; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_74_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_74_addr; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_38_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_38_addr; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_38_mask; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_38_en; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_45_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_45_addr; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_45_mask; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_45_en; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_52_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_52_addr; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_52_mask; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_52_en; // @[dmemory.scala 26:26:@12686.4]
  wire [7:0] dmem__T_59_data; // @[dmemory.scala 26:26:@12686.4]
  wire [9:0] dmem__T_59_addr; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_59_mask; // @[dmemory.scala 26:26:@12686.4]
  wire  dmem__T_59_en; // @[dmemory.scala 26:26:@12686.4]
  wire  mem_wr; // @[dmemory.scala 31:27:@12687.4]
  wire  _T_36; // @[dmemory.scala 40:18:@12690.6]
  wire  _GEN_3; // @[dmemory.scala 40:30:@12692.6]
  wire  _T_40; // @[dmemory.scala 43:18:@12697.6]
  wire [8:0] _T_43; // @[dmemory.scala 44:17:@12700.8]
  wire [7:0] _T_44; // @[dmemory.scala 44:17:@12701.8]
  wire  _T_47; // @[dmemory.scala 46:18:@12706.6]
  wire [8:0] _T_50; // @[dmemory.scala 47:17:@12709.8]
  wire [7:0] _T_51; // @[dmemory.scala 47:17:@12710.8]
  wire  _T_54; // @[dmemory.scala 49:18:@12715.6]
  wire [8:0] _T_57; // @[dmemory.scala 50:17:@12718.8]
  wire [7:0] _T_58; // @[dmemory.scala 50:17:@12719.8]
  wire [15:0] _T_75; // @[Cat.scala 30:58:@12736.4]
  wire [15:0] _T_76; // @[Cat.scala 30:58:@12737.4]
  wire [9:0] _GEN_41;
  reg [9:0] dmem__T_65_addr_pipe_0;
  reg [31:0] _RAND_1;
  wire [9:0] _GEN_43;
  reg [9:0] dmem__T_69_addr_pipe_0;
  reg [31:0] _RAND_2;
  wire [9:0] _GEN_45;
  reg [9:0] dmem__T_73_addr_pipe_0;
  reg [31:0] _RAND_3;
  wire [9:0] _GEN_47;
  reg [9:0] dmem__T_74_addr_pipe_0;
  reg [31:0] _RAND_4;
  assign dmem__T_65_addr = dmem__T_65_addr_pipe_0;
  assign dmem__T_65_data = dmem[dmem__T_65_addr]; // @[dmemory.scala 26:26:@12686.4]
  assign dmem__T_69_addr = dmem__T_69_addr_pipe_0;
  assign dmem__T_69_data = dmem[dmem__T_69_addr]; // @[dmemory.scala 26:26:@12686.4]
  assign dmem__T_73_addr = dmem__T_73_addr_pipe_0;
  assign dmem__T_73_data = dmem[dmem__T_73_addr]; // @[dmemory.scala 26:26:@12686.4]
  assign dmem__T_74_addr = dmem__T_74_addr_pipe_0;
  assign dmem__T_74_data = dmem[dmem__T_74_addr]; // @[dmemory.scala 26:26:@12686.4]
  assign dmem__T_38_data = io_wdata[7:0];
  assign dmem__T_38_addr = {{2'd0}, io_addr};
  assign dmem__T_38_mask = 1'h1;
  assign dmem__T_38_en = mem_wr ? _T_36 : 1'h0;
  assign dmem__T_45_data = io_wdata[15:8];
  assign dmem__T_45_addr = {{2'd0}, _T_44};
  assign dmem__T_45_mask = 1'h1;
  assign dmem__T_45_en = mem_wr ? _T_40 : 1'h0;
  assign dmem__T_52_data = io_wdata[23:16];
  assign dmem__T_52_addr = {{2'd0}, _T_51};
  assign dmem__T_52_mask = 1'h1;
  assign dmem__T_52_en = mem_wr ? _T_47 : 1'h0;
  assign dmem__T_59_data = io_wdata[31:24];
  assign dmem__T_59_addr = {{2'd0}, _T_58};
  assign dmem__T_59_mask = 1'h1;
  assign dmem__T_59_en = mem_wr ? _T_54 : 1'h0;
  assign mem_wr = io_wr_en & io_cs; // @[dmemory.scala 31:27:@12687.4]
  assign _T_36 = io_st_type[0]; // @[dmemory.scala 40:18:@12690.6]
  assign _GEN_3 = 1'h1; // @[dmemory.scala 40:30:@12692.6]
  assign _T_40 = io_st_type[1]; // @[dmemory.scala 43:18:@12697.6]
  assign _T_43 = io_addr + 8'h1; // @[dmemory.scala 44:17:@12700.8]
  assign _T_44 = io_addr + 8'h1; // @[dmemory.scala 44:17:@12701.8]
  assign _T_47 = io_st_type[2]; // @[dmemory.scala 46:18:@12706.6]
  assign _T_50 = io_addr + 8'h2; // @[dmemory.scala 47:17:@12709.8]
  assign _T_51 = io_addr + 8'h2; // @[dmemory.scala 47:17:@12710.8]
  assign _T_54 = io_st_type[3]; // @[dmemory.scala 49:18:@12715.6]
  assign _T_57 = io_addr + 8'h3; // @[dmemory.scala 50:17:@12718.8]
  assign _T_58 = io_addr + 8'h3; // @[dmemory.scala 50:17:@12719.8]
  assign _T_75 = {dmem__T_73_data,dmem__T_74_data}; // @[Cat.scala 30:58:@12736.4]
  assign _T_76 = {dmem__T_65_data,dmem__T_69_data}; // @[Cat.scala 30:58:@12737.4]
  assign io_rdata = {_T_76,_T_75}; // @[dmemory.scala 57:12:@12740.4]
  assign _GEN_41 = {{2'd0}, _T_58};
  assign _GEN_43 = {{2'd0}, _T_51};
  assign _GEN_45 = {{2'd0}, _T_44};
  assign _GEN_47 = {{2'd0}, io_addr};
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    dmem[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dmem__T_65_addr_pipe_0 = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dmem__T_69_addr_pipe_0 = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  dmem__T_73_addr_pipe_0 = _RAND_3[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dmem__T_74_addr_pipe_0 = _RAND_4[9:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(dmem__T_38_en & dmem__T_38_mask) begin
      dmem[dmem__T_38_addr] <= dmem__T_38_data; // @[dmemory.scala 26:26:@12686.4]
    end
    if(dmem__T_45_en & dmem__T_45_mask) begin
      dmem[dmem__T_45_addr] <= dmem__T_45_data; // @[dmemory.scala 26:26:@12686.4]
    end
    if(dmem__T_52_en & dmem__T_52_mask) begin
      dmem[dmem__T_52_addr] <= dmem__T_52_data; // @[dmemory.scala 26:26:@12686.4]
    end
    if(dmem__T_59_en & dmem__T_59_mask) begin
      dmem[dmem__T_59_addr] <= dmem__T_59_data; // @[dmemory.scala 26:26:@12686.4]
    end
    if (_GEN_3) begin
      dmem__T_65_addr_pipe_0 <= _GEN_41;
    end
    if (_GEN_3) begin
      dmem__T_69_addr_pipe_0 <= _GEN_43;
    end
    if (_GEN_3) begin
      dmem__T_73_addr_pipe_0 <= _GEN_45;
    end
    if (_GEN_3) begin
      dmem__T_74_addr_pipe_0 <= _GEN_47;
    end
  end
endmodule
