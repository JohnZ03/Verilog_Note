```
fifo_w256_128_r256_128_ib i_mask_cache (
	.rst(ep00wire[2]),
	.wr_clk(clk),
	.rd_clk(clk),
	.din(pipe_out_data), // Bus [256 : 0]
	.wr_en(pipe_out_write),
	.rd_en(cache_rd_en),
	.dout(cache_data), // Bus [31 : 0]
	.full(cache_full),
	.empty(cache_empty),
	.valid(cache_valid),
	.rd_data_count(cache_rd_count), // Bus [9 : 0]
	.wr_data_count(cache_wr_count)  // Bus [6 : 0]
	);
```

## I/O:
### Write Data Count (output):
`WR_DATA_COUNT [D:0]`
This bus indicates the number of words ___written into the FIFO___. The count is guaranteed to never under-report the number of words in the FIFO, to ensure the user never overflows the FIFO. The exception to this behavior is when a write operation occurs at the rising edge of WR_CLK, that write operation will only be reflected on WR_DATA_COUNT at the next rising clock edge.
If D is less than log2(FIFO depth)-1, the bus is truncated by removing the least-significant bits.

### Read Data Count (output):
`RD_DATA_COUNT [C:0]`
This bus indicates the number of words ***available for reading*** in the FIFO. The count is guaranteed to never over-report the number of words available for reading, to ensure that the user does not underflow the FIFO. The exception to this behavior is when the read operation occurs at the rising edge of RD_CLK, that read operation is only reflected on RD_DATA_COUNT at the next rising clock edge.
If C is less than log2(FIFO depth)-1, the bus is truncated by removing the least-significant bits.

### FULL (output):
When asserted, this signal indicates that the FIFO is full. Write requests are ignored when the FIFO is full, __initiating a write when the FIFO is full is not destructive to the contents of the FIFO__.

### ALMOST_FULL (output):
When asserted, this signal indicates that only one more write can be performed before the FIFO is full.

### EMPTY (output):
When asserted, this signal indicates that the FIFO is empty. Read requests are ignored when the FIFO is empty, initiating a read while empty is not destructive to the FIFO.

### VALID (output):
This signal indicates that valid data is available on the output bus (DOUT).

