module testscreen (CLOCK_50, KEY, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS, PS2_DAT, PS2_CLK, CLOCK2_50, 
							FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);

	input logic CLOCK_50, CLOCK2_50, PS2_DAT, PS2_CLK;
	input logic [9:0] SW;
	input logic [3:0] KEY;

	output logic [7:0] VGA_G, VGA_R, VGA_B;
	output logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;
	
	output logic FPGA_I2C_SCLK;
	inout wire FPGA_I2C_SDAT;
	// Audio CODEC
	output logic AUD_XCK;
	input logic AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input logic AUD_ADCDAT;
	output logic AUD_DACDAT;

	logic [9:0] x, playerX, playerX2, Bombx1, Bombx2;
	logic [8:0] y, playerY, playerY2, Bomby1, Bomby2;
	logic [7:0] r, g, b;
	logic [17:0] buttonCounterUp2, buttonCounterDown2, buttonCounterLeft2, buttonCounterRight2; 
	logic [17:0] buttonCounterUp, buttonCounterDown, buttonCounterLeft, buttonCounterRight;
	logic bomb1On, bomb2On, player1Alive, player2Alive;
	logic [28:0] bomb1Counter, bomb2Counter;
	logic [23:0] bomb1Detonate, bomb2Detonate;
	logic [75:0] breakableBlocksBroken;
	logic [23:0] bombExplosions;
	logic [139:0] brokenBlocks;
	
	logic reset, p1_bomb, p2_bomb;
	logic [3:0] p1_move, p2_move;
	logic [1:0] ext;
	logic sound1, sound2;
	
	assign sound1 = (bomb1Detonate > 100);
	assign sound2 = (bomb2Detonate > 100);
	
	assign reset = SW[9];
	assign ext = {sound1, sound2};
	
	player_input pi (.clk(CLOCK_50), .PS2_DAT, .PS2_CLK, .reset, .p1_bomb, .p2_bomb, .p1_move, .p2_move);
	audio a (.*);
	
	always_ff @(posedge CLOCK_50) begin
	if (SW[9]) begin
		playerX <= 70;
		playerY <= 70;
		playerX2 <= 550;
		playerY2 <= 390;
		buttonCounterUp <= 0;
		buttonCounterDown <= 0;
		buttonCounterLeft <= 0;
		buttonCounterRight <= 0;
		buttonCounterUp2 <= 0;
		buttonCounterDown2 <= 0;
		buttonCounterLeft2 <= 0;
		buttonCounterRight2 <= 0;
		bomb1On <= 0;
		bomb2On <= 0;
		bomb1Counter <= 0;
		bomb1Detonate <= 0;
		bomb2Counter <= 0;
		bomb2Detonate <= 0;
		player1Alive <= 1;
		player2Alive <= 1;
		Bombx1 <= 0;
		Bomby1 <= 0;
		Bombx2 <= 0;
		Bomby2 <= 0;
		breakableBlocksBroken <= 0;
	end
		else begin
		
		breakableBlocksBroken[70] <= brokenBlocks[0] || brokenBlocks[35] || brokenBlocks[0+70] || brokenBlocks[35+70];
		breakableBlocksBroken[3] <= brokenBlocks[1] || brokenBlocks[36] || brokenBlocks[1+70] || brokenBlocks[36+70];
		breakableBlocksBroken[8] <= brokenBlocks[2] || brokenBlocks[37] || brokenBlocks[2+70] || brokenBlocks[37+70];
		breakableBlocksBroken[13] <= brokenBlocks[3] || brokenBlocks[38] || brokenBlocks[3+70] || brokenBlocks[38+70];
		breakableBlocksBroken[18] <= brokenBlocks[4] || brokenBlocks[39] || brokenBlocks[4+70] || brokenBlocks[39+70];
		breakableBlocksBroken[23] <= brokenBlocks[5] || brokenBlocks[40] || brokenBlocks[5+70] || brokenBlocks[40+70];
		breakableBlocksBroken[69] <= brokenBlocks[28] || brokenBlocks[63] || brokenBlocks[28+70] || brokenBlocks[63+70];
		
		breakableBlocksBroken[0] <= brokenBlocks[7] || brokenBlocks[42] || brokenBlocks[7+70] || brokenBlocks[42+70];
		breakableBlocksBroken[4] <= brokenBlocks[8] || brokenBlocks[43] || brokenBlocks[8+70] || brokenBlocks[43+70];
		breakableBlocksBroken[9] <= brokenBlocks[9] || brokenBlocks[44] || brokenBlocks[9+70] || brokenBlocks[44+70];
		breakableBlocksBroken[14] <= brokenBlocks[10] || brokenBlocks[45] || brokenBlocks[10+70] || brokenBlocks[45+70];
		breakableBlocksBroken[19] <= brokenBlocks[11] || brokenBlocks[46] || brokenBlocks[11+70] || brokenBlocks[46+70];
		breakableBlocksBroken[24] <= brokenBlocks[12] || brokenBlocks[47] || brokenBlocks[12+70] || brokenBlocks[47+70];
		breakableBlocksBroken[28] <= brokenBlocks[13] || brokenBlocks[48] || brokenBlocks[13+70] || brokenBlocks[48+70];
		
		breakableBlocksBroken[1] <= brokenBlocks[14] || brokenBlocks[49] || brokenBlocks[14+70] || brokenBlocks[49+70];
		breakableBlocksBroken[5] <= brokenBlocks[15] || brokenBlocks[50] || brokenBlocks[15+70] || brokenBlocks[50+70];
		breakableBlocksBroken[10] <= brokenBlocks[16] || brokenBlocks[51] || brokenBlocks[16+70] || brokenBlocks[51+70];
		breakableBlocksBroken[15] <= brokenBlocks[17] || brokenBlocks[52] || brokenBlocks[17+70] || brokenBlocks[52+70];
		breakableBlocksBroken[20] <= brokenBlocks[18] || brokenBlocks[53] || brokenBlocks[18+70] || brokenBlocks[53+70];
		breakableBlocksBroken[25] <= brokenBlocks[19] || brokenBlocks[54] || brokenBlocks[19+70] || brokenBlocks[54+70];
		breakableBlocksBroken[29] <= brokenBlocks[20] || brokenBlocks[55] || brokenBlocks[20+70] || brokenBlocks[55+70];
		
		breakableBlocksBroken[2] <= brokenBlocks[21] || brokenBlocks[56] || brokenBlocks[21+70] || brokenBlocks[56+70];
		breakableBlocksBroken[6] <= brokenBlocks[22] || brokenBlocks[57] || brokenBlocks[22+70] || brokenBlocks[57+70];
		breakableBlocksBroken[11] <= brokenBlocks[23] || brokenBlocks[58] || brokenBlocks[23+70] || brokenBlocks[58+70];
		breakableBlocksBroken[16] <= brokenBlocks[24] || brokenBlocks[59] || brokenBlocks[24+70] || brokenBlocks[59+70];
		breakableBlocksBroken[21] <= brokenBlocks[25] || brokenBlocks[60] || brokenBlocks[25+70] || brokenBlocks[60+70];
		breakableBlocksBroken[26] <= brokenBlocks[26] || brokenBlocks[61] || brokenBlocks[26+70] || brokenBlocks[61+70];
		breakableBlocksBroken[30] <= brokenBlocks[27] || brokenBlocks[62] || brokenBlocks[27+70] || brokenBlocks[62+70];
		
		breakableBlocksBroken[72] <= brokenBlocks[6] || brokenBlocks[41] || brokenBlocks[6+70] || brokenBlocks[41+70];
		breakableBlocksBroken[7] <= brokenBlocks[29] || brokenBlocks[64] || brokenBlocks[29+70] || brokenBlocks[64+70];
		breakableBlocksBroken[12] <= brokenBlocks[30] || brokenBlocks[65] || brokenBlocks[30+70] || brokenBlocks[65+70];
		breakableBlocksBroken[17] <= brokenBlocks[31] || brokenBlocks[66] || brokenBlocks[31+70] || brokenBlocks[66+70];
		breakableBlocksBroken[22] <= brokenBlocks[32] || brokenBlocks[67] || brokenBlocks[32+70] || brokenBlocks[67+70];
		breakableBlocksBroken[27] <= brokenBlocks[33] || brokenBlocks[68] || brokenBlocks[33+70] || brokenBlocks[68+70];
		breakableBlocksBroken[74] <= brokenBlocks[34] || brokenBlocks[69] || brokenBlocks[34+70] || brokenBlocks[69+70];
		
		if(p1_bomb && player1Alive)begin
			bomb1On <= 1;
			Bombx1 <= playerX;
			Bomby1 <= playerY;
			bomb1Counter <= 0;
		end
		if(p2_bomb && player2Alive)begin
			bomb2On <= 1;
			Bombx2 <= playerX2;
			Bomby2 <= playerY2;
			bomb2Counter <= 0;
		end
		if ((p1_move[3]) && (playerX < 560) && !((((playerX + 1) >= 80) && ((playerX + 1) <= 120) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 80) && ((playerX + 1) <= 120) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 80) && ((playerX + 1) <= 120) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 80) && ((playerX + 1) <= 120) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX + 1) >= 160) && ((playerX + 1) <= 200) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 160) && ((playerX + 1) <= 200) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 160) && ((playerX + 1) <= 200) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 160) && ((playerX + 1) <= 200) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX + 1) >= 240) && ((playerX + 1) <= 280) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 240) && ((playerX + 1) <= 280) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 240) && ((playerX + 1) <= 280) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 240) && ((playerX + 1) <= 280) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX + 1) >= 320) && ((playerX + 1) <= 360) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 320) && ((playerX + 1) <= 360) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 320) && ((playerX + 1) <= 360) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 320) && ((playerX + 1) <= 360) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX + 1) >= 400) && ((playerX + 1) <= 440) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 400) && ((playerX + 1) <= 440) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 400) && ((playerX + 1) <= 440) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 400) && ((playerX + 1) <= 440) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX + 1) >= 480) && ((playerX + 1) <= 520) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX + 1) >= 480) && ((playerX + 1) <= 520) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX + 1) >= 480) && ((playerX + 1) <= 520) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX + 1) >= 480) && ((playerX + 1) <= 520) && (playerY >= 320) && (playerY <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX + 1) >= 40) && ((playerX + 1) <= 100) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX + 1) >= 40) && ((playerX + 1) <= 100) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX + 1) >= 40) && ((playerX + 1) <= 100) && (playerY >= 300) && (playerY <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX + 1) >= 120) && ((playerX + 1) <= 180) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX + 1) >= 120) && ((playerX + 1) <= 180) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX + 1) >= 120) && ((playerX + 1) <= 180) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX + 1) >= 120) && ((playerX + 1) <= 180) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX + 1) >= 120) && ((playerX + 1) <= 180) && (playerY >= 380) && (playerY <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX + 1) >= 200) && ((playerX + 1) <= 260) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX + 1) >= 200) && ((playerX + 1) <= 260) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX + 1) >= 200) && ((playerX + 1) <= 260) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX + 1) >= 200) && ((playerX + 1) <= 260) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX + 1) >= 200) && ((playerX + 1) <= 260) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX + 1) >= 280) && ((playerX + 1) <= 340) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX + 1) >= 280) && ((playerX + 1) <= 340) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX + 1) >= 280) && ((playerX + 1) <= 340) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX + 1) >= 280) && ((playerX + 1) <= 340) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX + 1) >= 280) && ((playerX + 1) <= 340) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX + 1) >= 360) && ((playerX + 1) <= 420) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX + 1) >= 360) && ((playerX + 1) <= 420) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX + 1) >= 360) && ((playerX + 1) <= 420) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX + 1) >= 360) && ((playerX + 1) <= 420) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX + 1) >= 360) && ((playerX + 1) <= 420) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX + 1) >= 440) && ((playerX + 1) <= 500) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX + 1) >= 440) && ((playerX + 1) <= 500) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX + 1) >= 440) && ((playerX + 1) <= 500) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX + 1) >= 440) && ((playerX + 1) <= 500) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX + 1) >= 440) && ((playerX + 1) <= 500) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX + 1) >= 520) && ((playerX + 1) <= 580) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX + 1) >= 520) && ((playerX + 1) <= 580) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX + 1) >= 520) && ((playerX + 1) <= 580) && (playerY >= 300) && (playerY <= 340))))) begin
			buttonCounterLeft <= buttonCounterLeft + 1;
			if ((buttonCounterLeft == 0)) begin
			playerX <= playerX + 1;
			end
		end
		if ((p1_move[2]) && (playerY < 400) && !(((playerX >= 80) && (playerX <= 140) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380)) ||
					
					((playerX >= 160) && (playerX <= 220) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380)) ||
					
					((playerX >= 240) && (playerX <= 300) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380)) ||
					
					((playerX >= 320) && (playerX <= 380) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380)) ||
					
					((playerX >= 400) && (playerX <= 460) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380)) ||
					
					((playerX >= 480) && (playerX <= 540) && ((playerY + 1) >= 80) && ((playerY + 1) <= 140)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY + 1) >= 160) && ((playerY + 1) <= 220)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY + 1) >= 240) && ((playerY + 1) <= 300)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY + 1) >= 320) && ((playerY + 1) <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY + 1 >= 40) && (playerY + 1 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY + 1 >= 360) && (playerY + 1 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY + 1 >= 40) && (playerY + 1 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY + 1 >= 360) && (playerY + 1 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY + 1 >= 40) && (playerY + 1 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY + 1 >= 360) && (playerY + 1 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY + 1 >= 40) && (playerY + 1 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY + 1 >= 360) && (playerY + 1 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY + 1 >= 40) && (playerY + 1 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY + 1 >= 280) && (playerY + 1 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY + 1 >= 360) && (playerY + 1 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY + 1 >= 120) && (playerY + 1 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY + 1 >= 200) && (playerY + 1 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY + 1 >= 280) && (playerY + 1 <= 340))))) begin
			buttonCounterUp <= buttonCounterUp + 1;
			if ((buttonCounterUp == 0)) begin
			playerY <= playerY + 1;
			end
		end
		if ((p1_move[1]) && (playerY > 60) && !(((playerX >= 80) && (playerX <= 140) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 80) && (playerX <= 140) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380)) ||
					
					((playerX >= 160) && (playerX <= 220) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 160) && (playerX <= 220) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380)) ||
					
					((playerX >= 240) && (playerX <= 300) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 240) && (playerX <= 300) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380)) ||
					
					((playerX >= 320) && (playerX <= 380) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 320) && (playerX <= 380) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380)) ||
					
					((playerX >= 400) && (playerX <= 460) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 400) && (playerX <= 460) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380)) ||
					
					((playerX >= 480) && (playerX <= 540) && ((playerY - 1) >= 80) && ((playerY - 1) <= 140)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY - 1) >= 160) && ((playerY - 1) <= 220)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY - 1) >= 240) && ((playerY - 1) <= 300)) ||
					((playerX >= 480) && (playerX <= 540) && ((playerY - 1) >= 320) && ((playerY - 1) <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX) >= 40) && ((playerX) <= 100) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY - 1 >= 40) && (playerY - 1 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX) >= 120) && ((playerX) <= 180) && (playerY - 1 >= 360) && (playerY - 1 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY - 1 >= 40) && (playerY - 1 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX) >= 200) && ((playerX) <= 260) && (playerY - 1 >= 360) && (playerY - 1 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY - 1 >= 40) && (playerY - 1 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX) >= 280) && ((playerX) <= 340) && (playerY - 1 >= 360) && (playerY - 1 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY - 1 >= 40) && (playerY - 1 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX) >= 360) && ((playerX) <= 420) && (playerY - 1 >= 360) && (playerY - 1 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY - 1 >= 40) && (playerY - 1 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY - 1 >= 280) && (playerY - 1 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX) >= 440) && ((playerX) <= 500) && (playerY - 1 >= 360) && (playerY - 1 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY - 1 >= 120) && (playerY - 1 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY - 1 >= 200) && (playerY - 1 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX) >= 520) && ((playerX) <= 580) && (playerY - 1 >= 280) && (playerY - 1 <= 340))))) begin
			buttonCounterDown <= buttonCounterDown + 1;
			if ((buttonCounterDown == 0)) begin
			playerY <= playerY - 1;
			end
		end
		if ((p1_move[0]) && (playerX > 60) && !((((playerX - 1) >= 100) && ((playerX - 1) <= 140) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 100) && ((playerX - 1) <= 140) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 100) && ((playerX - 1) <= 140) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 100) && ((playerX - 1) <= 140) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX - 1) >= 180) && ((playerX - 1) <= 220) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 180) && ((playerX - 1) <= 220) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 180) && ((playerX - 1) <= 220) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 180) && ((playerX - 1) <= 220) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX - 1) >= 260) && ((playerX - 1) <= 300) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 260) && ((playerX - 1) <= 300) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 260) && ((playerX - 1) <= 300) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 260) && ((playerX - 1) <= 300) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX - 1) >= 340) && ((playerX - 1) <= 380) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 340) && ((playerX - 1) <= 380) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 340) && ((playerX - 1) <= 380) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 340) && ((playerX - 1) <= 380) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX - 1) >= 420) && ((playerX - 1) <= 460) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 420) && ((playerX - 1) <= 460) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 420) && ((playerX - 1) <= 460) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 420) && ((playerX - 1) <= 460) && (playerY >= 320) && (playerY <= 380)) ||
					
					(((playerX - 1) >= 500) && ((playerX - 1) <= 540) && (playerY >= 80) && (playerY <= 140)) ||
					(((playerX - 1) >= 500) && ((playerX - 1) <= 540) && (playerY >= 160) && (playerY <= 220)) ||
					(((playerX - 1) >= 500) && ((playerX - 1) <= 540) && (playerY >= 240) && (playerY <= 300)) ||
					(((playerX - 1) >= 500) && ((playerX - 1) <= 540) && (playerY >= 320) && (playerY <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX - 1) >= 40) && ((playerX - 1) <= 100) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX - 1) >= 40) && ((playerX - 1) <= 100) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX - 1) >= 40) && ((playerX - 1) <= 100) && (playerY >= 300) && (playerY <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX - 1) >= 120) && ((playerX - 1) <= 180) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX - 1) >= 120) && ((playerX - 1) <= 180) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX - 1) >= 120) && ((playerX - 1) <= 180) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX - 1) >= 120) && ((playerX - 1) <= 180) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX - 1) >= 120) && ((playerX - 1) <= 180) && (playerY >= 380) && (playerY <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX - 1) >= 200) && ((playerX - 1) <= 260) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX - 1) >= 200) && ((playerX - 1) <= 260) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX - 1) >= 200) && ((playerX - 1) <= 260) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX - 1) >= 200) && ((playerX - 1) <= 260) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX - 1) >= 200) && ((playerX - 1) <= 260) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX - 1) >= 280) && ((playerX - 1) <= 340) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX - 1) >= 280) && ((playerX - 1) <= 340) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX - 1) >= 280) && ((playerX - 1) <= 340) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX - 1) >= 280) && ((playerX - 1) <= 340) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX - 1) >= 280) && ((playerX - 1) <= 340) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX - 1) >= 360) && ((playerX - 1) <= 420) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX - 1) >= 360) && ((playerX - 1) <= 420) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX - 1) >= 360) && ((playerX - 1) <= 420) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX - 1) >= 360) && ((playerX - 1) <= 420) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX - 1) >= 360) && ((playerX - 1) <= 420) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX - 1) >= 440) && ((playerX - 1) <= 500) && (playerY >= 60) && (playerY <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX - 1) >= 440) && ((playerX - 1) <= 500) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX - 1) >= 440) && ((playerX - 1) <= 500) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX - 1) >= 440) && ((playerX - 1) <= 500) && (playerY >= 300) && (playerY <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX - 1) >= 440) && ((playerX - 1) <= 500) && (playerY >= 380) && (playerY <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX - 1) >= 520) && ((playerX - 1) <= 580) && (playerY >= 140) && (playerY <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX - 1) >= 520) && ((playerX - 1) <= 580) && (playerY >= 220) && (playerY <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX - 1) >= 520) && ((playerX - 1) <= 580) && (playerY >= 300) && (playerY <= 340))))) begin
			buttonCounterRight <= buttonCounterRight + 1;
			if ((buttonCounterRight == 0)) begin
			playerX <= playerX - 1;
			end
		end
		
		if ((p2_move[3]) && (playerX2 < 560) && !((((playerX2 + 1) >= 80) && ((playerX2 + 1) <= 120) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 80) && ((playerX2 + 1) <= 120) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 80) && ((playerX2 + 1) <= 120) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 80) && ((playerX2 + 1) <= 120) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 + 1) >= 160) && ((playerX2 + 1) <= 200) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 160) && ((playerX2 + 1) <= 200) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 160) && ((playerX2 + 1) <= 200) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 160) && ((playerX2 + 1) <= 200) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 + 1) >= 240) && ((playerX2 + 1) <= 280) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 240) && ((playerX2 + 1) <= 280) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 240) && ((playerX2 + 1) <= 280) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 240) && ((playerX2 + 1) <= 280) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 + 1) >= 320) && ((playerX2 + 1) <= 360) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 320) && ((playerX2 + 1) <= 360) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 320) && ((playerX2 + 1) <= 360) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 320) && ((playerX2 + 1) <= 360) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 + 1) >= 400) && ((playerX2 + 1) <= 440) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 400) && ((playerX2 + 1) <= 440) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 400) && ((playerX2 + 1) <= 440) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 400) && ((playerX2 + 1) <= 440) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 + 1) >= 480) && ((playerX2 + 1) <= 520) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 + 1) >= 480) && ((playerX2 + 1) <= 520) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 + 1) >= 480) && ((playerX2 + 1) <= 520) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 + 1) >= 480) && ((playerX2 + 1) <= 520) && (playerY2 >= 320) && (playerY2 <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX2 + 1) >= 40) && ((playerX2 + 1) <= 100) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX2 + 1) >= 40) && ((playerX2 + 1) <= 100) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX2 + 1) >= 40) && ((playerX2 + 1) <= 100) && (playerY2 >= 300) && (playerY2 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX2 + 1) >= 120) && ((playerX2 + 1) <= 180) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX2 + 1) >= 120) && ((playerX2 + 1) <= 180) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX2 + 1) >= 120) && ((playerX2 + 1) <= 180) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX2 + 1) >= 120) && ((playerX2 + 1) <= 180) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX2 + 1) >= 120) && ((playerX2 + 1) <= 180) && (playerY2 >= 380) && (playerY2 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX2 + 1) >= 200) && ((playerX2 + 1) <= 260) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX2 + 1) >= 200) && ((playerX2 + 1) <= 260) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX2 + 1) >= 200) && ((playerX2 + 1) <= 260) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX2 + 1) >= 200) && ((playerX2 + 1) <= 260) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX2 + 1) >= 200) && ((playerX2 + 1) <= 260) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX2 + 1) >= 280) && ((playerX2 + 1) <= 340) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX2 + 1) >= 280) && ((playerX2 + 1) <= 340) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX2 + 1) >= 280) && ((playerX2 + 1) <= 340) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX2 + 1) >= 280) && ((playerX2 + 1) <= 340) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX2 + 1) >= 280) && ((playerX2 + 1) <= 340) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX2 + 1) >= 360) && ((playerX2 + 1) <= 420) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX2 + 1) >= 360) && ((playerX2 + 1) <= 420) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX2 + 1) >= 360) && ((playerX2 + 1) <= 420) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX2 + 1) >= 360) && ((playerX2 + 1) <= 420) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX2 + 1) >= 360) && ((playerX2 + 1) <= 420) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX2 + 1) >= 440) && ((playerX2 + 1) <= 500) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX2 + 1) >= 440) && ((playerX2 + 1) <= 500) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX2 + 1) >= 440) && ((playerX2 + 1) <= 500) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX2 + 1) >= 440) && ((playerX2 + 1) <= 500) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX2 + 1) >= 440) && ((playerX2 + 1) <= 500) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX2 + 1) >= 520) && ((playerX2 + 1) <= 580) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX2 + 1) >= 520) && ((playerX2 + 1) <= 580) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX2 + 1) >= 520) && ((playerX2 + 1) <= 580) && (playerY2 >= 300) && (playerY2 <= 340))))) begin
			buttonCounterLeft2 <= buttonCounterLeft2 + 1;
			if ((buttonCounterLeft2 == 0)) begin
			playerX2 <= playerX2 + 1;
			end
		end
		if ((p2_move[2]) && (playerY2 < 400) && !(((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380)) ||
					
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380)) ||
					
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380)) ||
					
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380)) ||
					
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380)) ||
					
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 + 1) >= 80) && ((playerY2 + 1) <= 140)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 + 1) >= 160) && ((playerY2 + 1) <= 220)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 + 1) >= 240) && ((playerY2 + 1) <= 300)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 + 1) >= 320) && ((playerY2 + 1) <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 + 1 >= 40) && (playerY2 + 1 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 + 1 >= 360) && (playerY2 + 1 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 + 1 >= 40) && (playerY2 + 1 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 + 1 >= 360) && (playerY2 + 1 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 + 1 >= 40) && (playerY2 + 1 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 + 1 >= 360) && (playerY2 + 1 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 + 1 >= 40) && (playerY2 + 1 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 + 1 >= 360) && (playerY2 + 1 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 + 1 >= 40) && (playerY2 + 1 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 + 1 >= 360) && (playerY2 + 1 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 + 1 >= 120) && (playerY2 + 1 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 + 1 >= 200) && (playerY2 + 1 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 + 1 >= 280) && (playerY2 + 1 <= 340))))) begin
			buttonCounterUp2 <= buttonCounterUp2 + 1;
			if ((buttonCounterUp2 == 0)) begin
			playerY2 <= playerY2 + 1;
			end
		end
		if ((p2_move[1]) && (playerY2 > 60) && !(((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 80) && (playerX2 <= 140) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380)) ||
					
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 160) && (playerX2 <= 220) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380)) ||
					
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 240) && (playerX2 <= 300) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380)) ||
					
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 320) && (playerX2 <= 380) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380)) ||
					
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 400) && (playerX2 <= 460) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380)) ||
					
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 - 1) >= 80) && ((playerY2 - 1) <= 140)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 - 1) >= 160) && ((playerY2 - 1) <= 220)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 - 1) >= 240) && ((playerY2 - 1) <= 300)) ||
					((playerX2 >= 480) && (playerX2 <= 540) && ((playerY2 - 1) >= 320) && ((playerY2 - 1) <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX2) >= 40) && ((playerX2) <= 100) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 - 1 >= 40) && (playerY2 - 1 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX2) >= 120) && ((playerX2) <= 180) && (playerY2 - 1 >= 360) && (playerY2 - 1 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 - 1 >= 40) && (playerY2 - 1 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX2) >= 200) && ((playerX2) <= 260) && (playerY2 - 1 >= 360) && (playerY2 - 1 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 - 1 >= 40) && (playerY2 - 1 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX2) >= 280) && ((playerX2) <= 340) && (playerY2 - 1 >= 360) && (playerY2 - 1 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 - 1 >= 40) && (playerY2 - 1 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX2) >= 360) && ((playerX2) <= 420) && (playerY2 - 1 >= 360) && (playerY2 - 1 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 - 1 >= 40) && (playerY2 - 1 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX2) >= 440) && ((playerX2) <= 500) && (playerY2 - 1 >= 360) && (playerY2 - 1 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 - 1 >= 120) && (playerY2 - 1 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 - 1 >= 200) && (playerY2 - 1 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX2) >= 520) && ((playerX2) <= 580) && (playerY2 - 1 >= 280) && (playerY2 - 1 <= 340))))) begin
			buttonCounterDown2 <= buttonCounterDown2 + 1;
			if ((buttonCounterDown2 == 0)) begin
			playerY2 <= playerY2 - 1;
			end
		end
		if ((p2_move[0]) && (playerX2 > 60) && !((((playerX2 - 1) >= 100) && ((playerX2 - 1) <= 140) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 100) && ((playerX2 - 1) <= 140) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 100) && ((playerX2 - 1) <= 140) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 100) && ((playerX2 - 1) <= 140) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 - 1) >= 180) && ((playerX2 - 1) <= 220) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 180) && ((playerX2 - 1) <= 220) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 180) && ((playerX2 - 1) <= 220) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 180) && ((playerX2 - 1) <= 220) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 - 1) >= 260) && ((playerX2 - 1) <= 300) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 260) && ((playerX2 - 1) <= 300) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 260) && ((playerX2 - 1) <= 300) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 260) && ((playerX2 - 1) <= 300) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 - 1) >= 340) && ((playerX2 - 1) <= 380) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 340) && ((playerX2 - 1) <= 380) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 340) && ((playerX2 - 1) <= 380) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 340) && ((playerX2 - 1) <= 380) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 - 1) >= 420) && ((playerX2 - 1) <= 460) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 420) && ((playerX2 - 1) <= 460) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 420) && ((playerX2 - 1) <= 460) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 420) && ((playerX2 - 1) <= 460) && (playerY2 >= 320) && (playerY2 <= 380)) ||
					
					(((playerX2 - 1) >= 500) && ((playerX2 - 1) <= 540) && (playerY2 >= 80) && (playerY2 <= 140)) ||
					(((playerX2 - 1) >= 500) && ((playerX2 - 1) <= 540) && (playerY2 >= 160) && (playerY2 <= 220)) ||
					(((playerX2 - 1) >= 500) && ((playerX2 - 1) <= 540) && (playerY2 >= 240) && (playerY2 <= 300)) ||
					(((playerX2 - 1) >= 500) && ((playerX2 - 1) <= 540) && (playerY2 >= 320) && (playerY2 <= 380))) &&
					
					!((!breakableBlocksBroken[0] && (((playerX2 - 1) >= 40) && ((playerX2 - 1) <= 100) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[1] && (((playerX2 - 1) >= 40) && ((playerX2 - 1) <= 100) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[2] && (((playerX2 - 1) >= 40) && ((playerX2 - 1) <= 100) && (playerY2 >= 300) && (playerY2 <= 340))) ||
		
					(!breakableBlocksBroken[3] && (((playerX2 - 1) >= 120) && ((playerX2 - 1) <= 180) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[4] && (((playerX2 - 1) >= 120) && ((playerX2 - 1) <= 180) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[5] && (((playerX2 - 1) >= 120) && ((playerX2 - 1) <= 180) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[6] && (((playerX2 - 1) >= 120) && ((playerX2 - 1) <= 180) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[7] && (((playerX2 - 1) >= 120) && ((playerX2 - 1) <= 180) && (playerY2 >= 380) && (playerY2 <= 420))) ||
					
					(!breakableBlocksBroken[8] && (((playerX2 - 1) >= 200) && ((playerX2 - 1) <= 260) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[9] && (((playerX2 - 1) >= 200) && ((playerX2 - 1) <= 260) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[10] && (((playerX2 - 1) >= 200) && ((playerX2 - 1) <= 260) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[11] && (((playerX2 - 1) >= 200) && ((playerX2 - 1) <= 260) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[12] && (((playerX2 - 1) >= 200) && ((playerX2 - 1) <= 260) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[13] && (((playerX2 - 1) >= 280) && ((playerX2 - 1) <= 340) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[14] && (((playerX2 - 1) >= 280) && ((playerX2 - 1) <= 340) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[15] && (((playerX2 - 1) >= 280) && ((playerX2 - 1) <= 340) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[16] && (((playerX2 - 1) >= 280) && ((playerX2 - 1) <= 340) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[17] && (((playerX2 - 1) >= 280) && ((playerX2 - 1) <= 340) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[18] && (((playerX2 - 1) >= 360) && ((playerX2 - 1) <= 420) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[19] && (((playerX2 - 1) >= 360) && ((playerX2 - 1) <= 420) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[20] && (((playerX2 - 1) >= 360) && ((playerX2 - 1) <= 420) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[21] && (((playerX2 - 1) >= 360) && ((playerX2 - 1) <= 420) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[22] && (((playerX2 - 1) >= 360) && ((playerX2 - 1) <= 420) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[23] && (((playerX2 - 1) >= 440) && ((playerX2 - 1) <= 500) && (playerY2 >= 60) && (playerY2 <= 100))) ||
					(!breakableBlocksBroken[24] && (((playerX2 - 1) >= 440) && ((playerX2 - 1) <= 500) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[25] && (((playerX2 - 1) >= 440) && ((playerX2 - 1) <= 500) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[26] && (((playerX2 - 1) >= 440) && ((playerX2 - 1) <= 500) && (playerY2 >= 300) && (playerY2 <= 340))) || 
					(!breakableBlocksBroken[27] && (((playerX2 - 1) >= 440) && ((playerX2 - 1) <= 500) && (playerY2 >= 380) && (playerY2 <= 420))) || 
					
					(!breakableBlocksBroken[28] && (((playerX2 - 1) >= 520) && ((playerX2 - 1) <= 580) && (playerY2 >= 140) && (playerY2 <= 180))) || 
					(!breakableBlocksBroken[29] && (((playerX2 - 1) >= 520) && ((playerX2 - 1) <= 580) && (playerY2 >= 220) && (playerY2 <= 260))) || 
					(!breakableBlocksBroken[30] && (((playerX2 - 1) >= 520) && ((playerX2 - 1) <= 580) && (playerY2 >= 300) && (playerY2 <= 340))))) begin
			buttonCounterRight2 <= buttonCounterRight2 + 1;
			if ((buttonCounterRight2 == 0)) begin
			playerX2 <= playerX2 - 1;
			end
		end
		end
		
		
		if((bomb1On) && (bomb1Counter < 200000000)) begin
			bomb1Counter <= bomb1Counter + 1;
			bomb1Detonate <= 1;
		end
		else if((bomb1On) && ((bomb1Counter >= 200000000))) begin
			bomb1Detonate <= bomb1Detonate + 1;
			if(bomb1Detonate > 8097000) begin
				bomb1On <= 0;
				bomb1Detonate <= 0;
				bomb1Counter <= 0;
				Bombx1 <= 0;
				Bomby1 <= 0;
			end
		end
		
		
		
		if((bomb2On) && (bomb2Counter < 200000000)) begin
			bomb2Counter <= bomb2Counter + 1;
			bomb2Detonate <= 1;
		end
		else if((bomb2On) && ((bomb2Counter >= 200000000))) begin
			bomb2Detonate <= bomb2Detonate + 1;
			if(bomb2Detonate > 8097000) begin
				bomb2On <= 0;
				bomb2Detonate <= 0;
				bomb2Counter <= 0;
				Bombx2 <= 0;
				Bomby2 <= 0;
			end
		end
		
		
		
		if(!player1Alive && !player2Alive && (((x >= 290) && (x <= 310) && (y >= 180) && (y <= 280)) || ((x >= 290) && (x <= 330) && (y >= 260) && (y <= 280)) || ((x >= 290) && (x <= 330) && (y >= 180) && (y <= 200)) || ((x >= 330) && (x <= 350) && (y >= 190) && (y <= 270)))) begin
			r <= 100;
			g <= 100;
			b <= 0;
		end
		else if (player1Alive && !player2Alive && (((x >= 290) && (x <= 330) && (y >= 180) && (y <= 200)) || ((x >= 310) && (x <= 330) && (y >= 180) && (y <= 280)) || ((x >= 290) && (x <= 350) && (y >= 260) && (y <= 280)))) begin
			r <= 0;
			g <= 0;
			b <= 100;
		end
		else if (player2Alive && !player1Alive && (((x >= 300) && (x <= 340) && (y >= 180) && (y <= 200)) || ((x >= 300) && (x <= 340) && (y >= 220) && (y <= 240)) || ((x >= 300) && (x <= 340) && (y >= 260) && (y <= 280)) || ((x >= 330) && (x <= 340) && (y >= 200) && (y <= 220)) || ((x >= 300) && (x <= 310) && (y >= 240) && (y <= 260)))) begin
			r <= 100;
			g <= 0;
			b <= 100;
		end
		
		
		
		
		else if ((bomb1On) && ((bomb1Counter >= 200000000)) && (bombExplosions[0] || bombExplosions[1] || bombExplosions[2] || bombExplosions[3] || bombExplosions[4] || bombExplosions[5] || bombExplosions[6] || bombExplosions[7] || bombExplosions[8] || bombExplosions[9] || bombExplosions[10] || bombExplosions[11]))begin
			r <= 100;
			g <= 0;
			b <= 0;
			if((x >= playerX) && (x <= (playerX + 20)) && (y >= playerY) && (y <= (playerY + 20))) begin
				player1Alive <= 0;
			end
			if((x >= playerX2) && (x <= (playerX2 + 20)) && (y >= playerY2) && (y <= (playerY2 + 20))) begin
				player2Alive <= 0;
			end
		end
		else if((bomb1On) && (bomb1Counter < 200000000) && ((x > (Bombx1 + 5)) && (x <= (Bombx1 + 15)) && (y >= (Bomby1 + 5)) && (y <= (Bomby1 + 15)))) begin
			r <= 0;
			g <= 0;
			b <= 0;
		end
		
		
		else if ((bomb2On) && ((bomb2Counter >= 200000000)) && (bombExplosions[12] || bombExplosions[13] || bombExplosions[14] || bombExplosions[15] || bombExplosions[16] || bombExplosions[17] || bombExplosions[18] || bombExplosions[19] || bombExplosions[20] || bombExplosions[21] || bombExplosions[22] || bombExplosions[23]))begin
			r <= 100;
			g <= 0;
			b <= 0;
			if((x >= playerX2) && (x <= (playerX2 + 20)) && (y >= playerY2) && (y <= (playerY2 + 20))) begin
				player2Alive <= 0;
			end
			if((x >= playerX) && (x <= (playerX + 20)) && (y >= playerY) && (y <= (playerY + 20))) begin
				player1Alive <= 0;
			end
		end
		else if((bomb2On) && (bomb2Counter < 200000000) && ((x > (Bombx2 + 5)) && (x <= (Bombx2 + 15)) && (y >= (Bomby2 + 5)) && (y <= (Bomby2 + 15)))) begin
			r <= 0;
			g <= 0;
			b <= 0;
		end
		
		
		else if ((!breakableBlocksBroken[0] && (x >= 60) && (x <= 100) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[1] && (x >= 60) && (x <= 100) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[2] && (x >= 60) && (x <= 100) && (y >= 300) && (y <= 340)) ||
		
					(!breakableBlocksBroken[3] && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 100)) ||
					(!breakableBlocksBroken[4] && (x >= 140) && (x <= 180) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[5] && (x >= 140) && (x <= 180) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[6] && (x >= 140) && (x <= 180) && (y >= 300) && (y <= 340)) || 
					(!breakableBlocksBroken[7] && (x >= 140) && (x <= 180) && (y >= 380) && (y <= 420)) ||
					
					(!breakableBlocksBroken[8] && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 100)) ||
					(!breakableBlocksBroken[9] && (x >= 220) && (x <= 260) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[10] && (x >= 220) && (x <= 260) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[11] && (x >= 220) && (x <= 260) && (y >= 300) && (y <= 340)) || 
					(!breakableBlocksBroken[12] && (x >= 220) && (x <= 260) && (y >= 380) && (y <= 420)) || 
					
					(!breakableBlocksBroken[13] && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 100)) ||
					(!breakableBlocksBroken[14] && (x >= 300) && (x <= 340) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[15] && (x >= 300) && (x <= 340) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[16] && (x >= 300) && (x <= 340) && (y >= 300) && (y <= 340)) || 
					(!breakableBlocksBroken[17] && (x >= 300) && (x <= 340) && (y >= 380) && (y <= 420)) || 
					
					(!breakableBlocksBroken[18] && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 100)) ||
					(!breakableBlocksBroken[19] && (x >= 380) && (x <= 420) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[20] && (x >= 380) && (x <= 420) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[21] && (x >= 380) && (x <= 420) && (y >= 300) && (y <= 340)) || 
					(!breakableBlocksBroken[22] && (x >= 380) && (x <= 420) && (y >= 380) && (y <= 420)) || 
					
					(!breakableBlocksBroken[23] && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 100)) ||
					(!breakableBlocksBroken[24] && (x >= 460) && (x <= 500) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[25] && (x >= 460) && (x <= 500) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[26] && (x >= 460) && (x <= 500) && (y >= 300) && (y <= 340)) || 
					(!breakableBlocksBroken[27] && (x >= 460) && (x <= 500) && (y >= 380) && (y <= 420)) || 
					
					(!breakableBlocksBroken[28] && (x >= 540) && (x <= 580) && (y >= 140) && (y <= 180)) || 
					(!breakableBlocksBroken[29] && (x >= 540) && (x <= 580) && (y >= 220) && (y <= 260)) || 
					(!breakableBlocksBroken[30] && (x >= 540) && (x <= 580) && (y >= 300) && (y <= 340))) begin
			if(((x % 12) == 0) || ((y % 6) == 0)) begin
				r <= 180;
				g <= 180;
				b <= 180;
			end
			else begin
				r <= 180;
				g <= 27;
				b <= 27;
			end
		end
		
		
		else if (player1Alive && ((x >= playerX) && (x <= (playerX + 20)) && (y >= playerY) && (y <= (playerY + 20)))) begin
			r <= 0;
			g <= 0;
			b <= 100;
		end
		else if (player2Alive && ((x >= playerX2) && (x <= (playerX2 + 20)) && (y >= playerY2) && (y <= (playerY2 + 20)))) begin
			r <= 100;
			g <= 0;
			b <= 100;
		end
		else if ((x <= 20) || (x >= 620) || (y >= 460) || (y <= 20)) begin
			r <= 0;
			g <= 0;
			b <= 0;
		end
		//181
		else if((x <= 60) || (x >= 580) || (y >= 420) || (y <= 60)) begin
			r <= 11;
			g <= 15;
			b <= 15;
		end
		else if (((x >= 100) && (x <= 140) && (y >= 100) && (y <= 140)) ||
					((x >= 100) && (x <= 140) && (y >= 180) && (y <= 220)) ||
					((x >= 100) && (x <= 140) && (y >= 260) && (y <= 300)) ||
					((x >= 100) && (x <= 140) && (y >= 340) && (y <= 380)) ||
					
					((x >= 180) && (x <= 220) && (y >= 100) && (y <= 140)) ||
					((x >= 180) && (x <= 220) && (y >= 180) && (y <= 220)) ||
					((x >= 180) && (x <= 220) && (y >= 260) && (y <= 300)) ||
					((x >= 180) && (x <= 220) && (y >= 340) && (y <= 380)) ||
					
					((x >= 260) && (x <= 300) && (y >= 100) && (y <= 140)) ||
					((x >= 260) && (x <= 300) && (y >= 180) && (y <= 220)) ||
					((x >= 260) && (x <= 300) && (y >= 260) && (y <= 300)) ||
					((x >= 260) && (x <= 300) && (y >= 340) && (y <= 380)) ||
					
					((x >= 340) && (x <= 380) && (y >= 100) && (y <= 140)) ||
					((x >= 340) && (x <= 380) && (y >= 180) && (y <= 220)) ||
					((x >= 340) && (x <= 380) && (y >= 260) && (y <= 300)) ||
					((x >= 340) && (x <= 380) && (y >= 340) && (y <= 380)) ||
					
					((x >= 420) && (x <= 460) && (y >= 100) && (y <= 140)) ||
					((x >= 420) && (x <= 460) && (y >= 180) && (y <= 220)) ||
					((x >= 420) && (x <= 460) && (y >= 260) && (y <= 300)) ||
					((x >= 420) && (x <= 460) && (y >= 340) && (y <= 380)) ||
					
					((x >= 500) && (x <= 540) && (y >= 100) && (y <= 140)) ||
					((x >= 500) && (x <= 540) && (y >= 180) && (y <= 220)) ||
					((x >= 500) && (x <= 540) && (y >= 260) && (y <= 300)) ||
					((x >= 500) && (x <= 540) && (y >= 340) && (y <= 380))) begin
			r <= 11;
			g <= 15;
			b <= 15;
		end
		else begin
			r <= 0;
			g <= 94;
			b <= 14;
		end
	end
	
	video_driver display (.CLOCK_50, .reset(SW[9]), .x, .y, .r, .g, .b, .VGA_R, .VGA_G, .VGA_B, .VGA_BLANK_N, .VGA_CLK, .VGA_HS, .VGA_SYNC_N, .VGA_VS); 
	bombVerticalTop column1 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(60), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[70]), .breakableBlocksBroken1(breakableBlocksBroken[0]), .breakableBlocksBroken2(breakableBlocksBroken[1]), .breakableBlocksBroken3(breakableBlocksBroken[2]), .breakableBlocksBroken4(breakableBlocksBroken[69]), .bombExplosion(bombExplosions[5]), .breakblock0(brokenBlocks[35]), .breakblock1(brokenBlocks[42]), .breakblock2(brokenBlocks[49]), .breakblock3(brokenBlocks[56]), .breakblock4(brokenBlocks[63]));
	bombVerticalTop column2 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(140), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[3]), .breakableBlocksBroken1(breakableBlocksBroken[4]), .breakableBlocksBroken2(breakableBlocksBroken[5]), .breakableBlocksBroken3(breakableBlocksBroken[6]), .breakableBlocksBroken4(breakableBlocksBroken[7]), .bombExplosion(bombExplosions[6]), .breakblock0(brokenBlocks[36]), .breakblock1(brokenBlocks[43]), .breakblock2(brokenBlocks[50]), .breakblock3(brokenBlocks[57]), .breakblock4(brokenBlocks[64]));
	bombVerticalTop column3 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(220), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[8]), .breakableBlocksBroken1(breakableBlocksBroken[9]), .breakableBlocksBroken2(breakableBlocksBroken[10]), .breakableBlocksBroken3(breakableBlocksBroken[11]), .breakableBlocksBroken4(breakableBlocksBroken[12]), .bombExplosion(bombExplosions[7]), .breakblock0(brokenBlocks[37]), .breakblock1(brokenBlocks[44]), .breakblock2(brokenBlocks[51]), .breakblock3(brokenBlocks[58]), .breakblock4(brokenBlocks[65]));
	bombVerticalTop column4 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(300), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[13]), .breakableBlocksBroken1(breakableBlocksBroken[14]), .breakableBlocksBroken2(breakableBlocksBroken[15]), .breakableBlocksBroken3(breakableBlocksBroken[16]), .breakableBlocksBroken4(breakableBlocksBroken[17]), .bombExplosion(bombExplosions[8]), .breakblock0(brokenBlocks[38]), .breakblock1(brokenBlocks[45]), .breakblock2(brokenBlocks[52]), .breakblock3(brokenBlocks[59]), .breakblock4(brokenBlocks[66]));
	bombVerticalTop column5 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(380), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[18]), .breakableBlocksBroken1(breakableBlocksBroken[19]), .breakableBlocksBroken2(breakableBlocksBroken[20]), .breakableBlocksBroken3(breakableBlocksBroken[21]), .breakableBlocksBroken4(breakableBlocksBroken[22]), .bombExplosion(bombExplosions[9]), .breakblock0(brokenBlocks[39]), .breakblock1(brokenBlocks[46]), .breakblock2(brokenBlocks[53]), .breakblock3(brokenBlocks[60]), .breakblock4(brokenBlocks[67]));
	bombVerticalTop column6 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(460), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[23]), .breakableBlocksBroken1(breakableBlocksBroken[24]), .breakableBlocksBroken2(breakableBlocksBroken[25]), .breakableBlocksBroken3(breakableBlocksBroken[26]), .breakableBlocksBroken4(breakableBlocksBroken[27]), .bombExplosion(bombExplosions[10]), .breakblock0(brokenBlocks[40]), .breakblock1(brokenBlocks[47]), .breakblock2(brokenBlocks[54]), .breakblock3(brokenBlocks[61]), .breakblock4(brokenBlocks[68]));
	bombVerticalTop column7 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On, .bomb1Counter, .Bombx1, .BombxStart(540), .Bomby1, .y, .breakableBlocksBroken0(breakableBlocksBroken[72]), .breakableBlocksBroken1(breakableBlocksBroken[28]), .breakableBlocksBroken2(breakableBlocksBroken[29]), .breakableBlocksBroken3(breakableBlocksBroken[30]), .breakableBlocksBroken4(breakableBlocksBroken[74]), .bombExplosion(bombExplosions[11]), .breakblock0(brokenBlocks[41]), .breakblock1(brokenBlocks[48]), .breakblock2(brokenBlocks[55]), .breakblock3(brokenBlocks[62]), .breakblock4(brokenBlocks[69]));
	
	bombHorizontalTop row1 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb1On), .bomb1Counter(bomb1Counter), .Bombx1(Bombx1), .BombyStart(60), .Bomby1(Bomby1), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[70]), .breakableBlocksBroken1(breakableBlocksBroken[3]), .breakableBlocksBroken2(breakableBlocksBroken[8]), .breakableBlocksBroken3(breakableBlocksBroken[13]), .breakableBlocksBroken4(breakableBlocksBroken[18]), .breakableBlocksBroken5(breakableBlocksBroken[23]), .breakableBlocksBroken6(breakableBlocksBroken[72]), .bombExplosion(bombExplosions[0]), .breakblock0(brokenBlocks[0]), .breakblock1(brokenBlocks[1]), .breakblock2(brokenBlocks[2]), .breakblock3(brokenBlocks[3]), .breakblock4(brokenBlocks[4]), .breakblock5(brokenBlocks[5]), .breakblock6(brokenBlocks[6]));
	bombHorizontalTop row2 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb1On), .bomb1Counter(bomb1Counter), .Bombx1(Bombx1), .BombyStart(140), .Bomby1(Bomby1), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[0]), .breakableBlocksBroken1(breakableBlocksBroken[4]), .breakableBlocksBroken2(breakableBlocksBroken[9]), .breakableBlocksBroken3(breakableBlocksBroken[14]), .breakableBlocksBroken4(breakableBlocksBroken[19]), .breakableBlocksBroken5(breakableBlocksBroken[24]), .breakableBlocksBroken6(breakableBlocksBroken[28]), .bombExplosion(bombExplosions[1]), .breakblock0(brokenBlocks[7]), .breakblock1(brokenBlocks[8]), .breakblock2(brokenBlocks[9]), .breakblock3(brokenBlocks[10]), .breakblock4(brokenBlocks[11]), .breakblock5(brokenBlocks[12]), .breakblock6(brokenBlocks[13]));
	bombHorizontalTop row3 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb1On), .bomb1Counter(bomb1Counter), .Bombx1(Bombx1), .BombyStart(220), .Bomby1(Bomby1), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[1]), .breakableBlocksBroken1(breakableBlocksBroken[5]), .breakableBlocksBroken2(breakableBlocksBroken[10]), .breakableBlocksBroken3(breakableBlocksBroken[15]), .breakableBlocksBroken4(breakableBlocksBroken[20]), .breakableBlocksBroken5(breakableBlocksBroken[25]), .breakableBlocksBroken6(breakableBlocksBroken[29]), .bombExplosion(bombExplosions[2]), .breakblock0(brokenBlocks[14]), .breakblock1(brokenBlocks[15]), .breakblock2(brokenBlocks[16]), .breakblock3(brokenBlocks[17]), .breakblock4(brokenBlocks[18]), .breakblock5(brokenBlocks[19]), .breakblock6(brokenBlocks[20]));
	bombHorizontalTop row4 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb1On), .bomb1Counter(bomb1Counter), .Bombx1(Bombx1), .BombyStart(300), .Bomby1(Bomby1), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[2]), .breakableBlocksBroken1(breakableBlocksBroken[6]), .breakableBlocksBroken2(breakableBlocksBroken[11]), .breakableBlocksBroken3(breakableBlocksBroken[16]), .breakableBlocksBroken4(breakableBlocksBroken[21]), .breakableBlocksBroken5(breakableBlocksBroken[26]), .breakableBlocksBroken6(breakableBlocksBroken[30]), .bombExplosion(bombExplosions[3]), .breakblock0(brokenBlocks[21]), .breakblock1(brokenBlocks[22]), .breakblock2(brokenBlocks[23]), .breakblock3(brokenBlocks[24]), .breakblock4(brokenBlocks[25]), .breakblock5(brokenBlocks[26]), .breakblock6(brokenBlocks[27]));
	bombHorizontalTop row5 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb1On), .bomb1Counter(bomb1Counter), .Bombx1(Bombx1), .BombyStart(380), .Bomby1(Bomby1), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[69]), .breakableBlocksBroken1(breakableBlocksBroken[7]), .breakableBlocksBroken2(breakableBlocksBroken[12]), .breakableBlocksBroken3(breakableBlocksBroken[17]), .breakableBlocksBroken4(breakableBlocksBroken[22]), .breakableBlocksBroken5(breakableBlocksBroken[27]), .breakableBlocksBroken6(breakableBlocksBroken[74]), .bombExplosion(bombExplosions[4]), .breakblock0(brokenBlocks[28]), .breakblock1(brokenBlocks[29]), .breakblock2(brokenBlocks[30]), .breakblock3(brokenBlocks[31]), .breakblock4(brokenBlocks[32]), .breakblock5(brokenBlocks[33]), .breakblock6(brokenBlocks[34]));
	
	
	
	
	bombVerticalTop column12 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(60), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[70]), .breakableBlocksBroken1(breakableBlocksBroken[0]), .breakableBlocksBroken2(breakableBlocksBroken[1]), .breakableBlocksBroken3(breakableBlocksBroken[2]), .breakableBlocksBroken4(breakableBlocksBroken[69]), .bombExplosion(bombExplosions[17]), .breakblock0(brokenBlocks[35+70]), .breakblock1(brokenBlocks[42+70]), .breakblock2(brokenBlocks[49+70]), .breakblock3(brokenBlocks[56+70]), .breakblock4(brokenBlocks[63+70]));
	bombVerticalTop column22 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(140), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[3]), .breakableBlocksBroken1(breakableBlocksBroken[4]), .breakableBlocksBroken2(breakableBlocksBroken[5]), .breakableBlocksBroken3(breakableBlocksBroken[6]), .breakableBlocksBroken4(breakableBlocksBroken[7]), .bombExplosion(bombExplosions[18]), .breakblock0(brokenBlocks[36+70]), .breakblock1(brokenBlocks[43+70]), .breakblock2(brokenBlocks[50+70]), .breakblock3(brokenBlocks[57+70]), .breakblock4(brokenBlocks[64+70]));
	bombVerticalTop column32 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(220), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[8]), .breakableBlocksBroken1(breakableBlocksBroken[9]), .breakableBlocksBroken2(breakableBlocksBroken[10]), .breakableBlocksBroken3(breakableBlocksBroken[11]), .breakableBlocksBroken4(breakableBlocksBroken[12]), .bombExplosion(bombExplosions[19]), .breakblock0(brokenBlocks[37+70]), .breakblock1(brokenBlocks[44+70]), .breakblock2(brokenBlocks[51+70]), .breakblock3(brokenBlocks[58+70]), .breakblock4(brokenBlocks[65+70]));
	bombVerticalTop column42 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(300), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[13]), .breakableBlocksBroken1(breakableBlocksBroken[14]), .breakableBlocksBroken2(breakableBlocksBroken[15]), .breakableBlocksBroken3(breakableBlocksBroken[16]), .breakableBlocksBroken4(breakableBlocksBroken[17]), .bombExplosion(bombExplosions[20]), .breakblock0(brokenBlocks[38+70]), .breakblock1(brokenBlocks[45+70]), .breakblock2(brokenBlocks[52+70]), .breakblock3(brokenBlocks[59+70]), .breakblock4(brokenBlocks[66+70]));
	bombVerticalTop column52 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(380), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[18]), .breakableBlocksBroken1(breakableBlocksBroken[19]), .breakableBlocksBroken2(breakableBlocksBroken[20]), .breakableBlocksBroken3(breakableBlocksBroken[21]), .breakableBlocksBroken4(breakableBlocksBroken[22]), .bombExplosion(bombExplosions[21]), .breakblock0(brokenBlocks[39+70]), .breakblock1(brokenBlocks[46+70]), .breakblock2(brokenBlocks[53+70]), .breakblock3(brokenBlocks[60+70]), .breakblock4(brokenBlocks[67+70]));
	bombVerticalTop column62 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(460), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[23]), .breakableBlocksBroken1(breakableBlocksBroken[24]), .breakableBlocksBroken2(breakableBlocksBroken[25]), .breakableBlocksBroken3(breakableBlocksBroken[26]), .breakableBlocksBroken4(breakableBlocksBroken[27]), .bombExplosion(bombExplosions[22]), .breakblock0(brokenBlocks[40+70]), .breakblock1(brokenBlocks[47+70]), .breakblock2(brokenBlocks[54+70]), .breakblock3(brokenBlocks[61+70]), .breakblock4(brokenBlocks[68+70]));
	bombVerticalTop column72 (.clk(CLOCK_50), .reset(SW[9]), .x, .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombxStart(540), .Bomby1(Bomby2), .y, .breakableBlocksBroken0(breakableBlocksBroken[72]), .breakableBlocksBroken1(breakableBlocksBroken[28]), .breakableBlocksBroken2(breakableBlocksBroken[29]), .breakableBlocksBroken3(breakableBlocksBroken[30]), .breakableBlocksBroken4(breakableBlocksBroken[74]), .bombExplosion(bombExplosions[23]), .breakblock0(brokenBlocks[41+70]), .breakblock1(brokenBlocks[48+70]), .breakblock2(brokenBlocks[55+70]), .breakblock3(brokenBlocks[62+70]), .breakblock4(brokenBlocks[69+70]));
	
	bombHorizontalTop row12 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombyStart(60), .Bomby1(Bomby2), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[70]), .breakableBlocksBroken1(breakableBlocksBroken[3]), .breakableBlocksBroken2(breakableBlocksBroken[8]), .breakableBlocksBroken3(breakableBlocksBroken[13]), .breakableBlocksBroken4(breakableBlocksBroken[18]), .breakableBlocksBroken5(breakableBlocksBroken[23]), .breakableBlocksBroken6(breakableBlocksBroken[72]), .bombExplosion(bombExplosions[12]), .breakblock0(brokenBlocks[0+70]), .breakblock1(brokenBlocks[1+70]), .breakblock2(brokenBlocks[2+70]), .breakblock3(brokenBlocks[3+70]), .breakblock4(brokenBlocks[4+70]), .breakblock5(brokenBlocks[5+70]), .breakblock6(brokenBlocks[6+70]));
	bombHorizontalTop row22 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombyStart(140), .Bomby1(Bomby2), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[0]), .breakableBlocksBroken1(breakableBlocksBroken[4]), .breakableBlocksBroken2(breakableBlocksBroken[9]), .breakableBlocksBroken3(breakableBlocksBroken[14]), .breakableBlocksBroken4(breakableBlocksBroken[19]), .breakableBlocksBroken5(breakableBlocksBroken[24]), .breakableBlocksBroken6(breakableBlocksBroken[28]), .bombExplosion(bombExplosions[13]), .breakblock0(brokenBlocks[7+70]), .breakblock1(brokenBlocks[8+70]), .breakblock2(brokenBlocks[9+70]), .breakblock3(brokenBlocks[10+70]), .breakblock4(brokenBlocks[11+70]), .breakblock5(brokenBlocks[12+70]), .breakblock6(brokenBlocks[13+70]));
	bombHorizontalTop row32 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombyStart(220), .Bomby1(Bomby2), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[1]), .breakableBlocksBroken1(breakableBlocksBroken[5]), .breakableBlocksBroken2(breakableBlocksBroken[10]), .breakableBlocksBroken3(breakableBlocksBroken[15]), .breakableBlocksBroken4(breakableBlocksBroken[20]), .breakableBlocksBroken5(breakableBlocksBroken[25]), .breakableBlocksBroken6(breakableBlocksBroken[29]), .bombExplosion(bombExplosions[14]), .breakblock0(brokenBlocks[14+70]), .breakblock1(brokenBlocks[15+70]), .breakblock2(brokenBlocks[16+70]), .breakblock3(brokenBlocks[17+70]), .breakblock4(brokenBlocks[18+70]), .breakblock5(brokenBlocks[19+70]), .breakblock6(brokenBlocks[20+70]));
	bombHorizontalTop row42 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombyStart(300), .Bomby1(Bomby2), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[2]), .breakableBlocksBroken1(breakableBlocksBroken[6]), .breakableBlocksBroken2(breakableBlocksBroken[11]), .breakableBlocksBroken3(breakableBlocksBroken[16]), .breakableBlocksBroken4(breakableBlocksBroken[21]), .breakableBlocksBroken5(breakableBlocksBroken[26]), .breakableBlocksBroken6(breakableBlocksBroken[30]), .bombExplosion(bombExplosions[15]), .breakblock0(brokenBlocks[21+70]), .breakblock1(brokenBlocks[22+70]), .breakblock2(brokenBlocks[23+70]), .breakblock3(brokenBlocks[24+70]), .breakblock4(brokenBlocks[25+70]), .breakblock5(brokenBlocks[26+70]), .breakblock6(brokenBlocks[27+70]));
	bombHorizontalTop row52 (.clk(CLOCK_50), .reset(SW[9]), .x(x), .bomb1On(bomb2On), .bomb1Counter(bomb2Counter), .Bombx1(Bombx2), .BombyStart(380), .Bomby1(Bomby2), .y(y), .breakableBlocksBroken0(breakableBlocksBroken[69]), .breakableBlocksBroken1(breakableBlocksBroken[7]), .breakableBlocksBroken2(breakableBlocksBroken[12]), .breakableBlocksBroken3(breakableBlocksBroken[17]), .breakableBlocksBroken4(breakableBlocksBroken[22]), .breakableBlocksBroken5(breakableBlocksBroken[27]), .breakableBlocksBroken6(breakableBlocksBroken[74]), .bombExplosion(bombExplosions[16]), .breakblock0(brokenBlocks[28+70]), .breakblock1(brokenBlocks[29+70]), .breakblock2(brokenBlocks[30+70]), .breakblock3(brokenBlocks[31+70]), .breakblock4(brokenBlocks[32+70]), .breakblock5(brokenBlocks[33+70]), .breakblock6(brokenBlocks[34+70]));
	
	
endmodule

module testscreen_testbench();

	logic CLOCK_50;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [7:0] VGA_G, VGA_R, VGA_B;
	logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;
	integer i;
	
	testscreen dut (CLOCK_50, KEY, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	
	parameter CLOCK_PERIOD = 50;
	initial begin
	CLOCK_50 <= 0;
	forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50;
	end
	
	initial begin
	for (i = 0; i < 500; i++) begin
	@(posedge CLOCK_50);
	end
	$stop;
	end
endmodule