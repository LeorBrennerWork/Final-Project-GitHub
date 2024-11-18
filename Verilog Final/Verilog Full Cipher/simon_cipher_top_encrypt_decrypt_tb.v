`default_nettype none
`timescale 1ns/1ps


module simon_cipher_top_encrypt_decrypt_tb ();

reg tb_clk, tb_rst;
reg tb_rxd_data_in_highest;
wire tb_txd_data_out_highest;
wire [10:0] tb_seven_segment_top;

localparam DELAY = 104160; //24.5 ms - run for 26 ms


initial begin
    tb_clk = 0;
    tb_rst = 1;
    #115 tb_rst = 0;
end

always 
    #5 tb_clk = ~tb_clk;

initial begin
    #0     tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;

    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 1;
    #DELAY tb_rxd_data_in_highest = 0;
    #DELAY tb_rxd_data_in_highest = 0;
end
simon_cipher_top_encrypt_decrypt DUT (
    .clk(tb_clk),
    .rst(tb_rst),
    .rxd_data_in_highest(tb_rxd_data_in_highest),
    .txd_data_out_highest(tb_txd_data_out_highest),
    .seven_segment_top(tb_seven_segment_top)
);

endmodule