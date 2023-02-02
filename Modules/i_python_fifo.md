# Description:
This is a fifo which stores 256 bit output from adc fifo and gives to [[okBTPipeOut]].
It uses IP fifo_w256_8192_r32_65536_subframe.

# IOs:
## Input:
1. rst
2. wr_clk: write clock
3. rd_clk: read clock
4. din: 256 bit data input
5. wr_en: write enable
6. rd_en: read enable

## Output:
1. dout: 32 bit data output, goes to [[okBTPipeOut]]
2. full
3. almost_full: [how this works](fifo_)
4. empty
5. rd_data_count: [how this works](fifo_)
6. wr_data_count: [how this works](fifo_)