`default_nettype none

module key_schedule_generator (
    input wire clk, rst,
    input wire [63:0] key,
    output reg [15:0] key_schdl_0,
    output reg [15:0] key_schdl_1,
    output reg [15:0] key_schdl_2,
    output reg [15:0] key_schdl_3,
    output reg [15:0] key_schdl_4,
    output reg [15:0] key_schdl_5,
    output reg [15:0] key_schdl_6,
    output reg [15:0] key_schdl_7,
    output reg [15:0] key_schdl_8,
    output reg [15:0] key_schdl_9,
    output reg [15:0] key_schdl_10,
    output reg [15:0] key_schdl_11,
    output reg [15:0] key_schdl_12,
    output reg [15:0] key_schdl_13,
    output reg [15:0] key_schdl_14,
    output reg [15:0] key_schdl_15,
    output reg [15:0] key_schdl_16,
    output reg [15:0] key_schdl_17,
    output reg [15:0] key_schdl_18,
    output reg [15:0] key_schdl_19,
    output reg [15:0] key_schdl_20,
    output reg [15:0] key_schdl_21,
    output reg [15:0] key_schdl_22,
    output reg [15:0] key_schdl_23,
    output reg [15:0] key_schdl_24,
    output reg [15:0] key_schdl_25,
    output reg [15:0] key_schdl_26,
    output reg [15:0] key_schdl_27,
    output reg [15:0] key_schdl_28,
    output reg [15:0] key_schdl_29,
    output reg [15:0] key_schdl_30,
    output reg [15:0] key_schdl_31    
);

//Arrays to store outputs and inputs of the key schedule generator
reg [15:0] c_key_schedule_in [0:30];
reg [15:0] c_key_schedule_out_reg [0:3];
wire [15:0] c_key_schedule_out_wire [0:27];
integer i;

//--Syncs inputs of rounds x+1 with outputs of rounds x
always @ (posedge(clk)) 
begin
    if (rst) 
        for (i = 0; i < 31; i = i + 1)
            c_key_schedule_in[i] <= 16'b0; // Equivalent to 16'b0
    else
    begin
        for (i = 0; i < 4; i = i + 1)
            c_key_schedule_in[i] <= c_key_schedule_out_reg[i]; 
        for (i = 0; i < 27; i = i + 1)
            c_key_schedule_in[i+4] <= c_key_schedule_out_wire[i];
    end 
end


//--Generate starting subkeys
always @ (posedge(clk)) 
begin
    if (rst) 
    begin
        c_key_schedule_out_reg[0] <= 16'b0;
        c_key_schedule_out_reg[1] <= 16'b0;
        c_key_schedule_out_reg[2] <= 16'b0;
        c_key_schedule_out_reg[3] <= 16'b0;    
    end  
    else 
    begin
        c_key_schedule_out_reg[0] <= key[15:0];
        c_key_schedule_out_reg[1] <= key[31:16];
        c_key_schedule_out_reg[2] <= key[47:32];
        c_key_schedule_out_reg[3] <= key[63:48];      
    end        
end


//--Output full key schedule
always @ (posedge(clk)) 
begin
    if (rst) 
    begin
        key_schdl_0 <= 16'b0;    
        key_schdl_1 <= 16'b0;    
        key_schdl_2 <= 16'b0;    
        key_schdl_3 <= 16'b0;    
        key_schdl_4 <= 16'b0;    
        key_schdl_5 <= 16'b0;    
        key_schdl_6 <= 16'b0;    
        key_schdl_7 <= 16'b0;    
        key_schdl_8 <= 16'b0;    
        key_schdl_9 <= 16'b0;    
        key_schdl_10 <= 16'b0;    
        key_schdl_11 <= 16'b0;    
        key_schdl_12 <= 16'b0;    
        key_schdl_13 <= 16'b0;    
        key_schdl_14 <= 16'b0;    
        key_schdl_15 <= 16'b0;    
        key_schdl_16 <= 16'b0;    
        key_schdl_17 <= 16'b0;    
        key_schdl_18 <= 16'b0;    
        key_schdl_19 <= 16'b0;    
        key_schdl_20 <= 16'b0;    
        key_schdl_21 <= 16'b0;    
        key_schdl_22 <= 16'b0;    
        key_schdl_23 <= 16'b0;    
        key_schdl_24 <= 16'b0;    
        key_schdl_25 <= 16'b0;    
        key_schdl_26 <= 16'b0;    
        key_schdl_27 <= 16'b0;    
        key_schdl_28 <= 16'b0;    
        key_schdl_29 <= 16'b0;    
        key_schdl_30 <= 16'b0;    
        key_schdl_31 <= 16'b0;               
    end              
    else 
    begin
        key_schdl_0 <= c_key_schedule_out_reg[0];   
        key_schdl_1 <= c_key_schedule_out_reg[1];   
        key_schdl_2 <= c_key_schedule_out_reg[2];   
        key_schdl_3 <= c_key_schedule_out_reg[3];   
        key_schdl_4 <= c_key_schedule_out_wire[0];   
        key_schdl_5 <= c_key_schedule_out_wire[1];   
        key_schdl_6 <= c_key_schedule_out_wire[2];   
        key_schdl_7 <= c_key_schedule_out_wire[3];   
        key_schdl_8 <= c_key_schedule_out_wire[4];   
        key_schdl_9 <= c_key_schedule_out_wire[5];   
        key_schdl_10 <= c_key_schedule_out_wire[6];   
        key_schdl_11 <= c_key_schedule_out_wire[7];   
        key_schdl_12 <= c_key_schedule_out_wire[8];   
        key_schdl_13 <= c_key_schedule_out_wire[9];   
        key_schdl_14 <= c_key_schedule_out_wire[10];   
        key_schdl_15 <= c_key_schedule_out_wire[11];   
        key_schdl_16 <= c_key_schedule_out_wire[12];   
        key_schdl_17 <= c_key_schedule_out_wire[13];   
        key_schdl_18 <= c_key_schedule_out_wire[14];   
        key_schdl_19 <= c_key_schedule_out_wire[15];   
        key_schdl_20 <= c_key_schedule_out_wire[16];   
        key_schdl_21 <= c_key_schedule_out_wire[17];   
        key_schdl_22 <= c_key_schedule_out_wire[18];   
        key_schdl_23 <= c_key_schedule_out_wire[19];   
        key_schdl_24 <= c_key_schedule_out_wire[20];   
        key_schdl_25 <= c_key_schedule_out_wire[21];   
        key_schdl_26 <= c_key_schedule_out_wire[22];   
        key_schdl_27 <= c_key_schedule_out_wire[23];   
        key_schdl_28 <= c_key_schedule_out_wire[24];   
        key_schdl_29 <= c_key_schedule_out_wire[25];   
        key_schdl_30 <= c_key_schedule_out_wire[26];   
        key_schdl_31 <= c_key_schedule_out_wire[27];      
    end              
end


sub_key_generator subkey_4 (
    .clk(clk),
    .rst(rst),
    .z_counter(0),
    .subkey_i_1(c_key_schedule_in[3]),
    .subkey_i_m(c_key_schedule_in[0]),
    .subkey_i_3(c_key_schedule_in[1]),
    .subkey_i(c_key_schedule_out_wire[0])  
);
sub_key_generator subkey_5 (
    .clk(clk),
    .rst(rst),
    .z_counter(1),
    .subkey_i_1(c_key_schedule_in[4]),
    .subkey_i_m(c_key_schedule_in[1]),
    .subkey_i_3(c_key_schedule_in[2]),
    .subkey_i(c_key_schedule_out_wire[1])
);
sub_key_generator subkey_6 (
    .clk(clk),
    .rst(rst),
    .z_counter(2),
    .subkey_i_1(c_key_schedule_in[5]),
    .subkey_i_m(c_key_schedule_in[2]),
    .subkey_i_3(c_key_schedule_in[3]),
    .subkey_i(c_key_schedule_out_wire[2])
);
sub_key_generator subkey_7 (
    .clk(clk),
    .rst(rst),
    .z_counter(3),
    .subkey_i_1(c_key_schedule_in[6]),
    .subkey_i_m(c_key_schedule_in[3]),
    .subkey_i_3(c_key_schedule_in[4]),
    .subkey_i(c_key_schedule_out_wire[3])
);
sub_key_generator subkey_8 (
    .clk(clk),
    .rst(rst),
    .z_counter(4),
    .subkey_i_1(c_key_schedule_in[7]),
    .subkey_i_m(c_key_schedule_in[4]),
    .subkey_i_3(c_key_schedule_in[5]),
    .subkey_i(c_key_schedule_out_wire[4])
);
sub_key_generator subkey_9 (
    .clk(clk),
    .rst(rst),
    .z_counter(5),
    .subkey_i_1(c_key_schedule_in[8]),
    .subkey_i_m(c_key_schedule_in[5]),
    .subkey_i_3(c_key_schedule_in[6]),
    .subkey_i(c_key_schedule_out_wire[5])
);
sub_key_generator subkey_10 (
    .clk(clk),
    .rst(rst),
    .z_counter(6),
    .subkey_i_1(c_key_schedule_in[9]),
    .subkey_i_m(c_key_schedule_in[6]),
    .subkey_i_3(c_key_schedule_in[7]),
    .subkey_i(c_key_schedule_out_wire[6])
);
sub_key_generator subkey_11 (
    .clk(clk),
    .rst(rst),
    .z_counter(7),
    .subkey_i_1(c_key_schedule_in[10]),
    .subkey_i_m(c_key_schedule_in[7]),
    .subkey_i_3(c_key_schedule_in[8]),
    .subkey_i(c_key_schedule_out_wire[7])
);
sub_key_generator subkey_12 (
    .clk(clk),
    .rst(rst),
    .z_counter(8),
    .subkey_i_1(c_key_schedule_in[11]),
    .subkey_i_m(c_key_schedule_in[8]),
    .subkey_i_3(c_key_schedule_in[9]),
    .subkey_i(c_key_schedule_out_wire[8])
);
sub_key_generator subkey_13 (
    .clk(clk),
    .rst(rst),
    .z_counter(9),
    .subkey_i_1(c_key_schedule_in[12]),
    .subkey_i_m(c_key_schedule_in[9]),
    .subkey_i_3(c_key_schedule_in[10]),
    .subkey_i(c_key_schedule_out_wire[9])
);
sub_key_generator subkey_14 (
    .clk(clk),
    .rst(rst),
    .z_counter(10),
    .subkey_i_1(c_key_schedule_in[13]),
    .subkey_i_m(c_key_schedule_in[10]),
    .subkey_i_3(c_key_schedule_in[11]),
    .subkey_i(c_key_schedule_out_wire[10])
);
sub_key_generator subkey_15 (
    .clk(clk),
    .rst(rst),
    .z_counter(11),
    .subkey_i_1(c_key_schedule_in[14]),
    .subkey_i_m(c_key_schedule_in[11]),
    .subkey_i_3(c_key_schedule_in[12]),
    .subkey_i(c_key_schedule_out_wire[11])
);
sub_key_generator subkey_16 (
    .clk(clk),
    .rst(rst),
    .z_counter(12),
    .subkey_i_1(c_key_schedule_in[15]),
    .subkey_i_m(c_key_schedule_in[12]),
    .subkey_i_3(c_key_schedule_in[13]),
    .subkey_i(c_key_schedule_out_wire[12])
);
sub_key_generator subkey_17 (
    .clk(clk),
    .rst(rst),
    .z_counter(13),
    .subkey_i_1(c_key_schedule_in[16]),
    .subkey_i_m(c_key_schedule_in[13]),
    .subkey_i_3(c_key_schedule_in[14]),
    .subkey_i(c_key_schedule_out_wire[13])
);
sub_key_generator subkey_18 (
    .clk(clk),
    .rst(rst),
    .z_counter(14),
    .subkey_i_1(c_key_schedule_in[17]),
    .subkey_i_m(c_key_schedule_in[14]),
    .subkey_i_3(c_key_schedule_in[15]),
    .subkey_i(c_key_schedule_out_wire[14])
);
sub_key_generator subkey_19 (
    .clk(clk),
    .rst(rst),
    .z_counter(15),
    .subkey_i_1(c_key_schedule_in[18]),
    .subkey_i_m(c_key_schedule_in[15]),
    .subkey_i_3(c_key_schedule_in[16]),
    .subkey_i(c_key_schedule_out_wire[15])
);
sub_key_generator subkey_20 (
    .clk(clk),
    .rst(rst),
    .z_counter(16),
    .subkey_i_1(c_key_schedule_in[19]),
    .subkey_i_m(c_key_schedule_in[16]),
    .subkey_i_3(c_key_schedule_in[17]),
    .subkey_i(c_key_schedule_out_wire[16])
);
sub_key_generator subkey_21 (
    .clk(clk),
    .rst(rst),
    .z_counter(17),
    .subkey_i_1(c_key_schedule_in[20]),
    .subkey_i_m(c_key_schedule_in[17]),
    .subkey_i_3(c_key_schedule_in[18]),
    .subkey_i(c_key_schedule_out_wire[17])
);
sub_key_generator subkey_22 (
    .clk(clk),
    .rst(rst),
    .z_counter(18),
    .subkey_i_1(c_key_schedule_in[21]),
    .subkey_i_m(c_key_schedule_in[18]),
    .subkey_i_3(c_key_schedule_in[19]),
    .subkey_i(c_key_schedule_out_wire[18])
);
sub_key_generator subkey_23 (
    .clk(clk),
    .rst(rst),
    .z_counter(19),
    .subkey_i_1(c_key_schedule_in[22]),
    .subkey_i_m(c_key_schedule_in[19]),
    .subkey_i_3(c_key_schedule_in[20]),
    .subkey_i(c_key_schedule_out_wire[19])
);
sub_key_generator subkey_24 (
    .clk(clk),
    .rst(rst),
    .z_counter(20),
    .subkey_i_1(c_key_schedule_in[23]),
    .subkey_i_m(c_key_schedule_in[20]),
    .subkey_i_3(c_key_schedule_in[21]),
    .subkey_i(c_key_schedule_out_wire[20])
);
sub_key_generator subkey_25 (
    .clk(clk),
    .rst(rst),
    .z_counter(21),
    .subkey_i_1(c_key_schedule_in[24]),
    .subkey_i_m(c_key_schedule_in[21]),
    .subkey_i_3(c_key_schedule_in[22]),
    .subkey_i(c_key_schedule_out_wire[21])
);
sub_key_generator subkey_26 (
    .clk(clk),
    .rst(rst),
    .z_counter(22),
    .subkey_i_1(c_key_schedule_in[25]),
    .subkey_i_m(c_key_schedule_in[22]),
    .subkey_i_3(c_key_schedule_in[23]),
    .subkey_i(c_key_schedule_out_wire[22])
);
sub_key_generator subkey_27 (
    .clk(clk),
    .rst(rst),
    .z_counter(23),
    .subkey_i_1(c_key_schedule_in[26]),
    .subkey_i_m(c_key_schedule_in[23]),
    .subkey_i_3(c_key_schedule_in[24]),
    .subkey_i(c_key_schedule_out_wire[23])
);
sub_key_generator subkey_28 (
    .clk(clk),
    .rst(rst),
    .z_counter(24),
    .subkey_i_1(c_key_schedule_in[27]),
    .subkey_i_m(c_key_schedule_in[24]),
    .subkey_i_3(c_key_schedule_in[25]),
    .subkey_i(c_key_schedule_out_wire[24])
);
sub_key_generator subkey_29 (
    .clk(clk),
    .rst(rst),
    .z_counter(25),
    .subkey_i_1(c_key_schedule_in[28]),
    .subkey_i_m(c_key_schedule_in[25]),
    .subkey_i_3(c_key_schedule_in[26]),
    .subkey_i(c_key_schedule_out_wire[25])
);
sub_key_generator subkey_30 (
    .clk(clk),
    .rst(rst),
    .z_counter(26),
    .subkey_i_1(c_key_schedule_in[29]),
    .subkey_i_m(c_key_schedule_in[26]),
    .subkey_i_3(c_key_schedule_in[27]),
    .subkey_i(c_key_schedule_out_wire[26])
);
sub_key_generator subkey_31 (
    .clk(clk),
    .rst(rst),
    .z_counter(27),
    .subkey_i_1(c_key_schedule_in[30]),
    .subkey_i_m(c_key_schedule_in[27]),
    .subkey_i_3(c_key_schedule_in[28]),
    .subkey_i(c_key_schedule_out_wire[27])
);

endmodule