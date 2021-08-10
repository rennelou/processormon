module BlinkerGenerator(
  input        clock,
  input        reset,
  output [3:0] io_led
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cntReg; // @[Bilnker.scala 20:23]
  reg [3:0] blkReg; // @[Bilnker.scala 21:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[Bilnker.scala 23:20]
  wire [3:0] _blkReg_T = ~blkReg; // @[Bilnker.scala 26:15]
  assign io_led = blkReg; // @[Bilnker.scala 28:10]
  always @(posedge clock) begin
    if (reset) begin // @[Bilnker.scala 20:23]
      cntReg <= 32'h0; // @[Bilnker.scala 20:23]
    end else if (cntReg == 32'h17d783f) begin // @[Bilnker.scala 24:28]
      cntReg <= 32'h0; // @[Bilnker.scala 25:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[Bilnker.scala 23:10]
    end
    if (reset) begin // @[Bilnker.scala 21:23]
      blkReg <= 4'h0; // @[Bilnker.scala 21:23]
    end else if (cntReg == 32'h17d783f) begin // @[Bilnker.scala 24:28]
      blkReg <= _blkReg_T; // @[Bilnker.scala 26:12]
    end
  end
// Register and memory initialization
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
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
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
  _RAND_1 = {1{`RANDOM}};
  blkReg = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
