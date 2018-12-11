//
// Adventure Game
//

module Adventure_Game(
	current, next,
	N, S, E, W, clk,
	WIN, DIE
);

input N, S, E, W, clk;
output WIN, DIE;
output reg [2:0] current;
output reg [2:0] next;
wire sword;
reg win;
 
initial
	current <= 3'b000;
	
Sword_FSM sfsm(.clk(clk), .in(current), .state(sword));
 
always @ (posedge clk) begin
 
	// at C
	if (current == 3'b000)
		if (S == 1)
			next <= 3'b001;
	
	// at T
	if (current == 3'b001)
		if (S == 1)
			next <= 3'b010;
		else if (W == 1)
			next <= 3'b000;
	
	// at R
	if (current == 3'b010)
		if (N == 1)
			next <= 3'b001;
		else if (W == 1)
			next <= 3'b011;
		else if (E == 1)
			next <= 3'b100;
	
	// at S
	if (current == 3'b011)
		if (E == 1)
	
	// at D
	if (current == 3'b100) 
		if (W == 1)
			next <= 3'b011;
		else if (E == 1 && sword == 1)
			next <= 3'b101;
		else if (E == 1 && sword == 0)
			next <= 3'b110;
		
	if (current == 3'b101) 
		win <= 1;
	if (current == 3'b110) 
		win <= 0;
 
	current <= next;
	
end
 
// always @ (negedge clk)
	
	
endmodule
