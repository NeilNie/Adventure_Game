//
// From online
// Neil Nie
//

module keyboard(clk,data,sel,seg,parity,stop );
input clk;
input  data;
output reg [3:0]  sel;
output [6:0] seg;
output reg parity, stop;

reg [3:0] i=0;
reg [7:0] out=0,a=0;
reg z=1'b1;

always@(posedge clk)
begin 
			case(i)
			0  : begin z=data;	end				
			1  : a[0]=data;
			2  : a[1]=data;
			3  : a[2]=data;
			4  : a[3]=data;
			5  : a[4]=data;
			6  : a[5]=data;
			7  : a[6]=data;
			8  : a[7]=data;
			9  : parity=data;
			10  : stop=data;
			endcase
			if(z!=0)
			begin
				i=0;
				end
				else
				begin
			i=i+1'b1;
			end
		out=a;
end
 
reg [6:0]tt=0;
					
		always @(out)
		begin
		sel=4'b1110;
		case(out)
		8'h1c : tt=7'b0001000; //A=1c;
		8'h1b : tt=7'b0100100; //S=1b;
		8'h16 : tt=7'b1001111; // 1=16
		8'h1e : tt=7'b0010010; // 2=1E
		8'h26 : tt=7'b0000110; // 3=26
		8'h25 : tt=7'b1001100; // 4=25
		8'h2e : tt=7'b0100100; // 5=2e
		8'h36 : tt=7'b0100000; // 6=36
		8'h3d : tt=7'b0001111; // 7=3d
		8'h3e : tt=7'b0000000; // 8=3e
		8'h46 : tt=7'b0001100; // 9=46
		8'h45 : tt=7'b0000001; // 0=45
		
		default : tt=7'b1111110; 
		endcase
		end
	assign seg=tt;
endmodule