vlog seven_segment.v
vlog round.v
vlog sub_key_generator.v
vlog key_schedule_generator.v
vlog Simon_Cipher_Hierarchy_Encrypt.v
vlog Simon_Cipher_Hierarchy_Decrypt.v
vlog simon_cipher_top_encrypt_decrypt.v
vlog get_data.v
vlog send_data.v
vlog uart_rxd_combine.v
vlog uart_txd_combine.v
vlog simon_cipher_top_encrypt_decrypt_tb.v
vsim simon_cipher_top_encrypt_decrypt_tb

add wave -position insertpoint  \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_clk \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_rst \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_rxd_data_in_highest \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_txd_data_out_highest \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/final_ciphertext  \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/all_data \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_subkey \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/lower_ciphertext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/lower_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/upper_ciphertext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/upper_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/round_counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/round_clock


radix hex


run 16 ms


