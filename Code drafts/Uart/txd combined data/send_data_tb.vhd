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

entity send_data_tb is
--  Port ( );
end send_data_tb;

architecture Behavioral of send_data_tb is
    component send_data
        port 
            (
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
    
            ciphertext_send : in STD_LOGIC;
            data : in STD_LOGIC_VECTOR (31 downto 0);
    
            txd_data_out_top : out STD_LOGIC
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal ciphertext_send_tb : std_logic;
    signal data_tb : std_logic_vector(31 downto 0);
    signal txd_data_out_top_tb : std_logic;
        
    begin
        DUT : send_data
        port map (
            Clk => tb_CLK,
            Rst => tb_RST,    
            ciphertext_send => ciphertext_send_tb,
            data => data_tb,
            txd_data_out_top => txd_data_out_top_tb
        );


        data_tb <= x"12345abc";

        ciphertext_send_tb <= '0',
                              '1' after 25 ns,
                              '0' after 35 ns;

        tb_RST <= '1',
                  '0' after 10 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
