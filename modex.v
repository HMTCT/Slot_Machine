module modex (betinp, pause, betinm, won, rst, bet, sto);

input betinp, betinm, won, rst, pause;
output reg [3:0] bet;	//the money we bet
output reg [3:0] sto;	//the money we have

reg running = 0;

initial sto = 5;
initial bet = 0;

always@ (*) begin

	if (rst) begin
		sto = 5;
		bet = 0;
		running = 0;
	end
	
	else if (pause) begin	// we can bet only when the game is not running
		if (betinp) begin		//bet more
			bet = bet + 4'd1;
			if (bet > sto) bet = sto;
		end
		if(betinm) begin 		//decrease money
			bet = bet - 4'd1;
			if(bet < 0) bet = 0;
		end
		if (running) begin //the game has ran
			running = 0;
			if(won) begin
				if(sto + bet > 9) sto = 9;
				else sto = sto + bet;
			end
		
			else begin
				if(sto - bet < 0) sto = 0;
				else sto = sto - bet;
			end		
		end
	end
	
	else if (!pause) running = 1;	//the game is running
	
end

endmodule 
				
			
