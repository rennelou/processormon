package blinker

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class BlinkerSpec extends FreeSpec with ChiselScalatestTester {

  "Blink" in {
    
    val CNT_MAX = 10;
    val step_time = 1;

    test(new BlinkerGenerator(CNT_MAX)) { c =>
      var on_off = 0x0;
      for (i <- 0 until 100) {
        
        c.io.led.expect(on_off.U);
        c.clock.step(step_time);

        val time = i * step_time;
        if ((time + 1) % (CNT_MAX + 1) === 0) {
          on_off = if (on_off === 0x0) { 0xf } else { 0x0 };
        }
      }
    }
  }

}