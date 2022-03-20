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
  wire [9:0] _T_9; // @[BMEM.scala 24:26:@1968.4]
  wire [9:0] addr; // @[BMEM.scala 24:33:@1969.4]
  reg [31:0] bmem_data; // @[BMEM.scala 25:26:@1970.4]
  reg [31:0] _RAND_0;
  wire  _T_14; // @[Conditional.scala 37:30:@1971.4]
  wire  _T_17; // @[Conditional.scala 37:30:@1976.6]
  wire  _T_20; // @[Conditional.scala 37:30:@1981.8]
  wire  _T_23; // @[Conditional.scala 37:30:@1986.10]
  wire  _T_26; // @[Conditional.scala 37:30:@1991.12]
  wire  _T_29; // @[Conditional.scala 37:30:@1996.14]
  wire  _T_32; // @[Conditional.scala 37:30:@2001.16]
  wire  _T_35; // @[Conditional.scala 37:30:@2006.18]
  wire  _T_38; // @[Conditional.scala 37:30:@2011.20]
  wire  _T_41; // @[Conditional.scala 37:30:@2016.22]
  wire  _T_44; // @[Conditional.scala 37:30:@2021.24]
  wire  _T_47; // @[Conditional.scala 37:30:@2026.26]
  wire  _T_50; // @[Conditional.scala 37:30:@2031.28]
  wire  _T_53; // @[Conditional.scala 37:30:@2036.30]
  wire  _T_56; // @[Conditional.scala 37:30:@2041.32]
  wire  _T_59; // @[Conditional.scala 37:30:@2046.34]
  wire  _T_62; // @[Conditional.scala 37:30:@2051.36]
  wire  _T_65; // @[Conditional.scala 37:30:@2056.38]
  wire  _T_68; // @[Conditional.scala 37:30:@2061.40]
  wire  _T_71; // @[Conditional.scala 37:30:@2066.42]
  wire  _T_74; // @[Conditional.scala 37:30:@2071.44]
  wire  _T_77; // @[Conditional.scala 37:30:@2076.46]
  wire  _T_80; // @[Conditional.scala 37:30:@2081.48]
  wire  _T_83; // @[Conditional.scala 37:30:@2086.50]
  wire  _T_86; // @[Conditional.scala 37:30:@2091.52]
  wire  _T_89; // @[Conditional.scala 37:30:@2096.54]
  wire  _T_92; // @[Conditional.scala 37:30:@2101.56]
  wire  _T_95; // @[Conditional.scala 37:30:@2106.58]
  wire  _T_98; // @[Conditional.scala 37:30:@2111.60]
  wire  _T_101; // @[Conditional.scala 37:30:@2116.62]
  wire  _T_104; // @[Conditional.scala 37:30:@2121.64]
  wire  _T_107; // @[Conditional.scala 37:30:@2126.66]
  wire  _T_110; // @[Conditional.scala 37:30:@2131.68]
  wire  _T_113; // @[Conditional.scala 37:30:@2136.70]
  wire  _T_116; // @[Conditional.scala 37:30:@2141.72]
  wire  _T_119; // @[Conditional.scala 37:30:@2146.74]
  wire  _T_122; // @[Conditional.scala 37:30:@2151.76]
  wire  _T_125; // @[Conditional.scala 37:30:@2156.78]
  wire  _T_128; // @[Conditional.scala 37:30:@2161.80]
  wire  _T_131; // @[Conditional.scala 37:30:@2166.82]
  wire  _T_134; // @[Conditional.scala 37:30:@2171.84]
  wire  _T_137; // @[Conditional.scala 37:30:@2176.86]
  wire  _T_140; // @[Conditional.scala 37:30:@2181.88]
  wire  _T_143; // @[Conditional.scala 37:30:@2186.90]
  wire  _T_146; // @[Conditional.scala 37:30:@2191.92]
  wire  _T_149; // @[Conditional.scala 37:30:@2196.94]
  wire  _T_152; // @[Conditional.scala 37:30:@2201.96]
  wire  _T_155; // @[Conditional.scala 37:30:@2206.98]
  wire  _T_158; // @[Conditional.scala 37:30:@2211.100]
  wire  _T_161; // @[Conditional.scala 37:30:@2216.102]
  wire  _T_164; // @[Conditional.scala 37:30:@2221.104]
  wire  _T_167; // @[Conditional.scala 37:30:@2226.106]
  wire  _T_170; // @[Conditional.scala 37:30:@2231.108]
  wire  _T_173; // @[Conditional.scala 37:30:@2236.110]
  wire  _T_176; // @[Conditional.scala 37:30:@2241.112]
  wire  _T_179; // @[Conditional.scala 37:30:@2246.114]
  wire  _T_182; // @[Conditional.scala 37:30:@2251.116]
  wire  _T_185; // @[Conditional.scala 37:30:@2256.118]
  wire  _T_188; // @[Conditional.scala 37:30:@2261.120]
  wire  _T_191; // @[Conditional.scala 37:30:@2266.122]
  wire  _T_194; // @[Conditional.scala 37:30:@2271.124]
  wire  _T_197; // @[Conditional.scala 37:30:@2276.126]
  wire  _T_200; // @[Conditional.scala 37:30:@2281.128]
  wire  _T_203; // @[Conditional.scala 37:30:@2286.130]
  wire  _T_206; // @[Conditional.scala 37:30:@2291.132]
  wire  _T_209; // @[Conditional.scala 37:30:@2296.134]
  wire  _T_212; // @[Conditional.scala 37:30:@2301.136]
  wire  _T_215; // @[Conditional.scala 37:30:@2306.138]
  wire  _T_218; // @[Conditional.scala 37:30:@2311.140]
  wire  _T_221; // @[Conditional.scala 37:30:@2316.142]
  wire  _T_224; // @[Conditional.scala 37:30:@2321.144]
  wire  _T_227; // @[Conditional.scala 37:30:@2326.146]
  wire  _T_230; // @[Conditional.scala 37:30:@2331.148]
  wire  _T_233; // @[Conditional.scala 37:30:@2336.150]
  wire  _T_236; // @[Conditional.scala 37:30:@2341.152]
  wire  _T_239; // @[Conditional.scala 37:30:@2346.154]
  wire  _T_242; // @[Conditional.scala 37:30:@2351.156]
  wire  _T_245; // @[Conditional.scala 37:30:@2356.158]
  wire  _T_248; // @[Conditional.scala 37:30:@2361.160]
  wire  _T_251; // @[Conditional.scala 37:30:@2366.162]
  wire  _T_254; // @[Conditional.scala 37:30:@2371.164]
  wire  _T_257; // @[Conditional.scala 37:30:@2376.166]
  wire  _T_260; // @[Conditional.scala 37:30:@2381.168]
  wire  _T_263; // @[Conditional.scala 37:30:@2386.170]
  wire  _T_266; // @[Conditional.scala 37:30:@2391.172]
  wire  _T_269; // @[Conditional.scala 37:30:@2396.174]
  wire  _T_272; // @[Conditional.scala 37:30:@2401.176]
  wire  _T_275; // @[Conditional.scala 37:30:@2406.178]
  wire  _T_278; // @[Conditional.scala 37:30:@2411.180]
  wire  _T_281; // @[Conditional.scala 37:30:@2416.182]
  wire  _T_284; // @[Conditional.scala 37:30:@2421.184]
  wire  _T_287; // @[Conditional.scala 37:30:@2426.186]
  wire  _T_290; // @[Conditional.scala 37:30:@2431.188]
  wire  _T_293; // @[Conditional.scala 37:30:@2436.190]
  wire  _T_296; // @[Conditional.scala 37:30:@2441.192]
  wire  _T_299; // @[Conditional.scala 37:30:@2446.194]
  wire  _T_302; // @[Conditional.scala 37:30:@2451.196]
  wire  _T_305; // @[Conditional.scala 37:30:@2456.198]
  wire  _T_308; // @[Conditional.scala 37:30:@2461.200]
  wire  _T_311; // @[Conditional.scala 37:30:@2466.202]
  wire  _T_314; // @[Conditional.scala 37:30:@2471.204]
  wire  _T_317; // @[Conditional.scala 37:30:@2476.206]
  wire  _T_320; // @[Conditional.scala 37:30:@2481.208]
  wire  _T_323; // @[Conditional.scala 37:30:@2486.210]
  wire  _T_326; // @[Conditional.scala 37:30:@2491.212]
  wire  _T_329; // @[Conditional.scala 37:30:@2496.214]
  wire  _T_332; // @[Conditional.scala 37:30:@2501.216]
  wire  _T_335; // @[Conditional.scala 37:30:@2506.218]
  wire  _T_338; // @[Conditional.scala 37:30:@2511.220]
  wire  _T_341; // @[Conditional.scala 37:30:@2516.222]
  wire  _T_344; // @[Conditional.scala 37:30:@2521.224]
  wire  _T_347; // @[Conditional.scala 37:30:@2526.226]
  wire  _T_350; // @[Conditional.scala 37:30:@2531.228]
  wire  _T_353; // @[Conditional.scala 37:30:@2536.230]
  wire  _T_356; // @[Conditional.scala 37:30:@2541.232]
  wire  _T_359; // @[Conditional.scala 37:30:@2546.234]
  wire  _T_362; // @[Conditional.scala 37:30:@2551.236]
  wire  _T_365; // @[Conditional.scala 37:30:@2556.238]
  wire  _T_368; // @[Conditional.scala 37:30:@2561.240]
  wire  _T_371; // @[Conditional.scala 37:30:@2566.242]
  wire  _T_374; // @[Conditional.scala 37:30:@2571.244]
  wire  _T_377; // @[Conditional.scala 37:30:@2576.246]
  wire  _T_380; // @[Conditional.scala 37:30:@2581.248]
  wire  _T_383; // @[Conditional.scala 37:30:@2586.250]
  wire  _T_386; // @[Conditional.scala 37:30:@2591.252]
  wire  _T_389; // @[Conditional.scala 37:30:@2596.254]
  wire  _T_392; // @[Conditional.scala 37:30:@2601.256]
  wire  _T_395; // @[Conditional.scala 37:30:@2606.258]
  wire  _T_398; // @[Conditional.scala 37:30:@2611.260]
  wire  _T_401; // @[Conditional.scala 37:30:@2616.262]
  wire  _T_404; // @[Conditional.scala 37:30:@2621.264]
  wire  _T_407; // @[Conditional.scala 37:30:@2626.266]
  wire  _T_410; // @[Conditional.scala 37:30:@2631.268]
  wire  _T_413; // @[Conditional.scala 37:30:@2636.270]
  wire  _T_416; // @[Conditional.scala 37:30:@2641.272]
  wire  _T_419; // @[Conditional.scala 37:30:@2646.274]
  wire  _T_422; // @[Conditional.scala 37:30:@2651.276]
  wire  _T_425; // @[Conditional.scala 37:30:@2656.278]
  wire  _T_428; // @[Conditional.scala 37:30:@2661.280]
  wire  _T_431; // @[Conditional.scala 37:30:@2666.282]
  wire  _T_434; // @[Conditional.scala 37:30:@2671.284]
  wire  _T_437; // @[Conditional.scala 37:30:@2676.286]
  wire  _T_440; // @[Conditional.scala 37:30:@2681.288]
  wire  _T_443; // @[Conditional.scala 37:30:@2686.290]
  wire  _T_446; // @[Conditional.scala 37:30:@2691.292]
  wire  _T_449; // @[Conditional.scala 37:30:@2696.294]
  wire  _T_452; // @[Conditional.scala 37:30:@2701.296]
  wire  _T_455; // @[Conditional.scala 37:30:@2706.298]
  wire  _T_458; // @[Conditional.scala 37:30:@2711.300]
  wire  _T_461; // @[Conditional.scala 37:30:@2716.302]
  wire  _T_464; // @[Conditional.scala 37:30:@2721.304]
  wire  _T_467; // @[Conditional.scala 37:30:@2726.306]
  wire  _T_470; // @[Conditional.scala 37:30:@2731.308]
  wire  _T_473; // @[Conditional.scala 37:30:@2736.310]
  wire  _T_476; // @[Conditional.scala 37:30:@2741.312]
  wire  _T_479; // @[Conditional.scala 37:30:@2746.314]
  wire  _T_482; // @[Conditional.scala 37:30:@2751.316]
  wire  _T_485; // @[Conditional.scala 37:30:@2756.318]
  wire  _T_488; // @[Conditional.scala 37:30:@2761.320]
  wire  _T_491; // @[Conditional.scala 37:30:@2766.322]
  wire  _T_494; // @[Conditional.scala 37:30:@2771.324]
  wire  _T_497; // @[Conditional.scala 37:30:@2776.326]
  wire  _T_500; // @[Conditional.scala 37:30:@2781.328]
  wire  _T_503; // @[Conditional.scala 37:30:@2786.330]
  wire  _T_506; // @[Conditional.scala 37:30:@2791.332]
  wire  _T_509; // @[Conditional.scala 37:30:@2796.334]
  wire  _T_512; // @[Conditional.scala 37:30:@2801.336]
  wire  _T_515; // @[Conditional.scala 37:30:@2806.338]
  wire  _T_518; // @[Conditional.scala 37:30:@2811.340]
  wire  _T_521; // @[Conditional.scala 37:30:@2816.342]
  wire  _T_524; // @[Conditional.scala 37:30:@2821.344]
  wire  _T_527; // @[Conditional.scala 37:30:@2826.346]
  wire  _T_530; // @[Conditional.scala 37:30:@2831.348]
  wire  _T_533; // @[Conditional.scala 37:30:@2836.350]
  wire  _T_536; // @[Conditional.scala 37:30:@2841.352]
  wire  _T_539; // @[Conditional.scala 37:30:@2846.354]
  wire  _T_542; // @[Conditional.scala 37:30:@2851.356]
  wire  _T_545; // @[Conditional.scala 37:30:@2856.358]
  wire  _T_548; // @[Conditional.scala 37:30:@2861.360]
  wire  _T_551; // @[Conditional.scala 37:30:@2866.362]
  wire  _T_554; // @[Conditional.scala 37:30:@2871.364]
  wire  _T_557; // @[Conditional.scala 37:30:@2876.366]
  wire  _T_560; // @[Conditional.scala 37:30:@2881.368]
  wire  _T_563; // @[Conditional.scala 37:30:@2886.370]
  wire  _T_566; // @[Conditional.scala 37:30:@2891.372]
  wire  _T_569; // @[Conditional.scala 37:30:@2896.374]
  wire  _T_572; // @[Conditional.scala 37:30:@2901.376]
  wire  _T_575; // @[Conditional.scala 37:30:@2906.378]
  wire  _T_578; // @[Conditional.scala 37:30:@2911.380]
  wire  _T_581; // @[Conditional.scala 37:30:@2916.382]
  wire  _T_584; // @[Conditional.scala 37:30:@2921.384]
  wire  _T_587; // @[Conditional.scala 37:30:@2926.386]
  wire  _T_590; // @[Conditional.scala 37:30:@2931.388]
  wire  _T_593; // @[Conditional.scala 37:30:@2936.390]
  wire  _T_596; // @[Conditional.scala 37:30:@2941.392]
  wire  _T_599; // @[Conditional.scala 37:30:@2946.394]
  wire  _T_602; // @[Conditional.scala 37:30:@2951.396]
  wire  _T_605; // @[Conditional.scala 37:30:@2956.398]
  wire  _T_608; // @[Conditional.scala 37:30:@2961.400]
  wire  _T_611; // @[Conditional.scala 37:30:@2966.402]
  wire  _T_614; // @[Conditional.scala 37:30:@2971.404]
  wire  _T_617; // @[Conditional.scala 37:30:@2976.406]
  wire  _T_620; // @[Conditional.scala 37:30:@2981.408]
  wire  _T_623; // @[Conditional.scala 37:30:@2986.410]
  wire  _T_626; // @[Conditional.scala 37:30:@2991.412]
  wire  _T_629; // @[Conditional.scala 37:30:@2996.414]
  wire  _T_632; // @[Conditional.scala 37:30:@3001.416]
  wire  _T_635; // @[Conditional.scala 37:30:@3006.418]
  wire  _T_638; // @[Conditional.scala 37:30:@3011.420]
  wire  _T_641; // @[Conditional.scala 37:30:@3016.422]
  wire  _T_644; // @[Conditional.scala 37:30:@3021.424]
  wire  _T_647; // @[Conditional.scala 37:30:@3026.426]
  wire  _T_650; // @[Conditional.scala 37:30:@3031.428]
  wire  _T_653; // @[Conditional.scala 37:30:@3036.430]
  wire  _T_656; // @[Conditional.scala 37:30:@3041.432]
  wire  _T_659; // @[Conditional.scala 37:30:@3046.434]
  wire  _T_662; // @[Conditional.scala 37:30:@3051.436]
  wire  _T_665; // @[Conditional.scala 37:30:@3056.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3057.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3052.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3047.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@3042.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@3037.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@3032.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@3027.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@3022.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@3017.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@3012.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@3007.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@3002.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@2997.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@2992.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@2987.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@2982.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@2977.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@2972.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2967.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2962.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2957.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2952.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2947.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2942.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2937.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2932.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2927.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2922.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2917.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2912.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2907.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2902.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2897.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2892.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2887.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2882.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2877.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2872.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2867.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2862.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2857.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2852.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2847.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2842.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2837.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2832.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2827.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2822.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2817.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2812.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2807.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2802.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2797.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2792.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2787.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2782.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2777.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2772.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2767.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2762.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2757.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2752.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2747.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2742.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2737.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2732.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2727.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2722.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2717.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2712.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2707.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2702.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2697.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2692.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2687.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2682.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2677.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2672.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2667.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2662.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2657.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2652.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2647.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2642.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2637.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2632.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2627.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2622.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2617.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2612.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2607.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2602.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2597.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2592.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2587.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2582.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2577.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2572.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2567.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2562.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2557.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2552.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2547.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2542.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2537.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2532.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2527.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2522.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2517.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2512.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2507.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2502.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2497.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2492.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2487.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2482.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2477.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2472.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2467.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2462.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2457.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2452.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2447.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2442.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2437.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2432.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2427.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2422.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2417.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2412.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2407.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2402.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2397.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2392.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2387.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2382.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2377.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2372.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2367.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2362.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2357.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2352.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2347.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2342.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2337.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2332.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2327.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2322.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2317.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2312.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2307.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2302.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2297.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2292.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2287.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2282.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2277.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2272.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2267.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2262.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2257.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2252.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2247.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2242.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2237.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2232.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2227.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2222.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2217.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2212.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2207.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2202.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2197.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2192.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2187.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2182.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2177.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2172.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2167.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2162.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2157.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2152.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2147.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2142.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2137.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2132.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2127.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2122.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2117.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2112.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2107.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2102.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2097.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2092.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2087.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2082.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2077.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2072.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2067.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2062.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2057.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2052.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2047.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@2042.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@2037.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@2032.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@2027.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@2022.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@2017.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@2012.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@2007.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@2002.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@1997.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@1992.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@1987.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@1982.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@1977.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@1972.4]
  assign _T_9 = io_bmem_addr[9:0]; // @[BMEM.scala 24:26:@1968.4]
  assign addr = _T_9 / 10'h4; // @[BMEM.scala 24:33:@1969.4]
  assign _T_14 = 10'h0 == addr; // @[Conditional.scala 37:30:@1971.4]
  assign _T_17 = 10'h1 == addr; // @[Conditional.scala 37:30:@1976.6]
  assign _T_20 = 10'h2 == addr; // @[Conditional.scala 37:30:@1981.8]
  assign _T_23 = 10'h3 == addr; // @[Conditional.scala 37:30:@1986.10]
  assign _T_26 = 10'h4 == addr; // @[Conditional.scala 37:30:@1991.12]
  assign _T_29 = 10'h5 == addr; // @[Conditional.scala 37:30:@1996.14]
  assign _T_32 = 10'h6 == addr; // @[Conditional.scala 37:30:@2001.16]
  assign _T_35 = 10'h7 == addr; // @[Conditional.scala 37:30:@2006.18]
  assign _T_38 = 10'h8 == addr; // @[Conditional.scala 37:30:@2011.20]
  assign _T_41 = 10'h9 == addr; // @[Conditional.scala 37:30:@2016.22]
  assign _T_44 = 10'ha == addr; // @[Conditional.scala 37:30:@2021.24]
  assign _T_47 = 10'hb == addr; // @[Conditional.scala 37:30:@2026.26]
  assign _T_50 = 10'hc == addr; // @[Conditional.scala 37:30:@2031.28]
  assign _T_53 = 10'hd == addr; // @[Conditional.scala 37:30:@2036.30]
  assign _T_56 = 10'he == addr; // @[Conditional.scala 37:30:@2041.32]
  assign _T_59 = 10'hf == addr; // @[Conditional.scala 37:30:@2046.34]
  assign _T_62 = 10'h10 == addr; // @[Conditional.scala 37:30:@2051.36]
  assign _T_65 = 10'h11 == addr; // @[Conditional.scala 37:30:@2056.38]
  assign _T_68 = 10'h12 == addr; // @[Conditional.scala 37:30:@2061.40]
  assign _T_71 = 10'h13 == addr; // @[Conditional.scala 37:30:@2066.42]
  assign _T_74 = 10'h14 == addr; // @[Conditional.scala 37:30:@2071.44]
  assign _T_77 = 10'h15 == addr; // @[Conditional.scala 37:30:@2076.46]
  assign _T_80 = 10'h16 == addr; // @[Conditional.scala 37:30:@2081.48]
  assign _T_83 = 10'h17 == addr; // @[Conditional.scala 37:30:@2086.50]
  assign _T_86 = 10'h18 == addr; // @[Conditional.scala 37:30:@2091.52]
  assign _T_89 = 10'h19 == addr; // @[Conditional.scala 37:30:@2096.54]
  assign _T_92 = 10'h1a == addr; // @[Conditional.scala 37:30:@2101.56]
  assign _T_95 = 10'h1b == addr; // @[Conditional.scala 37:30:@2106.58]
  assign _T_98 = 10'h1c == addr; // @[Conditional.scala 37:30:@2111.60]
  assign _T_101 = 10'h1d == addr; // @[Conditional.scala 37:30:@2116.62]
  assign _T_104 = 10'h1e == addr; // @[Conditional.scala 37:30:@2121.64]
  assign _T_107 = 10'h1f == addr; // @[Conditional.scala 37:30:@2126.66]
  assign _T_110 = 10'h20 == addr; // @[Conditional.scala 37:30:@2131.68]
  assign _T_113 = 10'h21 == addr; // @[Conditional.scala 37:30:@2136.70]
  assign _T_116 = 10'h22 == addr; // @[Conditional.scala 37:30:@2141.72]
  assign _T_119 = 10'h23 == addr; // @[Conditional.scala 37:30:@2146.74]
  assign _T_122 = 10'h24 == addr; // @[Conditional.scala 37:30:@2151.76]
  assign _T_125 = 10'h25 == addr; // @[Conditional.scala 37:30:@2156.78]
  assign _T_128 = 10'h26 == addr; // @[Conditional.scala 37:30:@2161.80]
  assign _T_131 = 10'h27 == addr; // @[Conditional.scala 37:30:@2166.82]
  assign _T_134 = 10'h28 == addr; // @[Conditional.scala 37:30:@2171.84]
  assign _T_137 = 10'h29 == addr; // @[Conditional.scala 37:30:@2176.86]
  assign _T_140 = 10'h2a == addr; // @[Conditional.scala 37:30:@2181.88]
  assign _T_143 = 10'h2b == addr; // @[Conditional.scala 37:30:@2186.90]
  assign _T_146 = 10'h2c == addr; // @[Conditional.scala 37:30:@2191.92]
  assign _T_149 = 10'h2d == addr; // @[Conditional.scala 37:30:@2196.94]
  assign _T_152 = 10'h2e == addr; // @[Conditional.scala 37:30:@2201.96]
  assign _T_155 = 10'h2f == addr; // @[Conditional.scala 37:30:@2206.98]
  assign _T_158 = 10'h30 == addr; // @[Conditional.scala 37:30:@2211.100]
  assign _T_161 = 10'h31 == addr; // @[Conditional.scala 37:30:@2216.102]
  assign _T_164 = 10'h32 == addr; // @[Conditional.scala 37:30:@2221.104]
  assign _T_167 = 10'h33 == addr; // @[Conditional.scala 37:30:@2226.106]
  assign _T_170 = 10'h34 == addr; // @[Conditional.scala 37:30:@2231.108]
  assign _T_173 = 10'h35 == addr; // @[Conditional.scala 37:30:@2236.110]
  assign _T_176 = 10'h36 == addr; // @[Conditional.scala 37:30:@2241.112]
  assign _T_179 = 10'h37 == addr; // @[Conditional.scala 37:30:@2246.114]
  assign _T_182 = 10'h38 == addr; // @[Conditional.scala 37:30:@2251.116]
  assign _T_185 = 10'h39 == addr; // @[Conditional.scala 37:30:@2256.118]
  assign _T_188 = 10'h3a == addr; // @[Conditional.scala 37:30:@2261.120]
  assign _T_191 = 10'h3b == addr; // @[Conditional.scala 37:30:@2266.122]
  assign _T_194 = 10'h3c == addr; // @[Conditional.scala 37:30:@2271.124]
  assign _T_197 = 10'h3d == addr; // @[Conditional.scala 37:30:@2276.126]
  assign _T_200 = 10'h3e == addr; // @[Conditional.scala 37:30:@2281.128]
  assign _T_203 = 10'h3f == addr; // @[Conditional.scala 37:30:@2286.130]
  assign _T_206 = 10'h40 == addr; // @[Conditional.scala 37:30:@2291.132]
  assign _T_209 = 10'h41 == addr; // @[Conditional.scala 37:30:@2296.134]
  assign _T_212 = 10'h42 == addr; // @[Conditional.scala 37:30:@2301.136]
  assign _T_215 = 10'h43 == addr; // @[Conditional.scala 37:30:@2306.138]
  assign _T_218 = 10'h44 == addr; // @[Conditional.scala 37:30:@2311.140]
  assign _T_221 = 10'h45 == addr; // @[Conditional.scala 37:30:@2316.142]
  assign _T_224 = 10'h46 == addr; // @[Conditional.scala 37:30:@2321.144]
  assign _T_227 = 10'h47 == addr; // @[Conditional.scala 37:30:@2326.146]
  assign _T_230 = 10'h48 == addr; // @[Conditional.scala 37:30:@2331.148]
  assign _T_233 = 10'h49 == addr; // @[Conditional.scala 37:30:@2336.150]
  assign _T_236 = 10'h4a == addr; // @[Conditional.scala 37:30:@2341.152]
  assign _T_239 = 10'h4b == addr; // @[Conditional.scala 37:30:@2346.154]
  assign _T_242 = 10'h4c == addr; // @[Conditional.scala 37:30:@2351.156]
  assign _T_245 = 10'h4d == addr; // @[Conditional.scala 37:30:@2356.158]
  assign _T_248 = 10'h4e == addr; // @[Conditional.scala 37:30:@2361.160]
  assign _T_251 = 10'h4f == addr; // @[Conditional.scala 37:30:@2366.162]
  assign _T_254 = 10'h50 == addr; // @[Conditional.scala 37:30:@2371.164]
  assign _T_257 = 10'h51 == addr; // @[Conditional.scala 37:30:@2376.166]
  assign _T_260 = 10'h52 == addr; // @[Conditional.scala 37:30:@2381.168]
  assign _T_263 = 10'h53 == addr; // @[Conditional.scala 37:30:@2386.170]
  assign _T_266 = 10'h54 == addr; // @[Conditional.scala 37:30:@2391.172]
  assign _T_269 = 10'h55 == addr; // @[Conditional.scala 37:30:@2396.174]
  assign _T_272 = 10'h56 == addr; // @[Conditional.scala 37:30:@2401.176]
  assign _T_275 = 10'h57 == addr; // @[Conditional.scala 37:30:@2406.178]
  assign _T_278 = 10'h58 == addr; // @[Conditional.scala 37:30:@2411.180]
  assign _T_281 = 10'h59 == addr; // @[Conditional.scala 37:30:@2416.182]
  assign _T_284 = 10'h5a == addr; // @[Conditional.scala 37:30:@2421.184]
  assign _T_287 = 10'h5b == addr; // @[Conditional.scala 37:30:@2426.186]
  assign _T_290 = 10'h5c == addr; // @[Conditional.scala 37:30:@2431.188]
  assign _T_293 = 10'h5d == addr; // @[Conditional.scala 37:30:@2436.190]
  assign _T_296 = 10'h5e == addr; // @[Conditional.scala 37:30:@2441.192]
  assign _T_299 = 10'h5f == addr; // @[Conditional.scala 37:30:@2446.194]
  assign _T_302 = 10'h60 == addr; // @[Conditional.scala 37:30:@2451.196]
  assign _T_305 = 10'h61 == addr; // @[Conditional.scala 37:30:@2456.198]
  assign _T_308 = 10'h62 == addr; // @[Conditional.scala 37:30:@2461.200]
  assign _T_311 = 10'h63 == addr; // @[Conditional.scala 37:30:@2466.202]
  assign _T_314 = 10'h64 == addr; // @[Conditional.scala 37:30:@2471.204]
  assign _T_317 = 10'h65 == addr; // @[Conditional.scala 37:30:@2476.206]
  assign _T_320 = 10'h66 == addr; // @[Conditional.scala 37:30:@2481.208]
  assign _T_323 = 10'h67 == addr; // @[Conditional.scala 37:30:@2486.210]
  assign _T_326 = 10'h68 == addr; // @[Conditional.scala 37:30:@2491.212]
  assign _T_329 = 10'h69 == addr; // @[Conditional.scala 37:30:@2496.214]
  assign _T_332 = 10'h6a == addr; // @[Conditional.scala 37:30:@2501.216]
  assign _T_335 = 10'h6b == addr; // @[Conditional.scala 37:30:@2506.218]
  assign _T_338 = 10'h6c == addr; // @[Conditional.scala 37:30:@2511.220]
  assign _T_341 = 10'h6d == addr; // @[Conditional.scala 37:30:@2516.222]
  assign _T_344 = 10'h6e == addr; // @[Conditional.scala 37:30:@2521.224]
  assign _T_347 = 10'h6f == addr; // @[Conditional.scala 37:30:@2526.226]
  assign _T_350 = 10'h70 == addr; // @[Conditional.scala 37:30:@2531.228]
  assign _T_353 = 10'h71 == addr; // @[Conditional.scala 37:30:@2536.230]
  assign _T_356 = 10'h72 == addr; // @[Conditional.scala 37:30:@2541.232]
  assign _T_359 = 10'h73 == addr; // @[Conditional.scala 37:30:@2546.234]
  assign _T_362 = 10'h74 == addr; // @[Conditional.scala 37:30:@2551.236]
  assign _T_365 = 10'h75 == addr; // @[Conditional.scala 37:30:@2556.238]
  assign _T_368 = 10'h76 == addr; // @[Conditional.scala 37:30:@2561.240]
  assign _T_371 = 10'h77 == addr; // @[Conditional.scala 37:30:@2566.242]
  assign _T_374 = 10'h78 == addr; // @[Conditional.scala 37:30:@2571.244]
  assign _T_377 = 10'h79 == addr; // @[Conditional.scala 37:30:@2576.246]
  assign _T_380 = 10'h7a == addr; // @[Conditional.scala 37:30:@2581.248]
  assign _T_383 = 10'h7b == addr; // @[Conditional.scala 37:30:@2586.250]
  assign _T_386 = 10'h7c == addr; // @[Conditional.scala 37:30:@2591.252]
  assign _T_389 = 10'h7d == addr; // @[Conditional.scala 37:30:@2596.254]
  assign _T_392 = 10'h7e == addr; // @[Conditional.scala 37:30:@2601.256]
  assign _T_395 = 10'h7f == addr; // @[Conditional.scala 37:30:@2606.258]
  assign _T_398 = 10'h80 == addr; // @[Conditional.scala 37:30:@2611.260]
  assign _T_401 = 10'h81 == addr; // @[Conditional.scala 37:30:@2616.262]
  assign _T_404 = 10'h82 == addr; // @[Conditional.scala 37:30:@2621.264]
  assign _T_407 = 10'h83 == addr; // @[Conditional.scala 37:30:@2626.266]
  assign _T_410 = 10'h84 == addr; // @[Conditional.scala 37:30:@2631.268]
  assign _T_413 = 10'h85 == addr; // @[Conditional.scala 37:30:@2636.270]
  assign _T_416 = 10'h86 == addr; // @[Conditional.scala 37:30:@2641.272]
  assign _T_419 = 10'h87 == addr; // @[Conditional.scala 37:30:@2646.274]
  assign _T_422 = 10'h88 == addr; // @[Conditional.scala 37:30:@2651.276]
  assign _T_425 = 10'h89 == addr; // @[Conditional.scala 37:30:@2656.278]
  assign _T_428 = 10'h8a == addr; // @[Conditional.scala 37:30:@2661.280]
  assign _T_431 = 10'h8b == addr; // @[Conditional.scala 37:30:@2666.282]
  assign _T_434 = 10'h8c == addr; // @[Conditional.scala 37:30:@2671.284]
  assign _T_437 = 10'h8d == addr; // @[Conditional.scala 37:30:@2676.286]
  assign _T_440 = 10'h8e == addr; // @[Conditional.scala 37:30:@2681.288]
  assign _T_443 = 10'h8f == addr; // @[Conditional.scala 37:30:@2686.290]
  assign _T_446 = 10'h90 == addr; // @[Conditional.scala 37:30:@2691.292]
  assign _T_449 = 10'h91 == addr; // @[Conditional.scala 37:30:@2696.294]
  assign _T_452 = 10'h92 == addr; // @[Conditional.scala 37:30:@2701.296]
  assign _T_455 = 10'h93 == addr; // @[Conditional.scala 37:30:@2706.298]
  assign _T_458 = 10'h94 == addr; // @[Conditional.scala 37:30:@2711.300]
  assign _T_461 = 10'h95 == addr; // @[Conditional.scala 37:30:@2716.302]
  assign _T_464 = 10'h96 == addr; // @[Conditional.scala 37:30:@2721.304]
  assign _T_467 = 10'h97 == addr; // @[Conditional.scala 37:30:@2726.306]
  assign _T_470 = 10'h98 == addr; // @[Conditional.scala 37:30:@2731.308]
  assign _T_473 = 10'h99 == addr; // @[Conditional.scala 37:30:@2736.310]
  assign _T_476 = 10'h9a == addr; // @[Conditional.scala 37:30:@2741.312]
  assign _T_479 = 10'h9b == addr; // @[Conditional.scala 37:30:@2746.314]
  assign _T_482 = 10'h9c == addr; // @[Conditional.scala 37:30:@2751.316]
  assign _T_485 = 10'h9d == addr; // @[Conditional.scala 37:30:@2756.318]
  assign _T_488 = 10'h9e == addr; // @[Conditional.scala 37:30:@2761.320]
  assign _T_491 = 10'h9f == addr; // @[Conditional.scala 37:30:@2766.322]
  assign _T_494 = 10'ha0 == addr; // @[Conditional.scala 37:30:@2771.324]
  assign _T_497 = 10'ha1 == addr; // @[Conditional.scala 37:30:@2776.326]
  assign _T_500 = 10'ha2 == addr; // @[Conditional.scala 37:30:@2781.328]
  assign _T_503 = 10'ha3 == addr; // @[Conditional.scala 37:30:@2786.330]
  assign _T_506 = 10'ha4 == addr; // @[Conditional.scala 37:30:@2791.332]
  assign _T_509 = 10'ha5 == addr; // @[Conditional.scala 37:30:@2796.334]
  assign _T_512 = 10'ha6 == addr; // @[Conditional.scala 37:30:@2801.336]
  assign _T_515 = 10'ha7 == addr; // @[Conditional.scala 37:30:@2806.338]
  assign _T_518 = 10'ha8 == addr; // @[Conditional.scala 37:30:@2811.340]
  assign _T_521 = 10'ha9 == addr; // @[Conditional.scala 37:30:@2816.342]
  assign _T_524 = 10'haa == addr; // @[Conditional.scala 37:30:@2821.344]
  assign _T_527 = 10'hab == addr; // @[Conditional.scala 37:30:@2826.346]
  assign _T_530 = 10'hac == addr; // @[Conditional.scala 37:30:@2831.348]
  assign _T_533 = 10'had == addr; // @[Conditional.scala 37:30:@2836.350]
  assign _T_536 = 10'hae == addr; // @[Conditional.scala 37:30:@2841.352]
  assign _T_539 = 10'haf == addr; // @[Conditional.scala 37:30:@2846.354]
  assign _T_542 = 10'hb0 == addr; // @[Conditional.scala 37:30:@2851.356]
  assign _T_545 = 10'hb1 == addr; // @[Conditional.scala 37:30:@2856.358]
  assign _T_548 = 10'hb2 == addr; // @[Conditional.scala 37:30:@2861.360]
  assign _T_551 = 10'hb3 == addr; // @[Conditional.scala 37:30:@2866.362]
  assign _T_554 = 10'hb4 == addr; // @[Conditional.scala 37:30:@2871.364]
  assign _T_557 = 10'hb5 == addr; // @[Conditional.scala 37:30:@2876.366]
  assign _T_560 = 10'hb6 == addr; // @[Conditional.scala 37:30:@2881.368]
  assign _T_563 = 10'hb7 == addr; // @[Conditional.scala 37:30:@2886.370]
  assign _T_566 = 10'hb8 == addr; // @[Conditional.scala 37:30:@2891.372]
  assign _T_569 = 10'hb9 == addr; // @[Conditional.scala 37:30:@2896.374]
  assign _T_572 = 10'hba == addr; // @[Conditional.scala 37:30:@2901.376]
  assign _T_575 = 10'hbb == addr; // @[Conditional.scala 37:30:@2906.378]
  assign _T_578 = 10'hbc == addr; // @[Conditional.scala 37:30:@2911.380]
  assign _T_581 = 10'hbd == addr; // @[Conditional.scala 37:30:@2916.382]
  assign _T_584 = 10'hbe == addr; // @[Conditional.scala 37:30:@2921.384]
  assign _T_587 = 10'hbf == addr; // @[Conditional.scala 37:30:@2926.386]
  assign _T_590 = 10'hc0 == addr; // @[Conditional.scala 37:30:@2931.388]
  assign _T_593 = 10'hc1 == addr; // @[Conditional.scala 37:30:@2936.390]
  assign _T_596 = 10'hc2 == addr; // @[Conditional.scala 37:30:@2941.392]
  assign _T_599 = 10'hc3 == addr; // @[Conditional.scala 37:30:@2946.394]
  assign _T_602 = 10'hc4 == addr; // @[Conditional.scala 37:30:@2951.396]
  assign _T_605 = 10'hc5 == addr; // @[Conditional.scala 37:30:@2956.398]
  assign _T_608 = 10'hc6 == addr; // @[Conditional.scala 37:30:@2961.400]
  assign _T_611 = 10'hc7 == addr; // @[Conditional.scala 37:30:@2966.402]
  assign _T_614 = 10'hc8 == addr; // @[Conditional.scala 37:30:@2971.404]
  assign _T_617 = 10'hc9 == addr; // @[Conditional.scala 37:30:@2976.406]
  assign _T_620 = 10'hca == addr; // @[Conditional.scala 37:30:@2981.408]
  assign _T_623 = 10'hcb == addr; // @[Conditional.scala 37:30:@2986.410]
  assign _T_626 = 10'hcc == addr; // @[Conditional.scala 37:30:@2991.412]
  assign _T_629 = 10'hcd == addr; // @[Conditional.scala 37:30:@2996.414]
  assign _T_632 = 10'hce == addr; // @[Conditional.scala 37:30:@3001.416]
  assign _T_635 = 10'hcf == addr; // @[Conditional.scala 37:30:@3006.418]
  assign _T_638 = 10'hd0 == addr; // @[Conditional.scala 37:30:@3011.420]
  assign _T_641 = 10'hd1 == addr; // @[Conditional.scala 37:30:@3016.422]
  assign _T_644 = 10'hd2 == addr; // @[Conditional.scala 37:30:@3021.424]
  assign _T_647 = 10'hd3 == addr; // @[Conditional.scala 37:30:@3026.426]
  assign _T_650 = 10'hd4 == addr; // @[Conditional.scala 37:30:@3031.428]
  assign _T_653 = 10'hd5 == addr; // @[Conditional.scala 37:30:@3036.430]
  assign _T_656 = 10'hd6 == addr; // @[Conditional.scala 37:30:@3041.432]
  assign _T_659 = 10'hd7 == addr; // @[Conditional.scala 37:30:@3046.434]
  assign _T_662 = 10'hd8 == addr; // @[Conditional.scala 37:30:@3051.436]
  assign _T_665 = 10'hd9 == addr; // @[Conditional.scala 37:30:@3056.438]
  assign _GEN_0 = _T_665 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3057.438]
  assign _GEN_1 = _T_662 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3052.436]
  assign _GEN_2 = _T_659 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3047.434]
  assign _GEN_3 = _T_656 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@3042.432]
  assign _GEN_4 = _T_653 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@3037.430]
  assign _GEN_5 = _T_650 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@3032.428]
  assign _GEN_6 = _T_647 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@3027.426]
  assign _GEN_7 = _T_644 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@3022.424]
  assign _GEN_8 = _T_641 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@3017.422]
  assign _GEN_9 = _T_638 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@3012.420]
  assign _GEN_10 = _T_635 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@3007.418]
  assign _GEN_11 = _T_632 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@3002.416]
  assign _GEN_12 = _T_629 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@2997.414]
  assign _GEN_13 = _T_626 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@2992.412]
  assign _GEN_14 = _T_623 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@2987.410]
  assign _GEN_15 = _T_620 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@2982.408]
  assign _GEN_16 = _T_617 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@2977.406]
  assign _GEN_17 = _T_614 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@2972.404]
  assign _GEN_18 = _T_611 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2967.402]
  assign _GEN_19 = _T_608 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2962.400]
  assign _GEN_20 = _T_605 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2957.398]
  assign _GEN_21 = _T_602 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2952.396]
  assign _GEN_22 = _T_599 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2947.394]
  assign _GEN_23 = _T_596 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2942.392]
  assign _GEN_24 = _T_593 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2937.390]
  assign _GEN_25 = _T_590 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2932.388]
  assign _GEN_26 = _T_587 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2927.386]
  assign _GEN_27 = _T_584 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2922.384]
  assign _GEN_28 = _T_581 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2917.382]
  assign _GEN_29 = _T_578 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2912.380]
  assign _GEN_30 = _T_575 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2907.378]
  assign _GEN_31 = _T_572 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2902.376]
  assign _GEN_32 = _T_569 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2897.374]
  assign _GEN_33 = _T_566 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2892.372]
  assign _GEN_34 = _T_563 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2887.370]
  assign _GEN_35 = _T_560 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2882.368]
  assign _GEN_36 = _T_557 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2877.366]
  assign _GEN_37 = _T_554 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2872.364]
  assign _GEN_38 = _T_551 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2867.362]
  assign _GEN_39 = _T_548 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2862.360]
  assign _GEN_40 = _T_545 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2857.358]
  assign _GEN_41 = _T_542 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2852.356]
  assign _GEN_42 = _T_539 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2847.354]
  assign _GEN_43 = _T_536 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2842.352]
  assign _GEN_44 = _T_533 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2837.350]
  assign _GEN_45 = _T_530 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2832.348]
  assign _GEN_46 = _T_527 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2827.346]
  assign _GEN_47 = _T_524 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2822.344]
  assign _GEN_48 = _T_521 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2817.342]
  assign _GEN_49 = _T_518 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2812.340]
  assign _GEN_50 = _T_515 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2807.338]
  assign _GEN_51 = _T_512 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2802.336]
  assign _GEN_52 = _T_509 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2797.334]
  assign _GEN_53 = _T_506 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2792.332]
  assign _GEN_54 = _T_503 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2787.330]
  assign _GEN_55 = _T_500 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2782.328]
  assign _GEN_56 = _T_497 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2777.326]
  assign _GEN_57 = _T_494 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2772.324]
  assign _GEN_58 = _T_491 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2767.322]
  assign _GEN_59 = _T_488 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2762.320]
  assign _GEN_60 = _T_485 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2757.318]
  assign _GEN_61 = _T_482 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2752.316]
  assign _GEN_62 = _T_479 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2747.314]
  assign _GEN_63 = _T_476 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2742.312]
  assign _GEN_64 = _T_473 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2737.310]
  assign _GEN_65 = _T_470 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2732.308]
  assign _GEN_66 = _T_467 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2727.306]
  assign _GEN_67 = _T_464 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2722.304]
  assign _GEN_68 = _T_461 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2717.302]
  assign _GEN_69 = _T_458 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2712.300]
  assign _GEN_70 = _T_455 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2707.298]
  assign _GEN_71 = _T_452 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2702.296]
  assign _GEN_72 = _T_449 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2697.294]
  assign _GEN_73 = _T_446 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2692.292]
  assign _GEN_74 = _T_443 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2687.290]
  assign _GEN_75 = _T_440 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2682.288]
  assign _GEN_76 = _T_437 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2677.286]
  assign _GEN_77 = _T_434 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2672.284]
  assign _GEN_78 = _T_431 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2667.282]
  assign _GEN_79 = _T_428 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2662.280]
  assign _GEN_80 = _T_425 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2657.278]
  assign _GEN_81 = _T_422 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2652.276]
  assign _GEN_82 = _T_419 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2647.274]
  assign _GEN_83 = _T_416 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2642.272]
  assign _GEN_84 = _T_413 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2637.270]
  assign _GEN_85 = _T_410 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2632.268]
  assign _GEN_86 = _T_407 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2627.266]
  assign _GEN_87 = _T_404 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2622.264]
  assign _GEN_88 = _T_401 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2617.262]
  assign _GEN_89 = _T_398 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2612.260]
  assign _GEN_90 = _T_395 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2607.258]
  assign _GEN_91 = _T_392 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2602.256]
  assign _GEN_92 = _T_389 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2597.254]
  assign _GEN_93 = _T_386 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2592.252]
  assign _GEN_94 = _T_383 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2587.250]
  assign _GEN_95 = _T_380 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2582.248]
  assign _GEN_96 = _T_377 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2577.246]
  assign _GEN_97 = _T_374 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2572.244]
  assign _GEN_98 = _T_371 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2567.242]
  assign _GEN_99 = _T_368 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2562.240]
  assign _GEN_100 = _T_365 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2557.238]
  assign _GEN_101 = _T_362 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2552.236]
  assign _GEN_102 = _T_359 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2547.234]
  assign _GEN_103 = _T_356 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2542.232]
  assign _GEN_104 = _T_353 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2537.230]
  assign _GEN_105 = _T_350 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2532.228]
  assign _GEN_106 = _T_347 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2527.226]
  assign _GEN_107 = _T_344 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2522.224]
  assign _GEN_108 = _T_341 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2517.222]
  assign _GEN_109 = _T_338 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2512.220]
  assign _GEN_110 = _T_335 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2507.218]
  assign _GEN_111 = _T_332 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2502.216]
  assign _GEN_112 = _T_329 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2497.214]
  assign _GEN_113 = _T_326 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2492.212]
  assign _GEN_114 = _T_323 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2487.210]
  assign _GEN_115 = _T_320 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2482.208]
  assign _GEN_116 = _T_317 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2477.206]
  assign _GEN_117 = _T_314 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2472.204]
  assign _GEN_118 = _T_311 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2467.202]
  assign _GEN_119 = _T_308 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2462.200]
  assign _GEN_120 = _T_305 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2457.198]
  assign _GEN_121 = _T_302 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2452.196]
  assign _GEN_122 = _T_299 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2447.194]
  assign _GEN_123 = _T_296 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2442.192]
  assign _GEN_124 = _T_293 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2437.190]
  assign _GEN_125 = _T_290 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2432.188]
  assign _GEN_126 = _T_287 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2427.186]
  assign _GEN_127 = _T_284 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2422.184]
  assign _GEN_128 = _T_281 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2417.182]
  assign _GEN_129 = _T_278 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2412.180]
  assign _GEN_130 = _T_275 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2407.178]
  assign _GEN_131 = _T_272 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2402.176]
  assign _GEN_132 = _T_269 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2397.174]
  assign _GEN_133 = _T_266 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2392.172]
  assign _GEN_134 = _T_263 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2387.170]
  assign _GEN_135 = _T_260 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2382.168]
  assign _GEN_136 = _T_257 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2377.166]
  assign _GEN_137 = _T_254 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2372.164]
  assign _GEN_138 = _T_251 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2367.162]
  assign _GEN_139 = _T_248 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2362.160]
  assign _GEN_140 = _T_245 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2357.158]
  assign _GEN_141 = _T_242 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2352.156]
  assign _GEN_142 = _T_239 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2347.154]
  assign _GEN_143 = _T_236 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2342.152]
  assign _GEN_144 = _T_233 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2337.150]
  assign _GEN_145 = _T_230 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2332.148]
  assign _GEN_146 = _T_227 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2327.146]
  assign _GEN_147 = _T_224 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2322.144]
  assign _GEN_148 = _T_221 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2317.142]
  assign _GEN_149 = _T_218 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2312.140]
  assign _GEN_150 = _T_215 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2307.138]
  assign _GEN_151 = _T_212 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2302.136]
  assign _GEN_152 = _T_209 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2297.134]
  assign _GEN_153 = _T_206 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2292.132]
  assign _GEN_154 = _T_203 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2287.130]
  assign _GEN_155 = _T_200 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2282.128]
  assign _GEN_156 = _T_197 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2277.126]
  assign _GEN_157 = _T_194 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2272.124]
  assign _GEN_158 = _T_191 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2267.122]
  assign _GEN_159 = _T_188 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2262.120]
  assign _GEN_160 = _T_185 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2257.118]
  assign _GEN_161 = _T_182 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2252.116]
  assign _GEN_162 = _T_179 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2247.114]
  assign _GEN_163 = _T_176 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2242.112]
  assign _GEN_164 = _T_173 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2237.110]
  assign _GEN_165 = _T_170 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2232.108]
  assign _GEN_166 = _T_167 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2227.106]
  assign _GEN_167 = _T_164 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2222.104]
  assign _GEN_168 = _T_161 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2217.102]
  assign _GEN_169 = _T_158 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2212.100]
  assign _GEN_170 = _T_155 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2207.98]
  assign _GEN_171 = _T_152 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2202.96]
  assign _GEN_172 = _T_149 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2197.94]
  assign _GEN_173 = _T_146 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2192.92]
  assign _GEN_174 = _T_143 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2187.90]
  assign _GEN_175 = _T_140 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2182.88]
  assign _GEN_176 = _T_137 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2177.86]
  assign _GEN_177 = _T_134 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2172.84]
  assign _GEN_178 = _T_131 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2167.82]
  assign _GEN_179 = _T_128 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2162.80]
  assign _GEN_180 = _T_125 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2157.78]
  assign _GEN_181 = _T_122 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2152.76]
  assign _GEN_182 = _T_119 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2147.74]
  assign _GEN_183 = _T_116 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2142.72]
  assign _GEN_184 = _T_113 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2137.70]
  assign _GEN_185 = _T_110 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2132.68]
  assign _GEN_186 = _T_107 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2127.66]
  assign _GEN_187 = _T_104 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2122.64]
  assign _GEN_188 = _T_101 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2117.62]
  assign _GEN_189 = _T_98 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2112.60]
  assign _GEN_190 = _T_95 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2107.58]
  assign _GEN_191 = _T_92 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2102.56]
  assign _GEN_192 = _T_89 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2097.54]
  assign _GEN_193 = _T_86 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2092.52]
  assign _GEN_194 = _T_83 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2087.50]
  assign _GEN_195 = _T_80 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2082.48]
  assign _GEN_196 = _T_77 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2077.46]
  assign _GEN_197 = _T_74 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2072.44]
  assign _GEN_198 = _T_71 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2067.42]
  assign _GEN_199 = _T_68 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2062.40]
  assign _GEN_200 = _T_65 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2057.38]
  assign _GEN_201 = _T_62 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2052.36]
  assign _GEN_202 = _T_59 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2047.34]
  assign _GEN_203 = _T_56 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@2042.32]
  assign _GEN_204 = _T_53 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@2037.30]
  assign _GEN_205 = _T_50 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@2032.28]
  assign _GEN_206 = _T_47 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@2027.26]
  assign _GEN_207 = _T_44 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@2022.24]
  assign _GEN_208 = _T_41 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@2017.22]
  assign _GEN_209 = _T_38 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@2012.20]
  assign _GEN_210 = _T_35 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@2007.18]
  assign _GEN_211 = _T_32 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@2002.16]
  assign _GEN_212 = _T_29 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@1997.14]
  assign _GEN_213 = _T_26 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@1992.12]
  assign _GEN_214 = _T_23 ? 32'hf810113 : _GEN_213; // @[Conditional.scala 39:67:@1987.10]
  assign _GEN_215 = _T_20 ? 32'hffffa117 : _GEN_214; // @[Conditional.scala 39:67:@1982.8]
  assign _GEN_216 = _T_17 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@1977.6]
  assign _GEN_217 = _T_14 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@1972.4]
  assign io_bmem_rdata = bmem_data; // @[BMEM.scala 248:17:@3060.4]
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
module IMem_Interface( // @[:@3062.2]
  input         clock, // @[:@3063.4]
  input         reset, // @[:@3064.4]
  input  [31:0] io_ibus_addr, // @[:@3065.4]
  output [31:0] io_ibus_inst, // @[:@3065.4]
  output        io_ibus_valid, // @[:@3065.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3065.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3065.4]
  input         io_wbs_m2s_we, // @[:@3065.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3065.4]
  input         io_wbs_m2s_stb, // @[:@3065.4]
  output        io_wbs_ack_o, // @[:@3065.4]
  output [31:0] io_wbs_data_o, // @[:@3065.4]
  output [8:0]  io_imem_io_addr, // @[:@3065.4]
  input  [31:0] io_imem_io_rdata, // @[:@3065.4]
  output [31:0] io_imem_io_wdata, // @[:@3065.4]
  output        io_imem_io_wr_en, // @[:@3065.4]
  output        io_imem_io_cs // @[:@3065.4]
);
  wire  bmem_clock; // @[imem_interface.scala 58:20:@3067.4]
  wire  bmem_reset; // @[imem_interface.scala 58:20:@3067.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 58:20:@3067.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 58:20:@3067.4]
  wire [8:0] ibus_imem_addr; // @[imem_interface.scala 65:41:@3070.4]
  wire [7:0] ibus_bmem_addr; // @[imem_interface.scala 66:41:@3071.4]
  wire [8:0] wbs_imem_addr; // @[imem_interface.scala 67:44:@3072.4]
  reg  ack; // @[imem_interface.scala 72:31:@3073.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 73:27:@3074.4]
  reg [31:0] _RAND_1;
  wire  _T_63; // @[imem_interface.scala 75:24:@3075.4]
  wire  wb_rd_en; // @[imem_interface.scala 75:39:@3076.4]
  wire  wb_wr_en; // @[imem_interface.scala 76:38:@3077.4]
  reg  bmem_ibus_sel; // @[imem_interface.scala 81:36:@3078.4]
  reg [31:0] _RAND_2;
  wire [3:0] _T_66; // @[imem_interface.scala 82:43:@3079.4]
  wire  _T_68; // @[imem_interface.scala 82:75:@3080.4]
  wire [3:0] _T_69; // @[imem_interface.scala 83:46:@3082.4]
  wire  _T_71; // @[imem_interface.scala 83:84:@3083.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 83:29:@3084.4]
  wire  imem_wbs_write; // @[imem_interface.scala 84:50:@3085.4]
  wire  _T_75; // @[imem_interface.scala 90:33:@3088.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 90:46:@3089.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 91:32:@3091.4]
  reg [31:0] _RAND_3;
  wire  _T_80; // @[imem_interface.scala 92:22:@3092.4]
  wire  _T_88; // @[imem_interface.scala 111:41:@3105.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 115:23:@3111.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 115:23:@3111.4]
  wire  _GEN_2; // @[imem_interface.scala 121:20:@3117.4]
  wire  _T_95; // @[imem_interface.scala 129:18:@3123.4]
  wire [7:0] _T_96; // @[imem_interface.scala 130:33:@3125.6]
  wire  _T_97; // @[imem_interface.scala 131:24:@3129.6]
  wire [7:0] _T_98; // @[imem_interface.scala 132:33:@3131.8]
  wire  _T_99; // @[imem_interface.scala 133:24:@3135.8]
  wire [7:0] _T_100; // @[imem_interface.scala 134:33:@3137.10]
  wire  _T_101; // @[imem_interface.scala 135:24:@3141.10]
  wire [7:0] _T_102; // @[imem_interface.scala 136:33:@3143.12]
  wire  _T_103; // @[imem_interface.scala 137:24:@3147.12]
  wire [15:0] _T_104; // @[imem_interface.scala 138:33:@3149.14]
  wire  _T_105; // @[imem_interface.scala 139:24:@3153.14]
  wire [15:0] _T_106; // @[imem_interface.scala 140:33:@3155.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 139:54:@3154.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 137:52:@3148.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 135:52:@3142.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 133:52:@3136.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 131:52:@3130.6]
  BMem bmem ( // @[imem_interface.scala 58:20:@3067.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[10:2]; // @[imem_interface.scala 65:41:@3070.4]
  assign ibus_bmem_addr = io_ibus_addr[9:2]; // @[imem_interface.scala 66:41:@3071.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[10:2]; // @[imem_interface.scala 67:44:@3072.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 75:24:@3075.4]
  assign wb_rd_en = _T_63 & io_wbs_m2s_stb; // @[imem_interface.scala 75:39:@3076.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 76:38:@3077.4]
  assign _T_66 = io_ibus_addr[15:12]; // @[imem_interface.scala 82:43:@3079.4]
  assign _T_68 = _T_66 == 4'h7; // @[imem_interface.scala 82:75:@3080.4]
  assign _T_69 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 83:46:@3082.4]
  assign _T_71 = _T_69 != 4'h0; // @[imem_interface.scala 83:84:@3083.4]
  assign imem_wbs_addr_match = _T_71 == 1'h0; // @[imem_interface.scala 83:29:@3084.4]
  assign imem_wbs_write = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 84:50:@3085.4]
  assign _T_75 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 90:33:@3088.4]
  assign imem_wbs_sel = _T_75 & imem_wbs_addr_match; // @[imem_interface.scala 90:46:@3089.4]
  assign _T_80 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 92:22:@3092.4]
  assign _T_88 = bmem_ibus_sel == 1'h0; // @[imem_interface.scala 111:41:@3105.4]
  assign rd_imem_inst = imem_ibus_valid ? io_imem_io_rdata : 32'h0; // @[imem_interface.scala 115:23:@3111.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : io_imem_io_rdata; // @[imem_interface.scala 115:23:@3111.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 121:20:@3117.4]
  assign _T_95 = wb_select == 4'h1; // @[imem_interface.scala 129:18:@3123.4]
  assign _T_96 = rd_imem_const[7:0]; // @[imem_interface.scala 130:33:@3125.6]
  assign _T_97 = wb_select == 4'h2; // @[imem_interface.scala 131:24:@3129.6]
  assign _T_98 = rd_imem_const[15:8]; // @[imem_interface.scala 132:33:@3131.8]
  assign _T_99 = wb_select == 4'h4; // @[imem_interface.scala 133:24:@3135.8]
  assign _T_100 = rd_imem_const[23:16]; // @[imem_interface.scala 134:33:@3137.10]
  assign _T_101 = wb_select == 4'h8; // @[imem_interface.scala 135:24:@3141.10]
  assign _T_102 = rd_imem_const[31:24]; // @[imem_interface.scala 136:33:@3143.12]
  assign _T_103 = wb_select == 4'h3; // @[imem_interface.scala 137:24:@3147.12]
  assign _T_104 = rd_imem_const[15:0]; // @[imem_interface.scala 138:33:@3149.14]
  assign _T_105 = wb_select == 4'hc; // @[imem_interface.scala 139:24:@3153.14]
  assign _T_106 = rd_imem_const[31:16]; // @[imem_interface.scala 140:33:@3155.16]
  assign _GEN_3 = _T_105 ? {{16'd0}, _T_106} : rd_imem_const; // @[imem_interface.scala 139:54:@3154.14]
  assign _GEN_4 = _T_103 ? {{16'd0}, _T_104} : _GEN_3; // @[imem_interface.scala 137:52:@3148.12]
  assign _GEN_5 = _T_101 ? {{24'd0}, _T_102} : _GEN_4; // @[imem_interface.scala 135:52:@3142.10]
  assign _GEN_6 = _T_99 ? {{24'd0}, _T_100} : _GEN_5; // @[imem_interface.scala 133:52:@3136.8]
  assign _GEN_7 = _T_97 ? {{24'd0}, _T_98} : _GEN_6; // @[imem_interface.scala 131:52:@3130.6]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 158:19:@3166.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 159:19:@3168.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 146:18:@3162.4]
  assign io_wbs_data_o = _T_95 ? {{24'd0}, _T_96} : _GEN_7; // @[imem_interface.scala 147:18:@3163.4]
  assign io_imem_io_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 100:23:@3099.4]
  assign io_imem_io_wdata = io_wbs_m2s_data; // @[imem_interface.scala 108:22:@3101.4]
  assign io_imem_io_wr_en = imem_wbs_write == 1'h0; // @[imem_interface.scala 109:22:@3103.4]
  assign io_imem_io_cs = imem_wbs_sel | _T_88; // @[imem_interface.scala 111:22:@3107.4]
  assign bmem_clock = clock; // @[:@3068.4]
  assign bmem_reset = reset; // @[:@3069.4]
  assign bmem_io_bmem_addr = {{24'd0}, ibus_bmem_addr}; // @[imem_interface.scala 151:21:@3164.4]
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
module WBM_DBus( // @[:@3170.2]
  input  [31:0] io_dbus_addr, // @[:@3173.4]
  input  [31:0] io_dbus_wdata, // @[:@3173.4]
  output [31:0] io_dbus_rdata, // @[:@3173.4]
  input         io_dbus_rd_en, // @[:@3173.4]
  input         io_dbus_wr_en, // @[:@3173.4]
  input  [1:0]  io_dbus_st_type, // @[:@3173.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3173.4]
  output        io_dbus_valid, // @[:@3173.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3173.4]
  output [31:0] io_wbm_m2s_data, // @[:@3173.4]
  output        io_wbm_m2s_we, // @[:@3173.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3173.4]
  output        io_wbm_m2s_stb, // @[:@3173.4]
  input         io_wbm_ack_i, // @[:@3173.4]
  input  [31:0] io_wbm_data_i // @[:@3173.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3177.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3182.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3187.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3188.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3183.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3178.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3191.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3194.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3199.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3200.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3201.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3203.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3204.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3208.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3209.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3210.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3212.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3217.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3222.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3223.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3218.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3213.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3211.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3202.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3195.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3234.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3177.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3182.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3187.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3188.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3183.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3178.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3191.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3194.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3199.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3200.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3201.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3203.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3204.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3208.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3209.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3210.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3212.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3217.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3222.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3223.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3218.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3213.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3211.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3202.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3195.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3234.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3242.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3243.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3231.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3232.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3233.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3236.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3240.4]
endmodule
module UARTTx( // @[:@3245.2]
  input        clock, // @[:@3246.4]
  input        reset, // @[:@3247.4]
  output       io_in_ready, // @[:@3248.4]
  input        io_in_valid, // @[:@3248.4]
  input  [7:0] io_in_bits, // @[:@3248.4]
  output       io_out, // @[:@3248.4]
  input  [9:0] io_div // @[:@3248.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3250.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3251.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3252.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3253.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3254.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3256.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3257.4]
  wire  state1; // @[uart_tx.scala 33:31:@3258.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3262.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3261.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3261.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3274.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3275.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3276.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3277.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3278.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3279.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3280.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3283.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3284.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3285.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3287.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3288.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3290.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3282.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3282.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3282.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3273.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3273.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3273.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3251.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3256.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3257.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3258.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3262.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3261.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3261.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3274.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3275.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3276.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3277.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3278.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3279.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3280.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3283.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3284.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3285.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3287.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3288.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3290.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3282.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3282.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3282.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3273.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3273.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3273.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3260.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3255.4]
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
module UARTRx( // @[:@3295.2]
  input        clock, // @[:@3296.4]
  input        reset, // @[:@3297.4]
  input        io_in, // @[:@3298.4]
  output       io_out_valid, // @[:@3298.4]
  output [7:0] io_out_bits, // @[:@3298.4]
  input  [9:0] io_div // @[:@3298.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3300.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3301.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3302.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3303.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3304.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3305.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3306.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3307.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3308.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3309.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3310.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3311.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3312.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3313.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3313.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3314.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3315.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3319.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3320.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3322.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3324.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3325.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3327.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3327.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3327.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3323.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3323.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3323.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3323.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3339.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3340.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3341.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3349.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3350.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3343.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3343.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3343.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3338.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3338.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3338.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3338.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3338.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3336.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3336.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3336.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3336.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3336.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3336.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3321.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3321.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3321.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3321.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3301.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3303.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3304.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3305.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3306.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3307.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3308.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3309.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3310.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3312.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3313.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3313.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3320.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3322.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3324.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3325.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3327.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3327.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3327.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3323.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3323.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3323.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3323.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3339.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3340.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3341.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3349.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3350.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3343.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3343.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3343.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3338.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3338.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3338.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3338.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3338.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3336.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3321.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3321.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3321.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3321.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3317.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3318.4]
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
module UART( // @[:@3356.2]
  input         clock, // @[:@3357.4]
  input         reset, // @[:@3358.4]
  input         io_uart_select, // @[:@3359.4]
  output        io_txd, // @[:@3359.4]
  input         io_rxd, // @[:@3359.4]
  output        io_uartInt, // @[:@3359.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3359.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3359.4]
  input         io_wbs_m2s_we, // @[:@3359.4]
  input         io_wbs_m2s_stb, // @[:@3359.4]
  output        io_wbs_ack_o, // @[:@3359.4]
  output [31:0] io_wbs_data_o // @[:@3359.4]
);
  wire  txm_clock; // @[uart.scala 53:19:@3361.4]
  wire  txm_reset; // @[uart.scala 53:19:@3361.4]
  wire  txm_io_in_ready; // @[uart.scala 53:19:@3361.4]
  wire  txm_io_in_valid; // @[uart.scala 53:19:@3361.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 53:19:@3361.4]
  wire  txm_io_out; // @[uart.scala 53:19:@3361.4]
  wire [9:0] txm_io_div; // @[uart.scala 53:19:@3361.4]
  wire  rxm_clock; // @[uart.scala 54:19:@3364.4]
  wire  rxm_reset; // @[uart.scala 54:19:@3364.4]
  wire  rxm_io_in; // @[uart.scala 54:19:@3364.4]
  wire  rxm_io_out_valid; // @[uart.scala 54:19:@3364.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 54:19:@3364.4]
  wire [9:0] rxm_io_div; // @[uart.scala 54:19:@3364.4]
  reg  txen; // @[uart.scala 57:27:@3367.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 60:27:@3369.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 61:27:@3370.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 62:27:@3371.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 63:27:@3372.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 64:27:@3373.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 65:27:@3374.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 85:36:@3384.4]
  wire  _T_63; // @[uart.scala 86:21:@3385.4]
  wire  rd_en; // @[uart.scala 86:36:@3386.4]
  wire  wr_en; // @[uart.scala 87:35:@3387.4]
  wire  _T_70; // @[uart.scala 91:32:@3388.4]
  wire  sel_reg_rx; // @[uart.scala 91:56:@3389.4]
  wire  _T_71; // @[uart.scala 92:32:@3390.4]
  wire  sel_reg_tx; // @[uart.scala 92:56:@3391.4]
  wire  _T_72; // @[uart.scala 93:32:@3392.4]
  wire  sel_reg_baud; // @[uart.scala 93:54:@3393.4]
  wire  _T_73; // @[uart.scala 94:32:@3394.4]
  wire  sel_reg_control; // @[uart.scala 94:57:@3395.4]
  wire  _T_74; // @[uart.scala 95:32:@3396.4]
  wire  sel_reg_status; // @[uart.scala 95:56:@3397.4]
  wire  _T_75; // @[uart.scala 96:32:@3398.4]
  wire  sel_reg_int_mask; // @[uart.scala 96:58:@3399.4]
  reg  ack; // @[uart.scala 99:28:@3400.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 104:28:@3404.4]
  reg [31:0] _RAND_8;
  wire  _T_81; // @[uart.scala 106:14:@3405.4]
  wire  _T_82; // @[uart.scala 108:20:@3410.6]
  wire  _T_83; // @[uart.scala 110:20:@3415.8]
  wire  _T_84; // @[uart.scala 112:20:@3420.10]
  wire [7:0] _GEN_0; // @[uart.scala 112:34:@3421.10]
  wire [7:0] _GEN_1; // @[uart.scala 110:38:@3416.8]
  wire [9:0] _GEN_2; // @[uart.scala 108:36:@3411.6]
  wire [9:0] _GEN_3; // @[uart.scala 106:33:@3406.4]
  wire [7:0] _T_86; // @[uart.scala 120:31:@3428.4]
  wire [7:0] _T_89; // @[uart.scala 125:36:@3433.8]
  wire [7:0] _GEN_4; // @[uart.scala 134:32:@3448.12]
  wire [7:0] _GEN_5; // @[uart.scala 131:31:@3443.10]
  wire [7:0] _GEN_6; // @[uart.scala 131:31:@3443.10]
  wire [9:0] _GEN_7; // @[uart.scala 128:29:@3438.8]
  wire [7:0] _GEN_8; // @[uart.scala 128:29:@3438.8]
  wire [7:0] _GEN_9; // @[uart.scala 128:29:@3438.8]
  wire [7:0] _GEN_10; // @[uart.scala 124:22:@3432.6]
  wire [9:0] _GEN_12; // @[uart.scala 124:22:@3432.6]
  wire [7:0] _GEN_13; // @[uart.scala 124:22:@3432.6]
  wire [7:0] _GEN_14; // @[uart.scala 124:22:@3432.6]
  wire [7:0] _GEN_15; // @[uart.scala 123:15:@3431.4]
  wire  _GEN_16; // @[uart.scala 123:15:@3431.4]
  wire [9:0] _GEN_17; // @[uart.scala 123:15:@3431.4]
  wire [7:0] _GEN_18; // @[uart.scala 123:15:@3431.4]
  wire [7:0] _GEN_19; // @[uart.scala 123:15:@3431.4]
  wire [6:0] _T_94; // @[uart.scala 142:33:@3455.6]
  wire [7:0] _T_96; // @[Cat.scala 30:58:@3456.6]
  wire  _T_97; // @[uart.scala 143:20:@3460.6]
  wire [5:0] _T_99; // @[uart.scala 146:33:@3466.8]
  wire  _T_100; // @[uart.scala 146:65:@3467.8]
  wire [7:0] _T_102; // @[Cat.scala 30:58:@3469.8]
  wire [7:0] _GEN_20; // @[uart.scala 143:38:@3461.6]
  wire [7:0] _GEN_21; // @[uart.scala 140:25:@3453.4]
  wire [7:0] _GEN_22; // @[uart.scala 140:25:@3453.4]
  UARTTx txm ( // @[uart.scala 53:19:@3361.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 54:19:@3364.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 85:36:@3384.4]
  assign _T_63 = io_wbs_m2s_we == 1'h0; // @[uart.scala 86:21:@3385.4]
  assign rd_en = _T_63 & io_wbs_m2s_stb; // @[uart.scala 86:36:@3386.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 87:35:@3387.4]
  assign _T_70 = addr == 8'h0; // @[uart.scala 91:32:@3388.4]
  assign sel_reg_rx = _T_70 & io_uart_select; // @[uart.scala 91:56:@3389.4]
  assign _T_71 = addr == 8'h1; // @[uart.scala 92:32:@3390.4]
  assign sel_reg_tx = _T_71 & io_uart_select; // @[uart.scala 92:56:@3391.4]
  assign _T_72 = addr == 8'h2; // @[uart.scala 93:32:@3392.4]
  assign sel_reg_baud = _T_72 & io_uart_select; // @[uart.scala 93:54:@3393.4]
  assign _T_73 = addr == 8'h3; // @[uart.scala 94:32:@3394.4]
  assign sel_reg_control = _T_73 & io_uart_select; // @[uart.scala 94:57:@3395.4]
  assign _T_74 = addr == 8'h4; // @[uart.scala 95:32:@3396.4]
  assign sel_reg_status = _T_74 & io_uart_select; // @[uart.scala 95:56:@3397.4]
  assign _T_75 = addr == 8'h5; // @[uart.scala 96:32:@3398.4]
  assign sel_reg_int_mask = _T_75 & io_uart_select; // @[uart.scala 96:58:@3399.4]
  assign _T_81 = rd_en & sel_reg_control; // @[uart.scala 106:14:@3405.4]
  assign _T_82 = rd_en & sel_reg_baud; // @[uart.scala 108:20:@3410.6]
  assign _T_83 = rd_en & sel_reg_status; // @[uart.scala 110:20:@3415.8]
  assign _T_84 = rd_en & sel_reg_rx; // @[uart.scala 112:20:@3420.10]
  assign _GEN_0 = _T_84 ? rx_data_r : 8'h0; // @[uart.scala 112:34:@3421.10]
  assign _GEN_1 = _T_83 ? status_r : _GEN_0; // @[uart.scala 110:38:@3416.8]
  assign _GEN_2 = _T_82 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 108:36:@3411.6]
  assign _GEN_3 = _T_81 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 106:33:@3406.4]
  assign _T_86 = status_r & int_mask_r; // @[uart.scala 120:31:@3428.4]
  assign _T_89 = io_wbs_m2s_data[7:0]; // @[uart.scala 125:36:@3433.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_89 : int_mask_r; // @[uart.scala 134:32:@3448.12]
  assign _GEN_5 = sel_reg_control ? _T_89 : control_r; // @[uart.scala 131:31:@3443.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 131:31:@3443.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_89} : baud_r; // @[uart.scala 128:29:@3438.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 128:29:@3438.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 128:29:@3438.8]
  assign _GEN_10 = sel_reg_tx ? _T_89 : tx_data_r; // @[uart.scala 124:22:@3432.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 124:22:@3432.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 124:22:@3432.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 124:22:@3432.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 123:15:@3431.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 123:15:@3431.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 123:15:@3431.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 123:15:@3431.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 123:15:@3431.4]
  assign _T_94 = status_r[7:1]; // @[uart.scala 142:33:@3455.6]
  assign _T_96 = {_T_94,1'h1}; // @[Cat.scala 30:58:@3456.6]
  assign _T_97 = wr_en & sel_reg_status; // @[uart.scala 143:20:@3460.6]
  assign _T_99 = status_r[7:2]; // @[uart.scala 146:33:@3466.8]
  assign _T_100 = status_r[0]; // @[uart.scala 146:65:@3467.8]
  assign _T_102 = {_T_99,txm_io_in_ready,_T_100}; // @[Cat.scala 30:58:@3469.8]
  assign _GEN_20 = _T_97 ? _T_89 : _T_102; // @[uart.scala 143:38:@3461.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 140:25:@3453.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_96 : _GEN_20; // @[uart.scala 140:25:@3453.4]
  assign io_txd = txm_io_out; // @[uart.scala 82:19:@3383.4]
  assign io_uartInt = _T_86 != 8'h0; // @[uart.scala 120:18:@3430.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 100:19:@3401.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 117:18:@3427.4]
  assign txm_clock = clock; // @[:@3362.4]
  assign txm_reset = reset; // @[:@3363.4]
  assign txm_io_in_valid = txen; // @[uart.scala 74:19:@3377.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 75:19:@3378.4]
  assign txm_io_div = baud_r; // @[uart.scala 76:19:@3379.4]
  assign rxm_clock = clock; // @[:@3365.4]
  assign rxm_reset = reset; // @[:@3366.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 81:19:@3382.4]
  assign rxm_io_div = baud_r; // @[uart.scala 78:19:@3381.4]
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
module SPI( // @[:@3473.2]
  input         clock, // @[:@3474.4]
  input         reset, // @[:@3475.4]
  input         io_spi_select, // @[:@3476.4]
  output        io_spi_cs, // @[:@3476.4]
  output        io_spi_clk, // @[:@3476.4]
  output        io_spi_mosi, // @[:@3476.4]
  input         io_spi_miso, // @[:@3476.4]
  output        io_spi_intr, // @[:@3476.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3476.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3476.4]
  input         io_wbs_m2s_we, // @[:@3476.4]
  input         io_wbs_m2s_stb, // @[:@3476.4]
  output        io_wbs_ack_o, // @[:@3476.4]
  output [31:0] io_wbs_data_o // @[:@3476.4]
);
  reg  ack_o; // @[spi.scala 65:25:@3478.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 66:25:@3479.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 69:23:@3481.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 70:23:@3482.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 75:31:@3489.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 78:28:@3492.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 79:28:@3493.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 80:28:@3494.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 82:30:@3495.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 83:30:@3496.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 84:30:@3497.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 87:27:@3498.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 88:27:@3499.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 89:27:@3500.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 90:27:@3501.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 91:27:@3502.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 92:27:@3503.4]
  reg [31:0] _RAND_16;
  reg  bit_toe; // @[spi.scala 95:27:@3504.4]
  reg [31:0] _RAND_17;
  reg  bit_roe; // @[spi.scala 96:27:@3505.4]
  reg [31:0] _RAND_18;
  reg  bit_trdy; // @[spi.scala 97:27:@3506.4]
  reg [31:0] _RAND_19;
  reg  bit_rrdy; // @[spi.scala 98:27:@3507.4]
  reg [31:0] _RAND_20;
  reg  bit_tmt; // @[spi.scala 99:27:@3508.4]
  reg [31:0] _RAND_21;
  reg  bit_e; // @[spi.scala 100:27:@3509.4]
  reg [31:0] _RAND_22;
  wire [7:0] addr; // @[spi.scala 106:33:@3510.4]
  wire  _T_104; // @[spi.scala 108:19:@3511.4]
  wire  rd_en; // @[spi.scala 108:34:@3512.4]
  wire  wr_en; // @[spi.scala 109:33:@3515.4]
  wire  _T_115; // @[spi.scala 113:32:@3519.4]
  wire  sel_reg_rx; // @[spi.scala 113:54:@3520.4]
  wire  _T_116; // @[spi.scala 114:32:@3521.4]
  wire  sel_reg_tx; // @[spi.scala 114:54:@3522.4]
  wire  _T_118; // @[spi.scala 116:32:@3525.4]
  wire  sel_reg_control; // @[spi.scala 116:55:@3526.4]
  wire  _T_119; // @[spi.scala 117:32:@3527.4]
  wire  sel_reg_status; // @[spi.scala 117:54:@3528.4]
  wire  _T_120; // @[spi.scala 118:32:@3529.4]
  wire  sel_reg_ssmask; // @[spi.scala 118:55:@3530.4]
  wire [7:0] _GEN_0; // @[spi.scala 121:23:@3531.4]
  wire  _T_121; // @[spi.scala 126:14:@3534.4]
  wire  _T_122; // @[spi.scala 126:28:@3535.4]
  wire [7:0] latch_s_data; // @[:@3490.4 :@3491.4 spi.scala 110:16:@3518.4]
  wire [7:0] _GEN_1; // @[spi.scala 126:41:@3536.4]
  wire  _T_123; // @[spi.scala 131:19:@3539.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3546.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3553.4]
  wire  _T_138; // @[spi.scala 138:14:@3554.4]
  wire  _T_139; // @[spi.scala 139:30:@3556.6]
  wire  _T_140; // @[spi.scala 140:30:@3558.6]
  wire  _T_141; // @[spi.scala 141:30:@3560.6]
  wire  _T_142; // @[spi.scala 142:30:@3562.6]
  wire  _T_143; // @[spi.scala 143:30:@3564.6]
  wire  _T_144; // @[spi.scala 144:30:@3566.6]
  wire  _GEN_2; // @[spi.scala 138:34:@3555.4]
  wire  _GEN_3; // @[spi.scala 138:34:@3555.4]
  wire  _GEN_4; // @[spi.scala 138:34:@3555.4]
  wire  _GEN_5; // @[spi.scala 138:34:@3555.4]
  wire  _GEN_6; // @[spi.scala 138:34:@3555.4]
  wire  _GEN_7; // @[spi.scala 138:34:@3555.4]
  wire  _T_145; // @[spi.scala 147:37:@3569.4]
  wire  _T_146; // @[spi.scala 147:58:@3570.4]
  wire  _T_147; // @[spi.scala 147:47:@3571.4]
  wire  _T_148; // @[spi.scala 147:25:@3572.4]
  wire  _T_149; // @[spi.scala 147:83:@3573.4]
  wire  _T_150; // @[spi.scala 147:70:@3574.4]
  wire  _T_151; // @[spi.scala 147:108:@3575.4]
  wire  _T_155; // @[spi.scala 154:39:@3583.6]
  wire  _T_156; // @[spi.scala 154:30:@3584.6]
  wire  _GEN_8; // @[spi.scala 154:59:@3585.6]
  wire  _GEN_9; // @[spi.scala 152:15:@3578.4]
  wire  _T_160; // @[spi.scala 161:35:@3594.6]
  wire  _T_161; // @[spi.scala 161:30:@3595.6]
  wire  _GEN_10; // @[spi.scala 161:43:@3596.6]
  wire  _GEN_11; // @[spi.scala 159:15:@3589.4]
  reg [4:0] clock_cnt; // @[spi.scala 166:31:@3599.4]
  reg [31:0] _RAND_23;
  reg [5:0] data_cnt; // @[spi.scala 167:31:@3600.4]
  reg [31:0] _RAND_24;
  reg  pending_data; // @[spi.scala 168:31:@3601.4]
  reg [31:0] _RAND_25;
  reg [2:0] n_status; // @[spi.scala 170:31:@3604.4]
  reg [31:0] _RAND_26;
  reg [2:0] p_status; // @[spi.scala 171:31:@3605.4]
  reg [31:0] _RAND_27;
  wire  _T_174; // @[spi.scala 175:27:@3611.6]
  wire  _GEN_12; // @[spi.scala 175:40:@3612.6]
  wire  _GEN_13; // @[spi.scala 173:32:@3607.4]
  wire [7:0] _T_180; // @[spi.scala 181:78:@3618.6]
  wire [7:0] _T_181; // @[spi.scala 181:44:@3619.6]
  wire [7:0] _T_182; // @[spi.scala 181:12:@3620.6]
  wire [7:0] _T_183; // @[spi.scala 180:49:@3621.6]
  wire [7:0] _T_184; // @[spi.scala 180:21:@3622.6]
  wire [7:0] _GEN_14; // @[spi.scala 179:18:@3615.4]
  wire  _T_185; // @[spi.scala 185:16:@3626.4]
  wire  _GEN_15; // @[spi.scala 185:35:@3627.4]
  wire  _T_188; // @[spi.scala 201:21:@3633.4]
  wire  _T_190; // @[spi.scala 201:49:@3634.4]
  wire  _T_191; // @[spi.scala 201:35:@3635.4]
  wire  _T_192; // @[spi.scala 202:18:@3637.6]
  wire  _GEN_16; // @[spi.scala 201:67:@3636.4]
  wire  _T_196; // @[spi.scala 208:59:@3643.4]
  wire  _T_197; // @[spi.scala 208:39:@3644.4]
  wire  _T_199; // @[spi.scala 208:71:@3646.4]
  wire [8:0] _T_203; // @[Cat.scala 30:58:@3654.8]
  wire [8:0] _GEN_18; // @[spi.scala 208:99:@3647.4]
  wire  _T_204; // @[spi.scala 217:20:@3658.4]
  wire  _T_205; // @[spi.scala 217:47:@3659.4]
  wire  _T_206; // @[spi.scala 217:34:@3660.4]
  wire  _GEN_19; // @[spi.scala 219:33:@3665.6]
  wire  _GEN_20; // @[spi.scala 217:62:@3661.4]
  wire  _T_211; // @[spi.scala 223:49:@3669.4]
  wire  _T_212; // @[spi.scala 223:36:@3670.4]
  wire [5:0] _T_215; // @[spi.scala 226:30:@3675.6]
  wire [4:0] _T_216; // @[spi.scala 226:30:@3676.6]
  wire [4:0] _GEN_21; // @[spi.scala 223:63:@3671.4]
  wire [2:0] _GEN_22; // @[spi.scala 235:26:@3687.6]
  wire  _T_229; // @[spi.scala 246:27:@3706.8]
  wire  _T_233; // @[spi.scala 247:53:@3709.10]
  wire  _T_234; // @[spi.scala 247:40:@3710.10]
  wire [2:0] _GEN_24; // @[spi.scala 247:76:@3711.10]
  wire  _T_238; // @[spi.scala 253:53:@3722.12]
  wire  _T_239; // @[spi.scala 253:40:@3723.12]
  wire  _T_242; // @[spi.scala 253:69:@3725.12]
  wire [2:0] _GEN_25; // @[spi.scala 253:105:@3726.12]
  wire  _T_243; // @[spi.scala 258:27:@3734.12]
  wire [2:0] _GEN_27; // @[spi.scala 259:39:@3737.14]
  wire  _T_247; // @[spi.scala 266:27:@3747.14]
  wire  _T_251; // @[spi.scala 267:53:@3750.16]
  wire  _T_252; // @[spi.scala 267:40:@3751.16]
  wire [2:0] _GEN_28; // @[spi.scala 267:77:@3752.16]
  wire [2:0] _GEN_29; // @[spi.scala 266:44:@3748.14]
  wire [2:0] _GEN_30; // @[spi.scala 258:46:@3735.12]
  wire [2:0] _GEN_31; // @[spi.scala 252:41:@3720.10]
  wire [2:0] _GEN_32; // @[spi.scala 246:40:@3707.8]
  wire [2:0] _GEN_33; // @[spi.scala 240:40:@3696.6]
  wire [2:0] _GEN_34; // @[spi.scala 234:32:@3686.4]
  wire  _T_256; // @[spi.scala 276:32:@3764.4]
  wire  _T_259; // @[spi.scala 276:63:@3766.4]
  wire  _T_266; // @[spi.scala 278:73:@3775.6]
  wire  _T_269; // @[spi.scala 278:102:@3777.6]
  wire  _T_274; // @[spi.scala 280:45:@3784.8]
  wire  _T_277; // @[spi.scala 280:76:@3786.8]
  wire  _T_291; // @[spi.scala 282:133:@3799.10]
  wire  _T_292; // @[spi.scala 282:74:@3800.10]
  wire  _T_297; // @[spi.scala 282:174:@3804.10]
  wire [6:0] _T_299; // @[spi.scala 283:28:@3806.12]
  wire [5:0] _T_300; // @[spi.scala 283:28:@3807.12]
  wire [5:0] _GEN_35; // @[spi.scala 282:238:@3805.10]
  wire [5:0] _GEN_36; // @[spi.scala 280:113:@3787.8]
  wire [5:0] _GEN_37; // @[spi.scala 278:138:@3778.6]
  wire [5:0] _GEN_38; // @[spi.scala 276:99:@3767.4]
  reg  wait_one_tick_done; // @[spi.scala 286:37:@3810.4]
  reg [31:0] _RAND_28;
  wire  _T_321; // @[spi.scala 298:72:@3832.6]
  wire [8:0] _T_328; // @[Cat.scala 30:58:@3837.6]
  wire  _T_341; // @[spi.scala 302:80:@3851.10]
  wire [8:0] _T_348; // @[Cat.scala 30:58:@3856.10]
  wire  _GEN_42; // @[spi.scala 301:32:@3849.8]
  wire [8:0] _GEN_43; // @[spi.scala 301:32:@3849.8]
  wire  _GEN_44; // @[spi.scala 300:114:@3848.6]
  wire [8:0] _GEN_45; // @[spi.scala 300:114:@3848.6]
  wire  _GEN_46; // @[spi.scala 297:37:@3830.4]
  wire [8:0] _GEN_47; // @[spi.scala 297:37:@3830.4]
  wire  _GEN_48; // @[spi.scala 310:39:@3868.6]
  wire  _GEN_49; // @[spi.scala 308:36:@3863.4]
  wire  _T_355; // @[spi.scala 314:12:@3871.4]
  wire  _T_356; // @[spi.scala 314:22:@3872.4]
  wire  _T_357; // @[spi.scala 314:31:@3873.4]
  wire  _T_359; // @[spi.scala 316:24:@3878.6]
  wire  _GEN_50; // @[spi.scala 316:43:@3879.6]
  wire  _GEN_51; // @[spi.scala 314:46:@3874.4]
  wire  _T_364; // @[spi.scala 320:40:@3884.4]
  wire  _GEN_52; // @[spi.scala 321:22:@3886.6]
  wire  _GEN_53; // @[spi.scala 321:22:@3886.6]
  wire  _T_367; // @[spi.scala 326:24:@3894.6]
  wire  _GEN_54; // @[spi.scala 326:39:@3895.6]
  wire  _GEN_55; // @[spi.scala 326:39:@3895.6]
  wire  _GEN_56; // @[spi.scala 320:72:@3885.4]
  wire  _GEN_57; // @[spi.scala 320:72:@3885.4]
  wire  _T_370; // @[spi.scala 331:21:@3899.4]
  wire  _T_371; // @[spi.scala 331:34:@3900.4]
  wire  _GEN_58; // @[spi.scala 331:51:@3901.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 106:33:@3510.4]
  assign _T_104 = io_wbs_m2s_we == 1'h0; // @[spi.scala 108:19:@3511.4]
  assign rd_en = _T_104 & io_wbs_m2s_stb; // @[spi.scala 108:34:@3512.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 109:33:@3515.4]
  assign _T_115 = addr == 8'h0; // @[spi.scala 113:32:@3519.4]
  assign sel_reg_rx = _T_115 & io_spi_select; // @[spi.scala 113:54:@3520.4]
  assign _T_116 = addr == 8'h1; // @[spi.scala 114:32:@3521.4]
  assign sel_reg_tx = _T_116 & io_spi_select; // @[spi.scala 114:54:@3522.4]
  assign _T_118 = addr == 8'h3; // @[spi.scala 116:32:@3525.4]
  assign sel_reg_control = _T_118 & io_spi_select; // @[spi.scala 116:55:@3526.4]
  assign _T_119 = addr == 8'h4; // @[spi.scala 117:32:@3527.4]
  assign sel_reg_status = _T_119 & io_spi_select; // @[spi.scala 117:54:@3528.4]
  assign _T_120 = addr == 8'h5; // @[spi.scala 118:32:@3529.4]
  assign sel_reg_ssmask = _T_120 & io_spi_select; // @[spi.scala 118:55:@3530.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 121:23:@3531.4]
  assign _T_121 = wr_en & sel_reg_tx; // @[spi.scala 126:14:@3534.4]
  assign _T_122 = _T_121 & bit_trdy; // @[spi.scala 126:28:@3535.4]
  assign latch_s_data = io_wbs_m2s_data[7:0]; // @[:@3490.4 :@3491.4 spi.scala 110:16:@3518.4]
  assign _GEN_1 = _T_122 ? latch_s_data : reg_txdata; // @[spi.scala 126:41:@3536.4]
  assign _T_123 = bit_toe | bit_roe; // @[spi.scala 131:19:@3539.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3546.4]
  assign reg_control = {bit_sso,1'h0,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3553.4]
  assign _T_138 = wr_en & sel_reg_control; // @[spi.scala 138:14:@3554.4]
  assign _T_139 = latch_s_data[0]; // @[spi.scala 139:30:@3556.6]
  assign _T_140 = latch_s_data[1]; // @[spi.scala 140:30:@3558.6]
  assign _T_141 = latch_s_data[3]; // @[spi.scala 141:30:@3560.6]
  assign _T_142 = latch_s_data[4]; // @[spi.scala 142:30:@3562.6]
  assign _T_143 = latch_s_data[5]; // @[spi.scala 143:30:@3564.6]
  assign _T_144 = latch_s_data[7]; // @[spi.scala 144:30:@3566.6]
  assign _GEN_2 = _T_138 ? _T_139 : bit_iroe; // @[spi.scala 138:34:@3555.4]
  assign _GEN_3 = _T_138 ? _T_140 : bit_itoe; // @[spi.scala 138:34:@3555.4]
  assign _GEN_4 = _T_138 ? _T_141 : bit_itrdy; // @[spi.scala 138:34:@3555.4]
  assign _GEN_5 = _T_138 ? _T_142 : bit_irrdy; // @[spi.scala 138:34:@3555.4]
  assign _GEN_6 = _T_138 ? _T_143 : bit_ie; // @[spi.scala 138:34:@3555.4]
  assign _GEN_7 = _T_138 ? _T_144 : bit_sso; // @[spi.scala 138:34:@3555.4]
  assign _T_145 = bit_iroe & bit_roe; // @[spi.scala 147:37:@3569.4]
  assign _T_146 = bit_itoe & bit_toe; // @[spi.scala 147:58:@3570.4]
  assign _T_147 = _T_145 | _T_146; // @[spi.scala 147:47:@3571.4]
  assign _T_148 = bit_ie & _T_147; // @[spi.scala 147:25:@3572.4]
  assign _T_149 = bit_itrdy & bit_trdy; // @[spi.scala 147:83:@3573.4]
  assign _T_150 = _T_148 | _T_149; // @[spi.scala 147:70:@3574.4]
  assign _T_151 = bit_irrdy & bit_rrdy; // @[spi.scala 147:108:@3575.4]
  assign _T_155 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 154:39:@3583.6]
  assign _T_156 = io_wbs_m2s_stb & _T_155; // @[spi.scala 154:30:@3584.6]
  assign _GEN_8 = _T_156 ? 1'h1 : ack_o; // @[spi.scala 154:59:@3585.6]
  assign _GEN_9 = ack_o ? 1'h0 : _GEN_8; // @[spi.scala 152:15:@3578.4]
  assign _T_160 = ~ io_wbs_m2s_we; // @[spi.scala 161:35:@3594.6]
  assign _T_161 = io_wbs_m2s_stb & _T_160; // @[spi.scala 161:30:@3595.6]
  assign _GEN_10 = _T_161 ? 1'h1 : read_wait_done; // @[spi.scala 161:43:@3596.6]
  assign _GEN_11 = ack_o ? 1'h0 : _GEN_10; // @[spi.scala 159:15:@3589.4]
  assign _T_174 = n_status == 3'h1; // @[spi.scala 175:27:@3611.6]
  assign _GEN_12 = _T_174 ? 1'h0 : pending_data; // @[spi.scala 175:40:@3612.6]
  assign _GEN_13 = _T_121 ? 1'h1 : _GEN_12; // @[spi.scala 173:32:@3607.4]
  assign _T_180 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 181:78:@3618.6]
  assign _T_181 = sel_reg_control ? reg_control : _T_180; // @[spi.scala 181:44:@3619.6]
  assign _T_182 = sel_reg_status ? reg_status : _T_181; // @[spi.scala 181:12:@3620.6]
  assign _T_183 = sel_reg_tx ? reg_txdata : _T_182; // @[spi.scala 180:49:@3621.6]
  assign _T_184 = sel_reg_rx ? reg_rxdata : _T_183; // @[spi.scala 180:21:@3622.6]
  assign _GEN_14 = rd_en ? _T_184 : rd_data; // @[spi.scala 179:18:@3615.4]
  assign _T_185 = wr_en & sel_reg_ssmask; // @[spi.scala 185:16:@3626.4]
  assign _GEN_15 = _T_185 ? _T_139 : reg_ssmask; // @[spi.scala 185:35:@3627.4]
  assign _T_188 = n_status == 3'h3; // @[spi.scala 201:21:@3633.4]
  assign _T_190 = clock_cnt == 5'h3; // @[spi.scala 201:49:@3634.4]
  assign _T_191 = _T_188 & _T_190; // @[spi.scala 201:35:@3635.4]
  assign _T_192 = ~ sclk_r; // @[spi.scala 202:18:@3637.6]
  assign _GEN_16 = _T_191 ? _T_192 : sclk_r; // @[spi.scala 201:67:@3636.4]
  assign _T_196 = 1'h0 == sclk_r; // @[spi.scala 208:59:@3643.4]
  assign _T_197 = _T_190 & _T_196; // @[spi.scala 208:39:@3644.4]
  assign _T_199 = _T_197 & _T_188; // @[spi.scala 208:71:@3646.4]
  assign _T_203 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3654.8]
  assign _GEN_18 = _T_199 ? _T_203 : {{1'd0}, rx_shift_data}; // @[spi.scala 208:99:@3647.4]
  assign _T_204 = p_status == 3'h3; // @[spi.scala 217:20:@3658.4]
  assign _T_205 = n_status != 3'h3; // @[spi.scala 217:47:@3659.4]
  assign _T_206 = _T_204 & _T_205; // @[spi.scala 217:34:@3660.4]
  assign _GEN_19 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 219:33:@3665.6]
  assign _GEN_20 = _T_206 ? 1'h1 : _GEN_19; // @[spi.scala 217:62:@3661.4]
  assign _T_211 = n_status == 3'h0; // @[spi.scala 223:49:@3669.4]
  assign _T_212 = _T_190 | _T_211; // @[spi.scala 223:36:@3670.4]
  assign _T_215 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3675.6]
  assign _T_216 = clock_cnt + 5'h1; // @[spi.scala 226:30:@3676.6]
  assign _GEN_21 = _T_212 ? 5'h0 : _T_216; // @[spi.scala 223:63:@3671.4]
  assign _GEN_22 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 235:26:@3687.6]
  assign _T_229 = n_status == 3'h2; // @[spi.scala 246:27:@3706.8]
  assign _T_233 = data_cnt == 6'h1; // @[spi.scala 247:53:@3709.10]
  assign _T_234 = _T_190 & _T_233; // @[spi.scala 247:40:@3710.10]
  assign _GEN_24 = _T_234 ? 3'h3 : 3'h2; // @[spi.scala 247:76:@3711.10]
  assign _T_238 = data_cnt == 6'h7; // @[spi.scala 253:53:@3722.12]
  assign _T_239 = _T_190 & _T_238; // @[spi.scala 253:40:@3723.12]
  assign _T_242 = _T_239 & sclk_r; // @[spi.scala 253:69:@3725.12]
  assign _GEN_25 = _T_242 ? 3'h4 : 3'h3; // @[spi.scala 253:105:@3726.12]
  assign _T_243 = n_status == 3'h4; // @[spi.scala 258:27:@3734.12]
  assign _GEN_27 = _T_190 ? 3'h5 : n_status; // @[spi.scala 259:39:@3737.14]
  assign _T_247 = n_status == 3'h5; // @[spi.scala 266:27:@3747.14]
  assign _T_251 = data_cnt == 6'h2; // @[spi.scala 267:53:@3750.16]
  assign _T_252 = _T_190 & _T_251; // @[spi.scala 267:40:@3751.16]
  assign _GEN_28 = _T_252 ? 3'h0 : 3'h5; // @[spi.scala 267:77:@3752.16]
  assign _GEN_29 = _T_247 ? _GEN_28 : 3'h0; // @[spi.scala 266:44:@3748.14]
  assign _GEN_30 = _T_243 ? _GEN_27 : _GEN_29; // @[spi.scala 258:46:@3735.12]
  assign _GEN_31 = _T_188 ? _GEN_25 : _GEN_30; // @[spi.scala 252:41:@3720.10]
  assign _GEN_32 = _T_229 ? _GEN_24 : _GEN_31; // @[spi.scala 246:40:@3707.8]
  assign _GEN_33 = _T_174 ? 3'h2 : _GEN_32; // @[spi.scala 240:40:@3696.6]
  assign _GEN_34 = _T_211 ? _GEN_22 : _GEN_33; // @[spi.scala 234:32:@3686.4]
  assign _T_256 = _T_229 & _T_190; // @[spi.scala 276:32:@3764.4]
  assign _T_259 = _T_256 & _T_233; // @[spi.scala 276:63:@3766.4]
  assign _T_266 = _T_191 & _T_238; // @[spi.scala 278:73:@3775.6]
  assign _T_269 = _T_266 & sclk_r; // @[spi.scala 278:102:@3777.6]
  assign _T_274 = _T_247 & _T_190; // @[spi.scala 280:45:@3784.8]
  assign _T_277 = _T_274 & _T_251; // @[spi.scala 280:76:@3786.8]
  assign _T_291 = _T_191 & sclk_r; // @[spi.scala 282:133:@3799.10]
  assign _T_292 = _T_256 | _T_291; // @[spi.scala 282:74:@3800.10]
  assign _T_297 = _T_292 | _T_274; // @[spi.scala 282:174:@3804.10]
  assign _T_299 = data_cnt + 6'h1; // @[spi.scala 283:28:@3806.12]
  assign _T_300 = data_cnt + 6'h1; // @[spi.scala 283:28:@3807.12]
  assign _GEN_35 = _T_297 ? _T_300 : data_cnt; // @[spi.scala 282:238:@3805.10]
  assign _GEN_36 = _T_277 ? 6'h0 : _GEN_35; // @[spi.scala 280:113:@3787.8]
  assign _GEN_37 = _T_269 ? 6'h0 : _GEN_36; // @[spi.scala 278:138:@3778.6]
  assign _GEN_38 = _T_259 ? 6'h0 : _GEN_37; // @[spi.scala 276:99:@3767.4]
  assign _T_321 = reg_txdata[7]; // @[spi.scala 298:72:@3832.6]
  assign _T_328 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3837.6]
  assign _T_341 = tx_shift_data[7]; // @[spi.scala 302:80:@3851.10]
  assign _T_348 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3856.10]
  assign _GEN_42 = wait_one_tick_done ? _T_341 : mosi_r; // @[spi.scala 301:32:@3849.8]
  assign _GEN_43 = wait_one_tick_done ? _T_348 : {{1'd0}, tx_shift_data}; // @[spi.scala 301:32:@3849.8]
  assign _GEN_44 = _T_291 ? _GEN_42 : mosi_r; // @[spi.scala 300:114:@3848.6]
  assign _GEN_45 = _T_291 ? _GEN_43 : {{1'd0}, tx_shift_data}; // @[spi.scala 300:114:@3848.6]
  assign _GEN_46 = _T_229 ? _T_321 : _GEN_44; // @[spi.scala 297:37:@3830.4]
  assign _GEN_47 = _T_229 ? _T_328 : _GEN_45; // @[spi.scala 297:37:@3830.4]
  assign _GEN_48 = _T_121 ? 1'h0 : bit_trdy; // @[spi.scala 310:39:@3868.6]
  assign _GEN_49 = _T_188 ? 1'h1 : _GEN_48; // @[spi.scala 308:36:@3863.4]
  assign _T_355 = bit_trdy == 1'h0; // @[spi.scala 314:12:@3871.4]
  assign _T_356 = _T_355 & wr_en; // @[spi.scala 314:22:@3872.4]
  assign _T_357 = _T_356 & sel_reg_tx; // @[spi.scala 314:31:@3873.4]
  assign _T_359 = wr_en & sel_reg_status; // @[spi.scala 316:24:@3878.6]
  assign _GEN_50 = _T_359 ? 1'h0 : bit_toe; // @[spi.scala 316:43:@3879.6]
  assign _GEN_51 = _T_357 ? 1'h1 : _GEN_50; // @[spi.scala 314:46:@3874.4]
  assign _T_364 = _T_243 & _T_190; // @[spi.scala 320:40:@3884.4]
  assign _GEN_52 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 321:22:@3886.6]
  assign _GEN_53 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 321:22:@3886.6]
  assign _T_367 = rd_en & sel_reg_rx; // @[spi.scala 326:24:@3894.6]
  assign _GEN_54 = _T_367 ? 1'h0 : bit_rrdy; // @[spi.scala 326:39:@3895.6]
  assign _GEN_55 = _T_367 ? 1'h0 : bit_roe; // @[spi.scala 326:39:@3895.6]
  assign _GEN_56 = _T_364 ? _GEN_52 : _GEN_55; // @[spi.scala 320:72:@3885.4]
  assign _GEN_57 = _T_364 ? _GEN_53 : _GEN_54; // @[spi.scala 320:72:@3885.4]
  assign _T_370 = n_status != 3'h0; // @[spi.scala 331:21:@3899.4]
  assign _T_371 = _T_370 | pending_data; // @[spi.scala 331:34:@3900.4]
  assign _GEN_58 = _T_371 ? 1'h0 : 1'h1; // @[spi.scala 331:51:@3901.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 198:13:@3632.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 204:16:@3640.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 306:15:@3861.4]
  assign io_spi_intr = _T_150 | _T_151; // @[spi.scala 147:14:@3577.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 157:15:@3588.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 183:18:@3625.4]
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
module WB_InterConnect( // @[:@3908.2]
  input         clock, // @[:@3909.4]
  input         reset, // @[:@3910.4]
  input  [31:0] io_dbus_addr, // @[:@3911.4]
  input  [31:0] io_dbus_wdata, // @[:@3911.4]
  output [31:0] io_dbus_rdata, // @[:@3911.4]
  input         io_dbus_rd_en, // @[:@3911.4]
  input         io_dbus_wr_en, // @[:@3911.4]
  input  [1:0]  io_dbus_st_type, // @[:@3911.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3911.4]
  output        io_dbus_valid, // @[:@3911.4]
  input  [31:0] io_ibus_addr, // @[:@3911.4]
  output [31:0] io_ibus_inst, // @[:@3911.4]
  output        io_ibus_valid, // @[:@3911.4]
  output [8:0]  io_imem_io_addr, // @[:@3911.4]
  input  [31:0] io_imem_io_rdata, // @[:@3911.4]
  output [31:0] io_imem_io_wdata, // @[:@3911.4]
  output        io_imem_io_wr_en, // @[:@3911.4]
  output        io_imem_io_cs, // @[:@3911.4]
  output [7:0]  io_dmem_io_addr, // @[:@3911.4]
  output [31:0] io_dmem_io_wdata, // @[:@3911.4]
  input  [31:0] io_dmem_io_rdata, // @[:@3911.4]
  output        io_dmem_io_cs, // @[:@3911.4]
  output        io_dmem_io_wr_en, // @[:@3911.4]
  output [3:0]  io_dmem_io_st_type, // @[:@3911.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3911.4]
  output [31:0] io_wbm_m2s_data, // @[:@3911.4]
  output        io_wbm_m2s_we, // @[:@3911.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3911.4]
  output        io_wbm_m2s_stb, // @[:@3911.4]
  output        io_uart_tx, // @[:@3911.4]
  input         io_uart_rx, // @[:@3911.4]
  output        io_uart_irq, // @[:@3911.4]
  output        io_spi_cs, // @[:@3911.4]
  output        io_spi_clk, // @[:@3911.4]
  output        io_spi_mosi, // @[:@3911.4]
  input         io_spi_miso, // @[:@3911.4]
  output        io_spi_irq, // @[:@3911.4]
  input         io_motor_ack_i, // @[:@3911.4]
  input  [31:0] io_motor_data_i, // @[:@3911.4]
  output        io_motor_addr_sel // @[:@3911.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_reset; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [7:0] dmem_io_dmem_io_addr; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [31:0] dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [31:0] dmem_io_dmem_io_rdata; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_io_dmem_io_cs; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 73:24:@3913.4]
  wire [3:0] dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 73:24:@3913.4]
  wire  imem_clock; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_reset; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [8:0] imem_io_imem_io_addr; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_imem_io_rdata; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] imem_io_imem_io_wdata; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_imem_io_wr_en; // @[wb_interconnect.scala 74:24:@3916.4]
  wire  imem_io_imem_io_cs; // @[wb_interconnect.scala 74:24:@3916.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 75:24:@3919.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 75:24:@3919.4]
  wire  uart_clock; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_reset; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 76:24:@3922.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 76:24:@3922.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 76:24:@3922.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 76:24:@3922.4]
  wire  spi_clock; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_reset; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 77:24:@3925.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 77:24:@3925.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 77:24:@3925.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 77:24:@3925.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 77:24:@3925.4]
  wire [3:0] address; // @[wb_interconnect.scala 87:50:@3957.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 88:35:@3958.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 89:35:@3959.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 90:35:@3960.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 91:35:@3961.4]
  wire  motor_addr_match; // @[wb_interconnect.scala 92:35:@3962.4]
  reg  imem_sel; // @[wb_interconnect.scala 117:22:@3994.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 118:22:@3995.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 119:22:@3996.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 120:22:@3997.4]
  reg [31:0] _RAND_3;
  reg  motor_sel; // @[wb_interconnect.scala 121:22:@3998.4]
  reg [31:0] _RAND_4;
  wire [31:0] _T_108; // @[wb_interconnect.scala 133:41:@4009.4]
  wire [31:0] _T_109; // @[wb_interconnect.scala 132:39:@4010.4]
  wire [31:0] _T_110; // @[wb_interconnect.scala 131:37:@4011.4]
  wire [31:0] _T_111; // @[wb_interconnect.scala 130:35:@4012.4]
  wire  _T_114; // @[wb_interconnect.scala 138:41:@4015.4]
  wire  _T_115; // @[wb_interconnect.scala 137:39:@4016.4]
  wire  _T_116; // @[wb_interconnect.scala 136:37:@4017.4]
  wire  _T_117; // @[wb_interconnect.scala 135:35:@4018.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 73:24:@3913.4]
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
  IMem_Interface imem ( // @[wb_interconnect.scala 74:24:@3916.4]
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
    .io_imem_io_cs(imem_io_imem_io_cs)
  );
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 75:24:@3919.4]
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
  UART uart ( // @[wb_interconnect.scala 76:24:@3922.4]
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
  SPI spi ( // @[wb_interconnect.scala 77:24:@3925.4]
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
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 87:50:@3957.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 88:35:@3958.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 89:35:@3959.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 90:35:@3960.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 91:35:@3961.4]
  assign motor_addr_match = address == 4'h4; // @[wb_interconnect.scala 92:35:@3962.4]
  assign _T_108 = motor_sel ? io_motor_data_i : 32'h0; // @[wb_interconnect.scala 133:41:@4009.4]
  assign _T_109 = spi_sel ? spi_io_wbs_data_o : _T_108; // @[wb_interconnect.scala 132:39:@4010.4]
  assign _T_110 = uart_sel ? uart_io_wbs_data_o : _T_109; // @[wb_interconnect.scala 131:37:@4011.4]
  assign _T_111 = imem_sel ? imem_io_wbs_data_o : _T_110; // @[wb_interconnect.scala 130:35:@4012.4]
  assign _T_114 = motor_sel ? io_motor_ack_i : 1'h0; // @[wb_interconnect.scala 138:41:@4015.4]
  assign _T_115 = spi_sel ? spi_io_wbs_ack_o : _T_114; // @[wb_interconnect.scala 137:39:@4016.4]
  assign _T_116 = uart_sel ? uart_io_wbs_ack_o : _T_115; // @[wb_interconnect.scala 136:37:@4017.4]
  assign _T_117 = imem_sel ? imem_io_wbs_ack_o : _T_116; // @[wb_interconnect.scala 135:35:@4018.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 80:20:@3933.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 80:20:@3928.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 81:20:@3937.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 81:20:@3936.4]
  assign io_imem_io_addr = imem_io_imem_io_addr; // @[wb_interconnect.scala 83:20:@3947.4]
  assign io_imem_io_wdata = imem_io_imem_io_wdata; // @[wb_interconnect.scala 83:20:@3945.4]
  assign io_imem_io_wr_en = imem_io_imem_io_wr_en; // @[wb_interconnect.scala 83:20:@3944.4]
  assign io_imem_io_cs = imem_io_imem_io_cs; // @[wb_interconnect.scala 83:20:@3943.4]
  assign io_dmem_io_addr = dmem_io_dmem_io_addr; // @[wb_interconnect.scala 84:20:@3956.4]
  assign io_dmem_io_wdata = dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 84:20:@3955.4]
  assign io_dmem_io_cs = dmem_io_dmem_io_cs; // @[wb_interconnect.scala 84:20:@3953.4]
  assign io_dmem_io_wr_en = dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 84:20:@3952.4]
  assign io_dmem_io_st_type = dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 84:20:@3951.4]
  assign io_wbm_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 114:14:@3993.4]
  assign io_wbm_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 114:14:@3992.4]
  assign io_wbm_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 114:14:@3991.4]
  assign io_wbm_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 114:14:@3990.4]
  assign io_wbm_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 114:14:@3989.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 144:24:@4023.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 145:24:@4024.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 150:24:@4027.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 151:24:@4028.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 152:24:@4029.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 153:24:@4030.4]
  assign io_motor_addr_sel = address == 4'h4; // @[wb_interconnect.scala 95:21:@3963.4]
  assign dmem_clock = clock; // @[:@3914.4]
  assign dmem_reset = reset; // @[:@3915.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 100:20:@3969.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 100:20:@3968.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 100:20:@3967.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 100:20:@3966.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 100:20:@3965.4]
  assign dmem_io_dmem_io_rdata = io_dmem_io_rdata; // @[wb_interconnect.scala 84:20:@3954.4]
  assign imem_clock = clock; // @[:@3917.4]
  assign imem_reset = reset; // @[:@3918.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 81:20:@3938.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 104:20:@3975.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 104:20:@3974.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 104:20:@3973.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 104:20:@3972.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 104:20:@3971.4]
  assign imem_io_imem_io_rdata = io_imem_io_rdata; // @[wb_interconnect.scala 83:20:@3946.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 80:20:@3935.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 80:20:@3934.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 80:20:@3932.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 80:20:@3931.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 80:20:@3930.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 80:20:@3929.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_117; // @[wb_interconnect.scala 134:26:@4020.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_111; // @[wb_interconnect.scala 129:26:@4014.4]
  assign uart_clock = clock; // @[:@3923.4]
  assign uart_reset = reset; // @[:@3924.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 142:24:@4021.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 143:24:@4022.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 107:20:@3981.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 107:20:@3980.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 107:20:@3979.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 107:20:@3977.4]
  assign spi_clock = clock; // @[:@3926.4]
  assign spi_reset = reset; // @[:@3927.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 148:24:@4025.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 149:24:@4026.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 110:19:@3987.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 110:19:@3986.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 110:19:@3985.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 110:19:@3983.4]
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
