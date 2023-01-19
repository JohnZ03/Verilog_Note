This module is under [[The Host Interface]].

# Official Doc:
The okPipeIn module provides a way to move synchronous multi-byte data from the host to
the target. As usual, the host is the master and therefore the target must accept data as it is
moved through this pipe (up to 100.8 MHz). The EP_WRITE signal is an __active high signal__ which __is asserted when data is to be accepted by the target__ on EP_DATAOUT\[31:0\]. It is possible that EP_WRITE be __asserted for several consecutive cycles__ without deasserting. In such a case, EP_DATAOUT\[31:0\] will be changing every clock.

This somewhat simple Pipe In implementation requires that the target interface be very responsive to incoming pipe data. If the target is able to keep up with the throughput, but needs to handle data in a block fashion, coupling the okPipeIn with a FIFO (from the Xilinx CORE generator) is a good solution. Alternatively, an okBTPipeIn can be used.

The timing diagram below indicates how data is presented by the okPipeIn to user HDL.
EP_DATAOUT contains valid data for any clock cycle where EP_WRITE is asserted during the rising edge of TI_CLK. Note that the transfer sends 4 words in this example. Although contrived, it is important to note that EP_WRITE may deassert during the transfer. This will generally happen with longer transfers (>256 words).

![[Pasted image 20230118144126.png]]

![[Pasted image 20230118144149.png]]

Verilog Instantiation:
```
okPipeIn pipeIn9C (
	.okHE(okHE),
	.okEH(okEH),
	.ep_addr(8’h9c),
	.ep_dataout(ep9Cpipe),
	.ep_write(ep9Cwrite)
);
```

