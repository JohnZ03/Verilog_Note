# Description:
First stage FIFO, connects DIGOUT to Python FIFO. The main output is p0_data_o which gives image info into [[i_python_fifo]].

# IOs:
## Input:
1. rst: reset signal in
2. adc_clk0_i: adc parser clk & fifo write clk
#### For adc parser:
3. rst_adc_parser: resets all the adc parser
4. adc_gr0_valid: adc parser shift register enable
5. ch_data_i: 17 bit channel data input, goes to the 17 parsers
#### For adc fifo:
6. p0_rd_clk: adc fifo read clock
7. p0_rd_en: adc fifo read enable

## Output:
1. adc_fifo_wr_en: adc parser output valid, also used to enable fifo write
#### [FIFO default signals](fifo_):
2. p0_full
3. p0_empty
4. p0_valid
5. p0_rd_data_cnt: 14 bits
6. p0_wr_data_cnt: 14 bits
7. p0_data_o: 256 bits