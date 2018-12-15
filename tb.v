// 
// Test bench file for adventure game
// Neil Nie
// (c) 2018, All Rights Reserved
//


module tb ();

	// DUT I/O parameters
	reg N, S, E, W, clk;
	wire [2:0] next;
	wire WIN, DIE;
	
	reg [2:0] expected;				// the expected current position.
	reg [31:0] vectornum, errors;
	reg [7:0] testvectors[10000:0];
	
	// instantiate device under test. 
	Adventure_Game dut(.clk(clk), .N(N), .S(S), .E(E), .W(W),
							 .WIN(WIN), .DIE(DIE),
							 .next(next)
	);
	
	initial
		begin
			$readmemb("C:/Users/USER1/Digital Logic/Adventure_Game/test_vector.tv", testvectors);
			clk = 0; vectornum = 0; errors = 0; 
			N = 0; S = 0; E = 0; W = 0;
		end
	
	always 
		begin
			#10 clk = !clk;
		end
	
	// apply test vectors at the rising edge of the clock. 
	always @ (negedge clk)
		begin
			#9; {N, S, E, W, expected} = testvectors[vectornum];
			
		end
	
	always @ (posedge clk) begin
		if (next != expected) begin
			$display("Error: input = %b", {N, S, E, W});
			$display("Outputs = %b %b %b %b (%b expected)", N, S, E, W, expected);
			errors = errors + 1;
		end
		vectornum = vectornum + 1;
		if (vectornum == 15) begin
			$display("%d tests completed with %d errors", vectornum, errors);
			$stop;
		end	
		
	end
	
endmodule
