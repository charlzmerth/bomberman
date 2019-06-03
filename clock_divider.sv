/*
	Charlie Merth and Nathan Ness
	EE 371 Spring 2019, Lab 6
	
	This module divides a clock into signals oscillating at
	halved frequencies. This was necessary to create the
	clock triggering audio samples.
	
	The audio sample we used was a WAV file with a sample
	frequency of 44.1kHz, therefore we were able to achieve
	a relatively close approximation of ~50kHz.
*/

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, reset, divided_clocks);
	input logic reset, clock;
	output logic [31:0] divided_clocks = 0;

	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end
endmodule
