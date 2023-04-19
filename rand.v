module rand (clk, rst, pause, out);

input clk, rst, pause;
output [9:0] out;
reg [9:0] seed;
reg feedback;

always @(posedge clk or posedge rst)
	if(rst == 1)
		seed = 10'd999;
	else if (rst == 0) begin 
		feedback = seed[9]^seed[6];
		seed = (pause)? seed : {seed[8:0],feedback};
	end
	
assign out = (seed <= 10'd999)? seed : (seed% 10'd1000);

endmodule