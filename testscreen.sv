module testscreen (CLOCK_50, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);

	input logic CLOCK_50;
	input logic [9:0] SW;

	output logic [7:0] VGA_G, VGA_R, VGA_B;
	output logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;	

	logic [9:0] x;
	logic [8:0] y;
	logic [7:0] r, g, b;
	logic Stage1Done, Stage2Done, Stage3Done;
	logic [9:0] Counterx;
	logic [8:0] Countery;
	
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
		if (SW[9]) begin
			Countery <= 0;
			Counterx <= 0;
			ps <= Stage1;
			x <= 0;
			y <= 0;
		end
		else begin
			ps <= ns;
			if(!(ps == Stage3)) begin
			x <= Counterx;
			y <= Countery;
			end
			else begin
				if ((Counterx % 80) <= 40) begin
				x <= Counterx;
				end
				if ((Countery % 80) <= 40) begin
				y <= Countery;
				end
			end
			end
			
			if (ps == Stage1) begin //brick
			r = 77;
			g = 79;
			b = 76;
			if (Countery < 480) begin//480
				Countery = Countery + 1;
			end
			else if ((Countery >= 480) && (Counterx >= 640)) begin//480 640
				Countery = 0;
				Counterx = 0;
				Stage1Done = 1;
			end
			else begin
				Countery = 0;
				Counterx = Counterx + 1;
			end
		end
		else if (ps == Stage2) begin ///grass
			r <= 36;
			g <= 104;
			b <= 3;
			if (Countery < 440) begin//440
				Countery = Countery + 1;
			end
			else if ((Countery >= 440) && (Counterx >= 600)) begin//440 600
				Countery = 0;
				Counterx = 0;
				Stage2Done = 1;
			end
			else begin
				Countery = 0;
				Counterx = Counterx + 1;
			end
		end
		else if (ps == Stage3) begin
			r <= 77;
			g <= 79;
			b <= 76;
			if (Countery < 440) begin
				Countery = Countery + 1;
			end
			else if ((Countery >= 440) && (Counterx >= 600)) begin
				Countery = 0;
				Counterx = 0;
				Stage3Done = 1;
			end
			else begin
				Countery = 0;
				Counterx = Counterx + 1;
			end
		end
	end
	

endmodule

`timescale 1 ps / 1 ps
module testscreen_testbench();

	logic CLOCK_50;
	logic [9:0] SW;
	logic [7:0] VGA_G, VGA_R, VGA_B;
	logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;
	integer i;
	
	testscreen dut (CLOCK_50, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	
	parameter CLOCK_PERIOD = 50;
	initial begin
	CLOCK_50 <= 0;
	forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50;
	end
	
	initial begin
	SW[9] = 1;
	@(posedge CLOCK_50);
	SW[9] = 0; @(posedge CLOCK_50);
	for (i = 0; i < 8000; i++) begin
	@(posedge CLOCK_50);
	end
	$stop;
	end
endmodule