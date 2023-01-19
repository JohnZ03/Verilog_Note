![[Pasted image 20230118142855.png]]

# General description:
The host interface is the gateway for FrontPanel to control and observe your design. It contains relatively simple logic that lets the USB microcontroller on the device communicate with the various endpoints within the design. Exactly one host interface must be instantiated in any design which uses the FrontPanel components.

The Host Interface component is the only block which is synthesized with your design. It contains a Host Interface core component (provided as a pre-synthesized module) as well as the necessary IOB components to connect to the host interface pins of the FPGA.

__NOTE:__ _The okHost is contained in okLibrary.v or okLibrary.vhd. Some details change from
device to device so the exact pinouts may differ slightly from the documentation below. Please see the Opal Kelly samples in the FrontPanel installation directory for examples specific to each supported device._

# Components:
## [[okHost]]:
This module must be instantiated in any design that makes use of FrontPanel virtual interface components.

## [[okWireOR]]:
Refer to the page content.

## [[okPipeIn]]:
