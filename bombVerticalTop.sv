module bombVerticalTop (clk, reset, x, bomb1On, bomb1Counter, Bombx1, BombxStart, Bomby1, y, breakableBlocksBroken0, breakableBlocksBroken1, breakableBlocksBroken2, breakableBlocksBroken3, breakableBlocksBroken4, bombExplosion, breakblock0, breakblock1, breakblock2, breakblock3, breakblock4);

input logic clk, reset, bomb1On;
input logic [9:0] Bombx1, x, BombxStart;
input logic [8:0] Bomby1, y;
input logic [28:0] bomb1Counter;
input logic breakableBlocksBroken0, breakableBlocksBroken1, breakableBlocksBroken2, breakableBlocksBroken3, breakableBlocksBroken4;
logic destroyOne;

output logic bombExplosion, breakblock0, breakblock1, breakblock2, breakblock3, breakblock4;

always_ff @(posedge clk) begin
if (reset) begin
	bombExplosion <= 0;
	breakblock0 <= 0;
	breakblock1 <= 0;
	breakblock2 <= 0;
	breakblock3 <= 0;
	breakblock4 <= 0;
	destroyOne = 1;
end
if((Bomby1 >= 60) && (Bomby1 <= 420)) begin
if ((Bomby1 >= 60) && (Bomby1 <= 100) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && (y >= 60) && (y <= 420)) ||
													(breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && !breakableBlocksBroken4 && (y >= 60) && (y <= 340)) ||
													(breakableBlocksBroken1 && breakableBlocksBroken2 && !breakableBlocksBroken3 && (y >= 60) && (y <= 260)) ||
													(breakableBlocksBroken1 && !breakableBlocksBroken2 && (y >= 60) && (y <= 180)) ||
													(!breakableBlocksBroken1 && (y >= 60) && (y <= 180)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
end
else if ((Bomby1 >= 100) && (Bomby1 <= 140) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && (((y >= 60) && (y <= 140)) || 
																																			 (!breakableBlocksBroken1 && (y >= 140) && (y <= 180)) ||
																																			 (!breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 180)) ||
																																			 (!breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 260)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 340)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
end

else if ((Bomby1 >= 140) && (Bomby1 <= 180) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && (((y >= 60) && (y <= 220)) || 
																																			 (!breakableBlocksBroken2 && (y >= 60) && (y <= 220)) ||
																																			 (!breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 60) && (y <= 260)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 60) && (y <= 340)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 60) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if((!breakableBlocksBroken1 || !breakableBlocksBroken0) && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		breakblock0 <= 1;
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	

	
	if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		
	end
end
else if ((Bomby1 >= 180) && (Bomby1 <= 220) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && (y >= 60) && (y <= 220)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken1 && (y >= 140) && (y <= 220)) ||
																																			 (!breakableBlocksBroken1 && (y >= 140) && (y <= 260)) ||
																																			 (!breakableBlocksBroken2 && (y >= 140) && (y <= 260)) ||
																																			 (!breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 140) && (y <= 260)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 140) && (y <= 340)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (y >= 140) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
	
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		
	end
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
end

else if ((Bomby1 >= 220) && (Bomby1 <= 260) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && (y >= 60) && (y <= 340)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken1 && (y >= 140) && (y <= 340)) ||
																																			 (!breakableBlocksBroken1 && (y >= 140) && (y <= 340)) ||
																																			 (!breakableBlocksBroken3 && (y >= 140) && (y <= 340)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && (y >= 140) && (y <= 340)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3  && (y >= 140) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
	
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		
	end
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	
	
end
else if ((Bomby1 >= 260) && (Bomby1 <= 300) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && (y >= 60) && (y <= 340)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 340)) ||
																																			 (!breakableBlocksBroken1 && breakableBlocksBroken2 && (y >= 220) && (y <= 340)) ||
																																			 (!breakableBlocksBroken2 && (y >= 220) && (y <= 340)) ||
																																			 (!breakableBlocksBroken3 && (y >= 220) && (y <= 340)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && (y >= 220) && (y <= 340)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3  && (y >= 220) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
	
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		
		
	end
	end
	else if(breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	
	
end

else if ((Bomby1 >= 300) && (Bomby1 <= 340) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && (y >= 60) && (y <= 420)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken2 && breakableBlocksBroken1 && (y >= 140) && (y <= 420)) ||
																																			 (!breakableBlocksBroken1 && breakableBlocksBroken2 && (y >= 220) && (y <= 420)) ||
																																			 (!breakableBlocksBroken2 && (y >= 220) && (y <= 420)) ||
																																			 (!breakableBlocksBroken3 && (y >= 220) && (y <= 420)) ||
																																			 (!breakableBlocksBroken4 && breakableBlocksBroken3 && (y >= 220) && (y <= 420)) ||
																																			 (breakableBlocksBroken4 && breakableBlocksBroken3  && (y >= 220) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
	
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		
		
	end
	end
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	
	
	
	
end





else if ((Bomby1 >= 340) && (Bomby1 <= 380) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 60) && (y <= 420)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken2 && breakableBlocksBroken1 && breakableBlocksBroken3 && (y >= 140) && (y <= 420)) ||
																																			 (!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 220) && (y <= 420)) ||
																																			 (!breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 300) && (y <= 420)) ||
																																			 (!breakableBlocksBroken3 && (y >= 300) && (y <= 420)) ||
																																			 (!breakableBlocksBroken4 && (y >= 300) && (y <= 420)) ||
																																			 (breakableBlocksBroken4 && (y >= 300) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	
	if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
		
		else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
		
		else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	
	
	
	
end


else if ((Bomby1 >= 380) && (Bomby1 <= 420) && (x >= BombxStart) && (x <= (BombxStart + 40)) && (Bombx1 >= BombxStart) && (Bombx1 <= (BombxStart + 40)) && ((breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 60) && (y <= 420)) ||
																																			 (!breakableBlocksBroken0 && breakableBlocksBroken2 && breakableBlocksBroken1 && breakableBlocksBroken3 && (y >= 140) && (y <= 420)) ||
																																			 (!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 220) && (y <= 420)) ||
																																			 (!breakableBlocksBroken2 && breakableBlocksBroken3 && (y >= 300) && (y <= 420)) ||
																																			 (!breakableBlocksBroken3 && (y >= 300) && (y <= 420)) ||
																																			 (!breakableBlocksBroken4 && (y >= 300) && (y <= 420)) ||
																																			 (breakableBlocksBroken4 && (y >= 300) && (y <= 420)))) begin
	bombExplosion <= 1;
	
	
	if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
		
		else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	else if(breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
		
		else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		
		if(!breakableBlocksBroken0) begin
			breakblock0 <= 0;
		end
		else begin
			breakblock0 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
		
		if(!breakableBlocksBroken1) begin
			breakblock1 <= 0;
		end
		else begin
			breakblock1 <= 1;
		end
		
		if(!breakableBlocksBroken2) begin
			breakblock2 <= 0;
		end
		else begin
			breakblock2 <= 1;
		end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		
	end
	end
	
	
	
	
	
end



else begin
	bombExplosion <= 0;
end
end
else begin
	bombExplosion <= 0;
	destroyOne = 1;
end
end
	endmodule