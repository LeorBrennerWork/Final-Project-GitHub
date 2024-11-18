`default_nettype none

module simon_cipher_hierarchy_encrypt (
    input wire clk, rst,
    input wire [31:0] plntxt,
    input wire [63:0] key,
    input wire load_plntxt, load_key, start_cipher,
    output reg cphrtxt_rdy,
    output reg [31:0] cphrtxt
);

//--Arrays to store data from each round of the cipher
wire [15:0] key_schedule [0:31];
reg [15:0] upper_plaintext [0:30], lower_plaintext [0:30];
wire [15:0] upper_ciphertext [0:31], lower_ciphertext [0:31];

reg [7:0] counter; //--Counts up until ciphertext is ready to be sent
reg counter_start_reg; //--Starts the counter when ciphertext is ready to be calculated and sent

//--Signals to store new and current plaintexts and keys in the event that new data is inputed before current encryption is done
reg [31:0] current_plaintext, new_plaintext;
reg [63:0] current_key, new_key;

integer i;

//Syncs inputs of rounds x+1 with outputs of rounds x
always @ (posedge(clk))
begin
    if (rst)
    begin
        for (i = 0; i < 31; i = i + 1)
            upper_plaintext[i] <= 16'b0;
        for (i = 0; i < 31; i = i + 1)
            lower_plaintext[i] <= 16'b0;
    end
    else 
    begin
        for (i = 0; i < 31; i = i + 1)
            upper_plaintext[i] <= upper_ciphertext[i];
        for (i = 0; i < 31; i = i + 1)
            lower_plaintext[i] <= lower_ciphertext[i];
    end
end

//Gets current plaintext that is being input into the Basys3
always @ (posedge(clk)) 
begin
    if (rst)
        new_plaintext <= 16'b0;
    else
        new_plaintext <= plntxt;    
end

//Gets current key that is being input into the Basys3
always @ (posedge(clk)) 
begin
    if (rst)
        new_key <= 16'b0;
    else
        new_key <= key;    
end

//Loads next plaintext into register that is used in the algorithm
always @ (posedge(clk)) 
begin
    if (rst)
        current_plaintext <= 16'b0;
    else if (load_plntxt)
        current_plaintext <= new_plaintext;    
end

//Loads next key into register that is used in the algorithm
always @ (posedge(clk)) 
begin
    if (rst)
        current_key <= 16'b0;
    else if (load_key)
        current_key <= new_key;    
end

//Raises flag which tells the counter to start running
always @ (posedge(clk)) 
begin
    if (rst)
        counter_start_reg <= 1'b0;
    else if (start_cipher)
        counter_start_reg <= 1'b1;    
end

//Counts up to 152 clock cycles
always @ (posedge(clk)) 
begin
    if (rst)
        counter <= 8'b0;
    else if (counter < 8'b10011000 && counter_start_reg)
        counter <= counter + 1;
    if (((load_plntxt) && (current_plaintext != new_plaintext)) || ((current_key != new_key) && (load_key)))  
        counter <= 8'b0;
end

//Outputs the ciphertext
always @ (posedge(clk)) 
begin
    if (rst)
    begin
        cphrtxt <= 32'b0;
        cphrtxt_rdy <= 1'b0;
    end
    else if (counter != 8'b10011000)
    begin
        cphrtxt <= 32'b0;
        cphrtxt_rdy <= 1'b0;    
    end
    else 
    begin
        cphrtxt <= {upper_ciphertext[31] , lower_ciphertext[31]};
        cphrtxt_rdy <= 1'b1;    
    end        
end

key_schedule_generator key_schedule_create (
    .clk(clk),
    .rst(rst),
    .key(key), 
    .key_schdl_0(key_schedule[0]), 
    .key_schdl_1(key_schedule[1]), 
    .key_schdl_2(key_schedule[2]), 
    .key_schdl_3(key_schedule[3]), 
    .key_schdl_4(key_schedule[4]), 
    .key_schdl_5(key_schedule[5]), 
    .key_schdl_6(key_schedule[6]), 
    .key_schdl_7(key_schedule[7]), 
    .key_schdl_8(key_schedule[8]), 
    .key_schdl_9(key_schedule[9]), 
    .key_schdl_10(key_schedule[10]), 
    .key_schdl_11(key_schedule[11]), 
    .key_schdl_12(key_schedule[12]), 
    .key_schdl_13(key_schedule[13]), 
    .key_schdl_14(key_schedule[14]), 
    .key_schdl_15(key_schedule[15]), 
    .key_schdl_16(key_schedule[16]), 
    .key_schdl_17(key_schedule[17]), 
    .key_schdl_18(key_schedule[18]), 
    .key_schdl_19(key_schedule[19]), 
    .key_schdl_20(key_schedule[20]), 
    .key_schdl_21(key_schedule[21]), 
    .key_schdl_22(key_schedule[22]), 
    .key_schdl_23(key_schedule[23]), 
    .key_schdl_24(key_schedule[24]), 
    .key_schdl_25(key_schedule[25]), 
    .key_schdl_26(key_schedule[26]), 
    .key_schdl_27(key_schedule[27]), 
    .key_schdl_28(key_schedule[28]), 
    .key_schdl_29(key_schedule[29]), 
    .key_schdl_30(key_schedule[30]), 
    .key_schdl_31(key_schedule[31]) 
);

round round_1 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[0]),
    .u_plntxt(current_plaintext[31:16]),
    .l_plntxt(current_plaintext[15:0]),
    .u_cphrtxt(upper_ciphertext[0]),
    .l_cphrtxt(lower_ciphertext[0])
);
round round_2 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[1]),
    .u_plntxt(upper_plaintext[0]),
    .l_plntxt(lower_plaintext[0]),
    .u_cphrtxt(upper_ciphertext[1]),
    .l_cphrtxt(lower_ciphertext[1])
);
round round_3 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[2]),
    .u_plntxt(upper_plaintext[1]),
    .l_plntxt(lower_plaintext[1]),
    .u_cphrtxt(upper_ciphertext[2]),
    .l_cphrtxt(lower_ciphertext[2])
);
round round_4 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[3]),
    .u_plntxt(upper_plaintext[2]),
    .l_plntxt(lower_plaintext[2]),
    .u_cphrtxt(upper_ciphertext[3]),
    .l_cphrtxt(lower_ciphertext[3])
);
round round_5 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[4]),
    .u_plntxt(upper_plaintext[3]),
    .l_plntxt(lower_plaintext[3]),
    .u_cphrtxt(upper_ciphertext[4]),
    .l_cphrtxt(lower_ciphertext[4])
);
round round_6 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[5]),
    .u_plntxt(upper_plaintext[4]),
    .l_plntxt(lower_plaintext[4]),
    .u_cphrtxt(upper_ciphertext[5]),
    .l_cphrtxt(lower_ciphertext[5])
);
round round_7 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[6]),
    .u_plntxt(upper_plaintext[5]),
    .l_plntxt(lower_plaintext[5]),
    .u_cphrtxt(upper_ciphertext[6]),
    .l_cphrtxt(lower_ciphertext[6])
);
round round_8 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[7]),
    .u_plntxt(upper_plaintext[6]),
    .l_plntxt(lower_plaintext[6]),
    .u_cphrtxt(upper_ciphertext[7]),
    .l_cphrtxt(lower_ciphertext[7])
);
round round_9 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[8]),
    .u_plntxt(upper_plaintext[7]),
    .l_plntxt(lower_plaintext[7]),
    .u_cphrtxt(upper_ciphertext[8]),
    .l_cphrtxt(lower_ciphertext[8])
);
round round_10 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[9]),
    .u_plntxt(upper_plaintext[8]),
    .l_plntxt(lower_plaintext[8]),
    .u_cphrtxt(upper_ciphertext[9]),
    .l_cphrtxt(lower_ciphertext[9])
);
round round_11 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[10]),
    .u_plntxt(upper_plaintext[9]),
    .l_plntxt(lower_plaintext[9]),
    .u_cphrtxt(upper_ciphertext[10]),
    .l_cphrtxt(lower_ciphertext[10])
);
round round_12 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[11]),
    .u_plntxt(upper_plaintext[10]),
    .l_plntxt(lower_plaintext[10]),
    .u_cphrtxt(upper_ciphertext[11]),
    .l_cphrtxt(lower_ciphertext[11])
);
round round_13 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[12]),
    .u_plntxt(upper_plaintext[11]),
    .l_plntxt(lower_plaintext[11]),
    .u_cphrtxt(upper_ciphertext[12]),
    .l_cphrtxt(lower_ciphertext[12])
);
round round_14 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[13]),
    .u_plntxt(upper_plaintext[12]),
    .l_plntxt(lower_plaintext[12]),
    .u_cphrtxt(upper_ciphertext[13]),
    .l_cphrtxt(lower_ciphertext[13])
);
round round_15 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[14]),
    .u_plntxt(upper_plaintext[13]),
    .l_plntxt(lower_plaintext[13]),
    .u_cphrtxt(upper_ciphertext[14]),
    .l_cphrtxt(lower_ciphertext[14])
);
round round_16 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[15]),
    .u_plntxt(upper_plaintext[14]),
    .l_plntxt(lower_plaintext[14]),
    .u_cphrtxt(upper_ciphertext[15]),
    .l_cphrtxt(lower_ciphertext[15])
);
round round_17 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[16]),
    .u_plntxt(upper_plaintext[15]),
    .l_plntxt(lower_plaintext[15]),
    .u_cphrtxt(upper_ciphertext[16]),
    .l_cphrtxt(lower_ciphertext[16])
);
round round_18 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[17]),
    .u_plntxt(upper_plaintext[16]),
    .l_plntxt(lower_plaintext[16]),
    .u_cphrtxt(upper_ciphertext[17]),
    .l_cphrtxt(lower_ciphertext[17])
);
round round_19 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[18]),
    .u_plntxt(upper_plaintext[17]),
    .l_plntxt(lower_plaintext[17]),
    .u_cphrtxt(upper_ciphertext[18]),
    .l_cphrtxt(lower_ciphertext[18])
);
round round_20 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[19]),
    .u_plntxt(upper_plaintext[18]),
    .l_plntxt(lower_plaintext[18]),
    .u_cphrtxt(upper_ciphertext[19]),
    .l_cphrtxt(lower_ciphertext[19])
);
round round_21 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[20]),
    .u_plntxt(upper_plaintext[19]),
    .l_plntxt(lower_plaintext[19]),
    .u_cphrtxt(upper_ciphertext[20]),
    .l_cphrtxt(lower_ciphertext[20])
);
round round_22 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[21]),
    .u_plntxt(upper_plaintext[20]),
    .l_plntxt(lower_plaintext[20]),
    .u_cphrtxt(upper_ciphertext[21]),
    .l_cphrtxt(lower_ciphertext[21])
);
round round_23 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[22]),
    .u_plntxt(upper_plaintext[21]),
    .l_plntxt(lower_plaintext[21]),
    .u_cphrtxt(upper_ciphertext[22]),
    .l_cphrtxt(lower_ciphertext[22])
);
round round_24 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[23]),
    .u_plntxt(upper_plaintext[22]),
    .l_plntxt(lower_plaintext[22]),
    .u_cphrtxt(upper_ciphertext[23]),
    .l_cphrtxt(lower_ciphertext[23])
);
round round_25 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[24]),
    .u_plntxt(upper_plaintext[23]),
    .l_plntxt(lower_plaintext[23]),
    .u_cphrtxt(upper_ciphertext[24]),
    .l_cphrtxt(lower_ciphertext[24])
);
round round_26 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[25]),
    .u_plntxt(upper_plaintext[24]),
    .l_plntxt(lower_plaintext[24]),
    .u_cphrtxt(upper_ciphertext[25]),
    .l_cphrtxt(lower_ciphertext[25])
);
round round_27 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[26]),
    .u_plntxt(upper_plaintext[25]),
    .l_plntxt(lower_plaintext[25]),
    .u_cphrtxt(upper_ciphertext[26]),
    .l_cphrtxt(lower_ciphertext[26])
);
round round_28 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[27]),
    .u_plntxt(upper_plaintext[26]),
    .l_plntxt(lower_plaintext[26]),
    .u_cphrtxt(upper_ciphertext[27]),
    .l_cphrtxt(lower_ciphertext[27])
);
round round_29 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[28]),
    .u_plntxt(upper_plaintext[27]),
    .l_plntxt(lower_plaintext[27]),
    .u_cphrtxt(upper_ciphertext[28]),
    .l_cphrtxt(lower_ciphertext[28])
);
round round_30 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[29]),
    .u_plntxt(upper_plaintext[28]),
    .l_plntxt(lower_plaintext[28]),
    .u_cphrtxt(upper_ciphertext[29]),
    .l_cphrtxt(lower_ciphertext[29])
);
round round_31 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[30]),
    .u_plntxt(upper_plaintext[29]),
    .l_plntxt(lower_plaintext[29]),
    .u_cphrtxt(upper_ciphertext[30]),
    .l_cphrtxt(lower_ciphertext[30])
);
round round_32 (
    .clk(clk),
    .rst(rst),
    .subkey(key_schedule[31]),
    .u_plntxt(upper_plaintext[30]),
    .l_plntxt(lower_plaintext[30]),
    .u_cphrtxt(upper_ciphertext[31]),
    .l_cphrtxt(lower_ciphertext[31])
);


endmodule