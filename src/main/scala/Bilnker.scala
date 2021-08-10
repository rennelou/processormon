package blinker

import chisel3._
import chisel3.stage.ChiselStage

object Blinker extends App {
  val CNT_MAX = 50000000 / 2 - 1;
  (new ChiselStage).emitVerilog(new BlinkerGenerator(CNT_MAX), args)
}

class BlinkerGenerator(counter_max: Int) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(4.W))
  })

  val cntReg = RegInit(0.U(32.W))
  val blkReg = RegInit(0.U(4.W))

  cntReg := cntReg + 1.U
  when(cntReg === counter_max.U) {
    cntReg := 0.U
    blkReg := ~blkReg
  }
  io.led := blkReg
}