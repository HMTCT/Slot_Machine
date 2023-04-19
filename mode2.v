module mode2 (clk, start, rst, out, won, pause);

input clk, start, rst;
output [9:0] out;
output reg won = 0;
output reg pause = 1;

wire div_clk;

// CLOCK DIVIDE
//clk is 50MHZ
//div_clk is 10HZ
clock_divide CLK_10(clk, 10, div_clk);
	
rand Random (div_clk, rst, pause, out);

always@ (posedge div_clk or negedge start)
	
	if (start == 0) begin 	//the game stops when we release the Start button
		pause = 1;
		won = (out%111==0);	
	end
	else if (start) begin //when we press Start button, the game runs
		pause = 0;
		won = 0;	
	end
	
endmodule
				
			
