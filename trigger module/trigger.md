If `frame_upper_bound` is reached, set `trigger_FIFO_full` to high.
Relase `trigger_FIFO_full` until one frame of space is being released.

If `frame_lower_bound` is reached, set `trigger_FIFO_empty` to high.
Relase `trigger_FIFO_empty` until one frame of space is being filled.