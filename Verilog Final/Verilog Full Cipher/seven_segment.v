`default_nettype none

module seven_segment (
    input wire clk, rst,
    input wire trigger,
    output reg [10:0] seven_segment_data
);

reg [17:0] seven_seg_counter;

always @ (posedge(clk))
begin
    if (rst) 
        seven_segment_data <= 18'b0;
    else
        begin
            if (trigger)
                case (seven_seg_counter[17:16])
                    2'b00 : seven_segment_data <= 11'b01111000010;
                    2'b01 : seven_segment_data <= 11'b10110000001;
                    2'b10 : seven_segment_data <= 11'b11011101010;
                    2'b11 : seven_segment_data <= 11'b11100110000;
                    default: seven_segment_data <= 11'b0;
                endcase    
        end
end

always @ (posedge(clk))
begin
    if (rst)
        seven_seg_counter <= 18'b0;
    else
        if (seven_seg_counter == 18'b111111111111111111)
            seven_seg_counter <= 18'b0;
        else
            seven_seg_counter <= seven_seg_counter + 1;
end






endmodule