module audio (CLOCK_50, CLOCK2_50, KEY, SW, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT, p1_ext, p2_ext);

	input logic CLOCK_50, CLOCK2_50, p1_ext, p2_ext;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	// I2C Audio/Video config interface
	output logic FPGA_I2C_SCLK;
	inout wire FPGA_I2C_SDAT;
	// Audio CODEC
	output logic AUD_XCK;
	input logic AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input logic AUD_ADCDAT;
	output logic AUD_DACDAT;
	
	// Local logics.
	logic read_ready, write_ready, read, write;
	logic signed [23:0] readdata, readdata_left, readdata_right;
	logic signed [1:0] [23:0] readdata_indiv;
	logic signed [23:0] writedata_left, writedata_right;
	logic signed [23:0] writedata_left_unfiltered, writedata_right_unfiltered;
	logic signed [23:0] writedata_left_filtered, writedata_right_filtered;
	logic [31:0] divided_clocks;
	logic reset;
	logic read_write_ready;
	logic [1:0] [12:0] play_counters;
	logic audio_clk;
	logic [1:0] cycled, done, trig;
	
	assign read_write_ready = read_ready && write_ready;
	
	assign trig[0] = ~KEY[3] || p1_ext;
	assign trig[1] = ~KEY[0] || p2_ext;
	
	audio_rom p1_bomb (.address(play_counters[0]), .clock(CLOCK_50), .q(readdata_indiv[0]));
		defparam p1_bomb.init_file_extern = "bomb.mif";
	audio_rom p2_bomb (.address(play_counters[1]), .clock(CLOCK_50), .q(readdata_indiv[1]));
		defparam p2_bomb.init_file_extern = "bomb.mif";
	
	clock_divider cd (.clock(CLOCK_50), .reset(reset), .divided_clocks(divided_clocks));
	
	assign readdata = readdata_indiv[1] + readdata_indiv[0];
	assign audio_clk = divided_clocks[9]; // ~44.1kHz clock
	assign writedata_left = readdata << 2;
	assign writedata_right = readdata << 2;
	assign reset = SW[0];
	
	/////////////////////////////////
	// Your code goes here 
	/////////////////////////////////
	
	assign writedata_left_unfiltered = write_ready ? readdata_left : 0;
	assign writedata_right_unfiltered = write_ready ? readdata_right : 0;
	assign read = read_ready;
	assign write = write_ready;
	
	integer i;
	
	always @(posedge CLOCK_50) begin
		if (reset) begin
			play_counters <= 0;
		end
		else begin
			for (i = 0; i <= 1; i++) begin
				// Trigger once per audio_clk cycle
				if (trig[i] && audio_clk && ~cycled[i] && ~done[i]) begin
					play_counters[i] <= play_counters[i] + 1;
					cycled[i] <= 1;
				end
				else if (trig[i]) begin
					done[i] <= 0;
					play_counters[i] <= 0;
				end
					
				// Reset cycled signal
				if (~audio_clk)
					cycled[i] <= 0;
				
				// Prevent repeating
				if (play_counters[i] == 2**15-1)
					done[i] <= 1;
			end
		end
	end
	
	// SW[0] selects whether filtered or unfiltered audio is output
	
	
/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following logics:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);

endmodule

`timescale 1ps / 1ps
module audio_testbench();
	logic CLOCK_50, CLOCK2_50;
	logic [3:0] KEY;
	logic [9:0] SW;
	wire FPGA_I2C_SCLK, FPGA_I2C_SDAT;
	logic AUD_XCK;
	logic AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	logic AUD_ADCDAT;
	logic AUD_DACDAT;
	logic clk, p1_ext, p2_ext;
	
	assign clk = CLOCK_50;

	// Clock generation
	parameter PERIOD = 100; // period = length of clock
	initial begin
		CLOCK_50 <= 0;
		forever #(PERIOD/2) CLOCK_50 = ~CLOCK_50;
	end

	audio dut (.*); // ".*" Implicitly connects all ports to variables with matching names

	initial begin
		SW[0] <= 1; KEY[2] <= 1; @(posedge clk);
		SW[0] <= 0; @(posedge clk);
		
		repeat (10) @(posedge clk);
		
		KEY[2] <= 0; @(posedge clk);
		
		repeat (1000) @(posedge clk);

		$stop; // End simulation
	end
endmodule
