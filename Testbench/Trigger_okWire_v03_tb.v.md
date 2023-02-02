# External Signals (FrontPanel)
## okWireIn
1. ep00wire: Unused
2. ep01wire: Unused
3. ep02wire: varValueSelector_T7 -> wr_en
4. ep03wire: varValueSelector_T7 -> varValueIn
5. ep04wire: varValueSelector_T7 -> varAddress
6. wi10: wirerst: global reset
7. wi11: wireExp: Exposure_v1_T7 -> Texp_ctrl

## okWireOut
1. ep20wire:
	{Ex_Trigger, DIGOUT_test[1], python_fifo_full , python_fifo_empty, adc_fifo_wr_en_o, adc_fifo_frame_full, adc_fifo_empty , sys_rst} 
	**(WARNING: negative slack during setup)**
2. ep21wire: Unused
3. ep22wire: varValueSelector_T7 -> varValueOut

## okTriggerIn
1. ep40wire: Unused reset

## okTriggerOut
1. ep60trig: Ex_Trigger, python_fifo full
2. ep60trig: Ex_Trigger, python_fifo full

## [[okBTPipeOut]]
1. epA0: output data to FrontPanel


