`default_nettype none

module send_data (
    input wire clk, rst,
    input wire ciphertext_send,
    input wire [31:0] data,
    output wire txd_data_out_top
);


reg [7:0] send_data_internal;
reg ciphertext_send_hold;
reg start_transmission;
integer data_divide_counter;
wire txd_done_internal;
reg txd_done_prev;
reg txd_done_current;

integer i;

always @ (posedge(clk))
begin
    if (rst)
    begin
        txd_done_current <= 1'b0;
        txd_done_prev <= 1'b0;    
    end    
    else
    begin
        if (txd_done_internal == 1'b1 && txd_done_prev == 1'b0)
        begin
            txd_done_current <= 1'b1;
            txd_done_prev <= 1'b1; 
        end           
        else if (txd_done_internal == 1'b0)
        begin
            txd_done_current <= 1'b0;
            txd_done_prev <= 1'b0;
        end    
        else
            txd_done_current <= 1'b0;    
    end
end


always @ (posedge(clk))
begin
    if (rst)
    begin
        data_divide_counter <= 0;
        ciphertext_send_hold <= 1'b0;
        send_data_internal <= 8'b0;
        start_transmission <= 1'b0;  
    end    
    else
    begin
        if (ciphertext_send == 1'b1 && data_divide_counter == 1'b0)
        begin
            send_data_internal <= data[31:24];
            data_divide_counter <= data_divide_counter + 1;
            ciphertext_send_hold <= 1'b1;
            start_transmission <= 1'b1;
        end 
        else if (ciphertext_send_hold == 1'b1 && txd_done_current == 1'b1)
            if (data_divide_counter == 4)
            begin
                data_divide_counter <= 0;
                ciphertext_send_hold <= 1'b0;
                start_transmission <= 1'b0;        
            end
            else
            begin
                for (i = 0; i < 8; i = i + 1)
                    send_data_internal[7-i] <= data[(31 - (data_divide_counter * 8)) - i];
                data_divide_counter <= data_divide_counter + 1;
                ciphertext_send_hold <= 1'b1;
            end    
    end
end


uart_txd txd_do (
    .clk(clk),
    .rst(rst),
    .input_data(send_data_internal),
    .start_txd(start_transmission),
    .end_of_txd(txd_done_internal),
    .txd_data_out(txd_data_out_top)
);


endmodule