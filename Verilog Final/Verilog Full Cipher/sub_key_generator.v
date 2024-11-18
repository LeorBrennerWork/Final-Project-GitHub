`default_nettype none

module sub_key_generator (
    input wire clk, rst,
    input wire integer z_counter,
    input wire [15:0] subkey_i_1, subkey_i_m, subkey_i_3,
    output reg [15:0] subkey_i
);

localparam [15:0] c_constant = 16'hfffc; //Const = 0xff...fc
localparam [31:0] z_const = 32'b10110011100001101010010001011111; //Z_const for simon 32/64
reg [15:0] sr3; //Register to store right shifted data

always @ (posedge clk ) 
begin
    if (rst)
    begin
        subkey_i <= 16'b0;
        sr3 <= 16'b0;
    end
    else
    begin
        sr3 <= {subkey_i_1[2:0] , subkey_i_1[15:3]} ^ subkey_i_3;
        subkey_i <= sr3 ^ {sr3[0] , sr3[15:1]} ^ subkey_i_m ^ c_constant ^ {15'b0 , z_const[z_counter]}; 
    end
end


endmodule