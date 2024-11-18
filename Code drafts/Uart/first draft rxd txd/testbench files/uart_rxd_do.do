vcom uart_rxd.vhd
vcom uart_rxd_tb.vhd
vsim uart_rxd_tb

add wave -position insertpoint  \
sim:/uart_rxd_tb/Data_to_Cipher_tb
add wave -position insertpoint  \
sim:/uart_rxd_tb/Start_rxd_tb
add wave -position insertpoint  \
sim:/uart_rxd_tb/rxd_data_in_tb
add wave -position insertpoint  \
sim:/uart_rxd_tb/tb_CLK
add wave -position insertpoint  \
sim:/uart_rxd_tb/tb_RST
add wave -position insertpoint  \
sim:/uart_rxd_tb/LED_tb
add wave -position insertpoint  \
sim:/uart_rxd_tb/DUT/baud_rdy
add wave -position insertpoint  \
sim:/uart_rxd_tb/DUT/my_rxd_state_machine


run 1.2 ms
