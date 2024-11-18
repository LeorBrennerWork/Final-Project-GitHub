vcom array_signal_pkg_128.vhd
vcom round_128.vhd
vcom sub_key_generator_128.vhd
vcom key_schedule_generator_128.vhd
vcom Simon_Cipher_Hierarchy_128.vhd
vcom Simon_Cipher_Hierarchy_128_tb.vhd
vsim Simon_Cipher_Hierarchy_128_tb
add wave -position insertpoint  \
sim:/simon_cipher_hierarchy_128_tb/tb_CLK \
sim:/simon_cipher_hierarchy_128_tb/tb_RST \
sim:/simon_cipher_hierarchy_128_tb/tb_PLNTXT \
sim:/simon_cipher_hierarchy_128_tb/DUT/current_plaintext \
sim:/simon_cipher_hierarchy_128_tb/DUT/new_plaintext \
sim:/simon_cipher_hierarchy_128_tb/tb_LOAD_PLNTXT \
sim:/simon_cipher_hierarchy_128_tb/tb_CPHRTXT \
sim:/simon_cipher_hierarchy_128_tb/tb_KEY \
sim:/simon_cipher_hierarchy_128_tb/DUT/current_key \
sim:/simon_cipher_hierarchy_128_tb/DUT/new_key \
sim:/simon_cipher_hierarchy_128_tb/tb_LOAD_KEY \
sim:/simon_cipher_hierarchy_128_tb/DUT/counter \

                      
radix hex

run 5000 ns

#force tb_KEY 16#1234567890abcdef
#force tb_PLNTXT 16#68656c6c

#quit -sim



