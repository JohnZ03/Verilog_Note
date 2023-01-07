The following content can also be found [here](https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/KEEP).
***
Use the KEEP attribute to prevent optimizations where signals are either optimized or absorbed into logic blocks. This attribute instructs the synthesis tool to keep the signal it was placed on, and that signal is placed in the netlist.

For example, if a signal is an output of a 2 bit AND gate, and it drives another AND gate, the KEEP attribute can be used to prevent that signal from being merged into a larger LUT that encompasses both AND gates.

CAUTION! Be careful when using KEEP with other attributes. In cases where other attributes are in conflict with KEEP, the KEEP attribute usually takes precedence.

KEEP is also commonly used in conjunction with timing constraints. If there is a timing constraint on a signal that would normally be optimized, KEEP prevents that and allows the correct timing rules to be used.

Note: The KEEP attribute is not supported on the port of a module or entity. If you need to keep specific ports, either use the -flatten_hierarchy none setting, or put a DONT_TOUCH on the module or entity itself.

CAUTION! Take care when using KEEP attribute on loadless signals.  Synthesis will keep those signals resulting in issues later in the flow.

Examples are:

• When you have a MAX_FANOUT attribute on one signal and a KEEP attribute on a second signal that is driven by the first; the KEEP attribute on the second signal would not allow fanout replication.

• With a RAM_STYLE="block" , when there is a KEEP on the register that would need to become part of the RAM, the KEEP attribute prevents the block RAM from being inferred.

The supported KEEP values are:

• TRUE : Keeps the signal.

• FALSE : Allows Vivado synthesis to optimize. The FALSE value does not force the tool to remove the signal. The default value is FALSE .

You can place this attribute on any signal, register, or wire.

RECOMMENDED: Set this attribute in the RTL only. Because signals that need to be kept are often optimized before the XDC file is read, setting this attribute in the RTL ensures that the attribute is used.

Note: The KEEP attribute does not force the place and route to keep the signal. Instead, this is accomplished using the DONT_TOUCH attribute.