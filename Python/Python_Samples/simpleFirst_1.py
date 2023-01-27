import ok

# ref: https://opalkelly.com/examples/configure-the-fpga/#tab-python
devices = ok.FrontPanelDevices()
dev     = devices.Open()
error = dev.ConfigureFPGA('your_bitfile_goes_here.bit')

print(error)
# error codes: https://docs.opalkelly.com/fpsdk/frontpanel-api/error-codes/

if(error==0):
	# no error and configuration successful
	# for First.v 
	# it returns C = A + B
	A = 0x0F
	B = 0x03

	# ref: https://opalkelly.com/examples/simple-pin-io/#tab-python
	# set alternating LEDs
	dev.SetWireInValue(0x00, 0xAA)
	dev.UpdateWireIns()

	# set variable A through wireIn
	dev.SetWireInValue(0x01, 0x0F)
	dev.UpdateWireIns()

	# set variable B through wireIn
	dev.SetWireInValue(0x02, 0x03)
	dev.UpdateWireIns()

	# read variable C through wireOut
	dev.UpdateWireOuts()
	C = dev.GetWireOutValue(0x21)

	if(C = A+B):
		print("****************SUCCESS*****************")
	else:
		print("****************OOOPSSS*****************")