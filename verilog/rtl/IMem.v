module IMem( // @[:@12666.2]
  input         clock, // @[:@12667.4]
  input  [8:0]  io_addr, // @[:@12669.4]
  output [31:0] io_rdata, // @[:@12669.4]
  input  [31:0] io_wdata, // @[:@12669.4]
  input         io_wr_en, // @[:@12669.4]
  input         io_cs // @[:@12669.4]
);
  reg [31:0] imem [0:2047]; // @[imemory.scala 26:25:@12671.4]
  reg [31:0] _RAND_0;
  wire [31:0] imem__T_37_data; // @[imemory.scala 26:25:@12671.4]
  wire [10:0] imem__T_37_addr; // @[imemory.scala 26:25:@12671.4]
  wire [31:0] imem__T_36_data; // @[imemory.scala 26:25:@12671.4]
  wire [10:0] imem__T_36_addr; // @[imemory.scala 26:25:@12671.4]
  wire  imem__T_36_mask; // @[imemory.scala 26:25:@12671.4]
  wire  imem__T_36_en; // @[imemory.scala 26:25:@12671.4]
  wire  _GEN_3; // @[imemory.scala 41:17:@12674.4]
  wire [10:0] _GEN_6;
  reg [10:0] imem__T_37_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign imem__T_37_addr = imem__T_37_addr_pipe_0;
  assign imem__T_37_data = imem[imem__T_37_addr]; // @[imemory.scala 26:25:@12671.4]
  assign imem__T_36_data = io_wdata;
  assign imem__T_36_addr = {{2'd0}, io_addr};
  assign imem__T_36_mask = 1'h1;
  assign imem__T_36_en = io_wr_en & io_cs;
  assign _GEN_3 = 1'h1; // @[imemory.scala 41:17:@12674.4]
  assign io_rdata = imem__T_37_data; // @[imemory.scala 45:12:@12679.4]
  assign _GEN_6 = {{2'd0}, io_addr};
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
  for (initvar = 0; initvar < 2048; initvar = initvar+1)
    imem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  imem__T_37_addr_pipe_0 = _RAND_1[10:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(imem__T_36_en & imem__T_36_mask) begin
      imem[imem__T_36_addr] <= imem__T_36_data; // @[imemory.scala 26:25:@12671.4]
    end
    if (_GEN_3) begin
      imem__T_37_addr_pipe_0 <= _GEN_6;
    end
  end
endmodule