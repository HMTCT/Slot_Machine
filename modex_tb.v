`timescale 1ns/1ps
module modex_tb();
	reg	rst, betinp, pause, betinm, won;
	wire	[3:0] bet;
	wire [3:0] sto;

	modex uut (betinp, pause, betinm, won, rst, bet, sto);
	initial $display ("		Time	betinp	pause	betinm	won	rst	bet	sto");
	initial $monitor ("%t:	%b	%b	%b	%b	%b	%d	%d", $time, betinp, pause, betinm, won, rst, bet, sto);
	initial won = 0;
	initial rst = 1;
	initial pause = 1;
	initial betinp = 1;
	initial betinm = 1;
	initial #1 betinp = 0;
	initial #1 betinm = 0;
	initial #5 rst = 0;
	initial #10 betinp = 1;
	initial #15 betinp = 0;
	initial #16 betinp = 1;
	initial #18 betinp = 0;
	//initial #20 pause = 0;
	initial #22 betinm = 1;
	initial #25 betinm = 0;
	initial #30 pause = 0;
	initial #40 pause = 1;
	initial #50 won = 0;
	
endmodule