module mode3 (clk, start, rst, out, won, pause);

input clk, start, rst;
output [9:0] out;
output reg won = 0;
output reg pause = 1;

integer freq = 0;
wire div_clk;

// CLOCK DIVIDE
//clk is 50MHZ
//div_clk is freq_HZ
clock_divide CLK (clk, freq, div_clk);

rand Random (div_clk, rst, pause, out);

always@ (posedge div_clk or posedge start) begin
	
	if (start) begin 					//when we press Start button, the game starts
		won = 0;	
		freq = freq + 1;				//grow thhe frequency
		pause = 0;
	end
	else if (!start) begin 
		freq = freq - 1;							//decrease the frequency
		won = (freq != 32'd0)? 1'b0: (out % 10'd111 === 0);	
		pause = (freq != 32'd0)? 1'b0 : 1'b1;						//stop when frequency = 0
	end
	
end

endmodule
				
			
