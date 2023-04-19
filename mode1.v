module mode1 (clk, start, rst, out, won, pause);

input clk, start, rst;
output [9:0] out;
output reg won = 0;
output reg pause = 1;

integer counter = 0;	
wire div_clk;

// CLOCK DIVIDE
//clk is 50MHZ
//div_clk is 10HZ
clock_divide CLK_10(clk, 10, div_clk);
	
rand Random (div_clk, rst, pause, out);

always@ (posedge div_clk or posedge start) begin
	
	if (start) begin //the game starts when we press Start button
		counter <= 1;	
		won <=0;
		pause <= 0;
	end
	else begin
		if (counter != 0 && counter != 31) begin
				counter <= counter + 1;
				pause <= 0;			//random number
		end
		
		else begin //stop after 3s
				counter <= 0;
				pause <= 1;
				won <= (counter==31)? (out%111==0): 1'b0;
		end
	end
			
end

endmodule
				
			
