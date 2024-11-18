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
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/seven_seg_output/seven_seg_counter \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/seven_seg_output/seven_segment_data \
sim:/simon_cipher_top_encrypt_decrypt_tb/DUT/seven_seg_output/trigger

run 15 ms
