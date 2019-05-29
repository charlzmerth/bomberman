module player_input (
	input logic clk, reset, PS2_DAT, PS2_CLK,
	
	output logic start, p1_bomb, p2_bomb,
	output logic [3:0] p1_move, p2_move
);

	logic valid, makeBreak;
	logic [7:0] outCode;
	
	// Initalize the keyboard driver
	keyboard_press_driver keyboard (.CLOCK_50(clk), .reset, .valid, .makeBreak, .outCode, .PS2_DAT, .PS2_CLK);
	
	always_ff @(posedge clk) begin
		if (reset) begin
				p1_move <= 0;
				p2_move <= 0;
		end
		else if (valid) begin
			case (outCode)
				// Player1 codes
				'h1c: p1_move[0] <= makeBreak; // A
				'h1d: p1_move[1] <= makeBreak; // W
				'h1b: p1_move[2] <= makeBreak; // S
				'h23: p1_move[3] <= makeBreak; // D
				
				//Player2 codes
				'he06b: p1_move[0] <= makeBreak; // Left
				'he075: p1_move[1] <= makeBreak; // Up
				'he072: p1_move[2] <= makeBreak; // Down
				'he074: p1_move[3] <= makeBreak; // Right
				
				// Control keys
				'h29: p1_bomb <= makeBreak; // Spacebar
				'he05a: p2_bomb <= makeBreak; // Enter
			endcase
		end
	end
endmodule


module player_input_testbench();
	logic clk, reset, PS2_DAT, PS2_CLK;
	logic start, p1_bomb, p2_bomb;
	logic [3:0] p1_move, p2_move;

	// Clock generation
	parameter PERIOD = 100; // period = length of clock
	initial begin
		clk <= 0;
		forever #(PERIOD/2) clk = ~clk;
	end

	player_input dut (.*); // ".*" Implicitly connects all ports to variables with matching names

	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		repeat (10) @(posedge clk);
		$stop; // End simulation
	end
endmodule
