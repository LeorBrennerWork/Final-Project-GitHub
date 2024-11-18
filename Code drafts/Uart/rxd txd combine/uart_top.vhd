library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity uart_top is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        rxd_data : in STD_LOGIC;
        txd_data : out STD_LOGIC;

        --Start_txd_top : in STD_LOGIC;
        rxd_done_top : out STD_LOGIC;

        data : out STD_LOGIC_VECTOR (7 downto 0)
        --switches_top : in STD_LOGIC_VECTOR (7 downto 0)
        );
end uart_top;

architecture Behavioral of uart_top is


component uart_txd 
    port 
    (
    t_CLK : in STD_LOGIC;
    t_RST : in STD_LOGIC;
    switches : in STD_LOGIC_VECTOR (7 downto 0);
    Start_txd : in STD_LOGIC;
    txd_data_out : out STD_LOGIC
    );
end component;

component uart_rxd 
    port 
    (
    r_CLK : in STD_LOGIC;
    r_Rst : in STD_LOGIC;
    rxd_data_in : in STD_LOGIC;
    Data_to_Cipher : out STD_LOGIC_VECTOR (7 downto 0);
    rxd_done : out STD_LOGIC
    );
end component;

--signal Start_txd_top : std_logic;
signal rxd_done_current : std_logic := '0';
signal data_internal : std_logic_vector(7 downto 0);
signal send_data_internal : std_logic_vector(7 downto 0);
signal Start_txd_top : std_logic;

--DISREGARD THESE LINES FOR NOW-----------------------------------------------------------------------------------
--We need 32 plaintext bits and 64 key bits => 32/8 + 64/8 = 12 bytes so we need to receive 12 bytes of data before 
--sending it to the cipher algorithm. we need a 4 bit counter

signal data_combine_counter : integer range 0 to 12;

--all_data stores all the inputed data
signal all_data : std_logic_vector(95 downto 0);
--counter to divide the ciphertext in to bytes so we need to send 4 bytes. For testing I will be sending the first 4 bytes
--of all_data
signal data_divide_counter : integer range 0 to 3;

--signals to start transmission
signal ciphertext_send : std_logic;
--holds the ciphertext_send until transmission is done (ciphertext_send is loaded by a different process)
signal ciphertext_send_hold : std_logic;
--END DISREGARD-------------------------------------------------------------------------------------------

begin

    change_data : process
    begin
        wait until rising_edge(Clk);
        if Rst = '1' then 
            send_data_internal <= (others => '0');
            Start_txd_top <= '0';
            rxd_done_top <= '0';
        else
            if rxd_done_current = '1' then
                send_data_internal <= data_internal + 1;
                rxd_done_top <= '1';
                Start_txd_top <= '1';
            else
                send_data_internal <= (others => '0');
                Start_txd_top <= '0';
                rxd_done_top <= '0';
            end if;
        end if; 
    end process;

    

    -- divide_data : process 
    -- begin
    --     wait until rising_edge(Clk);
    --     if Rst = '1' then 
    --         data_divide_counter <= 0;
    --         ciphertext_send_hold <= '0';
    --         send_data_internal <= (others => '0'); 
    --     else
    --         if ciphertext_send = '1' or ciphertext_send_hold = '1' then
    --             if data_divide_counter = 3 then
    --                 data_divide_counter <= 0;
    --                 ciphertext_send_hold <= '0';
    --                 send_data_internal <= all_data(31 downto 24);
    --             else
    --                 send_data_internal <= all_data((data_divide_counter*8 + 7) downto (data_divide_counter*8));
    --                 data_divide_counter <= data_divide_counter + 1;
    --                 ciphertext_send_hold <= '1';
    --             end if;
    --         end if;
    --     end if; 
    -- end process;

    output : process 
    begin
        wait until rising_edge(Clk);
        data <= data_internal;
    end process;

    rxd_do : uart_rxd port map (
        r_CLK => Clk,
        r_Rst => Rst,
        rxd_data_in => rxd_data,
        Data_to_Cipher => data_internal,
        rxd_done => rxd_done_current
    );

    txd_do : uart_txd port map (
        t_CLK => Clk,
        t_Rst => Rst,
        txd_data_out => txd_data,
        Start_txd => Start_txd_top,
        switches => send_data_internal
    );
    
end Behavioral;


