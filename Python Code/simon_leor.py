from simon import SimonCipher

import binascii


def shift_right(word, bits, wordsize, modmask):
        a = (word << (wordsize - bits)) + (word >> bits) & modmask
        return a

def shift_left(word, bits, wordsize, modmask):
    a = (word >> (wordsize - bits)) + (word << bits) & modmask
    return a

def getBinary(word):
    return int(binascii.hexlify(word), 16)

class simonCipherLeor:

    z0 = '01100111000011010100100010111110110011100001101010010001011111'
    z1 = '01011010000110010011111011100010101101000011001001111101110001'
    z2 = '11001101101001111110001000010100011001001011000000111011110101'
    z3 = '11110000101100111001010001001000000111101001100011010111011011'
    z4 = '11110111001001010011000011101000000100011011010110011110001011'


    setups = {32: {64: (32, z0)},
              48: {72: (36, z0), 96: (36, z1)},
              64: {96: (42, z2), 128: (44, z3)},
              96: {96: (52, z2), 144: (54, z3)},
              128: {128: (68, z2), 192: (69, z3), 256: (72, z4)}}

    def __init__(self, blocksize, keysize, key):
        self.blocksize = blocksize
        self.keysize = keysize
        self.wordsize = self.blocksize >> 1
        self.m = self.keysize // self.wordsize
        self.modmask = (2**self.wordsize) - 1
        self.const = self.modmask ^ 3
        self.rounds, self.z = self.setups[self.blocksize][self.keysize]
        self.key = key
        self.key_schedule = self.create_key_schedule(key)

    def create_key_schedule(self, key):
        k = []
        
        for i in range(self.m):
            k.append(key >> (self.wordsize * i) & self.modmask)

        for i in range(self.m, self.rounds):
            sr3 = shift_right(k[i - 1], 3, self.wordsize, self.modmask)
            if self.m == 4:
                sr3 ^= k[i - 3]
            sr4 = shift_right(sr3, 1, self.wordsize, self.modmask)
            k.append(self.const ^ int(self.z[(i - self.m) % 62]) ^ k[i - self.m] ^ sr3 ^ sr4)

        return k


    def encrypt_round(self, lword, rword, key):
        sl1 = shift_left(lword, 1, self.wordsize, self.modmask)
        sl2 = shift_left(lword, 2, self.wordsize, self.modmask)
        sl8 = shift_left(lword, 8, self.wordsize, self.modmask)

        xor1 = (sl1 & sl8) ^ sl2
        xor2 = xor1 ^ rword
        xor3 = xor2 ^ key

        rword = lword
        lword = xor3

        return lword, rword

    def encrypt_all(self, plaintext):
        lword = plaintext >> (self.wordsize)
        rword = plaintext & ((2**(self.wordsize)) - 1)
        for i in range(self.rounds):
            lword, rword = self.encrypt_round(lword, rword, self.key_schedule[i])
        ciphertext = (lword << self.wordsize) + rword
        return ciphertext
    
    def decrypt_round(self, lword, rword, key):
        sl1 = shift_left(lword, 1, self.wordsize, self.modmask)
        sl2 = shift_left(lword, 2, self.wordsize, self.modmask)
        sl8 = shift_left(lword, 8, self.wordsize, self.modmask)

        xor1 = (sl1 & sl8) ^ sl2
        xor2 = xor1 ^ rword
        xor3 = xor2 ^ key

        rword = lword
        lword = xor3

        return lword, rword

    def decrypt_all(self, ciphertext):
        rword = ciphertext >> (self.wordsize)
        lword = ciphertext & ((2**(self.wordsize)) - 1)
        for i in range(self.rounds):
            lword, rword = self.encrypt_round(lword, rword, list(reversed(self.key_schedule))[i])
        plaintext = (rword << self.wordsize) + lword
        return plaintext
    
# def initialize():





