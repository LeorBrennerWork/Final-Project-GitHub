library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity get_data is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        rxd_data_in_top : in STD_LOGIC;

        ciphertext_send : out STD_LOGIC;

        data : out STD_LOGIC_VECTOR (95 downto 0)

        );
end get_data;

architecture Behavioral of get_data is

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


    signal data_internal : std_logic_vector(7 downto 0);
    --We need 32 plaintext bits and 64 key bits => 32/8 + 64/8 = 12 bytes so we need to receive 12 bytes of data before 
    --sending it to the cipher algorithm.
    signal data_combine_counter : integer range 0 to 12;

    --all_data stores all the inputed data internally
    signal all_data : std_logic_vector(95 downto 0);

    signal rxd_done_internal : std_logic;
    signal rxd_done_prev : std_logic;
    signal rxd_done_current : std_logic;

    begin 

        sync_rxd_done : process
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

        --this process will put the sets of 8 bits that we received using uart_rxd.vhd into 1 big array of data
        combine_data : process 
        begin
            wait until rising_edge(Clk);
            if Rst = '1' then 
                all_data <= (others => '0');
                data_combine_counter <= 0;
                ciphertext_send <= '0';
            else
                --since rxd_done_internal is 1 for 10416 clk cycles I can only trigger the counter once per baud cycle
                if rxd_done_current = '1' then 
                    --if data_combine_counter = 13 then

                    if data_combine_counter = 12 then --using 2 as a test but should be 12
                        data_combine_counter <= 0;
                        ciphertext_send <= '0';
                        --pretend that algorithm is finished 
                    elsif data_combine_counter = 11 then 
                        ciphertext_send <= '1';
                        all_data((data_combine_counter*8 + 7) downto (data_combine_counter*8)) <= data_internal;
                        data_combine_counter <= data_combine_counter + 1;
                    else
                        all_data((data_combine_counter*8 + 7) downto (data_combine_counter*8)) <= data_internal;
                        data_combine_counter <= data_combine_counter + 1;
                        ciphertext_send <= '0';
                    end if;
                end if;
            end if; 
        end process;

        output : process 
        begin
            wait until rising_edge(Clk);
            data <= all_data;
        end process;


        rxd_do : uart_rxd port map (
            r_CLK => Clk,
            r_Rst => Rst,
            rxd_data_in => rxd_data_in_top,
            Data_to_Cipher => data_internal,
            rxd_done => rxd_done_internal
        );
end Behavioral;