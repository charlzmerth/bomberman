module audio (CLOCK_50, CLOCK2_50, KEY, SW, FPGA_I2C_SCLK, FPGA_I2C_SDAT, AUD_XCK, 
		        AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK, AUD_ADCDAT, AUD_DACDAT);

	input CLOCK_50, CLOCK2_50;
	input [3:0] KEY;
	input [9:0] SW;
	// I2C Audio/Video config interface
	output FPGA_I2C_SCLK;
	inout FPGA_I2C_SDAT;
	// Audio CODEC
	output AUD_XCK;
	input AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK;
	input AUD_ADCDAT;
	output AUD_DACDAT;
	
	// Local wires.
	wire read_ready, write_ready, read, write;
	wire signed [23:0] readdata, readdata_left, readdata_right;
	wire signed [23:0] writedata_left, writedata_right;
	wire signed [23:0] writedata_left_unfiltered, writedata_right_unfiltered;
	wire signed [23:0] writedata_left_filtered, writedata_right_filtered;
	wire [31:0] divided_clocks;
	wire reset = SW[0];
	wire read_write_ready = read_ready && write_ready;
	reg [13:0] play_counter;
	wire audio_clk;
	reg cycled;
	
	audio_rom ar (.address(play_counter), .clock(CLOCK_50), .q(readdata));
	clock_divider cd (.clock(CLOCK_50), .reset(reset), .divided_clocks(divided_clocks));
	
	assign audio_clk = divided_clocks[9]; // ~44.1kHz clock
	assign readdata_left = readdata << 5;
	assign readdata_right = readdata << 5;
	
	/////////////////////////////////
	// Your code goes here 
	/////////////////////////////////
	
	assign writedata_left_unfiltered = write_ready ? readdata_left : 0;
	assign writedata_right_unfiltered = write_ready ? readdata_right : 0;
	assign read = read_ready;
	assign write = write_ready;
	
	always @(posedge CLOCK_50) begin
		if (reset) begin
			play_counter <= 0;
		end
		else if (~KEY[2] && audio_clk && ~cycled) begin
			play_counter <= play_counter + 1;
			cycled <= 1;
		end
		if (~audio_clk)
			cycled <= 0;
	end
	
	// SW[0] selects whether filtered or unfiltered audio is output
	
	
/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
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

