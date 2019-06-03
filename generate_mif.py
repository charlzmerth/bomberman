# Charlie Merth and Nathan Ness
# EE 371 Spring 2019, Lab 6

# This Python module contains generate_mif function
import numpy
import scipy.io.wavfile as wav

# Turns the given input WAV file (as string) into a .MIF

def generate_mif(input_wav, target):
	# Read the data and open the target file
    fs, data = wav.read(input_wav)
    file = open(target, "w")

	# Write metadata
    file.write("DEPTH = 8192;\n")
    file.write("WIDTH = 16;\n")
    file.write("ADDRESS_RADIX = DEC;\n")
    file.write("DATA_RADIX = DEC;\n\n")

    file.write("CONTENT\n")
    file.write("BEGIN\n")
    
	# Iterate through each sample
    for i in range(len(data)):
        file.write(str(i))
        file.write(': ')
        file.write(str(data[i]))
        file.write(';\n')
    
	# Pad the end of mif file if WAV contains less samples
    file.write("[{}..{}]: 0;".format(len(data), 2**13-1))
    file.write("\nEND;\n")
