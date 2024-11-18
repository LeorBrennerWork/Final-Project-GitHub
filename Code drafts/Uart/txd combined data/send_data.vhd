library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity send_data is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        ciphertext_send : in STD_LOGIC; --bit sent by cipher when ciphertext is ready
        data : in STD_LOGIC_VECTOR (31 downto 0);

        txd_data_out_top : out STD_LOGIC

        );
end send_data;

architecture Behavioral of send_data is

    component uart_txd_combine 
        port 
        (
        t_CLK : in STD_LOGIC;
        t_Rst : in STD_LOGIC;
        switches : in STD_LOGIC_VECTOR (7 downto 0);
        Start_txd : in STD_LOGIC;
        txd_data_out : out STD_LOGIC;
        end_of_txd : out STD_LOGIC
        );
    end component;


    signal send_data_internal : std_logic_vector(7 downto 0);
    signal txd_done_internal : std_logic;
    signal ciphertext_send_hold : std_logic;
    signal start_transmission : std_logic;
    --We need 32 plaintext bits and 64 key bits => 32/8 + 64/8 = 12 bytes so we need to receive 12 bytes of data before 
    --sending it to the cipher algorithm.
    signal data_divide_counter : integer range 0 to 4;
    signal txd_done_prev : std_logic;
    signal txd_done_current : std_logic;


    begin 

        sync_txd_done : process
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then
                txd_done_current <= '0';
                txd_done_prev <= '0';
            else
                if txd_done_internal = '1' and txd_done_prev = '0' then
                    txd_done_current <= '1';
                    txd_done_prev <= '1';
                elsif txd_done_internal = '0' then
                    txd_done_current <= '0';
                    txd_done_prev <= '0';
                else
                    txd_done_current <= '0';
                end if;
            end if;
        end process;

        divide_data : process 
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then 
                data_divide_counter <= 0;
                ciphertext_send_hold <= '0';
                send_data_internal <= (others => '0'); 
                start_transmission <= '0';
            else
                if ciphertext_send = '1' then
                    send_data_internal <= data((31-(data_divide_counter*8)) downto (31-(data_divide_counter*8 + 7)));
                    data_divide_counter <= data_divide_counter + 1;
                    ciphertext_send_hold <= '1';
                    start_transmission <= '1';
                elsif ciphertext_send_hold = '1' and txd_done_current = '1' then
                    -- if data_divide_counter = 3 then
                    --     data_divide_counter <= data_divide_counter + 1;
                    --     send_data_internal <= data(31 downto 24);
                    if data_divide_counter = 4 then
                        data_divide_counter <= 0;
                        ciphertext_send_hold <= '0';
                        start_transmission <= '0';
                    else
                        send_data_internal <= data((31-(data_divide_counter*8)) downto (31-(data_divide_counter*8 + 7)));
                        data_divide_counter <= data_divide_counter + 1;
                        ciphertext_send_hold <= '1';
                    end if;
                end if;
            end if; 
        end process;


        txd_do : uart_txd_combine port map (
            t_CLK => Clk,
            t_Rst => Rst,
            switches => send_data_internal,
            Start_txd => start_transmission,
            end_of_txd => txd_done_internal,
            txd_data_out => txd_data_out_top
        );
end Behavioral;