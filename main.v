module main (clk, mode, start, rst, betinp, betinm, bet, sto, won, mode_num, out);

input clk, mode, start, rst, betinm, betinp;
output reg [1:0] mode_num = 1;
output won;
output [3:0] bet, sto;
output reg [9:0] out;

reg start1 = 0, start2 = 0, start3 = 0, pause = 1;
wire [9:0] out1, out2, out3;
wire won1, pause1;
wire won2, pause2;
wire won3, pause3;

always @(posedge mode or negedge pause)
	if (!pause) mode_num <= mode_num;
	else if (mode_num == 3) mode_num <= 1;
	else mode_num <= mode_num + 2'd1;
	
modex MODEX (betinp, pause, betinm, won, rst, bet, sto);
mode1 M1(clk, start1, rst, out1, won1, pause1);
mode2 M2(clk, start2, rst, out2, won2, pause2);
mode3 M3(clk, start3, rst, out3, won3, pause3);

always @(*) begin
	case (mode_num)
		1: begin start1 = start; out = out1; pause = pause1; end
		2: begin start2 = start; out = out2; pause = pause2; end
		3: begin start3 = start; out = out3; pause = pause3; end
	default : begin out = 10'd999; pause = 1; end
	endcase
end	

assign won = (won1 ===1) || (won2===1) || (won3===1);
endmodule