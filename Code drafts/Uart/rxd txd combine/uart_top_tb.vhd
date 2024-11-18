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

entity uart_top_tb is
--  Port ( );
end uart_top_tb;

architecture Behavioral of uart_top_tb is
    component uart_top
        port 
            (
            Clk : in STD_LOGIC;
            Rst : in STD_LOGIC;
    
            rxd_data : in STD_LOGIC;
            txd_data : out STD_LOGIC; 
    
            --Start_txd_top : in STD_LOGIC;
            --rxd_done_top : out STD_LOGIC;
    
            data : out STD_LOGIC_VECTOR (7 downto 0)
            --switches_top : in STD_LOGIC_VECTOR (7 downto 0)
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal rxd_data_tb : std_logic;
    signal txd_data_tb : std_logic;
    signal switches_top_tb : std_logic_vector(7 downto 0);
    signal data_tb : std_logic_vector(7 downto 0);
    signal rxd_done_top_tb : std_logic;
    signal counter: integer range 0 to 99 := 1;
        

    begin
        DUT : uart_top
        port map (
            Clk => tb_CLK,
            Rst => tb_RST,
    
            rxd_data => rxd_data_tb,
            txd_data => txd_data_tb,
            
            --rxd_done_top => rxd_done_top_tb,

            data => data_tb

        );

        -- rxd_data_tb <= '0',
        --                '0' after 104160 ns * counter,
        --                '1' after 208320 ns,
        --                '1' after 312480 ns,
        --                '0' after 416640 ns,
        --                '1' after 520800 ns,
        --                '0' after 624960 ns,
        --                '0' after 729120 ns,
        --                '1' after 833280 ns,
        --                '1' after 937440 ns,
        --                '1' after 1041600 ns,

        rxd_data_tb <= '1',
                       '0' after 104160 ns * 1,
                       '0' after 104160 ns * 2,
                       '1' after 104160 ns * 3,
                       '1' after 104160 ns * 4,
                       '0' after 104160 ns * 5,
                       '0' after 104160 ns * 6,
                       '0' after 104160 ns * 7,
                       '0' after 104160 ns * 8,
                       '1' after 104160 ns * 9,                       
                       '0' after 104160 ns * 10,
                       '0' after 104160 ns * 11,
                       '1' after 104160 ns * 12,
                       '1' after 104160 ns * 13,
                       '0' after 104160 ns * 14,
                       '0' after 104160 ns * 15,
                       '0' after 104160 ns * 16,
                       '0' after 104160 ns * 17,
                       '1' after 104160 ns * 18,                       
                       '0' after 104160 ns * 19,
                       '0' after 104160 ns * 20,
                       '1' after 104160 ns * 21,
                       '1' after 104160 ns * 22,
                       '0' after 104160 ns * 23,
                       '0' after 104160 ns * 24,
                       '0' after 104160 ns * 25,
                       '0' after 104160 ns * 26,
                       '1' after 104160 ns * 27,                      
                       '0' after 104160 ns * 28,
                       '0' after 104160 ns * 29,
                       '1' after 104160 ns * 30,
                       '1' after 104160 ns * 31,
                       '0' after 104160 ns * 32,
                       '0' after 104160 ns * 33,
                       '0' after 104160 ns * 34,
                       '0' after 104160 ns * 35,
                       '1' after 104160 ns * 36,                      
                       '0' after 104160 ns * 37,
                       '0' after 104160 ns * 38,
                       '1' after 104160 ns * 39,
                       '1' after 104160 ns * 40,
                       '0' after 104160 ns * 41,
                       '0' after 104160 ns * 42,
                       '0' after 104160 ns * 43,
                       '0' after 104160 ns * 44,
                       '1' after 104160 ns * 45,                      
                       '0' after 104160 ns * 46,
                       '0' after 104160 ns * 47,
                       '1' after 104160 ns * 48,
                       '1' after 104160 ns * 49,
                       '0' after 104160 ns * 50,
                       '0' after 104160 ns * 51,
                       '0' after 104160 ns * 52,
                       '0' after 104160 ns * 53,
                       '1' after 104160 ns * 54,                      
                       '0' after 104160 ns * 55,
                       '0' after 104160 ns * 56,
                       '1' after 104160 ns * 57,
                       '1' after 104160 ns * 58,
                       '0' after 104160 ns * 59,
                       '0' after 104160 ns * 60,
                       '0' after 104160 ns * 61,
                       '0' after 104160 ns * 62,
                       '1' after 104160 ns * 63,                      
                       '0' after 104160 ns * 64,
                       '0' after 104160 ns * 65,
                       '1' after 104160 ns * 66,
                       '1' after 104160 ns * 67,
                       '0' after 104160 ns * 68,
                       '0' after 104160 ns * 69,
                       '0' after 104160 ns * 70,
                       '0' after 104160 ns * 71,
                       '1' after 104160 ns * 72,                     
                       '0' after 104160 ns * 73,
                       '0' after 104160 ns * 74,
                       '1' after 104160 ns * 75,
                       '1' after 104160 ns * 76,
                       '0' after 104160 ns * 77,
                       '0' after 104160 ns * 78,
                       '0' after 104160 ns * 79,
                       '0' after 104160 ns * 80,
                       '1' after 104160 ns * 81,                       
                       '0' after 104160 ns * 82,
                       '0' after 104160 ns * 83,
                       '1' after 104160 ns * 84,
                       '1' after 104160 ns * 85,
                       '0' after 104160 ns * 86,
                       '0' after 104160 ns * 87,
                       '0' after 104160 ns * 88,
                       '0' after 104160 ns * 89,
                       '1' after 104160 ns * 90,
                       '0' after 104160 ns * 91,
                       '0' after 104160 ns * 92,
                       '1' after 104160 ns * 93,
                       '1' after 104160 ns * 94,
                       '0' after 104160 ns * 95,
                       '0' after 104160 ns * 96,
                       '0' after 104160 ns * 97,
                       '0' after 104160 ns * 98,
                       '1' after 104160 ns * 99,
                       '0' after 104160 ns * 100,
                       '0' after 104160 ns * 101,
                       '1' after 104160 ns * 102,
                       '1' after 104160 ns * 103,
                       '0' after 104160 ns * 104,
                       '0' after 104160 ns * 105,
                       '0' after 104160 ns * 106,
                       '0' after 104160 ns * 107,
                       '1' after 104160 ns * 108,
                       '0' after 104160 ns * 109,
                       '0' after 104160 ns * 110,
                       '1' after 104160 ns * 111,
                       '1' after 104160 ns * 112,
                       '0' after 104160 ns * 113,
                       '0' after 104160 ns * 114,
                       '0' after 104160 ns * 115,
                       '0' after 104160 ns * 116,
                       '1' after 104160 ns * 117;





        tb_RST <= '1',
                  --'1' after 250 ns,
                  '0' after 10 ns;

        counter_up : process --counter needs to increase after 10416
        begin
            wait until rising_edge(tb_CLK);
            if counter = 99 then
                counter <= 0;
            else
                counter<= counter+ 1;
            end if; 
        end process;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
