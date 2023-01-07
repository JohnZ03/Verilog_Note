## Description:
This file contains:
* Local design parameters definition
* External singal (FrontPanel) handler, for resetting and FSM control
* FSM for <u>triple channel</u>(?) DDR3

#
---
## Local Parameters:
_Some defined parameters were left ununsed._

* FIFO_SIZE


#
---
## FSM:
#### States:
* s_idle
* s_write_0, s_write_1, s_write_2
* s_read_0, s_read_1, s_read_2

#### Transitions:
* s_idle:
	* To s_write_0:
		1. Calibration is done (`calib_done==1`)
		2. In write mode (`write_mode==1`)
	* 


#
***
## Verilog Note:
* Use of `(* KEEP = "TRUE" *)`:
Use the [[KEEP]] attribute to prevent optimizations where signals are either optimized or absorbed into logic blocks. This attribute instructs the synthesis tool to keep the signal it was placed on, and that signal is placed in the netlist.