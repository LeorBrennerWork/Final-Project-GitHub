`default_nettype none

module uart_rxd (
    input wire clk, rst,
    input wire rxd_data_in,
    output reg rxd_done,
    output reg [7:0] data_to_cipher
);

localparam IDLE  = 3'b000;
localparam START = 3'b001;
localparam RECEIVE = 3'b010;
localparam FINISH_RX = 3'b011;
localparam RDY_TX = 3'b100;

reg [2:0] my_rxd_state_machine;
reg [10:0] baud_rate_counter; //clk is 100MHz / 9600 bps baud rate = 10416 ticks / 16 = 651 ticks per cycle = 11 bits
reg baud_rdy; //'1' when baud_rate_counter is at 10416
integer bit_index_counter; //tells us which bit of the data to send
reg check_start_end_bit; //checks new transmission for '0' start bit
reg baud_middle; //flag in order to receive sample from middle byte
reg [3:0] middle_counter; 


//Runs at 16x baud rate in order to capture the middle of each input pulse with high accuracy
always @ (posedge clk ) 
begin
    if (rst)
    begin
        baud_rate_counter <= 11'b0;
        baud_rdy <= 1'b0;
        baud_middle <= 1'b0;
        middle_counter <= 4'b0;
    end
    else if (baud_rate_counter == 11'b1010001011)
    begin
        baud_rdy <= 1'b1;
        if (middle_counter == 4'b0111)
            baud_middle <= 1'b1;
        else
            baud_middle <= 1'b0;

        if (middle_counter != 4'b1111)
            middle_counter <= middle_counter + 1;
        else
            middle_counter <= 4'b0000;

        baud_rate_counter <= 11'b0; 
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
        my_rxd_state_machine <= IDLE;
        bit_index_counter <= 0;
        data_to_cipher <= 8'b0;
        rxd_done <= 1'b0;
    end  
    else
    begin
        if (baud_rdy)
        begin
            case (my_rxd_state_machine)
                IDLE : begin
                    rxd_done <= 1'b0;
                    bit_index_counter <= 0;
                    data_to_cipher <= 8'b0;
                    if (rxd_data_in == 1'b0 && baud_middle == 1'b1) //when start bit is detected   
                        my_rxd_state_machine <= START;
                end

                START : begin
                    check_start_end_bit <= rxd_data_in; //start bit should be '0'
                    if (check_start_end_bit == 1'b1) 
                        my_rxd_state_machine <= IDLE;  
                    else 
                        my_rxd_state_machine <= RECEIVE;
                end

                RECEIVE : begin
                    if (baud_middle == 1'b1)
                    begin
                        data_to_cipher[bit_index_counter] <= rxd_data_in;
                        if (bit_index_counter < 7)  
                            bit_index_counter <= bit_index_counter + 1;
                        else
                            my_rxd_state_machine <= FINISH_RX;
                    end
                end

                FINISH_RX : begin
                    my_rxd_state_machine <= RDY_TX;
                end

                RDY_TX : begin
                    rxd_done <= 1'b1;
                    my_rxd_state_machine <= IDLE;    
                end
 
                default: my_rxd_state_machine <= IDLE;
            endcase
        end    
    end  
end

endmodule

        // Possible Implementation upgrade - Change state machine details as well
        // if (middle_counter == 4'b0111)
        //     baud_middle <= 1'b1;
        // else
        //     baud_middle <= 1'b0;

        // if (middle_counter != 4'b1111)
        //     middle_counter <= middle_counter + 1;
        // else
        //     middle_counter <= 4'b0000;
        
        // if (middle_counter < 4'b1000)
        //     if (rxd_data_in == 1'b0)
        //         zeros_counter <= zeros_counter + 1;
        //     else
        //         ones_counter <= ones_counter + 1;
        // else
        // begin
        //     zeros_counter <= 4'b0;
        //     ones_counter <= 4'b0;
        // end
