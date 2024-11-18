library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity full_cipher_uart is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        rxd_data_in_highest : in STD_LOGIC;
        txd_data_out_highest : out STD_LOGIC
        );
end full_cipher_uart;

architecture Behavioral of full_cipher_uart is

    component get_data
        port 
            ( 
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
    
            rxd_data_in_top : in STD_LOGIC;
    
            ciphertext_send : out STD_LOGIC;
    
            data : out STD_LOGIC_VECTOR (95 downto 0)
            );
    end component;

    component send_data 
        port 
            ( 
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
    
            ciphertext_send : in STD_LOGIC; --bit sent by cipher when ciphertext is ready
            data : in STD_LOGIC_VECTOR (31 downto 0);
    
            txd_data_out_top : out STD_LOGIC
            );
    end component;

    signal rxd_done_internal : std_logic;
    signal all_data : std_logic_vector(95 downto 0);
    signal ciphertext_send_internal : std_logic;
    signal final_ciphertext : std_logic_vector(31 downto 0);

    begin

        --this process will take the last 32 of all the data as a mock ciphertext and transmit them
        --this doesnt necessarily need to be a process
        -- extract_ciphertext : process 
        -- begin
        --     wait until rising_edge(Clk);
        --     if Rst = '1' then
        --         final_ciphertext <= (others => '0');
        --     else
        --         final_ciphertext <= all_data(31 downto 0);
        --     end if; 
        -- end process;

        extract_ciphertext : final_ciphertext <= all_data(31 downto 0);
        sync_transmission : ciphertext_send_internal <= rxd_done_internal;

        full_rxd_do : get_data port map (
            Clk => Clk,
            Rst => Rst,
            rxd_data_in_top => rxd_data_in_highest,
            ciphertext_send => rxd_done_internal, --this drives the ciphertext send for txd
            data => all_data
        );
        full_txd_do : send_data port map (
            Clk => Clk,
            Rst => Rst,
            ciphertext_send => ciphertext_send_internal,
            data => final_ciphertext,
            txd_data_out_top => txd_data_out_highest
        ); 
    
end Behavioral;