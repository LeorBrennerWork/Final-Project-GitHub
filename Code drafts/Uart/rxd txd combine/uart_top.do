vcom uart_rxd.vhd
vcom uart_txd.vhd
vcom uart_top.vhd
vcom uart_top_tb.vhd
vsim uart_top_tb

add wave -position insertpoint  \
sim:/uart_top_tb/DUT/rxd_data \
sim:/uart_top_tb/DUT/txd_data \
sim:/uart_top_tb/DUT/data \
sim:/uart_top_tb/DUT/data_internal \
sim:/uart_top_tb/DUT/rxd_do/Data_to_Cipher \
sim:/uart_top_tb/DUT/rxd_do/rxd_done \
sim:/uart_top_tb/DUT/rxd_done_current \
sim:/uart_top_tb/DUT/send_data_internal \
sim:/uart_top_tb/DUT/rxd_do/my_rxd_state_machine \
sim:/uart_top_tb/DUT/all_data \
sim:/uart_top_tb/DUT/data_internal \
sim:/uart_top_tb/DUT/data_combine_counter \
sim:/uart_top_tb/DUT/data_divide_counter \
sim:/uart_top_tb/DUT/ciphertext_send \
sim:/uart_top_tb/DUT/ciphertext_send_hold

run 20 ms
