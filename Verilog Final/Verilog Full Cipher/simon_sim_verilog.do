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
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_do/data_to_cipher \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_do/bit_index_counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_do/middle_counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/tb_txd_data_out_highest \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/final_ciphertext  \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/new_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/all_data \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_done_current \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_done_internal \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/rxd_done_prev \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_rxd_do/start_cipher \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_txd_do/txd_done_current \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_txd_do/txd_done_internal \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/full_txd_do/txd_done_prev \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/load_key \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/load_plntxt \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/start_cipher \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/counter \



radix hex
#radix /simon_cipher_top_encrypt_decrypt_tb/DUT/decrypt/counter unsigned
#radix /simon_cipher_top_encrypt_decrypt_tb/DUT/encrypt/counter unsigned

run 30 ms


