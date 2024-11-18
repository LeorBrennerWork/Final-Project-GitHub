----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 11:10:01 PM
-- Design Name: 
-- Module Name: uart_txd_tb - Behavioral
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

entity uart_txd_tb is
--  Port ( );
end uart_txd_tb;

architecture Behavioral of uart_txd_tb is
    component uart_txd
        port 
            (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            switches : in STD_LOGIC_VECTOR (7 downto 0);
            Start_txd : in STD_LOGIC;
            LED : out std_logic_vector (7 downto 0);
            txd_data_out : out STD_LOGIC --maybe add bits for start and stop
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal switches_tb : std_logic_vector(7 downto 0);
    signal LED_tb : std_logic_vector(7 downto 0);
    signal Start_txd_tb : std_logic := '0';
    signal txd_data_out_tb : std_logic;


    begin
        DUT : uart_txd
        port map (
            CLK => tb_CLK, 
            RST => tb_RST,
            switches => switches_tb,
            Start_txd => Start_txd_tb,
            LED => LED_tb, 
            txd_data_out => txd_data_out_tb
        );

        switches_tb <= "10101001";

        Start_txd_tb <= '0',
                        '1' after 50 ns,
                        '0' after 125 ns,
                        '1' after 175 ns;
        
        tb_RST <= '1',
                  '0' after 10 ns,
                  '0' after 275 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
