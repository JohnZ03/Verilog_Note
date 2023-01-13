## The calculation:
FIFO width (word size): 256
Used word size: 17\*15 = 255

_So there will be one dummy bit each physical word._

Total bits to read for each frame: 326400 pixels = 680\*480
326400 / 255 = 1280 words

_Also_

Bus width for read: 17 bits
Cycles to read each frame: 326400/17 = 19200 cycels
Cycles for each word to write: 15 cycels

_As_
19200 cycels / 15 cycels = 1280 words

## The final numbers:
1280 words for each frame

For 2 frames: 2560 words
For 10 frames: 12800 words

