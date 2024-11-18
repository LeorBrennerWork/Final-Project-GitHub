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

entity full_cipher_uart_tb is
--  Port ( );
end full_cipher_uart_tb;

architecture Behavioral of full_cipher_uart_tb is
    component full_cipher_uart
        port 
            (
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
    
            rxd_data_in_highest : in STD_LOGIC;
            txd_data_out_highest : out STD_LOGIC
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal rxd_data_in_highest_tb : std_logic;
    signal txd_data_out_highest_tb : std_logic;
        

    begin
        DUT : full_cipher_uart
        port map (
            Clk => tb_CLK,
            Rst => tb_RST,
            rxd_data_in_highest => rxd_data_in_highest_tb,
            txd_data_out_highest => txd_data_out_highest_tb
        );


        rxd_data_in_highest_tb <= '1',
                                  '0' after 104160 ns * 1,
                                  '0' after 104160 ns * 2,
                                  '1' after 104160 ns * 3,
                                  '1' after 104160 ns * 4,
                                  '0' after 104160 ns * 5,
                                  '0' after 104160 ns * 6,
                                  '0' after 104160 ns * 7,
                                  '0' after 104160 ns * 8,
                                  '1' after 104160 ns * 9,                       
                                  '0' after 104160 ns * 13,
                                  '0' after 104160 ns * 14,
                                  '1' after 104160 ns * 15,
                                  '1' after 104160 ns * 16,
                                  '0' after 104160 ns * 17,
                                  '0' after 104160 ns * 18,
                                  '0' after 104160 ns * 19,
                                  '1' after 104160 ns * 20,
                                  '1' after 104160 ns * 21,                       
                                  '1' after 104160 ns * 25,
                                  '0' after 104160 ns * 28,
                                  '1' after 104160 ns * 29,
                                  '1' after 104160 ns * 30,
                                  '1' after 104160 ns * 31,
                                  '0' after 104160 ns * 32,
                                  '0' after 104160 ns * 33,
                                  '1' after 104160 ns * 34,
                                  '1' after 104160 ns * 35,                      
                                  '0' after 104160 ns * 38,
                                  '0' after 104160 ns * 39,
                                  '1' after 104160 ns * 40,
                                  '1' after 104160 ns * 41,
                                  '0' after 104160 ns * 42,
                                  '0' after 104160 ns * 43,
                                  '0' after 104160 ns * 44,
                                  '0' after 104160 ns * 45,
                                  '1' after 104160 ns * 46,                      
                                  '0' after 104160 ns * 49,
                                  '0' after 104160 ns * 50,
                                  '1' after 104160 ns * 51,
                                  '1' after 104160 ns * 52,
                                  '0' after 104160 ns * 53,
                                  '0' after 104160 ns * 54,
                                  '0' after 104160 ns * 55,
                                  '0' after 104160 ns * 56,
                                  '1' after 104160 ns * 57,                      
                                  '0' after 104160 ns * 60,
                                  '0' after 104160 ns * 61,
                                  '1' after 104160 ns * 62,
                                  '1' after 104160 ns * 63,
                                  '0' after 104160 ns * 64,
                                  '0' after 104160 ns * 65,
                                  '1' after 104160 ns * 66,
                                  '0' after 104160 ns * 67,
                                  '1' after 104160 ns * 68,                      
                                  '0' after 104160 ns * 71,
                                  '0' after 104160 ns * 72,
                                  '1' after 104160 ns * 73,
                                  '1' after 104160 ns * 74,
                                  '0' after 104160 ns * 75,
                                  '0' after 104160 ns * 76,
                                  '0' after 104160 ns * 77,
                                  '0' after 104160 ns * 78,
                                  '1' after 104160 ns * 79,                      
                                  '0' after 104160 ns * 82,
                                  '1' after 104160 ns * 83,
                                  '1' after 104160 ns * 84,
                                  '1' after 104160 ns * 85,
                                  '0' after 104160 ns * 86,
                                  '0' after 104160 ns * 87,
                                  '0' after 104160 ns * 88,
                                  '0' after 104160 ns * 89,
                                  '1' after 104160 ns * 90,                     
                                  '0' after 104160 ns * 93,
                                  '0' after 104160 ns * 94,
                                  '1' after 104160 ns * 95,
                                  '1' after 104160 ns * 96,
                                  '0' after 104160 ns * 97,
                                  '0' after 104160 ns * 98,
                                  '0' after 104160 ns * 99,
                                  '0' after 104160 ns * 100,
                                  '1' after 104160 ns * 101,                       
                                  '0' after 104160 ns * 104,
                                  '0' after 104160 ns * 105,
                                  '1' after 104160 ns * 106,
                                  '1' after 104160 ns * 107,
                                  '0' after 104160 ns * 108,
                                  '1' after 104160 ns * 109,
                                  '0' after 104160 ns * 110,
                                  '0' after 104160 ns * 111,
                                  '1' after 104160 ns * 112,
                                  '0' after 104160 ns * 115,
                                  '0' after 104160 ns * 116,
                                  '1' after 104160 ns * 117,
                                  '1' after 104160 ns * 118,
                                  '0' after 104160 ns * 119,
                                  '0' after 104160 ns * 120,
                                  '0' after 104160 ns * 121,
                                  '0' after 104160 ns * 122,
                                  '1' after 104160 ns * 123,
                                  '0' after 104160 ns * 126,
                                  '1' after 104160 ns * 127,
                                  '1' after 104160 ns * 128,
                                  '1' after 104160 ns * 129,
                                  '0' after 104160 ns * 130,
                                  '0' after 104160 ns * 131,
                                  '0' after 104160 ns * 132,
                                  '1' after 104160 ns * 133,
                                  '1' after 104160 ns * 134,
                                  '0' after 104160 ns * 137,
                                  '1' after 104160 ns * 138,
                                  '1' after 104160 ns * 139,
                                  '1' after 104160 ns * 140,
                                  '0' after 104160 ns * 141,
                                  '0' after 104160 ns * 142,
                                  '0' after 104160 ns * 143,
                                  '1' after 104160 ns * 144,
                                  '1' after 104160 ns * 145,
                                  '0' after 104160 ns * 146;



        tb_RST <= '1',
                  --'1' after 250 ns,
                  '0' after 13 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
