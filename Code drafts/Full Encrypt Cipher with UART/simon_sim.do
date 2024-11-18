vcom array_signal_pkg.vhd
vcom round.vhd
vcom sub_key_generator.vhd
vcom key_schedule_generator.vhd
vcom Simon_Cipher_Hierarchy.vhd
vcom simon_cipher_top.vhd
vcom get_data.vhd
vcom send_data.vhd
vcom uart_rxd_combine.vhd
vcom uart_txd_combine.vhd
vcom simon_cipher_top_tb.vhd
vsim simon_cipher_top_tb

add wave -position insertpoint  \
sim:/simon_cipher_top_tb/tb_CLK \
sim:/simon_cipher_top_tb/tb_RST \
sim:/simon_cipher_top_tb/tb_rxd_data_in_highest \
sim:/simon_cipher_top_tb/tb_txd_data_out_highest \
sim:/simon_cipher_top_tb/DUT/all_data \
sim:/simon_cipher_top_tb/DUT/final_ciphertext_new \
sim:/simon_cipher_top_tb/DUT/encrypt/CPHRTXT \
sim:/simon_cipher_top_tb/DUT/encrypt/current_key \
sim:/simon_cipher_top_tb/DUT/encrypt/current_plaintext \
sim:/simon_cipher_top_tb/DUT/encrypt/KEY \
sim:/simon_cipher_top_tb/DUT/encrypt/new_key \
sim:/simon_cipher_top_tb/DUT/encrypt/new_plaintext \
sim:/simon_cipher_top_tb/DUT/encrypt/PLNTXT \
sim:/simon_cipher_top_tb/DUT/encrypt/counter \
sim:/simon_cipher_top_tb/DUT/encrypt/counter_start_reg \
sim:/simon_cipher_top_tb/DUT/encrypt/CPHRTXT_RDY \
sim:/simon_cipher_top_tb/DUT/encrypt/LOAD_KEY \
sim:/simon_cipher_top_tb/DUT/encrypt/LOAD_PLNTXT \
sim:/simon_cipher_top_tb/DUT/encrypt/START_CIPHER \
sim:/simon_cipher_top_tb/DUT/rxd_done_current \
sim:/simon_cipher_top_tb/DUT/rxd_done_internal \
sim:/simon_cipher_top_tb/DUT/rxd_done_prev \
sim:/simon_cipher_top_tb/DUT/load_key_internal \
sim:/simon_cipher_top_tb/DUT/load_plntxt_internal \
sim:/simon_cipher_top_tb/DUT/ciphertext_done_current \
sim:/simon_cipher_top_tb/DUT/ciphertext_done_internal \
sim:/simon_cipher_top_tb/DUT/ciphertext_done_prev \
sim:/simon_cipher_top_tb/DUT/rxd_data_in_highest \
sim:/simon_cipher_top_tb/DUT/txd_data_out_highest \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/all_data \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/data \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/data_combine_counter \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/data_internal \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_data_in_top \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_done_current \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_done_internal \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_done_prev \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/start_cipher \
sim:/simon_cipher_top_tb/DUT/full_txd_do/ciphertext_send \
sim:/simon_cipher_top_tb/DUT/full_txd_do/ciphertext_send_hold \
sim:/simon_cipher_top_tb/DUT/full_txd_do/data \
sim:/simon_cipher_top_tb/DUT/full_txd_do/data_divide_counter \
sim:/simon_cipher_top_tb/DUT/full_txd_do/send_data_internal \
sim:/simon_cipher_top_tb/DUT/full_txd_do/start_transmission \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_data_out_top \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_done_current \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_done_internal \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_done_prev \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_do/Data_to_Cipher \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_do/my_rxd_state_machine \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_do/rxd_data_in \
sim:/simon_cipher_top_tb/DUT/full_rxd_do/rxd_do/rxd_done \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_do/bit_index_counter \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_do/end_of_txd \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_do/input_data \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_do/Start_txd \
sim:/simon_cipher_top_tb/DUT/full_txd_do/txd_do/txd_data_out

radix hex

run 20 ms




