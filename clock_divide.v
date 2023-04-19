/*
		input clock is 50MHZ
		output clock will be n_HZ
																*/
module clock_divide (input clk, input [31:0] n, output reg div_clk);
integer 	counter = 0;
initial	div_clk = 0;

always@ (posedge clk)
begin	
	if(counter == (25000000/n)) begin
		counter <= 0;
		div_clk <= ~div_clk;
	end
	else begin
		counter <= counter + 1;
		div_clk <= div_clk;
	end
end

endmodule