vcom uart_txd_combine.vhd
vcom send_data.vhd
vcom send_data_tb.vhd
vsim send_data_tb

add wave -position insertpoint  \
sim:/send_data_tb/ciphertext_send_tb \
sim:/send_data_tb/data_tb \
sim:/send_data_tb/tb_CLK \
sim:/send_data_tb/tb_RST \
sim:/send_data_tb/txd_data_out_top_tb  \
sim:/send_data_tb/DUT/ciphertext_send \
sim:/send_data_tb/DUT/ciphertext_send_hold \
sim:/send_data_tb/DUT/data \
sim:/send_data_tb/DUT/data_divide_counter \
sim:/send_data_tb/DUT/send_data_internal \
sim:/send_data_tb/DUT/txd_do/baud_rdy \
sim:/send_data_tb/DUT/txd_data_out_top \
sim:/send_data_tb/DUT/start_transmission \
sim:/send_data_tb/DUT/txd_done_internal \
sim:/send_data_tb/DUT/txd_done_prev \
sim:/send_data_tb/DUT/txd_done_current \


run 10 ms