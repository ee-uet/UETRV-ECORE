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

module DMem_Interface( // @[:@1908.2]
  input         clock, // @[:@1909.4]
  input         reset, // @[:@1910.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@1911.4]
  input  [31:0] io_wbs_m2s_data, // @[:@1911.4]
  input         io_wbs_m2s_we, // @[:@1911.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@1911.4]
  input         io_wbs_m2s_stb, // @[:@1911.4]
  output        io_wbs_ack_o, // @[:@1911.4]
  output [31:0] io_wbs_data_o, // @[:@1911.4]
  output [8:0]  io_dmem_io_addr, // @[:@1911.4]
  output [31:0] io_dmem_io_wdata, // @[:@1911.4]
  input  [31:0] io_dmem_io_rdata, // @[:@1911.4]
  output        io_dmem_io_cs, // @[:@1911.4]
  output        io_dmem_io_wr_en, // @[:@1911.4]
  output [3:0]  io_dmem_io_st_type // @[:@1911.4]
);
  wire [3:0] _T_47; // @[dmem_interface.scala 50:41:@1913.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 50:79:@1914.4]
  wire  dmem_select; // @[dmem_interface.scala 52:41:@1915.4]
  wire  _T_56; // @[dmem_interface.scala 53:26:@1916.4]
  wire  _T_58; // @[dmem_interface.scala 58:42:@1921.4]
  reg  ack2; // @[dmem_interface.scala 63:28:@1926.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 64:49:@1928.4]
  wire  _GEN_0; // @[dmem_interface.scala 66:21:@1929.4]
  reg  ack; // @[dmem_interface.scala 70:28:@1933.4]
  reg [31:0] _RAND_1;
  reg [3:0] wb_select; // @[dmem_interface.scala 78:24:@1940.4]
  reg [31:0] _RAND_2;
  wire  _T_72; // @[dmem_interface.scala 81:18:@1942.4]
  wire [7:0] _T_73; // @[dmem_interface.scala 82:24:@1944.6]
  wire  _T_74; // @[dmem_interface.scala 83:24:@1948.6]
  wire [7:0] _T_75; // @[dmem_interface.scala 84:24:@1950.8]
  wire  _T_76; // @[dmem_interface.scala 85:24:@1954.8]
  wire [7:0] _T_77; // @[dmem_interface.scala 86:24:@1956.10]
  wire  _T_78; // @[dmem_interface.scala 87:24:@1960.10]
  wire [7:0] _T_79; // @[dmem_interface.scala 88:24:@1962.12]
  wire  _T_80; // @[dmem_interface.scala 89:24:@1966.12]
  wire [15:0] _T_81; // @[dmem_interface.scala 90:24:@1968.14]
  wire  _T_82; // @[dmem_interface.scala 91:24:@1972.14]
  wire [15:0] _T_83; // @[dmem_interface.scala 92:24:@1974.16]
  wire [31:0] _GEN_1; // @[dmem_interface.scala 91:54:@1973.14]
  wire [31:0] _GEN_2; // @[dmem_interface.scala 89:52:@1967.12]
  wire [31:0] _GEN_3; // @[dmem_interface.scala 87:52:@1961.10]
  wire [31:0] _GEN_4; // @[dmem_interface.scala 85:52:@1955.8]
  wire [31:0] _GEN_5; // @[dmem_interface.scala 83:52:@1949.6]
  wire [31:0] rdata; // @[dmem_interface.scala 81:45:@1943.4]
  reg  rd_resp; // @[dmem_interface.scala 97:24:@1981.4]
  reg [31:0] _RAND_3;
  assign _T_47 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 50:41:@1913.4]
  assign dmem_addr_match = _T_47 == 4'h1; // @[dmem_interface.scala 50:79:@1914.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 52:41:@1915.4]
  assign _T_56 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 53:26:@1916.4]
  assign _T_58 = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 58:42:@1921.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 64:49:@1928.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 66:21:@1929.4]
  assign _T_72 = wb_select == 4'h1; // @[dmem_interface.scala 81:18:@1942.4]
  assign _T_73 = io_dmem_io_rdata[7:0]; // @[dmem_interface.scala 82:24:@1944.6]
  assign _T_74 = wb_select == 4'h2; // @[dmem_interface.scala 83:24:@1948.6]
  assign _T_75 = io_dmem_io_rdata[15:8]; // @[dmem_interface.scala 84:24:@1950.8]
  assign _T_76 = wb_select == 4'h4; // @[dmem_interface.scala 85:24:@1954.8]
  assign _T_77 = io_dmem_io_rdata[23:16]; // @[dmem_interface.scala 86:24:@1956.10]
  assign _T_78 = wb_select == 4'h8; // @[dmem_interface.scala 87:24:@1960.10]
  assign _T_79 = io_dmem_io_rdata[31:24]; // @[dmem_interface.scala 88:24:@1962.12]
  assign _T_80 = wb_select == 4'h3; // @[dmem_interface.scala 89:24:@1966.12]
  assign _T_81 = io_dmem_io_rdata[15:0]; // @[dmem_interface.scala 90:24:@1968.14]
  assign _T_82 = wb_select == 4'hc; // @[dmem_interface.scala 91:24:@1972.14]
  assign _T_83 = io_dmem_io_rdata[31:16]; // @[dmem_interface.scala 92:24:@1974.16]
  assign _GEN_1 = _T_82 ? {{16'd0}, _T_83} : io_dmem_io_rdata; // @[dmem_interface.scala 91:54:@1973.14]
  assign _GEN_2 = _T_80 ? {{16'd0}, _T_81} : _GEN_1; // @[dmem_interface.scala 89:52:@1967.12]
  assign _GEN_3 = _T_78 ? {{24'd0}, _T_79} : _GEN_2; // @[dmem_interface.scala 87:52:@1961.10]
  assign _GEN_4 = _T_76 ? {{24'd0}, _T_77} : _GEN_3; // @[dmem_interface.scala 85:52:@1955.8]
  assign _GEN_5 = _T_74 ? {{24'd0}, _T_75} : _GEN_4; // @[dmem_interface.scala 83:52:@1949.6]
  assign rdata = _T_72 ? {{24'd0}, _T_73} : _GEN_5; // @[dmem_interface.scala 81:45:@1943.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 72:18:@1937.4]
  assign io_wbs_data_o = rd_resp ? rdata : 32'h0; // @[dmem_interface.scala 99:18:@1984.4]
  assign io_dmem_io_addr = io_wbs_m2s_addr[10:2]; // @[dmem_interface.scala 56:23:@1919.4]
  assign io_dmem_io_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 57:23:@1920.4]
  assign io_dmem_io_cs = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 59:23:@1924.4]
  assign io_dmem_io_wr_en = _T_58 == 1'h0; // @[dmem_interface.scala 58:23:@1923.4]
  assign io_dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 60:23:@1925.4]
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
    rd_resp <= _T_56 & dmem_select;
  end
endmodule
module BMem( // @[:@1986.2]
  input         clock, // @[:@1987.4]
  input         reset, // @[:@1988.4]
  input  [31:0] io_bmem_addr, // @[:@1989.4]
  output [31:0] io_bmem_rdata // @[:@1989.4]
);
  wire [9:0] _T_9; // @[bmemory.scala 24:26:@1991.4]
  wire [9:0] addr; // @[bmemory.scala 24:33:@1992.4]
  reg [31:0] bmem_data; // @[bmemory.scala 25:26:@1993.4]
  reg [31:0] _RAND_0;
  wire  _T_14; // @[Conditional.scala 37:30:@1994.4]
  wire  _T_17; // @[Conditional.scala 37:30:@1999.6]
  wire  _T_20; // @[Conditional.scala 37:30:@2004.8]
  wire  _T_23; // @[Conditional.scala 37:30:@2009.10]
  wire  _T_26; // @[Conditional.scala 37:30:@2014.12]
  wire  _T_29; // @[Conditional.scala 37:30:@2019.14]
  wire  _T_32; // @[Conditional.scala 37:30:@2024.16]
  wire  _T_35; // @[Conditional.scala 37:30:@2029.18]
  wire  _T_38; // @[Conditional.scala 37:30:@2034.20]
  wire  _T_41; // @[Conditional.scala 37:30:@2039.22]
  wire  _T_44; // @[Conditional.scala 37:30:@2044.24]
  wire  _T_47; // @[Conditional.scala 37:30:@2049.26]
  wire  _T_50; // @[Conditional.scala 37:30:@2054.28]
  wire  _T_53; // @[Conditional.scala 37:30:@2059.30]
  wire  _T_56; // @[Conditional.scala 37:30:@2064.32]
  wire  _T_59; // @[Conditional.scala 37:30:@2069.34]
  wire  _T_62; // @[Conditional.scala 37:30:@2074.36]
  wire  _T_65; // @[Conditional.scala 37:30:@2079.38]
  wire  _T_68; // @[Conditional.scala 37:30:@2084.40]
  wire  _T_71; // @[Conditional.scala 37:30:@2089.42]
  wire  _T_74; // @[Conditional.scala 37:30:@2094.44]
  wire  _T_77; // @[Conditional.scala 37:30:@2099.46]
  wire  _T_80; // @[Conditional.scala 37:30:@2104.48]
  wire  _T_83; // @[Conditional.scala 37:30:@2109.50]
  wire  _T_86; // @[Conditional.scala 37:30:@2114.52]
  wire  _T_89; // @[Conditional.scala 37:30:@2119.54]
  wire  _T_92; // @[Conditional.scala 37:30:@2124.56]
  wire  _T_95; // @[Conditional.scala 37:30:@2129.58]
  wire  _T_98; // @[Conditional.scala 37:30:@2134.60]
  wire  _T_101; // @[Conditional.scala 37:30:@2139.62]
  wire  _T_104; // @[Conditional.scala 37:30:@2144.64]
  wire  _T_107; // @[Conditional.scala 37:30:@2149.66]
  wire  _T_110; // @[Conditional.scala 37:30:@2154.68]
  wire  _T_113; // @[Conditional.scala 37:30:@2159.70]
  wire  _T_116; // @[Conditional.scala 37:30:@2164.72]
  wire  _T_119; // @[Conditional.scala 37:30:@2169.74]
  wire  _T_122; // @[Conditional.scala 37:30:@2174.76]
  wire  _T_125; // @[Conditional.scala 37:30:@2179.78]
  wire  _T_128; // @[Conditional.scala 37:30:@2184.80]
  wire  _T_131; // @[Conditional.scala 37:30:@2189.82]
  wire  _T_134; // @[Conditional.scala 37:30:@2194.84]
  wire  _T_137; // @[Conditional.scala 37:30:@2199.86]
  wire  _T_140; // @[Conditional.scala 37:30:@2204.88]
  wire  _T_143; // @[Conditional.scala 37:30:@2209.90]
  wire  _T_146; // @[Conditional.scala 37:30:@2214.92]
  wire  _T_149; // @[Conditional.scala 37:30:@2219.94]
  wire  _T_152; // @[Conditional.scala 37:30:@2224.96]
  wire  _T_155; // @[Conditional.scala 37:30:@2229.98]
  wire  _T_158; // @[Conditional.scala 37:30:@2234.100]
  wire  _T_161; // @[Conditional.scala 37:30:@2239.102]
  wire  _T_164; // @[Conditional.scala 37:30:@2244.104]
  wire  _T_167; // @[Conditional.scala 37:30:@2249.106]
  wire  _T_170; // @[Conditional.scala 37:30:@2254.108]
  wire  _T_173; // @[Conditional.scala 37:30:@2259.110]
  wire  _T_176; // @[Conditional.scala 37:30:@2264.112]
  wire  _T_179; // @[Conditional.scala 37:30:@2269.114]
  wire  _T_182; // @[Conditional.scala 37:30:@2274.116]
  wire  _T_185; // @[Conditional.scala 37:30:@2279.118]
  wire  _T_188; // @[Conditional.scala 37:30:@2284.120]
  wire  _T_191; // @[Conditional.scala 37:30:@2289.122]
  wire  _T_194; // @[Conditional.scala 37:30:@2294.124]
  wire  _T_197; // @[Conditional.scala 37:30:@2299.126]
  wire  _T_200; // @[Conditional.scala 37:30:@2304.128]
  wire  _T_203; // @[Conditional.scala 37:30:@2309.130]
  wire  _T_206; // @[Conditional.scala 37:30:@2314.132]
  wire  _T_209; // @[Conditional.scala 37:30:@2319.134]
  wire  _T_212; // @[Conditional.scala 37:30:@2324.136]
  wire  _T_215; // @[Conditional.scala 37:30:@2329.138]
  wire  _T_218; // @[Conditional.scala 37:30:@2334.140]
  wire  _T_221; // @[Conditional.scala 37:30:@2339.142]
  wire  _T_224; // @[Conditional.scala 37:30:@2344.144]
  wire  _T_227; // @[Conditional.scala 37:30:@2349.146]
  wire  _T_230; // @[Conditional.scala 37:30:@2354.148]
  wire  _T_233; // @[Conditional.scala 37:30:@2359.150]
  wire  _T_236; // @[Conditional.scala 37:30:@2364.152]
  wire  _T_239; // @[Conditional.scala 37:30:@2369.154]
  wire  _T_242; // @[Conditional.scala 37:30:@2374.156]
  wire  _T_245; // @[Conditional.scala 37:30:@2379.158]
  wire  _T_248; // @[Conditional.scala 37:30:@2384.160]
  wire  _T_251; // @[Conditional.scala 37:30:@2389.162]
  wire  _T_254; // @[Conditional.scala 37:30:@2394.164]
  wire  _T_257; // @[Conditional.scala 37:30:@2399.166]
  wire  _T_260; // @[Conditional.scala 37:30:@2404.168]
  wire  _T_263; // @[Conditional.scala 37:30:@2409.170]
  wire  _T_266; // @[Conditional.scala 37:30:@2414.172]
  wire  _T_269; // @[Conditional.scala 37:30:@2419.174]
  wire  _T_272; // @[Conditional.scala 37:30:@2424.176]
  wire  _T_275; // @[Conditional.scala 37:30:@2429.178]
  wire  _T_278; // @[Conditional.scala 37:30:@2434.180]
  wire  _T_281; // @[Conditional.scala 37:30:@2439.182]
  wire  _T_284; // @[Conditional.scala 37:30:@2444.184]
  wire  _T_287; // @[Conditional.scala 37:30:@2449.186]
  wire  _T_290; // @[Conditional.scala 37:30:@2454.188]
  wire  _T_293; // @[Conditional.scala 37:30:@2459.190]
  wire  _T_296; // @[Conditional.scala 37:30:@2464.192]
  wire  _T_299; // @[Conditional.scala 37:30:@2469.194]
  wire  _T_302; // @[Conditional.scala 37:30:@2474.196]
  wire  _T_305; // @[Conditional.scala 37:30:@2479.198]
  wire  _T_308; // @[Conditional.scala 37:30:@2484.200]
  wire  _T_311; // @[Conditional.scala 37:30:@2489.202]
  wire  _T_314; // @[Conditional.scala 37:30:@2494.204]
  wire  _T_317; // @[Conditional.scala 37:30:@2499.206]
  wire  _T_320; // @[Conditional.scala 37:30:@2504.208]
  wire  _T_323; // @[Conditional.scala 37:30:@2509.210]
  wire  _T_326; // @[Conditional.scala 37:30:@2514.212]
  wire  _T_329; // @[Conditional.scala 37:30:@2519.214]
  wire  _T_332; // @[Conditional.scala 37:30:@2524.216]
  wire  _T_335; // @[Conditional.scala 37:30:@2529.218]
  wire  _T_338; // @[Conditional.scala 37:30:@2534.220]
  wire  _T_341; // @[Conditional.scala 37:30:@2539.222]
  wire  _T_344; // @[Conditional.scala 37:30:@2544.224]
  wire  _T_347; // @[Conditional.scala 37:30:@2549.226]
  wire  _T_350; // @[Conditional.scala 37:30:@2554.228]
  wire  _T_353; // @[Conditional.scala 37:30:@2559.230]
  wire  _T_356; // @[Conditional.scala 37:30:@2564.232]
  wire  _T_359; // @[Conditional.scala 37:30:@2569.234]
  wire  _T_362; // @[Conditional.scala 37:30:@2574.236]
  wire  _T_365; // @[Conditional.scala 37:30:@2579.238]
  wire  _T_368; // @[Conditional.scala 37:30:@2584.240]
  wire  _T_371; // @[Conditional.scala 37:30:@2589.242]
  wire  _T_374; // @[Conditional.scala 37:30:@2594.244]
  wire  _T_377; // @[Conditional.scala 37:30:@2599.246]
  wire  _T_380; // @[Conditional.scala 37:30:@2604.248]
  wire  _T_383; // @[Conditional.scala 37:30:@2609.250]
  wire  _T_386; // @[Conditional.scala 37:30:@2614.252]
  wire  _T_389; // @[Conditional.scala 37:30:@2619.254]
  wire  _T_392; // @[Conditional.scala 37:30:@2624.256]
  wire  _T_395; // @[Conditional.scala 37:30:@2629.258]
  wire  _T_398; // @[Conditional.scala 37:30:@2634.260]
  wire  _T_401; // @[Conditional.scala 37:30:@2639.262]
  wire  _T_404; // @[Conditional.scala 37:30:@2644.264]
  wire  _T_407; // @[Conditional.scala 37:30:@2649.266]
  wire  _T_410; // @[Conditional.scala 37:30:@2654.268]
  wire  _T_413; // @[Conditional.scala 37:30:@2659.270]
  wire  _T_416; // @[Conditional.scala 37:30:@2664.272]
  wire  _T_419; // @[Conditional.scala 37:30:@2669.274]
  wire  _T_422; // @[Conditional.scala 37:30:@2674.276]
  wire  _T_425; // @[Conditional.scala 37:30:@2679.278]
  wire  _T_428; // @[Conditional.scala 37:30:@2684.280]
  wire  _T_431; // @[Conditional.scala 37:30:@2689.282]
  wire  _T_434; // @[Conditional.scala 37:30:@2694.284]
  wire  _T_437; // @[Conditional.scala 37:30:@2699.286]
  wire  _T_440; // @[Conditional.scala 37:30:@2704.288]
  wire  _T_443; // @[Conditional.scala 37:30:@2709.290]
  wire  _T_446; // @[Conditional.scala 37:30:@2714.292]
  wire  _T_449; // @[Conditional.scala 37:30:@2719.294]
  wire  _T_452; // @[Conditional.scala 37:30:@2724.296]
  wire  _T_455; // @[Conditional.scala 37:30:@2729.298]
  wire  _T_458; // @[Conditional.scala 37:30:@2734.300]
  wire  _T_461; // @[Conditional.scala 37:30:@2739.302]
  wire  _T_464; // @[Conditional.scala 37:30:@2744.304]
  wire  _T_467; // @[Conditional.scala 37:30:@2749.306]
  wire  _T_470; // @[Conditional.scala 37:30:@2754.308]
  wire  _T_473; // @[Conditional.scala 37:30:@2759.310]
  wire  _T_476; // @[Conditional.scala 37:30:@2764.312]
  wire  _T_479; // @[Conditional.scala 37:30:@2769.314]
  wire  _T_482; // @[Conditional.scala 37:30:@2774.316]
  wire  _T_485; // @[Conditional.scala 37:30:@2779.318]
  wire  _T_488; // @[Conditional.scala 37:30:@2784.320]
  wire  _T_491; // @[Conditional.scala 37:30:@2789.322]
  wire  _T_494; // @[Conditional.scala 37:30:@2794.324]
  wire  _T_497; // @[Conditional.scala 37:30:@2799.326]
  wire  _T_500; // @[Conditional.scala 37:30:@2804.328]
  wire  _T_503; // @[Conditional.scala 37:30:@2809.330]
  wire  _T_506; // @[Conditional.scala 37:30:@2814.332]
  wire  _T_509; // @[Conditional.scala 37:30:@2819.334]
  wire  _T_512; // @[Conditional.scala 37:30:@2824.336]
  wire  _T_515; // @[Conditional.scala 37:30:@2829.338]
  wire  _T_518; // @[Conditional.scala 37:30:@2834.340]
  wire  _T_521; // @[Conditional.scala 37:30:@2839.342]
  wire  _T_524; // @[Conditional.scala 37:30:@2844.344]
  wire  _T_527; // @[Conditional.scala 37:30:@2849.346]
  wire  _T_530; // @[Conditional.scala 37:30:@2854.348]
  wire  _T_533; // @[Conditional.scala 37:30:@2859.350]
  wire  _T_536; // @[Conditional.scala 37:30:@2864.352]
  wire  _T_539; // @[Conditional.scala 37:30:@2869.354]
  wire  _T_542; // @[Conditional.scala 37:30:@2874.356]
  wire  _T_545; // @[Conditional.scala 37:30:@2879.358]
  wire  _T_548; // @[Conditional.scala 37:30:@2884.360]
  wire  _T_551; // @[Conditional.scala 37:30:@2889.362]
  wire  _T_554; // @[Conditional.scala 37:30:@2894.364]
  wire  _T_557; // @[Conditional.scala 37:30:@2899.366]
  wire  _T_560; // @[Conditional.scala 37:30:@2904.368]
  wire  _T_563; // @[Conditional.scala 37:30:@2909.370]
  wire  _T_566; // @[Conditional.scala 37:30:@2914.372]
  wire  _T_569; // @[Conditional.scala 37:30:@2919.374]
  wire  _T_572; // @[Conditional.scala 37:30:@2924.376]
  wire  _T_575; // @[Conditional.scala 37:30:@2929.378]
  wire  _T_578; // @[Conditional.scala 37:30:@2934.380]
  wire  _T_581; // @[Conditional.scala 37:30:@2939.382]
  wire  _T_584; // @[Conditional.scala 37:30:@2944.384]
  wire  _T_587; // @[Conditional.scala 37:30:@2949.386]
  wire  _T_590; // @[Conditional.scala 37:30:@2954.388]
  wire  _T_593; // @[Conditional.scala 37:30:@2959.390]
  wire  _T_596; // @[Conditional.scala 37:30:@2964.392]
  wire  _T_599; // @[Conditional.scala 37:30:@2969.394]
  wire  _T_602; // @[Conditional.scala 37:30:@2974.396]
  wire  _T_605; // @[Conditional.scala 37:30:@2979.398]
  wire  _T_608; // @[Conditional.scala 37:30:@2984.400]
  wire  _T_611; // @[Conditional.scala 37:30:@2989.402]
  wire  _T_614; // @[Conditional.scala 37:30:@2994.404]
  wire  _T_617; // @[Conditional.scala 37:30:@2999.406]
  wire  _T_620; // @[Conditional.scala 37:30:@3004.408]
  wire  _T_623; // @[Conditional.scala 37:30:@3009.410]
  wire  _T_626; // @[Conditional.scala 37:30:@3014.412]
  wire  _T_629; // @[Conditional.scala 37:30:@3019.414]
  wire  _T_632; // @[Conditional.scala 37:30:@3024.416]
  wire  _T_635; // @[Conditional.scala 37:30:@3029.418]
  wire  _T_638; // @[Conditional.scala 37:30:@3034.420]
  wire  _T_641; // @[Conditional.scala 37:30:@3039.422]
  wire  _T_644; // @[Conditional.scala 37:30:@3044.424]
  wire  _T_647; // @[Conditional.scala 37:30:@3049.426]
  wire  _T_650; // @[Conditional.scala 37:30:@3054.428]
  wire  _T_653; // @[Conditional.scala 37:30:@3059.430]
  wire  _T_656; // @[Conditional.scala 37:30:@3064.432]
  wire  _T_659; // @[Conditional.scala 37:30:@3069.434]
  wire  _T_662; // @[Conditional.scala 37:30:@3074.436]
  wire  _T_665; // @[Conditional.scala 37:30:@3079.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3080.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3075.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3070.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@3065.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@3060.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@3055.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@3050.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@3045.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@3040.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@3035.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@3030.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@3025.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@3020.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@3015.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@3010.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@3005.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@3000.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@2995.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2990.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2985.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2980.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2975.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2970.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2965.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2960.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2955.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2950.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2945.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2940.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2935.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2930.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2925.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2920.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2915.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2910.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2905.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2900.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2895.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2890.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2885.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2880.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2875.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2870.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2865.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2860.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2855.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2850.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2845.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2840.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2835.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2830.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2825.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2820.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2815.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2810.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2805.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2800.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2795.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2790.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2785.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2780.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2775.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2770.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2765.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2760.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2755.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2750.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2745.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2740.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2735.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2730.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2725.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2720.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2715.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2710.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2705.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2700.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2695.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2690.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2685.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2680.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2675.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2670.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2665.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2660.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2655.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2650.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2645.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2640.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2635.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2630.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2625.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2620.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2615.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2610.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2605.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2600.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2595.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2590.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2585.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2580.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2575.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2570.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2565.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2560.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2555.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2550.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2545.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2540.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2535.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2530.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2525.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2520.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2515.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2510.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2505.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2500.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2495.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2490.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2485.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2480.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2475.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2470.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2465.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2460.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2455.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2450.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2445.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2440.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2435.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2430.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2425.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2420.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2415.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2410.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2405.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2400.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2395.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2390.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2385.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2380.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2375.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2370.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2365.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2360.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2355.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2350.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2345.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2340.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2335.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2330.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2325.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2320.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2315.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2310.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2305.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2300.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2295.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2290.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2285.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2280.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2275.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2270.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2265.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2260.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2255.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2250.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2245.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2240.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2235.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2230.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2225.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2220.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2215.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2210.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2205.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2200.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2195.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2190.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2185.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2180.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2175.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2170.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2165.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2160.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2155.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2150.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2145.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2140.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2135.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2130.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2125.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2120.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2115.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2110.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2105.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2100.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2095.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2090.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2085.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2080.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2075.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2070.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@2065.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@2060.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@2055.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@2050.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@2045.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@2040.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@2035.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@2030.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@2025.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@2020.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@2015.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@2010.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@2005.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@2000.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@1995.4]
  assign _T_9 = io_bmem_addr[9:0]; // @[bmemory.scala 24:26:@1991.4]
  assign addr = _T_9 / 10'h4; // @[bmemory.scala 24:33:@1992.4]
  assign _T_14 = 10'h0 == addr; // @[Conditional.scala 37:30:@1994.4]
  assign _T_17 = 10'h1 == addr; // @[Conditional.scala 37:30:@1999.6]
  assign _T_20 = 10'h2 == addr; // @[Conditional.scala 37:30:@2004.8]
  assign _T_23 = 10'h3 == addr; // @[Conditional.scala 37:30:@2009.10]
  assign _T_26 = 10'h4 == addr; // @[Conditional.scala 37:30:@2014.12]
  assign _T_29 = 10'h5 == addr; // @[Conditional.scala 37:30:@2019.14]
  assign _T_32 = 10'h6 == addr; // @[Conditional.scala 37:30:@2024.16]
  assign _T_35 = 10'h7 == addr; // @[Conditional.scala 37:30:@2029.18]
  assign _T_38 = 10'h8 == addr; // @[Conditional.scala 37:30:@2034.20]
  assign _T_41 = 10'h9 == addr; // @[Conditional.scala 37:30:@2039.22]
  assign _T_44 = 10'ha == addr; // @[Conditional.scala 37:30:@2044.24]
  assign _T_47 = 10'hb == addr; // @[Conditional.scala 37:30:@2049.26]
  assign _T_50 = 10'hc == addr; // @[Conditional.scala 37:30:@2054.28]
  assign _T_53 = 10'hd == addr; // @[Conditional.scala 37:30:@2059.30]
  assign _T_56 = 10'he == addr; // @[Conditional.scala 37:30:@2064.32]
  assign _T_59 = 10'hf == addr; // @[Conditional.scala 37:30:@2069.34]
  assign _T_62 = 10'h10 == addr; // @[Conditional.scala 37:30:@2074.36]
  assign _T_65 = 10'h11 == addr; // @[Conditional.scala 37:30:@2079.38]
  assign _T_68 = 10'h12 == addr; // @[Conditional.scala 37:30:@2084.40]
  assign _T_71 = 10'h13 == addr; // @[Conditional.scala 37:30:@2089.42]
  assign _T_74 = 10'h14 == addr; // @[Conditional.scala 37:30:@2094.44]
  assign _T_77 = 10'h15 == addr; // @[Conditional.scala 37:30:@2099.46]
  assign _T_80 = 10'h16 == addr; // @[Conditional.scala 37:30:@2104.48]
  assign _T_83 = 10'h17 == addr; // @[Conditional.scala 37:30:@2109.50]
  assign _T_86 = 10'h18 == addr; // @[Conditional.scala 37:30:@2114.52]
  assign _T_89 = 10'h19 == addr; // @[Conditional.scala 37:30:@2119.54]
  assign _T_92 = 10'h1a == addr; // @[Conditional.scala 37:30:@2124.56]
  assign _T_95 = 10'h1b == addr; // @[Conditional.scala 37:30:@2129.58]
  assign _T_98 = 10'h1c == addr; // @[Conditional.scala 37:30:@2134.60]
  assign _T_101 = 10'h1d == addr; // @[Conditional.scala 37:30:@2139.62]
  assign _T_104 = 10'h1e == addr; // @[Conditional.scala 37:30:@2144.64]
  assign _T_107 = 10'h1f == addr; // @[Conditional.scala 37:30:@2149.66]
  assign _T_110 = 10'h20 == addr; // @[Conditional.scala 37:30:@2154.68]
  assign _T_113 = 10'h21 == addr; // @[Conditional.scala 37:30:@2159.70]
  assign _T_116 = 10'h22 == addr; // @[Conditional.scala 37:30:@2164.72]
  assign _T_119 = 10'h23 == addr; // @[Conditional.scala 37:30:@2169.74]
  assign _T_122 = 10'h24 == addr; // @[Conditional.scala 37:30:@2174.76]
  assign _T_125 = 10'h25 == addr; // @[Conditional.scala 37:30:@2179.78]
  assign _T_128 = 10'h26 == addr; // @[Conditional.scala 37:30:@2184.80]
  assign _T_131 = 10'h27 == addr; // @[Conditional.scala 37:30:@2189.82]
  assign _T_134 = 10'h28 == addr; // @[Conditional.scala 37:30:@2194.84]
  assign _T_137 = 10'h29 == addr; // @[Conditional.scala 37:30:@2199.86]
  assign _T_140 = 10'h2a == addr; // @[Conditional.scala 37:30:@2204.88]
  assign _T_143 = 10'h2b == addr; // @[Conditional.scala 37:30:@2209.90]
  assign _T_146 = 10'h2c == addr; // @[Conditional.scala 37:30:@2214.92]
  assign _T_149 = 10'h2d == addr; // @[Conditional.scala 37:30:@2219.94]
  assign _T_152 = 10'h2e == addr; // @[Conditional.scala 37:30:@2224.96]
  assign _T_155 = 10'h2f == addr; // @[Conditional.scala 37:30:@2229.98]
  assign _T_158 = 10'h30 == addr; // @[Conditional.scala 37:30:@2234.100]
  assign _T_161 = 10'h31 == addr; // @[Conditional.scala 37:30:@2239.102]
  assign _T_164 = 10'h32 == addr; // @[Conditional.scala 37:30:@2244.104]
  assign _T_167 = 10'h33 == addr; // @[Conditional.scala 37:30:@2249.106]
  assign _T_170 = 10'h34 == addr; // @[Conditional.scala 37:30:@2254.108]
  assign _T_173 = 10'h35 == addr; // @[Conditional.scala 37:30:@2259.110]
  assign _T_176 = 10'h36 == addr; // @[Conditional.scala 37:30:@2264.112]
  assign _T_179 = 10'h37 == addr; // @[Conditional.scala 37:30:@2269.114]
  assign _T_182 = 10'h38 == addr; // @[Conditional.scala 37:30:@2274.116]
  assign _T_185 = 10'h39 == addr; // @[Conditional.scala 37:30:@2279.118]
  assign _T_188 = 10'h3a == addr; // @[Conditional.scala 37:30:@2284.120]
  assign _T_191 = 10'h3b == addr; // @[Conditional.scala 37:30:@2289.122]
  assign _T_194 = 10'h3c == addr; // @[Conditional.scala 37:30:@2294.124]
  assign _T_197 = 10'h3d == addr; // @[Conditional.scala 37:30:@2299.126]
  assign _T_200 = 10'h3e == addr; // @[Conditional.scala 37:30:@2304.128]
  assign _T_203 = 10'h3f == addr; // @[Conditional.scala 37:30:@2309.130]
  assign _T_206 = 10'h40 == addr; // @[Conditional.scala 37:30:@2314.132]
  assign _T_209 = 10'h41 == addr; // @[Conditional.scala 37:30:@2319.134]
  assign _T_212 = 10'h42 == addr; // @[Conditional.scala 37:30:@2324.136]
  assign _T_215 = 10'h43 == addr; // @[Conditional.scala 37:30:@2329.138]
  assign _T_218 = 10'h44 == addr; // @[Conditional.scala 37:30:@2334.140]
  assign _T_221 = 10'h45 == addr; // @[Conditional.scala 37:30:@2339.142]
  assign _T_224 = 10'h46 == addr; // @[Conditional.scala 37:30:@2344.144]
  assign _T_227 = 10'h47 == addr; // @[Conditional.scala 37:30:@2349.146]
  assign _T_230 = 10'h48 == addr; // @[Conditional.scala 37:30:@2354.148]
  assign _T_233 = 10'h49 == addr; // @[Conditional.scala 37:30:@2359.150]
  assign _T_236 = 10'h4a == addr; // @[Conditional.scala 37:30:@2364.152]
  assign _T_239 = 10'h4b == addr; // @[Conditional.scala 37:30:@2369.154]
  assign _T_242 = 10'h4c == addr; // @[Conditional.scala 37:30:@2374.156]
  assign _T_245 = 10'h4d == addr; // @[Conditional.scala 37:30:@2379.158]
  assign _T_248 = 10'h4e == addr; // @[Conditional.scala 37:30:@2384.160]
  assign _T_251 = 10'h4f == addr; // @[Conditional.scala 37:30:@2389.162]
  assign _T_254 = 10'h50 == addr; // @[Conditional.scala 37:30:@2394.164]
  assign _T_257 = 10'h51 == addr; // @[Conditional.scala 37:30:@2399.166]
  assign _T_260 = 10'h52 == addr; // @[Conditional.scala 37:30:@2404.168]
  assign _T_263 = 10'h53 == addr; // @[Conditional.scala 37:30:@2409.170]
  assign _T_266 = 10'h54 == addr; // @[Conditional.scala 37:30:@2414.172]
  assign _T_269 = 10'h55 == addr; // @[Conditional.scala 37:30:@2419.174]
  assign _T_272 = 10'h56 == addr; // @[Conditional.scala 37:30:@2424.176]
  assign _T_275 = 10'h57 == addr; // @[Conditional.scala 37:30:@2429.178]
  assign _T_278 = 10'h58 == addr; // @[Conditional.scala 37:30:@2434.180]
  assign _T_281 = 10'h59 == addr; // @[Conditional.scala 37:30:@2439.182]
  assign _T_284 = 10'h5a == addr; // @[Conditional.scala 37:30:@2444.184]
  assign _T_287 = 10'h5b == addr; // @[Conditional.scala 37:30:@2449.186]
  assign _T_290 = 10'h5c == addr; // @[Conditional.scala 37:30:@2454.188]
  assign _T_293 = 10'h5d == addr; // @[Conditional.scala 37:30:@2459.190]
  assign _T_296 = 10'h5e == addr; // @[Conditional.scala 37:30:@2464.192]
  assign _T_299 = 10'h5f == addr; // @[Conditional.scala 37:30:@2469.194]
  assign _T_302 = 10'h60 == addr; // @[Conditional.scala 37:30:@2474.196]
  assign _T_305 = 10'h61 == addr; // @[Conditional.scala 37:30:@2479.198]
  assign _T_308 = 10'h62 == addr; // @[Conditional.scala 37:30:@2484.200]
  assign _T_311 = 10'h63 == addr; // @[Conditional.scala 37:30:@2489.202]
  assign _T_314 = 10'h64 == addr; // @[Conditional.scala 37:30:@2494.204]
  assign _T_317 = 10'h65 == addr; // @[Conditional.scala 37:30:@2499.206]
  assign _T_320 = 10'h66 == addr; // @[Conditional.scala 37:30:@2504.208]
  assign _T_323 = 10'h67 == addr; // @[Conditional.scala 37:30:@2509.210]
  assign _T_326 = 10'h68 == addr; // @[Conditional.scala 37:30:@2514.212]
  assign _T_329 = 10'h69 == addr; // @[Conditional.scala 37:30:@2519.214]
  assign _T_332 = 10'h6a == addr; // @[Conditional.scala 37:30:@2524.216]
  assign _T_335 = 10'h6b == addr; // @[Conditional.scala 37:30:@2529.218]
  assign _T_338 = 10'h6c == addr; // @[Conditional.scala 37:30:@2534.220]
  assign _T_341 = 10'h6d == addr; // @[Conditional.scala 37:30:@2539.222]
  assign _T_344 = 10'h6e == addr; // @[Conditional.scala 37:30:@2544.224]
  assign _T_347 = 10'h6f == addr; // @[Conditional.scala 37:30:@2549.226]
  assign _T_350 = 10'h70 == addr; // @[Conditional.scala 37:30:@2554.228]
  assign _T_353 = 10'h71 == addr; // @[Conditional.scala 37:30:@2559.230]
  assign _T_356 = 10'h72 == addr; // @[Conditional.scala 37:30:@2564.232]
  assign _T_359 = 10'h73 == addr; // @[Conditional.scala 37:30:@2569.234]
  assign _T_362 = 10'h74 == addr; // @[Conditional.scala 37:30:@2574.236]
  assign _T_365 = 10'h75 == addr; // @[Conditional.scala 37:30:@2579.238]
  assign _T_368 = 10'h76 == addr; // @[Conditional.scala 37:30:@2584.240]
  assign _T_371 = 10'h77 == addr; // @[Conditional.scala 37:30:@2589.242]
  assign _T_374 = 10'h78 == addr; // @[Conditional.scala 37:30:@2594.244]
  assign _T_377 = 10'h79 == addr; // @[Conditional.scala 37:30:@2599.246]
  assign _T_380 = 10'h7a == addr; // @[Conditional.scala 37:30:@2604.248]
  assign _T_383 = 10'h7b == addr; // @[Conditional.scala 37:30:@2609.250]
  assign _T_386 = 10'h7c == addr; // @[Conditional.scala 37:30:@2614.252]
  assign _T_389 = 10'h7d == addr; // @[Conditional.scala 37:30:@2619.254]
  assign _T_392 = 10'h7e == addr; // @[Conditional.scala 37:30:@2624.256]
  assign _T_395 = 10'h7f == addr; // @[Conditional.scala 37:30:@2629.258]
  assign _T_398 = 10'h80 == addr; // @[Conditional.scala 37:30:@2634.260]
  assign _T_401 = 10'h81 == addr; // @[Conditional.scala 37:30:@2639.262]
  assign _T_404 = 10'h82 == addr; // @[Conditional.scala 37:30:@2644.264]
  assign _T_407 = 10'h83 == addr; // @[Conditional.scala 37:30:@2649.266]
  assign _T_410 = 10'h84 == addr; // @[Conditional.scala 37:30:@2654.268]
  assign _T_413 = 10'h85 == addr; // @[Conditional.scala 37:30:@2659.270]
  assign _T_416 = 10'h86 == addr; // @[Conditional.scala 37:30:@2664.272]
  assign _T_419 = 10'h87 == addr; // @[Conditional.scala 37:30:@2669.274]
  assign _T_422 = 10'h88 == addr; // @[Conditional.scala 37:30:@2674.276]
  assign _T_425 = 10'h89 == addr; // @[Conditional.scala 37:30:@2679.278]
  assign _T_428 = 10'h8a == addr; // @[Conditional.scala 37:30:@2684.280]
  assign _T_431 = 10'h8b == addr; // @[Conditional.scala 37:30:@2689.282]
  assign _T_434 = 10'h8c == addr; // @[Conditional.scala 37:30:@2694.284]
  assign _T_437 = 10'h8d == addr; // @[Conditional.scala 37:30:@2699.286]
  assign _T_440 = 10'h8e == addr; // @[Conditional.scala 37:30:@2704.288]
  assign _T_443 = 10'h8f == addr; // @[Conditional.scala 37:30:@2709.290]
  assign _T_446 = 10'h90 == addr; // @[Conditional.scala 37:30:@2714.292]
  assign _T_449 = 10'h91 == addr; // @[Conditional.scala 37:30:@2719.294]
  assign _T_452 = 10'h92 == addr; // @[Conditional.scala 37:30:@2724.296]
  assign _T_455 = 10'h93 == addr; // @[Conditional.scala 37:30:@2729.298]
  assign _T_458 = 10'h94 == addr; // @[Conditional.scala 37:30:@2734.300]
  assign _T_461 = 10'h95 == addr; // @[Conditional.scala 37:30:@2739.302]
  assign _T_464 = 10'h96 == addr; // @[Conditional.scala 37:30:@2744.304]
  assign _T_467 = 10'h97 == addr; // @[Conditional.scala 37:30:@2749.306]
  assign _T_470 = 10'h98 == addr; // @[Conditional.scala 37:30:@2754.308]
  assign _T_473 = 10'h99 == addr; // @[Conditional.scala 37:30:@2759.310]
  assign _T_476 = 10'h9a == addr; // @[Conditional.scala 37:30:@2764.312]
  assign _T_479 = 10'h9b == addr; // @[Conditional.scala 37:30:@2769.314]
  assign _T_482 = 10'h9c == addr; // @[Conditional.scala 37:30:@2774.316]
  assign _T_485 = 10'h9d == addr; // @[Conditional.scala 37:30:@2779.318]
  assign _T_488 = 10'h9e == addr; // @[Conditional.scala 37:30:@2784.320]
  assign _T_491 = 10'h9f == addr; // @[Conditional.scala 37:30:@2789.322]
  assign _T_494 = 10'ha0 == addr; // @[Conditional.scala 37:30:@2794.324]
  assign _T_497 = 10'ha1 == addr; // @[Conditional.scala 37:30:@2799.326]
  assign _T_500 = 10'ha2 == addr; // @[Conditional.scala 37:30:@2804.328]
  assign _T_503 = 10'ha3 == addr; // @[Conditional.scala 37:30:@2809.330]
  assign _T_506 = 10'ha4 == addr; // @[Conditional.scala 37:30:@2814.332]
  assign _T_509 = 10'ha5 == addr; // @[Conditional.scala 37:30:@2819.334]
  assign _T_512 = 10'ha6 == addr; // @[Conditional.scala 37:30:@2824.336]
  assign _T_515 = 10'ha7 == addr; // @[Conditional.scala 37:30:@2829.338]
  assign _T_518 = 10'ha8 == addr; // @[Conditional.scala 37:30:@2834.340]
  assign _T_521 = 10'ha9 == addr; // @[Conditional.scala 37:30:@2839.342]
  assign _T_524 = 10'haa == addr; // @[Conditional.scala 37:30:@2844.344]
  assign _T_527 = 10'hab == addr; // @[Conditional.scala 37:30:@2849.346]
  assign _T_530 = 10'hac == addr; // @[Conditional.scala 37:30:@2854.348]
  assign _T_533 = 10'had == addr; // @[Conditional.scala 37:30:@2859.350]
  assign _T_536 = 10'hae == addr; // @[Conditional.scala 37:30:@2864.352]
  assign _T_539 = 10'haf == addr; // @[Conditional.scala 37:30:@2869.354]
  assign _T_542 = 10'hb0 == addr; // @[Conditional.scala 37:30:@2874.356]
  assign _T_545 = 10'hb1 == addr; // @[Conditional.scala 37:30:@2879.358]
  assign _T_548 = 10'hb2 == addr; // @[Conditional.scala 37:30:@2884.360]
  assign _T_551 = 10'hb3 == addr; // @[Conditional.scala 37:30:@2889.362]
  assign _T_554 = 10'hb4 == addr; // @[Conditional.scala 37:30:@2894.364]
  assign _T_557 = 10'hb5 == addr; // @[Conditional.scala 37:30:@2899.366]
  assign _T_560 = 10'hb6 == addr; // @[Conditional.scala 37:30:@2904.368]
  assign _T_563 = 10'hb7 == addr; // @[Conditional.scala 37:30:@2909.370]
  assign _T_566 = 10'hb8 == addr; // @[Conditional.scala 37:30:@2914.372]
  assign _T_569 = 10'hb9 == addr; // @[Conditional.scala 37:30:@2919.374]
  assign _T_572 = 10'hba == addr; // @[Conditional.scala 37:30:@2924.376]
  assign _T_575 = 10'hbb == addr; // @[Conditional.scala 37:30:@2929.378]
  assign _T_578 = 10'hbc == addr; // @[Conditional.scala 37:30:@2934.380]
  assign _T_581 = 10'hbd == addr; // @[Conditional.scala 37:30:@2939.382]
  assign _T_584 = 10'hbe == addr; // @[Conditional.scala 37:30:@2944.384]
  assign _T_587 = 10'hbf == addr; // @[Conditional.scala 37:30:@2949.386]
  assign _T_590 = 10'hc0 == addr; // @[Conditional.scala 37:30:@2954.388]
  assign _T_593 = 10'hc1 == addr; // @[Conditional.scala 37:30:@2959.390]
  assign _T_596 = 10'hc2 == addr; // @[Conditional.scala 37:30:@2964.392]
  assign _T_599 = 10'hc3 == addr; // @[Conditional.scala 37:30:@2969.394]
  assign _T_602 = 10'hc4 == addr; // @[Conditional.scala 37:30:@2974.396]
  assign _T_605 = 10'hc5 == addr; // @[Conditional.scala 37:30:@2979.398]
  assign _T_608 = 10'hc6 == addr; // @[Conditional.scala 37:30:@2984.400]
  assign _T_611 = 10'hc7 == addr; // @[Conditional.scala 37:30:@2989.402]
  assign _T_614 = 10'hc8 == addr; // @[Conditional.scala 37:30:@2994.404]
  assign _T_617 = 10'hc9 == addr; // @[Conditional.scala 37:30:@2999.406]
  assign _T_620 = 10'hca == addr; // @[Conditional.scala 37:30:@3004.408]
  assign _T_623 = 10'hcb == addr; // @[Conditional.scala 37:30:@3009.410]
  assign _T_626 = 10'hcc == addr; // @[Conditional.scala 37:30:@3014.412]
  assign _T_629 = 10'hcd == addr; // @[Conditional.scala 37:30:@3019.414]
  assign _T_632 = 10'hce == addr; // @[Conditional.scala 37:30:@3024.416]
  assign _T_635 = 10'hcf == addr; // @[Conditional.scala 37:30:@3029.418]
  assign _T_638 = 10'hd0 == addr; // @[Conditional.scala 37:30:@3034.420]
  assign _T_641 = 10'hd1 == addr; // @[Conditional.scala 37:30:@3039.422]
  assign _T_644 = 10'hd2 == addr; // @[Conditional.scala 37:30:@3044.424]
  assign _T_647 = 10'hd3 == addr; // @[Conditional.scala 37:30:@3049.426]
  assign _T_650 = 10'hd4 == addr; // @[Conditional.scala 37:30:@3054.428]
  assign _T_653 = 10'hd5 == addr; // @[Conditional.scala 37:30:@3059.430]
  assign _T_656 = 10'hd6 == addr; // @[Conditional.scala 37:30:@3064.432]
  assign _T_659 = 10'hd7 == addr; // @[Conditional.scala 37:30:@3069.434]
  assign _T_662 = 10'hd8 == addr; // @[Conditional.scala 37:30:@3074.436]
  assign _T_665 = 10'hd9 == addr; // @[Conditional.scala 37:30:@3079.438]
  assign _GEN_0 = _T_665 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3080.438]
  assign _GEN_1 = _T_662 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3075.436]
  assign _GEN_2 = _T_659 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3070.434]
  assign _GEN_3 = _T_656 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@3065.432]
  assign _GEN_4 = _T_653 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@3060.430]
  assign _GEN_5 = _T_650 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@3055.428]
  assign _GEN_6 = _T_647 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@3050.426]
  assign _GEN_7 = _T_644 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@3045.424]
  assign _GEN_8 = _T_641 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@3040.422]
  assign _GEN_9 = _T_638 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@3035.420]
  assign _GEN_10 = _T_635 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@3030.418]
  assign _GEN_11 = _T_632 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@3025.416]
  assign _GEN_12 = _T_629 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@3020.414]
  assign _GEN_13 = _T_626 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@3015.412]
  assign _GEN_14 = _T_623 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@3010.410]
  assign _GEN_15 = _T_620 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@3005.408]
  assign _GEN_16 = _T_617 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@3000.406]
  assign _GEN_17 = _T_614 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@2995.404]
  assign _GEN_18 = _T_611 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2990.402]
  assign _GEN_19 = _T_608 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2985.400]
  assign _GEN_20 = _T_605 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2980.398]
  assign _GEN_21 = _T_602 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2975.396]
  assign _GEN_22 = _T_599 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2970.394]
  assign _GEN_23 = _T_596 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2965.392]
  assign _GEN_24 = _T_593 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2960.390]
  assign _GEN_25 = _T_590 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2955.388]
  assign _GEN_26 = _T_587 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2950.386]
  assign _GEN_27 = _T_584 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2945.384]
  assign _GEN_28 = _T_581 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2940.382]
  assign _GEN_29 = _T_578 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2935.380]
  assign _GEN_30 = _T_575 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2930.378]
  assign _GEN_31 = _T_572 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2925.376]
  assign _GEN_32 = _T_569 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2920.374]
  assign _GEN_33 = _T_566 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2915.372]
  assign _GEN_34 = _T_563 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2910.370]
  assign _GEN_35 = _T_560 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2905.368]
  assign _GEN_36 = _T_557 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2900.366]
  assign _GEN_37 = _T_554 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2895.364]
  assign _GEN_38 = _T_551 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2890.362]
  assign _GEN_39 = _T_548 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2885.360]
  assign _GEN_40 = _T_545 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2880.358]
  assign _GEN_41 = _T_542 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2875.356]
  assign _GEN_42 = _T_539 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2870.354]
  assign _GEN_43 = _T_536 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2865.352]
  assign _GEN_44 = _T_533 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2860.350]
  assign _GEN_45 = _T_530 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2855.348]
  assign _GEN_46 = _T_527 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2850.346]
  assign _GEN_47 = _T_524 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2845.344]
  assign _GEN_48 = _T_521 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2840.342]
  assign _GEN_49 = _T_518 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2835.340]
  assign _GEN_50 = _T_515 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2830.338]
  assign _GEN_51 = _T_512 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2825.336]
  assign _GEN_52 = _T_509 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2820.334]
  assign _GEN_53 = _T_506 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2815.332]
  assign _GEN_54 = _T_503 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2810.330]
  assign _GEN_55 = _T_500 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2805.328]
  assign _GEN_56 = _T_497 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2800.326]
  assign _GEN_57 = _T_494 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2795.324]
  assign _GEN_58 = _T_491 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2790.322]
  assign _GEN_59 = _T_488 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2785.320]
  assign _GEN_60 = _T_485 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2780.318]
  assign _GEN_61 = _T_482 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2775.316]
  assign _GEN_62 = _T_479 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2770.314]
  assign _GEN_63 = _T_476 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2765.312]
  assign _GEN_64 = _T_473 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2760.310]
  assign _GEN_65 = _T_470 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2755.308]
  assign _GEN_66 = _T_467 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2750.306]
  assign _GEN_67 = _T_464 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2745.304]
  assign _GEN_68 = _T_461 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2740.302]
  assign _GEN_69 = _T_458 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2735.300]
  assign _GEN_70 = _T_455 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2730.298]
  assign _GEN_71 = _T_452 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2725.296]
  assign _GEN_72 = _T_449 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2720.294]
  assign _GEN_73 = _T_446 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2715.292]
  assign _GEN_74 = _T_443 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2710.290]
  assign _GEN_75 = _T_440 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2705.288]
  assign _GEN_76 = _T_437 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2700.286]
  assign _GEN_77 = _T_434 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2695.284]
  assign _GEN_78 = _T_431 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2690.282]
  assign _GEN_79 = _T_428 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2685.280]
  assign _GEN_80 = _T_425 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2680.278]
  assign _GEN_81 = _T_422 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2675.276]
  assign _GEN_82 = _T_419 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2670.274]
  assign _GEN_83 = _T_416 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2665.272]
  assign _GEN_84 = _T_413 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2660.270]
  assign _GEN_85 = _T_410 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2655.268]
  assign _GEN_86 = _T_407 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2650.266]
  assign _GEN_87 = _T_404 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2645.264]
  assign _GEN_88 = _T_401 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2640.262]
  assign _GEN_89 = _T_398 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2635.260]
  assign _GEN_90 = _T_395 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2630.258]
  assign _GEN_91 = _T_392 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2625.256]
  assign _GEN_92 = _T_389 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2620.254]
  assign _GEN_93 = _T_386 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2615.252]
  assign _GEN_94 = _T_383 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2610.250]
  assign _GEN_95 = _T_380 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2605.248]
  assign _GEN_96 = _T_377 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2600.246]
  assign _GEN_97 = _T_374 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2595.244]
  assign _GEN_98 = _T_371 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2590.242]
  assign _GEN_99 = _T_368 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2585.240]
  assign _GEN_100 = _T_365 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2580.238]
  assign _GEN_101 = _T_362 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2575.236]
  assign _GEN_102 = _T_359 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2570.234]
  assign _GEN_103 = _T_356 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2565.232]
  assign _GEN_104 = _T_353 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2560.230]
  assign _GEN_105 = _T_350 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2555.228]
  assign _GEN_106 = _T_347 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2550.226]
  assign _GEN_107 = _T_344 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2545.224]
  assign _GEN_108 = _T_341 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2540.222]
  assign _GEN_109 = _T_338 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2535.220]
  assign _GEN_110 = _T_335 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2530.218]
  assign _GEN_111 = _T_332 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2525.216]
  assign _GEN_112 = _T_329 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2520.214]
  assign _GEN_113 = _T_326 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2515.212]
  assign _GEN_114 = _T_323 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2510.210]
  assign _GEN_115 = _T_320 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2505.208]
  assign _GEN_116 = _T_317 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2500.206]
  assign _GEN_117 = _T_314 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2495.204]
  assign _GEN_118 = _T_311 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2490.202]
  assign _GEN_119 = _T_308 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2485.200]
  assign _GEN_120 = _T_305 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2480.198]
  assign _GEN_121 = _T_302 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2475.196]
  assign _GEN_122 = _T_299 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2470.194]
  assign _GEN_123 = _T_296 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2465.192]
  assign _GEN_124 = _T_293 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2460.190]
  assign _GEN_125 = _T_290 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2455.188]
  assign _GEN_126 = _T_287 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2450.186]
  assign _GEN_127 = _T_284 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2445.184]
  assign _GEN_128 = _T_281 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2440.182]
  assign _GEN_129 = _T_278 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2435.180]
  assign _GEN_130 = _T_275 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2430.178]
  assign _GEN_131 = _T_272 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2425.176]
  assign _GEN_132 = _T_269 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2420.174]
  assign _GEN_133 = _T_266 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2415.172]
  assign _GEN_134 = _T_263 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2410.170]
  assign _GEN_135 = _T_260 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2405.168]
  assign _GEN_136 = _T_257 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2400.166]
  assign _GEN_137 = _T_254 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2395.164]
  assign _GEN_138 = _T_251 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2390.162]
  assign _GEN_139 = _T_248 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2385.160]
  assign _GEN_140 = _T_245 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2380.158]
  assign _GEN_141 = _T_242 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2375.156]
  assign _GEN_142 = _T_239 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2370.154]
  assign _GEN_143 = _T_236 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2365.152]
  assign _GEN_144 = _T_233 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2360.150]
  assign _GEN_145 = _T_230 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2355.148]
  assign _GEN_146 = _T_227 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2350.146]
  assign _GEN_147 = _T_224 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2345.144]
  assign _GEN_148 = _T_221 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2340.142]
  assign _GEN_149 = _T_218 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2335.140]
  assign _GEN_150 = _T_215 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2330.138]
  assign _GEN_151 = _T_212 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2325.136]
  assign _GEN_152 = _T_209 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2320.134]
  assign _GEN_153 = _T_206 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2315.132]
  assign _GEN_154 = _T_203 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2310.130]
  assign _GEN_155 = _T_200 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2305.128]
  assign _GEN_156 = _T_197 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2300.126]
  assign _GEN_157 = _T_194 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2295.124]
  assign _GEN_158 = _T_191 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2290.122]
  assign _GEN_159 = _T_188 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2285.120]
  assign _GEN_160 = _T_185 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2280.118]
  assign _GEN_161 = _T_182 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2275.116]
  assign _GEN_162 = _T_179 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2270.114]
  assign _GEN_163 = _T_176 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2265.112]
  assign _GEN_164 = _T_173 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2260.110]
  assign _GEN_165 = _T_170 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2255.108]
  assign _GEN_166 = _T_167 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2250.106]
  assign _GEN_167 = _T_164 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2245.104]
  assign _GEN_168 = _T_161 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2240.102]
  assign _GEN_169 = _T_158 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2235.100]
  assign _GEN_170 = _T_155 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2230.98]
  assign _GEN_171 = _T_152 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2225.96]
  assign _GEN_172 = _T_149 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2220.94]
  assign _GEN_173 = _T_146 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2215.92]
  assign _GEN_174 = _T_143 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2210.90]
  assign _GEN_175 = _T_140 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2205.88]
  assign _GEN_176 = _T_137 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2200.86]
  assign _GEN_177 = _T_134 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2195.84]
  assign _GEN_178 = _T_131 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2190.82]
  assign _GEN_179 = _T_128 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2185.80]
  assign _GEN_180 = _T_125 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2180.78]
  assign _GEN_181 = _T_122 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2175.76]
  assign _GEN_182 = _T_119 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2170.74]
  assign _GEN_183 = _T_116 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2165.72]
  assign _GEN_184 = _T_113 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2160.70]
  assign _GEN_185 = _T_110 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2155.68]
  assign _GEN_186 = _T_107 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2150.66]
  assign _GEN_187 = _T_104 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2145.64]
  assign _GEN_188 = _T_101 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2140.62]
  assign _GEN_189 = _T_98 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2135.60]
  assign _GEN_190 = _T_95 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2130.58]
  assign _GEN_191 = _T_92 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2125.56]
  assign _GEN_192 = _T_89 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2120.54]
  assign _GEN_193 = _T_86 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2115.52]
  assign _GEN_194 = _T_83 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2110.50]
  assign _GEN_195 = _T_80 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2105.48]
  assign _GEN_196 = _T_77 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2100.46]
  assign _GEN_197 = _T_74 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2095.44]
  assign _GEN_198 = _T_71 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2090.42]
  assign _GEN_199 = _T_68 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2085.40]
  assign _GEN_200 = _T_65 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2080.38]
  assign _GEN_201 = _T_62 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2075.36]
  assign _GEN_202 = _T_59 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2070.34]
  assign _GEN_203 = _T_56 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@2065.32]
  assign _GEN_204 = _T_53 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@2060.30]
  assign _GEN_205 = _T_50 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@2055.28]
  assign _GEN_206 = _T_47 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@2050.26]
  assign _GEN_207 = _T_44 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@2045.24]
  assign _GEN_208 = _T_41 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@2040.22]
  assign _GEN_209 = _T_38 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@2035.20]
  assign _GEN_210 = _T_35 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@2030.18]
  assign _GEN_211 = _T_32 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@2025.16]
  assign _GEN_212 = _T_29 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@2020.14]
  assign _GEN_213 = _T_26 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@2015.12]
  assign _GEN_214 = _T_23 ? 32'hf810113 : _GEN_213; // @[Conditional.scala 39:67:@2010.10]
  assign _GEN_215 = _T_20 ? 32'hffffa117 : _GEN_214; // @[Conditional.scala 39:67:@2005.8]
  assign _GEN_216 = _T_17 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@2000.6]
  assign _GEN_217 = _T_14 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@1995.4]
  assign io_bmem_rdata = bmem_data; // @[bmemory.scala 248:17:@3083.4]
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
module IMem_Interface( // @[:@3085.2]
  input         clock, // @[:@3086.4]
  input         reset, // @[:@3087.4]
  input  [31:0] io_ibus_addr, // @[:@3088.4]
  output [31:0] io_ibus_inst, // @[:@3088.4]
  output        io_ibus_valid, // @[:@3088.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3088.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3088.4]
  input         io_wbs_m2s_we, // @[:@3088.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3088.4]
  input         io_wbs_m2s_stb, // @[:@3088.4]
  output        io_wbs_ack_o, // @[:@3088.4]
  output [31:0] io_wbs_data_o, // @[:@3088.4]
  output [8:0]  io_imem_io_addr, // @[:@3088.4]
  input  [31:0] io_imem_io_rdata, // @[:@3088.4]
  output [31:0] io_imem_io_wdata, // @[:@3088.4]
  output        io_imem_io_wr_en, // @[:@3088.4]
  output        io_imem_io_cs, // @[:@3088.4]
  output [3:0]  io_imem_io_st_type // @[:@3088.4]
);
  wire  bmem_clock; // @[imem_interface.scala 52:20:@3090.4]
  wire  bmem_reset; // @[imem_interface.scala 52:20:@3090.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 52:20:@3090.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 52:20:@3090.4]
  wire [8:0] ibus_imem_addr; // @[imem_interface.scala 59:41:@3093.4]
  wire [7:0] ibus_bmem_addr; // @[imem_interface.scala 60:41:@3094.4]
  wire [8:0] wbs_imem_addr; // @[imem_interface.scala 61:44:@3095.4]
  reg  ack; // @[imem_interface.scala 66:31:@3096.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 67:27:@3097.4]
  reg [31:0] _RAND_1;
  wire  _T_57; // @[imem_interface.scala 69:24:@3098.4]
  wire  wb_rd_en; // @[imem_interface.scala 69:39:@3099.4]
  wire  wb_wr_en; // @[imem_interface.scala 70:38:@3100.4]
  reg  bmem_ibus_sel; // @[imem_interface.scala 75:36:@3101.4]
  reg [31:0] _RAND_2;
  wire [3:0] _T_60; // @[imem_interface.scala 76:43:@3102.4]
  wire  _T_62; // @[imem_interface.scala 76:75:@3103.4]
  wire [3:0] _T_63; // @[imem_interface.scala 77:46:@3105.4]
  wire  _T_65; // @[imem_interface.scala 77:84:@3106.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 77:29:@3107.4]
  wire  imem_wbs_write; // @[imem_interface.scala 78:50:@3108.4]
  wire  _T_69; // @[imem_interface.scala 84:33:@3111.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 84:46:@3112.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 85:32:@3114.4]
  reg [31:0] _RAND_3;
  wire  _T_74; // @[imem_interface.scala 86:22:@3115.4]
  wire  _T_82; // @[imem_interface.scala 104:41:@3127.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 107:23:@3130.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 107:23:@3130.4]
  wire  _GEN_2; // @[imem_interface.scala 113:20:@3136.4]
  wire  _T_86; // @[imem_interface.scala 121:18:@3142.4]
  wire [7:0] _T_87; // @[imem_interface.scala 122:33:@3144.6]
  wire  _T_88; // @[imem_interface.scala 123:24:@3148.6]
  wire [7:0] _T_89; // @[imem_interface.scala 124:33:@3150.8]
  wire  _T_90; // @[imem_interface.scala 125:24:@3154.8]
  wire [7:0] _T_91; // @[imem_interface.scala 126:33:@3156.10]
  wire  _T_92; // @[imem_interface.scala 127:24:@3160.10]
  wire [7:0] _T_93; // @[imem_interface.scala 128:33:@3162.12]
  wire  _T_94; // @[imem_interface.scala 129:24:@3166.12]
  wire [15:0] _T_95; // @[imem_interface.scala 130:33:@3168.14]
  wire  _T_96; // @[imem_interface.scala 131:24:@3172.14]
  wire [15:0] _T_97; // @[imem_interface.scala 132:33:@3174.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 131:54:@3173.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 129:52:@3167.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 127:52:@3161.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 125:52:@3155.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 123:52:@3149.6]
  BMem bmem ( // @[imem_interface.scala 52:20:@3090.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[10:2]; // @[imem_interface.scala 59:41:@3093.4]
  assign ibus_bmem_addr = io_ibus_addr[9:2]; // @[imem_interface.scala 60:41:@3094.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[10:2]; // @[imem_interface.scala 61:44:@3095.4]
  assign _T_57 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 69:24:@3098.4]
  assign wb_rd_en = _T_57 & io_wbs_m2s_stb; // @[imem_interface.scala 69:39:@3099.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 70:38:@3100.4]
  assign _T_60 = io_ibus_addr[15:12]; // @[imem_interface.scala 76:43:@3102.4]
  assign _T_62 = _T_60 == 4'h7; // @[imem_interface.scala 76:75:@3103.4]
  assign _T_63 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 77:46:@3105.4]
  assign _T_65 = _T_63 != 4'h0; // @[imem_interface.scala 77:84:@3106.4]
  assign imem_wbs_addr_match = _T_65 == 1'h0; // @[imem_interface.scala 77:29:@3107.4]
  assign imem_wbs_write = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 78:50:@3108.4]
  assign _T_69 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 84:33:@3111.4]
  assign imem_wbs_sel = _T_69 & imem_wbs_addr_match; // @[imem_interface.scala 84:46:@3112.4]
  assign _T_74 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 86:22:@3115.4]
  assign _T_82 = bmem_ibus_sel == 1'h0; // @[imem_interface.scala 104:41:@3127.4]
  assign rd_imem_inst = imem_ibus_valid ? io_imem_io_rdata : 32'h0; // @[imem_interface.scala 107:23:@3130.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : io_imem_io_rdata; // @[imem_interface.scala 107:23:@3130.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 113:20:@3136.4]
  assign _T_86 = wb_select == 4'h1; // @[imem_interface.scala 121:18:@3142.4]
  assign _T_87 = rd_imem_const[7:0]; // @[imem_interface.scala 122:33:@3144.6]
  assign _T_88 = wb_select == 4'h2; // @[imem_interface.scala 123:24:@3148.6]
  assign _T_89 = rd_imem_const[15:8]; // @[imem_interface.scala 124:33:@3150.8]
  assign _T_90 = wb_select == 4'h4; // @[imem_interface.scala 125:24:@3154.8]
  assign _T_91 = rd_imem_const[23:16]; // @[imem_interface.scala 126:33:@3156.10]
  assign _T_92 = wb_select == 4'h8; // @[imem_interface.scala 127:24:@3160.10]
  assign _T_93 = rd_imem_const[31:24]; // @[imem_interface.scala 128:33:@3162.12]
  assign _T_94 = wb_select == 4'h3; // @[imem_interface.scala 129:24:@3166.12]
  assign _T_95 = rd_imem_const[15:0]; // @[imem_interface.scala 130:33:@3168.14]
  assign _T_96 = wb_select == 4'hc; // @[imem_interface.scala 131:24:@3172.14]
  assign _T_97 = rd_imem_const[31:16]; // @[imem_interface.scala 132:33:@3174.16]
  assign _GEN_3 = _T_96 ? {{16'd0}, _T_97} : rd_imem_const; // @[imem_interface.scala 131:54:@3173.14]
  assign _GEN_4 = _T_94 ? {{16'd0}, _T_95} : _GEN_3; // @[imem_interface.scala 129:52:@3167.12]
  assign _GEN_5 = _T_92 ? {{24'd0}, _T_93} : _GEN_4; // @[imem_interface.scala 127:52:@3161.10]
  assign _GEN_6 = _T_90 ? {{24'd0}, _T_91} : _GEN_5; // @[imem_interface.scala 125:52:@3155.8]
  assign _GEN_7 = _T_88 ? {{24'd0}, _T_89} : _GEN_6; // @[imem_interface.scala 123:52:@3149.6]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 150:19:@3185.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 151:19:@3187.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 138:18:@3181.4]
  assign io_wbs_data_o = _T_86 ? {{24'd0}, _T_87} : _GEN_7; // @[imem_interface.scala 139:18:@3182.4]
  assign io_imem_io_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 95:19:@3122.4]
  assign io_imem_io_wdata = io_wbs_m2s_data; // @[imem_interface.scala 101:22:@3123.4]
  assign io_imem_io_wr_en = imem_wbs_write == 1'h0; // @[imem_interface.scala 102:22:@3125.4]
  assign io_imem_io_cs = imem_wbs_sel | _T_82; // @[imem_interface.scala 104:22:@3129.4]
  assign io_imem_io_st_type = io_wbs_m2s_sel; // @[imem_interface.scala 103:22:@3126.4]
  assign bmem_clock = clock; // @[:@3091.4]
  assign bmem_reset = reset; // @[:@3092.4]
  assign bmem_io_bmem_addr = {{24'd0}, ibus_bmem_addr}; // @[imem_interface.scala 143:21:@3183.4]
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
      bmem_ibus_sel <= _T_62;
    end
    if (reset) begin
      imem_ibus_valid <= 1'h1;
    end else begin
      imem_ibus_valid <= _T_74;
    end
  end
endmodule
module WBM_DBus( // @[:@3189.2]
  input  [31:0] io_dbus_addr, // @[:@3192.4]
  input  [31:0] io_dbus_wdata, // @[:@3192.4]
  output [31:0] io_dbus_rdata, // @[:@3192.4]
  input         io_dbus_rd_en, // @[:@3192.4]
  input         io_dbus_wr_en, // @[:@3192.4]
  input  [1:0]  io_dbus_st_type, // @[:@3192.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3192.4]
  output        io_dbus_valid, // @[:@3192.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3192.4]
  output [31:0] io_wbm_m2s_data, // @[:@3192.4]
  output        io_wbm_m2s_we, // @[:@3192.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3192.4]
  output        io_wbm_m2s_stb, // @[:@3192.4]
  input         io_wbm_ack_i, // @[:@3192.4]
  input  [31:0] io_wbm_data_i // @[:@3192.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3196.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3201.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3206.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3207.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3202.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3197.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3210.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3213.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3218.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3219.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3220.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3222.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3223.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3227.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3228.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3229.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3231.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3236.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3241.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3242.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3237.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3232.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3230.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3221.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3214.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3253.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3196.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3201.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3206.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3207.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3202.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3197.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3210.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3213.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3218.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3219.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3220.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3222.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3223.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3227.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3228.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3229.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3231.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3236.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3241.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3242.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3237.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3232.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3230.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3221.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3214.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3253.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3261.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3262.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3250.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3251.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3252.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3255.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3259.4]
endmodule
module UARTTx( // @[:@3264.2]
  input        clock, // @[:@3265.4]
  input        reset, // @[:@3266.4]
  output       io_in_ready, // @[:@3267.4]
  input        io_in_valid, // @[:@3267.4]
  input  [7:0] io_in_bits, // @[:@3267.4]
  output       io_out, // @[:@3267.4]
  input  [9:0] io_div // @[:@3267.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3269.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3270.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3271.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3272.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3273.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3275.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3276.4]
  wire  state1; // @[uart_tx.scala 33:31:@3277.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3281.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3280.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3280.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3293.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3294.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3295.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3296.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3297.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3298.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3299.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3302.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3303.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3304.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3306.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3307.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3309.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3301.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3301.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3301.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3292.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3292.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3292.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3270.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3275.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3276.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3277.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3281.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3280.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3280.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3293.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3294.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3295.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3296.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3297.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3298.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3299.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3302.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3303.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3304.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3306.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3307.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3309.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3301.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3301.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3301.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3292.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3292.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3292.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3279.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3274.4]
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
module UARTRx( // @[:@3314.2]
  input        clock, // @[:@3315.4]
  input        reset, // @[:@3316.4]
  input        io_in, // @[:@3317.4]
  output       io_out_valid, // @[:@3317.4]
  output [7:0] io_out_bits, // @[:@3317.4]
  input  [9:0] io_div // @[:@3317.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3319.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3320.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3321.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3322.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3323.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3324.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3325.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3326.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3327.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3328.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3329.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3330.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3331.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3332.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3332.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3333.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3334.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3338.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3339.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3341.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3343.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3344.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3346.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3346.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3346.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3342.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3342.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3342.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3342.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3358.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3359.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3360.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3368.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3369.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3362.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3362.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3362.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3357.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3357.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3357.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3357.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3357.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3355.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3355.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3355.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3355.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3355.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3355.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3340.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3340.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3340.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3340.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3320.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3322.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3323.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3324.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3325.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3326.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3327.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3328.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3329.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3331.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3332.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3332.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3339.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3341.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3343.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3344.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3346.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3346.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3346.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3342.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3342.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3342.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3342.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3358.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3359.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3360.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3368.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3369.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3362.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3362.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3362.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3357.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3357.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3357.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3357.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3357.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3355.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3340.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3340.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3340.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3340.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3336.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3337.4]
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
module UART( // @[:@3375.2]
  input         clock, // @[:@3376.4]
  input         reset, // @[:@3377.4]
  input         io_uart_select, // @[:@3378.4]
  output        io_txd, // @[:@3378.4]
  output        io_tx_en, // @[:@3378.4]
  input         io_rxd, // @[:@3378.4]
  output        io_uartInt, // @[:@3378.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3378.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3378.4]
  input         io_wbs_m2s_we, // @[:@3378.4]
  input         io_wbs_m2s_stb, // @[:@3378.4]
  output        io_wbs_ack_o, // @[:@3378.4]
  output [31:0] io_wbs_data_o // @[:@3378.4]
);
  wire  txm_clock; // @[uart.scala 54:19:@3380.4]
  wire  txm_reset; // @[uart.scala 54:19:@3380.4]
  wire  txm_io_in_ready; // @[uart.scala 54:19:@3380.4]
  wire  txm_io_in_valid; // @[uart.scala 54:19:@3380.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 54:19:@3380.4]
  wire  txm_io_out; // @[uart.scala 54:19:@3380.4]
  wire [9:0] txm_io_div; // @[uart.scala 54:19:@3380.4]
  wire  rxm_clock; // @[uart.scala 55:19:@3383.4]
  wire  rxm_reset; // @[uart.scala 55:19:@3383.4]
  wire  rxm_io_in; // @[uart.scala 55:19:@3383.4]
  wire  rxm_io_out_valid; // @[uart.scala 55:19:@3383.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 55:19:@3383.4]
  wire [9:0] rxm_io_div; // @[uart.scala 55:19:@3383.4]
  reg  txen; // @[uart.scala 58:27:@3386.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 61:27:@3388.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 62:27:@3389.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 63:27:@3390.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 64:27:@3391.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 65:27:@3392.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 66:27:@3393.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 87:36:@3405.4]
  wire  _T_66; // @[uart.scala 88:21:@3406.4]
  wire  rd_en; // @[uart.scala 88:36:@3407.4]
  wire  wr_en; // @[uart.scala 89:35:@3408.4]
  wire  _T_73; // @[uart.scala 93:32:@3409.4]
  wire  sel_reg_rx; // @[uart.scala 93:56:@3410.4]
  wire  _T_74; // @[uart.scala 94:32:@3411.4]
  wire  sel_reg_tx; // @[uart.scala 94:56:@3412.4]
  wire  _T_75; // @[uart.scala 95:32:@3413.4]
  wire  sel_reg_baud; // @[uart.scala 95:54:@3414.4]
  wire  _T_76; // @[uart.scala 96:32:@3415.4]
  wire  sel_reg_control; // @[uart.scala 96:57:@3416.4]
  wire  _T_77; // @[uart.scala 97:32:@3417.4]
  wire  sel_reg_status; // @[uart.scala 97:56:@3418.4]
  wire  _T_78; // @[uart.scala 98:32:@3419.4]
  wire  sel_reg_int_mask; // @[uart.scala 98:58:@3420.4]
  reg  ack; // @[uart.scala 101:28:@3421.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 106:28:@3425.4]
  reg [31:0] _RAND_8;
  wire  _T_84; // @[uart.scala 108:14:@3426.4]
  wire  _T_85; // @[uart.scala 110:20:@3431.6]
  wire  _T_86; // @[uart.scala 112:20:@3436.8]
  wire  _T_87; // @[uart.scala 114:20:@3441.10]
  wire [7:0] _GEN_0; // @[uart.scala 114:34:@3442.10]
  wire [7:0] _GEN_1; // @[uart.scala 112:38:@3437.8]
  wire [9:0] _GEN_2; // @[uart.scala 110:36:@3432.6]
  wire [9:0] _GEN_3; // @[uart.scala 108:33:@3427.4]
  wire [7:0] _T_89; // @[uart.scala 122:31:@3449.4]
  wire [7:0] _T_92; // @[uart.scala 127:36:@3454.8]
  wire [7:0] _GEN_4; // @[uart.scala 136:32:@3469.12]
  wire [7:0] _GEN_5; // @[uart.scala 133:31:@3464.10]
  wire [7:0] _GEN_6; // @[uart.scala 133:31:@3464.10]
  wire [9:0] _GEN_7; // @[uart.scala 130:29:@3459.8]
  wire [7:0] _GEN_8; // @[uart.scala 130:29:@3459.8]
  wire [7:0] _GEN_9; // @[uart.scala 130:29:@3459.8]
  wire [7:0] _GEN_10; // @[uart.scala 126:22:@3453.6]
  wire [9:0] _GEN_12; // @[uart.scala 126:22:@3453.6]
  wire [7:0] _GEN_13; // @[uart.scala 126:22:@3453.6]
  wire [7:0] _GEN_14; // @[uart.scala 126:22:@3453.6]
  wire [7:0] _GEN_15; // @[uart.scala 125:15:@3452.4]
  wire  _GEN_16; // @[uart.scala 125:15:@3452.4]
  wire [9:0] _GEN_17; // @[uart.scala 125:15:@3452.4]
  wire [7:0] _GEN_18; // @[uart.scala 125:15:@3452.4]
  wire [7:0] _GEN_19; // @[uart.scala 125:15:@3452.4]
  wire [6:0] _T_97; // @[uart.scala 144:33:@3476.6]
  wire [7:0] _T_99; // @[Cat.scala 30:58:@3477.6]
  wire  _T_100; // @[uart.scala 145:20:@3481.6]
  wire [5:0] _T_102; // @[uart.scala 148:33:@3487.8]
  wire  _T_103; // @[uart.scala 148:65:@3488.8]
  wire [7:0] _T_105; // @[Cat.scala 30:58:@3490.8]
  wire [7:0] _GEN_20; // @[uart.scala 145:38:@3482.6]
  wire [7:0] _GEN_21; // @[uart.scala 142:25:@3474.4]
  wire [7:0] _GEN_22; // @[uart.scala 142:25:@3474.4]
  UARTTx txm ( // @[uart.scala 54:19:@3380.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 55:19:@3383.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 87:36:@3405.4]
  assign _T_66 = io_wbs_m2s_we == 1'h0; // @[uart.scala 88:21:@3406.4]
  assign rd_en = _T_66 & io_wbs_m2s_stb; // @[uart.scala 88:36:@3407.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 89:35:@3408.4]
  assign _T_73 = addr == 8'h0; // @[uart.scala 93:32:@3409.4]
  assign sel_reg_rx = _T_73 & io_uart_select; // @[uart.scala 93:56:@3410.4]
  assign _T_74 = addr == 8'h1; // @[uart.scala 94:32:@3411.4]
  assign sel_reg_tx = _T_74 & io_uart_select; // @[uart.scala 94:56:@3412.4]
  assign _T_75 = addr == 8'h2; // @[uart.scala 95:32:@3413.4]
  assign sel_reg_baud = _T_75 & io_uart_select; // @[uart.scala 95:54:@3414.4]
  assign _T_76 = addr == 8'h3; // @[uart.scala 96:32:@3415.4]
  assign sel_reg_control = _T_76 & io_uart_select; // @[uart.scala 96:57:@3416.4]
  assign _T_77 = addr == 8'h4; // @[uart.scala 97:32:@3417.4]
  assign sel_reg_status = _T_77 & io_uart_select; // @[uart.scala 97:56:@3418.4]
  assign _T_78 = addr == 8'h5; // @[uart.scala 98:32:@3419.4]
  assign sel_reg_int_mask = _T_78 & io_uart_select; // @[uart.scala 98:58:@3420.4]
  assign _T_84 = rd_en & sel_reg_control; // @[uart.scala 108:14:@3426.4]
  assign _T_85 = rd_en & sel_reg_baud; // @[uart.scala 110:20:@3431.6]
  assign _T_86 = rd_en & sel_reg_status; // @[uart.scala 112:20:@3436.8]
  assign _T_87 = rd_en & sel_reg_rx; // @[uart.scala 114:20:@3441.10]
  assign _GEN_0 = _T_87 ? rx_data_r : 8'h0; // @[uart.scala 114:34:@3442.10]
  assign _GEN_1 = _T_86 ? status_r : _GEN_0; // @[uart.scala 112:38:@3437.8]
  assign _GEN_2 = _T_85 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 110:36:@3432.6]
  assign _GEN_3 = _T_84 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 108:33:@3427.4]
  assign _T_89 = status_r & int_mask_r; // @[uart.scala 122:31:@3449.4]
  assign _T_92 = io_wbs_m2s_data[7:0]; // @[uart.scala 127:36:@3454.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_92 : int_mask_r; // @[uart.scala 136:32:@3469.12]
  assign _GEN_5 = sel_reg_control ? _T_92 : control_r; // @[uart.scala 133:31:@3464.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 133:31:@3464.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_92} : baud_r; // @[uart.scala 130:29:@3459.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 130:29:@3459.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 130:29:@3459.8]
  assign _GEN_10 = sel_reg_tx ? _T_92 : tx_data_r; // @[uart.scala 126:22:@3453.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 126:22:@3453.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 126:22:@3453.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 126:22:@3453.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 125:15:@3452.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 125:15:@3452.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 125:15:@3452.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 125:15:@3452.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 125:15:@3452.4]
  assign _T_97 = status_r[7:1]; // @[uart.scala 144:33:@3476.6]
  assign _T_99 = {_T_97,1'h1}; // @[Cat.scala 30:58:@3477.6]
  assign _T_100 = wr_en & sel_reg_status; // @[uart.scala 145:20:@3481.6]
  assign _T_102 = status_r[7:2]; // @[uart.scala 148:33:@3487.8]
  assign _T_103 = status_r[0]; // @[uart.scala 148:65:@3488.8]
  assign _T_105 = {_T_102,txm_io_in_ready,_T_103}; // @[Cat.scala 30:58:@3490.8]
  assign _GEN_20 = _T_100 ? _T_92 : _T_105; // @[uart.scala 145:38:@3482.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 142:25:@3474.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_99 : _GEN_20; // @[uart.scala 142:25:@3474.4]
  assign io_txd = txm_io_out; // @[uart.scala 83:19:@3402.4]
  assign io_tx_en = control_r[0]; // @[uart.scala 84:19:@3404.4]
  assign io_uartInt = _T_89 != 8'h0; // @[uart.scala 122:18:@3451.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 102:19:@3422.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 119:18:@3448.4]
  assign txm_clock = clock; // @[:@3381.4]
  assign txm_reset = reset; // @[:@3382.4]
  assign txm_io_in_valid = txen; // @[uart.scala 75:19:@3396.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 76:19:@3397.4]
  assign txm_io_div = baud_r; // @[uart.scala 77:19:@3398.4]
  assign rxm_clock = clock; // @[:@3384.4]
  assign rxm_reset = reset; // @[:@3385.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 82:19:@3401.4]
  assign rxm_io_div = baud_r; // @[uart.scala 79:19:@3400.4]
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
module SPI( // @[:@3494.2]
  input         clock, // @[:@3495.4]
  input         reset, // @[:@3496.4]
  input         io_spi_select, // @[:@3497.4]
  output        io_spi_cs, // @[:@3497.4]
  output        io_spi_clk, // @[:@3497.4]
  output        io_spi_mosi, // @[:@3497.4]
  output        io_spi_cs_en, // @[:@3497.4]
  output        io_spi_clk_en, // @[:@3497.4]
  output        io_spi_mosi_en, // @[:@3497.4]
  input         io_spi_miso, // @[:@3497.4]
  output        io_spi_intr, // @[:@3497.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3497.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3497.4]
  input         io_wbs_m2s_we, // @[:@3497.4]
  input         io_wbs_m2s_stb, // @[:@3497.4]
  output        io_wbs_ack_o, // @[:@3497.4]
  output [31:0] io_wbs_data_o // @[:@3497.4]
);
  reg  ack_o; // @[spi.scala 68:25:@3499.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 69:25:@3500.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 72:23:@3502.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 73:23:@3503.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 78:31:@3510.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 81:28:@3513.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 82:28:@3514.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 83:28:@3515.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 85:30:@3516.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 86:30:@3517.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 87:30:@3518.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 90:27:@3519.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 91:27:@3520.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 92:27:@3521.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 93:27:@3522.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 94:27:@3523.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 95:27:@3524.4]
  reg [31:0] _RAND_16;
  reg  bit_spi_en; // @[spi.scala 96:27:@3525.4]
  reg [31:0] _RAND_17;
  reg  bit_toe; // @[spi.scala 99:27:@3526.4]
  reg [31:0] _RAND_18;
  reg  bit_roe; // @[spi.scala 100:27:@3527.4]
  reg [31:0] _RAND_19;
  reg  bit_trdy; // @[spi.scala 101:27:@3528.4]
  reg [31:0] _RAND_20;
  reg  bit_rrdy; // @[spi.scala 102:27:@3529.4]
  reg [31:0] _RAND_21;
  reg  bit_tmt; // @[spi.scala 103:27:@3530.4]
  reg [31:0] _RAND_22;
  reg  bit_e; // @[spi.scala 104:27:@3531.4]
  reg [31:0] _RAND_23;
  wire [7:0] addr; // @[spi.scala 110:33:@3532.4]
  wire  _T_112; // @[spi.scala 112:19:@3533.4]
  wire  rd_en; // @[spi.scala 112:34:@3534.4]
  wire  wr_en; // @[spi.scala 113:33:@3537.4]
  wire  _T_123; // @[spi.scala 117:32:@3541.4]
  wire  sel_reg_rx; // @[spi.scala 117:54:@3542.4]
  wire  _T_124; // @[spi.scala 118:32:@3543.4]
  wire  sel_reg_tx; // @[spi.scala 118:54:@3544.4]
  wire  _T_126; // @[spi.scala 120:32:@3547.4]
  wire  sel_reg_control; // @[spi.scala 120:55:@3548.4]
  wire  _T_127; // @[spi.scala 121:32:@3549.4]
  wire  sel_reg_status; // @[spi.scala 121:54:@3550.4]
  wire  _T_128; // @[spi.scala 122:32:@3551.4]
  wire  sel_reg_ssmask; // @[spi.scala 122:55:@3552.4]
  wire [7:0] _GEN_0; // @[spi.scala 125:23:@3553.4]
  wire  _T_129; // @[spi.scala 130:14:@3556.4]
  wire  _T_130; // @[spi.scala 130:28:@3557.4]
  wire [7:0] spi_wdata; // @[:@3511.4 :@3512.4 spi.scala 114:16:@3540.4]
  wire [7:0] _GEN_1; // @[spi.scala 130:41:@3558.4]
  wire  _T_131; // @[spi.scala 135:19:@3561.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3568.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3575.4]
  wire  _T_145; // @[spi.scala 142:14:@3576.4]
  wire  _T_146; // @[spi.scala 143:28:@3578.6]
  wire  _T_147; // @[spi.scala 144:28:@3580.6]
  wire  _T_148; // @[spi.scala 145:28:@3582.6]
  wire  _T_149; // @[spi.scala 146:28:@3584.6]
  wire  _T_150; // @[spi.scala 147:28:@3586.6]
  wire  _T_151; // @[spi.scala 148:28:@3588.6]
  wire  _T_152; // @[spi.scala 149:28:@3590.6]
  wire  _GEN_2; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_3; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_4; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_5; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_6; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_7; // @[spi.scala 142:34:@3577.4]
  wire  _GEN_8; // @[spi.scala 142:34:@3577.4]
  wire  _T_153; // @[spi.scala 156:41:@3596.4]
  wire  _T_154; // @[spi.scala 156:62:@3597.4]
  wire  _T_155; // @[spi.scala 156:51:@3598.4]
  wire  _T_156; // @[spi.scala 156:29:@3599.4]
  wire  _T_157; // @[spi.scala 156:87:@3600.4]
  wire  _T_158; // @[spi.scala 156:74:@3601.4]
  wire  _T_159; // @[spi.scala 156:112:@3602.4]
  wire  _T_163; // @[spi.scala 163:39:@3610.6]
  wire  _T_164; // @[spi.scala 163:30:@3611.6]
  wire  _GEN_9; // @[spi.scala 163:59:@3612.6]
  wire  _GEN_10; // @[spi.scala 161:15:@3605.4]
  wire  _T_168; // @[spi.scala 170:35:@3621.6]
  wire  _T_169; // @[spi.scala 170:30:@3622.6]
  wire  _GEN_11; // @[spi.scala 170:43:@3623.6]
  wire  _GEN_12; // @[spi.scala 168:15:@3616.4]
  reg [4:0] clock_cnt; // @[spi.scala 175:31:@3626.4]
  reg [31:0] _RAND_24;
  reg [5:0] data_cnt; // @[spi.scala 176:31:@3627.4]
  reg [31:0] _RAND_25;
  reg  pending_data; // @[spi.scala 177:31:@3628.4]
  reg [31:0] _RAND_26;
  reg [2:0] n_status; // @[spi.scala 179:31:@3631.4]
  reg [31:0] _RAND_27;
  reg [2:0] p_status; // @[spi.scala 180:31:@3632.4]
  reg [31:0] _RAND_28;
  wire  _T_182; // @[spi.scala 184:27:@3638.6]
  wire  _GEN_13; // @[spi.scala 184:40:@3639.6]
  wire  _GEN_14; // @[spi.scala 182:32:@3634.4]
  wire [7:0] _T_188; // @[spi.scala 190:78:@3645.6]
  wire [7:0] _T_189; // @[spi.scala 190:44:@3646.6]
  wire [7:0] _T_190; // @[spi.scala 190:12:@3647.6]
  wire [7:0] _T_191; // @[spi.scala 189:49:@3648.6]
  wire [7:0] _T_192; // @[spi.scala 189:21:@3649.6]
  wire [7:0] _GEN_15; // @[spi.scala 188:18:@3642.4]
  wire  _T_193; // @[spi.scala 194:16:@3653.4]
  wire  _GEN_16; // @[spi.scala 194:35:@3654.4]
  wire  _T_196; // @[spi.scala 210:21:@3660.4]
  wire  _T_198; // @[spi.scala 210:49:@3661.4]
  wire  _T_199; // @[spi.scala 210:35:@3662.4]
  wire  _T_200; // @[spi.scala 211:18:@3664.6]
  wire  _GEN_17; // @[spi.scala 210:67:@3663.4]
  wire  _T_204; // @[spi.scala 217:59:@3670.4]
  wire  _T_205; // @[spi.scala 217:39:@3671.4]
  wire  _T_207; // @[spi.scala 217:71:@3673.4]
  wire [8:0] _T_211; // @[Cat.scala 30:58:@3681.8]
  wire [8:0] _GEN_19; // @[spi.scala 217:99:@3674.4]
  wire  _T_212; // @[spi.scala 226:20:@3685.4]
  wire  _T_213; // @[spi.scala 226:47:@3686.4]
  wire  _T_214; // @[spi.scala 226:34:@3687.4]
  wire  _GEN_20; // @[spi.scala 228:33:@3692.6]
  wire  _GEN_21; // @[spi.scala 226:62:@3688.4]
  wire  _T_219; // @[spi.scala 232:49:@3696.4]
  wire  _T_220; // @[spi.scala 232:36:@3697.4]
  wire [5:0] _T_223; // @[spi.scala 235:30:@3702.6]
  wire [4:0] _T_224; // @[spi.scala 235:30:@3703.6]
  wire [4:0] _GEN_22; // @[spi.scala 232:63:@3698.4]
  wire [2:0] _GEN_23; // @[spi.scala 244:26:@3714.6]
  wire  _T_237; // @[spi.scala 255:27:@3733.8]
  wire  _T_241; // @[spi.scala 256:53:@3736.10]
  wire  _T_242; // @[spi.scala 256:40:@3737.10]
  wire [2:0] _GEN_25; // @[spi.scala 256:76:@3738.10]
  wire  _T_246; // @[spi.scala 262:53:@3749.12]
  wire  _T_247; // @[spi.scala 262:40:@3750.12]
  wire  _T_250; // @[spi.scala 262:69:@3752.12]
  wire [2:0] _GEN_26; // @[spi.scala 262:105:@3753.12]
  wire  _T_251; // @[spi.scala 267:27:@3761.12]
  wire [2:0] _GEN_28; // @[spi.scala 268:39:@3764.14]
  wire  _T_255; // @[spi.scala 275:27:@3774.14]
  wire  _T_259; // @[spi.scala 276:53:@3777.16]
  wire  _T_260; // @[spi.scala 276:40:@3778.16]
  wire [2:0] _GEN_29; // @[spi.scala 276:77:@3779.16]
  wire [2:0] _GEN_30; // @[spi.scala 275:44:@3775.14]
  wire [2:0] _GEN_31; // @[spi.scala 267:46:@3762.12]
  wire [2:0] _GEN_32; // @[spi.scala 261:41:@3747.10]
  wire [2:0] _GEN_33; // @[spi.scala 255:40:@3734.8]
  wire [2:0] _GEN_34; // @[spi.scala 249:40:@3723.6]
  wire [2:0] _GEN_35; // @[spi.scala 243:32:@3713.4]
  wire  _T_264; // @[spi.scala 285:32:@3791.4]
  wire  _T_267; // @[spi.scala 285:63:@3793.4]
  wire  _T_274; // @[spi.scala 287:73:@3802.6]
  wire  _T_277; // @[spi.scala 287:102:@3804.6]
  wire  _T_282; // @[spi.scala 289:45:@3811.8]
  wire  _T_285; // @[spi.scala 289:76:@3813.8]
  wire  _T_299; // @[spi.scala 291:133:@3826.10]
  wire  _T_300; // @[spi.scala 291:74:@3827.10]
  wire  _T_305; // @[spi.scala 291:174:@3831.10]
  wire [6:0] _T_307; // @[spi.scala 292:28:@3833.12]
  wire [5:0] _T_308; // @[spi.scala 292:28:@3834.12]
  wire [5:0] _GEN_36; // @[spi.scala 291:238:@3832.10]
  wire [5:0] _GEN_37; // @[spi.scala 289:113:@3814.8]
  wire [5:0] _GEN_38; // @[spi.scala 287:138:@3805.6]
  wire [5:0] _GEN_39; // @[spi.scala 285:99:@3794.4]
  reg  wait_one_tick_done; // @[spi.scala 295:37:@3837.4]
  reg [31:0] _RAND_29;
  wire  _T_329; // @[spi.scala 307:72:@3859.6]
  wire [8:0] _T_336; // @[Cat.scala 30:58:@3864.6]
  wire  _T_349; // @[spi.scala 311:80:@3878.10]
  wire [8:0] _T_356; // @[Cat.scala 30:58:@3883.10]
  wire  _GEN_43; // @[spi.scala 310:32:@3876.8]
  wire [8:0] _GEN_44; // @[spi.scala 310:32:@3876.8]
  wire  _GEN_45; // @[spi.scala 309:114:@3875.6]
  wire [8:0] _GEN_46; // @[spi.scala 309:114:@3875.6]
  wire  _GEN_47; // @[spi.scala 306:37:@3857.4]
  wire [8:0] _GEN_48; // @[spi.scala 306:37:@3857.4]
  wire  _GEN_49; // @[spi.scala 319:39:@3895.6]
  wire  _GEN_50; // @[spi.scala 317:36:@3890.4]
  wire  _T_363; // @[spi.scala 323:12:@3898.4]
  wire  _T_364; // @[spi.scala 323:22:@3899.4]
  wire  _T_365; // @[spi.scala 323:31:@3900.4]
  wire  _T_367; // @[spi.scala 325:24:@3905.6]
  wire  _GEN_51; // @[spi.scala 325:43:@3906.6]
  wire  _GEN_52; // @[spi.scala 323:46:@3901.4]
  wire  _T_372; // @[spi.scala 329:40:@3911.4]
  wire  _GEN_53; // @[spi.scala 330:22:@3913.6]
  wire  _GEN_54; // @[spi.scala 330:22:@3913.6]
  wire  _T_375; // @[spi.scala 335:24:@3921.6]
  wire  _GEN_55; // @[spi.scala 335:39:@3922.6]
  wire  _GEN_56; // @[spi.scala 335:39:@3922.6]
  wire  _GEN_57; // @[spi.scala 329:72:@3912.4]
  wire  _GEN_58; // @[spi.scala 329:72:@3912.4]
  wire  _T_378; // @[spi.scala 340:21:@3926.4]
  wire  _T_379; // @[spi.scala 340:34:@3927.4]
  wire  _GEN_59; // @[spi.scala 340:51:@3928.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 110:33:@3532.4]
  assign _T_112 = io_wbs_m2s_we == 1'h0; // @[spi.scala 112:19:@3533.4]
  assign rd_en = _T_112 & io_wbs_m2s_stb; // @[spi.scala 112:34:@3534.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 113:33:@3537.4]
  assign _T_123 = addr == 8'h0; // @[spi.scala 117:32:@3541.4]
  assign sel_reg_rx = _T_123 & io_spi_select; // @[spi.scala 117:54:@3542.4]
  assign _T_124 = addr == 8'h1; // @[spi.scala 118:32:@3543.4]
  assign sel_reg_tx = _T_124 & io_spi_select; // @[spi.scala 118:54:@3544.4]
  assign _T_126 = addr == 8'h3; // @[spi.scala 120:32:@3547.4]
  assign sel_reg_control = _T_126 & io_spi_select; // @[spi.scala 120:55:@3548.4]
  assign _T_127 = addr == 8'h4; // @[spi.scala 121:32:@3549.4]
  assign sel_reg_status = _T_127 & io_spi_select; // @[spi.scala 121:54:@3550.4]
  assign _T_128 = addr == 8'h5; // @[spi.scala 122:32:@3551.4]
  assign sel_reg_ssmask = _T_128 & io_spi_select; // @[spi.scala 122:55:@3552.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 125:23:@3553.4]
  assign _T_129 = wr_en & sel_reg_tx; // @[spi.scala 130:14:@3556.4]
  assign _T_130 = _T_129 & bit_trdy; // @[spi.scala 130:28:@3557.4]
  assign spi_wdata = io_wbs_m2s_data[7:0]; // @[:@3511.4 :@3512.4 spi.scala 114:16:@3540.4]
  assign _GEN_1 = _T_130 ? spi_wdata : reg_txdata; // @[spi.scala 130:41:@3558.4]
  assign _T_131 = bit_toe | bit_roe; // @[spi.scala 135:19:@3561.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3568.4]
  assign reg_control = {bit_sso,bit_spi_en,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3575.4]
  assign _T_145 = wr_en & sel_reg_control; // @[spi.scala 142:14:@3576.4]
  assign _T_146 = spi_wdata[0]; // @[spi.scala 143:28:@3578.6]
  assign _T_147 = spi_wdata[1]; // @[spi.scala 144:28:@3580.6]
  assign _T_148 = spi_wdata[3]; // @[spi.scala 145:28:@3582.6]
  assign _T_149 = spi_wdata[4]; // @[spi.scala 146:28:@3584.6]
  assign _T_150 = spi_wdata[5]; // @[spi.scala 147:28:@3586.6]
  assign _T_151 = spi_wdata[6]; // @[spi.scala 148:28:@3588.6]
  assign _T_152 = spi_wdata[7]; // @[spi.scala 149:28:@3590.6]
  assign _GEN_2 = _T_145 ? _T_146 : bit_iroe; // @[spi.scala 142:34:@3577.4]
  assign _GEN_3 = _T_145 ? _T_147 : bit_itoe; // @[spi.scala 142:34:@3577.4]
  assign _GEN_4 = _T_145 ? _T_148 : bit_itrdy; // @[spi.scala 142:34:@3577.4]
  assign _GEN_5 = _T_145 ? _T_149 : bit_irrdy; // @[spi.scala 142:34:@3577.4]
  assign _GEN_6 = _T_145 ? _T_150 : bit_ie; // @[spi.scala 142:34:@3577.4]
  assign _GEN_7 = _T_145 ? _T_151 : bit_spi_en; // @[spi.scala 142:34:@3577.4]
  assign _GEN_8 = _T_145 ? _T_152 : bit_sso; // @[spi.scala 142:34:@3577.4]
  assign _T_153 = bit_iroe & bit_roe; // @[spi.scala 156:41:@3596.4]
  assign _T_154 = bit_itoe & bit_toe; // @[spi.scala 156:62:@3597.4]
  assign _T_155 = _T_153 | _T_154; // @[spi.scala 156:51:@3598.4]
  assign _T_156 = bit_ie & _T_155; // @[spi.scala 156:29:@3599.4]
  assign _T_157 = bit_itrdy & bit_trdy; // @[spi.scala 156:87:@3600.4]
  assign _T_158 = _T_156 | _T_157; // @[spi.scala 156:74:@3601.4]
  assign _T_159 = bit_irrdy & bit_rrdy; // @[spi.scala 156:112:@3602.4]
  assign _T_163 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 163:39:@3610.6]
  assign _T_164 = io_wbs_m2s_stb & _T_163; // @[spi.scala 163:30:@3611.6]
  assign _GEN_9 = _T_164 ? 1'h1 : ack_o; // @[spi.scala 163:59:@3612.6]
  assign _GEN_10 = ack_o ? 1'h0 : _GEN_9; // @[spi.scala 161:15:@3605.4]
  assign _T_168 = ~ io_wbs_m2s_we; // @[spi.scala 170:35:@3621.6]
  assign _T_169 = io_wbs_m2s_stb & _T_168; // @[spi.scala 170:30:@3622.6]
  assign _GEN_11 = _T_169 ? 1'h1 : read_wait_done; // @[spi.scala 170:43:@3623.6]
  assign _GEN_12 = ack_o ? 1'h0 : _GEN_11; // @[spi.scala 168:15:@3616.4]
  assign _T_182 = n_status == 3'h1; // @[spi.scala 184:27:@3638.6]
  assign _GEN_13 = _T_182 ? 1'h0 : pending_data; // @[spi.scala 184:40:@3639.6]
  assign _GEN_14 = _T_129 ? 1'h1 : _GEN_13; // @[spi.scala 182:32:@3634.4]
  assign _T_188 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 190:78:@3645.6]
  assign _T_189 = sel_reg_control ? reg_control : _T_188; // @[spi.scala 190:44:@3646.6]
  assign _T_190 = sel_reg_status ? reg_status : _T_189; // @[spi.scala 190:12:@3647.6]
  assign _T_191 = sel_reg_tx ? reg_txdata : _T_190; // @[spi.scala 189:49:@3648.6]
  assign _T_192 = sel_reg_rx ? reg_rxdata : _T_191; // @[spi.scala 189:21:@3649.6]
  assign _GEN_15 = rd_en ? _T_192 : rd_data; // @[spi.scala 188:18:@3642.4]
  assign _T_193 = wr_en & sel_reg_ssmask; // @[spi.scala 194:16:@3653.4]
  assign _GEN_16 = _T_193 ? _T_146 : reg_ssmask; // @[spi.scala 194:35:@3654.4]
  assign _T_196 = n_status == 3'h3; // @[spi.scala 210:21:@3660.4]
  assign _T_198 = clock_cnt == 5'h3; // @[spi.scala 210:49:@3661.4]
  assign _T_199 = _T_196 & _T_198; // @[spi.scala 210:35:@3662.4]
  assign _T_200 = ~ sclk_r; // @[spi.scala 211:18:@3664.6]
  assign _GEN_17 = _T_199 ? _T_200 : sclk_r; // @[spi.scala 210:67:@3663.4]
  assign _T_204 = 1'h0 == sclk_r; // @[spi.scala 217:59:@3670.4]
  assign _T_205 = _T_198 & _T_204; // @[spi.scala 217:39:@3671.4]
  assign _T_207 = _T_205 & _T_196; // @[spi.scala 217:71:@3673.4]
  assign _T_211 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3681.8]
  assign _GEN_19 = _T_207 ? _T_211 : {{1'd0}, rx_shift_data}; // @[spi.scala 217:99:@3674.4]
  assign _T_212 = p_status == 3'h3; // @[spi.scala 226:20:@3685.4]
  assign _T_213 = n_status != 3'h3; // @[spi.scala 226:47:@3686.4]
  assign _T_214 = _T_212 & _T_213; // @[spi.scala 226:34:@3687.4]
  assign _GEN_20 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 228:33:@3692.6]
  assign _GEN_21 = _T_214 ? 1'h1 : _GEN_20; // @[spi.scala 226:62:@3688.4]
  assign _T_219 = n_status == 3'h0; // @[spi.scala 232:49:@3696.4]
  assign _T_220 = _T_198 | _T_219; // @[spi.scala 232:36:@3697.4]
  assign _T_223 = clock_cnt + 5'h1; // @[spi.scala 235:30:@3702.6]
  assign _T_224 = clock_cnt + 5'h1; // @[spi.scala 235:30:@3703.6]
  assign _GEN_22 = _T_220 ? 5'h0 : _T_224; // @[spi.scala 232:63:@3698.4]
  assign _GEN_23 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 244:26:@3714.6]
  assign _T_237 = n_status == 3'h2; // @[spi.scala 255:27:@3733.8]
  assign _T_241 = data_cnt == 6'h1; // @[spi.scala 256:53:@3736.10]
  assign _T_242 = _T_198 & _T_241; // @[spi.scala 256:40:@3737.10]
  assign _GEN_25 = _T_242 ? 3'h3 : 3'h2; // @[spi.scala 256:76:@3738.10]
  assign _T_246 = data_cnt == 6'h7; // @[spi.scala 262:53:@3749.12]
  assign _T_247 = _T_198 & _T_246; // @[spi.scala 262:40:@3750.12]
  assign _T_250 = _T_247 & sclk_r; // @[spi.scala 262:69:@3752.12]
  assign _GEN_26 = _T_250 ? 3'h4 : 3'h3; // @[spi.scala 262:105:@3753.12]
  assign _T_251 = n_status == 3'h4; // @[spi.scala 267:27:@3761.12]
  assign _GEN_28 = _T_198 ? 3'h5 : n_status; // @[spi.scala 268:39:@3764.14]
  assign _T_255 = n_status == 3'h5; // @[spi.scala 275:27:@3774.14]
  assign _T_259 = data_cnt == 6'h2; // @[spi.scala 276:53:@3777.16]
  assign _T_260 = _T_198 & _T_259; // @[spi.scala 276:40:@3778.16]
  assign _GEN_29 = _T_260 ? 3'h0 : 3'h5; // @[spi.scala 276:77:@3779.16]
  assign _GEN_30 = _T_255 ? _GEN_29 : 3'h0; // @[spi.scala 275:44:@3775.14]
  assign _GEN_31 = _T_251 ? _GEN_28 : _GEN_30; // @[spi.scala 267:46:@3762.12]
  assign _GEN_32 = _T_196 ? _GEN_26 : _GEN_31; // @[spi.scala 261:41:@3747.10]
  assign _GEN_33 = _T_237 ? _GEN_25 : _GEN_32; // @[spi.scala 255:40:@3734.8]
  assign _GEN_34 = _T_182 ? 3'h2 : _GEN_33; // @[spi.scala 249:40:@3723.6]
  assign _GEN_35 = _T_219 ? _GEN_23 : _GEN_34; // @[spi.scala 243:32:@3713.4]
  assign _T_264 = _T_237 & _T_198; // @[spi.scala 285:32:@3791.4]
  assign _T_267 = _T_264 & _T_241; // @[spi.scala 285:63:@3793.4]
  assign _T_274 = _T_199 & _T_246; // @[spi.scala 287:73:@3802.6]
  assign _T_277 = _T_274 & sclk_r; // @[spi.scala 287:102:@3804.6]
  assign _T_282 = _T_255 & _T_198; // @[spi.scala 289:45:@3811.8]
  assign _T_285 = _T_282 & _T_259; // @[spi.scala 289:76:@3813.8]
  assign _T_299 = _T_199 & sclk_r; // @[spi.scala 291:133:@3826.10]
  assign _T_300 = _T_264 | _T_299; // @[spi.scala 291:74:@3827.10]
  assign _T_305 = _T_300 | _T_282; // @[spi.scala 291:174:@3831.10]
  assign _T_307 = data_cnt + 6'h1; // @[spi.scala 292:28:@3833.12]
  assign _T_308 = data_cnt + 6'h1; // @[spi.scala 292:28:@3834.12]
  assign _GEN_36 = _T_305 ? _T_308 : data_cnt; // @[spi.scala 291:238:@3832.10]
  assign _GEN_37 = _T_285 ? 6'h0 : _GEN_36; // @[spi.scala 289:113:@3814.8]
  assign _GEN_38 = _T_277 ? 6'h0 : _GEN_37; // @[spi.scala 287:138:@3805.6]
  assign _GEN_39 = _T_267 ? 6'h0 : _GEN_38; // @[spi.scala 285:99:@3794.4]
  assign _T_329 = reg_txdata[7]; // @[spi.scala 307:72:@3859.6]
  assign _T_336 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3864.6]
  assign _T_349 = tx_shift_data[7]; // @[spi.scala 311:80:@3878.10]
  assign _T_356 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3883.10]
  assign _GEN_43 = wait_one_tick_done ? _T_349 : mosi_r; // @[spi.scala 310:32:@3876.8]
  assign _GEN_44 = wait_one_tick_done ? _T_356 : {{1'd0}, tx_shift_data}; // @[spi.scala 310:32:@3876.8]
  assign _GEN_45 = _T_299 ? _GEN_43 : mosi_r; // @[spi.scala 309:114:@3875.6]
  assign _GEN_46 = _T_299 ? _GEN_44 : {{1'd0}, tx_shift_data}; // @[spi.scala 309:114:@3875.6]
  assign _GEN_47 = _T_237 ? _T_329 : _GEN_45; // @[spi.scala 306:37:@3857.4]
  assign _GEN_48 = _T_237 ? _T_336 : _GEN_46; // @[spi.scala 306:37:@3857.4]
  assign _GEN_49 = _T_129 ? 1'h0 : bit_trdy; // @[spi.scala 319:39:@3895.6]
  assign _GEN_50 = _T_196 ? 1'h1 : _GEN_49; // @[spi.scala 317:36:@3890.4]
  assign _T_363 = bit_trdy == 1'h0; // @[spi.scala 323:12:@3898.4]
  assign _T_364 = _T_363 & wr_en; // @[spi.scala 323:22:@3899.4]
  assign _T_365 = _T_364 & sel_reg_tx; // @[spi.scala 323:31:@3900.4]
  assign _T_367 = wr_en & sel_reg_status; // @[spi.scala 325:24:@3905.6]
  assign _GEN_51 = _T_367 ? 1'h0 : bit_toe; // @[spi.scala 325:43:@3906.6]
  assign _GEN_52 = _T_365 ? 1'h1 : _GEN_51; // @[spi.scala 323:46:@3901.4]
  assign _T_372 = _T_251 & _T_198; // @[spi.scala 329:40:@3911.4]
  assign _GEN_53 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 330:22:@3913.6]
  assign _GEN_54 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 330:22:@3913.6]
  assign _T_375 = rd_en & sel_reg_rx; // @[spi.scala 335:24:@3921.6]
  assign _GEN_55 = _T_375 ? 1'h0 : bit_rrdy; // @[spi.scala 335:39:@3922.6]
  assign _GEN_56 = _T_375 ? 1'h0 : bit_roe; // @[spi.scala 335:39:@3922.6]
  assign _GEN_57 = _T_372 ? _GEN_53 : _GEN_56; // @[spi.scala 329:72:@3912.4]
  assign _GEN_58 = _T_372 ? _GEN_54 : _GEN_55; // @[spi.scala 329:72:@3912.4]
  assign _T_378 = n_status != 3'h0; // @[spi.scala 340:21:@3926.4]
  assign _T_379 = _T_378 | pending_data; // @[spi.scala 340:34:@3927.4]
  assign _GEN_59 = _T_379 ? 1'h0 : 1'h1; // @[spi.scala 340:51:@3928.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 207:13:@3659.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 213:16:@3667.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 315:15:@3888.4]
  assign io_spi_cs_en = bit_spi_en; // @[spi.scala 153:18:@3593.4]
  assign io_spi_clk_en = bit_spi_en; // @[spi.scala 155:18:@3595.4]
  assign io_spi_mosi_en = bit_spi_en; // @[spi.scala 154:18:@3594.4]
  assign io_spi_intr = _T_158 | _T_159; // @[spi.scala 156:18:@3604.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 166:15:@3615.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 192:18:@3652.4]
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
  bit_spi_en = _RAND_17[0:0];
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
        reg_txdata <= spi_wdata;
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
      bit_spi_en <= 1'h0;
    end else begin
      if (_T_145) begin
        bit_spi_en <= _T_151;
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
module WB_InterConnect( // @[:@3935.2]
  input         clock, // @[:@3936.4]
  input         reset, // @[:@3937.4]
  input  [31:0] io_dbus_addr, // @[:@3938.4]
  input  [31:0] io_dbus_wdata, // @[:@3938.4]
  output [31:0] io_dbus_rdata, // @[:@3938.4]
  input         io_dbus_rd_en, // @[:@3938.4]
  input         io_dbus_wr_en, // @[:@3938.4]
  input  [1:0]  io_dbus_st_type, // @[:@3938.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3938.4]
  output        io_dbus_valid, // @[:@3938.4]
  input  [31:0] io_ibus_addr, // @[:@3938.4]
  output [31:0] io_ibus_inst, // @[:@3938.4]
  output        io_ibus_valid, // @[:@3938.4]
  output [8:0]  io_imem_io_addr, // @[:@3938.4]
  input  [31:0] io_imem_io_rdata, // @[:@3938.4]
  output [31:0] io_imem_io_wdata, // @[:@3938.4]
  output        io_imem_io_wr_en, // @[:@3938.4]
  output        io_imem_io_cs, // @[:@3938.4]
  output [3:0]  io_imem_io_st_type, // @[:@3938.4]
  output [8:0]  io_dmem_io_addr, // @[:@3938.4]
  output [31:0] io_dmem_io_wdata, // @[:@3938.4]
  input  [31:0] io_dmem_io_rdata, // @[:@3938.4]
  output        io_dmem_io_cs, // @[:@3938.4]
  output        io_dmem_io_wr_en, // @[:@3938.4]
  output [3:0]  io_dmem_io_st_type, // @[:@3938.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3938.4]
  output [31:0] io_wbm_m2s_data, // @[:@3938.4]
  output        io_wbm_m2s_we, // @[:@3938.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3938.4]
  output        io_wbm_m2s_stb, // @[:@3938.4]
  output        io_uart_tx, // @[:@3938.4]
  output        io_uart_tx_en, // @[:@3938.4]
  input         io_uart_rx, // @[:@3938.4]
  output        io_uart_irq, // @[:@3938.4]
  output        io_spi_cs, // @[:@3938.4]
  output        io_spi_clk, // @[:@3938.4]
  output        io_spi_mosi, // @[:@3938.4]
  input         io_spi_miso, // @[:@3938.4]
  output        io_spi_irq, // @[:@3938.4]
  output        io_spi_cs_en, // @[:@3938.4]
  output        io_spi_clk_en, // @[:@3938.4]
  output        io_spi_mosi_en, // @[:@3938.4]
  input         io_m1_ack_i, // @[:@3938.4]
  input  [31:0] io_m1_data_i, // @[:@3938.4]
  output        io_m1_addr_sel, // @[:@3938.4]
  input         io_m2_ack_i, // @[:@3938.4]
  input  [31:0] io_m2_data_i, // @[:@3938.4]
  output        io_m2_addr_sel, // @[:@3938.4]
  input         io_m3_ack_i, // @[:@3938.4]
  input  [31:0] io_m3_data_i, // @[:@3938.4]
  output        io_m3_addr_sel // @[:@3938.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_reset; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [8:0] dmem_io_dmem_io_addr; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [31:0] dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [31:0] dmem_io_dmem_io_rdata; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_io_dmem_io_cs; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 87:24:@3940.4]
  wire [3:0] dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 87:24:@3940.4]
  wire  imem_clock; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_reset; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [8:0] imem_io_imem_io_addr; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_imem_io_rdata; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] imem_io_imem_io_wdata; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_imem_io_wr_en; // @[wb_interconnect.scala 88:24:@3943.4]
  wire  imem_io_imem_io_cs; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [3:0] imem_io_imem_io_st_type; // @[wb_interconnect.scala 88:24:@3943.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 89:24:@3946.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 89:24:@3946.4]
  wire  uart_clock; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_reset; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_tx_en; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 90:24:@3949.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 90:24:@3949.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 90:24:@3949.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 90:24:@3949.4]
  wire  spi_clock; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_reset; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_cs_en; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_clk_en; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_mosi_en; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 91:24:@3952.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 91:24:@3952.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 91:24:@3952.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 91:24:@3952.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 91:24:@3952.4]
  wire [3:0] address; // @[wb_interconnect.scala 101:50:@3978.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 102:35:@3979.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 103:35:@3980.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 104:35:@3981.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 105:35:@3982.4]
  wire  m1_addr_match; // @[wb_interconnect.scala 106:35:@3983.4]
  wire  m2_addr_match; // @[wb_interconnect.scala 107:35:@3984.4]
  wire  m3_addr_match; // @[wb_interconnect.scala 108:35:@3985.4]
  reg  imem_sel; // @[wb_interconnect.scala 134:22:@4019.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 135:22:@4020.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 136:22:@4021.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 137:22:@4022.4]
  reg [31:0] _RAND_3;
  reg  m1_sel; // @[wb_interconnect.scala 138:22:@4023.4]
  reg [31:0] _RAND_4;
  reg  m2_sel; // @[wb_interconnect.scala 139:22:@4024.4]
  reg [31:0] _RAND_5;
  reg  m3_sel; // @[wb_interconnect.scala 140:22:@4025.4]
  reg [31:0] _RAND_6;
  wire [31:0] _T_120; // @[wb_interconnect.scala 156:45:@4040.4]
  wire [31:0] _T_121; // @[wb_interconnect.scala 155:43:@4041.4]
  wire [31:0] _T_122; // @[wb_interconnect.scala 154:41:@4042.4]
  wire [31:0] _T_123; // @[wb_interconnect.scala 153:39:@4043.4]
  wire [31:0] _T_124; // @[wb_interconnect.scala 152:37:@4044.4]
  wire [31:0] _T_125; // @[wb_interconnect.scala 151:35:@4045.4]
  wire  _T_128; // @[wb_interconnect.scala 164:45:@4048.4]
  wire  _T_129; // @[wb_interconnect.scala 163:43:@4049.4]
  wire  _T_130; // @[wb_interconnect.scala 162:41:@4050.4]
  wire  _T_131; // @[wb_interconnect.scala 161:39:@4051.4]
  wire  _T_132; // @[wb_interconnect.scala 160:37:@4052.4]
  wire  _T_133; // @[wb_interconnect.scala 159:35:@4053.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 87:24:@3940.4]
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
  IMem_Interface imem ( // @[wb_interconnect.scala 88:24:@3943.4]
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
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 89:24:@3946.4]
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
  UART uart ( // @[wb_interconnect.scala 90:24:@3949.4]
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
  SPI spi ( // @[wb_interconnect.scala 91:24:@3952.4]
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
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 101:50:@3978.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 102:35:@3979.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 103:35:@3980.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 104:35:@3981.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 105:35:@3982.4]
  assign m1_addr_match = address == 4'h4; // @[wb_interconnect.scala 106:35:@3983.4]
  assign m2_addr_match = address == 4'h5; // @[wb_interconnect.scala 107:35:@3984.4]
  assign m3_addr_match = address == 4'h6; // @[wb_interconnect.scala 108:35:@3985.4]
  assign _T_120 = m3_sel ? io_m3_data_i : 32'h0; // @[wb_interconnect.scala 156:45:@4040.4]
  assign _T_121 = m2_sel ? io_m2_data_i : _T_120; // @[wb_interconnect.scala 155:43:@4041.4]
  assign _T_122 = m1_sel ? io_m1_data_i : _T_121; // @[wb_interconnect.scala 154:41:@4042.4]
  assign _T_123 = spi_sel ? spi_io_wbs_data_o : _T_122; // @[wb_interconnect.scala 153:39:@4043.4]
  assign _T_124 = uart_sel ? uart_io_wbs_data_o : _T_123; // @[wb_interconnect.scala 152:37:@4044.4]
  assign _T_125 = imem_sel ? imem_io_wbs_data_o : _T_124; // @[wb_interconnect.scala 151:35:@4045.4]
  assign _T_128 = m3_sel ? io_m3_ack_i : 1'h0; // @[wb_interconnect.scala 164:45:@4048.4]
  assign _T_129 = m2_sel ? io_m2_ack_i : _T_128; // @[wb_interconnect.scala 163:43:@4049.4]
  assign _T_130 = m1_sel ? io_m1_ack_i : _T_129; // @[wb_interconnect.scala 162:41:@4050.4]
  assign _T_131 = spi_sel ? spi_io_wbs_ack_o : _T_130; // @[wb_interconnect.scala 161:39:@4051.4]
  assign _T_132 = uart_sel ? uart_io_wbs_ack_o : _T_131; // @[wb_interconnect.scala 160:37:@4052.4]
  assign _T_133 = imem_sel ? imem_io_wbs_ack_o : _T_132; // @[wb_interconnect.scala 159:35:@4053.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 94:20:@3960.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 94:20:@3955.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 95:20:@3964.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 95:20:@3963.4]
  assign io_imem_io_addr = imem_io_imem_io_addr; // @[wb_interconnect.scala 97:20:@3971.4]
  assign io_imem_io_wdata = imem_io_imem_io_wdata; // @[wb_interconnect.scala 97:20:@3969.4]
  assign io_imem_io_wr_en = imem_io_imem_io_wr_en; // @[wb_interconnect.scala 97:20:@3968.4]
  assign io_imem_io_cs = imem_io_imem_io_cs; // @[wb_interconnect.scala 97:20:@3967.4]
  assign io_imem_io_st_type = imem_io_imem_io_st_type; // @[wb_interconnect.scala 97:20:@3966.4]
  assign io_dmem_io_addr = dmem_io_dmem_io_addr; // @[wb_interconnect.scala 98:20:@3977.4]
  assign io_dmem_io_wdata = dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 98:20:@3976.4]
  assign io_dmem_io_cs = dmem_io_dmem_io_cs; // @[wb_interconnect.scala 98:20:@3974.4]
  assign io_dmem_io_wr_en = dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 98:20:@3973.4]
  assign io_dmem_io_st_type = dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 98:20:@3972.4]
  assign io_wbm_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 131:14:@4018.4]
  assign io_wbm_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 131:14:@4017.4]
  assign io_wbm_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 131:14:@4016.4]
  assign io_wbm_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 131:14:@4015.4]
  assign io_wbm_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 131:14:@4014.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 170:24:@4058.4]
  assign io_uart_tx_en = uart_io_tx_en; // @[wb_interconnect.scala 171:24:@4059.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 172:24:@4060.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 177:24:@4063.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 178:24:@4064.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 179:24:@4065.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 180:24:@4066.4]
  assign io_spi_cs_en = spi_io_spi_cs_en; // @[wb_interconnect.scala 182:24:@4067.4]
  assign io_spi_clk_en = spi_io_spi_clk_en; // @[wb_interconnect.scala 183:24:@4068.4]
  assign io_spi_mosi_en = spi_io_spi_mosi_en; // @[wb_interconnect.scala 184:24:@4069.4]
  assign io_m1_addr_sel = address == 4'h4; // @[wb_interconnect.scala 111:18:@3986.4]
  assign io_m2_addr_sel = address == 4'h5; // @[wb_interconnect.scala 112:18:@3987.4]
  assign io_m3_addr_sel = address == 4'h6; // @[wb_interconnect.scala 113:18:@3988.4]
  assign dmem_clock = clock; // @[:@3941.4]
  assign dmem_reset = reset; // @[:@3942.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 117:20:@3994.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 117:20:@3993.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 117:20:@3992.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 117:20:@3991.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 117:20:@3990.4]
  assign dmem_io_dmem_io_rdata = io_dmem_io_rdata; // @[wb_interconnect.scala 98:20:@3975.4]
  assign imem_clock = clock; // @[:@3944.4]
  assign imem_reset = reset; // @[:@3945.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 95:20:@3965.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 121:20:@4000.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 121:20:@3999.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 121:20:@3998.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 121:20:@3997.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 121:20:@3996.4]
  assign imem_io_imem_io_rdata = io_imem_io_rdata; // @[wb_interconnect.scala 97:20:@3970.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 94:20:@3962.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 94:20:@3961.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 94:20:@3959.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 94:20:@3958.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 94:20:@3957.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 94:20:@3956.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_133; // @[wb_interconnect.scala 158:26:@4055.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_125; // @[wb_interconnect.scala 150:26:@4047.4]
  assign uart_clock = clock; // @[:@3950.4]
  assign uart_reset = reset; // @[:@3951.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 168:24:@4056.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 169:24:@4057.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 124:20:@4006.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 124:20:@4005.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 124:20:@4004.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 124:20:@4002.4]
  assign spi_clock = clock; // @[:@3953.4]
  assign spi_reset = reset; // @[:@3954.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 175:24:@4061.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 176:24:@4062.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 127:19:@4012.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 127:19:@4011.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 127:19:@4010.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 127:19:@4008.4]
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
  m1_sel = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  m2_sel = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  m3_sel = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    imem_sel <= imem_addr_match & imem_io_wbs_m2s_stb;
    dmem_sel <= dmem_addr_match & dmem_io_wbs_m2s_stb;
    uart_sel <= uart_addr_match & uart_io_wbs_m2s_stb;
    spi_sel <= spi_addr_match & spi_io_wbs_m2s_stb;
    m1_sel <= m1_addr_match & io_wbm_m2s_stb;
    m2_sel <= m2_addr_match & io_wbm_m2s_stb;
    m3_sel <= m3_addr_match & io_wbm_m2s_stb;
  end
endmodule