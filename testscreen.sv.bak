module testscreen (CLOCK_50, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);

	input logic CLOCK_50;
	input logic [9:0] SW;

	output [7:0] VGA_G, VGA_R, VGA_B;
	output logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;	

	logic [9:0] x;
	logic [8:0] y;
	logic [7:0] r, g, b;
	logic Stage1Done, Stage2Done, Stage3Done;
	integer i, j;

	enum {Stage1, Stage2, Stage3, Stage4} ps, ns;
	
	always_comb begin
		case (ps)
			Stage1:
				if (Stage1Done) ns = Stage2;
				else ns = Stage1;
			Stage2: 
				if (Stage2Done) ns = Stage3;
				else ns = Stage2;
			Stage3: 
				if (Stage3Done) ns = Stage4;
				else ns = Stage3;
		   Stage4: 
				ns = Stage4;
		endcase
	end
	
	always_ff @(posedge CLOCK_50) begin
		if (SW[9])
			ps = Stage1;
		else
			ps = ns;
		
		if (ps ==Stage1) begin //brick
			r <= 77;
			g <= 79;
			b <= 76;
			for (i = 0; i < 640; i++) begin
				x <= i;
				for (j = 0; j < 480; j++) begin
					y <= j;
				end
			end
			Stage1Done <= 1;
		end
		else if (ps == Stage2) begin ///grass
			r <= 36;
			g <= 104;
			b <= 3;
			for (i = 40; i < 600; i++) begin
				x <= i;
				for (j = 40; j < 440; j++) begin
					y <= j;
				end
			end
			Stage2Done <= 1;
		end
		else if (ps == Stage3) begin
			r <= 77;
			g <= 79;
			b <= 76;
			for (i = 40; i < 600; i++) begin
				if ((i % 80) <= 40)
					x <= i;
				for (j = 40; j < 440; j++) begin
					if ((j % 80) <= 40)
					y <= j;
				end
			end
			Stage3Done <= 1;
		end
	end
	
	video_driver display (.CLOCK_50, .reset(SW[9]), .x, .y, .r, .g, .b, .VGA_R, .VGA_G, .VGA_B, .VGA_BLANK_N, .VGA_CLK, .VGA_HS, .VGA_SYNC_N, .VGA_VS); 
endmodule