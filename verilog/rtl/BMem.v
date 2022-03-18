module BMem( // @[:@1992.2]
  input         clock, // @[:@1993.4]
  input         reset, // @[:@1994.4]
  input  [31:0] io_bmem_addr, // @[:@1995.4]
  output reg [31:0] bmem_data // @[:@1995.4]
);
  always @(*) begin
    if(reset) begin
      bmem_data <= 2;
    end else begin
      bmem_data <= 1;
    end
    // case(io_bmem_addr) 
    // 0: bmem_data <= 32'h03;
    // 1: bmem_data <= 32'h13;
    // 2: bmem_data <= 32'h23; 
    // 3: bmem_data <= 32'h33;
    // 4: bmem_data <= 32'h43;
    // 5: bmem_data <= 32'h53;
    // default: bmem_data <= 0;
    // endcase
  end

endmodule