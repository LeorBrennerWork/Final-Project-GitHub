vcom array_signal_pkg.vhd
vcom round.vhd
vcom sub_key_generator.vhd
vcom key_schedule_generator.vhd
vcom Simon_Cipher_Hierarchy_Encrypt.vhd
vcom Simon_Cipher_Hierarchy_Decrypt.vhd
vcom simon_cipher_top_encrypt_decrypt.vhd
vcom get_data.vhd
vcom send_data.vhd
vcom uart_rxd_combine.vhd
vcom uart_txd_combine.vhd
vcom simon_cipher_top_encrypt_decrypt_tb.vhd
vsim simon_cipher_top_encrypt_decrypt_tb

add wave -position insertpoint  \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_CLK \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_RST \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_rxd_data_in_highest \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_txd_data_out_highest \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/all_data \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/final_ciphertext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/counter_start_reg \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/counter_start_reg \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/KEY \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/LOAD_KEY \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/LOAD_PLNTXT \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/PLNTXT \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/KEY \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/LOAD_KEY \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/LOAD_PLNTXT \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/new_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/new_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/PLNTXT \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ed_mux \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_current \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_current_decrypt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_current_encrypt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_internal_decrypt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_internal_encrypt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_prev_decrypt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/ciphertext_done_prev_encrypt \

radix hex

run 15 ms




