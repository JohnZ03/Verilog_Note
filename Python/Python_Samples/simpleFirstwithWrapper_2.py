from fpga import api


# this to understand how fpga.py works

# ref: https://youtu.be/3M_5oYU-IsU?t=63
class quickMafths(api): 
    def __init__(self, bitfile):
    	# program bitfile
        super(quickMafths, self).__init__(bitfile)


if __name__ == '__main__':
	# download first.bit from here: https://www.dropbox.com/scl/fo/eqjevkh43lhuwdqvqxdpo/h?dl=0&rlkey=2f0n7rh49xfqyqo1gexuteq52
	dev = quickMafths('First.bit')

	# for First.v 
	# it returns C = A + B
	A = 0x0F
	B = 0x03

	dev.wire_in(0x00,0x11)
	dev.wire_in(0x01,A)
	dev.wire_in(0x02,B)
	C = dev.wire_out(0x21)

	if(C == A+B):
		print("****************SUCCESS*****************")
	else:
		print("****************OOOPSSS*****************")
