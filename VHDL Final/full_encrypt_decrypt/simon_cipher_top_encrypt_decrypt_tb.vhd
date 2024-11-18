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

entity simon_cipher_top_encrypt_decrypt_tb is
--  Port ( );
end simon_cipher_top_encrypt_decrypt_tb;

architecture Behavioral of simon_cipher_top_encrypt_decrypt_tb is
    component simon_cipher_top_encrypt_decrypt
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
    signal tb_rxd_data_in_highest : std_logic;
    signal tb_txd_data_out_highest : std_logic;
        

    begin
        DUT : simon_cipher_top_encrypt_decrypt
        port map (
            Clk => tb_CLK,
            Rst => tb_RST,
            rxd_data_in_highest => tb_rxd_data_in_highest,
            txd_data_out_highest => tb_txd_data_out_highest
        );


       
        tb_rxd_data_in_highest <= '1',
                                  '0' after 104160 ns * 1,
                                  '0' after 104160 ns * 2,--0 this is for encrypt decrypt
                                  '1' after 104160 ns * 3,--
                                  '1' after 104160 ns * 4,--
                                  '1' after 104160 ns * 5,--
                                  '1' after 104160 ns * 6,--
                                  '0' after 104160 ns * 7,--
                                  '0' after 104160 ns * 8,--
                                  '0' after 104160 ns * 9,--                       
                                  '0' after 104160 ns * 10,
                                  '1' after 104160 ns * 11,--1
                                  '0' after 104160 ns * 12,--
                                  '0' after 104160 ns * 13,--
                                  '1' after 104160 ns * 14,--
                                  '1' after 104160 ns * 15,--
                                  '0' after 104160 ns * 16,--
                                  '0' after 104160 ns * 17,--
                                  '0' after 104160 ns * 18,--                       
                                  '0' after 104160 ns * 19,
                                  '0' after 104160 ns * 20,--2
                                  '0' after 104160 ns * 21,--
                                  '0' after 104160 ns * 22,--
                                  '1' after 104160 ns * 23,--
                                  '1' after 104160 ns * 24,--
                                  '0' after 104160 ns * 25,--
                                  '0' after 104160 ns * 26,--
                                  '0' after 104160 ns * 27,--    
                                  '0' after 104160 ns * 28,
                                  '1' after 104160 ns * 29,--3
                                  '0' after 104160 ns * 30,--
                                  '0' after 104160 ns * 31,--
                                  '0' after 104160 ns * 32,--
                                  '1' after 104160 ns * 33,--
                                  '0' after 104160 ns * 34,--
                                  '0' after 104160 ns * 35,--                      
                                  '0' after 104160 ns * 36,--
                                  '0' after 104160 ns * 37,
                                  '0' after 104160 ns * 38,--4
                                  '0' after 104160 ns * 39,--
                                  '0' after 104160 ns * 40,--
                                  '0' after 104160 ns * 41,--
                                  '1' after 104160 ns * 42,--
                                  '0' after 104160 ns * 43,--
                                  '0' after 104160 ns * 44,--                      
                                  '0' after 104160 ns * 45,--
                                  '0' after 104160 ns * 46,
                                  '1' after 104160 ns * 47,--5
                                  '0' after 104160 ns * 48,--
                                  '0' after 104160 ns * 49,--
                                  '1' after 104160 ns * 50,--
                                  '0' after 104160 ns * 51,--
                                  '0' after 104160 ns * 52,--
                                  '0' after 104160 ns * 53,--                      
                                  '0' after 104160 ns * 54,--
                                  '0' after 104160 ns * 55,
                                  '0' after 104160 ns * 56,--6
                                  '0' after 104160 ns * 57,--
                                  '0' after 104160 ns * 58,--
                                  '1' after 104160 ns * 59,--
                                  '0' after 104160 ns * 60,--
                                  '0' after 104160 ns * 61,--
                                  '0' after 104160 ns * 62,--                    
                                  '0' after 104160 ns * 63,-- 
                                  '0' after 104160 ns * 64,
                                  '1' after 104160 ns * 65,--7
                                  '0' after 104160 ns * 66,--
                                  '0' after 104160 ns * 67,--
                                  '0' after 104160 ns * 68,--
                                  '0' after 104160 ns * 69,--
                                  '0' after 104160 ns * 70,--
                                  '0' after 104160 ns * 71,--                  
                                  '0' after 104160 ns * 72,--
                                  '0' after 104160 ns * 73,
                                  '0' after 104160 ns * 74,--8
                                  '0' after 104160 ns * 75,--
                                  '0' after 104160 ns * 76,--
                                  '0' after 104160 ns * 77,--
                                  '0' after 104160 ns * 78,--
                                  '0' after 104160 ns * 79,--
                                  '0' after 104160 ns * 80,--               
                                  '0' after 104160 ns * 81,-- 
                                  '0' after 104160 ns * 82,
                                  '1' after 104160 ns * 83,--9
                                  '0' after 104160 ns * 84,--
                                  '1' after 104160 ns * 85,--
                                  '0' after 104160 ns * 86,--
                                  '0' after 104160 ns * 87,--
                                  '1' after 104160 ns * 88,--
                                  '1' after 104160 ns * 89,--               
                                  '0' after 104160 ns * 90,--
                                  '0' after 104160 ns * 91,
                                  '1' after 104160 ns * 92,--10
                                  '0' after 104160 ns * 93,--
                                  '1' after 104160 ns * 94,--
                                  '0' after 104160 ns * 95,--
                                  '0' after 104160 ns * 96,--
                                  '1' after 104160 ns * 97,--
                                  '1' after 104160 ns * 98,--
                                  '0' after 104160 ns * 99,-- 
                                  '0' after 104160 ns * 100,
                                  '0' after 104160 ns * 101,--11
                                  '0' after 104160 ns * 102,--
                                  '0' after 104160 ns * 103,--
                                  '1' after 104160 ns * 104,--
                                  '0' after 104160 ns * 105,--
                                  '1' after 104160 ns * 106,--
                                  '1' after 104160 ns * 107,--
                                  '0' after 104160 ns * 108,-- 
                                  '0' after 104160 ns * 109,
                                  '1' after 104160 ns * 110,--12
                                  '1' after 104160 ns * 111,--
                                  '1' after 104160 ns * 112,--
                                  '0' after 104160 ns * 113,--
                                  '1' after 104160 ns * 114,--
                                  '1' after 104160 ns * 115,--
                                  '1' after 104160 ns * 116,--
                                  '0' after 104160 ns * 117,--
                                  '0' after 104160 ns * 118,
                                  '1' after 104160 ns * 119,--13
                                  '1' after 104160 ns * 120,--
                                  '0' after 104160 ns * 121,--
                                  '0' after 104160 ns * 122,--
                                  '0' after 104160 ns * 123,--
                                  '1' after 104160 ns * 124,--
                                  '1' after 104160 ns * 125,--
                                  '1' after 104160 ns * 126,--
                                  '0' after 104160 ns * 127,
                                  '1' after 104160 ns * 128,--14
                                  '0' after 104160 ns * 129,--
                                  '1' after 104160 ns * 130,--
                                  '1' after 104160 ns * 131,--
                                  '1' after 104160 ns * 132,--
                                  '0' after 104160 ns * 133,--
                                  '0' after 104160 ns * 134,--
                                  '0' after 104160 ns * 135,-- 
                                  '0' after 104160 ns * 136,
                                  '1' after 104160 ns * 137,--15
                                  '0' after 104160 ns * 138,--
                                  '0' after 104160 ns * 139,--
                                  '1' after 104160 ns * 140,--
                                  '0' after 104160 ns * 141,--
                                  '0' after 104160 ns * 142,--
                                  '0' after 104160 ns * 143,--
                                  '0' after 104160 ns * 144,-- 
                                  '0' after 104160 ns * 145,
                                  '1' after 104160 ns * 146,--16
                                  '0' after 104160 ns * 147,--
                                  '0' after 104160 ns * 148,--
                                  '1' after 104160 ns * 149,--
                                  '1' after 104160 ns * 150,--
                                  '0' after 104160 ns * 151,--
                                  '1' after 104160 ns * 152,--
                                  '0' after 104160 ns * 153,-- 
                                  '0' after 104160 ns * 154,
                                  '1' after 104160 ns * 155,--17
                                  '0' after 104160 ns * 156,--
                                  '0' after 104160 ns * 157,--
                                  '0' after 104160 ns * 158,--
                                  '1' after 104160 ns * 159,--
                                  '0' after 104160 ns * 160,--
                                  '1' after 104160 ns * 161,--
                                  '0' after 104160 ns * 162,-- 
                                  '0' after 104160 ns * 163,
                                  '1' after 104160 ns * 164,--18
                                  '0' after 104160 ns * 165,--
                                  '0' after 104160 ns * 166,--
                                  '1' after 104160 ns * 167,--
                                  '1' after 104160 ns * 168,--
                                  '0' after 104160 ns * 169,--
                                  '0' after 104160 ns * 170,--
                                  '0' after 104160 ns * 171,-- 
                                  '0' after 104160 ns * 172,
                                  '1' after 104160 ns * 173,--19
                                  '0' after 104160 ns * 174,--
                                  '0' after 104160 ns * 175,--
                                  '1' after 104160 ns * 176,--
                                  '1' after 104160 ns * 177,--
                                  '1' after 104160 ns * 178,--
                                  '0' after 104160 ns * 179,--
                                  '0' after 104160 ns * 180,-- 
                                  '0' after 104160 ns * 181,
                                  '1' after 104160 ns * 182,--20
                                  '0' after 104160 ns * 183,--
                                  '0' after 104160 ns * 184,--
                                  '0' after 104160 ns * 185,--
                                  '1' after 104160 ns * 186,--
                                  '0' after 104160 ns * 187,--
                                  '0' after 104160 ns * 188,--
                                  '1' after 104160 ns * 189,-- 
                                  '0' after 104160 ns * 190,
                                  '1' after 104160 ns * 191,--21
                                  '0' after 104160 ns * 192,--
                                  '0' after 104160 ns * 193,--
                                  '1' after 104160 ns * 194,--
                                  '1' after 104160 ns * 195,--
                                  '0' after 104160 ns * 196,--
                                  '0' after 104160 ns * 197,--
                                  '0' after 104160 ns * 198,-- 
                                  '0' after 104160 ns * 199,
                                  '1' after 104160 ns * 200,--22
                                  '0' after 104160 ns * 201,--
                                  '1' after 104160 ns * 202,--
                                  '0' after 104160 ns * 203,--
                                  '1' after 104160 ns * 204,--
                                  '0' after 104160 ns * 205,--
                                  '0' after 104160 ns * 206,--
                                  '0' after 104160 ns * 207,-- 
                                  '0' after 104160 ns * 208,
                                  '1' after 104160 ns * 209,--23
                                  '0' after 104160 ns * 210,--
                                  '0' after 104160 ns * 211,--
                                  '1' after 104160 ns * 212,--
                                  '0' after 104160 ns * 213,--
                                  '0' after 104160 ns * 214,--
                                  '0' after 104160 ns * 215,--
                                  '0' after 104160 ns * 216,-- 
                                  '0' after 104160 ns * 217,
                                  '0' after 104160 ns * 218,--24
                                  '0' after 104160 ns * 219,--
                                  '0' after 104160 ns * 220,--
                                  '1' after 104160 ns * 221,--
                                  '1' after 104160 ns * 222,--
                                  '1' after 104160 ns * 223,--
                                  '0' after 104160 ns * 224,--
                                  '0' after 104160 ns * 225,-- 
                                  '0' after 104160 ns * 226,
                                  '1' after 104160 ns * 227,--25
                                  '0' after 104160 ns * 228,--
                                  '1' after 104160 ns * 229,--
                                  '1' after 104160 ns * 230,--
                                  '1' after 104160 ns * 231,--
                                  '0' after 104160 ns * 232,--
                                  '0' after 104160 ns * 233,--
                                  '0' after 104160 ns * 234,--
                                  '1' after 104160 ns * 235;-- end bit


        tb_RST <= '1',
                  '0' after 13 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
