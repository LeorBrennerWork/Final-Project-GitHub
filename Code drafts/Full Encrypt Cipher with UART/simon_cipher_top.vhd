library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity simon_cipher_top is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        test_leds : out STD_LOGIC_VECTOR(15 downto 0);

        rxd_data_in_highest : in STD_LOGIC;
        txd_data_out_highest : out STD_LOGIC
        );
end simon_cipher_top;

architecture Behavioral of simon_cipher_top is

    component get_data
        port 
            ( 
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;    
            rxd_data_in_top : in STD_LOGIC;    
            start_cipher : out STD_LOGIC;
            data : out STD_LOGIC_VECTOR (95 downto 0)
            );
    end component;

    component send_data 
        port 
            ( 
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            ciphertext_send : in STD_LOGIC; --bit sent by cipher when ciphertext is ready
            data : in STD_LOGIC_VECTOR (31 downto 0); --ciphertext  

            send_data_external : out std_logic_vector(7 downto 0);
            dd_counter : out std_logic_vector(3 downto 0);
            
            txd_data_out_top : out STD_LOGIC;
            test_test_bit : out std_logic
            );
    end component;

    component simon_cipher_hierarchy 
        port 
            (
            CLK: in std_logic; 
            RST: in std_logic;
            PLNTXT: in std_logic_vector(31 downto 0);
            LOAD_PLNTXT: in std_logic;
            KEY: in std_logic_vector(63 downto 0);
            LOAD_KEY: in std_logic;
            START_CIPHER: in std_logic;
            CPHRTXT_RDY: out std_logic;
            CPHRTXT: out std_logic_vector(31 downto 0)
            );
    end component;

    --These signals sync the end of the rxd process and the beginning of the encryption process
    signal rxd_done_internal : std_logic;
    signal rxd_done_current : std_logic;
    signal rxd_done_prev : std_logic;
    signal load_key_internal : std_logic;
    signal load_plntxt_internal : std_logic;

    signal all_data : std_logic_vector(95 downto 0);

    --Current ciphertext being sent
    --signal final_ciphertext_current : std_logic_vector(31 downto 0);
    --New ciphertext (in case of new data during current ciphertext sending)
    signal final_ciphertext_new : std_logic_vector(31 downto 0);

    signal ciphertext_done_internal : std_logic;
    signal ciphertext_done_current : std_logic;
    signal ciphertext_done_prev : std_logic;

    signal checksend : std_logic_vector(7 downto 0);
    signal dd_counter_top : std_logic_vector(3 downto 0);
    signal dd_counter_send :std_logic_vector(3 downto 0);
    signal test_test_test_bit : std_logic;

    begin
        
        
        --Raises flag called "rxd_done_current" to signal when all data has been received
        sync_rxd_end : process 
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then
                rxd_done_current <= '0';
                rxd_done_prev <= '0';
            else
                if rxd_done_internal = '1' and rxd_done_prev = '0' then
                    rxd_done_current <= '1';
                    rxd_done_prev <= '1';
                elsif rxd_done_internal = '0' then
                    rxd_done_current <= '0';
                    rxd_done_prev <= '0';
                else
                    rxd_done_current <= '0';
                end if;
            end if;
        end process;

        --Raises flags called "load_key_internal" and "load_plantxt_internal" to signal when to load new data into the cipher
        --These flags also reset the cipher when they are '1' (meaning new data has been received)
        sync_cipher_start : process 
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then
                load_key_internal <= '0';
                load_plntxt_internal <= '0';
            else
                if rxd_done_current = '1' then
                    load_key_internal <= '1';
                    load_plntxt_internal <= '1';
                else
                    load_key_internal <= '0';
                    load_plntxt_internal <= '0';
                end if;
            end if;
        end process;

        --Raises flag called "ciphertext_done_current" to signal when data has been encrypted and is ready to send
        sync_cipher_send : process 
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then
                ciphertext_done_current <= '0';
                ciphertext_done_prev <= '0';
            else
                if ciphertext_done_internal = '1' and ciphertext_done_prev = '0' then
                    ciphertext_done_current <= '1';
                    ciphertext_done_prev <= '1';
                elsif ciphertext_done_internal = '0' then
                    ciphertext_done_current <= '0';
                    ciphertext_done_prev <= '0';
                else
                    ciphertext_done_current <= '0';
                end if;
            end if;
        end process;

        --process to store old ciphertext until it is sent (so as to not mess up the current ciphertext)
        -- send_current_ciphertext : process 
        -- begin
        --     if Rst = '1' then
        --         final_ciphertext_current <= (others => '0');
        --     else

        -- end process;
        
--        dd_counter_send <= "1100" when dd_counter_top = "0000" else dd_counter_top;
--        test_leds <= dd_counter_send & '0' & test_test_test_bit & "00" & checksend;
        test_leds <= all_data(96 downto 81);
        
        full_rxd_do : get_data port map (
            Clk => Clk,
            Rst => Rst,
            rxd_data_in_top => rxd_data_in_highest,
            start_cipher => rxd_done_internal, --this tells us that all information has been received and cipher can start. This runs for 1 clock cycle
            data => all_data
        );
        full_txd_do : send_data port map (
            Clk => Clk,
            Rst => Rst,
            ciphertext_send => ciphertext_done_current,
            data => final_ciphertext_new,--data => final_ciphertext_current,

            send_data_external => checksend,
            dd_counter => dd_counter_top,

            txd_data_out_top => txd_data_out_highest,
            test_test_bit => test_test_test_bit
        ); 
        encrypt : simon_cipher_hierarchy port map ( 
            CLK => Clk,
            RST => Rst,
            PLNTXT => all_data(31 downto 0),
            LOAD_PLNTXT => load_plntxt_internal, --new plaintext and key will be loaded when all data is received which will reset the cipher with the new data. Currently I am not dividing between key and plaintext
            KEY => all_data(95 downto 32),
            LOAD_KEY => load_key_internal,
            START_CIPHER => rxd_done_current,
            CPHRTXT_RDY => ciphertext_done_internal,
            CPHRTXT => final_ciphertext_new
        );

    
end Behavioral;