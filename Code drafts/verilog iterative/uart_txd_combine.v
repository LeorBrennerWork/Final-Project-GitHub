`default_nettype none

module uart_txd (
    input wire clk, rst,
    input wire [7:0] input_data,
    input wire start_txd,
    output reg txd_data_out,
    output reg end_of_txd
);

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam TRANSMIT = 2'b10;
localparam FINISH = 2'b11;


reg [1:0] my_txd_state_machine;
reg [7:0] input_data_internal; //Input data to transmit in the state machine
reg [13:0] baud_rate_counter; //clk is 100MHz / 9600 bps baud rate = 10416 ticks = 14 bits
reg baud_rdy; //'1' when baud_rate_counter is at 10416
integer bit_index_counter; //tells us which bit of the data to send



//Runs at 16x baud rate in order to capture the middle of each input pulse with high accuracy
always @ (posedge clk ) 
begin
    if (rst)
    begin
        baud_rate_counter <= 14'b0;
        baud_rdy <= 1'b0;
    end
    else if (baud_rate_counter == 14'b10100010110000)
    begin
        baud_rdy <= 1'b1;
        baud_rate_counter <= 14'b0;
    end
    else
    begin
        baud_rdy <= 1'b0;
        baud_rate_counter <= baud_rate_counter + 1;
    end
end

//receiver state machine
always @ (posedge clk ) begin
    if (rst)
    begin
        my_txd_state_machine <= IDLE;
        bit_index_counter <= 0;
        input_data_internal <= 8'b0;
        end_of_txd <= 1'b0;
        txd_data_out <= 1'b0;
    end  
    else
    begin
        if (baud_rdy)
        begin
            case (my_txd_state_machine)
                IDLE : begin
                    bit_index_counter <= 0;
                    if (start_txd)    
                        my_txd_state_machine <= START;
                    end_of_txd <= 1'b0;
                end

                START : begin
                    my_txd_state_machine <= TRANSMIT;
                    txd_data_out <= 1'b0; //start bit
                    input_data_internal <= input_data;
                end

                TRANSMIT : begin
                    txd_data_out <= input_data_internal[bit_index_counter];
                    if (bit_index_counter < 7)  
                        bit_index_counter <= bit_index_counter + 1;
                    else
                        my_txd_state_machine <= FINISH;
                end

                FINISH : begin
                    txd_data_out <= 1'b1; //end bit
                    my_txd_state_machine <= IDLE;
                    end_of_txd <= 1'b1;
                end

 
                default: my_txd_state_machine <= IDLE;
            endcase
        end    
    end  
end

endmodule