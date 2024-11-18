vcom uart_txd.vhd
vcom uart_txd_tb.vhd
vsim uart_txd_tb

add wave -position insertpoint  \
sim:/uart_txd_tb/switches_tb
add wave -position insertpoint  \
sim:/uart_txd_tb/Start_txd_tb
add wave -position insertpoint  \
sim:/uart_txd_tb/txd_data_out_tb
add wave -position insertpoint  \
sim:/uart_txd_tb/tb_CLK
add wave -position insertpoint  \
sim:/uart_txd_tb/tb_RST
add wave -position insertpoint  \
sim:/uart_txd_tb/LED_tb
add wave -position insertpoint  \
sim:/uart_txd_tb/DUT/baud_rdy
add wave -position insertpoint  \
sim:/uart_txd_tb/DUT/baud_rate_counter

run 1 ms