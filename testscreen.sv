module testscreen (CLOCK_50, LEDR, SW, VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS, PS2_DAT, PS2_CLK);

	input logic CLOCK_50, PS2_CLK, PS2_DAT;
	input logic [9:0] SW;
	
	output logic [9:0] LEDR;
	output logic [7:0] VGA_G, VGA_R, VGA_B;
	output logic VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS;	

	logic [9:0] x, playerX, playerX2, Bombx1, Bombx2;
	logic [8:0] y, playerY, playerY2, Bomby1, Bomby2;
	logic [7:0] r, g, b;
	logic [17:0] buttonCounterUp2, buttonCounterDown2, buttonCounterLeft2, buttonCounterRight2; 
	logic [17:0] buttonCounterUp, buttonCounterDown, buttonCounterLeft, buttonCounterRight;
	logic bomb1On, bomb2On, player1Alive, player2Alive;
	logic [28:0] bomb1Counter, bomb2Counter;
	logic [23:0] bomb1Detonate, bomb2Detonate;
	logic [30:0] breakableBlocksBroken;
	
	logic [3:0] KEY, p1_move, p2_move;
	logic p1_bomb, p2_bomb;
	
	assign reset = SW[9];
	assign KEY = p1_move;
	
	assign LEDR[8:5] = p1_move;
	assign LEDR[3:0] = p2_move;

	player_input pi (.clk(CLOCK_50), .reset, .PS2_CLK, .PS2_DAT, .p1_move, .p2_move, .p1_bomb, .p2_bomb);
	
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
		breakableBlocksBroken <= 0;
	end
		else begin
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
		end
		else if((bomb1On) && ((bomb1Counter >= 200000000))) begin
			bomb1Detonate <= bomb1Detonate + 1;
			if(bomb1Detonate > 8097000) begin
				bomb1On <= 0;
				bomb1Detonate <= 0;
				bomb1Counter <= 0;
			end
		end
		
		
		
		if((bomb2On) && (bomb2Counter < 200000000)) begin
			bomb2Counter <= bomb2Counter + 1;
		end
		else if((bomb2On) && ((bomb2Counter >= 200000000))) begin
			bomb2Detonate <= bomb2Detonate + 1;
			if(bomb2Detonate > 8097000) begin
				bomb2On <= 0;
				bomb2Detonate <= 0;
				bomb2Counter <= 0;
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
		
		
		
		
		else if ((bomb1On) && ((bomb1Counter >= 200000000)) && (((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 460)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (!breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 380)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (!breakableBlocksBroken[3]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 300)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (!breakableBlocksBroken[2]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 220)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(breakableBlocksBroken[0]) && (!breakableBlocksBroken[1]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 140)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420))) && 
(!breakableBlocksBroken[0]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (breakableBlocksBroken[19])) ||





((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 460)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (!breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 380)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (!breakableBlocksBroken[3]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 300)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (!breakableBlocksBroken[2]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 220)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(breakableBlocksBroken[0]) && (!breakableBlocksBroken[1]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 140)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 300))) && 
(!breakableBlocksBroken[0]) &&
(breakableBlocksBroken[5]) && (breakableBlocksBroken[12]) && (!breakableBlocksBroken[19])) ||


((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 460)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (!breakableBlocksBroken[4]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 380)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (!breakableBlocksBroken[3]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 300)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (!breakableBlocksBroken[2]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 220)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(breakableBlocksBroken[0]) && (!breakableBlocksBroken[1]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 140)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 220))) && 
(!breakableBlocksBroken[0]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||



((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (breakableBlocksBroken[4]) &&
(!breakableBlocksBroken[5]))  ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 460)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (breakableBlocksBroken[3]) && (!breakableBlocksBroken[4]) &&
(!breakableBlocksBroken[5]))  ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 380)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (breakableBlocksBroken[2]) && (!breakableBlocksBroken[3]) &&
(!breakableBlocksBroken[5]))  ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 300)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(breakableBlocksBroken[0]) && (breakableBlocksBroken[1]) && (!breakableBlocksBroken[2]) &&
(!breakableBlocksBroken[5]))  ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 220)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(breakableBlocksBroken[0]) && (!breakableBlocksBroken[1]) &&
(breakableBlocksBroken[5]) && (!breakableBlocksBroken[12])) ||

((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 140)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 140))) && 
(!breakableBlocksBroken[0]) &&
(!breakableBlocksBroken[5]))  ||






		
		
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 60) && (Bombx1 <= 100) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 100) && (Bombx1 <= 140) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 100) && (Bombx1 <= 140) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 100) && (Bombx1 <= 140) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 100) && (Bombx1 <= 140) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 100) && (Bombx1 <= 140) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 140) && (Bombx1 <= 180) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 180) && (Bombx1 <= 220) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 180) && (Bombx1 <= 220) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 180) && (Bombx1 <= 220) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 180) && (Bombx1 <= 220) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 180) && (Bombx1 <= 220) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) ||
																				  
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 220) && (Bombx1 <= 260) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 260) && (Bombx1 <= 300) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 260) && (Bombx1 <= 300) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 260) && (Bombx1 <= 300) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 260) && (Bombx1 <= 300) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 260) && (Bombx1 <= 300) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 300) && (Bombx1 <= 340) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 340) && (Bombx1 <= 380) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 340) && (Bombx1 <= 380) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 340) && (Bombx1 <= 380) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 340) && (Bombx1 <= 380) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 340) && (Bombx1 <= 380) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) ||
																				  
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 380) && (Bombx1 <= 420) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 420) && (Bombx1 <= 460) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 420) && (Bombx1 <= 460) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 420) && (Bombx1 <= 460) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 420) && (Bombx1 <= 460) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 420) && (Bombx1 <= 460) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 460) && (Bombx1 <= 500) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx1 >= 500) && (Bombx1 <= 540) && (Bomby1 >= 60) && (Bomby1 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx1 >= 500) && (Bombx1 <= 540) && (Bomby1 >= 140) && (Bomby1 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx1 >= 500) && (Bombx1 <= 540) && (Bomby1 >= 220) && (Bomby1 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx1 >= 500) && (Bombx1 <= 540) && (Bomby1 >= 300) && (Bomby1 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx1 >= 500) && (Bombx1 <= 540) && (Bomby1 >= 380) && (Bomby1 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 60) && (Bomby1 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 100) && (Bomby1 <= 140) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 140) && (Bomby1 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 180) && (Bomby1 <= 220) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 220) && (Bomby1 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 260) && (Bomby1 <= 300) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 300) && (Bomby1 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 340) && (Bomby1 <= 380) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx1 >= 540) && (Bombx1 <= 580) && (Bomby1 >= 380) && (Bomby1 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))))) begin
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
		
		
		else if ((bomb2On) && ((bomb2Counter >= 200000000)) && (((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 60) && (Bombx2 <= 100) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 60) && (x <= 100) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 100) && (Bombx2 <= 140) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 100) && (Bombx2 <= 140) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 100) && (Bombx2 <= 140) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 100) && (Bombx2 <= 140) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 100) && (Bombx2 <= 140) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 140) && (Bombx2 <= 180) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 140) && (x <= 180) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 180) && (Bombx2 <= 220) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 180) && (Bombx2 <= 220) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 180) && (Bombx2 <= 220) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 180) && (Bombx2 <= 220) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 180) && (Bombx2 <= 220) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) ||
																				  
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 220) && (Bombx2 <= 260) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 220) && (x <= 260) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 260) && (Bombx2 <= 300) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 260) && (Bombx2 <= 300) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 260) && (Bombx2 <= 300) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 260) && (Bombx2 <= 300) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 260) && (Bombx2 <= 300) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 300) && (Bombx2 <= 340) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 300) && (x <= 340) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 340) && (Bombx2 <= 380) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 340) && (Bombx2 <= 380) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 340) && (Bombx2 <= 380) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 340) && (Bombx2 <= 380) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 340) && (Bombx2 <= 380) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) ||
																				  
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 380) && (Bombx2 <= 420) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 380) && (x <= 420) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 420) && (Bombx2 <= 460) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 420) && (Bombx2 <= 460) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 420) && (Bombx2 <= 460) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 420) && (Bombx2 <= 460) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 420) && (Bombx2 <= 460) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 460) && (Bombx2 <= 500) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 460) && (x <= 500) && (y >= 60) && (y <= 420)))) || 
																				  
																				  ((Bombx2 >= 500) && (Bombx2 <= 540) && (Bomby2 >= 60) && (Bomby2 <= 100) && (x >= 60) && (x <= 580) && (y >= 60) && (y <= 100)) || 
																				  ((Bombx2 >= 500) && (Bombx2 <= 540) && (Bomby2 >= 140) && (Bomby2 <= 180) && (x >= 60) && (x <= 580) && (y >= 140) && (y <= 180)) || 
																				  ((Bombx2 >= 500) && (Bombx2 <= 540) && (Bomby2 >= 220) && (Bomby2 <= 260) && (x >= 60) && (x <= 580) && (y >= 220) && (y <= 260)) || 
																				  ((Bombx2 >= 500) && (Bombx2 <= 540) && (Bomby2 >= 300) && (Bomby2 <= 340) && (x >= 60) && (x <= 580) && (y >= 300) && (y <= 340)) || 
																				  ((Bombx2 >= 500) && (Bombx2 <= 540) && (Bomby2 >= 380) && (Bomby2 <= 420) && (x >= 60) && (x <= 580) && (y >= 380) && (y <= 420)) || 
																				  
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 60) && (Bomby2 <= 100) && (((y >= 60) && (y <= 100) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 100) && (Bomby2 <= 140) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 140) && (Bomby2 <= 180) && (((y >= 140) && (y <= 180) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 180) && (Bomby2 <= 220) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 220) && (Bomby2 <= 260) && (((y >= 220) && (y <= 260) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 260) && (Bomby2 <= 300) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 300) && (Bomby2 <= 340) && (((y >= 300) && (y <= 340) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)))) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 340) && (Bomby2 <= 380) && (x >= 540) && (x <= 580) && (y >= 60) && (y <= 420)) || 
																				  ((Bombx2 >= 540) && (Bombx2 <= 580) && (Bomby2 >= 380) && (Bomby2 <= 420) && (((y >= 380) && (y <= 420) && (x >= 60) && (x <= 580)) || ((x >= 540) && (x <= 580) && (y >= 60) && (y <= 420))))))begin
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