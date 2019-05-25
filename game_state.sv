module game_state (
	input logic clk, reset, start,
	input logic [2:0] p1_move, p2_move,
	
	output logic 
);
	
	// State variables
	enum { menu, init, playing, endgame } ps, ns;

	// Implement memory for initial block locations
	logic [12:0] block_loc [0:14];
	
	// Assign control logic
	always_comb begin
		end_game = ~p1_alive || ~p2_alive;
		
	end
	
	// State transition logic
	always_comb begin
		case (ps) begin
			menu: if (start) 
							ns = init;
					else			
							ns = menu;
					
			init: if (setup_done)
							ns = playing;
					else
							ns = init;
					
			playing: if (end_game)
							ns = endgame;
						else
							ns = playing;
						
			endgame: if (start)
							ns = init;
						else
							ns = endgame;			
		endcase
	end
	
	// State DFF's
	always_ff @(posedge clk) begin
		if (reset)
			ps <= menu;
		else
			ps <= ns;
	end
	
	
	
	
endmodule
