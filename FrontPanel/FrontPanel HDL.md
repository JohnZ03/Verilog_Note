Source: https://docs.opalkelly.com/fpsdk/frontpanel-hdl/

## Endpoint Types:
FrontPanel supports three basic types of endpoints: Wire, Trigger, and Pipe.  Each can either be an input (from host to target) or output (from target to host).  Each endpoint type has a certain address range which must be used for proper operation.  The address is specified at the instantiation of the endpoint module in your design.

![[Pasted image 20230112112714.png]]

Endpoints are instantiated in your HDL design and connected to the okHost target ports.  Each endpoint also has one or more ports which are connected to various signals in your design, depending on the endpoint module.

### Endpoint Addresses:
Endpoints attach to the host interface on a shared bus.  To properly route signals between the host (PC) and target endpoints, each endpoint must be assigned a unique 8-bit address.  For performance reasons (to minimize USB transactions), each endpoint type has been assigned an address range as indicated in the table above.  When assigning addresses to your endpoints, be sure to follow these ranges.

The endpoint address is assigned in HDL through an additional 8-bit input port on the endpoint instance.  Example instantiation for each endpoint type are shown in the sections below.

### Register Bridge (USB 3.0 Only):
FrontPanel for USB 3.0 devices supports Wires, Triggers, and Pipes, as well as an additional Register Bridge endpoint.  This register bridge provides a 32-bit address space of 32-bit data words for a total of 16 GB.  User HDL responds to read and write requests from this Register Bridge, effectively creating a large synchronous register file.

***
