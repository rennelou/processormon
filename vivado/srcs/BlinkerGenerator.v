module BlinkerGenerator(
  input        clock,
  input        reset,
  output [3:0] io_led
);
  reg [31:0] cntReg; // @[Bilnker.scala 20:23]
  reg [31:0] _RAND_0;
  reg [3:0] blkReg; // @[Bilnker.scala 21:23]
  reg [31:0] _RAND_1;
  wire [31:0] _T_1; // @[Bilnker.scala 23:20]
  wire  _T_2; // @[Bilnker.scala 24:15]
  wire [3:0] _T_3; // @[Bilnker.scala 26:15]
  assign _T_1 = cntReg + 32'h1; // @[Bilnker.scala 23:20]
  assign _T_2 = cntReg == 32'h17d783f; // @[Bilnker.scala 24:15]
  assign _T_3 = ~ blkReg; // @[Bilnker.scala 26:15]
  assign io_led = blkReg; // @[Bilnker.scala 28:10]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  blkReg = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cntReg <= 32'h0;
    end else if (_T_2) begin
      cntReg <= 32'h0;
    end else begin
      cntReg <= _T_1;
    end
    if (reset) begin
      blkReg <= 4'h0;
    end else if (_T_2) begin
      blkReg <= _T_3;
    end
  end
endmodule
