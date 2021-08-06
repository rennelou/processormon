SBT = sbt

# Generate Verilog code
default compile:
	$(SBT) "runMain Blinker --target-dir vivado/srcs"

test:
	$(SBT) test