//
//
//

module Sword_FSM (
	clk, in, state
);

input clk;
input [2:0] in;
output reg state;

initial
	state <= 0;

always @ (posedge clk) 
	if (in == 3'b011)
		state <= 1;
		
endmodule
