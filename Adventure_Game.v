//
// Adventure Game
//

module Adventure_Game(
	next,
	N, S, E, W, clk,
	WIN, DIE
);

// external variables
input N, S, E, W, clk;
output WIN, DIE;
output reg [2:0] next;

// internal varia|bles
reg [2:0] current;
wire sword;
reg win;
 
initial begin
	current <= 3'b000;
	next <= 3'b000;
end
	
Sword_FSM sfsm(.clk(clk), .in(current), .state(sword));
 
always @ (posedge clk) begin
 
	// at C
	if (current == 3'b000)
		next <= 3'b001;
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
 
	
	
end
 
always @ (negedge clk)
	current <= next;
	
	
endmodule