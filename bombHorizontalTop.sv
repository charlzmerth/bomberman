module bombHorizontalTop (clk, reset, x, bomb1On, bomb1Counter, Bombx1, BombyStart, Bomby1, y, breakableBlocksBroken0, breakableBlocksBroken1, breakableBlocksBroken2, breakableBlocksBroken3, breakableBlocksBroken4, breakableBlocksBroken5, breakableBlocksBroken6, bombExplosion, breakblock0, breakblock1, breakblock2, breakblock3, breakblock4, breakblock5, breakblock6);

input logic clk, reset, bomb1On;
input logic [9:0] Bombx1, x, BombyStart;
input logic [8:0] Bomby1, y;
input logic [28:0] bomb1Counter;
input logic breakableBlocksBroken0, breakableBlocksBroken1, breakableBlocksBroken2, breakableBlocksBroken3, breakableBlocksBroken4, breakableBlocksBroken5, breakableBlocksBroken6;
logic destroyOne;

output logic bombExplosion, breakblock0, breakblock1, breakblock2, breakblock3, breakblock4, breakblock5, breakblock6;

always_ff @(posedge clk) begin
if (reset) begin
	bombExplosion <= 0;
	breakblock0 <= 0;
	breakblock1 <= 0;
	breakblock2 <= 0;
	breakblock3 <= 0;
	breakblock4 <= 0;
	breakblock5 <= 0;
	breakblock6 <= 0;
	destroyOne = 1;
end
if((Bombx1 >= 60) && (Bombx1 <= 580)) begin
if ((Bombx1 >= 60) && (Bombx1 <= 100) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 420)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 340)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 260)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 180)) ||
													(!breakableBlocksBroken1 && (x >= 60) && (x <= 180)))) begin
													
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
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
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
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
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
end
	
	
	else if ((Bombx1 >= 100) && (Bombx1 <= 140) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 420)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 340)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 260)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 180)) ||
													(!breakableBlocksBroken1 && (x >= 60) && (x <= 180)) || 
													(!breakableBlocksBroken0 && (x >= 60) && (x <= 180)))) begin
													
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
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
		
	
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
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
		
	
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
end
	
	
	else if ((Bombx1 >= 140) && (Bombx1 <= 180) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 420)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 340)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 260)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken1 && (x >= 60) && (x <= 260)) ||
													(!breakableBlocksBroken1 && (x >= 60) && (x <= 260)) || 
													(!breakableBlocksBroken0 && (x >= 60) && (x <= 260)))) begin
													
	bombExplosion <= 1;
	
if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		breakblock1 <= 1;
		
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
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
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
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
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
end


	else if ((Bombx1 >= 180) && (Bombx1 <= 220) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (x >= 140) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (x >= 140) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (x >= 140) && (x <= 420)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken3 && breakableBlocksBroken2 && (x >= 140) && (x <= 340)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken2 && (x >= 140) && (x <= 260)) ||
													(!breakableBlocksBroken2 && (x >= 140) && (x <= 260)) ||
													(!breakableBlocksBroken1 && (x >= 140) && (x <= 260)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && (x >= 140) && (x <= 260)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && (x >= 60) && (x <= 260)))) begin
													
	bombExplosion <= 1;
	
	
	
	if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	end
	
	
	
	else if ((Bombx1 >= 220) && (Bombx1 <= 260) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 140) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 140) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 140) && (x <= 420)) ||
													(!breakableBlocksBroken4 && (x >= 140) && (x <= 340)) ||
													(!breakableBlocksBroken2 && (x >= 140) && (x <= 340)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && (x >= 140) && (x <= 340)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && (x >= 140) && (x <= 340)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && (x >= 60) && (x <= 340)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	end
	
	else if ((Bombx1 >= 260) && (Bombx1 <= 300) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 420)) ||
													(!breakableBlocksBroken4 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken3 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 140) && (x <= 340)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 60) && (x <= 340)))) begin
													
	bombExplosion <= 1;
	
	
	
	
	if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		if(!breakableBlocksBroken3) begin
			breakblock3 <= 0;
		end
		else begin
			breakblock3 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	end
	
	else if ((Bombx1 >= 300) && (Bombx1 <= 340) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 220) && (x <= 420)) ||
													(!breakableBlocksBroken4 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken3 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 140) && (x <= 340)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 60) && (x <= 340)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	end
	
	else if ((Bombx1 >= 340) && (Bombx1 <= 380) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 300) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 300) && (x <= 500)) ||
													(!breakableBlocksBroken5 && breakableBlocksBroken4 && (x >= 300) && (x <= 420)) ||
													(!breakableBlocksBroken4 && (x >= 300) && (x <= 340)) ||
													(!breakableBlocksBroken3 && (x >= 300) && (x <= 340)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 300) && (x <= 340)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 140) && (x <= 340)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 60) && (x <= 340)))) begin
													
	bombExplosion <= 1;
	
	
	
	
	if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken4) begin
			breakblock4 <= 0;
		end
		else begin
			breakblock4 <= 1;
		end
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	end
	
	else if ((Bombx1 >= 380) && (Bombx1 <= 420) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && (x >= 300) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && (x >= 300) && (x <= 500)) ||
													(!breakableBlocksBroken5 && (x >= 300) && (x <= 420)) ||
													(!breakableBlocksBroken3 && (x >= 300) && (x <= 340)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 300) && (x <= 340)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 220) && (x <= 340)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 140) && (x <= 340)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && (x >= 60) && (x <= 340)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	
	end
	
	
	
	
	else if ((Bombx1 >= 420) && (Bombx1 <= 460) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && breakableBlocksBroken5 && (x >= 380) && (x <= 580)) ||
													(!breakableBlocksBroken6 && breakableBlocksBroken5 && (x >= 380) && (x <= 500)) ||
													(!breakableBlocksBroken5 && (x >= 380) && (x <= 420)) ||
													(!breakableBlocksBroken4 && (x >= 380) && (x <= 420)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken4 && (x >= 380) && (x <= 420)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && (x >= 300) && (x <= 420)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && (x >= 220) && (x <= 420)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && (x >= 140) && (x <= 420)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && (x >= 60) && (x <= 420)))) begin
													
	bombExplosion <= 1;
	
	
	
	if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken6) begin
			breakblock6 <= 0;
		end
		else begin
			breakblock6 <= 1;
		end
	end
	
	else if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		if(!breakableBlocksBroken5) begin
			breakblock5 <= 0;
		end
		else begin
			breakblock5 <= 1;
		end
	end
	
	end
	
	else if ((Bombx1 >= 460) && (Bombx1 <= 500) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && (x >= 380) && (x <= 580)) ||
													(!breakableBlocksBroken6 && (x >= 380) && (x <= 500)) ||
													(!breakableBlocksBroken5 && (x >= 380) && (x <= 500)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 380) && (x <= 500)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 380) && (x <= 500)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 300) && (x <= 500)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 220) && (x <= 500)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 140) && (x <= 500)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 60) && (x <= 500)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
	if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		
	end
	
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
	end
	end
	else if ((Bombx1 >= 500) && (Bombx1 <= 540) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken6 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken5 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 380) && (x <= 580)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 300) && (x <= 580)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 220) && (x <= 580)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 140) && (x <= 580)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 60) && (x <= 580)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
	if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		
	end
	
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
	end
	end
	
else if ((Bombx1 >= 540) && (Bombx1 <= 580) && (y >= BombyStart) && (y <= (BombyStart + 40)) && (Bomby1 >= BombyStart) && (Bomby1 <= (BombyStart + 40)) && ((breakableBlocksBroken6 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken6 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken5 && (x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 460) && (x <= 580)) ||
													(!breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 380) && (x <= 580)) ||
													(!breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 300) && (x <= 580)) ||
													(!breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 220) && (x <= 580)) || 
													(!breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 140) && (x <= 580)) ||
													(breakableBlocksBroken0 && breakableBlocksBroken1 && breakableBlocksBroken2 && breakableBlocksBroken3 && breakableBlocksBroken4 && breakableBlocksBroken5 &&(x >= 60) && (x <= 580)))) begin
													
	bombExplosion <= 1;
	
	if(!breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
	if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
	end
		
		
		
	end
	
	else if(breakableBlocksBroken6 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock6 <= 1;
		if(!breakableBlocksBroken5 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock5 <= 1;
		destroyOne = 0;
		end
		else if(!breakableBlocksBroken4 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock4 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken3 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock3 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken2 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock2 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken1 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock1 <= 1;
		destroyOne = 0;
	end
	else if(!breakableBlocksBroken0 && ((bomb1On) && (destroyOne == 1)) && (bomb1Counter >= 199999000)) begin
		breakblock0 <= 1;
		destroyOne = 0;
	end
	else begin
	destroyOne = 0;
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