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
  output        io_dmem_io_cs, // @[:@1885.4]
  output        io_dmem_io_wr_en, // @[:@1885.4]
  output [3:0]  io_dmem_io_st_type // @[:@1885.4]
);
  wire [3:0] _T_53; // @[dmem_interface.scala 55:41:@1887.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 55:79:@1888.4]
  wire  dmem_select; // @[dmem_interface.scala 57:41:@1889.4]
  wire  _T_60; // @[dmem_interface.scala 58:26:@1890.4]
  wire  _T_62; // @[dmem_interface.scala 63:42:@1895.4]
  reg  ack2; // @[dmem_interface.scala 73:28:@1903.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 74:49:@1905.4]
  wire  _GEN_0; // @[dmem_interface.scala 76:21:@1906.4]
  reg  ack; // @[dmem_interface.scala 80:28:@1910.4]
  reg [31:0] _RAND_1;
  reg [3:0] wb_select; // @[dmem_interface.scala 88:24:@1917.4]
  reg [31:0] _RAND_2;
  wire  _T_77; // @[dmem_interface.scala 91:18:@1919.4]
  wire [7:0] _T_78; // @[dmem_interface.scala 92:24:@1921.6]
  wire  _T_79; // @[dmem_interface.scala 93:24:@1925.6]
  wire [7:0] _T_80; // @[dmem_interface.scala 94:24:@1927.8]
  wire  _T_81; // @[dmem_interface.scala 95:24:@1931.8]
  wire [7:0] _T_82; // @[dmem_interface.scala 96:24:@1933.10]
  wire  _T_83; // @[dmem_interface.scala 97:24:@1937.10]
  wire [7:0] _T_84; // @[dmem_interface.scala 98:24:@1939.12]
  wire  _T_85; // @[dmem_interface.scala 99:24:@1943.12]
  wire [15:0] _T_86; // @[dmem_interface.scala 100:24:@1945.14]
  wire  _T_87; // @[dmem_interface.scala 101:24:@1949.14]
  wire [15:0] _T_88; // @[dmem_interface.scala 102:24:@1951.16]
  wire [31:0] _GEN_1; // @[dmem_interface.scala 101:54:@1950.14]
  wire [31:0] _GEN_2; // @[dmem_interface.scala 99:52:@1944.12]
  wire [31:0] _GEN_3; // @[dmem_interface.scala 97:52:@1938.10]
  wire [31:0] _GEN_4; // @[dmem_interface.scala 95:52:@1932.8]
  wire [31:0] _GEN_5; // @[dmem_interface.scala 93:52:@1926.6]
  wire [31:0] rdata; // @[dmem_interface.scala 91:45:@1920.4]
  reg  rd_resp; // @[dmem_interface.scala 107:24:@1958.4]
  reg [31:0] _RAND_3;
  assign _T_53 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 55:41:@1887.4]
  assign dmem_addr_match = _T_53 == 4'h1; // @[dmem_interface.scala 55:79:@1888.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 57:41:@1889.4]
  assign _T_60 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 58:26:@1890.4]
  assign _T_62 = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 63:42:@1895.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 74:49:@1905.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 76:21:@1906.4]
  assign _T_77 = wb_select == 4'h1; // @[dmem_interface.scala 91:18:@1919.4]
  assign _T_78 = io_dmem_io_rdata[7:0]; // @[dmem_interface.scala 92:24:@1921.6]
  assign _T_79 = wb_select == 4'h2; // @[dmem_interface.scala 93:24:@1925.6]
  assign _T_80 = io_dmem_io_rdata[15:8]; // @[dmem_interface.scala 94:24:@1927.8]
  assign _T_81 = wb_select == 4'h4; // @[dmem_interface.scala 95:24:@1931.8]
  assign _T_82 = io_dmem_io_rdata[23:16]; // @[dmem_interface.scala 96:24:@1933.10]
  assign _T_83 = wb_select == 4'h8; // @[dmem_interface.scala 97:24:@1937.10]
  assign _T_84 = io_dmem_io_rdata[31:24]; // @[dmem_interface.scala 98:24:@1939.12]
  assign _T_85 = wb_select == 4'h3; // @[dmem_interface.scala 99:24:@1943.12]
  assign _T_86 = io_dmem_io_rdata[15:0]; // @[dmem_interface.scala 100:24:@1945.14]
  assign _T_87 = wb_select == 4'hc; // @[dmem_interface.scala 101:24:@1949.14]
  assign _T_88 = io_dmem_io_rdata[31:16]; // @[dmem_interface.scala 102:24:@1951.16]
  assign _GEN_1 = _T_87 ? {{16'd0}, _T_88} : io_dmem_io_rdata; // @[dmem_interface.scala 101:54:@1950.14]
  assign _GEN_2 = _T_85 ? {{16'd0}, _T_86} : _GEN_1; // @[dmem_interface.scala 99:52:@1944.12]
  assign _GEN_3 = _T_83 ? {{24'd0}, _T_84} : _GEN_2; // @[dmem_interface.scala 97:52:@1938.10]
  assign _GEN_4 = _T_81 ? {{24'd0}, _T_82} : _GEN_3; // @[dmem_interface.scala 95:52:@1932.8]
  assign _GEN_5 = _T_79 ? {{24'd0}, _T_80} : _GEN_4; // @[dmem_interface.scala 93:52:@1926.6]
  assign rdata = _T_77 ? {{24'd0}, _T_78} : _GEN_5; // @[dmem_interface.scala 91:45:@1920.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 82:18:@1914.4]
  assign io_wbs_data_o = rd_resp ? rdata : 32'h0; // @[dmem_interface.scala 109:18:@1961.4]
  assign io_dmem_io_addr = io_wbs_m2s_addr[9:2]; // @[dmem_interface.scala 61:23:@1893.4]
  assign io_dmem_io_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 62:23:@1894.4]
  assign io_dmem_io_cs = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 64:23:@1898.4]
  assign io_dmem_io_wr_en = _T_62 == 1'h0; // @[dmem_interface.scala 63:23:@1897.4]
  assign io_dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 65:23:@1899.4]
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
  wb_select = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rd_resp = _RAND_3[0:0];
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
    wb_select <= io_wbs_m2s_sel;
    rd_resp <= _T_60 & dmem_select;
  end
endmodule
module BMem( // @[:@1963.2]
  input         clock, // @[:@1964.4]
  input         reset, // @[:@1965.4]
  input  [31:0] io_bmem_addr, // @[:@1966.4]
  output [31:0] io_bmem_rdata // @[:@1966.4]
);
  wire [8:0] addr; // @[BMEM.scala 24:26:@1968.4]
  reg [31:0] bmem_data; // @[BMEM.scala 25:26:@1969.4]
  reg [31:0] _RAND_0;
  wire  _T_12; // @[Conditional.scala 37:30:@1970.4]
  wire  _T_15; // @[Conditional.scala 37:30:@1975.6]
  wire  _T_18; // @[Conditional.scala 37:30:@1980.8]
  wire  _T_21; // @[Conditional.scala 37:30:@1985.10]
  wire  _T_24; // @[Conditional.scala 37:30:@1990.12]
  wire  _T_27; // @[Conditional.scala 37:30:@1995.14]
  wire  _T_30; // @[Conditional.scala 37:30:@2000.16]
  wire  _T_33; // @[Conditional.scala 37:30:@2005.18]
  wire  _T_36; // @[Conditional.scala 37:30:@2010.20]
  wire  _T_39; // @[Conditional.scala 37:30:@2015.22]
  wire  _T_42; // @[Conditional.scala 37:30:@2020.24]
  wire  _T_45; // @[Conditional.scala 37:30:@2025.26]
  wire  _T_48; // @[Conditional.scala 37:30:@2030.28]
  wire  _T_51; // @[Conditional.scala 37:30:@2035.30]
  wire  _T_54; // @[Conditional.scala 37:30:@2040.32]
  wire  _T_57; // @[Conditional.scala 37:30:@2045.34]
  wire  _T_60; // @[Conditional.scala 37:30:@2050.36]
  wire  _T_63; // @[Conditional.scala 37:30:@2055.38]
  wire  _T_66; // @[Conditional.scala 37:30:@2060.40]
  wire  _T_69; // @[Conditional.scala 37:30:@2065.42]
  wire  _T_72; // @[Conditional.scala 37:30:@2070.44]
  wire  _T_75; // @[Conditional.scala 37:30:@2075.46]
  wire  _T_78; // @[Conditional.scala 37:30:@2080.48]
  wire  _T_81; // @[Conditional.scala 37:30:@2085.50]
  wire  _T_84; // @[Conditional.scala 37:30:@2090.52]
  wire  _T_87; // @[Conditional.scala 37:30:@2095.54]
  wire  _T_90; // @[Conditional.scala 37:30:@2100.56]
  wire  _T_93; // @[Conditional.scala 37:30:@2105.58]
  wire  _T_96; // @[Conditional.scala 37:30:@2110.60]
  wire  _T_99; // @[Conditional.scala 37:30:@2115.62]
  wire  _T_102; // @[Conditional.scala 37:30:@2120.64]
  wire  _T_105; // @[Conditional.scala 37:30:@2125.66]
  wire  _T_108; // @[Conditional.scala 37:30:@2130.68]
  wire  _T_111; // @[Conditional.scala 37:30:@2135.70]
  wire  _T_114; // @[Conditional.scala 37:30:@2140.72]
  wire  _T_117; // @[Conditional.scala 37:30:@2145.74]
  wire  _T_120; // @[Conditional.scala 37:30:@2150.76]
  wire  _T_123; // @[Conditional.scala 37:30:@2155.78]
  wire  _T_126; // @[Conditional.scala 37:30:@2160.80]
  wire  _T_129; // @[Conditional.scala 37:30:@2165.82]
  wire  _T_132; // @[Conditional.scala 37:30:@2170.84]
  wire  _T_135; // @[Conditional.scala 37:30:@2175.86]
  wire  _T_138; // @[Conditional.scala 37:30:@2180.88]
  wire  _T_141; // @[Conditional.scala 37:30:@2185.90]
  wire  _T_144; // @[Conditional.scala 37:30:@2190.92]
  wire  _T_147; // @[Conditional.scala 37:30:@2195.94]
  wire  _T_150; // @[Conditional.scala 37:30:@2200.96]
  wire  _T_153; // @[Conditional.scala 37:30:@2205.98]
  wire  _T_156; // @[Conditional.scala 37:30:@2210.100]
  wire  _T_159; // @[Conditional.scala 37:30:@2215.102]
  wire  _T_162; // @[Conditional.scala 37:30:@2220.104]
  wire  _T_165; // @[Conditional.scala 37:30:@2225.106]
  wire  _T_168; // @[Conditional.scala 37:30:@2230.108]
  wire  _T_171; // @[Conditional.scala 37:30:@2235.110]
  wire  _T_174; // @[Conditional.scala 37:30:@2240.112]
  wire  _T_177; // @[Conditional.scala 37:30:@2245.114]
  wire  _T_180; // @[Conditional.scala 37:30:@2250.116]
  wire  _T_183; // @[Conditional.scala 37:30:@2255.118]
  wire  _T_186; // @[Conditional.scala 37:30:@2260.120]
  wire  _T_189; // @[Conditional.scala 37:30:@2265.122]
  wire  _T_192; // @[Conditional.scala 37:30:@2270.124]
  wire  _T_195; // @[Conditional.scala 37:30:@2275.126]
  wire  _T_198; // @[Conditional.scala 37:30:@2280.128]
  wire  _T_201; // @[Conditional.scala 37:30:@2285.130]
  wire  _T_204; // @[Conditional.scala 37:30:@2290.132]
  wire  _T_207; // @[Conditional.scala 37:30:@2295.134]
  wire  _T_210; // @[Conditional.scala 37:30:@2300.136]
  wire  _T_213; // @[Conditional.scala 37:30:@2305.138]
  wire  _T_216; // @[Conditional.scala 37:30:@2310.140]
  wire  _T_219; // @[Conditional.scala 37:30:@2315.142]
  wire  _T_222; // @[Conditional.scala 37:30:@2320.144]
  wire  _T_225; // @[Conditional.scala 37:30:@2325.146]
  wire  _T_228; // @[Conditional.scala 37:30:@2330.148]
  wire  _T_231; // @[Conditional.scala 37:30:@2335.150]
  wire  _T_234; // @[Conditional.scala 37:30:@2340.152]
  wire  _T_237; // @[Conditional.scala 37:30:@2345.154]
  wire  _T_240; // @[Conditional.scala 37:30:@2350.156]
  wire  _T_243; // @[Conditional.scala 37:30:@2355.158]
  wire  _T_246; // @[Conditional.scala 37:30:@2360.160]
  wire  _T_249; // @[Conditional.scala 37:30:@2365.162]
  wire  _T_252; // @[Conditional.scala 37:30:@2370.164]
  wire  _T_255; // @[Conditional.scala 37:30:@2375.166]
  wire  _T_258; // @[Conditional.scala 37:30:@2380.168]
  wire  _T_261; // @[Conditional.scala 37:30:@2385.170]
  wire  _T_264; // @[Conditional.scala 37:30:@2390.172]
  wire  _T_267; // @[Conditional.scala 37:30:@2395.174]
  wire  _T_270; // @[Conditional.scala 37:30:@2400.176]
  wire  _T_273; // @[Conditional.scala 37:30:@2405.178]
  wire  _T_276; // @[Conditional.scala 37:30:@2410.180]
  wire  _T_279; // @[Conditional.scala 37:30:@2415.182]
  wire  _T_282; // @[Conditional.scala 37:30:@2420.184]
  wire  _T_285; // @[Conditional.scala 37:30:@2425.186]
  wire  _T_288; // @[Conditional.scala 37:30:@2430.188]
  wire  _T_291; // @[Conditional.scala 37:30:@2435.190]
  wire  _T_294; // @[Conditional.scala 37:30:@2440.192]
  wire  _T_297; // @[Conditional.scala 37:30:@2445.194]
  wire  _T_300; // @[Conditional.scala 37:30:@2450.196]
  wire  _T_303; // @[Conditional.scala 37:30:@2455.198]
  wire  _T_306; // @[Conditional.scala 37:30:@2460.200]
  wire  _T_309; // @[Conditional.scala 37:30:@2465.202]
  wire  _T_312; // @[Conditional.scala 37:30:@2470.204]
  wire  _T_315; // @[Conditional.scala 37:30:@2475.206]
  wire  _T_318; // @[Conditional.scala 37:30:@2480.208]
  wire  _T_321; // @[Conditional.scala 37:30:@2485.210]
  wire  _T_324; // @[Conditional.scala 37:30:@2490.212]
  wire  _T_327; // @[Conditional.scala 37:30:@2495.214]
  wire  _T_330; // @[Conditional.scala 37:30:@2500.216]
  wire  _T_333; // @[Conditional.scala 37:30:@2505.218]
  wire  _T_336; // @[Conditional.scala 37:30:@2510.220]
  wire  _T_339; // @[Conditional.scala 37:30:@2515.222]
  wire  _T_342; // @[Conditional.scala 37:30:@2520.224]
  wire  _T_345; // @[Conditional.scala 37:30:@2525.226]
  wire  _T_348; // @[Conditional.scala 37:30:@2530.228]
  wire  _T_351; // @[Conditional.scala 37:30:@2535.230]
  wire  _T_354; // @[Conditional.scala 37:30:@2540.232]
  wire  _T_357; // @[Conditional.scala 37:30:@2545.234]
  wire  _T_360; // @[Conditional.scala 37:30:@2550.236]
  wire  _T_363; // @[Conditional.scala 37:30:@2555.238]
  wire  _T_366; // @[Conditional.scala 37:30:@2560.240]
  wire  _T_369; // @[Conditional.scala 37:30:@2565.242]
  wire  _T_372; // @[Conditional.scala 37:30:@2570.244]
  wire  _T_375; // @[Conditional.scala 37:30:@2575.246]
  wire  _T_378; // @[Conditional.scala 37:30:@2580.248]
  wire  _T_381; // @[Conditional.scala 37:30:@2585.250]
  wire  _T_384; // @[Conditional.scala 37:30:@2590.252]
  wire  _T_387; // @[Conditional.scala 37:30:@2595.254]
  wire  _T_390; // @[Conditional.scala 37:30:@2600.256]
  wire  _T_393; // @[Conditional.scala 37:30:@2605.258]
  wire  _T_396; // @[Conditional.scala 37:30:@2610.260]
  wire  _T_399; // @[Conditional.scala 37:30:@2615.262]
  wire  _T_402; // @[Conditional.scala 37:30:@2620.264]
  wire  _T_405; // @[Conditional.scala 37:30:@2625.266]
  wire  _T_408; // @[Conditional.scala 37:30:@2630.268]
  wire  _T_411; // @[Conditional.scala 37:30:@2635.270]
  wire  _T_414; // @[Conditional.scala 37:30:@2640.272]
  wire  _T_417; // @[Conditional.scala 37:30:@2645.274]
  wire  _T_420; // @[Conditional.scala 37:30:@2650.276]
  wire  _T_423; // @[Conditional.scala 37:30:@2655.278]
  wire  _T_426; // @[Conditional.scala 37:30:@2660.280]
  wire  _T_429; // @[Conditional.scala 37:30:@2665.282]
  wire  _T_432; // @[Conditional.scala 37:30:@2670.284]
  wire  _T_435; // @[Conditional.scala 37:30:@2675.286]
  wire  _T_438; // @[Conditional.scala 37:30:@2680.288]
  wire  _T_441; // @[Conditional.scala 37:30:@2685.290]
  wire  _T_444; // @[Conditional.scala 37:30:@2690.292]
  wire  _T_447; // @[Conditional.scala 37:30:@2695.294]
  wire  _T_450; // @[Conditional.scala 37:30:@2700.296]
  wire  _T_453; // @[Conditional.scala 37:30:@2705.298]
  wire  _T_456; // @[Conditional.scala 37:30:@2710.300]
  wire  _T_459; // @[Conditional.scala 37:30:@2715.302]
  wire  _T_462; // @[Conditional.scala 37:30:@2720.304]
  wire  _T_465; // @[Conditional.scala 37:30:@2725.306]
  wire  _T_468; // @[Conditional.scala 37:30:@2730.308]
  wire  _T_471; // @[Conditional.scala 37:30:@2735.310]
  wire  _T_474; // @[Conditional.scala 37:30:@2740.312]
  wire  _T_477; // @[Conditional.scala 37:30:@2745.314]
  wire  _T_480; // @[Conditional.scala 37:30:@2750.316]
  wire  _T_483; // @[Conditional.scala 37:30:@2755.318]
  wire  _T_486; // @[Conditional.scala 37:30:@2760.320]
  wire  _T_489; // @[Conditional.scala 37:30:@2765.322]
  wire  _T_492; // @[Conditional.scala 37:30:@2770.324]
  wire  _T_495; // @[Conditional.scala 37:30:@2775.326]
  wire  _T_498; // @[Conditional.scala 37:30:@2780.328]
  wire  _T_501; // @[Conditional.scala 37:30:@2785.330]
  wire  _T_504; // @[Conditional.scala 37:30:@2790.332]
  wire  _T_507; // @[Conditional.scala 37:30:@2795.334]
  wire  _T_510; // @[Conditional.scala 37:30:@2800.336]
  wire  _T_513; // @[Conditional.scala 37:30:@2805.338]
  wire  _T_516; // @[Conditional.scala 37:30:@2810.340]
  wire  _T_519; // @[Conditional.scala 37:30:@2815.342]
  wire  _T_522; // @[Conditional.scala 37:30:@2820.344]
  wire  _T_525; // @[Conditional.scala 37:30:@2825.346]
  wire  _T_528; // @[Conditional.scala 37:30:@2830.348]
  wire  _T_531; // @[Conditional.scala 37:30:@2835.350]
  wire  _T_534; // @[Conditional.scala 37:30:@2840.352]
  wire  _T_537; // @[Conditional.scala 37:30:@2845.354]
  wire  _T_540; // @[Conditional.scala 37:30:@2850.356]
  wire  _T_543; // @[Conditional.scala 37:30:@2855.358]
  wire  _T_546; // @[Conditional.scala 37:30:@2860.360]
  wire  _T_549; // @[Conditional.scala 37:30:@2865.362]
  wire  _T_552; // @[Conditional.scala 37:30:@2870.364]
  wire  _T_555; // @[Conditional.scala 37:30:@2875.366]
  wire  _T_558; // @[Conditional.scala 37:30:@2880.368]
  wire  _T_561; // @[Conditional.scala 37:30:@2885.370]
  wire  _T_564; // @[Conditional.scala 37:30:@2890.372]
  wire  _T_567; // @[Conditional.scala 37:30:@2895.374]
  wire  _T_570; // @[Conditional.scala 37:30:@2900.376]
  wire  _T_573; // @[Conditional.scala 37:30:@2905.378]
  wire  _T_576; // @[Conditional.scala 37:30:@2910.380]
  wire  _T_579; // @[Conditional.scala 37:30:@2915.382]
  wire  _T_582; // @[Conditional.scala 37:30:@2920.384]
  wire  _T_585; // @[Conditional.scala 37:30:@2925.386]
  wire  _T_588; // @[Conditional.scala 37:30:@2930.388]
  wire  _T_591; // @[Conditional.scala 37:30:@2935.390]
  wire  _T_594; // @[Conditional.scala 37:30:@2940.392]
  wire  _T_597; // @[Conditional.scala 37:30:@2945.394]
  wire  _T_600; // @[Conditional.scala 37:30:@2950.396]
  wire  _T_603; // @[Conditional.scala 37:30:@2955.398]
  wire  _T_606; // @[Conditional.scala 37:30:@2960.400]
  wire  _T_609; // @[Conditional.scala 37:30:@2965.402]
  wire  _T_612; // @[Conditional.scala 37:30:@2970.404]
  wire  _T_615; // @[Conditional.scala 37:30:@2975.406]
  wire  _T_618; // @[Conditional.scala 37:30:@2980.408]
  wire  _T_621; // @[Conditional.scala 37:30:@2985.410]
  wire  _T_624; // @[Conditional.scala 37:30:@2990.412]
  wire  _T_627; // @[Conditional.scala 37:30:@2995.414]
  wire  _T_630; // @[Conditional.scala 37:30:@3000.416]
  wire  _T_633; // @[Conditional.scala 37:30:@3005.418]
  wire  _T_636; // @[Conditional.scala 37:30:@3010.420]
  wire  _T_639; // @[Conditional.scala 37:30:@3015.422]
  wire  _T_642; // @[Conditional.scala 37:30:@3020.424]
  wire  _T_645; // @[Conditional.scala 37:30:@3025.426]
  wire  _T_648; // @[Conditional.scala 37:30:@3030.428]
  wire  _T_651; // @[Conditional.scala 37:30:@3035.430]
  wire  _T_654; // @[Conditional.scala 37:30:@3040.432]
  wire  _T_657; // @[Conditional.scala 37:30:@3045.434]
  wire  _T_660; // @[Conditional.scala 37:30:@3050.436]
  wire  _T_663; // @[Conditional.scala 37:30:@3055.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3056.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3051.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3046.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@3041.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@3036.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@3031.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@3026.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@3021.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@3016.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@3011.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@3006.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@3001.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@2996.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@2991.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@2986.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@2981.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@2976.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@2971.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2966.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2961.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2956.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2951.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2946.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2941.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2936.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2931.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2926.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2921.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2916.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2911.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2906.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2901.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2896.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2891.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2886.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2881.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2876.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2871.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2866.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2861.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2856.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2851.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2846.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2841.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2836.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2831.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2826.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2821.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2816.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2811.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2806.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2801.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2796.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2791.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2786.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2781.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2776.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2771.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2766.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2761.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2756.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2751.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2746.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2741.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2736.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2731.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2726.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2721.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2716.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2711.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2706.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2701.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2696.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2691.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2686.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2681.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2676.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2671.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2666.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2661.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2656.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2651.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2646.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2641.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2636.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2631.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2626.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2621.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2616.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2611.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2606.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2601.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2596.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2591.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2586.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2581.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2576.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2571.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2566.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2561.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2556.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2551.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2546.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2541.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2536.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2531.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2526.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2521.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2516.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2511.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2506.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2501.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2496.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2491.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2486.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2481.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2476.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2471.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2466.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2461.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2456.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2451.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2446.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2441.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2436.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2431.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2426.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2421.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2416.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2411.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2406.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2401.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2396.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2391.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2386.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2381.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2376.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2371.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2366.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2361.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2356.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2351.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2346.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2341.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2336.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2331.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2326.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2321.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2316.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2311.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2306.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2301.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2296.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2291.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2286.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2281.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2276.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2271.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2266.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2261.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2256.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2251.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2246.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2241.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2236.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2231.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2226.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2221.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2216.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2211.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2206.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2201.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2196.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2191.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2186.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2181.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2176.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2171.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2166.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2161.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2156.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2151.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2146.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2141.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2136.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2131.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2126.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2121.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2116.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2111.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2106.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2101.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2096.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2091.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2086.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2081.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2076.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2071.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2066.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2061.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2056.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2051.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2046.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@2041.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@2036.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@2031.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@2026.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@2021.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@2016.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@2011.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@2006.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@2001.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@1996.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@1991.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@1986.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@1981.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@1976.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@1971.4]
  assign addr = io_bmem_addr[8:0]; // @[BMEM.scala 24:26:@1968.4]
  assign _T_12 = 9'h0 == addr; // @[Conditional.scala 37:30:@1970.4]
  assign _T_15 = 9'h1 == addr; // @[Conditional.scala 37:30:@1975.6]
  assign _T_18 = 9'h2 == addr; // @[Conditional.scala 37:30:@1980.8]
  assign _T_21 = 9'h3 == addr; // @[Conditional.scala 37:30:@1985.10]
  assign _T_24 = 9'h4 == addr; // @[Conditional.scala 37:30:@1990.12]
  assign _T_27 = 9'h5 == addr; // @[Conditional.scala 37:30:@1995.14]
  assign _T_30 = 9'h6 == addr; // @[Conditional.scala 37:30:@2000.16]
  assign _T_33 = 9'h7 == addr; // @[Conditional.scala 37:30:@2005.18]
  assign _T_36 = 9'h8 == addr; // @[Conditional.scala 37:30:@2010.20]
  assign _T_39 = 9'h9 == addr; // @[Conditional.scala 37:30:@2015.22]
  assign _T_42 = 9'ha == addr; // @[Conditional.scala 37:30:@2020.24]
  assign _T_45 = 9'hb == addr; // @[Conditional.scala 37:30:@2025.26]
  assign _T_48 = 9'hc == addr; // @[Conditional.scala 37:30:@2030.28]
  assign _T_51 = 9'hd == addr; // @[Conditional.scala 37:30:@2035.30]
  assign _T_54 = 9'he == addr; // @[Conditional.scala 37:30:@2040.32]
  assign _T_57 = 9'hf == addr; // @[Conditional.scala 37:30:@2045.34]
  assign _T_60 = 9'h10 == addr; // @[Conditional.scala 37:30:@2050.36]
  assign _T_63 = 9'h11 == addr; // @[Conditional.scala 37:30:@2055.38]
  assign _T_66 = 9'h12 == addr; // @[Conditional.scala 37:30:@2060.40]
  assign _T_69 = 9'h13 == addr; // @[Conditional.scala 37:30:@2065.42]
  assign _T_72 = 9'h14 == addr; // @[Conditional.scala 37:30:@2070.44]
  assign _T_75 = 9'h15 == addr; // @[Conditional.scala 37:30:@2075.46]
  assign _T_78 = 9'h16 == addr; // @[Conditional.scala 37:30:@2080.48]
  assign _T_81 = 9'h17 == addr; // @[Conditional.scala 37:30:@2085.50]
  assign _T_84 = 9'h18 == addr; // @[Conditional.scala 37:30:@2090.52]
  assign _T_87 = 9'h19 == addr; // @[Conditional.scala 37:30:@2095.54]
  assign _T_90 = 9'h1a == addr; // @[Conditional.scala 37:30:@2100.56]
  assign _T_93 = 9'h1b == addr; // @[Conditional.scala 37:30:@2105.58]
  assign _T_96 = 9'h1c == addr; // @[Conditional.scala 37:30:@2110.60]
  assign _T_99 = 9'h1d == addr; // @[Conditional.scala 37:30:@2115.62]
  assign _T_102 = 9'h1e == addr; // @[Conditional.scala 37:30:@2120.64]
  assign _T_105 = 9'h1f == addr; // @[Conditional.scala 37:30:@2125.66]
  assign _T_108 = 9'h20 == addr; // @[Conditional.scala 37:30:@2130.68]
  assign _T_111 = 9'h21 == addr; // @[Conditional.scala 37:30:@2135.70]
  assign _T_114 = 9'h22 == addr; // @[Conditional.scala 37:30:@2140.72]
  assign _T_117 = 9'h23 == addr; // @[Conditional.scala 37:30:@2145.74]
  assign _T_120 = 9'h24 == addr; // @[Conditional.scala 37:30:@2150.76]
  assign _T_123 = 9'h25 == addr; // @[Conditional.scala 37:30:@2155.78]
  assign _T_126 = 9'h26 == addr; // @[Conditional.scala 37:30:@2160.80]
  assign _T_129 = 9'h27 == addr; // @[Conditional.scala 37:30:@2165.82]
  assign _T_132 = 9'h28 == addr; // @[Conditional.scala 37:30:@2170.84]
  assign _T_135 = 9'h29 == addr; // @[Conditional.scala 37:30:@2175.86]
  assign _T_138 = 9'h2a == addr; // @[Conditional.scala 37:30:@2180.88]
  assign _T_141 = 9'h2b == addr; // @[Conditional.scala 37:30:@2185.90]
  assign _T_144 = 9'h2c == addr; // @[Conditional.scala 37:30:@2190.92]
  assign _T_147 = 9'h2d == addr; // @[Conditional.scala 37:30:@2195.94]
  assign _T_150 = 9'h2e == addr; // @[Conditional.scala 37:30:@2200.96]
  assign _T_153 = 9'h2f == addr; // @[Conditional.scala 37:30:@2205.98]
  assign _T_156 = 9'h30 == addr; // @[Conditional.scala 37:30:@2210.100]
  assign _T_159 = 9'h31 == addr; // @[Conditional.scala 37:30:@2215.102]
  assign _T_162 = 9'h32 == addr; // @[Conditional.scala 37:30:@2220.104]
  assign _T_165 = 9'h33 == addr; // @[Conditional.scala 37:30:@2225.106]
  assign _T_168 = 9'h34 == addr; // @[Conditional.scala 37:30:@2230.108]
  assign _T_171 = 9'h35 == addr; // @[Conditional.scala 37:30:@2235.110]
  assign _T_174 = 9'h36 == addr; // @[Conditional.scala 37:30:@2240.112]
  assign _T_177 = 9'h37 == addr; // @[Conditional.scala 37:30:@2245.114]
  assign _T_180 = 9'h38 == addr; // @[Conditional.scala 37:30:@2250.116]
  assign _T_183 = 9'h39 == addr; // @[Conditional.scala 37:30:@2255.118]
  assign _T_186 = 9'h3a == addr; // @[Conditional.scala 37:30:@2260.120]
  assign _T_189 = 9'h3b == addr; // @[Conditional.scala 37:30:@2265.122]
  assign _T_192 = 9'h3c == addr; // @[Conditional.scala 37:30:@2270.124]
  assign _T_195 = 9'h3d == addr; // @[Conditional.scala 37:30:@2275.126]
  assign _T_198 = 9'h3e == addr; // @[Conditional.scala 37:30:@2280.128]
  assign _T_201 = 9'h3f == addr; // @[Conditional.scala 37:30:@2285.130]
  assign _T_204 = 9'h40 == addr; // @[Conditional.scala 37:30:@2290.132]
  assign _T_207 = 9'h41 == addr; // @[Conditional.scala 37:30:@2295.134]
  assign _T_210 = 9'h42 == addr; // @[Conditional.scala 37:30:@2300.136]
  assign _T_213 = 9'h43 == addr; // @[Conditional.scala 37:30:@2305.138]
  assign _T_216 = 9'h44 == addr; // @[Conditional.scala 37:30:@2310.140]
  assign _T_219 = 9'h45 == addr; // @[Conditional.scala 37:30:@2315.142]
  assign _T_222 = 9'h46 == addr; // @[Conditional.scala 37:30:@2320.144]
  assign _T_225 = 9'h47 == addr; // @[Conditional.scala 37:30:@2325.146]
  assign _T_228 = 9'h48 == addr; // @[Conditional.scala 37:30:@2330.148]
  assign _T_231 = 9'h49 == addr; // @[Conditional.scala 37:30:@2335.150]
  assign _T_234 = 9'h4a == addr; // @[Conditional.scala 37:30:@2340.152]
  assign _T_237 = 9'h4b == addr; // @[Conditional.scala 37:30:@2345.154]
  assign _T_240 = 9'h4c == addr; // @[Conditional.scala 37:30:@2350.156]
  assign _T_243 = 9'h4d == addr; // @[Conditional.scala 37:30:@2355.158]
  assign _T_246 = 9'h4e == addr; // @[Conditional.scala 37:30:@2360.160]
  assign _T_249 = 9'h4f == addr; // @[Conditional.scala 37:30:@2365.162]
  assign _T_252 = 9'h50 == addr; // @[Conditional.scala 37:30:@2370.164]
  assign _T_255 = 9'h51 == addr; // @[Conditional.scala 37:30:@2375.166]
  assign _T_258 = 9'h52 == addr; // @[Conditional.scala 37:30:@2380.168]
  assign _T_261 = 9'h53 == addr; // @[Conditional.scala 37:30:@2385.170]
  assign _T_264 = 9'h54 == addr; // @[Conditional.scala 37:30:@2390.172]
  assign _T_267 = 9'h55 == addr; // @[Conditional.scala 37:30:@2395.174]
  assign _T_270 = 9'h56 == addr; // @[Conditional.scala 37:30:@2400.176]
  assign _T_273 = 9'h57 == addr; // @[Conditional.scala 37:30:@2405.178]
  assign _T_276 = 9'h58 == addr; // @[Conditional.scala 37:30:@2410.180]
  assign _T_279 = 9'h59 == addr; // @[Conditional.scala 37:30:@2415.182]
  assign _T_282 = 9'h5a == addr; // @[Conditional.scala 37:30:@2420.184]
  assign _T_285 = 9'h5b == addr; // @[Conditional.scala 37:30:@2425.186]
  assign _T_288 = 9'h5c == addr; // @[Conditional.scala 37:30:@2430.188]
  assign _T_291 = 9'h5d == addr; // @[Conditional.scala 37:30:@2435.190]
  assign _T_294 = 9'h5e == addr; // @[Conditional.scala 37:30:@2440.192]
  assign _T_297 = 9'h5f == addr; // @[Conditional.scala 37:30:@2445.194]
  assign _T_300 = 9'h60 == addr; // @[Conditional.scala 37:30:@2450.196]
  assign _T_303 = 9'h61 == addr; // @[Conditional.scala 37:30:@2455.198]
  assign _T_306 = 9'h62 == addr; // @[Conditional.scala 37:30:@2460.200]
  assign _T_309 = 9'h63 == addr; // @[Conditional.scala 37:30:@2465.202]
  assign _T_312 = 9'h64 == addr; // @[Conditional.scala 37:30:@2470.204]
  assign _T_315 = 9'h65 == addr; // @[Conditional.scala 37:30:@2475.206]
  assign _T_318 = 9'h66 == addr; // @[Conditional.scala 37:30:@2480.208]
  assign _T_321 = 9'h67 == addr; // @[Conditional.scala 37:30:@2485.210]
  assign _T_324 = 9'h68 == addr; // @[Conditional.scala 37:30:@2490.212]
  assign _T_327 = 9'h69 == addr; // @[Conditional.scala 37:30:@2495.214]
  assign _T_330 = 9'h6a == addr; // @[Conditional.scala 37:30:@2500.216]
  assign _T_333 = 9'h6b == addr; // @[Conditional.scala 37:30:@2505.218]
  assign _T_336 = 9'h6c == addr; // @[Conditional.scala 37:30:@2510.220]
  assign _T_339 = 9'h6d == addr; // @[Conditional.scala 37:30:@2515.222]
  assign _T_342 = 9'h6e == addr; // @[Conditional.scala 37:30:@2520.224]
  assign _T_345 = 9'h6f == addr; // @[Conditional.scala 37:30:@2525.226]
  assign _T_348 = 9'h70 == addr; // @[Conditional.scala 37:30:@2530.228]
  assign _T_351 = 9'h71 == addr; // @[Conditional.scala 37:30:@2535.230]
  assign _T_354 = 9'h72 == addr; // @[Conditional.scala 37:30:@2540.232]
  assign _T_357 = 9'h73 == addr; // @[Conditional.scala 37:30:@2545.234]
  assign _T_360 = 9'h74 == addr; // @[Conditional.scala 37:30:@2550.236]
  assign _T_363 = 9'h75 == addr; // @[Conditional.scala 37:30:@2555.238]
  assign _T_366 = 9'h76 == addr; // @[Conditional.scala 37:30:@2560.240]
  assign _T_369 = 9'h77 == addr; // @[Conditional.scala 37:30:@2565.242]
  assign _T_372 = 9'h78 == addr; // @[Conditional.scala 37:30:@2570.244]
  assign _T_375 = 9'h79 == addr; // @[Conditional.scala 37:30:@2575.246]
  assign _T_378 = 9'h7a == addr; // @[Conditional.scala 37:30:@2580.248]
  assign _T_381 = 9'h7b == addr; // @[Conditional.scala 37:30:@2585.250]
  assign _T_384 = 9'h7c == addr; // @[Conditional.scala 37:30:@2590.252]
  assign _T_387 = 9'h7d == addr; // @[Conditional.scala 37:30:@2595.254]
  assign _T_390 = 9'h7e == addr; // @[Conditional.scala 37:30:@2600.256]
  assign _T_393 = 9'h7f == addr; // @[Conditional.scala 37:30:@2605.258]
  assign _T_396 = 9'h80 == addr; // @[Conditional.scala 37:30:@2610.260]
  assign _T_399 = 9'h81 == addr; // @[Conditional.scala 37:30:@2615.262]
  assign _T_402 = 9'h82 == addr; // @[Conditional.scala 37:30:@2620.264]
  assign _T_405 = 9'h83 == addr; // @[Conditional.scala 37:30:@2625.266]
  assign _T_408 = 9'h84 == addr; // @[Conditional.scala 37:30:@2630.268]
  assign _T_411 = 9'h85 == addr; // @[Conditional.scala 37:30:@2635.270]
  assign _T_414 = 9'h86 == addr; // @[Conditional.scala 37:30:@2640.272]
  assign _T_417 = 9'h87 == addr; // @[Conditional.scala 37:30:@2645.274]
  assign _T_420 = 9'h88 == addr; // @[Conditional.scala 37:30:@2650.276]
  assign _T_423 = 9'h89 == addr; // @[Conditional.scala 37:30:@2655.278]
  assign _T_426 = 9'h8a == addr; // @[Conditional.scala 37:30:@2660.280]
  assign _T_429 = 9'h8b == addr; // @[Conditional.scala 37:30:@2665.282]
  assign _T_432 = 9'h8c == addr; // @[Conditional.scala 37:30:@2670.284]
  assign _T_435 = 9'h8d == addr; // @[Conditional.scala 37:30:@2675.286]
  assign _T_438 = 9'h8e == addr; // @[Conditional.scala 37:30:@2680.288]
  assign _T_441 = 9'h8f == addr; // @[Conditional.scala 37:30:@2685.290]
  assign _T_444 = 9'h90 == addr; // @[Conditional.scala 37:30:@2690.292]
  assign _T_447 = 9'h91 == addr; // @[Conditional.scala 37:30:@2695.294]
  assign _T_450 = 9'h92 == addr; // @[Conditional.scala 37:30:@2700.296]
  assign _T_453 = 9'h93 == addr; // @[Conditional.scala 37:30:@2705.298]
  assign _T_456 = 9'h94 == addr; // @[Conditional.scala 37:30:@2710.300]
  assign _T_459 = 9'h95 == addr; // @[Conditional.scala 37:30:@2715.302]
  assign _T_462 = 9'h96 == addr; // @[Conditional.scala 37:30:@2720.304]
  assign _T_465 = 9'h97 == addr; // @[Conditional.scala 37:30:@2725.306]
  assign _T_468 = 9'h98 == addr; // @[Conditional.scala 37:30:@2730.308]
  assign _T_471 = 9'h99 == addr; // @[Conditional.scala 37:30:@2735.310]
  assign _T_474 = 9'h9a == addr; // @[Conditional.scala 37:30:@2740.312]
  assign _T_477 = 9'h9b == addr; // @[Conditional.scala 37:30:@2745.314]
  assign _T_480 = 9'h9c == addr; // @[Conditional.scala 37:30:@2750.316]
  assign _T_483 = 9'h9d == addr; // @[Conditional.scala 37:30:@2755.318]
  assign _T_486 = 9'h9e == addr; // @[Conditional.scala 37:30:@2760.320]
  assign _T_489 = 9'h9f == addr; // @[Conditional.scala 37:30:@2765.322]
  assign _T_492 = 9'ha0 == addr; // @[Conditional.scala 37:30:@2770.324]
  assign _T_495 = 9'ha1 == addr; // @[Conditional.scala 37:30:@2775.326]
  assign _T_498 = 9'ha2 == addr; // @[Conditional.scala 37:30:@2780.328]
  assign _T_501 = 9'ha3 == addr; // @[Conditional.scala 37:30:@2785.330]
  assign _T_504 = 9'ha4 == addr; // @[Conditional.scala 37:30:@2790.332]
  assign _T_507 = 9'ha5 == addr; // @[Conditional.scala 37:30:@2795.334]
  assign _T_510 = 9'ha6 == addr; // @[Conditional.scala 37:30:@2800.336]
  assign _T_513 = 9'ha7 == addr; // @[Conditional.scala 37:30:@2805.338]
  assign _T_516 = 9'ha8 == addr; // @[Conditional.scala 37:30:@2810.340]
  assign _T_519 = 9'ha9 == addr; // @[Conditional.scala 37:30:@2815.342]
  assign _T_522 = 9'haa == addr; // @[Conditional.scala 37:30:@2820.344]
  assign _T_525 = 9'hab == addr; // @[Conditional.scala 37:30:@2825.346]
  assign _T_528 = 9'hac == addr; // @[Conditional.scala 37:30:@2830.348]
  assign _T_531 = 9'had == addr; // @[Conditional.scala 37:30:@2835.350]
  assign _T_534 = 9'hae == addr; // @[Conditional.scala 37:30:@2840.352]
  assign _T_537 = 9'haf == addr; // @[Conditional.scala 37:30:@2845.354]
  assign _T_540 = 9'hb0 == addr; // @[Conditional.scala 37:30:@2850.356]
  assign _T_543 = 9'hb1 == addr; // @[Conditional.scala 37:30:@2855.358]
  assign _T_546 = 9'hb2 == addr; // @[Conditional.scala 37:30:@2860.360]
  assign _T_549 = 9'hb3 == addr; // @[Conditional.scala 37:30:@2865.362]
  assign _T_552 = 9'hb4 == addr; // @[Conditional.scala 37:30:@2870.364]
  assign _T_555 = 9'hb5 == addr; // @[Conditional.scala 37:30:@2875.366]
  assign _T_558 = 9'hb6 == addr; // @[Conditional.scala 37:30:@2880.368]
  assign _T_561 = 9'hb7 == addr; // @[Conditional.scala 37:30:@2885.370]
  assign _T_564 = 9'hb8 == addr; // @[Conditional.scala 37:30:@2890.372]
  assign _T_567 = 9'hb9 == addr; // @[Conditional.scala 37:30:@2895.374]
  assign _T_570 = 9'hba == addr; // @[Conditional.scala 37:30:@2900.376]
  assign _T_573 = 9'hbb == addr; // @[Conditional.scala 37:30:@2905.378]
  assign _T_576 = 9'hbc == addr; // @[Conditional.scala 37:30:@2910.380]
  assign _T_579 = 9'hbd == addr; // @[Conditional.scala 37:30:@2915.382]
  assign _T_582 = 9'hbe == addr; // @[Conditional.scala 37:30:@2920.384]
  assign _T_585 = 9'hbf == addr; // @[Conditional.scala 37:30:@2925.386]
  assign _T_588 = 9'hc0 == addr; // @[Conditional.scala 37:30:@2930.388]
  assign _T_591 = 9'hc1 == addr; // @[Conditional.scala 37:30:@2935.390]
  assign _T_594 = 9'hc2 == addr; // @[Conditional.scala 37:30:@2940.392]
  assign _T_597 = 9'hc3 == addr; // @[Conditional.scala 37:30:@2945.394]
  assign _T_600 = 9'hc4 == addr; // @[Conditional.scala 37:30:@2950.396]
  assign _T_603 = 9'hc5 == addr; // @[Conditional.scala 37:30:@2955.398]
  assign _T_606 = 9'hc6 == addr; // @[Conditional.scala 37:30:@2960.400]
  assign _T_609 = 9'hc7 == addr; // @[Conditional.scala 37:30:@2965.402]
  assign _T_612 = 9'hc8 == addr; // @[Conditional.scala 37:30:@2970.404]
  assign _T_615 = 9'hc9 == addr; // @[Conditional.scala 37:30:@2975.406]
  assign _T_618 = 9'hca == addr; // @[Conditional.scala 37:30:@2980.408]
  assign _T_621 = 9'hcb == addr; // @[Conditional.scala 37:30:@2985.410]
  assign _T_624 = 9'hcc == addr; // @[Conditional.scala 37:30:@2990.412]
  assign _T_627 = 9'hcd == addr; // @[Conditional.scala 37:30:@2995.414]
  assign _T_630 = 9'hce == addr; // @[Conditional.scala 37:30:@3000.416]
  assign _T_633 = 9'hcf == addr; // @[Conditional.scala 37:30:@3005.418]
  assign _T_636 = 9'hd0 == addr; // @[Conditional.scala 37:30:@3010.420]
  assign _T_639 = 9'hd1 == addr; // @[Conditional.scala 37:30:@3015.422]
  assign _T_642 = 9'hd2 == addr; // @[Conditional.scala 37:30:@3020.424]
  assign _T_645 = 9'hd3 == addr; // @[Conditional.scala 37:30:@3025.426]
  assign _T_648 = 9'hd4 == addr; // @[Conditional.scala 37:30:@3030.428]
  assign _T_651 = 9'hd5 == addr; // @[Conditional.scala 37:30:@3035.430]
  assign _T_654 = 9'hd6 == addr; // @[Conditional.scala 37:30:@3040.432]
  assign _T_657 = 9'hd7 == addr; // @[Conditional.scala 37:30:@3045.434]
  assign _T_660 = 9'hd8 == addr; // @[Conditional.scala 37:30:@3050.436]
  assign _T_663 = 9'hd9 == addr; // @[Conditional.scala 37:30:@3055.438]
  assign _GEN_0 = _T_663 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3056.438]
  assign _GEN_1 = _T_660 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3051.436]
  assign _GEN_2 = _T_657 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3046.434]
  assign _GEN_3 = _T_654 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@3041.432]
  assign _GEN_4 = _T_651 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@3036.430]
  assign _GEN_5 = _T_648 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@3031.428]
  assign _GEN_6 = _T_645 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@3026.426]
  assign _GEN_7 = _T_642 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@3021.424]
  assign _GEN_8 = _T_639 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@3016.422]
  assign _GEN_9 = _T_636 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@3011.420]
  assign _GEN_10 = _T_633 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@3006.418]
  assign _GEN_11 = _T_630 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@3001.416]
  assign _GEN_12 = _T_627 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@2996.414]
  assign _GEN_13 = _T_624 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@2991.412]
  assign _GEN_14 = _T_621 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@2986.410]
  assign _GEN_15 = _T_618 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@2981.408]
  assign _GEN_16 = _T_615 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@2976.406]
  assign _GEN_17 = _T_612 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@2971.404]
  assign _GEN_18 = _T_609 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2966.402]
  assign _GEN_19 = _T_606 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2961.400]
  assign _GEN_20 = _T_603 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2956.398]
  assign _GEN_21 = _T_600 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2951.396]
  assign _GEN_22 = _T_597 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2946.394]
  assign _GEN_23 = _T_594 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2941.392]
  assign _GEN_24 = _T_591 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2936.390]
  assign _GEN_25 = _T_588 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2931.388]
  assign _GEN_26 = _T_585 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2926.386]
  assign _GEN_27 = _T_582 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2921.384]
  assign _GEN_28 = _T_579 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2916.382]
  assign _GEN_29 = _T_576 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2911.380]
  assign _GEN_30 = _T_573 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2906.378]
  assign _GEN_31 = _T_570 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2901.376]
  assign _GEN_32 = _T_567 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2896.374]
  assign _GEN_33 = _T_564 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2891.372]
  assign _GEN_34 = _T_561 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2886.370]
  assign _GEN_35 = _T_558 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2881.368]
  assign _GEN_36 = _T_555 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2876.366]
  assign _GEN_37 = _T_552 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2871.364]
  assign _GEN_38 = _T_549 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2866.362]
  assign _GEN_39 = _T_546 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2861.360]
  assign _GEN_40 = _T_543 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2856.358]
  assign _GEN_41 = _T_540 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2851.356]
  assign _GEN_42 = _T_537 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2846.354]
  assign _GEN_43 = _T_534 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2841.352]
  assign _GEN_44 = _T_531 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2836.350]
  assign _GEN_45 = _T_528 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2831.348]
  assign _GEN_46 = _T_525 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2826.346]
  assign _GEN_47 = _T_522 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2821.344]
  assign _GEN_48 = _T_519 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2816.342]
  assign _GEN_49 = _T_516 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2811.340]
  assign _GEN_50 = _T_513 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2806.338]
  assign _GEN_51 = _T_510 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2801.336]
  assign _GEN_52 = _T_507 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2796.334]
  assign _GEN_53 = _T_504 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2791.332]
  assign _GEN_54 = _T_501 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2786.330]
  assign _GEN_55 = _T_498 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2781.328]
  assign _GEN_56 = _T_495 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2776.326]
  assign _GEN_57 = _T_492 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2771.324]
  assign _GEN_58 = _T_489 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2766.322]
  assign _GEN_59 = _T_486 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2761.320]
  assign _GEN_60 = _T_483 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2756.318]
  assign _GEN_61 = _T_480 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2751.316]
  assign _GEN_62 = _T_477 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2746.314]
  assign _GEN_63 = _T_474 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2741.312]
  assign _GEN_64 = _T_471 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2736.310]
  assign _GEN_65 = _T_468 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2731.308]
  assign _GEN_66 = _T_465 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2726.306]
  assign _GEN_67 = _T_462 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2721.304]
  assign _GEN_68 = _T_459 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2716.302]
  assign _GEN_69 = _T_456 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2711.300]
  assign _GEN_70 = _T_453 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2706.298]
  assign _GEN_71 = _T_450 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2701.296]
  assign _GEN_72 = _T_447 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2696.294]
  assign _GEN_73 = _T_444 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2691.292]
  assign _GEN_74 = _T_441 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2686.290]
  assign _GEN_75 = _T_438 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2681.288]
  assign _GEN_76 = _T_435 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2676.286]
  assign _GEN_77 = _T_432 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2671.284]
  assign _GEN_78 = _T_429 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2666.282]
  assign _GEN_79 = _T_426 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2661.280]
  assign _GEN_80 = _T_423 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2656.278]
  assign _GEN_81 = _T_420 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2651.276]
  assign _GEN_82 = _T_417 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2646.274]
  assign _GEN_83 = _T_414 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2641.272]
  assign _GEN_84 = _T_411 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2636.270]
  assign _GEN_85 = _T_408 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2631.268]
  assign _GEN_86 = _T_405 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2626.266]
  assign _GEN_87 = _T_402 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2621.264]
  assign _GEN_88 = _T_399 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2616.262]
  assign _GEN_89 = _T_396 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2611.260]
  assign _GEN_90 = _T_393 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2606.258]
  assign _GEN_91 = _T_390 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2601.256]
  assign _GEN_92 = _T_387 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2596.254]
  assign _GEN_93 = _T_384 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2591.252]
  assign _GEN_94 = _T_381 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2586.250]
  assign _GEN_95 = _T_378 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2581.248]
  assign _GEN_96 = _T_375 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2576.246]
  assign _GEN_97 = _T_372 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2571.244]
  assign _GEN_98 = _T_369 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2566.242]
  assign _GEN_99 = _T_366 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2561.240]
  assign _GEN_100 = _T_363 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2556.238]
  assign _GEN_101 = _T_360 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2551.236]
  assign _GEN_102 = _T_357 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2546.234]
  assign _GEN_103 = _T_354 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2541.232]
  assign _GEN_104 = _T_351 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2536.230]
  assign _GEN_105 = _T_348 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2531.228]
  assign _GEN_106 = _T_345 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2526.226]
  assign _GEN_107 = _T_342 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2521.224]
  assign _GEN_108 = _T_339 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2516.222]
  assign _GEN_109 = _T_336 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2511.220]
  assign _GEN_110 = _T_333 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2506.218]
  assign _GEN_111 = _T_330 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2501.216]
  assign _GEN_112 = _T_327 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2496.214]
  assign _GEN_113 = _T_324 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2491.212]
  assign _GEN_114 = _T_321 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2486.210]
  assign _GEN_115 = _T_318 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2481.208]
  assign _GEN_116 = _T_315 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2476.206]
  assign _GEN_117 = _T_312 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2471.204]
  assign _GEN_118 = _T_309 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2466.202]
  assign _GEN_119 = _T_306 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2461.200]
  assign _GEN_120 = _T_303 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2456.198]
  assign _GEN_121 = _T_300 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2451.196]
  assign _GEN_122 = _T_297 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2446.194]
  assign _GEN_123 = _T_294 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2441.192]
  assign _GEN_124 = _T_291 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2436.190]
  assign _GEN_125 = _T_288 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2431.188]
  assign _GEN_126 = _T_285 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2426.186]
  assign _GEN_127 = _T_282 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2421.184]
  assign _GEN_128 = _T_279 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2416.182]
  assign _GEN_129 = _T_276 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2411.180]
  assign _GEN_130 = _T_273 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2406.178]
  assign _GEN_131 = _T_270 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2401.176]
  assign _GEN_132 = _T_267 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2396.174]
  assign _GEN_133 = _T_264 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2391.172]
  assign _GEN_134 = _T_261 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2386.170]
  assign _GEN_135 = _T_258 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2381.168]
  assign _GEN_136 = _T_255 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2376.166]
  assign _GEN_137 = _T_252 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2371.164]
  assign _GEN_138 = _T_249 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2366.162]
  assign _GEN_139 = _T_246 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2361.160]
  assign _GEN_140 = _T_243 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2356.158]
  assign _GEN_141 = _T_240 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2351.156]
  assign _GEN_142 = _T_237 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2346.154]
  assign _GEN_143 = _T_234 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2341.152]
  assign _GEN_144 = _T_231 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2336.150]
  assign _GEN_145 = _T_228 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2331.148]
  assign _GEN_146 = _T_225 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2326.146]
  assign _GEN_147 = _T_222 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2321.144]
  assign _GEN_148 = _T_219 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2316.142]
  assign _GEN_149 = _T_216 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2311.140]
  assign _GEN_150 = _T_213 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2306.138]
  assign _GEN_151 = _T_210 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2301.136]
  assign _GEN_152 = _T_207 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2296.134]
  assign _GEN_153 = _T_204 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2291.132]
  assign _GEN_154 = _T_201 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2286.130]
  assign _GEN_155 = _T_198 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2281.128]
  assign _GEN_156 = _T_195 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2276.126]
  assign _GEN_157 = _T_192 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2271.124]
  assign _GEN_158 = _T_189 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2266.122]
  assign _GEN_159 = _T_186 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2261.120]
  assign _GEN_160 = _T_183 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2256.118]
  assign _GEN_161 = _T_180 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2251.116]
  assign _GEN_162 = _T_177 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2246.114]
  assign _GEN_163 = _T_174 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2241.112]
  assign _GEN_164 = _T_171 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2236.110]
  assign _GEN_165 = _T_168 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2231.108]
  assign _GEN_166 = _T_165 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2226.106]
  assign _GEN_167 = _T_162 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2221.104]
  assign _GEN_168 = _T_159 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2216.102]
  assign _GEN_169 = _T_156 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2211.100]
  assign _GEN_170 = _T_153 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2206.98]
  assign _GEN_171 = _T_150 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2201.96]
  assign _GEN_172 = _T_147 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2196.94]
  assign _GEN_173 = _T_144 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2191.92]
  assign _GEN_174 = _T_141 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2186.90]
  assign _GEN_175 = _T_138 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2181.88]
  assign _GEN_176 = _T_135 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2176.86]
  assign _GEN_177 = _T_132 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2171.84]
  assign _GEN_178 = _T_129 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2166.82]
  assign _GEN_179 = _T_126 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2161.80]
  assign _GEN_180 = _T_123 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2156.78]
  assign _GEN_181 = _T_120 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2151.76]
  assign _GEN_182 = _T_117 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2146.74]
  assign _GEN_183 = _T_114 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2141.72]
  assign _GEN_184 = _T_111 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2136.70]
  assign _GEN_185 = _T_108 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2131.68]
  assign _GEN_186 = _T_105 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2126.66]
  assign _GEN_187 = _T_102 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2121.64]
  assign _GEN_188 = _T_99 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2116.62]
  assign _GEN_189 = _T_96 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2111.60]
  assign _GEN_190 = _T_93 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2106.58]
  assign _GEN_191 = _T_90 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2101.56]
  assign _GEN_192 = _T_87 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2096.54]
  assign _GEN_193 = _T_84 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2091.52]
  assign _GEN_194 = _T_81 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2086.50]
  assign _GEN_195 = _T_78 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2081.48]
  assign _GEN_196 = _T_75 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2076.46]
  assign _GEN_197 = _T_72 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2071.44]
  assign _GEN_198 = _T_69 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2066.42]
  assign _GEN_199 = _T_66 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2061.40]
  assign _GEN_200 = _T_63 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2056.38]
  assign _GEN_201 = _T_60 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2051.36]
  assign _GEN_202 = _T_57 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2046.34]
  assign _GEN_203 = _T_54 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@2041.32]
  assign _GEN_204 = _T_51 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@2036.30]
  assign _GEN_205 = _T_48 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@2031.28]
  assign _GEN_206 = _T_45 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@2026.26]
  assign _GEN_207 = _T_42 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@2021.24]
  assign _GEN_208 = _T_39 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@2016.22]
  assign _GEN_209 = _T_36 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@2011.20]
  assign _GEN_210 = _T_33 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@2006.18]
  assign _GEN_211 = _T_30 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@2001.16]
  assign _GEN_212 = _T_27 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@1996.14]
  assign _GEN_213 = _T_24 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@1991.12]
  assign _GEN_214 = _T_21 ? 32'hf810113 : _GEN_213; // @[Conditional.scala 39:67:@1986.10]
  assign _GEN_215 = _T_18 ? 32'hffffa117 : _GEN_214; // @[Conditional.scala 39:67:@1981.8]
  assign _GEN_216 = _T_15 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@1976.6]
  assign _GEN_217 = _T_12 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@1971.4]
  assign io_bmem_rdata = bmem_data; // @[BMEM.scala 248:17:@3059.4]
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
      if (_T_12) begin
        bmem_data <= 32'h13;
      end else begin
        if (_T_15) begin
          bmem_data <= 32'h40006f;
        end else begin
          if (_T_18) begin
            bmem_data <= 32'hffffa117;
          end else begin
            if (_T_21) begin
              bmem_data <= 32'hf810113;
            end else begin
              if (_T_24) begin
                bmem_data <= 32'h513;
              end else begin
                if (_T_27) begin
                  bmem_data <= 32'h593;
                end else begin
                  if (_T_30) begin
                    bmem_data <= 32'h114000ef;
                  end else begin
                    if (_T_33) begin
                      bmem_data <= 32'hfe010113;
                    end else begin
                      if (_T_36) begin
                        bmem_data <= 32'h812e23;
                      end else begin
                        if (_T_39) begin
                          bmem_data <= 32'h2010413;
                        end else begin
                          if (_T_42) begin
                            bmem_data <= 32'h50793;
                          end else begin
                            if (_T_45) begin
                              bmem_data <= 32'hfef407a3;
                            end else begin
                              if (_T_48) begin
                                bmem_data <= 32'h37b7;
                              end else begin
                                if (_T_51) begin
                                  bmem_data <= 32'h27c783;
                                end else begin
                                  if (_T_54) begin
                                    bmem_data <= 32'hff7f693;
                                  end else begin
                                    if (_T_57) begin
                                      bmem_data <= 32'h37b7;
                                    end else begin
                                      if (_T_60) begin
                                        bmem_data <= 32'hfef44703;
                                      end else begin
                                        if (_T_63) begin
                                          bmem_data <= 32'he6e733;
                                        end else begin
                                          if (_T_66) begin
                                            bmem_data <= 32'hff77713;
                                          end else begin
                                            if (_T_69) begin
                                              bmem_data <= 32'he78123;
                                            end else begin
                                              if (_T_72) begin
                                                bmem_data <= 32'h13;
                                              end else begin
                                                if (_T_75) begin
                                                  bmem_data <= 32'h1c12403;
                                                end else begin
                                                  if (_T_78) begin
                                                    bmem_data <= 32'h2010113;
                                                  end else begin
                                                    if (_T_81) begin
                                                      bmem_data <= 32'h8067;
                                                    end else begin
                                                      if (_T_84) begin
                                                        bmem_data <= 32'hfe010113;
                                                      end else begin
                                                        if (_T_87) begin
                                                          bmem_data <= 32'h812e23;
                                                        end else begin
                                                          if (_T_90) begin
                                                            bmem_data <= 32'h2010413;
                                                          end else begin
                                                            if (_T_93) begin
                                                              bmem_data <= 32'h50793;
                                                            end else begin
                                                              if (_T_96) begin
                                                                bmem_data <= 32'hfef407a3;
                                                              end else begin
                                                                if (_T_99) begin
                                                                  bmem_data <= 32'h37b7;
                                                                end else begin
                                                                  if (_T_102) begin
                                                                    bmem_data <= 32'hfef44703;
                                                                  end else begin
                                                                    if (_T_105) begin
                                                                      bmem_data <= 32'he780a3;
                                                                    end else begin
                                                                      if (_T_108) begin
                                                                        bmem_data <= 32'h13;
                                                                      end else begin
                                                                        if (_T_111) begin
                                                                          bmem_data <= 32'h37b7;
                                                                        end else begin
                                                                          if (_T_114) begin
                                                                            bmem_data <= 32'h47c783;
                                                                          end else begin
                                                                            if (_T_117) begin
                                                                              bmem_data <= 32'hff7f793;
                                                                            end else begin
                                                                              if (_T_120) begin
                                                                                bmem_data <= 32'h107f793;
                                                                              end else begin
                                                                                if (_T_123) begin
                                                                                  bmem_data <= 32'hfe0788e3;
                                                                                end else begin
                                                                                  if (_T_126) begin
                                                                                    bmem_data <= 32'h37b7;
                                                                                  end else begin
                                                                                    if (_T_129) begin
                                                                                      bmem_data <= 32'h7c783;
                                                                                    end else begin
                                                                                      if (_T_132) begin
                                                                                        bmem_data <= 32'hff7f793;
                                                                                      end else begin
                                                                                        if (_T_135) begin
                                                                                          bmem_data <= 32'h78513;
                                                                                        end else begin
                                                                                          if (_T_138) begin
                                                                                            bmem_data <= 32'h1c12403;
                                                                                          end else begin
                                                                                            if (_T_141) begin
                                                                                              bmem_data <= 32'h2010113;
                                                                                            end else begin
                                                                                              if (_T_144) begin
                                                                                                bmem_data <= 32'h8067;
                                                                                              end else begin
                                                                                                if (_T_147) begin
                                                                                                  bmem_data <= 32'hfe010113;
                                                                                                end else begin
                                                                                                  if (_T_150) begin
                                                                                                    bmem_data <= 32'h812e23;
                                                                                                  end else begin
                                                                                                    if (_T_153) begin
                                                                                                      bmem_data <= 32'h2010413;
                                                                                                    end else begin
                                                                                                      if (_T_156) begin
                                                                                                        bmem_data <= 32'h50793;
                                                                                                      end else begin
                                                                                                        if (_T_159) begin
                                                                                                          bmem_data <= 32'hfef407a3;
                                                                                                        end else begin
                                                                                                          if (_T_162) begin
                                                                                                            bmem_data <= 32'h27b7;
                                                                                                          end else begin
                                                                                                            if (_T_165) begin
                                                                                                              bmem_data <= 32'hfef44703;
                                                                                                            end else begin
                                                                                                              if (_T_168) begin
                                                                                                                bmem_data <= 32'he78123;
                                                                                                              end else begin
                                                                                                                if (_T_171) begin
                                                                                                                  bmem_data <= 32'h13;
                                                                                                                end else begin
                                                                                                                  if (_T_174) begin
                                                                                                                    bmem_data <= 32'h1c12403;
                                                                                                                  end else begin
                                                                                                                    if (_T_177) begin
                                                                                                                      bmem_data <= 32'h2010113;
                                                                                                                    end else begin
                                                                                                                      if (_T_180) begin
                                                                                                                        bmem_data <= 32'h8067;
                                                                                                                      end else begin
                                                                                                                        if (_T_183) begin
                                                                                                                          bmem_data <= 32'hfe010113;
                                                                                                                        end else begin
                                                                                                                          if (_T_186) begin
                                                                                                                            bmem_data <= 32'h812e23;
                                                                                                                          end else begin
                                                                                                                            if (_T_189) begin
                                                                                                                              bmem_data <= 32'h2010413;
                                                                                                                            end else begin
                                                                                                                              if (_T_192) begin
                                                                                                                                bmem_data <= 32'h50793;
                                                                                                                              end else begin
                                                                                                                                if (_T_195) begin
                                                                                                                                  bmem_data <= 32'hfef407a3;
                                                                                                                                end else begin
                                                                                                                                  if (_T_198) begin
                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                  end else begin
                                                                                                                                    if (_T_201) begin
                                                                                                                                      bmem_data <= 32'h27b7;
                                                                                                                                    end else begin
                                                                                                                                      if (_T_204) begin
                                                                                                                                        bmem_data <= 32'h47c783;
                                                                                                                                      end else begin
                                                                                                                                        if (_T_207) begin
                                                                                                                                          bmem_data <= 32'hff7f793;
                                                                                                                                        end else begin
                                                                                                                                          if (_T_210) begin
                                                                                                                                            bmem_data <= 32'h27f793;
                                                                                                                                          end else begin
                                                                                                                                            if (_T_213) begin
                                                                                                                                              bmem_data <= 32'hfe0788e3;
                                                                                                                                            end else begin
                                                                                                                                              if (_T_216) begin
                                                                                                                                                bmem_data <= 32'h27b7;
                                                                                                                                              end else begin
                                                                                                                                                if (_T_219) begin
                                                                                                                                                  bmem_data <= 32'hfef44703;
                                                                                                                                                end else begin
                                                                                                                                                  if (_T_222) begin
                                                                                                                                                    bmem_data <= 32'he780a3;
                                                                                                                                                  end else begin
                                                                                                                                                    if (_T_225) begin
                                                                                                                                                      bmem_data <= 32'h13;
                                                                                                                                                    end else begin
                                                                                                                                                      if (_T_228) begin
                                                                                                                                                        bmem_data <= 32'h1c12403;
                                                                                                                                                      end else begin
                                                                                                                                                        if (_T_231) begin
                                                                                                                                                          bmem_data <= 32'h2010113;
                                                                                                                                                        end else begin
                                                                                                                                                          if (_T_234) begin
                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                          end else begin
                                                                                                                                                            if (_T_237) begin
                                                                                                                                                              bmem_data <= 32'hff010113;
                                                                                                                                                            end else begin
                                                                                                                                                              if (_T_240) begin
                                                                                                                                                                bmem_data <= 32'h112623;
                                                                                                                                                              end else begin
                                                                                                                                                                if (_T_243) begin
                                                                                                                                                                  bmem_data <= 32'h812423;
                                                                                                                                                                end else begin
                                                                                                                                                                  if (_T_246) begin
                                                                                                                                                                    bmem_data <= 32'h1010413;
                                                                                                                                                                  end else begin
                                                                                                                                                                    if (_T_249) begin
                                                                                                                                                                      bmem_data <= 32'h1000513;
                                                                                                                                                                    end else begin
                                                                                                                                                                      if (_T_252) begin
                                                                                                                                                                        bmem_data <= 32'hf75ff0ef;
                                                                                                                                                                      end else begin
                                                                                                                                                                        if (_T_255) begin
                                                                                                                                                                          bmem_data <= 32'h800513;
                                                                                                                                                                        end else begin
                                                                                                                                                                          if (_T_258) begin
                                                                                                                                                                            bmem_data <= 32'hed5ff0ef;
                                                                                                                                                                          end else begin
                                                                                                                                                                            if (_T_261) begin
                                                                                                                                                                              bmem_data <= 32'h54000ef;
                                                                                                                                                                            end else begin
                                                                                                                                                                              if (_T_264) begin
                                                                                                                                                                                bmem_data <= 32'h4f00513;
                                                                                                                                                                              end else begin
                                                                                                                                                                                if (_T_267) begin
                                                                                                                                                                                  bmem_data <= 32'hf91ff0ef;
                                                                                                                                                                                end else begin
                                                                                                                                                                                  if (_T_270) begin
                                                                                                                                                                                    bmem_data <= 32'h6b00513;
                                                                                                                                                                                  end else begin
                                                                                                                                                                                    if (_T_273) begin
                                                                                                                                                                                      bmem_data <= 32'hf89ff0ef;
                                                                                                                                                                                    end else begin
                                                                                                                                                                                      if (_T_276) begin
                                                                                                                                                                                        bmem_data <= 32'h1c000ef;
                                                                                                                                                                                      end else begin
                                                                                                                                                                                        if (_T_279) begin
                                                                                                                                                                                          bmem_data <= 32'h793;
                                                                                                                                                                                        end else begin
                                                                                                                                                                                          if (_T_282) begin
                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                          end else begin
                                                                                                                                                                                            if (_T_285) begin
                                                                                                                                                                                              bmem_data <= 32'hc12083;
                                                                                                                                                                                            end else begin
                                                                                                                                                                                              if (_T_288) begin
                                                                                                                                                                                                bmem_data <= 32'h812403;
                                                                                                                                                                                              end else begin
                                                                                                                                                                                                if (_T_291) begin
                                                                                                                                                                                                  bmem_data <= 32'h1010113;
                                                                                                                                                                                                end else begin
                                                                                                                                                                                                  if (_T_294) begin
                                                                                                                                                                                                    bmem_data <= 32'h8067;
                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                    if (_T_297) begin
                                                                                                                                                                                                      bmem_data <= 32'hff010113;
                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                      if (_T_300) begin
                                                                                                                                                                                                        bmem_data <= 32'h812623;
                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                        if (_T_303) begin
                                                                                                                                                                                                          bmem_data <= 32'h1010413;
                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                          if (_T_306) begin
                                                                                                                                                                                                            bmem_data <= 32'h2b7;
                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                            if (_T_309) begin
                                                                                                                                                                                                              bmem_data <= 32'h28067;
                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                              if (_T_312) begin
                                                                                                                                                                                                                bmem_data <= 32'h13;
                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                if (_T_315) begin
                                                                                                                                                                                                                  bmem_data <= 32'hc12403;
                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                  if (_T_318) begin
                                                                                                                                                                                                                    bmem_data <= 32'h1010113;
                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                    if (_T_321) begin
                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                      if (_T_324) begin
                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                        if (_T_327) begin
                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                          if (_T_330) begin
                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                            if (_T_333) begin
                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                              if (_T_336) begin
                                                                                                                                                                                                                                bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                if (_T_339) begin
                                                                                                                                                                                                                                  bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                  if (_T_342) begin
                                                                                                                                                                                                                                    bmem_data <= 32'h94000ef;
                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                    if (_T_345) begin
                                                                                                                                                                                                                                      bmem_data <= 32'hfea42223;
                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                      if (_T_348) begin
                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                        if (_T_351) begin
                                                                                                                                                                                                                                          bmem_data <= 32'h478793;
                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                          if (_T_354) begin
                                                                                                                                                                                                                                            bmem_data <= 32'h78513;
                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                            if (_T_357) begin
                                                                                                                                                                                                                                              bmem_data <= 32'h80000ef;
                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                              if (_T_360) begin
                                                                                                                                                                                                                                                bmem_data <= 32'hfea42023;
                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                if (_T_363) begin
                                                                                                                                                                                                                                                  bmem_data <= 32'hfc042e23;
                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                  if (_T_366) begin
                                                                                                                                                                                                                                                    bmem_data <= 32'hfc042c23;
                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                    if (_T_369) begin
                                                                                                                                                                                                                                                      bmem_data <= 32'hfe042423;
                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                      if (_T_372) begin
                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                        if (_T_375) begin
                                                                                                                                                                                                                                                          bmem_data <= 32'hc78793;
                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                          if (_T_378) begin
                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                            if (_T_381) begin
                                                                                                                                                                                                                                                              bmem_data <= 32'h3c0006f;
                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                              if (_T_384) begin
                                                                                                                                                                                                                                                                bmem_data <= 32'hfec42503;
                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                if (_T_387) begin
                                                                                                                                                                                                                                                                  bmem_data <= 32'h58000ef;
                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                  if (_T_390) begin
                                                                                                                                                                                                                                                                    bmem_data <= 32'hfca42c23;
                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                    if (_T_393) begin
                                                                                                                                                                                                                                                                      bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                      if (_T_396) begin
                                                                                                                                                                                                                                                                        bmem_data <= 32'h178713;
                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                        if (_T_399) begin
                                                                                                                                                                                                                                                                          bmem_data <= 32'hfee42423;
                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                          if (_T_402) begin
                                                                                                                                                                                                                                                                            bmem_data <= 32'h279793;
                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                            if (_T_405) begin
                                                                                                                                                                                                                                                                              bmem_data <= 32'hfdc42703;
                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                              if (_T_408) begin
                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                if (_T_411) begin
                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfd842703;
                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                  if (_T_414) begin
                                                                                                                                                                                                                                                                                    bmem_data <= 32'he7a023;
                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                    if (_T_417) begin
                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                      if (_T_420) begin
                                                                                                                                                                                                                                                                                        bmem_data <= 32'h478793;
                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                        if (_T_423) begin
                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                          if (_T_426) begin
                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe042783;
                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                            if (_T_429) begin
                                                                                                                                                                                                                                                                                              bmem_data <= 32'h27d793;
                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                              if (_T_432) begin
                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfe842703;
                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                if (_T_435) begin
                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfaf76ee3;
                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                  if (_T_438) begin
                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                    if (_T_441) begin
                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                      if (_T_444) begin
                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                        if (_T_447) begin
                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                          if (_T_450) begin
                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                            if (_T_453) begin
                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                              if (_T_456) begin
                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                if (_T_459) begin
                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                  if (_T_462) begin
                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                    if (_T_465) begin
                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                      if (_T_468) begin
                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                        if (_T_471) begin
                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                          if (_T_474) begin
                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                            if (_T_477) begin
                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                              if (_T_480) begin
                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h176713;
                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                if (_T_483) begin
                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                  if (_T_486) begin
                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                    if (_T_489) begin
                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h300513;
                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                      if (_T_492) begin
                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hde1ff0ef;
                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                        if (_T_495) begin
                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfdc42503;
                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                          if (_T_498) begin
                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h78000ef;
                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                            if (_T_501) begin
                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfe042623;
                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                              if (_T_504) begin
                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h300006f;
                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                if (_T_507) begin
                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h513;
                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                  if (_T_510) begin
                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hdc9ff0ef;
                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                    if (_T_513) begin
                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h50793;
                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                      if (_T_516) begin
                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h78713;
                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                        if (_T_519) begin
                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                          if (_T_522) begin
                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hff040693;
                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                            if (_T_525) begin
                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hf687b3;
                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                              if (_T_528) begin
                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfee78c23;
                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                if (_T_531) begin
                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                  if (_T_534) begin
                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h178793;
                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                    if (_T_537) begin
                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                      if (_T_540) begin
                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42703;
                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                        if (_T_543) begin
                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h300793;
                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                          if (_T_546) begin
                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfce7f6e3;
                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                            if (_T_549) begin
                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                              if (_T_552) begin
                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h57c783;
                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                if (_T_555) begin
                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff7f713;
                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                  if (_T_558) begin
                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h37b7;
                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                    if (_T_561) begin
                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hffe77713;
                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                      if (_T_564) begin
                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hff77713;
                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                        if (_T_567) begin
                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'he782a3;
                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                          if (_T_570) begin
                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfe842783;
                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                            if (_T_573) begin
                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                              if (_T_576) begin
                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                if (_T_579) begin
                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_582) begin
                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_585) begin
                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h8067;
                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_588) begin
                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfd010113;
                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_591) begin
                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h2112623;
                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_594) begin
                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'h2812423;
                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_597) begin
                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'h3010413;
                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_600) begin
                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfca42e23;
                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_603) begin
                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hfdc42783;
                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_606) begin
                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'hfef42423;
                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_609) begin
                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h200793;
                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_612) begin
                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_615) begin
                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'h280006f;
                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_618) begin
                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_621) begin
                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hff040713;
                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_624) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hf707b3;
                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_627) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'hff87c783;
                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_630) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h78513;
                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_633) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'hd25ff0ef;
                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_636) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_639) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          bmem_data <= 32'hfff78793;
                                                                                                                                                                                                                                                                                                                                                                                                                                        end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                          if (_T_642) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            bmem_data <= 32'hfef42623;
                                                                                                                                                                                                                                                                                                                                                                                                                                          end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                            if (_T_645) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              bmem_data <= 32'hfec42783;
                                                                                                                                                                                                                                                                                                                                                                                                                                            end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                              if (_T_648) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                bmem_data <= 32'hfc07dce3;
                                                                                                                                                                                                                                                                                                                                                                                                                                              end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                if (_T_651) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  bmem_data <= 32'h13;
                                                                                                                                                                                                                                                                                                                                                                                                                                                end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                  if (_T_654) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    bmem_data <= 32'h2c12083;
                                                                                                                                                                                                                                                                                                                                                                                                                                                  end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if (_T_657) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      bmem_data <= 32'h2812403;
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                      if (_T_660) begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        bmem_data <= 32'h3010113;
                                                                                                                                                                                                                                                                                                                                                                                                                                                      end else begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if (_T_663) begin
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
module IMem_Interface( // @[:@3061.2]
  input         clock, // @[:@3062.4]
  input         reset, // @[:@3063.4]
  input  [31:0] io_ibus_addr, // @[:@3064.4]
  output [31:0] io_ibus_inst, // @[:@3064.4]
  output        io_ibus_valid, // @[:@3064.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3064.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3064.4]
  input         io_wbs_m2s_we, // @[:@3064.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3064.4]
  input         io_wbs_m2s_stb, // @[:@3064.4]
  output        io_wbs_ack_o, // @[:@3064.4]
  output [31:0] io_wbs_data_o, // @[:@3064.4]
  output [8:0]  io_imem_io_addr, // @[:@3064.4]
  input  [31:0] io_imem_io_rdata, // @[:@3064.4]
  output [31:0] io_imem_io_wdata, // @[:@3064.4]
  output        io_imem_io_wr_en, // @[:@3064.4]
  output        io_imem_io_cs, // @[:@3064.4]
  output [3:0]  io_imem_io_st_type // @[:@3064.4]
);
  wire  bmem_clock; // @[imem_interface.scala 58:20:@3066.4]
  wire  bmem_reset; // @[imem_interface.scala 58:20:@3066.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 58:20:@3066.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 58:20:@3066.4]
  wire [8:0] ibus_imem_addr; // @[imem_interface.scala 65:41:@3069.4]
  wire [7:0] ibus_bmem_addr; // @[imem_interface.scala 66:41:@3070.4]
  wire [8:0] wbs_imem_addr; // @[imem_interface.scala 67:44:@3071.4]
  reg  ack; // @[imem_interface.scala 72:31:@3072.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 73:27:@3073.4]
  reg [31:0] _RAND_1;
  wire  _T_63; // @[imem_interface.scala 75:24:@3074.4]
  wire  wb_rd_en; // @[imem_interface.scala 75:39:@3075.4]
  wire  wb_wr_en; // @[imem_interface.scala 76:38:@3076.4]
  reg  bmem_ibus_sel; // @[imem_interface.scala 81:36:@3077.4]
  reg [31:0] _RAND_2;
  wire [3:0] _T_66; // @[imem_interface.scala 82:43:@3078.4]
  wire  _T_68; // @[imem_interface.scala 82:75:@3079.4]
  wire [3:0] _T_69; // @[imem_interface.scala 83:46:@3081.4]
  wire  _T_71; // @[imem_interface.scala 83:84:@3082.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 83:29:@3083.4]
  wire  imem_wbs_write; // @[imem_interface.scala 84:50:@3084.4]
  wire  _T_75; // @[imem_interface.scala 90:33:@3087.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 90:46:@3088.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 91:32:@3090.4]
  reg [31:0] _RAND_3;
  wire  _T_80; // @[imem_interface.scala 92:22:@3091.4]
  wire  _T_88; // @[imem_interface.scala 111:41:@3104.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 115:23:@3110.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 115:23:@3110.4]
  wire  _GEN_2; // @[imem_interface.scala 121:20:@3116.4]
  wire  _T_95; // @[imem_interface.scala 129:18:@3122.4]
  wire [7:0] _T_96; // @[imem_interface.scala 130:33:@3124.6]
  wire  _T_97; // @[imem_interface.scala 131:24:@3128.6]
  wire [7:0] _T_98; // @[imem_interface.scala 132:33:@3130.8]
  wire  _T_99; // @[imem_interface.scala 133:24:@3134.8]
  wire [7:0] _T_100; // @[imem_interface.scala 134:33:@3136.10]
  wire  _T_101; // @[imem_interface.scala 135:24:@3140.10]
  wire [7:0] _T_102; // @[imem_interface.scala 136:33:@3142.12]
  wire  _T_103; // @[imem_interface.scala 137:24:@3146.12]
  wire [15:0] _T_104; // @[imem_interface.scala 138:33:@3148.14]
  wire  _T_105; // @[imem_interface.scala 139:24:@3152.14]
  wire [15:0] _T_106; // @[imem_interface.scala 140:33:@3154.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 139:54:@3153.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 137:52:@3147.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 135:52:@3141.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 133:52:@3135.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 131:52:@3129.6]
  BMem bmem ( // @[imem_interface.scala 58:20:@3066.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[10:2]; // @[imem_interface.scala 65:41:@3069.4]
  assign ibus_bmem_addr = io_ibus_addr[9:2]; // @[imem_interface.scala 66:41:@3070.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[10:2]; // @[imem_interface.scala 67:44:@3071.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 75:24:@3074.4]
  assign wb_rd_en = _T_63 & io_wbs_m2s_stb; // @[imem_interface.scala 75:39:@3075.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 76:38:@3076.4]
  assign _T_66 = io_ibus_addr[15:12]; // @[imem_interface.scala 82:43:@3078.4]
  assign _T_68 = _T_66 == 4'h7; // @[imem_interface.scala 82:75:@3079.4]
  assign _T_69 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 83:46:@3081.4]
  assign _T_71 = _T_69 != 4'h0; // @[imem_interface.scala 83:84:@3082.4]
  assign imem_wbs_addr_match = _T_71 == 1'h0; // @[imem_interface.scala 83:29:@3083.4]
  assign imem_wbs_write = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 84:50:@3084.4]
  assign _T_75 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 90:33:@3087.4]
  assign imem_wbs_sel = _T_75 & imem_wbs_addr_match; // @[imem_interface.scala 90:46:@3088.4]
  assign _T_80 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 92:22:@3091.4]
  assign _T_88 = bmem_ibus_sel == 1'h0; // @[imem_interface.scala 111:41:@3104.4]
  assign rd_imem_inst = imem_ibus_valid ? io_imem_io_rdata : 32'h0; // @[imem_interface.scala 115:23:@3110.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : io_imem_io_rdata; // @[imem_interface.scala 115:23:@3110.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 121:20:@3116.4]
  assign _T_95 = wb_select == 4'h1; // @[imem_interface.scala 129:18:@3122.4]
  assign _T_96 = rd_imem_const[7:0]; // @[imem_interface.scala 130:33:@3124.6]
  assign _T_97 = wb_select == 4'h2; // @[imem_interface.scala 131:24:@3128.6]
  assign _T_98 = rd_imem_const[15:8]; // @[imem_interface.scala 132:33:@3130.8]
  assign _T_99 = wb_select == 4'h4; // @[imem_interface.scala 133:24:@3134.8]
  assign _T_100 = rd_imem_const[23:16]; // @[imem_interface.scala 134:33:@3136.10]
  assign _T_101 = wb_select == 4'h8; // @[imem_interface.scala 135:24:@3140.10]
  assign _T_102 = rd_imem_const[31:24]; // @[imem_interface.scala 136:33:@3142.12]
  assign _T_103 = wb_select == 4'h3; // @[imem_interface.scala 137:24:@3146.12]
  assign _T_104 = rd_imem_const[15:0]; // @[imem_interface.scala 138:33:@3148.14]
  assign _T_105 = wb_select == 4'hc; // @[imem_interface.scala 139:24:@3152.14]
  assign _T_106 = rd_imem_const[31:16]; // @[imem_interface.scala 140:33:@3154.16]
  assign _GEN_3 = _T_105 ? {{16'd0}, _T_106} : rd_imem_const; // @[imem_interface.scala 139:54:@3153.14]
  assign _GEN_4 = _T_103 ? {{16'd0}, _T_104} : _GEN_3; // @[imem_interface.scala 137:52:@3147.12]
  assign _GEN_5 = _T_101 ? {{24'd0}, _T_102} : _GEN_4; // @[imem_interface.scala 135:52:@3141.10]
  assign _GEN_6 = _T_99 ? {{24'd0}, _T_100} : _GEN_5; // @[imem_interface.scala 133:52:@3135.8]
  assign _GEN_7 = _T_97 ? {{24'd0}, _T_98} : _GEN_6; // @[imem_interface.scala 131:52:@3129.6]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 158:19:@3165.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 159:19:@3167.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 146:18:@3161.4]
  assign io_wbs_data_o = _T_95 ? {{24'd0}, _T_96} : _GEN_7; // @[imem_interface.scala 147:18:@3162.4]
  assign io_imem_io_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 100:23:@3098.4]
  assign io_imem_io_wdata = io_wbs_m2s_data; // @[imem_interface.scala 108:22:@3100.4]
  assign io_imem_io_wr_en = imem_wbs_write == 1'h0; // @[imem_interface.scala 109:22:@3102.4]
  assign io_imem_io_cs = imem_wbs_sel | _T_88; // @[imem_interface.scala 111:22:@3106.4]
  assign io_imem_io_st_type = io_wbs_m2s_sel; // @[imem_interface.scala 110:22:@3103.4]
  assign bmem_clock = clock; // @[:@3067.4]
  assign bmem_reset = reset; // @[:@3068.4]
  assign bmem_io_bmem_addr = {{24'd0}, ibus_bmem_addr}; // @[imem_interface.scala 151:21:@3163.4]
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
  bmem_ibus_sel = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imem_ibus_valid = _RAND_3[0:0];
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
      bmem_ibus_sel <= 1'h0;
    end else begin
      bmem_ibus_sel <= _T_68;
    end
    if (reset) begin
      imem_ibus_valid <= 1'h1;
    end else begin
      imem_ibus_valid <= _T_80;
    end
  end
endmodule
module WBM_DBus( // @[:@3169.2]
  input  [31:0] io_dbus_addr, // @[:@3172.4]
  input  [31:0] io_dbus_wdata, // @[:@3172.4]
  output [31:0] io_dbus_rdata, // @[:@3172.4]
  input         io_dbus_rd_en, // @[:@3172.4]
  input         io_dbus_wr_en, // @[:@3172.4]
  input  [1:0]  io_dbus_st_type, // @[:@3172.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3172.4]
  output        io_dbus_valid, // @[:@3172.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3172.4]
  output [31:0] io_wbm_m2s_data, // @[:@3172.4]
  output        io_wbm_m2s_we, // @[:@3172.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3172.4]
  output        io_wbm_m2s_stb, // @[:@3172.4]
  input         io_wbm_ack_i, // @[:@3172.4]
  input  [31:0] io_wbm_data_i // @[:@3172.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3176.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3181.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3186.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3187.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3182.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3177.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3190.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3193.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3198.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3199.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3200.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3202.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3203.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3207.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3208.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3209.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3211.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3216.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3221.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3222.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3217.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3212.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3210.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3201.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3194.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3233.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3176.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3181.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3186.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3187.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3182.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3177.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3190.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3193.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3198.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3199.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3200.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3202.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3203.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3207.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3208.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3209.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3211.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3216.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3221.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3222.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3217.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3212.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3210.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3201.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3194.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3233.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3241.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3242.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3230.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3231.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3232.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3235.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3239.4]
endmodule
module UARTTx( // @[:@3244.2]
  input        clock, // @[:@3245.4]
  input        reset, // @[:@3246.4]
  output       io_in_ready, // @[:@3247.4]
  input        io_in_valid, // @[:@3247.4]
  input  [7:0] io_in_bits, // @[:@3247.4]
  output       io_out, // @[:@3247.4]
  input  [9:0] io_div // @[:@3247.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3249.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3250.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3251.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3252.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3253.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3255.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3256.4]
  wire  state1; // @[uart_tx.scala 33:31:@3257.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3261.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3260.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3260.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3273.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3274.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3275.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3276.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3277.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3278.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3279.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3282.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3283.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3284.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3286.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3287.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3289.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3281.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3281.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3281.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3272.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3272.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3272.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3250.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3255.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3256.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3257.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3261.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3260.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3260.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3273.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3274.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3275.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3276.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3277.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3278.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3279.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3282.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3283.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3284.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3286.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3287.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3289.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3281.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3281.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3281.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3272.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3272.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3272.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3259.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3254.4]
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
module UARTRx( // @[:@3294.2]
  input        clock, // @[:@3295.4]
  input        reset, // @[:@3296.4]
  input        io_in, // @[:@3297.4]
  output       io_out_valid, // @[:@3297.4]
  output [7:0] io_out_bits, // @[:@3297.4]
  input  [9:0] io_div // @[:@3297.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3299.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3300.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3301.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3302.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3303.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3304.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3305.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3306.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3307.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3308.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3309.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3310.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3311.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3312.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3312.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3313.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3314.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3318.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3319.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3321.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3323.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3324.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3326.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3326.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3326.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3322.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3322.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3322.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3322.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3338.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3339.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3340.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3348.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3349.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3342.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3342.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3342.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3337.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3337.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3337.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3337.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3337.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3335.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3335.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3335.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3335.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3335.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3335.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3320.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3320.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3320.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3320.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3300.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3302.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3303.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3304.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3305.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3306.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3307.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3308.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3309.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3311.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3312.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3312.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3319.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3321.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3323.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3324.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3326.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3326.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3326.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3322.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3322.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3322.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3322.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3338.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3339.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3340.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3348.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3349.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3342.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3342.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3342.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3337.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3337.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3337.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3337.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3337.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3335.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3320.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3320.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3320.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3320.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3316.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3317.4]
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
module UART( // @[:@3355.2]
  input         clock, // @[:@3356.4]
  input         reset, // @[:@3357.4]
  input         io_uart_select, // @[:@3358.4]
  output        io_txd, // @[:@3358.4]
  output        io_tx_en, // @[:@3358.4]
  input         io_rxd, // @[:@3358.4]
  output        io_uartInt, // @[:@3358.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3358.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3358.4]
  input         io_wbs_m2s_we, // @[:@3358.4]
  input         io_wbs_m2s_stb, // @[:@3358.4]
  output        io_wbs_ack_o, // @[:@3358.4]
  output [31:0] io_wbs_data_o // @[:@3358.4]
);
  wire  txm_clock; // @[uart.scala 54:19:@3360.4]
  wire  txm_reset; // @[uart.scala 54:19:@3360.4]
  wire  txm_io_in_ready; // @[uart.scala 54:19:@3360.4]
  wire  txm_io_in_valid; // @[uart.scala 54:19:@3360.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 54:19:@3360.4]
  wire  txm_io_out; // @[uart.scala 54:19:@3360.4]
  wire [9:0] txm_io_div; // @[uart.scala 54:19:@3360.4]
  wire  rxm_clock; // @[uart.scala 55:19:@3363.4]
  wire  rxm_reset; // @[uart.scala 55:19:@3363.4]
  wire  rxm_io_in; // @[uart.scala 55:19:@3363.4]
  wire  rxm_io_out_valid; // @[uart.scala 55:19:@3363.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 55:19:@3363.4]
  wire [9:0] rxm_io_div; // @[uart.scala 55:19:@3363.4]
  reg  txen; // @[uart.scala 58:27:@3366.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 61:27:@3368.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 62:27:@3369.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 63:27:@3370.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 64:27:@3371.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 65:27:@3372.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 66:27:@3373.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 87:36:@3385.4]
  wire  _T_66; // @[uart.scala 88:21:@3386.4]
  wire  rd_en; // @[uart.scala 88:36:@3387.4]
  wire  wr_en; // @[uart.scala 89:35:@3388.4]
  wire  _T_73; // @[uart.scala 93:32:@3389.4]
  wire  sel_reg_rx; // @[uart.scala 93:56:@3390.4]
  wire  _T_74; // @[uart.scala 94:32:@3391.4]
  wire  sel_reg_tx; // @[uart.scala 94:56:@3392.4]
  wire  _T_75; // @[uart.scala 95:32:@3393.4]
  wire  sel_reg_baud; // @[uart.scala 95:54:@3394.4]
  wire  _T_76; // @[uart.scala 96:32:@3395.4]
  wire  sel_reg_control; // @[uart.scala 96:57:@3396.4]
  wire  _T_77; // @[uart.scala 97:32:@3397.4]
  wire  sel_reg_status; // @[uart.scala 97:56:@3398.4]
  wire  _T_78; // @[uart.scala 98:32:@3399.4]
  wire  sel_reg_int_mask; // @[uart.scala 98:58:@3400.4]
  reg  ack; // @[uart.scala 101:28:@3401.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 106:28:@3405.4]
  reg [31:0] _RAND_8;
  wire  _T_84; // @[uart.scala 108:14:@3406.4]
  wire  _T_85; // @[uart.scala 110:20:@3411.6]
  wire  _T_86; // @[uart.scala 112:20:@3416.8]
  wire  _T_87; // @[uart.scala 114:20:@3421.10]
  wire [7:0] _GEN_0; // @[uart.scala 114:34:@3422.10]
  wire [7:0] _GEN_1; // @[uart.scala 112:38:@3417.8]
  wire [9:0] _GEN_2; // @[uart.scala 110:36:@3412.6]
  wire [9:0] _GEN_3; // @[uart.scala 108:33:@3407.4]
  wire [7:0] _T_89; // @[uart.scala 122:31:@3429.4]
  wire [7:0] _T_92; // @[uart.scala 127:36:@3434.8]
  wire [7:0] _GEN_4; // @[uart.scala 136:32:@3449.12]
  wire [7:0] _GEN_5; // @[uart.scala 133:31:@3444.10]
  wire [7:0] _GEN_6; // @[uart.scala 133:31:@3444.10]
  wire [9:0] _GEN_7; // @[uart.scala 130:29:@3439.8]
  wire [7:0] _GEN_8; // @[uart.scala 130:29:@3439.8]
  wire [7:0] _GEN_9; // @[uart.scala 130:29:@3439.8]
  wire [7:0] _GEN_10; // @[uart.scala 126:22:@3433.6]
  wire [9:0] _GEN_12; // @[uart.scala 126:22:@3433.6]
  wire [7:0] _GEN_13; // @[uart.scala 126:22:@3433.6]
  wire [7:0] _GEN_14; // @[uart.scala 126:22:@3433.6]
  wire [7:0] _GEN_15; // @[uart.scala 125:15:@3432.4]
  wire  _GEN_16; // @[uart.scala 125:15:@3432.4]
  wire [9:0] _GEN_17; // @[uart.scala 125:15:@3432.4]
  wire [7:0] _GEN_18; // @[uart.scala 125:15:@3432.4]
  wire [7:0] _GEN_19; // @[uart.scala 125:15:@3432.4]
  wire [6:0] _T_97; // @[uart.scala 144:33:@3456.6]
  wire [7:0] _T_99; // @[Cat.scala 30:58:@3457.6]
  wire  _T_100; // @[uart.scala 145:20:@3461.6]
  wire [5:0] _T_102; // @[uart.scala 148:33:@3467.8]
  wire  _T_103; // @[uart.scala 148:65:@3468.8]
  wire [7:0] _T_105; // @[Cat.scala 30:58:@3470.8]
  wire [7:0] _GEN_20; // @[uart.scala 145:38:@3462.6]
  wire [7:0] _GEN_21; // @[uart.scala 142:25:@3454.4]
  wire [7:0] _GEN_22; // @[uart.scala 142:25:@3454.4]
  UARTTx txm ( // @[uart.scala 54:19:@3360.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 55:19:@3363.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 87:36:@3385.4]
  assign _T_66 = io_wbs_m2s_we == 1'h0; // @[uart.scala 88:21:@3386.4]
  assign rd_en = _T_66 & io_wbs_m2s_stb; // @[uart.scala 88:36:@3387.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 89:35:@3388.4]
  assign _T_73 = addr == 8'h0; // @[uart.scala 93:32:@3389.4]
  assign sel_reg_rx = _T_73 & io_uart_select; // @[uart.scala 93:56:@3390.4]
  assign _T_74 = addr == 8'h1; // @[uart.scala 94:32:@3391.4]
  assign sel_reg_tx = _T_74 & io_uart_select; // @[uart.scala 94:56:@3392.4]
  assign _T_75 = addr == 8'h2; // @[uart.scala 95:32:@3393.4]
  assign sel_reg_baud = _T_75 & io_uart_select; // @[uart.scala 95:54:@3394.4]
  assign _T_76 = addr == 8'h3; // @[uart.scala 96:32:@3395.4]
  assign sel_reg_control = _T_76 & io_uart_select; // @[uart.scala 96:57:@3396.4]
  assign _T_77 = addr == 8'h4; // @[uart.scala 97:32:@3397.4]
  assign sel_reg_status = _T_77 & io_uart_select; // @[uart.scala 97:56:@3398.4]
  assign _T_78 = addr == 8'h5; // @[uart.scala 98:32:@3399.4]
  assign sel_reg_int_mask = _T_78 & io_uart_select; // @[uart.scala 98:58:@3400.4]
  assign _T_84 = rd_en & sel_reg_control; // @[uart.scala 108:14:@3406.4]
  assign _T_85 = rd_en & sel_reg_baud; // @[uart.scala 110:20:@3411.6]
  assign _T_86 = rd_en & sel_reg_status; // @[uart.scala 112:20:@3416.8]
  assign _T_87 = rd_en & sel_reg_rx; // @[uart.scala 114:20:@3421.10]
  assign _GEN_0 = _T_87 ? rx_data_r : 8'h0; // @[uart.scala 114:34:@3422.10]
  assign _GEN_1 = _T_86 ? status_r : _GEN_0; // @[uart.scala 112:38:@3417.8]
  assign _GEN_2 = _T_85 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 110:36:@3412.6]
  assign _GEN_3 = _T_84 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 108:33:@3407.4]
  assign _T_89 = status_r & int_mask_r; // @[uart.scala 122:31:@3429.4]
  assign _T_92 = io_wbs_m2s_data[7:0]; // @[uart.scala 127:36:@3434.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_92 : int_mask_r; // @[uart.scala 136:32:@3449.12]
  assign _GEN_5 = sel_reg_control ? _T_92 : control_r; // @[uart.scala 133:31:@3444.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 133:31:@3444.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_92} : baud_r; // @[uart.scala 130:29:@3439.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 130:29:@3439.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 130:29:@3439.8]
  assign _GEN_10 = sel_reg_tx ? _T_92 : tx_data_r; // @[uart.scala 126:22:@3433.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 126:22:@3433.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 126:22:@3433.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 126:22:@3433.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 125:15:@3432.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 125:15:@3432.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 125:15:@3432.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 125:15:@3432.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 125:15:@3432.4]
  assign _T_97 = status_r[7:1]; // @[uart.scala 144:33:@3456.6]
  assign _T_99 = {_T_97,1'h1}; // @[Cat.scala 30:58:@3457.6]
  assign _T_100 = wr_en & sel_reg_status; // @[uart.scala 145:20:@3461.6]
  assign _T_102 = status_r[7:2]; // @[uart.scala 148:33:@3467.8]
  assign _T_103 = status_r[0]; // @[uart.scala 148:65:@3468.8]
  assign _T_105 = {_T_102,txm_io_in_ready,_T_103}; // @[Cat.scala 30:58:@3470.8]
  assign _GEN_20 = _T_100 ? _T_92 : _T_105; // @[uart.scala 145:38:@3462.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 142:25:@3454.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_99 : _GEN_20; // @[uart.scala 142:25:@3454.4]
  assign io_txd = txm_io_out; // @[uart.scala 83:19:@3382.4]
  assign io_tx_en = control_r[7]; // @[uart.scala 84:19:@3384.4]
  assign io_uartInt = _T_89 != 8'h0; // @[uart.scala 122:18:@3431.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 102:19:@3402.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 119:18:@3428.4]
  assign txm_clock = clock; // @[:@3361.4]
  assign txm_reset = reset; // @[:@3362.4]
  assign txm_io_in_valid = txen; // @[uart.scala 75:19:@3376.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 76:19:@3377.4]
  assign txm_io_div = baud_r; // @[uart.scala 77:19:@3378.4]
  assign rxm_clock = clock; // @[:@3364.4]
  assign rxm_reset = reset; // @[:@3365.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 82:19:@3381.4]
  assign rxm_io_div = baud_r; // @[uart.scala 79:19:@3380.4]
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
          tx_data_r <= _T_92;
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
              control_r <= _T_92;
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
            baud_r <= {{2'd0}, _T_92};
          end
        end
      end
    end
    if (reset) begin
      status_r <= 8'h0;
    end else begin
      if (rxm_io_out_valid) begin
        status_r <= _T_99;
      end else begin
        if (_T_100) begin
          status_r <= _T_92;
        end else begin
          status_r <= _T_105;
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
                int_mask_r <= _T_92;
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
module SPI( // @[:@3474.2]
  input         clock, // @[:@3475.4]
  input         reset, // @[:@3476.4]
  input         io_spi_select, // @[:@3477.4]
  output        io_spi_cs, // @[:@3477.4]
  output        io_spi_clk, // @[:@3477.4]
  output        io_spi_mosi, // @[:@3477.4]
  output        io_spi_cs_en, // @[:@3477.4]
  output        io_spi_clk_en, // @[:@3477.4]
  output        io_spi_mosi_en, // @[:@3477.4]
  input         io_spi_miso, // @[:@3477.4]
  output        io_spi_intr, // @[:@3477.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3477.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3477.4]
  input         io_wbs_m2s_we, // @[:@3477.4]
  input         io_wbs_m2s_stb, // @[:@3477.4]
  output        io_wbs_ack_o, // @[:@3477.4]
  output [31:0] io_wbs_data_o // @[:@3477.4]
);
  reg  ack_o; // @[spi.scala 70:25:@3479.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 71:25:@3480.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 74:23:@3482.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 75:23:@3483.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 80:31:@3490.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 83:28:@3493.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 84:28:@3494.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 85:28:@3495.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 87:30:@3496.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 88:30:@3497.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 89:30:@3498.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 92:27:@3499.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 93:27:@3500.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 94:27:@3501.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 95:27:@3502.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 96:27:@3503.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 97:27:@3504.4]
  reg [31:0] _RAND_16;
  reg  bit_en_io; // @[spi.scala 98:27:@3505.4]
  reg [31:0] _RAND_17;
  reg  bit_toe; // @[spi.scala 101:27:@3506.4]
  reg [31:0] _RAND_18;
  reg  bit_roe; // @[spi.scala 102:27:@3507.4]
  reg [31:0] _RAND_19;
  reg  bit_trdy; // @[spi.scala 103:27:@3508.4]
  reg [31:0] _RAND_20;
  reg  bit_rrdy; // @[spi.scala 104:27:@3509.4]
  reg [31:0] _RAND_21;
  reg  bit_tmt; // @[spi.scala 105:27:@3510.4]
  reg [31:0] _RAND_22;
  reg  bit_e; // @[spi.scala 106:27:@3511.4]
  reg [31:0] _RAND_23;
  wire [7:0] addr; // @[spi.scala 112:33:@3512.4]
  wire  _T_112; // @[spi.scala 114:19:@3513.4]
  wire  rd_en; // @[spi.scala 114:34:@3514.4]
  wire  wr_en; // @[spi.scala 115:33:@3517.4]
  wire  _T_123; // @[spi.scala 119:32:@3521.4]
  wire  sel_reg_rx; // @[spi.scala 119:54:@3522.4]
  wire  _T_124; // @[spi.scala 120:32:@3523.4]
  wire  sel_reg_tx; // @[spi.scala 120:54:@3524.4]
  wire  _T_126; // @[spi.scala 122:32:@3527.4]
  wire  sel_reg_control; // @[spi.scala 122:55:@3528.4]
  wire  _T_127; // @[spi.scala 123:32:@3529.4]
  wire  sel_reg_status; // @[spi.scala 123:54:@3530.4]
  wire  _T_128; // @[spi.scala 124:32:@3531.4]
  wire  sel_reg_ssmask; // @[spi.scala 124:55:@3532.4]
  wire [7:0] _GEN_0; // @[spi.scala 127:23:@3533.4]
  wire  _T_129; // @[spi.scala 132:14:@3536.4]
  wire  _T_130; // @[spi.scala 132:28:@3537.4]
  wire [7:0] latch_s_data; // @[:@3491.4 :@3492.4 spi.scala 116:16:@3520.4]
  wire [7:0] _GEN_1; // @[spi.scala 132:41:@3538.4]
  wire  _T_131; // @[spi.scala 137:19:@3541.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3548.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3555.4]
  wire  _T_145; // @[spi.scala 144:14:@3556.4]
  wire  _T_146; // @[spi.scala 145:30:@3558.6]
  wire  _T_147; // @[spi.scala 146:30:@3560.6]
  wire  _T_148; // @[spi.scala 147:30:@3562.6]
  wire  _T_149; // @[spi.scala 148:30:@3564.6]
  wire  _T_150; // @[spi.scala 149:30:@3566.6]
  wire  _T_151; // @[spi.scala 150:30:@3568.6]
  wire  _T_152; // @[spi.scala 151:30:@3570.6]
  wire  _GEN_2; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_3; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_4; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_5; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_6; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_7; // @[spi.scala 144:34:@3557.4]
  wire  _GEN_8; // @[spi.scala 144:34:@3557.4]
  wire  _T_153; // @[spi.scala 158:37:@3576.4]
  wire  _T_154; // @[spi.scala 158:58:@3577.4]
  wire  _T_155; // @[spi.scala 158:47:@3578.4]
  wire  _T_156; // @[spi.scala 158:25:@3579.4]
  wire  _T_157; // @[spi.scala 158:83:@3580.4]
  wire  _T_158; // @[spi.scala 158:70:@3581.4]
  wire  _T_159; // @[spi.scala 158:108:@3582.4]
  wire  _T_163; // @[spi.scala 165:39:@3590.6]
  wire  _T_164; // @[spi.scala 165:30:@3591.6]
  wire  _GEN_9; // @[spi.scala 165:59:@3592.6]
  wire  _GEN_10; // @[spi.scala 163:15:@3585.4]
  wire  _T_168; // @[spi.scala 172:35:@3601.6]
  wire  _T_169; // @[spi.scala 172:30:@3602.6]
  wire  _GEN_11; // @[spi.scala 172:43:@3603.6]
  wire  _GEN_12; // @[spi.scala 170:15:@3596.4]
  reg [4:0] clock_cnt; // @[spi.scala 177:31:@3606.4]
  reg [31:0] _RAND_24;
  reg [5:0] data_cnt; // @[spi.scala 178:31:@3607.4]
  reg [31:0] _RAND_25;
  reg  pending_data; // @[spi.scala 179:31:@3608.4]
  reg [31:0] _RAND_26;
  reg [2:0] n_status; // @[spi.scala 181:31:@3611.4]
  reg [31:0] _RAND_27;
  reg [2:0] p_status; // @[spi.scala 182:31:@3612.4]
  reg [31:0] _RAND_28;
  wire  _T_182; // @[spi.scala 186:27:@3618.6]
  wire  _GEN_13; // @[spi.scala 186:40:@3619.6]
  wire  _GEN_14; // @[spi.scala 184:32:@3614.4]
  wire [7:0] _T_188; // @[spi.scala 192:78:@3625.6]
  wire [7:0] _T_189; // @[spi.scala 192:44:@3626.6]
  wire [7:0] _T_190; // @[spi.scala 192:12:@3627.6]
  wire [7:0] _T_191; // @[spi.scala 191:49:@3628.6]
  wire [7:0] _T_192; // @[spi.scala 191:21:@3629.6]
  wire [7:0] _GEN_15; // @[spi.scala 190:18:@3622.4]
  wire  _T_193; // @[spi.scala 196:16:@3633.4]
  wire  _GEN_16; // @[spi.scala 196:35:@3634.4]
  wire  _T_196; // @[spi.scala 212:21:@3640.4]
  wire  _T_198; // @[spi.scala 212:49:@3641.4]
  wire  _T_199; // @[spi.scala 212:35:@3642.4]
  wire  _T_200; // @[spi.scala 213:18:@3644.6]
  wire  _GEN_17; // @[spi.scala 212:67:@3643.4]
  wire  _T_204; // @[spi.scala 219:59:@3650.4]
  wire  _T_205; // @[spi.scala 219:39:@3651.4]
  wire  _T_207; // @[spi.scala 219:71:@3653.4]
  wire [8:0] _T_211; // @[Cat.scala 30:58:@3661.8]
  wire [8:0] _GEN_19; // @[spi.scala 219:99:@3654.4]
  wire  _T_212; // @[spi.scala 228:20:@3665.4]
  wire  _T_213; // @[spi.scala 228:47:@3666.4]
  wire  _T_214; // @[spi.scala 228:34:@3667.4]
  wire  _GEN_20; // @[spi.scala 230:33:@3672.6]
  wire  _GEN_21; // @[spi.scala 228:62:@3668.4]
  wire  _T_219; // @[spi.scala 234:49:@3676.4]
  wire  _T_220; // @[spi.scala 234:36:@3677.4]
  wire [5:0] _T_223; // @[spi.scala 237:30:@3682.6]
  wire [4:0] _T_224; // @[spi.scala 237:30:@3683.6]
  wire [4:0] _GEN_22; // @[spi.scala 234:63:@3678.4]
  wire [2:0] _GEN_23; // @[spi.scala 246:26:@3694.6]
  wire  _T_237; // @[spi.scala 257:27:@3713.8]
  wire  _T_241; // @[spi.scala 258:53:@3716.10]
  wire  _T_242; // @[spi.scala 258:40:@3717.10]
  wire [2:0] _GEN_25; // @[spi.scala 258:76:@3718.10]
  wire  _T_246; // @[spi.scala 264:53:@3729.12]
  wire  _T_247; // @[spi.scala 264:40:@3730.12]
  wire  _T_250; // @[spi.scala 264:69:@3732.12]
  wire [2:0] _GEN_26; // @[spi.scala 264:105:@3733.12]
  wire  _T_251; // @[spi.scala 269:27:@3741.12]
  wire [2:0] _GEN_28; // @[spi.scala 270:39:@3744.14]
  wire  _T_255; // @[spi.scala 277:27:@3754.14]
  wire  _T_259; // @[spi.scala 278:53:@3757.16]
  wire  _T_260; // @[spi.scala 278:40:@3758.16]
  wire [2:0] _GEN_29; // @[spi.scala 278:77:@3759.16]
  wire [2:0] _GEN_30; // @[spi.scala 277:44:@3755.14]
  wire [2:0] _GEN_31; // @[spi.scala 269:46:@3742.12]
  wire [2:0] _GEN_32; // @[spi.scala 263:41:@3727.10]
  wire [2:0] _GEN_33; // @[spi.scala 257:40:@3714.8]
  wire [2:0] _GEN_34; // @[spi.scala 251:40:@3703.6]
  wire [2:0] _GEN_35; // @[spi.scala 245:32:@3693.4]
  wire  _T_264; // @[spi.scala 287:32:@3771.4]
  wire  _T_267; // @[spi.scala 287:63:@3773.4]
  wire  _T_274; // @[spi.scala 289:73:@3782.6]
  wire  _T_277; // @[spi.scala 289:102:@3784.6]
  wire  _T_282; // @[spi.scala 291:45:@3791.8]
  wire  _T_285; // @[spi.scala 291:76:@3793.8]
  wire  _T_299; // @[spi.scala 293:133:@3806.10]
  wire  _T_300; // @[spi.scala 293:74:@3807.10]
  wire  _T_305; // @[spi.scala 293:174:@3811.10]
  wire [6:0] _T_307; // @[spi.scala 294:28:@3813.12]
  wire [5:0] _T_308; // @[spi.scala 294:28:@3814.12]
  wire [5:0] _GEN_36; // @[spi.scala 293:238:@3812.10]
  wire [5:0] _GEN_37; // @[spi.scala 291:113:@3794.8]
  wire [5:0] _GEN_38; // @[spi.scala 289:138:@3785.6]
  wire [5:0] _GEN_39; // @[spi.scala 287:99:@3774.4]
  reg  wait_one_tick_done; // @[spi.scala 297:37:@3817.4]
  reg [31:0] _RAND_29;
  wire  _T_329; // @[spi.scala 309:72:@3839.6]
  wire [8:0] _T_336; // @[Cat.scala 30:58:@3844.6]
  wire  _T_349; // @[spi.scala 313:80:@3858.10]
  wire [8:0] _T_356; // @[Cat.scala 30:58:@3863.10]
  wire  _GEN_43; // @[spi.scala 312:32:@3856.8]
  wire [8:0] _GEN_44; // @[spi.scala 312:32:@3856.8]
  wire  _GEN_45; // @[spi.scala 311:114:@3855.6]
  wire [8:0] _GEN_46; // @[spi.scala 311:114:@3855.6]
  wire  _GEN_47; // @[spi.scala 308:37:@3837.4]
  wire [8:0] _GEN_48; // @[spi.scala 308:37:@3837.4]
  wire  _GEN_49; // @[spi.scala 321:39:@3875.6]
  wire  _GEN_50; // @[spi.scala 319:36:@3870.4]
  wire  _T_363; // @[spi.scala 325:12:@3878.4]
  wire  _T_364; // @[spi.scala 325:22:@3879.4]
  wire  _T_365; // @[spi.scala 325:31:@3880.4]
  wire  _T_367; // @[spi.scala 327:24:@3885.6]
  wire  _GEN_51; // @[spi.scala 327:43:@3886.6]
  wire  _GEN_52; // @[spi.scala 325:46:@3881.4]
  wire  _T_372; // @[spi.scala 331:40:@3891.4]
  wire  _GEN_53; // @[spi.scala 332:22:@3893.6]
  wire  _GEN_54; // @[spi.scala 332:22:@3893.6]
  wire  _T_375; // @[spi.scala 337:24:@3901.6]
  wire  _GEN_55; // @[spi.scala 337:39:@3902.6]
  wire  _GEN_56; // @[spi.scala 337:39:@3902.6]
  wire  _GEN_57; // @[spi.scala 331:72:@3892.4]
  wire  _GEN_58; // @[spi.scala 331:72:@3892.4]
  wire  _T_378; // @[spi.scala 342:21:@3906.4]
  wire  _T_379; // @[spi.scala 342:34:@3907.4]
  wire  _GEN_59; // @[spi.scala 342:51:@3908.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 112:33:@3512.4]
  assign _T_112 = io_wbs_m2s_we == 1'h0; // @[spi.scala 114:19:@3513.4]
  assign rd_en = _T_112 & io_wbs_m2s_stb; // @[spi.scala 114:34:@3514.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 115:33:@3517.4]
  assign _T_123 = addr == 8'h0; // @[spi.scala 119:32:@3521.4]
  assign sel_reg_rx = _T_123 & io_spi_select; // @[spi.scala 119:54:@3522.4]
  assign _T_124 = addr == 8'h1; // @[spi.scala 120:32:@3523.4]
  assign sel_reg_tx = _T_124 & io_spi_select; // @[spi.scala 120:54:@3524.4]
  assign _T_126 = addr == 8'h3; // @[spi.scala 122:32:@3527.4]
  assign sel_reg_control = _T_126 & io_spi_select; // @[spi.scala 122:55:@3528.4]
  assign _T_127 = addr == 8'h4; // @[spi.scala 123:32:@3529.4]
  assign sel_reg_status = _T_127 & io_spi_select; // @[spi.scala 123:54:@3530.4]
  assign _T_128 = addr == 8'h5; // @[spi.scala 124:32:@3531.4]
  assign sel_reg_ssmask = _T_128 & io_spi_select; // @[spi.scala 124:55:@3532.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 127:23:@3533.4]
  assign _T_129 = wr_en & sel_reg_tx; // @[spi.scala 132:14:@3536.4]
  assign _T_130 = _T_129 & bit_trdy; // @[spi.scala 132:28:@3537.4]
  assign latch_s_data = io_wbs_m2s_data[7:0]; // @[:@3491.4 :@3492.4 spi.scala 116:16:@3520.4]
  assign _GEN_1 = _T_130 ? latch_s_data : reg_txdata; // @[spi.scala 132:41:@3538.4]
  assign _T_131 = bit_toe | bit_roe; // @[spi.scala 137:19:@3541.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3548.4]
  assign reg_control = {bit_sso,bit_en_io,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3555.4]
  assign _T_145 = wr_en & sel_reg_control; // @[spi.scala 144:14:@3556.4]
  assign _T_146 = latch_s_data[0]; // @[spi.scala 145:30:@3558.6]
  assign _T_147 = latch_s_data[1]; // @[spi.scala 146:30:@3560.6]
  assign _T_148 = latch_s_data[3]; // @[spi.scala 147:30:@3562.6]
  assign _T_149 = latch_s_data[4]; // @[spi.scala 148:30:@3564.6]
  assign _T_150 = latch_s_data[5]; // @[spi.scala 149:30:@3566.6]
  assign _T_151 = latch_s_data[6]; // @[spi.scala 150:30:@3568.6]
  assign _T_152 = latch_s_data[7]; // @[spi.scala 151:30:@3570.6]
  assign _GEN_2 = _T_145 ? _T_146 : bit_iroe; // @[spi.scala 144:34:@3557.4]
  assign _GEN_3 = _T_145 ? _T_147 : bit_itoe; // @[spi.scala 144:34:@3557.4]
  assign _GEN_4 = _T_145 ? _T_148 : bit_itrdy; // @[spi.scala 144:34:@3557.4]
  assign _GEN_5 = _T_145 ? _T_149 : bit_irrdy; // @[spi.scala 144:34:@3557.4]
  assign _GEN_6 = _T_145 ? _T_150 : bit_ie; // @[spi.scala 144:34:@3557.4]
  assign _GEN_7 = _T_145 ? _T_151 : bit_en_io; // @[spi.scala 144:34:@3557.4]
  assign _GEN_8 = _T_145 ? _T_152 : bit_sso; // @[spi.scala 144:34:@3557.4]
  assign _T_153 = bit_iroe & bit_roe; // @[spi.scala 158:37:@3576.4]
  assign _T_154 = bit_itoe & bit_toe; // @[spi.scala 158:58:@3577.4]
  assign _T_155 = _T_153 | _T_154; // @[spi.scala 158:47:@3578.4]
  assign _T_156 = bit_ie & _T_155; // @[spi.scala 158:25:@3579.4]
  assign _T_157 = bit_itrdy & bit_trdy; // @[spi.scala 158:83:@3580.4]
  assign _T_158 = _T_156 | _T_157; // @[spi.scala 158:70:@3581.4]
  assign _T_159 = bit_irrdy & bit_rrdy; // @[spi.scala 158:108:@3582.4]
  assign _T_163 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 165:39:@3590.6]
  assign _T_164 = io_wbs_m2s_stb & _T_163; // @[spi.scala 165:30:@3591.6]
  assign _GEN_9 = _T_164 ? 1'h1 : ack_o; // @[spi.scala 165:59:@3592.6]
  assign _GEN_10 = ack_o ? 1'h0 : _GEN_9; // @[spi.scala 163:15:@3585.4]
  assign _T_168 = ~ io_wbs_m2s_we; // @[spi.scala 172:35:@3601.6]
  assign _T_169 = io_wbs_m2s_stb & _T_168; // @[spi.scala 172:30:@3602.6]
  assign _GEN_11 = _T_169 ? 1'h1 : read_wait_done; // @[spi.scala 172:43:@3603.6]
  assign _GEN_12 = ack_o ? 1'h0 : _GEN_11; // @[spi.scala 170:15:@3596.4]
  assign _T_182 = n_status == 3'h1; // @[spi.scala 186:27:@3618.6]
  assign _GEN_13 = _T_182 ? 1'h0 : pending_data; // @[spi.scala 186:40:@3619.6]
  assign _GEN_14 = _T_129 ? 1'h1 : _GEN_13; // @[spi.scala 184:32:@3614.4]
  assign _T_188 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 192:78:@3625.6]
  assign _T_189 = sel_reg_control ? reg_control : _T_188; // @[spi.scala 192:44:@3626.6]
  assign _T_190 = sel_reg_status ? reg_status : _T_189; // @[spi.scala 192:12:@3627.6]
  assign _T_191 = sel_reg_tx ? reg_txdata : _T_190; // @[spi.scala 191:49:@3628.6]
  assign _T_192 = sel_reg_rx ? reg_rxdata : _T_191; // @[spi.scala 191:21:@3629.6]
  assign _GEN_15 = rd_en ? _T_192 : rd_data; // @[spi.scala 190:18:@3622.4]
  assign _T_193 = wr_en & sel_reg_ssmask; // @[spi.scala 196:16:@3633.4]
  assign _GEN_16 = _T_193 ? _T_146 : reg_ssmask; // @[spi.scala 196:35:@3634.4]
  assign _T_196 = n_status == 3'h3; // @[spi.scala 212:21:@3640.4]
  assign _T_198 = clock_cnt == 5'h3; // @[spi.scala 212:49:@3641.4]
  assign _T_199 = _T_196 & _T_198; // @[spi.scala 212:35:@3642.4]
  assign _T_200 = ~ sclk_r; // @[spi.scala 213:18:@3644.6]
  assign _GEN_17 = _T_199 ? _T_200 : sclk_r; // @[spi.scala 212:67:@3643.4]
  assign _T_204 = 1'h0 == sclk_r; // @[spi.scala 219:59:@3650.4]
  assign _T_205 = _T_198 & _T_204; // @[spi.scala 219:39:@3651.4]
  assign _T_207 = _T_205 & _T_196; // @[spi.scala 219:71:@3653.4]
  assign _T_211 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3661.8]
  assign _GEN_19 = _T_207 ? _T_211 : {{1'd0}, rx_shift_data}; // @[spi.scala 219:99:@3654.4]
  assign _T_212 = p_status == 3'h3; // @[spi.scala 228:20:@3665.4]
  assign _T_213 = n_status != 3'h3; // @[spi.scala 228:47:@3666.4]
  assign _T_214 = _T_212 & _T_213; // @[spi.scala 228:34:@3667.4]
  assign _GEN_20 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 230:33:@3672.6]
  assign _GEN_21 = _T_214 ? 1'h1 : _GEN_20; // @[spi.scala 228:62:@3668.4]
  assign _T_219 = n_status == 3'h0; // @[spi.scala 234:49:@3676.4]
  assign _T_220 = _T_198 | _T_219; // @[spi.scala 234:36:@3677.4]
  assign _T_223 = clock_cnt + 5'h1; // @[spi.scala 237:30:@3682.6]
  assign _T_224 = clock_cnt + 5'h1; // @[spi.scala 237:30:@3683.6]
  assign _GEN_22 = _T_220 ? 5'h0 : _T_224; // @[spi.scala 234:63:@3678.4]
  assign _GEN_23 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 246:26:@3694.6]
  assign _T_237 = n_status == 3'h2; // @[spi.scala 257:27:@3713.8]
  assign _T_241 = data_cnt == 6'h1; // @[spi.scala 258:53:@3716.10]
  assign _T_242 = _T_198 & _T_241; // @[spi.scala 258:40:@3717.10]
  assign _GEN_25 = _T_242 ? 3'h3 : 3'h2; // @[spi.scala 258:76:@3718.10]
  assign _T_246 = data_cnt == 6'h7; // @[spi.scala 264:53:@3729.12]
  assign _T_247 = _T_198 & _T_246; // @[spi.scala 264:40:@3730.12]
  assign _T_250 = _T_247 & sclk_r; // @[spi.scala 264:69:@3732.12]
  assign _GEN_26 = _T_250 ? 3'h4 : 3'h3; // @[spi.scala 264:105:@3733.12]
  assign _T_251 = n_status == 3'h4; // @[spi.scala 269:27:@3741.12]
  assign _GEN_28 = _T_198 ? 3'h5 : n_status; // @[spi.scala 270:39:@3744.14]
  assign _T_255 = n_status == 3'h5; // @[spi.scala 277:27:@3754.14]
  assign _T_259 = data_cnt == 6'h2; // @[spi.scala 278:53:@3757.16]
  assign _T_260 = _T_198 & _T_259; // @[spi.scala 278:40:@3758.16]
  assign _GEN_29 = _T_260 ? 3'h0 : 3'h5; // @[spi.scala 278:77:@3759.16]
  assign _GEN_30 = _T_255 ? _GEN_29 : 3'h0; // @[spi.scala 277:44:@3755.14]
  assign _GEN_31 = _T_251 ? _GEN_28 : _GEN_30; // @[spi.scala 269:46:@3742.12]
  assign _GEN_32 = _T_196 ? _GEN_26 : _GEN_31; // @[spi.scala 263:41:@3727.10]
  assign _GEN_33 = _T_237 ? _GEN_25 : _GEN_32; // @[spi.scala 257:40:@3714.8]
  assign _GEN_34 = _T_182 ? 3'h2 : _GEN_33; // @[spi.scala 251:40:@3703.6]
  assign _GEN_35 = _T_219 ? _GEN_23 : _GEN_34; // @[spi.scala 245:32:@3693.4]
  assign _T_264 = _T_237 & _T_198; // @[spi.scala 287:32:@3771.4]
  assign _T_267 = _T_264 & _T_241; // @[spi.scala 287:63:@3773.4]
  assign _T_274 = _T_199 & _T_246; // @[spi.scala 289:73:@3782.6]
  assign _T_277 = _T_274 & sclk_r; // @[spi.scala 289:102:@3784.6]
  assign _T_282 = _T_255 & _T_198; // @[spi.scala 291:45:@3791.8]
  assign _T_285 = _T_282 & _T_259; // @[spi.scala 291:76:@3793.8]
  assign _T_299 = _T_199 & sclk_r; // @[spi.scala 293:133:@3806.10]
  assign _T_300 = _T_264 | _T_299; // @[spi.scala 293:74:@3807.10]
  assign _T_305 = _T_300 | _T_282; // @[spi.scala 293:174:@3811.10]
  assign _T_307 = data_cnt + 6'h1; // @[spi.scala 294:28:@3813.12]
  assign _T_308 = data_cnt + 6'h1; // @[spi.scala 294:28:@3814.12]
  assign _GEN_36 = _T_305 ? _T_308 : data_cnt; // @[spi.scala 293:238:@3812.10]
  assign _GEN_37 = _T_285 ? 6'h0 : _GEN_36; // @[spi.scala 291:113:@3794.8]
  assign _GEN_38 = _T_277 ? 6'h0 : _GEN_37; // @[spi.scala 289:138:@3785.6]
  assign _GEN_39 = _T_267 ? 6'h0 : _GEN_38; // @[spi.scala 287:99:@3774.4]
  assign _T_329 = reg_txdata[7]; // @[spi.scala 309:72:@3839.6]
  assign _T_336 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3844.6]
  assign _T_349 = tx_shift_data[7]; // @[spi.scala 313:80:@3858.10]
  assign _T_356 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3863.10]
  assign _GEN_43 = wait_one_tick_done ? _T_349 : mosi_r; // @[spi.scala 312:32:@3856.8]
  assign _GEN_44 = wait_one_tick_done ? _T_356 : {{1'd0}, tx_shift_data}; // @[spi.scala 312:32:@3856.8]
  assign _GEN_45 = _T_299 ? _GEN_43 : mosi_r; // @[spi.scala 311:114:@3855.6]
  assign _GEN_46 = _T_299 ? _GEN_44 : {{1'd0}, tx_shift_data}; // @[spi.scala 311:114:@3855.6]
  assign _GEN_47 = _T_237 ? _T_329 : _GEN_45; // @[spi.scala 308:37:@3837.4]
  assign _GEN_48 = _T_237 ? _T_336 : _GEN_46; // @[spi.scala 308:37:@3837.4]
  assign _GEN_49 = _T_129 ? 1'h0 : bit_trdy; // @[spi.scala 321:39:@3875.6]
  assign _GEN_50 = _T_196 ? 1'h1 : _GEN_49; // @[spi.scala 319:36:@3870.4]
  assign _T_363 = bit_trdy == 1'h0; // @[spi.scala 325:12:@3878.4]
  assign _T_364 = _T_363 & wr_en; // @[spi.scala 325:22:@3879.4]
  assign _T_365 = _T_364 & sel_reg_tx; // @[spi.scala 325:31:@3880.4]
  assign _T_367 = wr_en & sel_reg_status; // @[spi.scala 327:24:@3885.6]
  assign _GEN_51 = _T_367 ? 1'h0 : bit_toe; // @[spi.scala 327:43:@3886.6]
  assign _GEN_52 = _T_365 ? 1'h1 : _GEN_51; // @[spi.scala 325:46:@3881.4]
  assign _T_372 = _T_251 & _T_198; // @[spi.scala 331:40:@3891.4]
  assign _GEN_53 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 332:22:@3893.6]
  assign _GEN_54 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 332:22:@3893.6]
  assign _T_375 = rd_en & sel_reg_rx; // @[spi.scala 337:24:@3901.6]
  assign _GEN_55 = _T_375 ? 1'h0 : bit_rrdy; // @[spi.scala 337:39:@3902.6]
  assign _GEN_56 = _T_375 ? 1'h0 : bit_roe; // @[spi.scala 337:39:@3902.6]
  assign _GEN_57 = _T_372 ? _GEN_53 : _GEN_56; // @[spi.scala 331:72:@3892.4]
  assign _GEN_58 = _T_372 ? _GEN_54 : _GEN_55; // @[spi.scala 331:72:@3892.4]
  assign _T_378 = n_status != 3'h0; // @[spi.scala 342:21:@3906.4]
  assign _T_379 = _T_378 | pending_data; // @[spi.scala 342:34:@3907.4]
  assign _GEN_59 = _T_379 ? 1'h0 : 1'h1; // @[spi.scala 342:51:@3908.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 209:13:@3639.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 215:16:@3647.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 317:15:@3868.4]
  assign io_spi_cs_en = bit_en_io; // @[spi.scala 154:18:@3573.4]
  assign io_spi_clk_en = bit_en_io; // @[spi.scala 155:18:@3574.4]
  assign io_spi_mosi_en = bit_en_io; // @[spi.scala 156:18:@3575.4]
  assign io_spi_intr = _T_158 | _T_159; // @[spi.scala 158:14:@3584.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 168:15:@3595.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 194:18:@3632.4]
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
  bit_en_io = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  bit_toe = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  bit_roe = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  bit_trdy = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  bit_rrdy = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  bit_tmt = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  bit_e = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  clock_cnt = _RAND_24[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  data_cnt = _RAND_25[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  pending_data = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  n_status = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  p_status = _RAND_28[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  wait_one_tick_done = _RAND_29[0:0];
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
        if (_T_164) begin
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
      if (_T_199) begin
        sclk_r <= _T_200;
      end
    end
    if (reset) begin
      mosi_r <= 1'h0;
    end else begin
      if (_T_237) begin
        mosi_r <= _T_329;
      end else begin
        if (_T_299) begin
          if (wait_one_tick_done) begin
            mosi_r <= _T_349;
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
        if (_T_169) begin
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
      if (_T_130) begin
        reg_txdata <= latch_s_data;
      end
    end
    if (reset) begin
      reg_ssmask <= 1'h0;
    end else begin
      if (_T_193) begin
        reg_ssmask <= _T_146;
      end
    end
    if (reset) begin
      rx_shift_data <= 8'h0;
    end else begin
      rx_shift_data <= _GEN_19[7:0];
    end
    if (reset) begin
      tx_shift_data <= 8'h0;
    end else begin
      tx_shift_data <= _GEN_48[7:0];
    end
    if (reset) begin
      rx_latch_flag <= 1'h0;
    end else begin
      if (_T_214) begin
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
      if (_T_145) begin
        bit_iroe <= _T_146;
      end
    end
    if (reset) begin
      bit_itoe <= 1'h0;
    end else begin
      if (_T_145) begin
        bit_itoe <= _T_147;
      end
    end
    if (reset) begin
      bit_itrdy <= 1'h0;
    end else begin
      if (_T_145) begin
        bit_itrdy <= _T_148;
      end
    end
    if (reset) begin
      bit_irrdy <= 1'h0;
    end else begin
      if (_T_145) begin
        bit_irrdy <= _T_149;
      end
    end
    if (reset) begin
      bit_ie <= 1'h0;
    end else begin
      if (_T_145) begin
        bit_ie <= _T_150;
      end
    end
    if (reset) begin
      bit_sso <= 1'h1;
    end else begin
      if (_T_145) begin
        bit_sso <= _T_152;
      end
    end
    if (reset) begin
      bit_en_io <= 1'h1;
    end else begin
      if (_T_145) begin
        bit_en_io <= _T_151;
      end
    end
    if (reset) begin
      bit_toe <= 1'h0;
    end else begin
      if (_T_365) begin
        bit_toe <= 1'h1;
      end else begin
        if (_T_367) begin
          bit_toe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_roe <= 1'h0;
    end else begin
      if (_T_372) begin
        if (bit_rrdy) begin
          bit_roe <= 1'h1;
        end
      end else begin
        if (_T_375) begin
          bit_roe <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_trdy <= 1'h1;
    end else begin
      if (_T_196) begin
        bit_trdy <= 1'h1;
      end else begin
        if (_T_129) begin
          bit_trdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_rrdy <= 1'h0;
    end else begin
      if (_T_372) begin
        if (!(bit_rrdy)) begin
          bit_rrdy <= 1'h1;
        end
      end else begin
        if (_T_375) begin
          bit_rrdy <= 1'h0;
        end
      end
    end
    if (reset) begin
      bit_tmt <= 1'h1;
    end else begin
      if (_T_379) begin
        bit_tmt <= 1'h0;
      end else begin
        bit_tmt <= 1'h1;
      end
    end
    if (reset) begin
      bit_e <= 1'h0;
    end else begin
      bit_e <= _T_131;
    end
    if (reset) begin
      clock_cnt <= 5'h0;
    end else begin
      if (_T_220) begin
        clock_cnt <= 5'h0;
      end else begin
        clock_cnt <= _T_224;
      end
    end
    if (reset) begin
      data_cnt <= 6'h0;
    end else begin
      if (_T_267) begin
        data_cnt <= 6'h0;
      end else begin
        if (_T_277) begin
          data_cnt <= 6'h0;
        end else begin
          if (_T_285) begin
            data_cnt <= 6'h0;
          end else begin
            if (_T_305) begin
              data_cnt <= _T_308;
            end
          end
        end
      end
    end
    if (reset) begin
      pending_data <= 1'h0;
    end else begin
      if (_T_129) begin
        pending_data <= 1'h1;
      end else begin
        if (_T_182) begin
          pending_data <= 1'h0;
        end
      end
    end
    if (reset) begin
      n_status <= 3'h0;
    end else begin
      if (_T_219) begin
        if (pending_data) begin
          n_status <= 3'h1;
        end else begin
          n_status <= 3'h0;
        end
      end else begin
        if (_T_182) begin
          n_status <= 3'h2;
        end else begin
          if (_T_237) begin
            if (_T_242) begin
              n_status <= 3'h3;
            end else begin
              n_status <= 3'h2;
            end
          end else begin
            if (_T_196) begin
              if (_T_250) begin
                n_status <= 3'h4;
              end else begin
                n_status <= 3'h3;
              end
            end else begin
              if (_T_251) begin
                if (_T_198) begin
                  n_status <= 3'h5;
                end
              end else begin
                if (_T_255) begin
                  if (_T_260) begin
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
module WB_InterConnect( // @[:@3915.2]
  input         clock, // @[:@3916.4]
  input         reset, // @[:@3917.4]
  input  [31:0] io_dbus_addr, // @[:@3918.4]
  input  [31:0] io_dbus_wdata, // @[:@3918.4]
  output [31:0] io_dbus_rdata, // @[:@3918.4]
  input         io_dbus_rd_en, // @[:@3918.4]
  input         io_dbus_wr_en, // @[:@3918.4]
  input  [1:0]  io_dbus_st_type, // @[:@3918.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3918.4]
  output        io_dbus_valid, // @[:@3918.4]
  input  [31:0] io_ibus_addr, // @[:@3918.4]
  output [31:0] io_ibus_inst, // @[:@3918.4]
  output        io_ibus_valid, // @[:@3918.4]
  output [8:0]  io_imem_io_addr, // @[:@3918.4]
  input  [31:0] io_imem_io_rdata, // @[:@3918.4]
  output [31:0] io_imem_io_wdata, // @[:@3918.4]
  output        io_imem_io_wr_en, // @[:@3918.4]
  output        io_imem_io_cs, // @[:@3918.4]
  output [3:0]  io_imem_io_st_type, // @[:@3918.4]
  output [7:0]  io_dmem_io_addr, // @[:@3918.4]
  output [31:0] io_dmem_io_wdata, // @[:@3918.4]
  input  [31:0] io_dmem_io_rdata, // @[:@3918.4]
  output        io_dmem_io_cs, // @[:@3918.4]
  output        io_dmem_io_wr_en, // @[:@3918.4]
  output [3:0]  io_dmem_io_st_type, // @[:@3918.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3918.4]
  output [31:0] io_wbm_m2s_data, // @[:@3918.4]
  output        io_wbm_m2s_we, // @[:@3918.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3918.4]
  output        io_wbm_m2s_stb, // @[:@3918.4]
  output        io_uart_tx, // @[:@3918.4]
  output        io_uart_txen, // @[:@3918.4]
  input         io_uart_rx, // @[:@3918.4]
  output        io_uart_irq, // @[:@3918.4]
  output        io_spi_cs, // @[:@3918.4]
  output        io_spi_clk, // @[:@3918.4]
  output        io_spi_mosi, // @[:@3918.4]
  input         io_spi_miso, // @[:@3918.4]
  output        io_spi_irq, // @[:@3918.4]
  output        io_spi_cs_en, // @[:@3918.4]
  output        io_spi_clk_en, // @[:@3918.4]
  output        io_spi_mosi_en, // @[:@3918.4]
  input         io_motor_ack_i, // @[:@3918.4]
  input  [31:0] io_motor_data_i, // @[:@3918.4]
  output        io_motor_addr_sel // @[:@3918.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_reset; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [7:0] dmem_io_dmem_io_addr; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [31:0] dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [31:0] dmem_io_dmem_io_rdata; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_io_dmem_io_cs; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 78:24:@3920.4]
  wire [3:0] dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 78:24:@3920.4]
  wire  imem_clock; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_reset; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [8:0] imem_io_imem_io_addr; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_imem_io_rdata; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] imem_io_imem_io_wdata; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_imem_io_wr_en; // @[wb_interconnect.scala 79:24:@3923.4]
  wire  imem_io_imem_io_cs; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [3:0] imem_io_imem_io_st_type; // @[wb_interconnect.scala 79:24:@3923.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 80:24:@3926.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 80:24:@3926.4]
  wire  uart_clock; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_reset; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_tx_en; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 81:24:@3929.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 81:24:@3929.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 81:24:@3929.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 81:24:@3929.4]
  wire  spi_clock; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_reset; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_cs_en; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_clk_en; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_mosi_en; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 82:24:@3932.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 82:24:@3932.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 82:24:@3932.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 82:24:@3932.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 82:24:@3932.4]
  wire [3:0] address; // @[wb_interconnect.scala 92:50:@3964.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 93:35:@3965.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 94:35:@3966.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 95:35:@3967.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 96:35:@3968.4]
  wire  motor_addr_match; // @[wb_interconnect.scala 97:35:@3969.4]
  reg  imem_sel; // @[wb_interconnect.scala 122:22:@4001.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 123:22:@4002.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 124:22:@4003.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 125:22:@4004.4]
  reg [31:0] _RAND_3;
  reg  motor_sel; // @[wb_interconnect.scala 126:22:@4005.4]
  reg [31:0] _RAND_4;
  wire [31:0] _T_116; // @[wb_interconnect.scala 138:41:@4016.4]
  wire [31:0] _T_117; // @[wb_interconnect.scala 137:39:@4017.4]
  wire [31:0] _T_118; // @[wb_interconnect.scala 136:37:@4018.4]
  wire [31:0] _T_119; // @[wb_interconnect.scala 135:35:@4019.4]
  wire  _T_122; // @[wb_interconnect.scala 143:41:@4022.4]
  wire  _T_123; // @[wb_interconnect.scala 142:39:@4023.4]
  wire  _T_124; // @[wb_interconnect.scala 141:37:@4024.4]
  wire  _T_125; // @[wb_interconnect.scala 140:35:@4025.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 78:24:@3920.4]
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
    .io_dmem_io_cs(dmem_io_dmem_io_cs),
    .io_dmem_io_wr_en(dmem_io_dmem_io_wr_en),
    .io_dmem_io_st_type(dmem_io_dmem_io_st_type)
  );
  IMem_Interface imem ( // @[wb_interconnect.scala 79:24:@3923.4]
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
    .io_imem_io_wr_en(imem_io_imem_io_wr_en),
    .io_imem_io_cs(imem_io_imem_io_cs),
    .io_imem_io_st_type(imem_io_imem_io_st_type)
  );
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 80:24:@3926.4]
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
  UART uart ( // @[wb_interconnect.scala 81:24:@3929.4]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_uart_select(uart_io_uart_select),
    .io_txd(uart_io_txd),
    .io_tx_en(uart_io_tx_en),
    .io_rxd(uart_io_rxd),
    .io_uartInt(uart_io_uartInt),
    .io_wbs_m2s_addr(uart_io_wbs_m2s_addr),
    .io_wbs_m2s_data(uart_io_wbs_m2s_data),
    .io_wbs_m2s_we(uart_io_wbs_m2s_we),
    .io_wbs_m2s_stb(uart_io_wbs_m2s_stb),
    .io_wbs_ack_o(uart_io_wbs_ack_o),
    .io_wbs_data_o(uart_io_wbs_data_o)
  );
  SPI spi ( // @[wb_interconnect.scala 82:24:@3932.4]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_spi_select(spi_io_spi_select),
    .io_spi_cs(spi_io_spi_cs),
    .io_spi_clk(spi_io_spi_clk),
    .io_spi_mosi(spi_io_spi_mosi),
    .io_spi_cs_en(spi_io_spi_cs_en),
    .io_spi_clk_en(spi_io_spi_clk_en),
    .io_spi_mosi_en(spi_io_spi_mosi_en),
    .io_spi_miso(spi_io_spi_miso),
    .io_spi_intr(spi_io_spi_intr),
    .io_wbs_m2s_addr(spi_io_wbs_m2s_addr),
    .io_wbs_m2s_data(spi_io_wbs_m2s_data),
    .io_wbs_m2s_we(spi_io_wbs_m2s_we),
    .io_wbs_m2s_stb(spi_io_wbs_m2s_stb),
    .io_wbs_ack_o(spi_io_wbs_ack_o),
    .io_wbs_data_o(spi_io_wbs_data_o)
  );
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 92:50:@3964.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 93:35:@3965.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 94:35:@3966.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 95:35:@3967.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 96:35:@3968.4]
  assign motor_addr_match = address == 4'h4; // @[wb_interconnect.scala 97:35:@3969.4]
  assign _T_116 = motor_sel ? io_motor_data_i : 32'h0; // @[wb_interconnect.scala 138:41:@4016.4]
  assign _T_117 = spi_sel ? spi_io_wbs_data_o : _T_116; // @[wb_interconnect.scala 137:39:@4017.4]
  assign _T_118 = uart_sel ? uart_io_wbs_data_o : _T_117; // @[wb_interconnect.scala 136:37:@4018.4]
  assign _T_119 = imem_sel ? imem_io_wbs_data_o : _T_118; // @[wb_interconnect.scala 135:35:@4019.4]
  assign _T_122 = motor_sel ? io_motor_ack_i : 1'h0; // @[wb_interconnect.scala 143:41:@4022.4]
  assign _T_123 = spi_sel ? spi_io_wbs_ack_o : _T_122; // @[wb_interconnect.scala 142:39:@4023.4]
  assign _T_124 = uart_sel ? uart_io_wbs_ack_o : _T_123; // @[wb_interconnect.scala 141:37:@4024.4]
  assign _T_125 = imem_sel ? imem_io_wbs_ack_o : _T_124; // @[wb_interconnect.scala 140:35:@4025.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 85:20:@3940.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 85:20:@3935.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 86:20:@3944.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 86:20:@3943.4]
  assign io_imem_io_addr = imem_io_imem_io_addr; // @[wb_interconnect.scala 88:20:@3954.4]
  assign io_imem_io_wdata = imem_io_imem_io_wdata; // @[wb_interconnect.scala 88:20:@3952.4]
  assign io_imem_io_wr_en = imem_io_imem_io_wr_en; // @[wb_interconnect.scala 88:20:@3951.4]
  assign io_imem_io_cs = imem_io_imem_io_cs; // @[wb_interconnect.scala 88:20:@3950.4]
  assign io_imem_io_st_type = imem_io_imem_io_st_type; // @[wb_interconnect.scala 88:20:@3949.4]
  assign io_dmem_io_addr = dmem_io_dmem_io_addr; // @[wb_interconnect.scala 89:20:@3963.4]
  assign io_dmem_io_wdata = dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 89:20:@3962.4]
  assign io_dmem_io_cs = dmem_io_dmem_io_cs; // @[wb_interconnect.scala 89:20:@3960.4]
  assign io_dmem_io_wr_en = dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 89:20:@3959.4]
  assign io_dmem_io_st_type = dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 89:20:@3958.4]
  assign io_wbm_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 119:14:@4000.4]
  assign io_wbm_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 119:14:@3999.4]
  assign io_wbm_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 119:14:@3998.4]
  assign io_wbm_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 119:14:@3997.4]
  assign io_wbm_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 119:14:@3996.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 149:24:@4030.4]
  assign io_uart_txen = uart_io_tx_en; // @[wb_interconnect.scala 150:24:@4031.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 151:24:@4032.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 156:24:@4035.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 157:24:@4036.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 158:24:@4037.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 159:24:@4038.4]
  assign io_spi_cs_en = spi_io_spi_cs_en; // @[wb_interconnect.scala 161:24:@4039.4]
  assign io_spi_clk_en = spi_io_spi_clk_en; // @[wb_interconnect.scala 162:24:@4040.4]
  assign io_spi_mosi_en = spi_io_spi_mosi_en; // @[wb_interconnect.scala 163:24:@4041.4]
  assign io_motor_addr_sel = address == 4'h4; // @[wb_interconnect.scala 100:21:@3970.4]
  assign dmem_clock = clock; // @[:@3921.4]
  assign dmem_reset = reset; // @[:@3922.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 105:20:@3976.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 105:20:@3975.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 105:20:@3974.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 105:20:@3973.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 105:20:@3972.4]
  assign dmem_io_dmem_io_rdata = io_dmem_io_rdata; // @[wb_interconnect.scala 89:20:@3961.4]
  assign imem_clock = clock; // @[:@3924.4]
  assign imem_reset = reset; // @[:@3925.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 86:20:@3945.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 109:20:@3982.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 109:20:@3981.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 109:20:@3980.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 109:20:@3979.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 109:20:@3978.4]
  assign imem_io_imem_io_rdata = io_imem_io_rdata; // @[wb_interconnect.scala 88:20:@3953.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 85:20:@3942.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 85:20:@3941.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 85:20:@3939.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 85:20:@3938.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 85:20:@3937.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 85:20:@3936.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_125; // @[wb_interconnect.scala 139:26:@4027.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_119; // @[wb_interconnect.scala 134:26:@4021.4]
  assign uart_clock = clock; // @[:@3930.4]
  assign uart_reset = reset; // @[:@3931.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 147:24:@4028.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 148:24:@4029.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 112:20:@3988.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 112:20:@3987.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 112:20:@3986.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 112:20:@3984.4]
  assign spi_clock = clock; // @[:@3933.4]
  assign spi_reset = reset; // @[:@3934.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 154:24:@4033.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 155:24:@4034.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 115:19:@3994.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 115:19:@3993.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 115:19:@3992.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 115:19:@3990.4]
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