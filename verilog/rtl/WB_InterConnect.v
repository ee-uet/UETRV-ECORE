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
  output [8:0]  io_dmem_io_addr, // @[:@1885.4]
  output [31:0] io_dmem_io_wdata, // @[:@1885.4]
  input  [31:0] io_dmem_io_rdata, // @[:@1885.4]
  output        io_dmem_io_cs, // @[:@1885.4]
  output        io_dmem_io_wr_en, // @[:@1885.4]
  output [3:0]  io_dmem_io_st_type // @[:@1885.4]
);
  wire [3:0] _T_47; // @[dmem_interface.scala 50:41:@1887.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 50:79:@1888.4]
  wire  dmem_select; // @[dmem_interface.scala 52:41:@1889.4]
  wire  _T_56; // @[dmem_interface.scala 53:26:@1890.4]
  wire  _T_58; // @[dmem_interface.scala 58:42:@1895.4]
  reg  ack2; // @[dmem_interface.scala 63:28:@1900.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 64:49:@1902.4]
  wire  _GEN_0; // @[dmem_interface.scala 66:21:@1903.4]
  reg  ack; // @[dmem_interface.scala 70:28:@1907.4]
  reg [31:0] _RAND_1;
  reg [3:0] wb_select; // @[dmem_interface.scala 78:24:@1914.4]
  reg [31:0] _RAND_2;
  wire  _T_72; // @[dmem_interface.scala 81:18:@1916.4]
  wire [7:0] _T_73; // @[dmem_interface.scala 82:24:@1918.6]
  wire  _T_74; // @[dmem_interface.scala 83:24:@1922.6]
  wire [7:0] _T_75; // @[dmem_interface.scala 84:24:@1924.8]
  wire  _T_76; // @[dmem_interface.scala 85:24:@1928.8]
  wire [7:0] _T_77; // @[dmem_interface.scala 86:24:@1930.10]
  wire  _T_78; // @[dmem_interface.scala 87:24:@1934.10]
  wire [7:0] _T_79; // @[dmem_interface.scala 88:24:@1936.12]
  wire  _T_80; // @[dmem_interface.scala 89:24:@1940.12]
  wire [15:0] _T_81; // @[dmem_interface.scala 90:24:@1942.14]
  wire  _T_82; // @[dmem_interface.scala 91:24:@1946.14]
  wire [15:0] _T_83; // @[dmem_interface.scala 92:24:@1948.16]
  wire [31:0] _GEN_1; // @[dmem_interface.scala 91:54:@1947.14]
  wire [31:0] _GEN_2; // @[dmem_interface.scala 89:52:@1941.12]
  wire [31:0] _GEN_3; // @[dmem_interface.scala 87:52:@1935.10]
  wire [31:0] _GEN_4; // @[dmem_interface.scala 85:52:@1929.8]
  wire [31:0] _GEN_5; // @[dmem_interface.scala 83:52:@1923.6]
  wire [31:0] rdata; // @[dmem_interface.scala 81:45:@1917.4]
  reg  rd_resp; // @[dmem_interface.scala 97:24:@1955.4]
  reg [31:0] _RAND_3;
  assign _T_47 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 50:41:@1887.4]
  assign dmem_addr_match = _T_47 == 4'h1; // @[dmem_interface.scala 50:79:@1888.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 52:41:@1889.4]
  assign _T_56 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 53:26:@1890.4]
  assign _T_58 = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 58:42:@1895.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 64:49:@1902.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 66:21:@1903.4]
  assign _T_72 = wb_select == 4'h1; // @[dmem_interface.scala 81:18:@1916.4]
  assign _T_73 = io_dmem_io_rdata[7:0]; // @[dmem_interface.scala 82:24:@1918.6]
  assign _T_74 = wb_select == 4'h2; // @[dmem_interface.scala 83:24:@1922.6]
  assign _T_75 = io_dmem_io_rdata[15:8]; // @[dmem_interface.scala 84:24:@1924.8]
  assign _T_76 = wb_select == 4'h4; // @[dmem_interface.scala 85:24:@1928.8]
  assign _T_77 = io_dmem_io_rdata[23:16]; // @[dmem_interface.scala 86:24:@1930.10]
  assign _T_78 = wb_select == 4'h8; // @[dmem_interface.scala 87:24:@1934.10]
  assign _T_79 = io_dmem_io_rdata[31:24]; // @[dmem_interface.scala 88:24:@1936.12]
  assign _T_80 = wb_select == 4'h3; // @[dmem_interface.scala 89:24:@1940.12]
  assign _T_81 = io_dmem_io_rdata[15:0]; // @[dmem_interface.scala 90:24:@1942.14]
  assign _T_82 = wb_select == 4'hc; // @[dmem_interface.scala 91:24:@1946.14]
  assign _T_83 = io_dmem_io_rdata[31:16]; // @[dmem_interface.scala 92:24:@1948.16]
  assign _GEN_1 = _T_82 ? {{16'd0}, _T_83} : io_dmem_io_rdata; // @[dmem_interface.scala 91:54:@1947.14]
  assign _GEN_2 = _T_80 ? {{16'd0}, _T_81} : _GEN_1; // @[dmem_interface.scala 89:52:@1941.12]
  assign _GEN_3 = _T_78 ? {{24'd0}, _T_79} : _GEN_2; // @[dmem_interface.scala 87:52:@1935.10]
  assign _GEN_4 = _T_76 ? {{24'd0}, _T_77} : _GEN_3; // @[dmem_interface.scala 85:52:@1929.8]
  assign _GEN_5 = _T_74 ? {{24'd0}, _T_75} : _GEN_4; // @[dmem_interface.scala 83:52:@1923.6]
  assign rdata = _T_72 ? {{24'd0}, _T_73} : _GEN_5; // @[dmem_interface.scala 81:45:@1917.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 72:18:@1911.4]
  assign io_wbs_data_o = rd_resp ? rdata : 32'h0; // @[dmem_interface.scala 99:18:@1958.4]
  assign io_dmem_io_addr = io_wbs_m2s_addr[10:2]; // @[dmem_interface.scala 56:23:@1893.4]
  assign io_dmem_io_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 57:23:@1894.4]
  assign io_dmem_io_cs = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 59:23:@1898.4]
  assign io_dmem_io_wr_en = _T_58 == 1'h0; // @[dmem_interface.scala 58:23:@1897.4]
  assign io_dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 60:23:@1899.4]
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
module BMem( // @[:@1960.2]
  input         clock, // @[:@1961.4]
  input         reset, // @[:@1962.4]
  input  [31:0] io_bmem_addr, // @[:@1963.4]
  output [31:0] io_bmem_rdata // @[:@1963.4]
);
  wire [9:0] _T_9; // @[bmemory.scala 24:26:@1965.4]
  wire [9:0] addr; // @[bmemory.scala 24:33:@1966.4]
  reg [31:0] bmem_data; // @[bmemory.scala 25:26:@1967.4]
  reg [31:0] _RAND_0;
  wire  _T_14; // @[Conditional.scala 37:30:@1968.4]
  wire  _T_17; // @[Conditional.scala 37:30:@1973.6]
  wire  _T_20; // @[Conditional.scala 37:30:@1978.8]
  wire  _T_23; // @[Conditional.scala 37:30:@1983.10]
  wire  _T_26; // @[Conditional.scala 37:30:@1988.12]
  wire  _T_29; // @[Conditional.scala 37:30:@1993.14]
  wire  _T_32; // @[Conditional.scala 37:30:@1998.16]
  wire  _T_35; // @[Conditional.scala 37:30:@2003.18]
  wire  _T_38; // @[Conditional.scala 37:30:@2008.20]
  wire  _T_41; // @[Conditional.scala 37:30:@2013.22]
  wire  _T_44; // @[Conditional.scala 37:30:@2018.24]
  wire  _T_47; // @[Conditional.scala 37:30:@2023.26]
  wire  _T_50; // @[Conditional.scala 37:30:@2028.28]
  wire  _T_53; // @[Conditional.scala 37:30:@2033.30]
  wire  _T_56; // @[Conditional.scala 37:30:@2038.32]
  wire  _T_59; // @[Conditional.scala 37:30:@2043.34]
  wire  _T_62; // @[Conditional.scala 37:30:@2048.36]
  wire  _T_65; // @[Conditional.scala 37:30:@2053.38]
  wire  _T_68; // @[Conditional.scala 37:30:@2058.40]
  wire  _T_71; // @[Conditional.scala 37:30:@2063.42]
  wire  _T_74; // @[Conditional.scala 37:30:@2068.44]
  wire  _T_77; // @[Conditional.scala 37:30:@2073.46]
  wire  _T_80; // @[Conditional.scala 37:30:@2078.48]
  wire  _T_83; // @[Conditional.scala 37:30:@2083.50]
  wire  _T_86; // @[Conditional.scala 37:30:@2088.52]
  wire  _T_89; // @[Conditional.scala 37:30:@2093.54]
  wire  _T_92; // @[Conditional.scala 37:30:@2098.56]
  wire  _T_95; // @[Conditional.scala 37:30:@2103.58]
  wire  _T_98; // @[Conditional.scala 37:30:@2108.60]
  wire  _T_101; // @[Conditional.scala 37:30:@2113.62]
  wire  _T_104; // @[Conditional.scala 37:30:@2118.64]
  wire  _T_107; // @[Conditional.scala 37:30:@2123.66]
  wire  _T_110; // @[Conditional.scala 37:30:@2128.68]
  wire  _T_113; // @[Conditional.scala 37:30:@2133.70]
  wire  _T_116; // @[Conditional.scala 37:30:@2138.72]
  wire  _T_119; // @[Conditional.scala 37:30:@2143.74]
  wire  _T_122; // @[Conditional.scala 37:30:@2148.76]
  wire  _T_125; // @[Conditional.scala 37:30:@2153.78]
  wire  _T_128; // @[Conditional.scala 37:30:@2158.80]
  wire  _T_131; // @[Conditional.scala 37:30:@2163.82]
  wire  _T_134; // @[Conditional.scala 37:30:@2168.84]
  wire  _T_137; // @[Conditional.scala 37:30:@2173.86]
  wire  _T_140; // @[Conditional.scala 37:30:@2178.88]
  wire  _T_143; // @[Conditional.scala 37:30:@2183.90]
  wire  _T_146; // @[Conditional.scala 37:30:@2188.92]
  wire  _T_149; // @[Conditional.scala 37:30:@2193.94]
  wire  _T_152; // @[Conditional.scala 37:30:@2198.96]
  wire  _T_155; // @[Conditional.scala 37:30:@2203.98]
  wire  _T_158; // @[Conditional.scala 37:30:@2208.100]
  wire  _T_161; // @[Conditional.scala 37:30:@2213.102]
  wire  _T_164; // @[Conditional.scala 37:30:@2218.104]
  wire  _T_167; // @[Conditional.scala 37:30:@2223.106]
  wire  _T_170; // @[Conditional.scala 37:30:@2228.108]
  wire  _T_173; // @[Conditional.scala 37:30:@2233.110]
  wire  _T_176; // @[Conditional.scala 37:30:@2238.112]
  wire  _T_179; // @[Conditional.scala 37:30:@2243.114]
  wire  _T_182; // @[Conditional.scala 37:30:@2248.116]
  wire  _T_185; // @[Conditional.scala 37:30:@2253.118]
  wire  _T_188; // @[Conditional.scala 37:30:@2258.120]
  wire  _T_191; // @[Conditional.scala 37:30:@2263.122]
  wire  _T_194; // @[Conditional.scala 37:30:@2268.124]
  wire  _T_197; // @[Conditional.scala 37:30:@2273.126]
  wire  _T_200; // @[Conditional.scala 37:30:@2278.128]
  wire  _T_203; // @[Conditional.scala 37:30:@2283.130]
  wire  _T_206; // @[Conditional.scala 37:30:@2288.132]
  wire  _T_209; // @[Conditional.scala 37:30:@2293.134]
  wire  _T_212; // @[Conditional.scala 37:30:@2298.136]
  wire  _T_215; // @[Conditional.scala 37:30:@2303.138]
  wire  _T_218; // @[Conditional.scala 37:30:@2308.140]
  wire  _T_221; // @[Conditional.scala 37:30:@2313.142]
  wire  _T_224; // @[Conditional.scala 37:30:@2318.144]
  wire  _T_227; // @[Conditional.scala 37:30:@2323.146]
  wire  _T_230; // @[Conditional.scala 37:30:@2328.148]
  wire  _T_233; // @[Conditional.scala 37:30:@2333.150]
  wire  _T_236; // @[Conditional.scala 37:30:@2338.152]
  wire  _T_239; // @[Conditional.scala 37:30:@2343.154]
  wire  _T_242; // @[Conditional.scala 37:30:@2348.156]
  wire  _T_245; // @[Conditional.scala 37:30:@2353.158]
  wire  _T_248; // @[Conditional.scala 37:30:@2358.160]
  wire  _T_251; // @[Conditional.scala 37:30:@2363.162]
  wire  _T_254; // @[Conditional.scala 37:30:@2368.164]
  wire  _T_257; // @[Conditional.scala 37:30:@2373.166]
  wire  _T_260; // @[Conditional.scala 37:30:@2378.168]
  wire  _T_263; // @[Conditional.scala 37:30:@2383.170]
  wire  _T_266; // @[Conditional.scala 37:30:@2388.172]
  wire  _T_269; // @[Conditional.scala 37:30:@2393.174]
  wire  _T_272; // @[Conditional.scala 37:30:@2398.176]
  wire  _T_275; // @[Conditional.scala 37:30:@2403.178]
  wire  _T_278; // @[Conditional.scala 37:30:@2408.180]
  wire  _T_281; // @[Conditional.scala 37:30:@2413.182]
  wire  _T_284; // @[Conditional.scala 37:30:@2418.184]
  wire  _T_287; // @[Conditional.scala 37:30:@2423.186]
  wire  _T_290; // @[Conditional.scala 37:30:@2428.188]
  wire  _T_293; // @[Conditional.scala 37:30:@2433.190]
  wire  _T_296; // @[Conditional.scala 37:30:@2438.192]
  wire  _T_299; // @[Conditional.scala 37:30:@2443.194]
  wire  _T_302; // @[Conditional.scala 37:30:@2448.196]
  wire  _T_305; // @[Conditional.scala 37:30:@2453.198]
  wire  _T_308; // @[Conditional.scala 37:30:@2458.200]
  wire  _T_311; // @[Conditional.scala 37:30:@2463.202]
  wire  _T_314; // @[Conditional.scala 37:30:@2468.204]
  wire  _T_317; // @[Conditional.scala 37:30:@2473.206]
  wire  _T_320; // @[Conditional.scala 37:30:@2478.208]
  wire  _T_323; // @[Conditional.scala 37:30:@2483.210]
  wire  _T_326; // @[Conditional.scala 37:30:@2488.212]
  wire  _T_329; // @[Conditional.scala 37:30:@2493.214]
  wire  _T_332; // @[Conditional.scala 37:30:@2498.216]
  wire  _T_335; // @[Conditional.scala 37:30:@2503.218]
  wire  _T_338; // @[Conditional.scala 37:30:@2508.220]
  wire  _T_341; // @[Conditional.scala 37:30:@2513.222]
  wire  _T_344; // @[Conditional.scala 37:30:@2518.224]
  wire  _T_347; // @[Conditional.scala 37:30:@2523.226]
  wire  _T_350; // @[Conditional.scala 37:30:@2528.228]
  wire  _T_353; // @[Conditional.scala 37:30:@2533.230]
  wire  _T_356; // @[Conditional.scala 37:30:@2538.232]
  wire  _T_359; // @[Conditional.scala 37:30:@2543.234]
  wire  _T_362; // @[Conditional.scala 37:30:@2548.236]
  wire  _T_365; // @[Conditional.scala 37:30:@2553.238]
  wire  _T_368; // @[Conditional.scala 37:30:@2558.240]
  wire  _T_371; // @[Conditional.scala 37:30:@2563.242]
  wire  _T_374; // @[Conditional.scala 37:30:@2568.244]
  wire  _T_377; // @[Conditional.scala 37:30:@2573.246]
  wire  _T_380; // @[Conditional.scala 37:30:@2578.248]
  wire  _T_383; // @[Conditional.scala 37:30:@2583.250]
  wire  _T_386; // @[Conditional.scala 37:30:@2588.252]
  wire  _T_389; // @[Conditional.scala 37:30:@2593.254]
  wire  _T_392; // @[Conditional.scala 37:30:@2598.256]
  wire  _T_395; // @[Conditional.scala 37:30:@2603.258]
  wire  _T_398; // @[Conditional.scala 37:30:@2608.260]
  wire  _T_401; // @[Conditional.scala 37:30:@2613.262]
  wire  _T_404; // @[Conditional.scala 37:30:@2618.264]
  wire  _T_407; // @[Conditional.scala 37:30:@2623.266]
  wire  _T_410; // @[Conditional.scala 37:30:@2628.268]
  wire  _T_413; // @[Conditional.scala 37:30:@2633.270]
  wire  _T_416; // @[Conditional.scala 37:30:@2638.272]
  wire  _T_419; // @[Conditional.scala 37:30:@2643.274]
  wire  _T_422; // @[Conditional.scala 37:30:@2648.276]
  wire  _T_425; // @[Conditional.scala 37:30:@2653.278]
  wire  _T_428; // @[Conditional.scala 37:30:@2658.280]
  wire  _T_431; // @[Conditional.scala 37:30:@2663.282]
  wire  _T_434; // @[Conditional.scala 37:30:@2668.284]
  wire  _T_437; // @[Conditional.scala 37:30:@2673.286]
  wire  _T_440; // @[Conditional.scala 37:30:@2678.288]
  wire  _T_443; // @[Conditional.scala 37:30:@2683.290]
  wire  _T_446; // @[Conditional.scala 37:30:@2688.292]
  wire  _T_449; // @[Conditional.scala 37:30:@2693.294]
  wire  _T_452; // @[Conditional.scala 37:30:@2698.296]
  wire  _T_455; // @[Conditional.scala 37:30:@2703.298]
  wire  _T_458; // @[Conditional.scala 37:30:@2708.300]
  wire  _T_461; // @[Conditional.scala 37:30:@2713.302]
  wire  _T_464; // @[Conditional.scala 37:30:@2718.304]
  wire  _T_467; // @[Conditional.scala 37:30:@2723.306]
  wire  _T_470; // @[Conditional.scala 37:30:@2728.308]
  wire  _T_473; // @[Conditional.scala 37:30:@2733.310]
  wire  _T_476; // @[Conditional.scala 37:30:@2738.312]
  wire  _T_479; // @[Conditional.scala 37:30:@2743.314]
  wire  _T_482; // @[Conditional.scala 37:30:@2748.316]
  wire  _T_485; // @[Conditional.scala 37:30:@2753.318]
  wire  _T_488; // @[Conditional.scala 37:30:@2758.320]
  wire  _T_491; // @[Conditional.scala 37:30:@2763.322]
  wire  _T_494; // @[Conditional.scala 37:30:@2768.324]
  wire  _T_497; // @[Conditional.scala 37:30:@2773.326]
  wire  _T_500; // @[Conditional.scala 37:30:@2778.328]
  wire  _T_503; // @[Conditional.scala 37:30:@2783.330]
  wire  _T_506; // @[Conditional.scala 37:30:@2788.332]
  wire  _T_509; // @[Conditional.scala 37:30:@2793.334]
  wire  _T_512; // @[Conditional.scala 37:30:@2798.336]
  wire  _T_515; // @[Conditional.scala 37:30:@2803.338]
  wire  _T_518; // @[Conditional.scala 37:30:@2808.340]
  wire  _T_521; // @[Conditional.scala 37:30:@2813.342]
  wire  _T_524; // @[Conditional.scala 37:30:@2818.344]
  wire  _T_527; // @[Conditional.scala 37:30:@2823.346]
  wire  _T_530; // @[Conditional.scala 37:30:@2828.348]
  wire  _T_533; // @[Conditional.scala 37:30:@2833.350]
  wire  _T_536; // @[Conditional.scala 37:30:@2838.352]
  wire  _T_539; // @[Conditional.scala 37:30:@2843.354]
  wire  _T_542; // @[Conditional.scala 37:30:@2848.356]
  wire  _T_545; // @[Conditional.scala 37:30:@2853.358]
  wire  _T_548; // @[Conditional.scala 37:30:@2858.360]
  wire  _T_551; // @[Conditional.scala 37:30:@2863.362]
  wire  _T_554; // @[Conditional.scala 37:30:@2868.364]
  wire  _T_557; // @[Conditional.scala 37:30:@2873.366]
  wire  _T_560; // @[Conditional.scala 37:30:@2878.368]
  wire  _T_563; // @[Conditional.scala 37:30:@2883.370]
  wire  _T_566; // @[Conditional.scala 37:30:@2888.372]
  wire  _T_569; // @[Conditional.scala 37:30:@2893.374]
  wire  _T_572; // @[Conditional.scala 37:30:@2898.376]
  wire  _T_575; // @[Conditional.scala 37:30:@2903.378]
  wire  _T_578; // @[Conditional.scala 37:30:@2908.380]
  wire  _T_581; // @[Conditional.scala 37:30:@2913.382]
  wire  _T_584; // @[Conditional.scala 37:30:@2918.384]
  wire  _T_587; // @[Conditional.scala 37:30:@2923.386]
  wire  _T_590; // @[Conditional.scala 37:30:@2928.388]
  wire  _T_593; // @[Conditional.scala 37:30:@2933.390]
  wire  _T_596; // @[Conditional.scala 37:30:@2938.392]
  wire  _T_599; // @[Conditional.scala 37:30:@2943.394]
  wire  _T_602; // @[Conditional.scala 37:30:@2948.396]
  wire  _T_605; // @[Conditional.scala 37:30:@2953.398]
  wire  _T_608; // @[Conditional.scala 37:30:@2958.400]
  wire  _T_611; // @[Conditional.scala 37:30:@2963.402]
  wire  _T_614; // @[Conditional.scala 37:30:@2968.404]
  wire  _T_617; // @[Conditional.scala 37:30:@2973.406]
  wire  _T_620; // @[Conditional.scala 37:30:@2978.408]
  wire  _T_623; // @[Conditional.scala 37:30:@2983.410]
  wire  _T_626; // @[Conditional.scala 37:30:@2988.412]
  wire  _T_629; // @[Conditional.scala 37:30:@2993.414]
  wire  _T_632; // @[Conditional.scala 37:30:@2998.416]
  wire  _T_635; // @[Conditional.scala 37:30:@3003.418]
  wire  _T_638; // @[Conditional.scala 37:30:@3008.420]
  wire  _T_641; // @[Conditional.scala 37:30:@3013.422]
  wire  _T_644; // @[Conditional.scala 37:30:@3018.424]
  wire  _T_647; // @[Conditional.scala 37:30:@3023.426]
  wire  _T_650; // @[Conditional.scala 37:30:@3028.428]
  wire  _T_653; // @[Conditional.scala 37:30:@3033.430]
  wire  _T_656; // @[Conditional.scala 37:30:@3038.432]
  wire  _T_659; // @[Conditional.scala 37:30:@3043.434]
  wire  _T_662; // @[Conditional.scala 37:30:@3048.436]
  wire  _T_665; // @[Conditional.scala 37:30:@3053.438]
  wire [31:0] _GEN_0; // @[Conditional.scala 39:67:@3054.438]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67:@3049.436]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67:@3044.434]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67:@3039.432]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67:@3034.430]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67:@3029.428]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67:@3024.426]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67:@3019.424]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67:@3014.422]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67:@3009.420]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@3004.418]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@2999.416]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@2994.414]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@2989.412]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@2984.410]
  wire [31:0] _GEN_15; // @[Conditional.scala 39:67:@2979.408]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@2974.406]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@2969.404]
  wire [31:0] _GEN_18; // @[Conditional.scala 39:67:@2964.402]
  wire [31:0] _GEN_19; // @[Conditional.scala 39:67:@2959.400]
  wire [31:0] _GEN_20; // @[Conditional.scala 39:67:@2954.398]
  wire [31:0] _GEN_21; // @[Conditional.scala 39:67:@2949.396]
  wire [31:0] _GEN_22; // @[Conditional.scala 39:67:@2944.394]
  wire [31:0] _GEN_23; // @[Conditional.scala 39:67:@2939.392]
  wire [31:0] _GEN_24; // @[Conditional.scala 39:67:@2934.390]
  wire [31:0] _GEN_25; // @[Conditional.scala 39:67:@2929.388]
  wire [31:0] _GEN_26; // @[Conditional.scala 39:67:@2924.386]
  wire [31:0] _GEN_27; // @[Conditional.scala 39:67:@2919.384]
  wire [31:0] _GEN_28; // @[Conditional.scala 39:67:@2914.382]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@2909.380]
  wire [31:0] _GEN_30; // @[Conditional.scala 39:67:@2904.378]
  wire [31:0] _GEN_31; // @[Conditional.scala 39:67:@2899.376]
  wire [31:0] _GEN_32; // @[Conditional.scala 39:67:@2894.374]
  wire [31:0] _GEN_33; // @[Conditional.scala 39:67:@2889.372]
  wire [31:0] _GEN_34; // @[Conditional.scala 39:67:@2884.370]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@2879.368]
  wire [31:0] _GEN_36; // @[Conditional.scala 39:67:@2874.366]
  wire [31:0] _GEN_37; // @[Conditional.scala 39:67:@2869.364]
  wire [31:0] _GEN_38; // @[Conditional.scala 39:67:@2864.362]
  wire [31:0] _GEN_39; // @[Conditional.scala 39:67:@2859.360]
  wire [31:0] _GEN_40; // @[Conditional.scala 39:67:@2854.358]
  wire [31:0] _GEN_41; // @[Conditional.scala 39:67:@2849.356]
  wire [31:0] _GEN_42; // @[Conditional.scala 39:67:@2844.354]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@2839.352]
  wire [31:0] _GEN_44; // @[Conditional.scala 39:67:@2834.350]
  wire [31:0] _GEN_45; // @[Conditional.scala 39:67:@2829.348]
  wire [31:0] _GEN_46; // @[Conditional.scala 39:67:@2824.346]
  wire [31:0] _GEN_47; // @[Conditional.scala 39:67:@2819.344]
  wire [31:0] _GEN_48; // @[Conditional.scala 39:67:@2814.342]
  wire [31:0] _GEN_49; // @[Conditional.scala 39:67:@2809.340]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@2804.338]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@2799.336]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@2794.334]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@2789.332]
  wire [31:0] _GEN_54; // @[Conditional.scala 39:67:@2784.330]
  wire [31:0] _GEN_55; // @[Conditional.scala 39:67:@2779.328]
  wire [31:0] _GEN_56; // @[Conditional.scala 39:67:@2774.326]
  wire [31:0] _GEN_57; // @[Conditional.scala 39:67:@2769.324]
  wire [31:0] _GEN_58; // @[Conditional.scala 39:67:@2764.322]
  wire [31:0] _GEN_59; // @[Conditional.scala 39:67:@2759.320]
  wire [31:0] _GEN_60; // @[Conditional.scala 39:67:@2754.318]
  wire [31:0] _GEN_61; // @[Conditional.scala 39:67:@2749.316]
  wire [31:0] _GEN_62; // @[Conditional.scala 39:67:@2744.314]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@2739.312]
  wire [31:0] _GEN_64; // @[Conditional.scala 39:67:@2734.310]
  wire [31:0] _GEN_65; // @[Conditional.scala 39:67:@2729.308]
  wire [31:0] _GEN_66; // @[Conditional.scala 39:67:@2724.306]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@2719.304]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@2714.302]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@2709.300]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@2704.298]
  wire [31:0] _GEN_71; // @[Conditional.scala 39:67:@2699.296]
  wire [31:0] _GEN_72; // @[Conditional.scala 39:67:@2694.294]
  wire [31:0] _GEN_73; // @[Conditional.scala 39:67:@2689.292]
  wire [31:0] _GEN_74; // @[Conditional.scala 39:67:@2684.290]
  wire [31:0] _GEN_75; // @[Conditional.scala 39:67:@2679.288]
  wire [31:0] _GEN_76; // @[Conditional.scala 39:67:@2674.286]
  wire [31:0] _GEN_77; // @[Conditional.scala 39:67:@2669.284]
  wire [31:0] _GEN_78; // @[Conditional.scala 39:67:@2664.282]
  wire [31:0] _GEN_79; // @[Conditional.scala 39:67:@2659.280]
  wire [31:0] _GEN_80; // @[Conditional.scala 39:67:@2654.278]
  wire [31:0] _GEN_81; // @[Conditional.scala 39:67:@2649.276]
  wire [31:0] _GEN_82; // @[Conditional.scala 39:67:@2644.274]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@2639.272]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@2634.270]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@2629.268]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@2624.266]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@2619.264]
  wire [31:0] _GEN_88; // @[Conditional.scala 39:67:@2614.262]
  wire [31:0] _GEN_89; // @[Conditional.scala 39:67:@2609.260]
  wire [31:0] _GEN_90; // @[Conditional.scala 39:67:@2604.258]
  wire [31:0] _GEN_91; // @[Conditional.scala 39:67:@2599.256]
  wire [31:0] _GEN_92; // @[Conditional.scala 39:67:@2594.254]
  wire [31:0] _GEN_93; // @[Conditional.scala 39:67:@2589.252]
  wire [31:0] _GEN_94; // @[Conditional.scala 39:67:@2584.250]
  wire [31:0] _GEN_95; // @[Conditional.scala 39:67:@2579.248]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67:@2574.246]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67:@2569.244]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67:@2564.242]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67:@2559.240]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67:@2554.238]
  wire [31:0] _GEN_101; // @[Conditional.scala 39:67:@2549.236]
  wire [31:0] _GEN_102; // @[Conditional.scala 39:67:@2544.234]
  wire [31:0] _GEN_103; // @[Conditional.scala 39:67:@2539.232]
  wire [31:0] _GEN_104; // @[Conditional.scala 39:67:@2534.230]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67:@2529.228]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67:@2524.226]
  wire [31:0] _GEN_107; // @[Conditional.scala 39:67:@2519.224]
  wire [31:0] _GEN_108; // @[Conditional.scala 39:67:@2514.222]
  wire [31:0] _GEN_109; // @[Conditional.scala 39:67:@2509.220]
  wire [31:0] _GEN_110; // @[Conditional.scala 39:67:@2504.218]
  wire [31:0] _GEN_111; // @[Conditional.scala 39:67:@2499.216]
  wire [31:0] _GEN_112; // @[Conditional.scala 39:67:@2494.214]
  wire [31:0] _GEN_113; // @[Conditional.scala 39:67:@2489.212]
  wire [31:0] _GEN_114; // @[Conditional.scala 39:67:@2484.210]
  wire [31:0] _GEN_115; // @[Conditional.scala 39:67:@2479.208]
  wire [31:0] _GEN_116; // @[Conditional.scala 39:67:@2474.206]
  wire [31:0] _GEN_117; // @[Conditional.scala 39:67:@2469.204]
  wire [31:0] _GEN_118; // @[Conditional.scala 39:67:@2464.202]
  wire [31:0] _GEN_119; // @[Conditional.scala 39:67:@2459.200]
  wire [31:0] _GEN_120; // @[Conditional.scala 39:67:@2454.198]
  wire [31:0] _GEN_121; // @[Conditional.scala 39:67:@2449.196]
  wire [31:0] _GEN_122; // @[Conditional.scala 39:67:@2444.194]
  wire [31:0] _GEN_123; // @[Conditional.scala 39:67:@2439.192]
  wire [31:0] _GEN_124; // @[Conditional.scala 39:67:@2434.190]
  wire [31:0] _GEN_125; // @[Conditional.scala 39:67:@2429.188]
  wire [31:0] _GEN_126; // @[Conditional.scala 39:67:@2424.186]
  wire [31:0] _GEN_127; // @[Conditional.scala 39:67:@2419.184]
  wire [31:0] _GEN_128; // @[Conditional.scala 39:67:@2414.182]
  wire [31:0] _GEN_129; // @[Conditional.scala 39:67:@2409.180]
  wire [31:0] _GEN_130; // @[Conditional.scala 39:67:@2404.178]
  wire [31:0] _GEN_131; // @[Conditional.scala 39:67:@2399.176]
  wire [31:0] _GEN_132; // @[Conditional.scala 39:67:@2394.174]
  wire [31:0] _GEN_133; // @[Conditional.scala 39:67:@2389.172]
  wire [31:0] _GEN_134; // @[Conditional.scala 39:67:@2384.170]
  wire [31:0] _GEN_135; // @[Conditional.scala 39:67:@2379.168]
  wire [31:0] _GEN_136; // @[Conditional.scala 39:67:@2374.166]
  wire [31:0] _GEN_137; // @[Conditional.scala 39:67:@2369.164]
  wire [31:0] _GEN_138; // @[Conditional.scala 39:67:@2364.162]
  wire [31:0] _GEN_139; // @[Conditional.scala 39:67:@2359.160]
  wire [31:0] _GEN_140; // @[Conditional.scala 39:67:@2354.158]
  wire [31:0] _GEN_141; // @[Conditional.scala 39:67:@2349.156]
  wire [31:0] _GEN_142; // @[Conditional.scala 39:67:@2344.154]
  wire [31:0] _GEN_143; // @[Conditional.scala 39:67:@2339.152]
  wire [31:0] _GEN_144; // @[Conditional.scala 39:67:@2334.150]
  wire [31:0] _GEN_145; // @[Conditional.scala 39:67:@2329.148]
  wire [31:0] _GEN_146; // @[Conditional.scala 39:67:@2324.146]
  wire [31:0] _GEN_147; // @[Conditional.scala 39:67:@2319.144]
  wire [31:0] _GEN_148; // @[Conditional.scala 39:67:@2314.142]
  wire [31:0] _GEN_149; // @[Conditional.scala 39:67:@2309.140]
  wire [31:0] _GEN_150; // @[Conditional.scala 39:67:@2304.138]
  wire [31:0] _GEN_151; // @[Conditional.scala 39:67:@2299.136]
  wire [31:0] _GEN_152; // @[Conditional.scala 39:67:@2294.134]
  wire [31:0] _GEN_153; // @[Conditional.scala 39:67:@2289.132]
  wire [31:0] _GEN_154; // @[Conditional.scala 39:67:@2284.130]
  wire [31:0] _GEN_155; // @[Conditional.scala 39:67:@2279.128]
  wire [31:0] _GEN_156; // @[Conditional.scala 39:67:@2274.126]
  wire [31:0] _GEN_157; // @[Conditional.scala 39:67:@2269.124]
  wire [31:0] _GEN_158; // @[Conditional.scala 39:67:@2264.122]
  wire [31:0] _GEN_159; // @[Conditional.scala 39:67:@2259.120]
  wire [31:0] _GEN_160; // @[Conditional.scala 39:67:@2254.118]
  wire [31:0] _GEN_161; // @[Conditional.scala 39:67:@2249.116]
  wire [31:0] _GEN_162; // @[Conditional.scala 39:67:@2244.114]
  wire [31:0] _GEN_163; // @[Conditional.scala 39:67:@2239.112]
  wire [31:0] _GEN_164; // @[Conditional.scala 39:67:@2234.110]
  wire [31:0] _GEN_165; // @[Conditional.scala 39:67:@2229.108]
  wire [31:0] _GEN_166; // @[Conditional.scala 39:67:@2224.106]
  wire [31:0] _GEN_167; // @[Conditional.scala 39:67:@2219.104]
  wire [31:0] _GEN_168; // @[Conditional.scala 39:67:@2214.102]
  wire [31:0] _GEN_169; // @[Conditional.scala 39:67:@2209.100]
  wire [31:0] _GEN_170; // @[Conditional.scala 39:67:@2204.98]
  wire [31:0] _GEN_171; // @[Conditional.scala 39:67:@2199.96]
  wire [31:0] _GEN_172; // @[Conditional.scala 39:67:@2194.94]
  wire [31:0] _GEN_173; // @[Conditional.scala 39:67:@2189.92]
  wire [31:0] _GEN_174; // @[Conditional.scala 39:67:@2184.90]
  wire [31:0] _GEN_175; // @[Conditional.scala 39:67:@2179.88]
  wire [31:0] _GEN_176; // @[Conditional.scala 39:67:@2174.86]
  wire [31:0] _GEN_177; // @[Conditional.scala 39:67:@2169.84]
  wire [31:0] _GEN_178; // @[Conditional.scala 39:67:@2164.82]
  wire [31:0] _GEN_179; // @[Conditional.scala 39:67:@2159.80]
  wire [31:0] _GEN_180; // @[Conditional.scala 39:67:@2154.78]
  wire [31:0] _GEN_181; // @[Conditional.scala 39:67:@2149.76]
  wire [31:0] _GEN_182; // @[Conditional.scala 39:67:@2144.74]
  wire [31:0] _GEN_183; // @[Conditional.scala 39:67:@2139.72]
  wire [31:0] _GEN_184; // @[Conditional.scala 39:67:@2134.70]
  wire [31:0] _GEN_185; // @[Conditional.scala 39:67:@2129.68]
  wire [31:0] _GEN_186; // @[Conditional.scala 39:67:@2124.66]
  wire [31:0] _GEN_187; // @[Conditional.scala 39:67:@2119.64]
  wire [31:0] _GEN_188; // @[Conditional.scala 39:67:@2114.62]
  wire [31:0] _GEN_189; // @[Conditional.scala 39:67:@2109.60]
  wire [31:0] _GEN_190; // @[Conditional.scala 39:67:@2104.58]
  wire [31:0] _GEN_191; // @[Conditional.scala 39:67:@2099.56]
  wire [31:0] _GEN_192; // @[Conditional.scala 39:67:@2094.54]
  wire [31:0] _GEN_193; // @[Conditional.scala 39:67:@2089.52]
  wire [31:0] _GEN_194; // @[Conditional.scala 39:67:@2084.50]
  wire [31:0] _GEN_195; // @[Conditional.scala 39:67:@2079.48]
  wire [31:0] _GEN_196; // @[Conditional.scala 39:67:@2074.46]
  wire [31:0] _GEN_197; // @[Conditional.scala 39:67:@2069.44]
  wire [31:0] _GEN_198; // @[Conditional.scala 39:67:@2064.42]
  wire [31:0] _GEN_199; // @[Conditional.scala 39:67:@2059.40]
  wire [31:0] _GEN_200; // @[Conditional.scala 39:67:@2054.38]
  wire [31:0] _GEN_201; // @[Conditional.scala 39:67:@2049.36]
  wire [31:0] _GEN_202; // @[Conditional.scala 39:67:@2044.34]
  wire [31:0] _GEN_203; // @[Conditional.scala 39:67:@2039.32]
  wire [31:0] _GEN_204; // @[Conditional.scala 39:67:@2034.30]
  wire [31:0] _GEN_205; // @[Conditional.scala 39:67:@2029.28]
  wire [31:0] _GEN_206; // @[Conditional.scala 39:67:@2024.26]
  wire [31:0] _GEN_207; // @[Conditional.scala 39:67:@2019.24]
  wire [31:0] _GEN_208; // @[Conditional.scala 39:67:@2014.22]
  wire [31:0] _GEN_209; // @[Conditional.scala 39:67:@2009.20]
  wire [31:0] _GEN_210; // @[Conditional.scala 39:67:@2004.18]
  wire [31:0] _GEN_211; // @[Conditional.scala 39:67:@1999.16]
  wire [31:0] _GEN_212; // @[Conditional.scala 39:67:@1994.14]
  wire [31:0] _GEN_213; // @[Conditional.scala 39:67:@1989.12]
  wire [31:0] _GEN_214; // @[Conditional.scala 39:67:@1984.10]
  wire [31:0] _GEN_215; // @[Conditional.scala 39:67:@1979.8]
  wire [31:0] _GEN_216; // @[Conditional.scala 39:67:@1974.6]
  wire [31:0] _GEN_217; // @[Conditional.scala 40:58:@1969.4]
  assign _T_9 = io_bmem_addr[9:0]; // @[bmemory.scala 24:26:@1965.4]
  assign addr = _T_9 / 10'h4; // @[bmemory.scala 24:33:@1966.4]
  assign _T_14 = 10'h0 == addr; // @[Conditional.scala 37:30:@1968.4]
  assign _T_17 = 10'h1 == addr; // @[Conditional.scala 37:30:@1973.6]
  assign _T_20 = 10'h2 == addr; // @[Conditional.scala 37:30:@1978.8]
  assign _T_23 = 10'h3 == addr; // @[Conditional.scala 37:30:@1983.10]
  assign _T_26 = 10'h4 == addr; // @[Conditional.scala 37:30:@1988.12]
  assign _T_29 = 10'h5 == addr; // @[Conditional.scala 37:30:@1993.14]
  assign _T_32 = 10'h6 == addr; // @[Conditional.scala 37:30:@1998.16]
  assign _T_35 = 10'h7 == addr; // @[Conditional.scala 37:30:@2003.18]
  assign _T_38 = 10'h8 == addr; // @[Conditional.scala 37:30:@2008.20]
  assign _T_41 = 10'h9 == addr; // @[Conditional.scala 37:30:@2013.22]
  assign _T_44 = 10'ha == addr; // @[Conditional.scala 37:30:@2018.24]
  assign _T_47 = 10'hb == addr; // @[Conditional.scala 37:30:@2023.26]
  assign _T_50 = 10'hc == addr; // @[Conditional.scala 37:30:@2028.28]
  assign _T_53 = 10'hd == addr; // @[Conditional.scala 37:30:@2033.30]
  assign _T_56 = 10'he == addr; // @[Conditional.scala 37:30:@2038.32]
  assign _T_59 = 10'hf == addr; // @[Conditional.scala 37:30:@2043.34]
  assign _T_62 = 10'h10 == addr; // @[Conditional.scala 37:30:@2048.36]
  assign _T_65 = 10'h11 == addr; // @[Conditional.scala 37:30:@2053.38]
  assign _T_68 = 10'h12 == addr; // @[Conditional.scala 37:30:@2058.40]
  assign _T_71 = 10'h13 == addr; // @[Conditional.scala 37:30:@2063.42]
  assign _T_74 = 10'h14 == addr; // @[Conditional.scala 37:30:@2068.44]
  assign _T_77 = 10'h15 == addr; // @[Conditional.scala 37:30:@2073.46]
  assign _T_80 = 10'h16 == addr; // @[Conditional.scala 37:30:@2078.48]
  assign _T_83 = 10'h17 == addr; // @[Conditional.scala 37:30:@2083.50]
  assign _T_86 = 10'h18 == addr; // @[Conditional.scala 37:30:@2088.52]
  assign _T_89 = 10'h19 == addr; // @[Conditional.scala 37:30:@2093.54]
  assign _T_92 = 10'h1a == addr; // @[Conditional.scala 37:30:@2098.56]
  assign _T_95 = 10'h1b == addr; // @[Conditional.scala 37:30:@2103.58]
  assign _T_98 = 10'h1c == addr; // @[Conditional.scala 37:30:@2108.60]
  assign _T_101 = 10'h1d == addr; // @[Conditional.scala 37:30:@2113.62]
  assign _T_104 = 10'h1e == addr; // @[Conditional.scala 37:30:@2118.64]
  assign _T_107 = 10'h1f == addr; // @[Conditional.scala 37:30:@2123.66]
  assign _T_110 = 10'h20 == addr; // @[Conditional.scala 37:30:@2128.68]
  assign _T_113 = 10'h21 == addr; // @[Conditional.scala 37:30:@2133.70]
  assign _T_116 = 10'h22 == addr; // @[Conditional.scala 37:30:@2138.72]
  assign _T_119 = 10'h23 == addr; // @[Conditional.scala 37:30:@2143.74]
  assign _T_122 = 10'h24 == addr; // @[Conditional.scala 37:30:@2148.76]
  assign _T_125 = 10'h25 == addr; // @[Conditional.scala 37:30:@2153.78]
  assign _T_128 = 10'h26 == addr; // @[Conditional.scala 37:30:@2158.80]
  assign _T_131 = 10'h27 == addr; // @[Conditional.scala 37:30:@2163.82]
  assign _T_134 = 10'h28 == addr; // @[Conditional.scala 37:30:@2168.84]
  assign _T_137 = 10'h29 == addr; // @[Conditional.scala 37:30:@2173.86]
  assign _T_140 = 10'h2a == addr; // @[Conditional.scala 37:30:@2178.88]
  assign _T_143 = 10'h2b == addr; // @[Conditional.scala 37:30:@2183.90]
  assign _T_146 = 10'h2c == addr; // @[Conditional.scala 37:30:@2188.92]
  assign _T_149 = 10'h2d == addr; // @[Conditional.scala 37:30:@2193.94]
  assign _T_152 = 10'h2e == addr; // @[Conditional.scala 37:30:@2198.96]
  assign _T_155 = 10'h2f == addr; // @[Conditional.scala 37:30:@2203.98]
  assign _T_158 = 10'h30 == addr; // @[Conditional.scala 37:30:@2208.100]
  assign _T_161 = 10'h31 == addr; // @[Conditional.scala 37:30:@2213.102]
  assign _T_164 = 10'h32 == addr; // @[Conditional.scala 37:30:@2218.104]
  assign _T_167 = 10'h33 == addr; // @[Conditional.scala 37:30:@2223.106]
  assign _T_170 = 10'h34 == addr; // @[Conditional.scala 37:30:@2228.108]
  assign _T_173 = 10'h35 == addr; // @[Conditional.scala 37:30:@2233.110]
  assign _T_176 = 10'h36 == addr; // @[Conditional.scala 37:30:@2238.112]
  assign _T_179 = 10'h37 == addr; // @[Conditional.scala 37:30:@2243.114]
  assign _T_182 = 10'h38 == addr; // @[Conditional.scala 37:30:@2248.116]
  assign _T_185 = 10'h39 == addr; // @[Conditional.scala 37:30:@2253.118]
  assign _T_188 = 10'h3a == addr; // @[Conditional.scala 37:30:@2258.120]
  assign _T_191 = 10'h3b == addr; // @[Conditional.scala 37:30:@2263.122]
  assign _T_194 = 10'h3c == addr; // @[Conditional.scala 37:30:@2268.124]
  assign _T_197 = 10'h3d == addr; // @[Conditional.scala 37:30:@2273.126]
  assign _T_200 = 10'h3e == addr; // @[Conditional.scala 37:30:@2278.128]
  assign _T_203 = 10'h3f == addr; // @[Conditional.scala 37:30:@2283.130]
  assign _T_206 = 10'h40 == addr; // @[Conditional.scala 37:30:@2288.132]
  assign _T_209 = 10'h41 == addr; // @[Conditional.scala 37:30:@2293.134]
  assign _T_212 = 10'h42 == addr; // @[Conditional.scala 37:30:@2298.136]
  assign _T_215 = 10'h43 == addr; // @[Conditional.scala 37:30:@2303.138]
  assign _T_218 = 10'h44 == addr; // @[Conditional.scala 37:30:@2308.140]
  assign _T_221 = 10'h45 == addr; // @[Conditional.scala 37:30:@2313.142]
  assign _T_224 = 10'h46 == addr; // @[Conditional.scala 37:30:@2318.144]
  assign _T_227 = 10'h47 == addr; // @[Conditional.scala 37:30:@2323.146]
  assign _T_230 = 10'h48 == addr; // @[Conditional.scala 37:30:@2328.148]
  assign _T_233 = 10'h49 == addr; // @[Conditional.scala 37:30:@2333.150]
  assign _T_236 = 10'h4a == addr; // @[Conditional.scala 37:30:@2338.152]
  assign _T_239 = 10'h4b == addr; // @[Conditional.scala 37:30:@2343.154]
  assign _T_242 = 10'h4c == addr; // @[Conditional.scala 37:30:@2348.156]
  assign _T_245 = 10'h4d == addr; // @[Conditional.scala 37:30:@2353.158]
  assign _T_248 = 10'h4e == addr; // @[Conditional.scala 37:30:@2358.160]
  assign _T_251 = 10'h4f == addr; // @[Conditional.scala 37:30:@2363.162]
  assign _T_254 = 10'h50 == addr; // @[Conditional.scala 37:30:@2368.164]
  assign _T_257 = 10'h51 == addr; // @[Conditional.scala 37:30:@2373.166]
  assign _T_260 = 10'h52 == addr; // @[Conditional.scala 37:30:@2378.168]
  assign _T_263 = 10'h53 == addr; // @[Conditional.scala 37:30:@2383.170]
  assign _T_266 = 10'h54 == addr; // @[Conditional.scala 37:30:@2388.172]
  assign _T_269 = 10'h55 == addr; // @[Conditional.scala 37:30:@2393.174]
  assign _T_272 = 10'h56 == addr; // @[Conditional.scala 37:30:@2398.176]
  assign _T_275 = 10'h57 == addr; // @[Conditional.scala 37:30:@2403.178]
  assign _T_278 = 10'h58 == addr; // @[Conditional.scala 37:30:@2408.180]
  assign _T_281 = 10'h59 == addr; // @[Conditional.scala 37:30:@2413.182]
  assign _T_284 = 10'h5a == addr; // @[Conditional.scala 37:30:@2418.184]
  assign _T_287 = 10'h5b == addr; // @[Conditional.scala 37:30:@2423.186]
  assign _T_290 = 10'h5c == addr; // @[Conditional.scala 37:30:@2428.188]
  assign _T_293 = 10'h5d == addr; // @[Conditional.scala 37:30:@2433.190]
  assign _T_296 = 10'h5e == addr; // @[Conditional.scala 37:30:@2438.192]
  assign _T_299 = 10'h5f == addr; // @[Conditional.scala 37:30:@2443.194]
  assign _T_302 = 10'h60 == addr; // @[Conditional.scala 37:30:@2448.196]
  assign _T_305 = 10'h61 == addr; // @[Conditional.scala 37:30:@2453.198]
  assign _T_308 = 10'h62 == addr; // @[Conditional.scala 37:30:@2458.200]
  assign _T_311 = 10'h63 == addr; // @[Conditional.scala 37:30:@2463.202]
  assign _T_314 = 10'h64 == addr; // @[Conditional.scala 37:30:@2468.204]
  assign _T_317 = 10'h65 == addr; // @[Conditional.scala 37:30:@2473.206]
  assign _T_320 = 10'h66 == addr; // @[Conditional.scala 37:30:@2478.208]
  assign _T_323 = 10'h67 == addr; // @[Conditional.scala 37:30:@2483.210]
  assign _T_326 = 10'h68 == addr; // @[Conditional.scala 37:30:@2488.212]
  assign _T_329 = 10'h69 == addr; // @[Conditional.scala 37:30:@2493.214]
  assign _T_332 = 10'h6a == addr; // @[Conditional.scala 37:30:@2498.216]
  assign _T_335 = 10'h6b == addr; // @[Conditional.scala 37:30:@2503.218]
  assign _T_338 = 10'h6c == addr; // @[Conditional.scala 37:30:@2508.220]
  assign _T_341 = 10'h6d == addr; // @[Conditional.scala 37:30:@2513.222]
  assign _T_344 = 10'h6e == addr; // @[Conditional.scala 37:30:@2518.224]
  assign _T_347 = 10'h6f == addr; // @[Conditional.scala 37:30:@2523.226]
  assign _T_350 = 10'h70 == addr; // @[Conditional.scala 37:30:@2528.228]
  assign _T_353 = 10'h71 == addr; // @[Conditional.scala 37:30:@2533.230]
  assign _T_356 = 10'h72 == addr; // @[Conditional.scala 37:30:@2538.232]
  assign _T_359 = 10'h73 == addr; // @[Conditional.scala 37:30:@2543.234]
  assign _T_362 = 10'h74 == addr; // @[Conditional.scala 37:30:@2548.236]
  assign _T_365 = 10'h75 == addr; // @[Conditional.scala 37:30:@2553.238]
  assign _T_368 = 10'h76 == addr; // @[Conditional.scala 37:30:@2558.240]
  assign _T_371 = 10'h77 == addr; // @[Conditional.scala 37:30:@2563.242]
  assign _T_374 = 10'h78 == addr; // @[Conditional.scala 37:30:@2568.244]
  assign _T_377 = 10'h79 == addr; // @[Conditional.scala 37:30:@2573.246]
  assign _T_380 = 10'h7a == addr; // @[Conditional.scala 37:30:@2578.248]
  assign _T_383 = 10'h7b == addr; // @[Conditional.scala 37:30:@2583.250]
  assign _T_386 = 10'h7c == addr; // @[Conditional.scala 37:30:@2588.252]
  assign _T_389 = 10'h7d == addr; // @[Conditional.scala 37:30:@2593.254]
  assign _T_392 = 10'h7e == addr; // @[Conditional.scala 37:30:@2598.256]
  assign _T_395 = 10'h7f == addr; // @[Conditional.scala 37:30:@2603.258]
  assign _T_398 = 10'h80 == addr; // @[Conditional.scala 37:30:@2608.260]
  assign _T_401 = 10'h81 == addr; // @[Conditional.scala 37:30:@2613.262]
  assign _T_404 = 10'h82 == addr; // @[Conditional.scala 37:30:@2618.264]
  assign _T_407 = 10'h83 == addr; // @[Conditional.scala 37:30:@2623.266]
  assign _T_410 = 10'h84 == addr; // @[Conditional.scala 37:30:@2628.268]
  assign _T_413 = 10'h85 == addr; // @[Conditional.scala 37:30:@2633.270]
  assign _T_416 = 10'h86 == addr; // @[Conditional.scala 37:30:@2638.272]
  assign _T_419 = 10'h87 == addr; // @[Conditional.scala 37:30:@2643.274]
  assign _T_422 = 10'h88 == addr; // @[Conditional.scala 37:30:@2648.276]
  assign _T_425 = 10'h89 == addr; // @[Conditional.scala 37:30:@2653.278]
  assign _T_428 = 10'h8a == addr; // @[Conditional.scala 37:30:@2658.280]
  assign _T_431 = 10'h8b == addr; // @[Conditional.scala 37:30:@2663.282]
  assign _T_434 = 10'h8c == addr; // @[Conditional.scala 37:30:@2668.284]
  assign _T_437 = 10'h8d == addr; // @[Conditional.scala 37:30:@2673.286]
  assign _T_440 = 10'h8e == addr; // @[Conditional.scala 37:30:@2678.288]
  assign _T_443 = 10'h8f == addr; // @[Conditional.scala 37:30:@2683.290]
  assign _T_446 = 10'h90 == addr; // @[Conditional.scala 37:30:@2688.292]
  assign _T_449 = 10'h91 == addr; // @[Conditional.scala 37:30:@2693.294]
  assign _T_452 = 10'h92 == addr; // @[Conditional.scala 37:30:@2698.296]
  assign _T_455 = 10'h93 == addr; // @[Conditional.scala 37:30:@2703.298]
  assign _T_458 = 10'h94 == addr; // @[Conditional.scala 37:30:@2708.300]
  assign _T_461 = 10'h95 == addr; // @[Conditional.scala 37:30:@2713.302]
  assign _T_464 = 10'h96 == addr; // @[Conditional.scala 37:30:@2718.304]
  assign _T_467 = 10'h97 == addr; // @[Conditional.scala 37:30:@2723.306]
  assign _T_470 = 10'h98 == addr; // @[Conditional.scala 37:30:@2728.308]
  assign _T_473 = 10'h99 == addr; // @[Conditional.scala 37:30:@2733.310]
  assign _T_476 = 10'h9a == addr; // @[Conditional.scala 37:30:@2738.312]
  assign _T_479 = 10'h9b == addr; // @[Conditional.scala 37:30:@2743.314]
  assign _T_482 = 10'h9c == addr; // @[Conditional.scala 37:30:@2748.316]
  assign _T_485 = 10'h9d == addr; // @[Conditional.scala 37:30:@2753.318]
  assign _T_488 = 10'h9e == addr; // @[Conditional.scala 37:30:@2758.320]
  assign _T_491 = 10'h9f == addr; // @[Conditional.scala 37:30:@2763.322]
  assign _T_494 = 10'ha0 == addr; // @[Conditional.scala 37:30:@2768.324]
  assign _T_497 = 10'ha1 == addr; // @[Conditional.scala 37:30:@2773.326]
  assign _T_500 = 10'ha2 == addr; // @[Conditional.scala 37:30:@2778.328]
  assign _T_503 = 10'ha3 == addr; // @[Conditional.scala 37:30:@2783.330]
  assign _T_506 = 10'ha4 == addr; // @[Conditional.scala 37:30:@2788.332]
  assign _T_509 = 10'ha5 == addr; // @[Conditional.scala 37:30:@2793.334]
  assign _T_512 = 10'ha6 == addr; // @[Conditional.scala 37:30:@2798.336]
  assign _T_515 = 10'ha7 == addr; // @[Conditional.scala 37:30:@2803.338]
  assign _T_518 = 10'ha8 == addr; // @[Conditional.scala 37:30:@2808.340]
  assign _T_521 = 10'ha9 == addr; // @[Conditional.scala 37:30:@2813.342]
  assign _T_524 = 10'haa == addr; // @[Conditional.scala 37:30:@2818.344]
  assign _T_527 = 10'hab == addr; // @[Conditional.scala 37:30:@2823.346]
  assign _T_530 = 10'hac == addr; // @[Conditional.scala 37:30:@2828.348]
  assign _T_533 = 10'had == addr; // @[Conditional.scala 37:30:@2833.350]
  assign _T_536 = 10'hae == addr; // @[Conditional.scala 37:30:@2838.352]
  assign _T_539 = 10'haf == addr; // @[Conditional.scala 37:30:@2843.354]
  assign _T_542 = 10'hb0 == addr; // @[Conditional.scala 37:30:@2848.356]
  assign _T_545 = 10'hb1 == addr; // @[Conditional.scala 37:30:@2853.358]
  assign _T_548 = 10'hb2 == addr; // @[Conditional.scala 37:30:@2858.360]
  assign _T_551 = 10'hb3 == addr; // @[Conditional.scala 37:30:@2863.362]
  assign _T_554 = 10'hb4 == addr; // @[Conditional.scala 37:30:@2868.364]
  assign _T_557 = 10'hb5 == addr; // @[Conditional.scala 37:30:@2873.366]
  assign _T_560 = 10'hb6 == addr; // @[Conditional.scala 37:30:@2878.368]
  assign _T_563 = 10'hb7 == addr; // @[Conditional.scala 37:30:@2883.370]
  assign _T_566 = 10'hb8 == addr; // @[Conditional.scala 37:30:@2888.372]
  assign _T_569 = 10'hb9 == addr; // @[Conditional.scala 37:30:@2893.374]
  assign _T_572 = 10'hba == addr; // @[Conditional.scala 37:30:@2898.376]
  assign _T_575 = 10'hbb == addr; // @[Conditional.scala 37:30:@2903.378]
  assign _T_578 = 10'hbc == addr; // @[Conditional.scala 37:30:@2908.380]
  assign _T_581 = 10'hbd == addr; // @[Conditional.scala 37:30:@2913.382]
  assign _T_584 = 10'hbe == addr; // @[Conditional.scala 37:30:@2918.384]
  assign _T_587 = 10'hbf == addr; // @[Conditional.scala 37:30:@2923.386]
  assign _T_590 = 10'hc0 == addr; // @[Conditional.scala 37:30:@2928.388]
  assign _T_593 = 10'hc1 == addr; // @[Conditional.scala 37:30:@2933.390]
  assign _T_596 = 10'hc2 == addr; // @[Conditional.scala 37:30:@2938.392]
  assign _T_599 = 10'hc3 == addr; // @[Conditional.scala 37:30:@2943.394]
  assign _T_602 = 10'hc4 == addr; // @[Conditional.scala 37:30:@2948.396]
  assign _T_605 = 10'hc5 == addr; // @[Conditional.scala 37:30:@2953.398]
  assign _T_608 = 10'hc6 == addr; // @[Conditional.scala 37:30:@2958.400]
  assign _T_611 = 10'hc7 == addr; // @[Conditional.scala 37:30:@2963.402]
  assign _T_614 = 10'hc8 == addr; // @[Conditional.scala 37:30:@2968.404]
  assign _T_617 = 10'hc9 == addr; // @[Conditional.scala 37:30:@2973.406]
  assign _T_620 = 10'hca == addr; // @[Conditional.scala 37:30:@2978.408]
  assign _T_623 = 10'hcb == addr; // @[Conditional.scala 37:30:@2983.410]
  assign _T_626 = 10'hcc == addr; // @[Conditional.scala 37:30:@2988.412]
  assign _T_629 = 10'hcd == addr; // @[Conditional.scala 37:30:@2993.414]
  assign _T_632 = 10'hce == addr; // @[Conditional.scala 37:30:@2998.416]
  assign _T_635 = 10'hcf == addr; // @[Conditional.scala 37:30:@3003.418]
  assign _T_638 = 10'hd0 == addr; // @[Conditional.scala 37:30:@3008.420]
  assign _T_641 = 10'hd1 == addr; // @[Conditional.scala 37:30:@3013.422]
  assign _T_644 = 10'hd2 == addr; // @[Conditional.scala 37:30:@3018.424]
  assign _T_647 = 10'hd3 == addr; // @[Conditional.scala 37:30:@3023.426]
  assign _T_650 = 10'hd4 == addr; // @[Conditional.scala 37:30:@3028.428]
  assign _T_653 = 10'hd5 == addr; // @[Conditional.scala 37:30:@3033.430]
  assign _T_656 = 10'hd6 == addr; // @[Conditional.scala 37:30:@3038.432]
  assign _T_659 = 10'hd7 == addr; // @[Conditional.scala 37:30:@3043.434]
  assign _T_662 = 10'hd8 == addr; // @[Conditional.scala 37:30:@3048.436]
  assign _T_665 = 10'hd9 == addr; // @[Conditional.scala 37:30:@3053.438]
  assign _GEN_0 = _T_665 ? 32'h8067 : bmem_data; // @[Conditional.scala 39:67:@3054.438]
  assign _GEN_1 = _T_662 ? 32'h3010113 : _GEN_0; // @[Conditional.scala 39:67:@3049.436]
  assign _GEN_2 = _T_659 ? 32'h2812403 : _GEN_1; // @[Conditional.scala 39:67:@3044.434]
  assign _GEN_3 = _T_656 ? 32'h2c12083 : _GEN_2; // @[Conditional.scala 39:67:@3039.432]
  assign _GEN_4 = _T_653 ? 32'h13 : _GEN_3; // @[Conditional.scala 39:67:@3034.430]
  assign _GEN_5 = _T_650 ? 32'hfc07dce3 : _GEN_4; // @[Conditional.scala 39:67:@3029.428]
  assign _GEN_6 = _T_647 ? 32'hfec42783 : _GEN_5; // @[Conditional.scala 39:67:@3024.426]
  assign _GEN_7 = _T_644 ? 32'hfef42623 : _GEN_6; // @[Conditional.scala 39:67:@3019.424]
  assign _GEN_8 = _T_641 ? 32'hfff78793 : _GEN_7; // @[Conditional.scala 39:67:@3014.422]
  assign _GEN_9 = _T_638 ? 32'hfec42783 : _GEN_8; // @[Conditional.scala 39:67:@3009.420]
  assign _GEN_10 = _T_635 ? 32'hd25ff0ef : _GEN_9; // @[Conditional.scala 39:67:@3004.418]
  assign _GEN_11 = _T_632 ? 32'h78513 : _GEN_10; // @[Conditional.scala 39:67:@2999.416]
  assign _GEN_12 = _T_629 ? 32'hff87c783 : _GEN_11; // @[Conditional.scala 39:67:@2994.414]
  assign _GEN_13 = _T_626 ? 32'hf707b3 : _GEN_12; // @[Conditional.scala 39:67:@2989.412]
  assign _GEN_14 = _T_623 ? 32'hff040713 : _GEN_13; // @[Conditional.scala 39:67:@2984.410]
  assign _GEN_15 = _T_620 ? 32'hfec42783 : _GEN_14; // @[Conditional.scala 39:67:@2979.408]
  assign _GEN_16 = _T_617 ? 32'h280006f : _GEN_15; // @[Conditional.scala 39:67:@2974.406]
  assign _GEN_17 = _T_614 ? 32'hfef42623 : _GEN_16; // @[Conditional.scala 39:67:@2969.404]
  assign _GEN_18 = _T_611 ? 32'h200793 : _GEN_17; // @[Conditional.scala 39:67:@2964.402]
  assign _GEN_19 = _T_608 ? 32'hfef42423 : _GEN_18; // @[Conditional.scala 39:67:@2959.400]
  assign _GEN_20 = _T_605 ? 32'hfdc42783 : _GEN_19; // @[Conditional.scala 39:67:@2954.398]
  assign _GEN_21 = _T_602 ? 32'hfca42e23 : _GEN_20; // @[Conditional.scala 39:67:@2949.396]
  assign _GEN_22 = _T_599 ? 32'h3010413 : _GEN_21; // @[Conditional.scala 39:67:@2944.394]
  assign _GEN_23 = _T_596 ? 32'h2812423 : _GEN_22; // @[Conditional.scala 39:67:@2939.392]
  assign _GEN_24 = _T_593 ? 32'h2112623 : _GEN_23; // @[Conditional.scala 39:67:@2934.390]
  assign _GEN_25 = _T_590 ? 32'hfd010113 : _GEN_24; // @[Conditional.scala 39:67:@2929.388]
  assign _GEN_26 = _T_587 ? 32'h8067 : _GEN_25; // @[Conditional.scala 39:67:@2924.386]
  assign _GEN_27 = _T_584 ? 32'h3010113 : _GEN_26; // @[Conditional.scala 39:67:@2919.384]
  assign _GEN_28 = _T_581 ? 32'h2812403 : _GEN_27; // @[Conditional.scala 39:67:@2914.382]
  assign _GEN_29 = _T_578 ? 32'h2c12083 : _GEN_28; // @[Conditional.scala 39:67:@2909.380]
  assign _GEN_30 = _T_575 ? 32'h78513 : _GEN_29; // @[Conditional.scala 39:67:@2904.378]
  assign _GEN_31 = _T_572 ? 32'hfe842783 : _GEN_30; // @[Conditional.scala 39:67:@2899.376]
  assign _GEN_32 = _T_569 ? 32'he782a3 : _GEN_31; // @[Conditional.scala 39:67:@2894.374]
  assign _GEN_33 = _T_566 ? 32'hff77713 : _GEN_32; // @[Conditional.scala 39:67:@2889.372]
  assign _GEN_34 = _T_563 ? 32'hffe77713 : _GEN_33; // @[Conditional.scala 39:67:@2884.370]
  assign _GEN_35 = _T_560 ? 32'h37b7 : _GEN_34; // @[Conditional.scala 39:67:@2879.368]
  assign _GEN_36 = _T_557 ? 32'hff7f713 : _GEN_35; // @[Conditional.scala 39:67:@2874.366]
  assign _GEN_37 = _T_554 ? 32'h57c783 : _GEN_36; // @[Conditional.scala 39:67:@2869.364]
  assign _GEN_38 = _T_551 ? 32'h37b7 : _GEN_37; // @[Conditional.scala 39:67:@2864.362]
  assign _GEN_39 = _T_548 ? 32'hfce7f6e3 : _GEN_38; // @[Conditional.scala 39:67:@2859.360]
  assign _GEN_40 = _T_545 ? 32'h300793 : _GEN_39; // @[Conditional.scala 39:67:@2854.358]
  assign _GEN_41 = _T_542 ? 32'hfec42703 : _GEN_40; // @[Conditional.scala 39:67:@2849.356]
  assign _GEN_42 = _T_539 ? 32'hfef42623 : _GEN_41; // @[Conditional.scala 39:67:@2844.354]
  assign _GEN_43 = _T_536 ? 32'h178793 : _GEN_42; // @[Conditional.scala 39:67:@2839.352]
  assign _GEN_44 = _T_533 ? 32'hfec42783 : _GEN_43; // @[Conditional.scala 39:67:@2834.350]
  assign _GEN_45 = _T_530 ? 32'hfee78c23 : _GEN_44; // @[Conditional.scala 39:67:@2829.348]
  assign _GEN_46 = _T_527 ? 32'hf687b3 : _GEN_45; // @[Conditional.scala 39:67:@2824.346]
  assign _GEN_47 = _T_524 ? 32'hff040693 : _GEN_46; // @[Conditional.scala 39:67:@2819.344]
  assign _GEN_48 = _T_521 ? 32'hfec42783 : _GEN_47; // @[Conditional.scala 39:67:@2814.342]
  assign _GEN_49 = _T_518 ? 32'h78713 : _GEN_48; // @[Conditional.scala 39:67:@2809.340]
  assign _GEN_50 = _T_515 ? 32'h50793 : _GEN_49; // @[Conditional.scala 39:67:@2804.338]
  assign _GEN_51 = _T_512 ? 32'hdc9ff0ef : _GEN_50; // @[Conditional.scala 39:67:@2799.336]
  assign _GEN_52 = _T_509 ? 32'h513 : _GEN_51; // @[Conditional.scala 39:67:@2794.334]
  assign _GEN_53 = _T_506 ? 32'h300006f : _GEN_52; // @[Conditional.scala 39:67:@2789.332]
  assign _GEN_54 = _T_503 ? 32'hfe042623 : _GEN_53; // @[Conditional.scala 39:67:@2784.330]
  assign _GEN_55 = _T_500 ? 32'h78000ef : _GEN_54; // @[Conditional.scala 39:67:@2779.328]
  assign _GEN_56 = _T_497 ? 32'hfdc42503 : _GEN_55; // @[Conditional.scala 39:67:@2774.326]
  assign _GEN_57 = _T_494 ? 32'hde1ff0ef : _GEN_56; // @[Conditional.scala 39:67:@2769.324]
  assign _GEN_58 = _T_491 ? 32'h300513 : _GEN_57; // @[Conditional.scala 39:67:@2764.322]
  assign _GEN_59 = _T_488 ? 32'he782a3 : _GEN_58; // @[Conditional.scala 39:67:@2759.320]
  assign _GEN_60 = _T_485 ? 32'hff77713 : _GEN_59; // @[Conditional.scala 39:67:@2754.318]
  assign _GEN_61 = _T_482 ? 32'h176713 : _GEN_60; // @[Conditional.scala 39:67:@2749.316]
  assign _GEN_62 = _T_479 ? 32'h37b7 : _GEN_61; // @[Conditional.scala 39:67:@2744.314]
  assign _GEN_63 = _T_476 ? 32'hff7f713 : _GEN_62; // @[Conditional.scala 39:67:@2739.312]
  assign _GEN_64 = _T_473 ? 32'h57c783 : _GEN_63; // @[Conditional.scala 39:67:@2734.310]
  assign _GEN_65 = _T_470 ? 32'h37b7 : _GEN_64; // @[Conditional.scala 39:67:@2729.308]
  assign _GEN_66 = _T_467 ? 32'hfca42e23 : _GEN_65; // @[Conditional.scala 39:67:@2724.306]
  assign _GEN_67 = _T_464 ? 32'h3010413 : _GEN_66; // @[Conditional.scala 39:67:@2719.304]
  assign _GEN_68 = _T_461 ? 32'h2812423 : _GEN_67; // @[Conditional.scala 39:67:@2714.302]
  assign _GEN_69 = _T_458 ? 32'h2112623 : _GEN_68; // @[Conditional.scala 39:67:@2709.300]
  assign _GEN_70 = _T_455 ? 32'hfd010113 : _GEN_69; // @[Conditional.scala 39:67:@2704.298]
  assign _GEN_71 = _T_452 ? 32'h8067 : _GEN_70; // @[Conditional.scala 39:67:@2699.296]
  assign _GEN_72 = _T_449 ? 32'h3010113 : _GEN_71; // @[Conditional.scala 39:67:@2694.294]
  assign _GEN_73 = _T_446 ? 32'h2812403 : _GEN_72; // @[Conditional.scala 39:67:@2689.292]
  assign _GEN_74 = _T_443 ? 32'h2c12083 : _GEN_73; // @[Conditional.scala 39:67:@2684.290]
  assign _GEN_75 = _T_440 ? 32'h13 : _GEN_74; // @[Conditional.scala 39:67:@2679.288]
  assign _GEN_76 = _T_437 ? 32'hfaf76ee3 : _GEN_75; // @[Conditional.scala 39:67:@2674.286]
  assign _GEN_77 = _T_434 ? 32'hfe842703 : _GEN_76; // @[Conditional.scala 39:67:@2669.284]
  assign _GEN_78 = _T_431 ? 32'h27d793 : _GEN_77; // @[Conditional.scala 39:67:@2664.282]
  assign _GEN_79 = _T_428 ? 32'hfe042783 : _GEN_78; // @[Conditional.scala 39:67:@2659.280]
  assign _GEN_80 = _T_425 ? 32'hfef42623 : _GEN_79; // @[Conditional.scala 39:67:@2654.278]
  assign _GEN_81 = _T_422 ? 32'h478793 : _GEN_80; // @[Conditional.scala 39:67:@2649.276]
  assign _GEN_82 = _T_419 ? 32'hfec42783 : _GEN_81; // @[Conditional.scala 39:67:@2644.274]
  assign _GEN_83 = _T_416 ? 32'he7a023 : _GEN_82; // @[Conditional.scala 39:67:@2639.272]
  assign _GEN_84 = _T_413 ? 32'hfd842703 : _GEN_83; // @[Conditional.scala 39:67:@2634.270]
  assign _GEN_85 = _T_410 ? 32'hf707b3 : _GEN_84; // @[Conditional.scala 39:67:@2629.268]
  assign _GEN_86 = _T_407 ? 32'hfdc42703 : _GEN_85; // @[Conditional.scala 39:67:@2624.266]
  assign _GEN_87 = _T_404 ? 32'h279793 : _GEN_86; // @[Conditional.scala 39:67:@2619.264]
  assign _GEN_88 = _T_401 ? 32'hfee42423 : _GEN_87; // @[Conditional.scala 39:67:@2614.262]
  assign _GEN_89 = _T_398 ? 32'h178713 : _GEN_88; // @[Conditional.scala 39:67:@2609.260]
  assign _GEN_90 = _T_395 ? 32'hfe842783 : _GEN_89; // @[Conditional.scala 39:67:@2604.258]
  assign _GEN_91 = _T_392 ? 32'hfca42c23 : _GEN_90; // @[Conditional.scala 39:67:@2599.256]
  assign _GEN_92 = _T_389 ? 32'h58000ef : _GEN_91; // @[Conditional.scala 39:67:@2594.254]
  assign _GEN_93 = _T_386 ? 32'hfec42503 : _GEN_92; // @[Conditional.scala 39:67:@2589.252]
  assign _GEN_94 = _T_383 ? 32'h3c0006f : _GEN_93; // @[Conditional.scala 39:67:@2584.250]
  assign _GEN_95 = _T_380 ? 32'hfef42623 : _GEN_94; // @[Conditional.scala 39:67:@2579.248]
  assign _GEN_96 = _T_377 ? 32'hc78793 : _GEN_95; // @[Conditional.scala 39:67:@2574.246]
  assign _GEN_97 = _T_374 ? 32'hfec42783 : _GEN_96; // @[Conditional.scala 39:67:@2569.244]
  assign _GEN_98 = _T_371 ? 32'hfe042423 : _GEN_97; // @[Conditional.scala 39:67:@2564.242]
  assign _GEN_99 = _T_368 ? 32'hfc042c23 : _GEN_98; // @[Conditional.scala 39:67:@2559.240]
  assign _GEN_100 = _T_365 ? 32'hfc042e23 : _GEN_99; // @[Conditional.scala 39:67:@2554.238]
  assign _GEN_101 = _T_362 ? 32'hfea42023 : _GEN_100; // @[Conditional.scala 39:67:@2549.236]
  assign _GEN_102 = _T_359 ? 32'h80000ef : _GEN_101; // @[Conditional.scala 39:67:@2544.234]
  assign _GEN_103 = _T_356 ? 32'h78513 : _GEN_102; // @[Conditional.scala 39:67:@2539.232]
  assign _GEN_104 = _T_353 ? 32'h478793 : _GEN_103; // @[Conditional.scala 39:67:@2534.230]
  assign _GEN_105 = _T_350 ? 32'hfec42783 : _GEN_104; // @[Conditional.scala 39:67:@2529.228]
  assign _GEN_106 = _T_347 ? 32'hfea42223 : _GEN_105; // @[Conditional.scala 39:67:@2524.226]
  assign _GEN_107 = _T_344 ? 32'h94000ef : _GEN_106; // @[Conditional.scala 39:67:@2519.224]
  assign _GEN_108 = _T_341 ? 32'hfec42503 : _GEN_107; // @[Conditional.scala 39:67:@2514.222]
  assign _GEN_109 = _T_338 ? 32'hfe042623 : _GEN_108; // @[Conditional.scala 39:67:@2509.220]
  assign _GEN_110 = _T_335 ? 32'h3010413 : _GEN_109; // @[Conditional.scala 39:67:@2504.218]
  assign _GEN_111 = _T_332 ? 32'h2812423 : _GEN_110; // @[Conditional.scala 39:67:@2499.216]
  assign _GEN_112 = _T_329 ? 32'h2112623 : _GEN_111; // @[Conditional.scala 39:67:@2494.214]
  assign _GEN_113 = _T_326 ? 32'hfd010113 : _GEN_112; // @[Conditional.scala 39:67:@2489.212]
  assign _GEN_114 = _T_323 ? 32'h8067 : _GEN_113; // @[Conditional.scala 39:67:@2484.210]
  assign _GEN_115 = _T_320 ? 32'h1010113 : _GEN_114; // @[Conditional.scala 39:67:@2479.208]
  assign _GEN_116 = _T_317 ? 32'hc12403 : _GEN_115; // @[Conditional.scala 39:67:@2474.206]
  assign _GEN_117 = _T_314 ? 32'h13 : _GEN_116; // @[Conditional.scala 39:67:@2469.204]
  assign _GEN_118 = _T_311 ? 32'h28067 : _GEN_117; // @[Conditional.scala 39:67:@2464.202]
  assign _GEN_119 = _T_308 ? 32'h2b7 : _GEN_118; // @[Conditional.scala 39:67:@2459.200]
  assign _GEN_120 = _T_305 ? 32'h1010413 : _GEN_119; // @[Conditional.scala 39:67:@2454.198]
  assign _GEN_121 = _T_302 ? 32'h812623 : _GEN_120; // @[Conditional.scala 39:67:@2449.196]
  assign _GEN_122 = _T_299 ? 32'hff010113 : _GEN_121; // @[Conditional.scala 39:67:@2444.194]
  assign _GEN_123 = _T_296 ? 32'h8067 : _GEN_122; // @[Conditional.scala 39:67:@2439.192]
  assign _GEN_124 = _T_293 ? 32'h1010113 : _GEN_123; // @[Conditional.scala 39:67:@2434.190]
  assign _GEN_125 = _T_290 ? 32'h812403 : _GEN_124; // @[Conditional.scala 39:67:@2429.188]
  assign _GEN_126 = _T_287 ? 32'hc12083 : _GEN_125; // @[Conditional.scala 39:67:@2424.186]
  assign _GEN_127 = _T_284 ? 32'h78513 : _GEN_126; // @[Conditional.scala 39:67:@2419.184]
  assign _GEN_128 = _T_281 ? 32'h793 : _GEN_127; // @[Conditional.scala 39:67:@2414.182]
  assign _GEN_129 = _T_278 ? 32'h1c000ef : _GEN_128; // @[Conditional.scala 39:67:@2409.180]
  assign _GEN_130 = _T_275 ? 32'hf89ff0ef : _GEN_129; // @[Conditional.scala 39:67:@2404.178]
  assign _GEN_131 = _T_272 ? 32'h6b00513 : _GEN_130; // @[Conditional.scala 39:67:@2399.176]
  assign _GEN_132 = _T_269 ? 32'hf91ff0ef : _GEN_131; // @[Conditional.scala 39:67:@2394.174]
  assign _GEN_133 = _T_266 ? 32'h4f00513 : _GEN_132; // @[Conditional.scala 39:67:@2389.172]
  assign _GEN_134 = _T_263 ? 32'h54000ef : _GEN_133; // @[Conditional.scala 39:67:@2384.170]
  assign _GEN_135 = _T_260 ? 32'hed5ff0ef : _GEN_134; // @[Conditional.scala 39:67:@2379.168]
  assign _GEN_136 = _T_257 ? 32'h800513 : _GEN_135; // @[Conditional.scala 39:67:@2374.166]
  assign _GEN_137 = _T_254 ? 32'hf75ff0ef : _GEN_136; // @[Conditional.scala 39:67:@2369.164]
  assign _GEN_138 = _T_251 ? 32'h1000513 : _GEN_137; // @[Conditional.scala 39:67:@2364.162]
  assign _GEN_139 = _T_248 ? 32'h1010413 : _GEN_138; // @[Conditional.scala 39:67:@2359.160]
  assign _GEN_140 = _T_245 ? 32'h812423 : _GEN_139; // @[Conditional.scala 39:67:@2354.158]
  assign _GEN_141 = _T_242 ? 32'h112623 : _GEN_140; // @[Conditional.scala 39:67:@2349.156]
  assign _GEN_142 = _T_239 ? 32'hff010113 : _GEN_141; // @[Conditional.scala 39:67:@2344.154]
  assign _GEN_143 = _T_236 ? 32'h8067 : _GEN_142; // @[Conditional.scala 39:67:@2339.152]
  assign _GEN_144 = _T_233 ? 32'h2010113 : _GEN_143; // @[Conditional.scala 39:67:@2334.150]
  assign _GEN_145 = _T_230 ? 32'h1c12403 : _GEN_144; // @[Conditional.scala 39:67:@2329.148]
  assign _GEN_146 = _T_227 ? 32'h13 : _GEN_145; // @[Conditional.scala 39:67:@2324.146]
  assign _GEN_147 = _T_224 ? 32'he780a3 : _GEN_146; // @[Conditional.scala 39:67:@2319.144]
  assign _GEN_148 = _T_221 ? 32'hfef44703 : _GEN_147; // @[Conditional.scala 39:67:@2314.142]
  assign _GEN_149 = _T_218 ? 32'h27b7 : _GEN_148; // @[Conditional.scala 39:67:@2309.140]
  assign _GEN_150 = _T_215 ? 32'hfe0788e3 : _GEN_149; // @[Conditional.scala 39:67:@2304.138]
  assign _GEN_151 = _T_212 ? 32'h27f793 : _GEN_150; // @[Conditional.scala 39:67:@2299.136]
  assign _GEN_152 = _T_209 ? 32'hff7f793 : _GEN_151; // @[Conditional.scala 39:67:@2294.134]
  assign _GEN_153 = _T_206 ? 32'h47c783 : _GEN_152; // @[Conditional.scala 39:67:@2289.132]
  assign _GEN_154 = _T_203 ? 32'h27b7 : _GEN_153; // @[Conditional.scala 39:67:@2284.130]
  assign _GEN_155 = _T_200 ? 32'h13 : _GEN_154; // @[Conditional.scala 39:67:@2279.128]
  assign _GEN_156 = _T_197 ? 32'hfef407a3 : _GEN_155; // @[Conditional.scala 39:67:@2274.126]
  assign _GEN_157 = _T_194 ? 32'h50793 : _GEN_156; // @[Conditional.scala 39:67:@2269.124]
  assign _GEN_158 = _T_191 ? 32'h2010413 : _GEN_157; // @[Conditional.scala 39:67:@2264.122]
  assign _GEN_159 = _T_188 ? 32'h812e23 : _GEN_158; // @[Conditional.scala 39:67:@2259.120]
  assign _GEN_160 = _T_185 ? 32'hfe010113 : _GEN_159; // @[Conditional.scala 39:67:@2254.118]
  assign _GEN_161 = _T_182 ? 32'h8067 : _GEN_160; // @[Conditional.scala 39:67:@2249.116]
  assign _GEN_162 = _T_179 ? 32'h2010113 : _GEN_161; // @[Conditional.scala 39:67:@2244.114]
  assign _GEN_163 = _T_176 ? 32'h1c12403 : _GEN_162; // @[Conditional.scala 39:67:@2239.112]
  assign _GEN_164 = _T_173 ? 32'h13 : _GEN_163; // @[Conditional.scala 39:67:@2234.110]
  assign _GEN_165 = _T_170 ? 32'he78123 : _GEN_164; // @[Conditional.scala 39:67:@2229.108]
  assign _GEN_166 = _T_167 ? 32'hfef44703 : _GEN_165; // @[Conditional.scala 39:67:@2224.106]
  assign _GEN_167 = _T_164 ? 32'h27b7 : _GEN_166; // @[Conditional.scala 39:67:@2219.104]
  assign _GEN_168 = _T_161 ? 32'hfef407a3 : _GEN_167; // @[Conditional.scala 39:67:@2214.102]
  assign _GEN_169 = _T_158 ? 32'h50793 : _GEN_168; // @[Conditional.scala 39:67:@2209.100]
  assign _GEN_170 = _T_155 ? 32'h2010413 : _GEN_169; // @[Conditional.scala 39:67:@2204.98]
  assign _GEN_171 = _T_152 ? 32'h812e23 : _GEN_170; // @[Conditional.scala 39:67:@2199.96]
  assign _GEN_172 = _T_149 ? 32'hfe010113 : _GEN_171; // @[Conditional.scala 39:67:@2194.94]
  assign _GEN_173 = _T_146 ? 32'h8067 : _GEN_172; // @[Conditional.scala 39:67:@2189.92]
  assign _GEN_174 = _T_143 ? 32'h2010113 : _GEN_173; // @[Conditional.scala 39:67:@2184.90]
  assign _GEN_175 = _T_140 ? 32'h1c12403 : _GEN_174; // @[Conditional.scala 39:67:@2179.88]
  assign _GEN_176 = _T_137 ? 32'h78513 : _GEN_175; // @[Conditional.scala 39:67:@2174.86]
  assign _GEN_177 = _T_134 ? 32'hff7f793 : _GEN_176; // @[Conditional.scala 39:67:@2169.84]
  assign _GEN_178 = _T_131 ? 32'h7c783 : _GEN_177; // @[Conditional.scala 39:67:@2164.82]
  assign _GEN_179 = _T_128 ? 32'h37b7 : _GEN_178; // @[Conditional.scala 39:67:@2159.80]
  assign _GEN_180 = _T_125 ? 32'hfe0788e3 : _GEN_179; // @[Conditional.scala 39:67:@2154.78]
  assign _GEN_181 = _T_122 ? 32'h107f793 : _GEN_180; // @[Conditional.scala 39:67:@2149.76]
  assign _GEN_182 = _T_119 ? 32'hff7f793 : _GEN_181; // @[Conditional.scala 39:67:@2144.74]
  assign _GEN_183 = _T_116 ? 32'h47c783 : _GEN_182; // @[Conditional.scala 39:67:@2139.72]
  assign _GEN_184 = _T_113 ? 32'h37b7 : _GEN_183; // @[Conditional.scala 39:67:@2134.70]
  assign _GEN_185 = _T_110 ? 32'h13 : _GEN_184; // @[Conditional.scala 39:67:@2129.68]
  assign _GEN_186 = _T_107 ? 32'he780a3 : _GEN_185; // @[Conditional.scala 39:67:@2124.66]
  assign _GEN_187 = _T_104 ? 32'hfef44703 : _GEN_186; // @[Conditional.scala 39:67:@2119.64]
  assign _GEN_188 = _T_101 ? 32'h37b7 : _GEN_187; // @[Conditional.scala 39:67:@2114.62]
  assign _GEN_189 = _T_98 ? 32'hfef407a3 : _GEN_188; // @[Conditional.scala 39:67:@2109.60]
  assign _GEN_190 = _T_95 ? 32'h50793 : _GEN_189; // @[Conditional.scala 39:67:@2104.58]
  assign _GEN_191 = _T_92 ? 32'h2010413 : _GEN_190; // @[Conditional.scala 39:67:@2099.56]
  assign _GEN_192 = _T_89 ? 32'h812e23 : _GEN_191; // @[Conditional.scala 39:67:@2094.54]
  assign _GEN_193 = _T_86 ? 32'hfe010113 : _GEN_192; // @[Conditional.scala 39:67:@2089.52]
  assign _GEN_194 = _T_83 ? 32'h8067 : _GEN_193; // @[Conditional.scala 39:67:@2084.50]
  assign _GEN_195 = _T_80 ? 32'h2010113 : _GEN_194; // @[Conditional.scala 39:67:@2079.48]
  assign _GEN_196 = _T_77 ? 32'h1c12403 : _GEN_195; // @[Conditional.scala 39:67:@2074.46]
  assign _GEN_197 = _T_74 ? 32'h13 : _GEN_196; // @[Conditional.scala 39:67:@2069.44]
  assign _GEN_198 = _T_71 ? 32'he78123 : _GEN_197; // @[Conditional.scala 39:67:@2064.42]
  assign _GEN_199 = _T_68 ? 32'hff77713 : _GEN_198; // @[Conditional.scala 39:67:@2059.40]
  assign _GEN_200 = _T_65 ? 32'he6e733 : _GEN_199; // @[Conditional.scala 39:67:@2054.38]
  assign _GEN_201 = _T_62 ? 32'hfef44703 : _GEN_200; // @[Conditional.scala 39:67:@2049.36]
  assign _GEN_202 = _T_59 ? 32'h37b7 : _GEN_201; // @[Conditional.scala 39:67:@2044.34]
  assign _GEN_203 = _T_56 ? 32'hff7f693 : _GEN_202; // @[Conditional.scala 39:67:@2039.32]
  assign _GEN_204 = _T_53 ? 32'h27c783 : _GEN_203; // @[Conditional.scala 39:67:@2034.30]
  assign _GEN_205 = _T_50 ? 32'h37b7 : _GEN_204; // @[Conditional.scala 39:67:@2029.28]
  assign _GEN_206 = _T_47 ? 32'hfef407a3 : _GEN_205; // @[Conditional.scala 39:67:@2024.26]
  assign _GEN_207 = _T_44 ? 32'h50793 : _GEN_206; // @[Conditional.scala 39:67:@2019.24]
  assign _GEN_208 = _T_41 ? 32'h2010413 : _GEN_207; // @[Conditional.scala 39:67:@2014.22]
  assign _GEN_209 = _T_38 ? 32'h812e23 : _GEN_208; // @[Conditional.scala 39:67:@2009.20]
  assign _GEN_210 = _T_35 ? 32'hfe010113 : _GEN_209; // @[Conditional.scala 39:67:@2004.18]
  assign _GEN_211 = _T_32 ? 32'h114000ef : _GEN_210; // @[Conditional.scala 39:67:@1999.16]
  assign _GEN_212 = _T_29 ? 32'h593 : _GEN_211; // @[Conditional.scala 39:67:@1994.14]
  assign _GEN_213 = _T_26 ? 32'h513 : _GEN_212; // @[Conditional.scala 39:67:@1989.12]
  assign _GEN_214 = _T_23 ? 32'hf810113 : _GEN_213; // @[Conditional.scala 39:67:@1984.10]
  assign _GEN_215 = _T_20 ? 32'hffffa117 : _GEN_214; // @[Conditional.scala 39:67:@1979.8]
  assign _GEN_216 = _T_17 ? 32'h40006f : _GEN_215; // @[Conditional.scala 39:67:@1974.6]
  assign _GEN_217 = _T_14 ? 32'h13 : _GEN_216; // @[Conditional.scala 40:58:@1969.4]
  assign io_bmem_rdata = bmem_data; // @[bmemory.scala 248:17:@3057.4]
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
module IMem_Interface( // @[:@3059.2]
  input         clock, // @[:@3060.4]
  input         reset, // @[:@3061.4]
  input  [31:0] io_ibus_addr, // @[:@3062.4]
  output [31:0] io_ibus_inst, // @[:@3062.4]
  output        io_ibus_valid, // @[:@3062.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3062.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3062.4]
  input         io_wbs_m2s_we, // @[:@3062.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@3062.4]
  input         io_wbs_m2s_stb, // @[:@3062.4]
  output        io_wbs_ack_o, // @[:@3062.4]
  output [31:0] io_wbs_data_o, // @[:@3062.4]
  output [8:0]  io_imem_io_addr, // @[:@3062.4]
  input  [31:0] io_imem_io_rdata, // @[:@3062.4]
  output [31:0] io_imem_io_wdata, // @[:@3062.4]
  output        io_imem_io_wr_en, // @[:@3062.4]
  output        io_imem_io_cs, // @[:@3062.4]
  output [3:0]  io_imem_io_st_type // @[:@3062.4]
);
  wire  bmem_clock; // @[imem_interface.scala 52:20:@3064.4]
  wire  bmem_reset; // @[imem_interface.scala 52:20:@3064.4]
  wire [31:0] bmem_io_bmem_addr; // @[imem_interface.scala 52:20:@3064.4]
  wire [31:0] bmem_io_bmem_rdata; // @[imem_interface.scala 52:20:@3064.4]
  wire [8:0] ibus_imem_addr; // @[imem_interface.scala 59:41:@3067.4]
  wire [9:0] ibus_bmem_addr; // @[imem_interface.scala 60:41:@3068.4]
  wire [8:0] wbs_imem_addr; // @[imem_interface.scala 61:44:@3069.4]
  reg  ack; // @[imem_interface.scala 66:31:@3070.4]
  reg [31:0] _RAND_0;
  reg [3:0] wb_select; // @[imem_interface.scala 67:27:@3071.4]
  reg [31:0] _RAND_1;
  wire  _T_57; // @[imem_interface.scala 69:24:@3072.4]
  wire  wb_rd_en; // @[imem_interface.scala 69:39:@3073.4]
  wire  wb_wr_en; // @[imem_interface.scala 70:38:@3074.4]
  reg  bmem_ibus_sel; // @[imem_interface.scala 75:36:@3075.4]
  reg [31:0] _RAND_2;
  wire [3:0] _T_60; // @[imem_interface.scala 76:43:@3076.4]
  wire  _T_62; // @[imem_interface.scala 76:75:@3077.4]
  wire [3:0] _T_63; // @[imem_interface.scala 77:46:@3079.4]
  wire  _T_65; // @[imem_interface.scala 77:84:@3080.4]
  wire  imem_wbs_addr_match; // @[imem_interface.scala 77:29:@3081.4]
  wire  imem_wbs_write; // @[imem_interface.scala 78:50:@3082.4]
  wire  _T_69; // @[imem_interface.scala 84:33:@3085.4]
  wire  imem_wbs_sel; // @[imem_interface.scala 84:46:@3086.4]
  reg  imem_ibus_valid; // @[imem_interface.scala 85:32:@3088.4]
  reg [31:0] _RAND_3;
  wire  _T_74; // @[imem_interface.scala 86:22:@3089.4]
  wire  _T_82; // @[imem_interface.scala 104:41:@3101.4]
  wire [31:0] rd_imem_inst; // @[imem_interface.scala 107:23:@3104.4]
  wire [31:0] rd_imem_const; // @[imem_interface.scala 107:23:@3104.4]
  wire  _GEN_2; // @[imem_interface.scala 113:20:@3110.4]
  wire  _T_86; // @[imem_interface.scala 121:18:@3116.4]
  wire [7:0] _T_87; // @[imem_interface.scala 122:33:@3118.6]
  wire  _T_88; // @[imem_interface.scala 123:24:@3122.6]
  wire [7:0] _T_89; // @[imem_interface.scala 124:33:@3124.8]
  wire  _T_90; // @[imem_interface.scala 125:24:@3128.8]
  wire [7:0] _T_91; // @[imem_interface.scala 126:33:@3130.10]
  wire  _T_92; // @[imem_interface.scala 127:24:@3134.10]
  wire [7:0] _T_93; // @[imem_interface.scala 128:33:@3136.12]
  wire  _T_94; // @[imem_interface.scala 129:24:@3140.12]
  wire [15:0] _T_95; // @[imem_interface.scala 130:33:@3142.14]
  wire  _T_96; // @[imem_interface.scala 131:24:@3146.14]
  wire [15:0] _T_97; // @[imem_interface.scala 132:33:@3148.16]
  wire [31:0] _GEN_3; // @[imem_interface.scala 131:54:@3147.14]
  wire [31:0] _GEN_4; // @[imem_interface.scala 129:52:@3141.12]
  wire [31:0] _GEN_5; // @[imem_interface.scala 127:52:@3135.10]
  wire [31:0] _GEN_6; // @[imem_interface.scala 125:52:@3129.8]
  wire [31:0] _GEN_7; // @[imem_interface.scala 123:52:@3123.6]
  BMem bmem ( // @[imem_interface.scala 52:20:@3064.4]
    .clock(bmem_clock),
    .reset(bmem_reset),
    .io_bmem_addr(bmem_io_bmem_addr),
    .io_bmem_rdata(bmem_io_bmem_rdata)
  );
  assign ibus_imem_addr = io_ibus_addr[10:2]; // @[imem_interface.scala 59:41:@3067.4]
  assign ibus_bmem_addr = io_ibus_addr[11:2]; // @[imem_interface.scala 60:41:@3068.4]
  assign wbs_imem_addr = io_wbs_m2s_addr[10:2]; // @[imem_interface.scala 61:44:@3069.4]
  assign _T_57 = io_wbs_m2s_we == 1'h0; // @[imem_interface.scala 69:24:@3072.4]
  assign wb_rd_en = _T_57 & io_wbs_m2s_stb; // @[imem_interface.scala 69:39:@3073.4]
  assign wb_wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[imem_interface.scala 70:38:@3074.4]
  assign _T_60 = io_ibus_addr[15:12]; // @[imem_interface.scala 76:43:@3076.4]
  assign _T_62 = _T_60 == 4'h7; // @[imem_interface.scala 76:75:@3077.4]
  assign _T_63 = io_wbs_m2s_addr[15:12]; // @[imem_interface.scala 77:46:@3079.4]
  assign _T_65 = _T_63 != 4'h0; // @[imem_interface.scala 77:84:@3080.4]
  assign imem_wbs_addr_match = _T_65 == 1'h0; // @[imem_interface.scala 77:29:@3081.4]
  assign imem_wbs_write = imem_wbs_addr_match & wb_wr_en; // @[imem_interface.scala 78:50:@3082.4]
  assign _T_69 = wb_rd_en | wb_wr_en; // @[imem_interface.scala 84:33:@3085.4]
  assign imem_wbs_sel = _T_69 & imem_wbs_addr_match; // @[imem_interface.scala 84:46:@3086.4]
  assign _T_74 = imem_wbs_sel == 1'h0; // @[imem_interface.scala 86:22:@3089.4]
  assign _T_82 = bmem_ibus_sel == 1'h0; // @[imem_interface.scala 104:41:@3101.4]
  assign rd_imem_inst = imem_ibus_valid ? io_imem_io_rdata : 32'h0; // @[imem_interface.scala 107:23:@3104.4]
  assign rd_imem_const = imem_ibus_valid ? 32'h0 : io_imem_io_rdata; // @[imem_interface.scala 107:23:@3104.4]
  assign _GEN_2 = imem_wbs_sel ? io_wbs_m2s_stb : ack; // @[imem_interface.scala 113:20:@3110.4]
  assign _T_86 = wb_select == 4'h1; // @[imem_interface.scala 121:18:@3116.4]
  assign _T_87 = rd_imem_const[7:0]; // @[imem_interface.scala 122:33:@3118.6]
  assign _T_88 = wb_select == 4'h2; // @[imem_interface.scala 123:24:@3122.6]
  assign _T_89 = rd_imem_const[15:8]; // @[imem_interface.scala 124:33:@3124.8]
  assign _T_90 = wb_select == 4'h4; // @[imem_interface.scala 125:24:@3128.8]
  assign _T_91 = rd_imem_const[23:16]; // @[imem_interface.scala 126:33:@3130.10]
  assign _T_92 = wb_select == 4'h8; // @[imem_interface.scala 127:24:@3134.10]
  assign _T_93 = rd_imem_const[31:24]; // @[imem_interface.scala 128:33:@3136.12]
  assign _T_94 = wb_select == 4'h3; // @[imem_interface.scala 129:24:@3140.12]
  assign _T_95 = rd_imem_const[15:0]; // @[imem_interface.scala 130:33:@3142.14]
  assign _T_96 = wb_select == 4'hc; // @[imem_interface.scala 131:24:@3146.14]
  assign _T_97 = rd_imem_const[31:16]; // @[imem_interface.scala 132:33:@3148.16]
  assign _GEN_3 = _T_96 ? {{16'd0}, _T_97} : rd_imem_const; // @[imem_interface.scala 131:54:@3147.14]
  assign _GEN_4 = _T_94 ? {{16'd0}, _T_95} : _GEN_3; // @[imem_interface.scala 129:52:@3141.12]
  assign _GEN_5 = _T_92 ? {{24'd0}, _T_93} : _GEN_4; // @[imem_interface.scala 127:52:@3135.10]
  assign _GEN_6 = _T_90 ? {{24'd0}, _T_91} : _GEN_5; // @[imem_interface.scala 125:52:@3129.8]
  assign _GEN_7 = _T_88 ? {{24'd0}, _T_89} : _GEN_6; // @[imem_interface.scala 123:52:@3123.6]
  assign io_ibus_inst = bmem_ibus_sel ? bmem_io_bmem_rdata : rd_imem_inst; // @[imem_interface.scala 150:19:@3159.4]
  assign io_ibus_valid = bmem_ibus_sel ? 1'h1 : imem_ibus_valid; // @[imem_interface.scala 151:19:@3161.4]
  assign io_wbs_ack_o = ack; // @[imem_interface.scala 138:18:@3155.4]
  assign io_wbs_data_o = _T_86 ? {{24'd0}, _T_87} : _GEN_7; // @[imem_interface.scala 139:18:@3156.4]
  assign io_imem_io_addr = imem_wbs_sel ? wbs_imem_addr : ibus_imem_addr; // @[imem_interface.scala 95:19:@3096.4]
  assign io_imem_io_wdata = io_wbs_m2s_data; // @[imem_interface.scala 101:22:@3097.4]
  assign io_imem_io_wr_en = imem_wbs_write == 1'h0; // @[imem_interface.scala 102:22:@3099.4]
  assign io_imem_io_cs = imem_wbs_sel | _T_82; // @[imem_interface.scala 104:22:@3103.4]
  assign io_imem_io_st_type = io_wbs_m2s_sel; // @[imem_interface.scala 103:22:@3100.4]
  assign bmem_clock = clock; // @[:@3065.4]
  assign bmem_reset = reset; // @[:@3066.4]
  assign bmem_io_bmem_addr = {{22'd0}, ibus_bmem_addr}; // @[imem_interface.scala 143:21:@3157.4]
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
module WBM_DBus( // @[:@3163.2]
  input  [31:0] io_dbus_addr, // @[:@3166.4]
  input  [31:0] io_dbus_wdata, // @[:@3166.4]
  output [31:0] io_dbus_rdata, // @[:@3166.4]
  input         io_dbus_rd_en, // @[:@3166.4]
  input         io_dbus_wr_en, // @[:@3166.4]
  input  [1:0]  io_dbus_st_type, // @[:@3166.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3166.4]
  output        io_dbus_valid, // @[:@3166.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3166.4]
  output [31:0] io_wbm_m2s_data, // @[:@3166.4]
  output        io_wbm_m2s_we, // @[:@3166.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3166.4]
  output        io_wbm_m2s_stb, // @[:@3166.4]
  input         io_wbm_ack_i, // @[:@3166.4]
  input  [31:0] io_wbm_data_i // @[:@3166.4]
);
  wire  _T_39; // @[wbm_dbus.scala 35:19:@3170.4]
  wire  _T_40; // @[wbm_dbus.scala 38:26:@3175.6]
  wire  _T_41; // @[wbm_dbus.scala 41:26:@3180.8]
  wire [3:0] _GEN_0; // @[wbm_dbus.scala 41:46:@3181.8]
  wire [3:0] _GEN_1; // @[wbm_dbus.scala 38:47:@3176.6]
  wire [3:0] st_sel_vec; // @[wbm_dbus.scala 35:40:@3171.4]
  wire [1:0] ld_align; // @[wbm_dbus.scala 46:30:@3184.4]
  wire  _T_44; // @[wbm_dbus.scala 51:16:@3187.4]
  wire  _T_45; // @[wbm_dbus.scala 54:23:@3192.6]
  wire  _T_46; // @[wbm_dbus.scala 54:54:@3193.6]
  wire  _T_47; // @[wbm_dbus.scala 54:43:@3194.6]
  wire  _T_48; // @[wbm_dbus.scala 55:34:@3196.8]
  wire [3:0] _T_49; // @[wbm_dbus.scala 55:25:@3197.8]
  wire  _T_50; // @[wbm_dbus.scala 57:23:@3201.8]
  wire  _T_51; // @[wbm_dbus.scala 57:54:@3202.8]
  wire  _T_52; // @[wbm_dbus.scala 57:43:@3203.8]
  wire  _T_54; // @[wbm_dbus.scala 58:21:@3205.10]
  wire  _T_56; // @[wbm_dbus.scala 60:27:@3210.12]
  wire  _T_58; // @[wbm_dbus.scala 62:27:@3215.14]
  wire [3:0] _GEN_3; // @[wbm_dbus.scala 62:37:@3216.14]
  wire [3:0] _GEN_4; // @[wbm_dbus.scala 60:37:@3211.12]
  wire [3:0] _GEN_5; // @[wbm_dbus.scala 58:32:@3206.10]
  wire [3:0] _GEN_6; // @[wbm_dbus.scala 57:75:@3204.8]
  wire [3:0] _GEN_7; // @[wbm_dbus.scala 54:76:@3195.6]
  wire [3:0] ld_sel_vec; // @[wbm_dbus.scala 51:37:@3188.4]
  wire  _T_61; // @[wbm_dbus.scala 74:37:@3227.4]
  assign _T_39 = io_dbus_st_type == 2'h1; // @[wbm_dbus.scala 35:19:@3170.4]
  assign _T_40 = io_dbus_st_type == 2'h2; // @[wbm_dbus.scala 38:26:@3175.6]
  assign _T_41 = io_dbus_st_type == 2'h3; // @[wbm_dbus.scala 41:26:@3180.8]
  assign _GEN_0 = _T_41 ? 4'h1 : 4'h0; // @[wbm_dbus.scala 41:46:@3181.8]
  assign _GEN_1 = _T_40 ? 4'h3 : _GEN_0; // @[wbm_dbus.scala 38:47:@3176.6]
  assign st_sel_vec = _T_39 ? 4'hf : _GEN_1; // @[wbm_dbus.scala 35:40:@3171.4]
  assign ld_align = io_dbus_addr[1:0]; // @[wbm_dbus.scala 46:30:@3184.4]
  assign _T_44 = io_dbus_ld_type == 3'h1; // @[wbm_dbus.scala 51:16:@3187.4]
  assign _T_45 = io_dbus_ld_type == 3'h2; // @[wbm_dbus.scala 54:23:@3192.6]
  assign _T_46 = io_dbus_ld_type == 3'h4; // @[wbm_dbus.scala 54:54:@3193.6]
  assign _T_47 = _T_45 | _T_46; // @[wbm_dbus.scala 54:43:@3194.6]
  assign _T_48 = ld_align[1]; // @[wbm_dbus.scala 55:34:@3196.8]
  assign _T_49 = _T_48 ? 4'hc : 4'h3; // @[wbm_dbus.scala 55:25:@3197.8]
  assign _T_50 = io_dbus_ld_type == 3'h3; // @[wbm_dbus.scala 57:23:@3201.8]
  assign _T_51 = io_dbus_ld_type == 3'h5; // @[wbm_dbus.scala 57:54:@3202.8]
  assign _T_52 = _T_50 | _T_51; // @[wbm_dbus.scala 57:43:@3203.8]
  assign _T_54 = ld_align == 2'h3; // @[wbm_dbus.scala 58:21:@3205.10]
  assign _T_56 = ld_align == 2'h2; // @[wbm_dbus.scala 60:27:@3210.12]
  assign _T_58 = ld_align == 2'h1; // @[wbm_dbus.scala 62:27:@3215.14]
  assign _GEN_3 = _T_58 ? 4'h2 : 4'h1; // @[wbm_dbus.scala 62:37:@3216.14]
  assign _GEN_4 = _T_56 ? 4'h4 : _GEN_3; // @[wbm_dbus.scala 60:37:@3211.12]
  assign _GEN_5 = _T_54 ? 4'h8 : _GEN_4; // @[wbm_dbus.scala 58:32:@3206.10]
  assign _GEN_6 = _T_52 ? _GEN_5 : 4'h0; // @[wbm_dbus.scala 57:75:@3204.8]
  assign _GEN_7 = _T_47 ? _T_49 : _GEN_6; // @[wbm_dbus.scala 54:76:@3195.6]
  assign ld_sel_vec = _T_44 ? 4'hf : _GEN_7; // @[wbm_dbus.scala 51:37:@3188.4]
  assign _T_61 = io_dbus_st_type != 2'h0; // @[wbm_dbus.scala 74:37:@3227.4]
  assign io_dbus_rdata = io_wbm_data_i; // @[wbm_dbus.scala 78:19:@3235.4]
  assign io_dbus_valid = io_wbm_ack_i; // @[wbm_dbus.scala 79:19:@3236.4]
  assign io_wbm_m2s_addr = io_dbus_addr[15:0]; // @[wbm_dbus.scala 71:19:@3224.4]
  assign io_wbm_m2s_data = io_dbus_wdata; // @[wbm_dbus.scala 72:19:@3225.4]
  assign io_wbm_m2s_we = io_dbus_wr_en; // @[wbm_dbus.scala 73:19:@3226.4]
  assign io_wbm_m2s_sel = _T_61 ? st_sel_vec : ld_sel_vec; // @[wbm_dbus.scala 74:19:@3229.4]
  assign io_wbm_m2s_stb = io_dbus_rd_en | io_dbus_wr_en; // @[wbm_dbus.scala 75:19:@3233.4]
endmodule
module UARTTx( // @[:@3238.2]
  input        clock, // @[:@3239.4]
  input        reset, // @[:@3240.4]
  output       io_in_ready, // @[:@3241.4]
  input        io_in_valid, // @[:@3241.4]
  input  [7:0] io_in_bits, // @[:@3241.4]
  output       io_out, // @[:@3241.4]
  input  [9:0] io_div // @[:@3241.4]
);
  reg [9:0] prescaler; // @[uart_tx.scala 23:26:@3243.4]
  reg [31:0] _RAND_0;
  wire  pulse; // @[uart_tx.scala 24:30:@3244.4]
  reg [3:0] counter; // @[uart_tx.scala 27:26:@3245.4]
  reg [31:0] _RAND_1;
  reg [8:0] shifter; // @[uart_tx.scala 28:22:@3246.4]
  reg [31:0] _RAND_2;
  reg  out; // @[uart_tx.scala 29:26:@3247.4]
  reg [31:0] _RAND_3;
  wire  busy; // @[uart_tx.scala 32:28:@3249.4]
  wire  _T_33; // @[uart_tx.scala 33:34:@3250.4]
  wire  state1; // @[uart_tx.scala 33:31:@3251.4]
  wire [8:0] _T_37; // @[Cat.scala 30:58:@3255.6]
  wire [8:0] _GEN_0; // @[uart_tx.scala 37:16:@3254.4]
  wire [3:0] _GEN_1; // @[uart_tx.scala 37:16:@3254.4]
  wire [10:0] _T_53; // @[uart_tx.scala 45:37:@3267.6]
  wire [10:0] _T_54; // @[uart_tx.scala 45:37:@3268.6]
  wire [9:0] _T_55; // @[uart_tx.scala 45:37:@3269.6]
  wire [10:0] _T_57; // @[uart_tx.scala 45:55:@3270.6]
  wire [10:0] _T_58; // @[uart_tx.scala 45:55:@3271.6]
  wire [9:0] _T_59; // @[uart_tx.scala 45:55:@3272.6]
  wire [9:0] _T_60; // @[uart_tx.scala 45:21:@3273.6]
  wire [4:0] _T_62; // @[uart_tx.scala 48:26:@3276.8]
  wire [4:0] _T_63; // @[uart_tx.scala 48:26:@3277.8]
  wire [3:0] _T_64; // @[uart_tx.scala 48:26:@3278.8]
  wire [7:0] _T_66; // @[uart_tx.scala 49:38:@3280.8]
  wire [8:0] _T_67; // @[Cat.scala 30:58:@3281.8]
  wire  _T_68; // @[uart_tx.scala 50:25:@3283.8]
  wire [3:0] _GEN_2; // @[uart_tx.scala 47:17:@3275.6]
  wire [8:0] _GEN_3; // @[uart_tx.scala 47:17:@3275.6]
  wire  _GEN_4; // @[uart_tx.scala 47:17:@3275.6]
  wire [9:0] _GEN_5; // @[uart_tx.scala 44:16:@3266.4]
  wire [3:0] _GEN_6; // @[uart_tx.scala 44:16:@3266.4]
  wire  _GEN_8; // @[uart_tx.scala 44:16:@3266.4]
  assign pulse = prescaler == 10'h0; // @[uart_tx.scala 24:30:@3244.4]
  assign busy = counter != 4'h0; // @[uart_tx.scala 32:28:@3249.4]
  assign _T_33 = busy == 1'h0; // @[uart_tx.scala 33:34:@3250.4]
  assign state1 = io_in_valid & _T_33; // @[uart_tx.scala 33:31:@3251.4]
  assign _T_37 = {io_in_bits,1'h0}; // @[Cat.scala 30:58:@3255.6]
  assign _GEN_0 = state1 ? _T_37 : shifter; // @[uart_tx.scala 37:16:@3254.4]
  assign _GEN_1 = state1 ? 4'hb : counter; // @[uart_tx.scala 37:16:@3254.4]
  assign _T_53 = io_div - 10'h1; // @[uart_tx.scala 45:37:@3267.6]
  assign _T_54 = $unsigned(_T_53); // @[uart_tx.scala 45:37:@3268.6]
  assign _T_55 = _T_54[9:0]; // @[uart_tx.scala 45:37:@3269.6]
  assign _T_57 = prescaler - 10'h1; // @[uart_tx.scala 45:55:@3270.6]
  assign _T_58 = $unsigned(_T_57); // @[uart_tx.scala 45:55:@3271.6]
  assign _T_59 = _T_58[9:0]; // @[uart_tx.scala 45:55:@3272.6]
  assign _T_60 = pulse ? _T_55 : _T_59; // @[uart_tx.scala 45:21:@3273.6]
  assign _T_62 = counter - 4'h1; // @[uart_tx.scala 48:26:@3276.8]
  assign _T_63 = $unsigned(_T_62); // @[uart_tx.scala 48:26:@3277.8]
  assign _T_64 = _T_63[3:0]; // @[uart_tx.scala 48:26:@3278.8]
  assign _T_66 = shifter[8:1]; // @[uart_tx.scala 49:38:@3280.8]
  assign _T_67 = {1'h1,_T_66}; // @[Cat.scala 30:58:@3281.8]
  assign _T_68 = shifter[0]; // @[uart_tx.scala 50:25:@3283.8]
  assign _GEN_2 = pulse ? _T_64 : _GEN_1; // @[uart_tx.scala 47:17:@3275.6]
  assign _GEN_3 = pulse ? _T_67 : _GEN_0; // @[uart_tx.scala 47:17:@3275.6]
  assign _GEN_4 = pulse ? _T_68 : out; // @[uart_tx.scala 47:17:@3275.6]
  assign _GEN_5 = busy ? _T_60 : prescaler; // @[uart_tx.scala 44:16:@3266.4]
  assign _GEN_6 = busy ? _GEN_2 : _GEN_1; // @[uart_tx.scala 44:16:@3266.4]
  assign _GEN_8 = busy ? _GEN_4 : out; // @[uart_tx.scala 44:16:@3266.4]
  assign io_in_ready = busy == 1'h0; // @[uart_tx.scala 35:17:@3253.4]
  assign io_out = out; // @[uart_tx.scala 30:17:@3248.4]
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
module UARTRx( // @[:@3288.2]
  input        clock, // @[:@3289.4]
  input        reset, // @[:@3290.4]
  input        io_in, // @[:@3291.4]
  output       io_out_valid, // @[:@3291.4]
  output [7:0] io_out_bits, // @[:@3291.4]
  input  [9:0] io_div // @[:@3291.4]
);
  reg [3:0] data_count; // @[uart_rx.scala 23:34:@3293.4]
  reg [31:0] _RAND_0;
  wire  data_last; // @[uart_rx.scala 24:43:@3294.4]
  reg [9:0] prescaler; // @[uart_rx.scala 27:38:@3295.4]
  reg [31:0] _RAND_1;
  wire  pulse; // @[uart_rx.scala 28:42:@3296.4]
  wire [10:0] _T_19; // @[uart_rx.scala 29:50:@3297.4]
  wire [10:0] _T_20; // @[uart_rx.scala 29:50:@3298.4]
  wire [9:0] _T_21; // @[uart_rx.scala 29:50:@3299.4]
  wire [10:0] _T_23; // @[uart_rx.scala 29:68:@3300.4]
  wire [10:0] _T_24; // @[uart_rx.scala 29:68:@3301.4]
  wire [9:0] _T_25; // @[uart_rx.scala 29:68:@3302.4]
  wire [9:0] prescaler_next; // @[uart_rx.scala 29:34:@3303.4]
  reg [8:0] debounce; // @[uart_rx.scala 32:38:@3304.4]
  reg [31:0] _RAND_2;
  wire [9:0] _T_29; // @[uart_rx.scala 33:52:@3305.4]
  wire [9:0] _GEN_28; // @[uart_rx.scala 33:41:@3306.4]
  wire  debounce_max; // @[uart_rx.scala 33:41:@3306.4]
  reg [7:0] shifter; // @[uart_rx.scala 36:27:@3307.4]
  reg [31:0] _RAND_3;
  reg  valid; // @[uart_rx.scala 37:23:@3308.4]
  reg [31:0] _RAND_4;
  reg  state; // @[uart_rx.scala 44:27:@3312.4]
  reg [31:0] _RAND_5;
  wire  _T_35; // @[Conditional.scala 37:30:@3313.4]
  wire  _T_37; // @[uart_rx.scala 48:13:@3315.6]
  wire [9:0] _T_39; // @[uart_rx.scala 50:30:@3317.8]
  wire [8:0] _T_40; // @[uart_rx.scala 50:30:@3318.8]
  wire  _GEN_0; // @[uart_rx.scala 51:29:@3320.8]
  wire [3:0] _GEN_1; // @[uart_rx.scala 51:29:@3320.8]
  wire [9:0] _GEN_2; // @[uart_rx.scala 51:29:@3320.8]
  wire [8:0] _GEN_3; // @[uart_rx.scala 48:21:@3316.6]
  wire  _GEN_4; // @[uart_rx.scala 48:21:@3316.6]
  wire [3:0] _GEN_5; // @[uart_rx.scala 48:21:@3316.6]
  wire [9:0] _GEN_6; // @[uart_rx.scala 48:21:@3316.6]
  wire [4:0] _T_44; // @[uart_rx.scala 62:34:@3332.10]
  wire [4:0] _T_45; // @[uart_rx.scala 62:34:@3333.10]
  wire [3:0] _T_46; // @[uart_rx.scala 62:34:@3334.10]
  wire [6:0] _T_49; // @[uart_rx.scala 70:44:@3342.12]
  wire [7:0] _T_50; // @[Cat.scala 30:58:@3343.12]
  wire  _GEN_7; // @[uart_rx.scala 64:26:@3336.10]
  wire [8:0] _GEN_9; // @[uart_rx.scala 64:26:@3336.10]
  wire [7:0] _GEN_10; // @[uart_rx.scala 64:26:@3336.10]
  wire [3:0] _GEN_11; // @[uart_rx.scala 61:20:@3331.8]
  wire  _GEN_12; // @[uart_rx.scala 61:20:@3331.8]
  wire  _GEN_13; // @[uart_rx.scala 61:20:@3331.8]
  wire [8:0] _GEN_14; // @[uart_rx.scala 61:20:@3331.8]
  wire [7:0] _GEN_15; // @[uart_rx.scala 61:20:@3331.8]
  wire [9:0] _GEN_16; // @[Conditional.scala 39:67:@3329.6]
  wire [3:0] _GEN_17; // @[Conditional.scala 39:67:@3329.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@3329.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@3329.6]
  wire [8:0] _GEN_20; // @[Conditional.scala 39:67:@3329.6]
  wire [7:0] _GEN_21; // @[Conditional.scala 39:67:@3329.6]
  wire [8:0] _GEN_22; // @[Conditional.scala 40:58:@3314.4]
  wire  _GEN_23; // @[Conditional.scala 40:58:@3314.4]
  wire [9:0] _GEN_25; // @[Conditional.scala 40:58:@3314.4]
  wire [7:0] _GEN_27; // @[Conditional.scala 40:58:@3314.4]
  assign data_last = data_count == 4'h0; // @[uart_rx.scala 24:43:@3294.4]
  assign pulse = prescaler == 10'h0; // @[uart_rx.scala 28:42:@3296.4]
  assign _T_19 = io_div - 10'h1; // @[uart_rx.scala 29:50:@3297.4]
  assign _T_20 = $unsigned(_T_19); // @[uart_rx.scala 29:50:@3298.4]
  assign _T_21 = _T_20[9:0]; // @[uart_rx.scala 29:50:@3299.4]
  assign _T_23 = prescaler - 10'h1; // @[uart_rx.scala 29:68:@3300.4]
  assign _T_24 = $unsigned(_T_23); // @[uart_rx.scala 29:68:@3301.4]
  assign _T_25 = _T_24[9:0]; // @[uart_rx.scala 29:68:@3302.4]
  assign prescaler_next = pulse ? _T_21 : _T_25; // @[uart_rx.scala 29:34:@3303.4]
  assign _T_29 = io_div / 10'h2; // @[uart_rx.scala 33:52:@3305.4]
  assign _GEN_28 = {{1'd0}, debounce}; // @[uart_rx.scala 33:41:@3306.4]
  assign debounce_max = _GEN_28 == _T_29; // @[uart_rx.scala 33:41:@3306.4]
  assign _T_35 = 1'h0 == state; // @[Conditional.scala 37:30:@3313.4]
  assign _T_37 = io_in == 1'h0; // @[uart_rx.scala 48:13:@3315.6]
  assign _T_39 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3317.8]
  assign _T_40 = debounce + 9'h1; // @[uart_rx.scala 50:30:@3318.8]
  assign _GEN_0 = debounce_max ? 1'h1 : state; // @[uart_rx.scala 51:29:@3320.8]
  assign _GEN_1 = debounce_max ? 4'h8 : data_count; // @[uart_rx.scala 51:29:@3320.8]
  assign _GEN_2 = debounce_max ? prescaler_next : prescaler; // @[uart_rx.scala 51:29:@3320.8]
  assign _GEN_3 = _T_37 ? _T_40 : debounce; // @[uart_rx.scala 48:21:@3316.6]
  assign _GEN_4 = _T_37 ? _GEN_0 : state; // @[uart_rx.scala 48:21:@3316.6]
  assign _GEN_5 = _T_37 ? _GEN_1 : data_count; // @[uart_rx.scala 48:21:@3316.6]
  assign _GEN_6 = _T_37 ? _GEN_2 : prescaler; // @[uart_rx.scala 48:21:@3316.6]
  assign _T_44 = data_count - 4'h1; // @[uart_rx.scala 62:34:@3332.10]
  assign _T_45 = $unsigned(_T_44); // @[uart_rx.scala 62:34:@3333.10]
  assign _T_46 = _T_45[3:0]; // @[uart_rx.scala 62:34:@3334.10]
  assign _T_49 = shifter[7:1]; // @[uart_rx.scala 70:44:@3342.12]
  assign _T_50 = {io_in,_T_49}; // @[Cat.scala 30:58:@3343.12]
  assign _GEN_7 = data_last ? 1'h0 : state; // @[uart_rx.scala 64:26:@3336.10]
  assign _GEN_9 = data_last ? 9'h0 : debounce; // @[uart_rx.scala 64:26:@3336.10]
  assign _GEN_10 = data_last ? shifter : _T_50; // @[uart_rx.scala 64:26:@3336.10]
  assign _GEN_11 = pulse ? _T_46 : data_count; // @[uart_rx.scala 61:20:@3331.8]
  assign _GEN_12 = pulse ? _GEN_7 : state; // @[uart_rx.scala 61:20:@3331.8]
  assign _GEN_13 = pulse ? data_last : 1'h0; // @[uart_rx.scala 61:20:@3331.8]
  assign _GEN_14 = pulse ? _GEN_9 : debounce; // @[uart_rx.scala 61:20:@3331.8]
  assign _GEN_15 = pulse ? _GEN_10 : shifter; // @[uart_rx.scala 61:20:@3331.8]
  assign _GEN_16 = state ? prescaler_next : prescaler; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_17 = state ? _GEN_11 : data_count; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_18 = state ? _GEN_12 : state; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_19 = state ? _GEN_13 : 1'h0; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_20 = state ? _GEN_14 : debounce; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_21 = state ? _GEN_15 : shifter; // @[Conditional.scala 39:67:@3329.6]
  assign _GEN_22 = _T_35 ? _GEN_3 : _GEN_20; // @[Conditional.scala 40:58:@3314.4]
  assign _GEN_23 = _T_35 ? _GEN_4 : _GEN_18; // @[Conditional.scala 40:58:@3314.4]
  assign _GEN_25 = _T_35 ? _GEN_6 : _GEN_16; // @[Conditional.scala 40:58:@3314.4]
  assign _GEN_27 = _T_35 ? shifter : _GEN_21; // @[Conditional.scala 40:58:@3314.4]
  assign io_out_valid = valid; // @[uart_rx.scala 39:18:@3310.4]
  assign io_out_bits = shifter; // @[uart_rx.scala 40:18:@3311.4]
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
module UART( // @[:@3349.2]
  input         clock, // @[:@3350.4]
  input         reset, // @[:@3351.4]
  input         io_uart_select, // @[:@3352.4]
  output        io_txd, // @[:@3352.4]
  output        io_tx_en, // @[:@3352.4]
  input         io_rxd, // @[:@3352.4]
  output        io_uartInt, // @[:@3352.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3352.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3352.4]
  input         io_wbs_m2s_we, // @[:@3352.4]
  input         io_wbs_m2s_stb, // @[:@3352.4]
  output        io_wbs_ack_o, // @[:@3352.4]
  output [31:0] io_wbs_data_o // @[:@3352.4]
);
  wire  txm_clock; // @[uart.scala 54:19:@3354.4]
  wire  txm_reset; // @[uart.scala 54:19:@3354.4]
  wire  txm_io_in_ready; // @[uart.scala 54:19:@3354.4]
  wire  txm_io_in_valid; // @[uart.scala 54:19:@3354.4]
  wire [7:0] txm_io_in_bits; // @[uart.scala 54:19:@3354.4]
  wire  txm_io_out; // @[uart.scala 54:19:@3354.4]
  wire [9:0] txm_io_div; // @[uart.scala 54:19:@3354.4]
  wire  rxm_clock; // @[uart.scala 55:19:@3357.4]
  wire  rxm_reset; // @[uart.scala 55:19:@3357.4]
  wire  rxm_io_in; // @[uart.scala 55:19:@3357.4]
  wire  rxm_io_out_valid; // @[uart.scala 55:19:@3357.4]
  wire [7:0] rxm_io_out_bits; // @[uart.scala 55:19:@3357.4]
  wire [9:0] rxm_io_div; // @[uart.scala 55:19:@3357.4]
  reg  txen; // @[uart.scala 58:27:@3360.4]
  reg [31:0] _RAND_0;
  reg [7:0] tx_data_r; // @[uart.scala 61:27:@3362.4]
  reg [31:0] _RAND_1;
  reg [7:0] rx_data_r; // @[uart.scala 62:27:@3363.4]
  reg [31:0] _RAND_2;
  reg [7:0] control_r; // @[uart.scala 63:27:@3364.4]
  reg [31:0] _RAND_3;
  reg [9:0] baud_r; // @[uart.scala 64:27:@3365.4]
  reg [31:0] _RAND_4;
  reg [7:0] status_r; // @[uart.scala 65:27:@3366.4]
  reg [31:0] _RAND_5;
  reg [7:0] int_mask_r; // @[uart.scala 66:27:@3367.4]
  reg [31:0] _RAND_6;
  wire [7:0] addr; // @[uart.scala 87:36:@3379.4]
  wire  _T_66; // @[uart.scala 88:21:@3380.4]
  wire  rd_en; // @[uart.scala 88:36:@3381.4]
  wire  wr_en; // @[uart.scala 89:35:@3382.4]
  wire  _T_73; // @[uart.scala 93:32:@3383.4]
  wire  sel_reg_rx; // @[uart.scala 93:56:@3384.4]
  wire  _T_74; // @[uart.scala 94:32:@3385.4]
  wire  sel_reg_tx; // @[uart.scala 94:56:@3386.4]
  wire  _T_75; // @[uart.scala 95:32:@3387.4]
  wire  sel_reg_baud; // @[uart.scala 95:54:@3388.4]
  wire  _T_76; // @[uart.scala 96:32:@3389.4]
  wire  sel_reg_control; // @[uart.scala 96:57:@3390.4]
  wire  _T_77; // @[uart.scala 97:32:@3391.4]
  wire  sel_reg_status; // @[uart.scala 97:56:@3392.4]
  wire  _T_78; // @[uart.scala 98:32:@3393.4]
  wire  sel_reg_int_mask; // @[uart.scala 98:58:@3394.4]
  reg  ack; // @[uart.scala 101:28:@3395.4]
  reg [31:0] _RAND_7;
  reg [7:0] rd_data; // @[uart.scala 106:28:@3399.4]
  reg [31:0] _RAND_8;
  wire  _T_84; // @[uart.scala 108:14:@3400.4]
  wire  _T_85; // @[uart.scala 110:20:@3405.6]
  wire  _T_86; // @[uart.scala 112:20:@3410.8]
  wire  _T_87; // @[uart.scala 114:20:@3415.10]
  wire [7:0] _GEN_0; // @[uart.scala 114:34:@3416.10]
  wire [7:0] _GEN_1; // @[uart.scala 112:38:@3411.8]
  wire [9:0] _GEN_2; // @[uart.scala 110:36:@3406.6]
  wire [9:0] _GEN_3; // @[uart.scala 108:33:@3401.4]
  wire [7:0] _T_89; // @[uart.scala 122:31:@3423.4]
  wire [7:0] _T_92; // @[uart.scala 127:36:@3428.8]
  wire [7:0] _GEN_4; // @[uart.scala 136:32:@3443.12]
  wire [7:0] _GEN_5; // @[uart.scala 133:31:@3438.10]
  wire [7:0] _GEN_6; // @[uart.scala 133:31:@3438.10]
  wire [9:0] _GEN_7; // @[uart.scala 130:29:@3433.8]
  wire [7:0] _GEN_8; // @[uart.scala 130:29:@3433.8]
  wire [7:0] _GEN_9; // @[uart.scala 130:29:@3433.8]
  wire [7:0] _GEN_10; // @[uart.scala 126:22:@3427.6]
  wire [9:0] _GEN_12; // @[uart.scala 126:22:@3427.6]
  wire [7:0] _GEN_13; // @[uart.scala 126:22:@3427.6]
  wire [7:0] _GEN_14; // @[uart.scala 126:22:@3427.6]
  wire [7:0] _GEN_15; // @[uart.scala 125:15:@3426.4]
  wire  _GEN_16; // @[uart.scala 125:15:@3426.4]
  wire [9:0] _GEN_17; // @[uart.scala 125:15:@3426.4]
  wire [7:0] _GEN_18; // @[uart.scala 125:15:@3426.4]
  wire [7:0] _GEN_19; // @[uart.scala 125:15:@3426.4]
  wire [6:0] _T_97; // @[uart.scala 144:33:@3450.6]
  wire [7:0] _T_99; // @[Cat.scala 30:58:@3451.6]
  wire  _T_100; // @[uart.scala 145:20:@3455.6]
  wire [5:0] _T_102; // @[uart.scala 148:33:@3461.8]
  wire  _T_103; // @[uart.scala 148:65:@3462.8]
  wire [7:0] _T_105; // @[Cat.scala 30:58:@3464.8]
  wire [7:0] _GEN_20; // @[uart.scala 145:38:@3456.6]
  wire [7:0] _GEN_21; // @[uart.scala 142:25:@3448.4]
  wire [7:0] _GEN_22; // @[uart.scala 142:25:@3448.4]
  UARTTx txm ( // @[uart.scala 54:19:@3354.4]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div)
  );
  UARTRx rxm ( // @[uart.scala 55:19:@3357.4]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  assign addr = io_wbs_m2s_addr[7:0]; // @[uart.scala 87:36:@3379.4]
  assign _T_66 = io_wbs_m2s_we == 1'h0; // @[uart.scala 88:21:@3380.4]
  assign rd_en = _T_66 & io_wbs_m2s_stb; // @[uart.scala 88:36:@3381.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[uart.scala 89:35:@3382.4]
  assign _T_73 = addr == 8'h0; // @[uart.scala 93:32:@3383.4]
  assign sel_reg_rx = _T_73 & io_uart_select; // @[uart.scala 93:56:@3384.4]
  assign _T_74 = addr == 8'h1; // @[uart.scala 94:32:@3385.4]
  assign sel_reg_tx = _T_74 & io_uart_select; // @[uart.scala 94:56:@3386.4]
  assign _T_75 = addr == 8'h2; // @[uart.scala 95:32:@3387.4]
  assign sel_reg_baud = _T_75 & io_uart_select; // @[uart.scala 95:54:@3388.4]
  assign _T_76 = addr == 8'h3; // @[uart.scala 96:32:@3389.4]
  assign sel_reg_control = _T_76 & io_uart_select; // @[uart.scala 96:57:@3390.4]
  assign _T_77 = addr == 8'h4; // @[uart.scala 97:32:@3391.4]
  assign sel_reg_status = _T_77 & io_uart_select; // @[uart.scala 97:56:@3392.4]
  assign _T_78 = addr == 8'h5; // @[uart.scala 98:32:@3393.4]
  assign sel_reg_int_mask = _T_78 & io_uart_select; // @[uart.scala 98:58:@3394.4]
  assign _T_84 = rd_en & sel_reg_control; // @[uart.scala 108:14:@3400.4]
  assign _T_85 = rd_en & sel_reg_baud; // @[uart.scala 110:20:@3405.6]
  assign _T_86 = rd_en & sel_reg_status; // @[uart.scala 112:20:@3410.8]
  assign _T_87 = rd_en & sel_reg_rx; // @[uart.scala 114:20:@3415.10]
  assign _GEN_0 = _T_87 ? rx_data_r : 8'h0; // @[uart.scala 114:34:@3416.10]
  assign _GEN_1 = _T_86 ? status_r : _GEN_0; // @[uart.scala 112:38:@3411.8]
  assign _GEN_2 = _T_85 ? baud_r : {{2'd0}, _GEN_1}; // @[uart.scala 110:36:@3406.6]
  assign _GEN_3 = _T_84 ? {{2'd0}, control_r} : _GEN_2; // @[uart.scala 108:33:@3401.4]
  assign _T_89 = status_r & int_mask_r; // @[uart.scala 122:31:@3423.4]
  assign _T_92 = io_wbs_m2s_data[7:0]; // @[uart.scala 127:36:@3428.8]
  assign _GEN_4 = sel_reg_int_mask ? _T_92 : int_mask_r; // @[uart.scala 136:32:@3443.12]
  assign _GEN_5 = sel_reg_control ? _T_92 : control_r; // @[uart.scala 133:31:@3438.10]
  assign _GEN_6 = sel_reg_control ? int_mask_r : _GEN_4; // @[uart.scala 133:31:@3438.10]
  assign _GEN_7 = sel_reg_baud ? {{2'd0}, _T_92} : baud_r; // @[uart.scala 130:29:@3433.8]
  assign _GEN_8 = sel_reg_baud ? control_r : _GEN_5; // @[uart.scala 130:29:@3433.8]
  assign _GEN_9 = sel_reg_baud ? int_mask_r : _GEN_6; // @[uart.scala 130:29:@3433.8]
  assign _GEN_10 = sel_reg_tx ? _T_92 : tx_data_r; // @[uart.scala 126:22:@3427.6]
  assign _GEN_12 = sel_reg_tx ? baud_r : _GEN_7; // @[uart.scala 126:22:@3427.6]
  assign _GEN_13 = sel_reg_tx ? control_r : _GEN_8; // @[uart.scala 126:22:@3427.6]
  assign _GEN_14 = sel_reg_tx ? int_mask_r : _GEN_9; // @[uart.scala 126:22:@3427.6]
  assign _GEN_15 = wr_en ? _GEN_10 : tx_data_r; // @[uart.scala 125:15:@3426.4]
  assign _GEN_16 = wr_en ? sel_reg_tx : 1'h0; // @[uart.scala 125:15:@3426.4]
  assign _GEN_17 = wr_en ? _GEN_12 : baud_r; // @[uart.scala 125:15:@3426.4]
  assign _GEN_18 = wr_en ? _GEN_13 : control_r; // @[uart.scala 125:15:@3426.4]
  assign _GEN_19 = wr_en ? _GEN_14 : int_mask_r; // @[uart.scala 125:15:@3426.4]
  assign _T_97 = status_r[7:1]; // @[uart.scala 144:33:@3450.6]
  assign _T_99 = {_T_97,1'h1}; // @[Cat.scala 30:58:@3451.6]
  assign _T_100 = wr_en & sel_reg_status; // @[uart.scala 145:20:@3455.6]
  assign _T_102 = status_r[7:2]; // @[uart.scala 148:33:@3461.8]
  assign _T_103 = status_r[0]; // @[uart.scala 148:65:@3462.8]
  assign _T_105 = {_T_102,txm_io_in_ready,_T_103}; // @[Cat.scala 30:58:@3464.8]
  assign _GEN_20 = _T_100 ? _T_92 : _T_105; // @[uart.scala 145:38:@3456.6]
  assign _GEN_21 = rxm_io_out_valid ? rxm_io_out_bits : rx_data_r; // @[uart.scala 142:25:@3448.4]
  assign _GEN_22 = rxm_io_out_valid ? _T_99 : _GEN_20; // @[uart.scala 142:25:@3448.4]
  assign io_txd = txm_io_out; // @[uart.scala 83:19:@3376.4]
  assign io_tx_en = control_r[0]; // @[uart.scala 84:19:@3378.4]
  assign io_uartInt = _T_89 != 8'h0; // @[uart.scala 122:18:@3425.4]
  assign io_wbs_ack_o = ack; // @[uart.scala 102:19:@3396.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[uart.scala 119:18:@3422.4]
  assign txm_clock = clock; // @[:@3355.4]
  assign txm_reset = reset; // @[:@3356.4]
  assign txm_io_in_valid = txen; // @[uart.scala 75:19:@3370.4]
  assign txm_io_in_bits = tx_data_r; // @[uart.scala 76:19:@3371.4]
  assign txm_io_div = baud_r; // @[uart.scala 77:19:@3372.4]
  assign rxm_clock = clock; // @[:@3358.4]
  assign rxm_reset = reset; // @[:@3359.4]
  assign rxm_io_in = io_rxd; // @[uart.scala 82:19:@3375.4]
  assign rxm_io_div = baud_r; // @[uart.scala 79:19:@3374.4]
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
module SPI( // @[:@3468.2]
  input         clock, // @[:@3469.4]
  input         reset, // @[:@3470.4]
  input         io_spi_select, // @[:@3471.4]
  output        io_spi_cs, // @[:@3471.4]
  output        io_spi_clk, // @[:@3471.4]
  output        io_spi_mosi, // @[:@3471.4]
  output        io_spi_cs_en, // @[:@3471.4]
  output        io_spi_clk_en, // @[:@3471.4]
  output        io_spi_mosi_en, // @[:@3471.4]
  input         io_spi_miso, // @[:@3471.4]
  output        io_spi_intr, // @[:@3471.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@3471.4]
  input  [31:0] io_wbs_m2s_data, // @[:@3471.4]
  input         io_wbs_m2s_we, // @[:@3471.4]
  input         io_wbs_m2s_stb, // @[:@3471.4]
  output        io_wbs_ack_o, // @[:@3471.4]
  output [31:0] io_wbs_data_o // @[:@3471.4]
);
  reg  ack_o; // @[spi.scala 68:25:@3473.4]
  reg [31:0] _RAND_0;
  reg [7:0] rd_data; // @[spi.scala 69:25:@3474.4]
  reg [31:0] _RAND_1;
  reg  sclk_r; // @[spi.scala 72:23:@3476.4]
  reg [31:0] _RAND_2;
  reg  mosi_r; // @[spi.scala 73:23:@3477.4]
  reg [31:0] _RAND_3;
  reg  read_wait_done; // @[spi.scala 78:31:@3484.4]
  reg [31:0] _RAND_4;
  reg [7:0] reg_rxdata; // @[spi.scala 81:28:@3487.4]
  reg [31:0] _RAND_5;
  reg [7:0] reg_txdata; // @[spi.scala 82:28:@3488.4]
  reg [31:0] _RAND_6;
  reg  reg_ssmask; // @[spi.scala 83:28:@3489.4]
  reg [31:0] _RAND_7;
  reg [7:0] rx_shift_data; // @[spi.scala 85:30:@3490.4]
  reg [31:0] _RAND_8;
  reg [7:0] tx_shift_data; // @[spi.scala 86:30:@3491.4]
  reg [31:0] _RAND_9;
  reg  rx_latch_flag; // @[spi.scala 87:30:@3492.4]
  reg [31:0] _RAND_10;
  reg  bit_iroe; // @[spi.scala 90:27:@3493.4]
  reg [31:0] _RAND_11;
  reg  bit_itoe; // @[spi.scala 91:27:@3494.4]
  reg [31:0] _RAND_12;
  reg  bit_itrdy; // @[spi.scala 92:27:@3495.4]
  reg [31:0] _RAND_13;
  reg  bit_irrdy; // @[spi.scala 93:27:@3496.4]
  reg [31:0] _RAND_14;
  reg  bit_ie; // @[spi.scala 94:27:@3497.4]
  reg [31:0] _RAND_15;
  reg  bit_sso; // @[spi.scala 95:27:@3498.4]
  reg [31:0] _RAND_16;
  reg  bit_spi_en; // @[spi.scala 96:27:@3499.4]
  reg [31:0] _RAND_17;
  reg  bit_toe; // @[spi.scala 99:27:@3500.4]
  reg [31:0] _RAND_18;
  reg  bit_roe; // @[spi.scala 100:27:@3501.4]
  reg [31:0] _RAND_19;
  reg  bit_trdy; // @[spi.scala 101:27:@3502.4]
  reg [31:0] _RAND_20;
  reg  bit_rrdy; // @[spi.scala 102:27:@3503.4]
  reg [31:0] _RAND_21;
  reg  bit_tmt; // @[spi.scala 103:27:@3504.4]
  reg [31:0] _RAND_22;
  reg  bit_e; // @[spi.scala 104:27:@3505.4]
  reg [31:0] _RAND_23;
  wire [7:0] addr; // @[spi.scala 110:33:@3506.4]
  wire  _T_112; // @[spi.scala 112:19:@3507.4]
  wire  rd_en; // @[spi.scala 112:34:@3508.4]
  wire  wr_en; // @[spi.scala 113:33:@3511.4]
  wire  _T_123; // @[spi.scala 117:32:@3515.4]
  wire  sel_reg_rx; // @[spi.scala 117:54:@3516.4]
  wire  _T_124; // @[spi.scala 118:32:@3517.4]
  wire  sel_reg_tx; // @[spi.scala 118:54:@3518.4]
  wire  _T_126; // @[spi.scala 120:32:@3521.4]
  wire  sel_reg_control; // @[spi.scala 120:55:@3522.4]
  wire  _T_127; // @[spi.scala 121:32:@3523.4]
  wire  sel_reg_status; // @[spi.scala 121:54:@3524.4]
  wire  _T_128; // @[spi.scala 122:32:@3525.4]
  wire  sel_reg_ssmask; // @[spi.scala 122:55:@3526.4]
  wire [7:0] _GEN_0; // @[spi.scala 125:23:@3527.4]
  wire  _T_129; // @[spi.scala 130:14:@3530.4]
  wire  _T_130; // @[spi.scala 130:28:@3531.4]
  wire [7:0] spi_wdata; // @[:@3485.4 :@3486.4 spi.scala 114:16:@3514.4]
  wire [7:0] _GEN_1; // @[spi.scala 130:41:@3532.4]
  wire  _T_131; // @[spi.scala 135:19:@3535.4]
  wire [7:0] reg_status; // @[Cat.scala 30:58:@3542.4]
  wire [7:0] reg_control; // @[Cat.scala 30:58:@3549.4]
  wire  _T_145; // @[spi.scala 142:14:@3550.4]
  wire  _T_146; // @[spi.scala 143:28:@3552.6]
  wire  _T_147; // @[spi.scala 144:28:@3554.6]
  wire  _T_148; // @[spi.scala 145:28:@3556.6]
  wire  _T_149; // @[spi.scala 146:28:@3558.6]
  wire  _T_150; // @[spi.scala 147:28:@3560.6]
  wire  _T_151; // @[spi.scala 148:28:@3562.6]
  wire  _T_152; // @[spi.scala 149:28:@3564.6]
  wire  _GEN_2; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_3; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_4; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_5; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_6; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_7; // @[spi.scala 142:34:@3551.4]
  wire  _GEN_8; // @[spi.scala 142:34:@3551.4]
  wire  _T_153; // @[spi.scala 156:41:@3570.4]
  wire  _T_154; // @[spi.scala 156:62:@3571.4]
  wire  _T_155; // @[spi.scala 156:51:@3572.4]
  wire  _T_156; // @[spi.scala 156:29:@3573.4]
  wire  _T_157; // @[spi.scala 156:87:@3574.4]
  wire  _T_158; // @[spi.scala 156:74:@3575.4]
  wire  _T_159; // @[spi.scala 156:112:@3576.4]
  wire  _T_163; // @[spi.scala 163:39:@3584.6]
  wire  _T_164; // @[spi.scala 163:30:@3585.6]
  wire  _GEN_9; // @[spi.scala 163:59:@3586.6]
  wire  _GEN_10; // @[spi.scala 161:15:@3579.4]
  wire  _T_168; // @[spi.scala 170:35:@3595.6]
  wire  _T_169; // @[spi.scala 170:30:@3596.6]
  wire  _GEN_11; // @[spi.scala 170:43:@3597.6]
  wire  _GEN_12; // @[spi.scala 168:15:@3590.4]
  reg [4:0] clock_cnt; // @[spi.scala 175:31:@3600.4]
  reg [31:0] _RAND_24;
  reg [5:0] data_cnt; // @[spi.scala 176:31:@3601.4]
  reg [31:0] _RAND_25;
  reg  pending_data; // @[spi.scala 177:31:@3602.4]
  reg [31:0] _RAND_26;
  reg [2:0] n_status; // @[spi.scala 179:31:@3605.4]
  reg [31:0] _RAND_27;
  reg [2:0] p_status; // @[spi.scala 180:31:@3606.4]
  reg [31:0] _RAND_28;
  wire  _T_182; // @[spi.scala 184:27:@3612.6]
  wire  _GEN_13; // @[spi.scala 184:40:@3613.6]
  wire  _GEN_14; // @[spi.scala 182:32:@3608.4]
  wire [7:0] _T_188; // @[spi.scala 190:78:@3619.6]
  wire [7:0] _T_189; // @[spi.scala 190:44:@3620.6]
  wire [7:0] _T_190; // @[spi.scala 190:12:@3621.6]
  wire [7:0] _T_191; // @[spi.scala 189:49:@3622.6]
  wire [7:0] _T_192; // @[spi.scala 189:21:@3623.6]
  wire [7:0] _GEN_15; // @[spi.scala 188:18:@3616.4]
  wire  _T_193; // @[spi.scala 194:16:@3627.4]
  wire  _GEN_16; // @[spi.scala 194:35:@3628.4]
  wire  _T_196; // @[spi.scala 210:21:@3634.4]
  wire  _T_198; // @[spi.scala 210:49:@3635.4]
  wire  _T_199; // @[spi.scala 210:35:@3636.4]
  wire  _T_200; // @[spi.scala 211:18:@3638.6]
  wire  _GEN_17; // @[spi.scala 210:67:@3637.4]
  wire  _T_204; // @[spi.scala 217:59:@3644.4]
  wire  _T_205; // @[spi.scala 217:39:@3645.4]
  wire  _T_207; // @[spi.scala 217:71:@3647.4]
  wire [8:0] _T_211; // @[Cat.scala 30:58:@3655.8]
  wire [8:0] _GEN_19; // @[spi.scala 217:99:@3648.4]
  wire  _T_212; // @[spi.scala 226:20:@3659.4]
  wire  _T_213; // @[spi.scala 226:47:@3660.4]
  wire  _T_214; // @[spi.scala 226:34:@3661.4]
  wire  _GEN_20; // @[spi.scala 228:33:@3666.6]
  wire  _GEN_21; // @[spi.scala 226:62:@3662.4]
  wire  _T_219; // @[spi.scala 232:49:@3670.4]
  wire  _T_220; // @[spi.scala 232:36:@3671.4]
  wire [5:0] _T_223; // @[spi.scala 235:30:@3676.6]
  wire [4:0] _T_224; // @[spi.scala 235:30:@3677.6]
  wire [4:0] _GEN_22; // @[spi.scala 232:63:@3672.4]
  wire [2:0] _GEN_23; // @[spi.scala 244:26:@3688.6]
  wire  _T_237; // @[spi.scala 255:27:@3707.8]
  wire  _T_241; // @[spi.scala 256:53:@3710.10]
  wire  _T_242; // @[spi.scala 256:40:@3711.10]
  wire [2:0] _GEN_25; // @[spi.scala 256:76:@3712.10]
  wire  _T_246; // @[spi.scala 262:53:@3723.12]
  wire  _T_247; // @[spi.scala 262:40:@3724.12]
  wire  _T_250; // @[spi.scala 262:69:@3726.12]
  wire [2:0] _GEN_26; // @[spi.scala 262:105:@3727.12]
  wire  _T_251; // @[spi.scala 267:27:@3735.12]
  wire [2:0] _GEN_28; // @[spi.scala 268:39:@3738.14]
  wire  _T_255; // @[spi.scala 275:27:@3748.14]
  wire  _T_259; // @[spi.scala 276:53:@3751.16]
  wire  _T_260; // @[spi.scala 276:40:@3752.16]
  wire [2:0] _GEN_29; // @[spi.scala 276:77:@3753.16]
  wire [2:0] _GEN_30; // @[spi.scala 275:44:@3749.14]
  wire [2:0] _GEN_31; // @[spi.scala 267:46:@3736.12]
  wire [2:0] _GEN_32; // @[spi.scala 261:41:@3721.10]
  wire [2:0] _GEN_33; // @[spi.scala 255:40:@3708.8]
  wire [2:0] _GEN_34; // @[spi.scala 249:40:@3697.6]
  wire [2:0] _GEN_35; // @[spi.scala 243:32:@3687.4]
  wire  _T_264; // @[spi.scala 285:32:@3765.4]
  wire  _T_267; // @[spi.scala 285:63:@3767.4]
  wire  _T_274; // @[spi.scala 287:73:@3776.6]
  wire  _T_277; // @[spi.scala 287:102:@3778.6]
  wire  _T_282; // @[spi.scala 289:45:@3785.8]
  wire  _T_285; // @[spi.scala 289:76:@3787.8]
  wire  _T_299; // @[spi.scala 291:133:@3800.10]
  wire  _T_300; // @[spi.scala 291:74:@3801.10]
  wire  _T_305; // @[spi.scala 291:174:@3805.10]
  wire [6:0] _T_307; // @[spi.scala 292:28:@3807.12]
  wire [5:0] _T_308; // @[spi.scala 292:28:@3808.12]
  wire [5:0] _GEN_36; // @[spi.scala 291:238:@3806.10]
  wire [5:0] _GEN_37; // @[spi.scala 289:113:@3788.8]
  wire [5:0] _GEN_38; // @[spi.scala 287:138:@3779.6]
  wire [5:0] _GEN_39; // @[spi.scala 285:99:@3768.4]
  reg  wait_one_tick_done; // @[spi.scala 295:37:@3811.4]
  reg [31:0] _RAND_29;
  wire  _T_329; // @[spi.scala 307:72:@3833.6]
  wire [8:0] _T_336; // @[Cat.scala 30:58:@3838.6]
  wire  _T_349; // @[spi.scala 311:80:@3852.10]
  wire [8:0] _T_356; // @[Cat.scala 30:58:@3857.10]
  wire  _GEN_43; // @[spi.scala 310:32:@3850.8]
  wire [8:0] _GEN_44; // @[spi.scala 310:32:@3850.8]
  wire  _GEN_45; // @[spi.scala 309:114:@3849.6]
  wire [8:0] _GEN_46; // @[spi.scala 309:114:@3849.6]
  wire  _GEN_47; // @[spi.scala 306:37:@3831.4]
  wire [8:0] _GEN_48; // @[spi.scala 306:37:@3831.4]
  wire  _GEN_49; // @[spi.scala 319:39:@3869.6]
  wire  _GEN_50; // @[spi.scala 317:36:@3864.4]
  wire  _T_363; // @[spi.scala 323:12:@3872.4]
  wire  _T_364; // @[spi.scala 323:22:@3873.4]
  wire  _T_365; // @[spi.scala 323:31:@3874.4]
  wire  _T_367; // @[spi.scala 325:24:@3879.6]
  wire  _GEN_51; // @[spi.scala 325:43:@3880.6]
  wire  _GEN_52; // @[spi.scala 323:46:@3875.4]
  wire  _T_372; // @[spi.scala 329:40:@3885.4]
  wire  _GEN_53; // @[spi.scala 330:22:@3887.6]
  wire  _GEN_54; // @[spi.scala 330:22:@3887.6]
  wire  _T_375; // @[spi.scala 335:24:@3895.6]
  wire  _GEN_55; // @[spi.scala 335:39:@3896.6]
  wire  _GEN_56; // @[spi.scala 335:39:@3896.6]
  wire  _GEN_57; // @[spi.scala 329:72:@3886.4]
  wire  _GEN_58; // @[spi.scala 329:72:@3886.4]
  wire  _T_378; // @[spi.scala 340:21:@3900.4]
  wire  _T_379; // @[spi.scala 340:34:@3901.4]
  wire  _GEN_59; // @[spi.scala 340:51:@3902.4]
  assign addr = io_wbs_m2s_addr[7:0]; // @[spi.scala 110:33:@3506.4]
  assign _T_112 = io_wbs_m2s_we == 1'h0; // @[spi.scala 112:19:@3507.4]
  assign rd_en = _T_112 & io_wbs_m2s_stb; // @[spi.scala 112:34:@3508.4]
  assign wr_en = io_wbs_m2s_we & io_wbs_m2s_stb; // @[spi.scala 113:33:@3511.4]
  assign _T_123 = addr == 8'h0; // @[spi.scala 117:32:@3515.4]
  assign sel_reg_rx = _T_123 & io_spi_select; // @[spi.scala 117:54:@3516.4]
  assign _T_124 = addr == 8'h1; // @[spi.scala 118:32:@3517.4]
  assign sel_reg_tx = _T_124 & io_spi_select; // @[spi.scala 118:54:@3518.4]
  assign _T_126 = addr == 8'h3; // @[spi.scala 120:32:@3521.4]
  assign sel_reg_control = _T_126 & io_spi_select; // @[spi.scala 120:55:@3522.4]
  assign _T_127 = addr == 8'h4; // @[spi.scala 121:32:@3523.4]
  assign sel_reg_status = _T_127 & io_spi_select; // @[spi.scala 121:54:@3524.4]
  assign _T_128 = addr == 8'h5; // @[spi.scala 122:32:@3525.4]
  assign sel_reg_ssmask = _T_128 & io_spi_select; // @[spi.scala 122:55:@3526.4]
  assign _GEN_0 = rx_latch_flag ? rx_shift_data : reg_rxdata; // @[spi.scala 125:23:@3527.4]
  assign _T_129 = wr_en & sel_reg_tx; // @[spi.scala 130:14:@3530.4]
  assign _T_130 = _T_129 & bit_trdy; // @[spi.scala 130:28:@3531.4]
  assign spi_wdata = io_wbs_m2s_data[7:0]; // @[:@3485.4 :@3486.4 spi.scala 114:16:@3514.4]
  assign _GEN_1 = _T_130 ? spi_wdata : reg_txdata; // @[spi.scala 130:41:@3532.4]
  assign _T_131 = bit_toe | bit_roe; // @[spi.scala 135:19:@3535.4]
  assign reg_status = {bit_e,bit_rrdy,bit_trdy,bit_tmt,bit_toe,bit_roe,2'h0}; // @[Cat.scala 30:58:@3542.4]
  assign reg_control = {bit_sso,bit_spi_en,bit_ie,bit_irrdy,bit_itrdy,1'h0,bit_itoe,bit_iroe}; // @[Cat.scala 30:58:@3549.4]
  assign _T_145 = wr_en & sel_reg_control; // @[spi.scala 142:14:@3550.4]
  assign _T_146 = spi_wdata[0]; // @[spi.scala 143:28:@3552.6]
  assign _T_147 = spi_wdata[1]; // @[spi.scala 144:28:@3554.6]
  assign _T_148 = spi_wdata[3]; // @[spi.scala 145:28:@3556.6]
  assign _T_149 = spi_wdata[4]; // @[spi.scala 146:28:@3558.6]
  assign _T_150 = spi_wdata[5]; // @[spi.scala 147:28:@3560.6]
  assign _T_151 = spi_wdata[6]; // @[spi.scala 148:28:@3562.6]
  assign _T_152 = spi_wdata[7]; // @[spi.scala 149:28:@3564.6]
  assign _GEN_2 = _T_145 ? _T_146 : bit_iroe; // @[spi.scala 142:34:@3551.4]
  assign _GEN_3 = _T_145 ? _T_147 : bit_itoe; // @[spi.scala 142:34:@3551.4]
  assign _GEN_4 = _T_145 ? _T_148 : bit_itrdy; // @[spi.scala 142:34:@3551.4]
  assign _GEN_5 = _T_145 ? _T_149 : bit_irrdy; // @[spi.scala 142:34:@3551.4]
  assign _GEN_6 = _T_145 ? _T_150 : bit_ie; // @[spi.scala 142:34:@3551.4]
  assign _GEN_7 = _T_145 ? _T_151 : bit_spi_en; // @[spi.scala 142:34:@3551.4]
  assign _GEN_8 = _T_145 ? _T_152 : bit_sso; // @[spi.scala 142:34:@3551.4]
  assign _T_153 = bit_iroe & bit_roe; // @[spi.scala 156:41:@3570.4]
  assign _T_154 = bit_itoe & bit_toe; // @[spi.scala 156:62:@3571.4]
  assign _T_155 = _T_153 | _T_154; // @[spi.scala 156:51:@3572.4]
  assign _T_156 = bit_ie & _T_155; // @[spi.scala 156:29:@3573.4]
  assign _T_157 = bit_itrdy & bit_trdy; // @[spi.scala 156:87:@3574.4]
  assign _T_158 = _T_156 | _T_157; // @[spi.scala 156:74:@3575.4]
  assign _T_159 = bit_irrdy & bit_rrdy; // @[spi.scala 156:112:@3576.4]
  assign _T_163 = io_wbs_m2s_we | read_wait_done; // @[spi.scala 163:39:@3584.6]
  assign _T_164 = io_wbs_m2s_stb & _T_163; // @[spi.scala 163:30:@3585.6]
  assign _GEN_9 = _T_164 ? 1'h1 : ack_o; // @[spi.scala 163:59:@3586.6]
  assign _GEN_10 = ack_o ? 1'h0 : _GEN_9; // @[spi.scala 161:15:@3579.4]
  assign _T_168 = ~ io_wbs_m2s_we; // @[spi.scala 170:35:@3595.6]
  assign _T_169 = io_wbs_m2s_stb & _T_168; // @[spi.scala 170:30:@3596.6]
  assign _GEN_11 = _T_169 ? 1'h1 : read_wait_done; // @[spi.scala 170:43:@3597.6]
  assign _GEN_12 = ack_o ? 1'h0 : _GEN_11; // @[spi.scala 168:15:@3590.4]
  assign _T_182 = n_status == 3'h1; // @[spi.scala 184:27:@3612.6]
  assign _GEN_13 = _T_182 ? 1'h0 : pending_data; // @[spi.scala 184:40:@3613.6]
  assign _GEN_14 = _T_129 ? 1'h1 : _GEN_13; // @[spi.scala 182:32:@3608.4]
  assign _T_188 = sel_reg_ssmask ? {{7'd0}, reg_ssmask} : 8'h0; // @[spi.scala 190:78:@3619.6]
  assign _T_189 = sel_reg_control ? reg_control : _T_188; // @[spi.scala 190:44:@3620.6]
  assign _T_190 = sel_reg_status ? reg_status : _T_189; // @[spi.scala 190:12:@3621.6]
  assign _T_191 = sel_reg_tx ? reg_txdata : _T_190; // @[spi.scala 189:49:@3622.6]
  assign _T_192 = sel_reg_rx ? reg_rxdata : _T_191; // @[spi.scala 189:21:@3623.6]
  assign _GEN_15 = rd_en ? _T_192 : rd_data; // @[spi.scala 188:18:@3616.4]
  assign _T_193 = wr_en & sel_reg_ssmask; // @[spi.scala 194:16:@3627.4]
  assign _GEN_16 = _T_193 ? _T_146 : reg_ssmask; // @[spi.scala 194:35:@3628.4]
  assign _T_196 = n_status == 3'h3; // @[spi.scala 210:21:@3634.4]
  assign _T_198 = clock_cnt == 5'h3; // @[spi.scala 210:49:@3635.4]
  assign _T_199 = _T_196 & _T_198; // @[spi.scala 210:35:@3636.4]
  assign _T_200 = ~ sclk_r; // @[spi.scala 211:18:@3638.6]
  assign _GEN_17 = _T_199 ? _T_200 : sclk_r; // @[spi.scala 210:67:@3637.4]
  assign _T_204 = 1'h0 == sclk_r; // @[spi.scala 217:59:@3644.4]
  assign _T_205 = _T_198 & _T_204; // @[spi.scala 217:39:@3645.4]
  assign _T_207 = _T_205 & _T_196; // @[spi.scala 217:71:@3647.4]
  assign _T_211 = {rx_shift_data,io_spi_miso}; // @[Cat.scala 30:58:@3655.8]
  assign _GEN_19 = _T_207 ? _T_211 : {{1'd0}, rx_shift_data}; // @[spi.scala 217:99:@3648.4]
  assign _T_212 = p_status == 3'h3; // @[spi.scala 226:20:@3659.4]
  assign _T_213 = n_status != 3'h3; // @[spi.scala 226:47:@3660.4]
  assign _T_214 = _T_212 & _T_213; // @[spi.scala 226:34:@3661.4]
  assign _GEN_20 = rx_latch_flag ? 1'h0 : rx_latch_flag; // @[spi.scala 228:33:@3666.6]
  assign _GEN_21 = _T_214 ? 1'h1 : _GEN_20; // @[spi.scala 226:62:@3662.4]
  assign _T_219 = n_status == 3'h0; // @[spi.scala 232:49:@3670.4]
  assign _T_220 = _T_198 | _T_219; // @[spi.scala 232:36:@3671.4]
  assign _T_223 = clock_cnt + 5'h1; // @[spi.scala 235:30:@3676.6]
  assign _T_224 = clock_cnt + 5'h1; // @[spi.scala 235:30:@3677.6]
  assign _GEN_22 = _T_220 ? 5'h0 : _T_224; // @[spi.scala 232:63:@3672.4]
  assign _GEN_23 = pending_data ? 3'h1 : 3'h0; // @[spi.scala 244:26:@3688.6]
  assign _T_237 = n_status == 3'h2; // @[spi.scala 255:27:@3707.8]
  assign _T_241 = data_cnt == 6'h1; // @[spi.scala 256:53:@3710.10]
  assign _T_242 = _T_198 & _T_241; // @[spi.scala 256:40:@3711.10]
  assign _GEN_25 = _T_242 ? 3'h3 : 3'h2; // @[spi.scala 256:76:@3712.10]
  assign _T_246 = data_cnt == 6'h7; // @[spi.scala 262:53:@3723.12]
  assign _T_247 = _T_198 & _T_246; // @[spi.scala 262:40:@3724.12]
  assign _T_250 = _T_247 & sclk_r; // @[spi.scala 262:69:@3726.12]
  assign _GEN_26 = _T_250 ? 3'h4 : 3'h3; // @[spi.scala 262:105:@3727.12]
  assign _T_251 = n_status == 3'h4; // @[spi.scala 267:27:@3735.12]
  assign _GEN_28 = _T_198 ? 3'h5 : n_status; // @[spi.scala 268:39:@3738.14]
  assign _T_255 = n_status == 3'h5; // @[spi.scala 275:27:@3748.14]
  assign _T_259 = data_cnt == 6'h2; // @[spi.scala 276:53:@3751.16]
  assign _T_260 = _T_198 & _T_259; // @[spi.scala 276:40:@3752.16]
  assign _GEN_29 = _T_260 ? 3'h0 : 3'h5; // @[spi.scala 276:77:@3753.16]
  assign _GEN_30 = _T_255 ? _GEN_29 : 3'h0; // @[spi.scala 275:44:@3749.14]
  assign _GEN_31 = _T_251 ? _GEN_28 : _GEN_30; // @[spi.scala 267:46:@3736.12]
  assign _GEN_32 = _T_196 ? _GEN_26 : _GEN_31; // @[spi.scala 261:41:@3721.10]
  assign _GEN_33 = _T_237 ? _GEN_25 : _GEN_32; // @[spi.scala 255:40:@3708.8]
  assign _GEN_34 = _T_182 ? 3'h2 : _GEN_33; // @[spi.scala 249:40:@3697.6]
  assign _GEN_35 = _T_219 ? _GEN_23 : _GEN_34; // @[spi.scala 243:32:@3687.4]
  assign _T_264 = _T_237 & _T_198; // @[spi.scala 285:32:@3765.4]
  assign _T_267 = _T_264 & _T_241; // @[spi.scala 285:63:@3767.4]
  assign _T_274 = _T_199 & _T_246; // @[spi.scala 287:73:@3776.6]
  assign _T_277 = _T_274 & sclk_r; // @[spi.scala 287:102:@3778.6]
  assign _T_282 = _T_255 & _T_198; // @[spi.scala 289:45:@3785.8]
  assign _T_285 = _T_282 & _T_259; // @[spi.scala 289:76:@3787.8]
  assign _T_299 = _T_199 & sclk_r; // @[spi.scala 291:133:@3800.10]
  assign _T_300 = _T_264 | _T_299; // @[spi.scala 291:74:@3801.10]
  assign _T_305 = _T_300 | _T_282; // @[spi.scala 291:174:@3805.10]
  assign _T_307 = data_cnt + 6'h1; // @[spi.scala 292:28:@3807.12]
  assign _T_308 = data_cnt + 6'h1; // @[spi.scala 292:28:@3808.12]
  assign _GEN_36 = _T_305 ? _T_308 : data_cnt; // @[spi.scala 291:238:@3806.10]
  assign _GEN_37 = _T_285 ? 6'h0 : _GEN_36; // @[spi.scala 289:113:@3788.8]
  assign _GEN_38 = _T_277 ? 6'h0 : _GEN_37; // @[spi.scala 287:138:@3779.6]
  assign _GEN_39 = _T_267 ? 6'h0 : _GEN_38; // @[spi.scala 285:99:@3768.4]
  assign _T_329 = reg_txdata[7]; // @[spi.scala 307:72:@3833.6]
  assign _T_336 = {reg_txdata,1'h0}; // @[Cat.scala 30:58:@3838.6]
  assign _T_349 = tx_shift_data[7]; // @[spi.scala 311:80:@3852.10]
  assign _T_356 = {tx_shift_data,1'h0}; // @[Cat.scala 30:58:@3857.10]
  assign _GEN_43 = wait_one_tick_done ? _T_349 : mosi_r; // @[spi.scala 310:32:@3850.8]
  assign _GEN_44 = wait_one_tick_done ? _T_356 : {{1'd0}, tx_shift_data}; // @[spi.scala 310:32:@3850.8]
  assign _GEN_45 = _T_299 ? _GEN_43 : mosi_r; // @[spi.scala 309:114:@3849.6]
  assign _GEN_46 = _T_299 ? _GEN_44 : {{1'd0}, tx_shift_data}; // @[spi.scala 309:114:@3849.6]
  assign _GEN_47 = _T_237 ? _T_329 : _GEN_45; // @[spi.scala 306:37:@3831.4]
  assign _GEN_48 = _T_237 ? _T_336 : _GEN_46; // @[spi.scala 306:37:@3831.4]
  assign _GEN_49 = _T_129 ? 1'h0 : bit_trdy; // @[spi.scala 319:39:@3869.6]
  assign _GEN_50 = _T_196 ? 1'h1 : _GEN_49; // @[spi.scala 317:36:@3864.4]
  assign _T_363 = bit_trdy == 1'h0; // @[spi.scala 323:12:@3872.4]
  assign _T_364 = _T_363 & wr_en; // @[spi.scala 323:22:@3873.4]
  assign _T_365 = _T_364 & sel_reg_tx; // @[spi.scala 323:31:@3874.4]
  assign _T_367 = wr_en & sel_reg_status; // @[spi.scala 325:24:@3879.6]
  assign _GEN_51 = _T_367 ? 1'h0 : bit_toe; // @[spi.scala 325:43:@3880.6]
  assign _GEN_52 = _T_365 ? 1'h1 : _GEN_51; // @[spi.scala 323:46:@3875.4]
  assign _T_372 = _T_251 & _T_198; // @[spi.scala 329:40:@3885.4]
  assign _GEN_53 = bit_rrdy ? 1'h1 : bit_roe; // @[spi.scala 330:22:@3887.6]
  assign _GEN_54 = bit_rrdy ? bit_rrdy : 1'h1; // @[spi.scala 330:22:@3887.6]
  assign _T_375 = rd_en & sel_reg_rx; // @[spi.scala 335:24:@3895.6]
  assign _GEN_55 = _T_375 ? 1'h0 : bit_rrdy; // @[spi.scala 335:39:@3896.6]
  assign _GEN_56 = _T_375 ? 1'h0 : bit_roe; // @[spi.scala 335:39:@3896.6]
  assign _GEN_57 = _T_372 ? _GEN_53 : _GEN_56; // @[spi.scala 329:72:@3886.4]
  assign _GEN_58 = _T_372 ? _GEN_54 : _GEN_55; // @[spi.scala 329:72:@3886.4]
  assign _T_378 = n_status != 3'h0; // @[spi.scala 340:21:@3900.4]
  assign _T_379 = _T_378 | pending_data; // @[spi.scala 340:34:@3901.4]
  assign _GEN_59 = _T_379 ? 1'h0 : 1'h1; // @[spi.scala 340:51:@3902.4]
  assign io_spi_cs = ~ reg_ssmask; // @[spi.scala 207:13:@3633.4]
  assign io_spi_clk = sclk_r; // @[spi.scala 213:16:@3641.4]
  assign io_spi_mosi = mosi_r; // @[spi.scala 315:15:@3862.4]
  assign io_spi_cs_en = bit_spi_en; // @[spi.scala 153:18:@3567.4]
  assign io_spi_clk_en = bit_spi_en; // @[spi.scala 155:18:@3569.4]
  assign io_spi_mosi_en = bit_spi_en; // @[spi.scala 154:18:@3568.4]
  assign io_spi_intr = _T_158 | _T_159; // @[spi.scala 156:18:@3578.4]
  assign io_wbs_ack_o = ack_o; // @[spi.scala 166:15:@3589.4]
  assign io_wbs_data_o = {{24'd0}, rd_data}; // @[spi.scala 192:18:@3626.4]
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
module WB_InterConnect( // @[:@3909.2]
  input         clock, // @[:@3910.4]
  input         reset, // @[:@3911.4]
  input  [31:0] io_dbus_addr, // @[:@3912.4]
  input  [31:0] io_dbus_wdata, // @[:@3912.4]
  output [31:0] io_dbus_rdata, // @[:@3912.4]
  input         io_dbus_rd_en, // @[:@3912.4]
  input         io_dbus_wr_en, // @[:@3912.4]
  input  [1:0]  io_dbus_st_type, // @[:@3912.4]
  input  [2:0]  io_dbus_ld_type, // @[:@3912.4]
  output        io_dbus_valid, // @[:@3912.4]
  input  [31:0] io_ibus_addr, // @[:@3912.4]
  output [31:0] io_ibus_inst, // @[:@3912.4]
  output        io_ibus_valid, // @[:@3912.4]
  output [8:0]  io_imem_io_addr, // @[:@3912.4]
  input  [31:0] io_imem_io_rdata, // @[:@3912.4]
  output [31:0] io_imem_io_wdata, // @[:@3912.4]
  output        io_imem_io_wr_en, // @[:@3912.4]
  output        io_imem_io_cs, // @[:@3912.4]
  output [3:0]  io_imem_io_st_type, // @[:@3912.4]
  output [8:0]  io_dmem_io_addr, // @[:@3912.4]
  output [31:0] io_dmem_io_wdata, // @[:@3912.4]
  input  [31:0] io_dmem_io_rdata, // @[:@3912.4]
  output        io_dmem_io_cs, // @[:@3912.4]
  output        io_dmem_io_wr_en, // @[:@3912.4]
  output [3:0]  io_dmem_io_st_type, // @[:@3912.4]
  output [15:0] io_wbm_m2s_addr, // @[:@3912.4]
  output [31:0] io_wbm_m2s_data, // @[:@3912.4]
  output        io_wbm_m2s_we, // @[:@3912.4]
  output [3:0]  io_wbm_m2s_sel, // @[:@3912.4]
  output        io_wbm_m2s_stb, // @[:@3912.4]
  output        io_uart_tx, // @[:@3912.4]
  output        io_uart_tx_en, // @[:@3912.4]
  input         io_uart_rx, // @[:@3912.4]
  output        io_uart_irq, // @[:@3912.4]
  output        io_spi_cs, // @[:@3912.4]
  output        io_spi_clk, // @[:@3912.4]
  output        io_spi_mosi, // @[:@3912.4]
  input         io_spi_miso, // @[:@3912.4]
  output        io_spi_irq, // @[:@3912.4]
  output        io_spi_cs_en, // @[:@3912.4]
  output        io_spi_clk_en, // @[:@3912.4]
  output        io_spi_mosi_en, // @[:@3912.4]
  input         io_m1_ack_i, // @[:@3912.4]
  input  [31:0] io_m1_data_i, // @[:@3912.4]
  output        io_m1_addr_sel, // @[:@3912.4]
  input         io_m2_ack_i, // @[:@3912.4]
  input  [31:0] io_m2_data_i, // @[:@3912.4]
  output        io_m2_addr_sel, // @[:@3912.4]
  input         io_m3_ack_i, // @[:@3912.4]
  input  [31:0] io_m3_data_i, // @[:@3912.4]
  output        io_m3_addr_sel // @[:@3912.4]
);
  wire  dmem_clock; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_reset; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [15:0] dmem_io_wbs_m2s_addr; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [31:0] dmem_io_wbs_m2s_data; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_io_wbs_m2s_we; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [3:0] dmem_io_wbs_m2s_sel; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_io_wbs_m2s_stb; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_io_wbs_ack_o; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [31:0] dmem_io_wbs_data_o; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [8:0] dmem_io_dmem_io_addr; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [31:0] dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [31:0] dmem_io_dmem_io_rdata; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_io_dmem_io_cs; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 87:24:@3914.4]
  wire [3:0] dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 87:24:@3914.4]
  wire  imem_clock; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_reset; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_ibus_addr; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_ibus_inst; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_ibus_valid; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [15:0] imem_io_wbs_m2s_addr; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_wbs_m2s_data; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_wbs_m2s_we; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [3:0] imem_io_wbs_m2s_sel; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_wbs_m2s_stb; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_wbs_ack_o; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_wbs_data_o; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [8:0] imem_io_imem_io_addr; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_imem_io_rdata; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] imem_io_imem_io_wdata; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_imem_io_wr_en; // @[wb_interconnect.scala 88:24:@3917.4]
  wire  imem_io_imem_io_cs; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [3:0] imem_io_imem_io_st_type; // @[wb_interconnect.scala 88:24:@3917.4]
  wire [31:0] wbm_dbus_io_dbus_addr; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [31:0] wbm_dbus_io_dbus_wdata; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [31:0] wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_dbus_rd_en; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_dbus_wr_en; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [1:0] wbm_dbus_io_dbus_st_type; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [2:0] wbm_dbus_io_dbus_ld_type; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [15:0] wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [31:0] wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [3:0] wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  wbm_dbus_io_wbm_ack_i; // @[wb_interconnect.scala 89:24:@3920.4]
  wire [31:0] wbm_dbus_io_wbm_data_i; // @[wb_interconnect.scala 89:24:@3920.4]
  wire  uart_clock; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_reset; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_uart_select; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_txd; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_tx_en; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_rxd; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_uartInt; // @[wb_interconnect.scala 90:24:@3923.4]
  wire [15:0] uart_io_wbs_m2s_addr; // @[wb_interconnect.scala 90:24:@3923.4]
  wire [31:0] uart_io_wbs_m2s_data; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_wbs_m2s_we; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_wbs_m2s_stb; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  uart_io_wbs_ack_o; // @[wb_interconnect.scala 90:24:@3923.4]
  wire [31:0] uart_io_wbs_data_o; // @[wb_interconnect.scala 90:24:@3923.4]
  wire  spi_clock; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_reset; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_select; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_cs; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_clk; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_mosi; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_cs_en; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_clk_en; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_mosi_en; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_miso; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_spi_intr; // @[wb_interconnect.scala 91:24:@3926.4]
  wire [15:0] spi_io_wbs_m2s_addr; // @[wb_interconnect.scala 91:24:@3926.4]
  wire [31:0] spi_io_wbs_m2s_data; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_wbs_m2s_we; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_wbs_m2s_stb; // @[wb_interconnect.scala 91:24:@3926.4]
  wire  spi_io_wbs_ack_o; // @[wb_interconnect.scala 91:24:@3926.4]
  wire [31:0] spi_io_wbs_data_o; // @[wb_interconnect.scala 91:24:@3926.4]
  wire [3:0] address; // @[wb_interconnect.scala 101:50:@3952.4]
  wire  imem_addr_match; // @[wb_interconnect.scala 102:35:@3953.4]
  wire  dmem_addr_match; // @[wb_interconnect.scala 103:35:@3954.4]
  wire  uart_addr_match; // @[wb_interconnect.scala 104:35:@3955.4]
  wire  spi_addr_match; // @[wb_interconnect.scala 105:35:@3956.4]
  wire  m1_addr_match; // @[wb_interconnect.scala 106:35:@3957.4]
  wire  m2_addr_match; // @[wb_interconnect.scala 107:35:@3958.4]
  wire  m3_addr_match; // @[wb_interconnect.scala 108:35:@3959.4]
  reg  imem_sel; // @[wb_interconnect.scala 134:22:@3993.4]
  reg [31:0] _RAND_0;
  reg  dmem_sel; // @[wb_interconnect.scala 135:22:@3994.4]
  reg [31:0] _RAND_1;
  reg  uart_sel; // @[wb_interconnect.scala 136:22:@3995.4]
  reg [31:0] _RAND_2;
  reg  spi_sel; // @[wb_interconnect.scala 137:22:@3996.4]
  reg [31:0] _RAND_3;
  reg  m1_sel; // @[wb_interconnect.scala 138:22:@3997.4]
  reg [31:0] _RAND_4;
  reg  m2_sel; // @[wb_interconnect.scala 139:22:@3998.4]
  reg [31:0] _RAND_5;
  reg  m3_sel; // @[wb_interconnect.scala 140:22:@3999.4]
  reg [31:0] _RAND_6;
  wire [31:0] _T_120; // @[wb_interconnect.scala 156:45:@4014.4]
  wire [31:0] _T_121; // @[wb_interconnect.scala 155:43:@4015.4]
  wire [31:0] _T_122; // @[wb_interconnect.scala 154:41:@4016.4]
  wire [31:0] _T_123; // @[wb_interconnect.scala 153:39:@4017.4]
  wire [31:0] _T_124; // @[wb_interconnect.scala 152:37:@4018.4]
  wire [31:0] _T_125; // @[wb_interconnect.scala 151:35:@4019.4]
  wire  _T_128; // @[wb_interconnect.scala 164:45:@4022.4]
  wire  _T_129; // @[wb_interconnect.scala 163:43:@4023.4]
  wire  _T_130; // @[wb_interconnect.scala 162:41:@4024.4]
  wire  _T_131; // @[wb_interconnect.scala 161:39:@4025.4]
  wire  _T_132; // @[wb_interconnect.scala 160:37:@4026.4]
  wire  _T_133; // @[wb_interconnect.scala 159:35:@4027.4]
  DMem_Interface dmem ( // @[wb_interconnect.scala 87:24:@3914.4]
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
  IMem_Interface imem ( // @[wb_interconnect.scala 88:24:@3917.4]
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
  WBM_DBus wbm_dbus ( // @[wb_interconnect.scala 89:24:@3920.4]
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
  UART uart ( // @[wb_interconnect.scala 90:24:@3923.4]
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
  SPI spi ( // @[wb_interconnect.scala 91:24:@3926.4]
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
  assign address = wbm_dbus_io_wbm_m2s_addr[15:12]; // @[wb_interconnect.scala 101:50:@3952.4]
  assign imem_addr_match = address == 4'h0; // @[wb_interconnect.scala 102:35:@3953.4]
  assign dmem_addr_match = address == 4'h1; // @[wb_interconnect.scala 103:35:@3954.4]
  assign uart_addr_match = address == 4'h2; // @[wb_interconnect.scala 104:35:@3955.4]
  assign spi_addr_match = address == 4'h3; // @[wb_interconnect.scala 105:35:@3956.4]
  assign m1_addr_match = address == 4'h4; // @[wb_interconnect.scala 106:35:@3957.4]
  assign m2_addr_match = address == 4'h5; // @[wb_interconnect.scala 107:35:@3958.4]
  assign m3_addr_match = address == 4'h6; // @[wb_interconnect.scala 108:35:@3959.4]
  assign _T_120 = m3_sel ? io_m3_data_i : 32'h0; // @[wb_interconnect.scala 156:45:@4014.4]
  assign _T_121 = m2_sel ? io_m2_data_i : _T_120; // @[wb_interconnect.scala 155:43:@4015.4]
  assign _T_122 = m1_sel ? io_m1_data_i : _T_121; // @[wb_interconnect.scala 154:41:@4016.4]
  assign _T_123 = spi_sel ? spi_io_wbs_data_o : _T_122; // @[wb_interconnect.scala 153:39:@4017.4]
  assign _T_124 = uart_sel ? uart_io_wbs_data_o : _T_123; // @[wb_interconnect.scala 152:37:@4018.4]
  assign _T_125 = imem_sel ? imem_io_wbs_data_o : _T_124; // @[wb_interconnect.scala 151:35:@4019.4]
  assign _T_128 = m3_sel ? io_m3_ack_i : 1'h0; // @[wb_interconnect.scala 164:45:@4022.4]
  assign _T_129 = m2_sel ? io_m2_ack_i : _T_128; // @[wb_interconnect.scala 163:43:@4023.4]
  assign _T_130 = m1_sel ? io_m1_ack_i : _T_129; // @[wb_interconnect.scala 162:41:@4024.4]
  assign _T_131 = spi_sel ? spi_io_wbs_ack_o : _T_130; // @[wb_interconnect.scala 161:39:@4025.4]
  assign _T_132 = uart_sel ? uart_io_wbs_ack_o : _T_131; // @[wb_interconnect.scala 160:37:@4026.4]
  assign _T_133 = imem_sel ? imem_io_wbs_ack_o : _T_132; // @[wb_interconnect.scala 159:35:@4027.4]
  assign io_dbus_rdata = wbm_dbus_io_dbus_rdata; // @[wb_interconnect.scala 94:20:@3934.4]
  assign io_dbus_valid = wbm_dbus_io_dbus_valid; // @[wb_interconnect.scala 94:20:@3929.4]
  assign io_ibus_inst = imem_io_ibus_inst; // @[wb_interconnect.scala 95:20:@3938.4]
  assign io_ibus_valid = imem_io_ibus_valid; // @[wb_interconnect.scala 95:20:@3937.4]
  assign io_imem_io_addr = imem_io_imem_io_addr; // @[wb_interconnect.scala 97:20:@3945.4]
  assign io_imem_io_wdata = imem_io_imem_io_wdata; // @[wb_interconnect.scala 97:20:@3943.4]
  assign io_imem_io_wr_en = imem_io_imem_io_wr_en; // @[wb_interconnect.scala 97:20:@3942.4]
  assign io_imem_io_cs = imem_io_imem_io_cs; // @[wb_interconnect.scala 97:20:@3941.4]
  assign io_imem_io_st_type = imem_io_imem_io_st_type; // @[wb_interconnect.scala 97:20:@3940.4]
  assign io_dmem_io_addr = dmem_io_dmem_io_addr; // @[wb_interconnect.scala 98:20:@3951.4]
  assign io_dmem_io_wdata = dmem_io_dmem_io_wdata; // @[wb_interconnect.scala 98:20:@3950.4]
  assign io_dmem_io_cs = dmem_io_dmem_io_cs; // @[wb_interconnect.scala 98:20:@3948.4]
  assign io_dmem_io_wr_en = dmem_io_dmem_io_wr_en; // @[wb_interconnect.scala 98:20:@3947.4]
  assign io_dmem_io_st_type = dmem_io_dmem_io_st_type; // @[wb_interconnect.scala 98:20:@3946.4]
  assign io_wbm_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 131:14:@3992.4]
  assign io_wbm_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 131:14:@3991.4]
  assign io_wbm_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 131:14:@3990.4]
  assign io_wbm_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 131:14:@3989.4]
  assign io_wbm_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 131:14:@3988.4]
  assign io_uart_tx = uart_io_txd; // @[wb_interconnect.scala 170:24:@4032.4]
  assign io_uart_tx_en = uart_io_tx_en; // @[wb_interconnect.scala 171:24:@4033.4]
  assign io_uart_irq = uart_io_uartInt; // @[wb_interconnect.scala 172:24:@4034.4]
  assign io_spi_cs = spi_io_spi_cs; // @[wb_interconnect.scala 177:24:@4037.4]
  assign io_spi_clk = spi_io_spi_clk; // @[wb_interconnect.scala 178:24:@4038.4]
  assign io_spi_mosi = spi_io_spi_mosi; // @[wb_interconnect.scala 179:24:@4039.4]
  assign io_spi_irq = spi_io_spi_intr; // @[wb_interconnect.scala 180:24:@4040.4]
  assign io_spi_cs_en = spi_io_spi_cs_en; // @[wb_interconnect.scala 182:24:@4041.4]
  assign io_spi_clk_en = spi_io_spi_clk_en; // @[wb_interconnect.scala 183:24:@4042.4]
  assign io_spi_mosi_en = spi_io_spi_mosi_en; // @[wb_interconnect.scala 184:24:@4043.4]
  assign io_m1_addr_sel = address == 4'h4; // @[wb_interconnect.scala 111:18:@3960.4]
  assign io_m2_addr_sel = address == 4'h5; // @[wb_interconnect.scala 112:18:@3961.4]
  assign io_m3_addr_sel = address == 4'h6; // @[wb_interconnect.scala 113:18:@3962.4]
  assign dmem_clock = clock; // @[:@3915.4]
  assign dmem_reset = reset; // @[:@3916.4]
  assign dmem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 117:20:@3968.4]
  assign dmem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 117:20:@3967.4]
  assign dmem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 117:20:@3966.4]
  assign dmem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 117:20:@3965.4]
  assign dmem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 117:20:@3964.4]
  assign dmem_io_dmem_io_rdata = io_dmem_io_rdata; // @[wb_interconnect.scala 98:20:@3949.4]
  assign imem_clock = clock; // @[:@3918.4]
  assign imem_reset = reset; // @[:@3919.4]
  assign imem_io_ibus_addr = io_ibus_addr; // @[wb_interconnect.scala 95:20:@3939.4]
  assign imem_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 121:20:@3974.4]
  assign imem_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 121:20:@3973.4]
  assign imem_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 121:20:@3972.4]
  assign imem_io_wbs_m2s_sel = wbm_dbus_io_wbm_m2s_sel; // @[wb_interconnect.scala 121:20:@3971.4]
  assign imem_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 121:20:@3970.4]
  assign imem_io_imem_io_rdata = io_imem_io_rdata; // @[wb_interconnect.scala 97:20:@3944.4]
  assign wbm_dbus_io_dbus_addr = io_dbus_addr; // @[wb_interconnect.scala 94:20:@3936.4]
  assign wbm_dbus_io_dbus_wdata = io_dbus_wdata; // @[wb_interconnect.scala 94:20:@3935.4]
  assign wbm_dbus_io_dbus_rd_en = io_dbus_rd_en; // @[wb_interconnect.scala 94:20:@3933.4]
  assign wbm_dbus_io_dbus_wr_en = io_dbus_wr_en; // @[wb_interconnect.scala 94:20:@3932.4]
  assign wbm_dbus_io_dbus_st_type = io_dbus_st_type; // @[wb_interconnect.scala 94:20:@3931.4]
  assign wbm_dbus_io_dbus_ld_type = io_dbus_ld_type; // @[wb_interconnect.scala 94:20:@3930.4]
  assign wbm_dbus_io_wbm_ack_i = dmem_sel ? dmem_io_wbs_ack_o : _T_133; // @[wb_interconnect.scala 158:26:@4029.4]
  assign wbm_dbus_io_wbm_data_i = dmem_sel ? dmem_io_wbs_data_o : _T_125; // @[wb_interconnect.scala 150:26:@4021.4]
  assign uart_clock = clock; // @[:@3924.4]
  assign uart_reset = reset; // @[:@3925.4]
  assign uart_io_uart_select = address == 4'h2; // @[wb_interconnect.scala 168:24:@4030.4]
  assign uart_io_rxd = io_uart_rx; // @[wb_interconnect.scala 169:24:@4031.4]
  assign uart_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 124:20:@3980.4]
  assign uart_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 124:20:@3979.4]
  assign uart_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 124:20:@3978.4]
  assign uart_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 124:20:@3976.4]
  assign spi_clock = clock; // @[:@3927.4]
  assign spi_reset = reset; // @[:@3928.4]
  assign spi_io_spi_select = address == 4'h3; // @[wb_interconnect.scala 175:24:@4035.4]
  assign spi_io_spi_miso = io_spi_miso; // @[wb_interconnect.scala 176:24:@4036.4]
  assign spi_io_wbs_m2s_addr = wbm_dbus_io_wbm_m2s_addr; // @[wb_interconnect.scala 127:19:@3986.4]
  assign spi_io_wbs_m2s_data = wbm_dbus_io_wbm_m2s_data; // @[wb_interconnect.scala 127:19:@3985.4]
  assign spi_io_wbs_m2s_we = wbm_dbus_io_wbm_m2s_we; // @[wb_interconnect.scala 127:19:@3984.4]
  assign spi_io_wbs_m2s_stb = wbm_dbus_io_wbm_m2s_stb; // @[wb_interconnect.scala 127:19:@3982.4]
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