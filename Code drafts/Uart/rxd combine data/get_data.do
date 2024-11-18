vcom uart_rxd_combine.vhd
vcom get_data.vhd
vcom get_data_tb.vhd
vsim get_data_tb

add wave -position insertpoint  \
sim:/get_data_tb/ciphertext_send_tb \
sim:/get_data_tb/counter \
sim:/get_data_tb/data_tb \
sim:/get_data_tb/rxd_data_tb \
sim:/get_data_tb/tb_RST  \
sim:/get_data_tb/DUT/all_data \
sim:/get_data_tb/DUT/ciphertext_send \
sim:/get_data_tb/DUT/data \
sim:/get_data_tb/DUT/data_combine_counter \
sim:/get_data_tb/DUT/data_internal \
sim:/get_data_tb/DUT/rxd_data_in \
sim:/get_data_tb/DUT/rxd_done_current \
sim:/get_data_tb/DUT/rxd_done_internal \
sim:/get_data_tb/DUT/rxd_done_prev  \
sim:/get_data_tb/DUT/rxd_do/Data_to_Cipher \
sim:/get_data_tb/DUT/rxd_do/internal_data \
sim:/get_data_tb/DUT/rxd_do/my_rxd_state_machine

run 20 ms
