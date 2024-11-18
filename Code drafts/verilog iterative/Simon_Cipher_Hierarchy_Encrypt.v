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
wire [15:0] upper_ciphertext [0:32], lower_ciphertext [0:32];
reg [15:0] current_subkey;

reg [7:0] counter; //--Counts up until ciphertext is ready to be sent
reg counter_start_reg; //--Starts the counter when ciphertext is ready to be calculated and sent

//--Signals to store new and current plaintexts and keys in the event that new data is inputed before current encryption is done
reg [31:0] current_plaintext, new_plaintext;
reg [63:0] current_key, new_key;

reg [2:0] round_clock;
integer round_counter;
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
    else if (counter < 8'b11011000 && counter_start_reg)
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
    else if (counter != 8'b11011000)
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

always @ (posedge clk ) 
begin
    if (rst)
    begin
        round_counter <= 1;
        round_clock <= 3'b0;
    end
    else
    begin       
        if (((load_plntxt) && (current_plaintext != new_plaintext)) || ((current_key != new_key) && (load_key)))  
            round_counter <= 0;
        else
        begin
            if (round_counter == 1)
            begin
                if (round_clock == 3'b0)
                begin 
                    upper_plaintext[0] <= current_plaintext[31:16];
                    lower_plaintext[0] <= current_plaintext[15:0];
                    current_subkey <= key_schedule[0];
                    round_clock <= round_clock + 1;
                end
                else if (round_clock == 3'b101)
                begin
                    round_counter <= round_counter + 1;
                    round_clock <= 3'b0;    
                end
                else
                    round_clock <= round_clock + 1;
            end 
            else if (round_counter < 32)
            begin
                if (round_clock == 3'b0)
                begin 
                    upper_plaintext[round_counter] <= upper_ciphertext[round_counter];
                    lower_plaintext[round_counter] <= lower_ciphertext[round_counter];
                    current_subkey <= key_schedule[round_counter - 1];
                    round_clock <= round_clock + 1;
                end
                else if (round_clock == 3'b101)
                begin
                    round_counter <= round_counter + 1;
                    round_clock <= 3'b0;    
                end
                else
                    round_clock <= round_clock + 1;
            end 
        end 
    end
end

round round_1 (
    .clk(clk),
    .rst(rst),
    .subkey(current_subkey),
    .u_plntxt(upper_plaintext_reg),
    .l_plntxt(lower_plaintext_reg),
    .u_cphrtxt(upper_ciphertext_reg),
    .l_cphrtxt(lower_ciphertext_reg)
);



endmodule