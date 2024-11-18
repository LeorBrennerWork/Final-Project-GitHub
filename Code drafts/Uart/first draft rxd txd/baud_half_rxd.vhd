----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 09:43:33 PM
-- Design Name: 
-- Module Name: uart_rxd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
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

entity uart_rxd is
    Port ( r_CLK : in STD_LOGIC;
           r_RST : in STD_LOGIC;
           rxd_data_in : in STD_LOGIC;
           Data_to_Cipher : out STD_LOGIC_VECTOR (7 downto 0)
           );
end uart_rxd;

architecture Behavioral of uart_rxd is

type rxd_state_machine is (IDLE, START, RECEIVE, FINISH);
signal my_rxd_state_machine : rxd_state_machine;

signal baud_rate_counter : std_logic_vector(14 downto 0); --clk is 100MHz / 9600 bps baud rate = 10416 ticks = 14 bits
signal baud_rdy : std_logic; --'1' when baud_rate_counter is at 10416
signal bit_index_counter : integer range 0 to 7; --tells us which bit of the data to send
signal check_start_end_bit : std_logic; --checks new transmission for '0' start bit
signal baud_half : std_logic;

begin

    baud_clk : process --counts 10416 clock cycles in order to signal to the state machine when to "activate" a state
    begin
        wait until rising_edge(r_CLK);
        if r_RST = '1' then
            baud_rate_counter <= (others => '0');
            baud_rdy <= '0';
            baud_half <= '0';
        elsif baud_rate_counter = "10100010110000" then
            baud_rdy <= '1';
            baud_rate_counter <= (others => '0');
        else
            if baud_rate_counter = "1010001011000" then
                baud_half <= '1';
            else 
                baud_half <= '0';
            end if;
            baud_rdy <= '0';
            baud_rate_counter <= baud_rate_counter + 1;
        end if;
    end process;

    
    output : process --receiver state machine
    begin
        wait until rising_edge(r_CLK);
        if r_RST = '1' then
            my_rxd_state_machine <= IDLE;
            bit_index_counter <= 0;
            Data_to_Cipher <= (others => '0'); 
        else
            if baud_rdy = '1' or baud_half = '1' then  

                case my_rxd_state_machine is

                    when IDLE =>
                        bit_index_counter <= 0;
                        if rxd_data_in = '0' and baud_half = '1' then --when start bit is detected   
                            my_rxd_state_machine <= START;
                        end if;

                    when START =>
                        check_start_end_bit <= rxd_data_in; --start bit should be '0'
                        if check_start_end_bit = '1' then 
                            my_rxd_state_machine <= IDLE;  
                        else 
                            my_rxd_state_machine <= RECEIVE;
                        end if;

                    when RECEIVE =>
                        if baud_half = '1' then
                            Data_to_Cipher(bit_index_counter) <= rxd_data_in;
                            if bit_index_counter < 7 then   
                                bit_index_counter <= bit_index_counter + 1;
                            else
                                my_rxd_state_machine <= FINISH;
                            end if;
                        end if;

                    when FINISH =>
                        my_rxd_state_machine <= IDLE;

                    when others =>
                        null;

                end case;
            end if;
        end if;

    end process;
    
end Behavioral;



