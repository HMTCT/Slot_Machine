`timescale 1s/10ns
module main_tb();
	reg	clk, mode, start, rst, betinp, betinm;
	wire	[9:0]out;
	wire [3:0] bet, sto;
	wire won;
	wire [1:0] mode_num;
	main uut (clk, mode, start, rst, betinp, betinm, bet, sto, won, mode_num, out);
	initial $display ("		Time	mode_num	sto	bet	out	won");
	initial $monitor ("%t:		%d	%d	%d	%d	%b", $time, mode_num, sto, bet, out, won);
	initial clk = 0;
	initial rst = 1;
	initial mode = 1;
	initial #0.1 mode = 0;
	initial #0.11 mode =1;
	initial #0.12 mode = 0;
	initial #0.13 mode = 1;
	initial #0.14 mode = 0;
	initial #0.1 rst = 0;
	initial #0.2 start = 1;
	initial #1.5 start = 0;
	initial #1 mode = 1;
	initial #1.1 mode = 0;
	initial #3 $stop;
always
	begin
		#0.00000001;
		clk = ~clk; 
	end
endmodule