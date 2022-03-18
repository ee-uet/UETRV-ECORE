module DMem_Interface( // @[:@1941.2]
  input         clock, // @[:@1942.4]
  input         reset, // @[:@1943.4]
  input  [15:0] io_wbs_m2s_addr, // @[:@1944.4]
  input  [31:0] io_wbs_m2s_data, // @[:@1944.4]
  input         io_wbs_m2s_we, // @[:@1944.4]
  input  [3:0]  io_wbs_m2s_sel, // @[:@1944.4]
  input         io_wbs_m2s_stb, // @[:@1944.4]
  output        io_wbs_ack_o, // @[:@1944.4]
  output [31:0] io_wbs_data_o // @[:@1944.4]
);
  wire  dmem_clock; // @[dmem_interface.scala 35:20:@1946.4]
  wire [7:0] dmem_io_dmem_addr; // @[dmem_interface.scala 35:20:@1946.4]
  wire [31:0] dmem_io_dmem_wdata; // @[dmem_interface.scala 35:20:@1946.4]
  wire [31:0] dmem_io_dmem_rdata; // @[dmem_interface.scala 35:20:@1946.4]
  wire  dmem_io_wr_en; // @[dmem_interface.scala 35:20:@1946.4]
  wire [3:0] dmem_io_st_type; // @[dmem_interface.scala 35:20:@1946.4]
  wire [3:0] _T_35; // @[dmem_interface.scala 37:41:@1949.4]
  wire  dmem_addr_match; // @[dmem_interface.scala 37:79:@1950.4]
  wire  dmem_select; // @[dmem_interface.scala 39:41:@1951.4]
  wire  _T_42; // @[dmem_interface.scala 40:26:@1952.4]
  reg  ack2; // @[dmem_interface.scala 48:28:@1960.4]
  reg [31:0] _RAND_0;
  wire  dmem_res_en; // @[dmem_interface.scala 49:49:@1962.4]
  wire  _GEN_0; // @[dmem_interface.scala 51:21:@1963.4]
  reg  ack; // @[dmem_interface.scala 55:28:@1967.4]
  reg [31:0] _RAND_1;
  reg  rd_resp; // @[dmem_interface.scala 60:24:@1972.4]
  reg [31:0] _RAND_2;
  DMem dmem ( // @[dmem_interface.scala 35:20:@1946.4]
    .clock(dmem_clock),
    .io_dmem_addr(dmem_io_dmem_addr),
    .io_dmem_wdata(dmem_io_dmem_wdata),
    .io_dmem_rdata(dmem_io_dmem_rdata),
    .io_wr_en(dmem_io_wr_en),
    .io_st_type(dmem_io_st_type)
  );
  assign _T_35 = io_wbs_m2s_addr[15:12]; // @[dmem_interface.scala 37:41:@1949.4]
  assign dmem_addr_match = _T_35 == 4'h1; // @[dmem_interface.scala 37:79:@1950.4]
  assign dmem_select = io_wbs_m2s_stb & dmem_addr_match; // @[dmem_interface.scala 39:41:@1951.4]
  assign _T_42 = io_wbs_m2s_we == 1'h0; // @[dmem_interface.scala 40:26:@1952.4]
  assign dmem_res_en = ack2 ^ io_wbs_m2s_stb; // @[dmem_interface.scala 49:49:@1962.4]
  assign _GEN_0 = dmem_res_en ? io_wbs_m2s_stb : ack2; // @[dmem_interface.scala 51:21:@1963.4]
  assign io_wbs_ack_o = ack | ack2; // @[dmem_interface.scala 57:18:@1971.4]
  assign io_wbs_data_o = rd_resp ? dmem_io_dmem_rdata : 32'h0; // @[dmem_interface.scala 62:18:@1975.4]
  assign dmem_clock = clock; // @[:@1947.4]
  assign dmem_io_dmem_addr = io_wbs_m2s_addr[7:0]; // @[dmem_interface.scala 42:23:@1955.4]
  assign dmem_io_dmem_wdata = io_wbs_m2s_data; // @[dmem_interface.scala 43:23:@1956.4]
  assign dmem_io_wr_en = io_wbs_m2s_we & dmem_select; // @[dmem_interface.scala 44:23:@1958.4]
  assign dmem_io_st_type = io_wbs_m2s_sel; // @[dmem_interface.scala 45:23:@1959.4]
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
    rd_resp <= _T_42 & dmem_select;
  end
endmodule


module DMem( // @[:@1882.2]
  input         clock, // @[:@1883.4]
  input  [7:0]  io_dmem_addr, // @[:@1885.4]
  input  [31:0] io_dmem_wdata, // @[:@1885.4]
  output [31:0] io_dmem_rdata, // @[:@1885.4]
  input         io_wr_en, // @[:@1885.4]
  input  [3:0]  io_st_type // @[:@1885.4]
);
  reg [7:0] dmem [0:255]; // @[memory.scala 78:26:@1887.4]
  reg [31:0] _RAND_0;
  wire [7:0] dmem__T_46_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_46_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_50_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_50_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_54_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_54_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_55_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_55_addr; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_19_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_19_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_19_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_19_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_26_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_26_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_26_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_26_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_33_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_33_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_33_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_33_en; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_40_data; // @[memory.scala 78:26:@1887.4]
  wire [7:0] dmem__T_40_addr; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_40_mask; // @[memory.scala 78:26:@1887.4]
  wire  dmem__T_40_en; // @[memory.scala 78:26:@1887.4]
  wire  _T_17; // @[memory.scala 86:18:@1889.6]
  wire  _GEN_3; // @[memory.scala 86:30:@1891.6]
  wire  _T_21; // @[memory.scala 89:18:@1896.6]
  wire [8:0] _T_24; // @[memory.scala 90:17:@1899.8]
  wire [7:0] _T_25; // @[memory.scala 90:17:@1900.8]
  wire  _T_28; // @[memory.scala 92:18:@1905.6]
  wire [8:0] _T_31; // @[memory.scala 93:17:@1908.8]
  wire [7:0] _T_32; // @[memory.scala 93:17:@1909.8]
  wire  _T_35; // @[memory.scala 95:18:@1914.6]
  wire [8:0] _T_38; // @[memory.scala 96:17:@1917.8]
  wire [7:0] _T_39; // @[memory.scala 96:17:@1918.8]
  wire [15:0] _T_56; // @[Cat.scala 30:58:@1935.4]
  wire [15:0] _T_57; // @[Cat.scala 30:58:@1936.4]
  reg [7:0] dmem__T_46_addr_pipe_0;
  reg [31:0] _RAND_1;
  reg [7:0] dmem__T_50_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg [7:0] dmem__T_54_addr_pipe_0;
  reg [31:0] _RAND_3;
  reg [7:0] dmem__T_55_addr_pipe_0;
  reg [31:0] _RAND_4;
  assign dmem__T_46_addr = dmem__T_46_addr_pipe_0;
  assign dmem__T_46_data = dmem[dmem__T_46_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_50_addr = dmem__T_50_addr_pipe_0;
  assign dmem__T_50_data = dmem[dmem__T_50_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_54_addr = dmem__T_54_addr_pipe_0;
  assign dmem__T_54_data = dmem[dmem__T_54_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_55_addr = dmem__T_55_addr_pipe_0;
  assign dmem__T_55_data = dmem[dmem__T_55_addr]; // @[memory.scala 78:26:@1887.4]
  assign dmem__T_19_data = io_dmem_wdata[7:0];
  assign dmem__T_19_addr = io_dmem_addr;
  assign dmem__T_19_mask = 1'h1;
  assign dmem__T_19_en = io_wr_en ? _T_17 : 1'h0;
  assign dmem__T_26_data = io_dmem_wdata[15:8];
  assign dmem__T_26_addr = io_dmem_addr + 8'h1;
  assign dmem__T_26_mask = 1'h1;
  assign dmem__T_26_en = io_wr_en ? _T_21 : 1'h0;
  assign dmem__T_33_data = io_dmem_wdata[23:16];
  assign dmem__T_33_addr = io_dmem_addr + 8'h2;
  assign dmem__T_33_mask = 1'h1;
  assign dmem__T_33_en = io_wr_en ? _T_28 : 1'h0;
  assign dmem__T_40_data = io_dmem_wdata[31:24];
  assign dmem__T_40_addr = io_dmem_addr + 8'h3;
  assign dmem__T_40_mask = 1'h1;
  assign dmem__T_40_en = io_wr_en ? _T_35 : 1'h0;
  assign _T_17 = io_st_type[0]; // @[memory.scala 86:18:@1889.6]
  assign _GEN_3 = 1'h1; // @[memory.scala 86:30:@1891.6]
  assign _T_21 = io_st_type[1]; // @[memory.scala 89:18:@1896.6]
  assign _T_24 = io_dmem_addr + 8'h1; // @[memory.scala 90:17:@1899.8]
  assign _T_25 = io_dmem_addr + 8'h1; // @[memory.scala 90:17:@1900.8]
  assign _T_28 = io_st_type[2]; // @[memory.scala 92:18:@1905.6]
  assign _T_31 = io_dmem_addr + 8'h2; // @[memory.scala 93:17:@1908.8]
  assign _T_32 = io_dmem_addr + 8'h2; // @[memory.scala 93:17:@1909.8]
  assign _T_35 = io_st_type[3]; // @[memory.scala 95:18:@1914.6]
  assign _T_38 = io_dmem_addr + 8'h3; // @[memory.scala 96:17:@1917.8]
  assign _T_39 = io_dmem_addr + 8'h3; // @[memory.scala 96:17:@1918.8]
  assign _T_56 = {dmem__T_54_data,dmem__T_55_data}; // @[Cat.scala 30:58:@1935.4]
  assign _T_57 = {dmem__T_46_data,dmem__T_50_data}; // @[Cat.scala 30:58:@1936.4]
  assign io_dmem_rdata = {_T_57,_T_56}; // @[memory.scala 103:17:@1939.4]
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
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dmem[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dmem__T_46_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dmem__T_50_addr_pipe_0 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  dmem__T_54_addr_pipe_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dmem__T_55_addr_pipe_0 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(dmem__T_19_en & dmem__T_19_mask) begin
      dmem[dmem__T_19_addr] <= dmem__T_19_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_26_en & dmem__T_26_mask) begin
      dmem[dmem__T_26_addr] <= dmem__T_26_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_33_en & dmem__T_33_mask) begin
      dmem[dmem__T_33_addr] <= dmem__T_33_data; // @[memory.scala 78:26:@1887.4]
    end
    if(dmem__T_40_en & dmem__T_40_mask) begin
      dmem[dmem__T_40_addr] <= dmem__T_40_data; // @[memory.scala 78:26:@1887.4]
    end
    if (_GEN_3) begin
      dmem__T_46_addr_pipe_0 <= _T_39;
    end
    if (_GEN_3) begin
      dmem__T_50_addr_pipe_0 <= _T_32;
    end
    if (_GEN_3) begin
      dmem__T_54_addr_pipe_0 <= _T_25;
    end
    if (_GEN_3) begin
      dmem__T_55_addr_pipe_0 <= io_dmem_addr;
    end
  end
endmodule
