`timescale 1ns / 1ps
module rand_tb();
	reg	clk, rst,pause;
	wire	[9:0]out;
	rand uut(clk, rst, pause, out);
	initial $display ("		Time			out");
	initial $monitor ("%t:			%d", $time, out);
	initial pause = 0;
	initial clk = 0;
	initial rst = 1;
	initial #5 rst = 0;
	initial #100 $stop;
always
	begin
		#5;
		clk = ~clk; 
	end
endmodule