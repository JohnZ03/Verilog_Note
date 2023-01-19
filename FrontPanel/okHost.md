Verilog Instantiation:
```
okHost okHI (
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE),
	.okEH(okEH)
);
```

***
The following signals need to be connected directly to pins on the FPGA which go
to the USB microcontroller on the device. For a listing of the pin locations for a particular product, please see the user’s manual for that device.

![[Pasted image 20230118143119.png]]
![[Pasted image 20230118143136.png]]

***
The remaining ports of the okHost are connected to a shared bus inside your design. These signals are collectively referred to as the target interface bus. Each endpoint must connect to these signals for proper operation.

![[Pasted image 20230118143216.png]]

