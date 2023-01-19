The following content can also be found [here](https://assets00.opalkelly.com/library/FrontPanel-UM.pdf).
***
## Load a FrontPanel Profile:
__Refers to the first button from the left side.__
A FrontPanel “Profile” is an XML file with the extension .XFP. The profile describes one or more Interface Panels which communicate with your device. A new profile may be loaded at any time, but only one profile for each device is available at any time. That is, the previous profile is unloaded before loading in the new one.

__You can load a new profile by clicking on the button shown at the left. A file selector dialog will open asking you to select a profile.__

When a selection is confirmed, the profile is loaded and the first panel is displayed. If there are more panels in the profile, they will not be displayed. However, a toggle button is displayed in the “Panel Selections” area for each Interface Panel to activate (or deactivate) a specific panel. To open another panel, simply click that panel’s button on the list.

__Drag and Drop__ also opens a new XFP profile.

***
## FPGA Configuration Download:
__Refers to the second button from the left side.__
To download an FPGA configuration file to the target device, simply click on the icon shown to the left. A file selector dialog will appear from which you can choose the Xilinx bitfile to download. If you accept the file, the download will proceed immediately. Four things happen when you configure the device:

1. The __on-board PLL__ is configured with the parameters stored in EEPROM.
2. The FPGA is __reset__ and a programming sequence is initiated.
3. The __configuration data__ is downloaded to the FPGA.
4. The FPGA is checked to verify that the configuration was successful (DONE is asserted).

Once complete, the FPGA is now configured and “running” with the new design.

__Drag and Drop__ a Xilinx bitfile onto the icon and release it also works.


***
## Device Setup:
__Refers to the third button from the left side.__
1. Firmware Information
1. Device Settings
1. Reset Profile


***
## Flash Programming Tool:
__Refers to the forth button from the left side.__

FrontPanel is able to program the on-board Flash memory for supported devices. The typical application for Flash programming is downloading an FPGA configuration bitfile to the Flash to allow the device to boot the FPGA on power-up in a “non-tethered” application. The host interface may be used after boot, if required.

On-board Flash memory is classified as one of two types:
1. <u>System Flash</u> is available to the host controller and may be accessed without an active FPGA configuration. This memory may not be accessed directly by the FPGA. System Flash is only availble on USB 3.0 devices.
2. <u>FPGA Flash</u> is connected to the FPGA. It is accessible only to the host through the use of an FPGA configuration that supports communication between the host and the memory.

### System Flash Programming:
FrontPanel uses the `FlashErase`, `FlashWrite`, and `FlashRead` APIs to erase and program the System Flash memory, if available. Please see the corresponding Device User’s Manual for available size and memory layout information which is also available via the DeviceInfo API structure.

### FPGA Flash Programming:
Programming the FPGA Flash requires FrontPanel to configure the FPGA with a special bitfile that allows FrontPanel to access the Flash memory. This bitfile is first downloaded to the FPGA before the Flash erase or programming steps are performed.