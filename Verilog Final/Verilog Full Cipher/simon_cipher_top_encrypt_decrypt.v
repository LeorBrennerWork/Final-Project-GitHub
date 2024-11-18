`default_nettype none

module simon_cipher_top_encrypt_decrypt (
    input wire clk, rst,
    input wire rxd_data_in_highest,
    output wire txd_data_out_highest,
    output wire [10:0] seven_segment_top
);


//These signals sync the end of the rxd process and the beginning of the encryption process
wire rxd_done_internal;
reg rxd_done_current, rxd_done_prev, load_key_internal, load_plntxt_internal;

 //All 13 bytes of input data
wire [103:0] all_data;

//Ciphertext signals: Final ciphertext to be sent and ciphertexts calculated by encrypt and decrypt modules
wire [31:0] final_ciphertext_encrypt, final_ciphertext_decrypt;
reg [31:0] final_ciphertext;

//Flags to check when Basys3 is ready to transmit data (based on if we are encryting or decrypting)
reg ciphertext_done_current;
wire ciphertext_done_internal_encrypt;
reg ciphertext_done_current_encrypt, ciphertext_done_prev_encrypt;
wire ciphertext_done_internal_decrypt;
reg ciphertext_done_current_decrypt, ciphertext_done_prev_decrypt;

//0 or 1 depending on encrypt or decrypt (respectively)
wire ed_mux; 

//seven segment counter to refresh each display after 2.6 ms
reg [17:0] seven_seg_counter;

//Trigger seven segment outputs
wire seven_seg_trigger;


//Transforms rxd_done_internal (long '1' pulse) into 1 clock cycle pulse to check if all data has been received
always @ (posedge clk) begin : sync_rxd_end
    if (rst)
    begin
        rxd_done_current <= 1'b0;
        rxd_done_prev <= 1'b0;
    end
    else
    begin
        if (rxd_done_internal == 1'b1 && rxd_done_prev == 1'b0)
        begin
            rxd_done_current <= 1'b1;
            rxd_done_prev <= 1'b1;    
        end
        else if (rxd_done_internal == 1'b0)
        begin
            rxd_done_current <= 1'b0;
            rxd_done_prev <= 1'b0;
        end
        else
            rxd_done_current <= 1'b0;
    end
end

//Raises flags called "load_key_internal" and "load_plantxt_internal" to signal when to load new data into the cipher
//These flags also reset the cipher when they are '1' (meaning new data has been received)
always @ (posedge clk) begin : sync_cipher_start
    if (rst)
    begin
        load_key_internal <= 1'b0;
        load_plntxt_internal <= 1'b0;
    end
    else
    begin
        if (rxd_done_current)
        begin
            load_key_internal <= 1'b1;
            load_plntxt_internal <= 1'b1;    
        end
        else
        begin
            load_key_internal <= 1'b0;
            load_plntxt_internal <= 1'b0;
        end
    end
end

//Raises flag called "ciphertext_done_current_encrypt" to signal when data has been encrypted and is ready to send
always @ (posedge clk) begin
    if (rst)
    begin
        ciphertext_done_current_encrypt <= 1'b0;
        ciphertext_done_prev_encrypt <= 1'b0;
    end
    else
    begin
        if (ciphertext_done_internal_encrypt == 1'b1 && ciphertext_done_prev_encrypt == 1'b0)
        begin
            ciphertext_done_current_encrypt <= 1'b1;
            ciphertext_done_prev_encrypt <= 1'b1;    
        end
        else if (ciphertext_done_internal_encrypt == 1'b0)
        begin
            ciphertext_done_current_encrypt <= 1'b0;
            ciphertext_done_prev_encrypt <= 1'b0;
        end
        else
            ciphertext_done_current_encrypt <= 1'b0;
    end
end


//Raises flag called "ciphertext_done_current_decrypt" to signal when data has been decrypted and is ready to send
always @ (posedge clk) begin
    if (rst)
    begin
        ciphertext_done_current_decrypt <= 1'b0;
        ciphertext_done_prev_decrypt <= 1'b0;
    end
    else
    begin
        if (ciphertext_done_internal_decrypt == 1'b1 && ciphertext_done_prev_decrypt == 1'b0)
        begin
            ciphertext_done_current_decrypt <= 1'b1;
            ciphertext_done_prev_decrypt <= 1'b1;    
        end
        else if (ciphertext_done_internal_decrypt == 1'b0)
        begin
            ciphertext_done_current_decrypt <= 1'b0;
            ciphertext_done_prev_decrypt <= 1'b0;
        end
        else
            ciphertext_done_current_decrypt <= 1'b0;
    end
end


//Sends encrypted or decrypted data depending on value of ed_mux
always @ (posedge clk) begin
    if (rst)
    begin
        ciphertext_done_current <= 1'b0;
        final_ciphertext <= 32'b0;
    end
    else
    begin
        if (ed_mux == 1'b0)
        begin
            ciphertext_done_current <= ciphertext_done_current_encrypt;
            final_ciphertext <= final_ciphertext_encrypt;    
        end
        else
        begin
            ciphertext_done_current <= ciphertext_done_current_decrypt;
            final_ciphertext <= final_ciphertext_decrypt;
        end
    end
end

assign ed_mux = all_data[96];

assign seven_seg_trigger = ((ciphertext_done_internal_encrypt == 1'b1 && ed_mux == 1'b0) || (ciphertext_done_internal_decrypt == 1'b1 && ed_mux == 1'b1)) ? 1'b1 : 1'b0;

 get_data full_rxd_do (
    .clk(clk),
    .rst(rst),
    .rxd_data_in_top(rxd_data_in_highest),
    .start_cipher(rxd_done_internal), 
    .data(all_data)
);
send_data full_txd_do (
    .clk(clk),
    .rst(rst),
    .ciphertext_send(ciphertext_done_current),
    .data(final_ciphertext),
    .txd_data_out_top(txd_data_out_highest)
); 
simon_cipher_hierarchy_encrypt encrypt ( 
    .clk(clk),
    .rst(rst),
    .plntxt(all_data[31:0]),
    .load_plntxt(load_plntxt_internal), 
    .key(all_data[95:32]),
    .load_key(load_key_internal),
    .start_cipher(rxd_done_current),
    .cphrtxt_rdy(ciphertext_done_internal_encrypt),
    .cphrtxt(final_ciphertext_encrypt)
);
simon_cipher_hierarchy_decrypt decrypt ( 
    .clk(clk),
    .rst(rst),
    .plntxt(all_data[31:0]),
    .load_plntxt(load_plntxt_internal), 
    .key(all_data[95:32]),
    .load_key(load_key_internal),
    .start_cipher(rxd_done_current),
    .cphrtxt_rdy(ciphertext_done_internal_decrypt),
    .cphrtxt(final_ciphertext_decrypt)
);
seven_segment seven_seg_output (
    .clk(clk),
    .rst(rst),
    .trigger(seven_seg_trigger),
    .seven_segment_data(seven_segment_top)
);

endmodule