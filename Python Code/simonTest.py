from simon_leor import simonCipherLeor
from simon import SimonCipher
simon1 = simonCipherLeor(32,64,0x1234567890abcdef)
#newkey = simon1.create_key_schedule(0x1234567890abcdef)
#print(list(map(hex, simon1.key_schedule)))
w = SimonCipher(0x1234567890abcdef, key_size=64, block_size=32)
#print(list(map(hex, w.key_schedule)))

for i in range(1,32):
    print("round_%d : round port map (\n SUB_KEY => key_schedule(%d),\n U_PLNTXT => upper_ciphertext(%d),\n L_PLNTXT => lower_ciphertext(%d),\n U_CPHRTXT => upper_ciphertext(%d),\n L_CPHRTXT => lower_ciphertext(%d)\n );" %(i+1,i,i-1,i-1,i,i))
