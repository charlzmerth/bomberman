import numpy
import scipy.io.wavfile as wav

def generate_mif(input_wav, target):

    fs, y = wav.read(input_wav)
    data = [item[0] for item in y]

    file = open(target, "w")


    file.write("DEPTH = 8192;\n")
    file.write("WIDTH = 16;\n")
    file.write("ADDRESS_RADIX = DEC;\n")
    file.write("DATA_RADIX = DEC;\n\n")

    file.write("CONTENT\n")
    file.write("BEGIN\n")
    
    for i in range(len(data)):
        file.write(str(i))
        file.write(': ')
        file.write(str(data[i]))
        file.write(';\n')
    
    file.write("[{}..{}]: 0;".format(len(data), 2**13-1))
    file.write("\nEND;\n")

generate_mif("./samples/snare.wav", "test.mif")
