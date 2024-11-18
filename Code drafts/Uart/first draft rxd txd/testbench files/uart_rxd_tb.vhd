----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 11:10:01 PM
-- Design Name: 
-- Module Name: uart_rxd_tb - Behavioral
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

entity uart_rxd_tb is
--  Port ( );
end uart_rxd_tb;

architecture Behavioral of uart_rxd_tb is
    component uart_rxd
        port 
            (
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
            rxd_data_in : in STD_LOGIC;
            Start_rxd : in STD_LOGIC;
            Data_to_Cipher : out STD_LOGIC_VECTOR (7 downto 0);
            LED : out std_logic_vector (7 downto 0)
            --RDY : out STD_LOGIC
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal rxd_data_in_tb : std_logic;
    signal LED_tb : std_logic_vector(7 downto 0);
    signal Start_rxd_tb : std_logic := '0';
    signal Data_to_Cipher_tb : std_logic_vector(7 downto 0);


    begin
        DUT : uart_rxd
        port map (
            CLK => tb_CLK, 
            RST => tb_RST,
            rxd_data_in => rxd_data_in_tb,
            Start_rxd => Start_rxd_tb,
            LED => LED_tb, 
            Data_to_Cipher => Data_to_Cipher_tb
        );

        rxd_data_in_tb <= '0',
                          '0' after 104190 ns,
                          '1' after 208360 ns,
                          '1' after 312530 ns,
                          '0' after 416700 ns,
                          '1' after 520900 ns,
                          '0' after 625040 ns,
                          '0' after 729130 ns,
                          '1' after 833680 ns,
                          '1' after 937550 ns,
                          '1' after 1145890 ns;

        Start_rxd_tb <= '1';--,
                        --'1' after 50 ns,
                        --'0' after 125 ns,
                        --'1' after 175 ns;
        
        tb_RST <= '1',
                  --'1' after 250 ns,
                  '0' after 10 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
