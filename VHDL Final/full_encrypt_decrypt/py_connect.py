import serial
import binascii

# Open serial connection to Basys3
ser = serial.Serial(port='COM4', baudrate=9600, parity=serial.PARITY_NONE, timeout=1)

# Receive key abd convert into bytes
#key = input("Enter key: ")
key = "0asdfghjk" #0 is for encrypt
padded_key = key.zfill(9)
if len(padded_key) != 9:
    raise ValueError("Key cannot be more than 8 characters")
print(padded_key)
encoded_padded_key = key.encode('utf-8')

# Receive plaintext, divide it into byte sized strings, convert into bytes
#plntxt = input("Enter plaintext: ")
plntxt = "eehwfdsa"
plntxt_list = []
for i in range(0,len(plntxt),4):
    plntxt_list.append(plntxt[i:i+4])

plntxt_list[-1] = plntxt_list[-1].zfill(4)
encoded_bytes_list = []
for single_plntxt in plntxt_list:
    encoded_bytes_list.append(single_plntxt.encode('utf-8'))


# Input all parts of the plaintext with the same key
i = 0
for i in range(len(encoded_bytes_list)):
    ser.write(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")
    ser.write(encoded_padded_key)
    print(encoded_padded_key)
    next_cphrtxt = binascii.unhexlify("a9815973")
    ser.write(next_cphrtxt)
    # ser.write(encoded_bytes_list[i])
    # print(encoded_bytes_list[i])

# Capture final ciphertext by appending the individual ciphertexts that have been received
final_cphrtxt = b""
i=0
while i<len(plntxt_list)*2:
    cphrtxt = ser.read(4)
    if i%2:
        print(cphrtxt)
        final_cphrtxt += cphrtxt
    i+=1

# Convert ciphertext to utf-8 characters
final_cphrtxt = binascii.b2a_hex(final_cphrtxt)
final_cphrtxt = final_cphrtxt.decode('utf-8')
next_cphrtxt = binascii.unhexlify(final_cphrtxt)
print(final_cphrtxt)
print(next_cphrtxt)