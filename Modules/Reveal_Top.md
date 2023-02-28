# Modules Instantiated
1. clk_inst: clock gen
2. u_ddr3_256_32: ddr3 interface
3. i_ddr3_ctl: ddr3 controller
4. i_mask_cache: fifo, cache for mask from ddr3 to sensor
5. u_patternToSensors: unpack 256 bit wide mask stream and give MSTREAMOUT
6. __exposure_handshake__: wait for readout to complete before next exposure
7. exposure_inst: exposure controls
8. triggerMe: timer
9. u_Readout: readout control (timing)
10. map_rows_adc2: row map look up table
11. exp_ro_row_decoder: 