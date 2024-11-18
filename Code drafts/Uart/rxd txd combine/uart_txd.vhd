----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 09:43:33 PM
-- Design Name: 
-- Module Name: uart_txd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: This design will output the ASCII equivalent of the data that will be shown by the switches
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_txd is
    Port ( t_CLK : in STD_LOGIC;
           t_Rst : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (7 downto 0);
           Start_txd : in STD_LOGIC;
           txd_data_out : out STD_LOGIC --maybe add bits for start and stop
           );
end uart_txd;

architecture Behavioral of uart_txd is

--state machine definitions
type txd_state_machine is (IDLE, START, TRANSMIT, FINISH);
signal my_txd_state_machine : txd_state_machine;
signal internal_start_txd : std_logic;

signal input_data : std_logic_vector(7 downto 0);
signal baud_rate_counter : std_logic_vector(14 downto 0); --clk is 100MHz / 9600 bps baud rate = 10416 ticks = 14 bits
signal baud_rdy : std_logic; --'1' when baud_rate_counter is at 10416
signal bit_index_counter : integer range 0 to 7; --tells us which bit of the data to send

begin

    baud_clk : process 
    begin
        wait until rising_edge(t_CLK);
        if t_Rst = '1' then
            baud_rate_counter <= (others => '0');
            baud_rdy <= '0';
        elsif baud_rate_counter = "10100010110000" then
            baud_rdy <= '1';
            baud_rate_counter <= (others => '0');
        else
            baud_rdy <= '0';
            baud_rate_counter <= baud_rate_counter + 1;
        end if;
    end process;

    -- start_txd_controller : process 
    -- begin
    --     wait until rising_edge(t_CLK);
    --     if t_Rst = '1' then
    --         internal_start_txd <= '0';
    --     elsif my_txd_state_machine = START then 
    --         internal_start_txd <= '0';
    --     elsif Start_txd <= '1' then
    --         internal_start_txd <= '1';
    --     end if;
    -- end process;


    output : process 
    begin
        wait until rising_edge(t_CLK);
        if t_Rst = '1' then
            my_txd_state_machine <= IDLE;
            bit_index_counter <= 0;
            input_data <= (others => '0'); 
        else
            if Start_txd = '1' then 
                internal_start_txd <= '1';
            end if;
            if baud_rdy = '1' then  

                case my_txd_state_machine is

                    when IDLE =>
                        bit_index_counter <= 0;
                        if internal_start_txd = '1' then --if Start_txd = '1' then-- 
                            my_txd_state_machine <= START;
                        end if;

                    when START =>
                        my_txd_state_machine <= TRANSMIT;
                        internal_start_txd <= '0'; --makes sure txd only runs once per character
                        txd_data_out <= '0'; --start bit
                        input_data <= switches;

                    when TRANSMIT =>
                        txd_data_out <= input_data(bit_index_counter);
                        if bit_index_counter < 7 then   
                            bit_index_counter <= bit_index_counter + 1;
                        else
                            my_txd_state_machine <= FINISH;
                        end if;

                    when FINISH =>
                        txd_data_out <= '1'; --end bit
                        my_txd_state_machine <= IDLE; 

                    when others =>
                        null;

                end case;
            end if;
        end if;

    end process;

    
end Behavioral;
