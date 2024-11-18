vcom full_cipher_uart.vhd
vcom get_data.vhd
vcom send_data.vhd
vcom uart_rxd_combine.vhd
vcom uart_txd_combine.vhd
vcom full_cipher_uart_tb.vhd
vsim full_cipher_uart_tb

add wave -position insertpoint  \
sim:/full_cipher_uart_tb/tb_CLK \
sim:/full_cipher_uart_tb/tb_RST \
sim:/full_cipher_uart_tb/rxd_data_in_highest_tb \
sim:/full_cipher_uart_tb/DUT/rxd_data_in_highest \
sim:/full_cipher_uart_tb/txd_data_out_highest_tb \
sim:/full_cipher_uart_tb/DUT/txd_data_out_highest \
sim:/full_cipher_uart_tb/DUT/rxd_done_internal \
sim:/full_cipher_uart_tb/DUT/ciphertext_send_internal \
sim:/full_cipher_uart_tb/DUT/all_data \
sim:/full_cipher_uart_tb/DUT/final_ciphertext \
sim:/full_cipher_uart_tb/DUT/full_txd_do/data_divide_counter \
sim:/full_cipher_uart_tb/DUT/full_txd_do/txd_done_current \
sim:/full_cipher_uart_tb/DUT/full_txd_do/txd_done_internal \
sim:/full_cipher_uart_tb/DUT/full_txd_do/txd_done_prev


run 30 ms