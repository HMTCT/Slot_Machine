`timescale 1s/10ns
module mode1_tb();
	reg	clk, rst, start;
	wire	[9:0]out;
	wire won;
	mode1 uut(clk, start, rst, out, won);
	initial $display ("		Time			out	won");
	initial $monitor ("%t:			%d	%b", $time, out, won);
	initial clk = 0;
	initial rst = 1;
	initial #0.1 rst = 0;
	initial #0.2 start = 1;
	initial #0.3 start = 0;
	initial #4 $stop;
always
	begin
		#0.00000001;
		clk = ~clk; 
	end
endmodule