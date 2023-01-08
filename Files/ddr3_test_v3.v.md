## Description:
This file contains:
* Local design parameters definition
* External singal (FrontPanel) handler, for resetting and FSM control
* FSM for <u>triple channel</u>(?) DDR3

---
## Local Parameters:
_Some defined parameters were left ununsed._

* FIFO_SIZE

---
## FSM:
#### States:
* s_idle
* s_write_0, s_write_1, s_write_2
* s_read_0, s_read_1, s_read_2

#### Transitions:
* __s_idle__:
	1. Calibration is done (`calib_done==1`)
	* Go to __s_write_0__ with `ch0_en` if:
		1. In write mode (`write_mode==1`)
		1. `ib0_count >= BURST_UI_WORD_COUNT`
	* Go to __s_write_0__ with `ch1_en` if:
		1. In read mode (`read_mode==1`)
		2. In running mode (`run_mode==1`)
		3. `ib1_count >= BURST_UI_WORD_COUNT`
	* Go to __s_write_0__ with `ch2_en` if:
		1. In read mode (`read_mode==1`)
		2. In running mode (`run_mode==1`)
		3. `ib2_count >= BURST_UI_WORD_COUNT`
	* Go to __s_read_0__ with `ch1_en` if:

* __s_write_0__: goes to __s_write_1__
* __s_write_1__: goes to __s_write_2__
* __s_write_2__: 


#
***
## Verilog Note:
* Use of `(* KEEP = "TRUE" *)`:
Use the [[KEEP]] attribute to prevent optimizations where signals are either optimized or absorbed into logic blocks. This attribute instructs the synthesis tool to keep the signal it was placed on, and that signal is placed in the netlist.