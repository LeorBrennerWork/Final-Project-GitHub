`default_nettype none

module get_data (
    input wire clk, rst,
    input wire rxd_data_in_top,
    output reg start_cipher,
    output wire [103:0] data
);

wire [7:0] data_internal;
//We need 8 "encryption/decryption" bits, 32 plaintext bits and 64 key bits => 32/8 + 64/8 = 12 bytes 
//so we need to receive 13 bytes of data before sending it to the cipher algorithm.
integer data_combine_counter;

//all_data stores all the inputed data internally
reg [103:0] all_data;

//Flags for when system is done receiving data
wire rxd_done_internal;
reg rxd_done_prev, rxd_done_current;

integer i;

always @ (posedge(clk))
begin
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

always @ (posedge(clk))
begin
    if (rst)
    begin
        all_data <= 104'b0;
        data_combine_counter <= 0;
        start_cipher <= 1'b0;  
    end    
    else
    begin
        if (rxd_done_current == 1'b1)
            if (data_combine_counter == 12)
            begin
                start_cipher <= 1'b1;
                for (i = 0; i < 8; i = i + 1)
                    all_data[(103 - (data_combine_counter * 8)) - i] <= data_internal[7-i];
                data_combine_counter <= 0;
            end 
            else
            begin
                for (i = 0; i < 8; i = i + 1)
                    all_data[(103 - (data_combine_counter * 8)) - i] <= data_internal[7-i];
                data_combine_counter <= data_combine_counter + 1;
                start_cipher <= 1'b0;        
            end    
    end
end

assign data = all_data;

uart_rxd rxd_do (
    .clk(clk),
    .rst(rst),
    .rxd_data_in(rxd_data_in_top),
    .rxd_done(rxd_done_internal),
    .data_to_cipher(data_internal)
);

endmodule