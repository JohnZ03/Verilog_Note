```
reg [31:0] dword;
reg [7:0] byte0;
reg [7:0] byte1;
reg [7:0] byte2;
reg [7:0] byte3;

assign byte0 = dword[0 +: 8];    // Same as dword[7:0]
assign byte1 = dword[8 +: 8];    // Same as dword[15:8]
assign byte2 = dword[16 +: 8];   // Same as dword[23:16]
assign byte3 = dword[24 +: 8];   // Same as dword[31:24]
```

```
big_vect[ 0 +: 8] // == big_vect[ 7 : 0]
big_vect[15 -: 8] // == big_vect[15 : 8]
```