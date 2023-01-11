module toplevel(
 input wire [7:0] hi_in,
 input wire [1:0] hi_out,
 inout wire [15:0] hi_inout,

 output wire [7:0] led,
 input wire [3:0] button
 );
// Target interface bus:
wire ti_clk;
wire [30:0] ok1;
wire [16:0] ok2;
// Endpoint connections:
wire [15:0] ep00wire;
wire [15:0] ep01wire;
wire [15:0] ep02wire;
wire [15:0] ep20wire;
wire [15:0] ep21wire;
assign led = ~ep00wire;
assign ep20wire = {12’b0000, ~button};
assign ep21wire = ep01wire + ep02wire;
// Instantiate the okHost and connect endpoints.
wire [17*2-1:0] ok2x;
okHost okHI(.hi_in(hi_in), .hi_out(hi_out), .hi_inout(hi_inout),
 .ti_clk(ti_clk), .ok1(ok1), .ok2(ok2) );
okWireIn ep00 (.ok1(ok1), .ep_addr(8’h00), .ep_dataout(ep00wire));
okWireIn ep01 (.ok1(ok1), .ep_addr(8’h01), .ep_dataout(ep01wire));
okWireIn ep02 (.ok1(ok1), .ep_addr(8’h02), .ep_dataout(ep02wire));
okWireOut ep20 (.ok1(ok1), .ok2(ok2x[ 0*17 +: 17]),
 .ep_addr(8’h20), .ep_datain(ep20wire));
okWireOut ep21 (.ok1(ok1), .ok2(ok2x[ 1*17 +: 17]),
 .ep_addr(8’h21), .ep_datain(ep21wire));
endmodule