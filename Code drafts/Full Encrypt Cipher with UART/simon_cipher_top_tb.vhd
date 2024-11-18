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

entity simon_cipher_top_tb is
--  Port ( );
end simon_cipher_top_tb;

architecture Behavioral of simon_cipher_top_tb is
    component simon_cipher_top
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
        DUT : simon_cipher_top
        port map (
            Clk => tb_CLK,
            Rst => tb_RST,
            rxd_data_in_highest => tb_rxd_data_in_highest,
            txd_data_out_highest => tb_txd_data_out_highest
        );


        -- tb_rxd_data_in_highest <= '1',
        --                           '0' after 104160 ns * 1,
        --                           '1' after 104160 ns * 2,--1
        --                           '0' after 104160 ns * 3,--
        --                           '0' after 104160 ns * 4,--
        --                           '1' after 104160 ns * 5,--
        --                           '1' after 104160 ns * 6,--
        --                           '0' after 104160 ns * 7,--
        --                           '0' after 104160 ns * 8,--
        --                           '0' after 104160 ns * 9,-- 
        --                           '1' after 104160 ns * 10,--parity to end on 1                       
        --                           '0' after 104160 ns * 13,
        --                           '0' after 104160 ns * 14,--2
        --                           '0' after 104160 ns * 15,--
        --                           '0' after 104160 ns * 16,--
        --                           '1' after 104160 ns * 17,--
        --                           '1' after 104160 ns * 18,--
        --                           '0' after 104160 ns * 19,--
        --                           '0' after 104160 ns * 20,--
        --                           '0' after 104160 ns * 21,--
        --                           '1' after 104160 ns * 22,--parity to end on 1      
        --                           '0' after 104160 ns * 24,
        --                           '1' after 104160 ns * 25,--3
        --                           '0' after 104160 ns * 26,--
        --                           '0' after 104160 ns * 27,--
        --                           '0' after 104160 ns * 28,--
        --                           '1' after 104160 ns * 29,--
        --                           '0' after 104160 ns * 30,--
        --                           '0' after 104160 ns * 31,--                      
        --                           '0' after 104160 ns * 32,--
        --                           '1' after 104160 ns * 33,--parity to end on 1
        --                           '0' after 104160 ns * 35,
        --                           '0' after 104160 ns * 36,--4
        --                           '0' after 104160 ns * 37,--
        --                           '0' after 104160 ns * 38,--
        --                           '0' after 104160 ns * 39,--
        --                           '1' after 104160 ns * 40,--
        --                           '0' after 104160 ns * 41,--
        --                           '0' after 104160 ns * 42,--                      
        --                           '0' after 104160 ns * 43,--
        --                           '1' after 104160 ns * 44,--parity to end on 1 
        --                           '0' after 104160 ns * 46,
        --                           '1' after 104160 ns * 47,--5
        --                           '0' after 104160 ns * 48,--
        --                           '0' after 104160 ns * 49,--
        --                           '1' after 104160 ns * 50,--
        --                           '0' after 104160 ns * 51,--
        --                           '0' after 104160 ns * 52,--
        --                           '0' after 104160 ns * 53,--                      
        --                           '0' after 104160 ns * 54,--
        --                           '1' after 104160 ns * 55,--parity to end on 1
        --                           '0' after 104160 ns * 57,
        --                           '0' after 104160 ns * 58,--6
        --                           '0' after 104160 ns * 59,--
        --                           '0' after 104160 ns * 60,--
        --                           '1' after 104160 ns * 61,--
        --                           '0' after 104160 ns * 62,--
        --                           '0' after 104160 ns * 63,--
        --                           '0' after 104160 ns * 64,--                    
        --                           '0' after 104160 ns * 65,--
        --                           '1' after 104160 ns * 66,--parity to end on 1 
        --                           '0' after 104160 ns * 68,
        --                           '1' after 104160 ns * 69,--7
        --                           '0' after 104160 ns * 70,--
        --                           '0' after 104160 ns * 71,--
        --                           '0' after 104160 ns * 72,--
        --                           '0' after 104160 ns * 73,--
        --                           '0' after 104160 ns * 74,--
        --                           '0' after 104160 ns * 75,--                  
        --                           '0' after 104160 ns * 76,--
        --                           '1' after 104160 ns * 77,--parity to end on 1
        --                           '0' after 104160 ns * 79,
        --                           '0' after 104160 ns * 80,--8
        --                           '0' after 104160 ns * 81,--
        --                           '0' after 104160 ns * 82,--
        --                           '0' after 104160 ns * 83,--
        --                           '0' after 104160 ns * 84,--
        --                           '0' after 104160 ns * 85,--
        --                           '0' after 104160 ns * 86,--               
        --                           '0' after 104160 ns * 87,--
        --                           '1' after 104160 ns * 88,--parity to end on 1 
        --                           '0' after 104160 ns * 90,
        --                           '1' after 104160 ns * 91,--9
        --                           '0' after 104160 ns * 92,--
        --                           '1' after 104160 ns * 93,--
        --                           '0' after 104160 ns * 94,--
        --                           '0' after 104160 ns * 95,--
        --                           '1' after 104160 ns * 96,--
        --                           '1' after 104160 ns * 97,--               
        --                           '0' after 104160 ns * 98,--
        --                           '1' after 104160 ns * 99,--parity to end on 1
        --                           '0' after 104160 ns * 101,
        --                           '1' after 104160 ns * 102,--10
        --                           '0' after 104160 ns * 103,--
        --                           '1' after 104160 ns * 104,--
        --                           '0' after 104160 ns * 105,--
        --                           '0' after 104160 ns * 106,--
        --                           '1' after 104160 ns * 107,--
        --                           '1' after 104160 ns * 108,--
        --                           '0' after 104160 ns * 109,--
        --                           '1' after 104160 ns * 110,--parity to end on 1 
        --                           '0' after 104160 ns * 112,
        --                           '0' after 104160 ns * 113,--11
        --                           '0' after 104160 ns * 114,--
        --                           '0' after 104160 ns * 115,--
        --                           '1' after 104160 ns * 116,--
        --                           '0' after 104160 ns * 117,--
        --                           '1' after 104160 ns * 118,--
        --                           '1' after 104160 ns * 119,--
        --                           '0' after 104160 ns * 120,--
        --                           '1' after 104160 ns * 121,--parity to end on 1 
        --                           '0' after 104160 ns * 123,
        --                           '1' after 104160 ns * 124,--12
        --                           '1' after 104160 ns * 125,--
        --                           '1' after 104160 ns * 126,--
        --                           '0' after 104160 ns * 127,--
        --                           '1' after 104160 ns * 128,--
        --                           '1' after 104160 ns * 129,--
        --                           '1' after 104160 ns * 130,--
        --                           '0' after 104160 ns * 131,--
        --                           '1' after 104160 ns * 132,--parity to end on 1
        --                           '0' after 104160 ns * 134,
        --                           '1' after 104160 ns * 135,--13
        --                           '1' after 104160 ns * 136,--
        --                           '0' after 104160 ns * 137,--
        --                           '0' after 104160 ns * 138,--
        --                           '0' after 104160 ns * 139,--
        --                           '1' after 104160 ns * 140,--
        --                           '1' after 104160 ns * 141,--
        --                           '1' after 104160 ns * 142,--
        --                           '1' after 104160 ns * 143,--parity to end on 1
        --                           '0' after 104160 ns * 145,
        --                           '1' after 104160 ns * 146,--14
        --                           '0' after 104160 ns * 147,--
        --                           '1' after 104160 ns * 148,--
        --                           '1' after 104160 ns * 149,--
        --                           '1' after 104160 ns * 150,--
        --                           '0' after 104160 ns * 151,--
        --                           '0' after 104160 ns * 152,--
        --                           '0' after 104160 ns * 153,-- 
        --                           '1' after 104160 ns * 154,--parity to end on 1
        --                           '0' after 104160 ns * 156,
        --                           '1' after 104160 ns * 157,--15
        --                           '0' after 104160 ns * 158,--
        --                           '0' after 104160 ns * 159,--
        --                           '1' after 104160 ns * 160,--
        --                           '0' after 104160 ns * 161,--
        --                           '0' after 104160 ns * 162,--
        --                           '0' after 104160 ns * 163,--
        --                           '0' after 104160 ns * 164,-- 
        --                           '1' after 104160 ns * 165,--parity to end on 1
        --                           '0' after 104160 ns * 167,
        --                           '1' after 104160 ns * 168,--16
        --                           '0' after 104160 ns * 169,--
        --                           '0' after 104160 ns * 170,--
        --                           '1' after 104160 ns * 171,--
        --                           '1' after 104160 ns * 172,--
        --                           '0' after 104160 ns * 173,--
        --                           '1' after 104160 ns * 174,--
        --                           '0' after 104160 ns * 175,-- 
        --                           '1' after 104160 ns * 176,--parity to end on 1
        --                           '0' after 104160 ns * 178,
        --                           '1' after 104160 ns * 179,--17
        --                           '0' after 104160 ns * 180,--
        --                           '0' after 104160 ns * 181,--
        --                           '0' after 104160 ns * 182,--
        --                           '1' after 104160 ns * 183,--
        --                           '0' after 104160 ns * 184,--
        --                           '1' after 104160 ns * 185,--
        --                           '0' after 104160 ns * 186,-- 
        --                           '1' after 104160 ns * 187,--parity to end on 1
        --                           '0' after 104160 ns * 189,
        --                           '1' after 104160 ns * 190,--18
        --                           '0' after 104160 ns * 191,--
        --                           '0' after 104160 ns * 192,--
        --                           '1' after 104160 ns * 193,--
        --                           '1' after 104160 ns * 194,--
        --                           '0' after 104160 ns * 195,--
        --                           '0' after 104160 ns * 196,--
        --                           '0' after 104160 ns * 197,-- 
        --                           '1' after 104160 ns * 198,--parity to end on 1
        --                           '0' after 104160 ns * 200,
        --                           '1' after 104160 ns * 201,--19
        --                           '0' after 104160 ns * 202,--
        --                           '0' after 104160 ns * 203,--
        --                           '1' after 104160 ns * 204,--
        --                           '1' after 104160 ns * 205,--
        --                           '1' after 104160 ns * 206,--
        --                           '0' after 104160 ns * 207,--
        --                           '0' after 104160 ns * 208,-- 
        --                           '1' after 104160 ns * 209,--parity to end on 1
        --                           '0' after 104160 ns * 211,
        --                           '1' after 104160 ns * 212,--20
        --                           '0' after 104160 ns * 213,--
        --                           '0' after 104160 ns * 214,--
        --                           '0' after 104160 ns * 215,--
        --                           '1' after 104160 ns * 216,--
        --                           '0' after 104160 ns * 217,--
        --                           '0' after 104160 ns * 218,--
        --                           '1' after 104160 ns * 219,-- 
        --                           '1' after 104160 ns * 220,--parity to end on 1
        --                           '0' after 104160 ns * 222,
        --                           '1' after 104160 ns * 223,--21
        --                           '0' after 104160 ns * 224,--
        --                           '0' after 104160 ns * 225,--
        --                           '1' after 104160 ns * 226,--
        --                           '1' after 104160 ns * 227,--
        --                           '0' after 104160 ns * 228,--
        --                           '0' after 104160 ns * 229,--
        --                           '0' after 104160 ns * 230,-- 
        --                           '1' after 104160 ns * 231,--parity to end on 1
        --                           '0' after 104160 ns * 233,
        --                           '1' after 104160 ns * 234,--22
        --                           '0' after 104160 ns * 235,--
        --                           '1' after 104160 ns * 236,--
        --                           '0' after 104160 ns * 237,--
        --                           '1' after 104160 ns * 238,--
        --                           '0' after 104160 ns * 239,--
        --                           '0' after 104160 ns * 240,--
        --                           '0' after 104160 ns * 241,-- 
        --                           '1' after 104160 ns * 242,--parity to end on 1
        --                           '0' after 104160 ns * 244,
        --                           '1' after 104160 ns * 245,--23
        --                           '0' after 104160 ns * 246,--
        --                           '0' after 104160 ns * 247,--
        --                           '1' after 104160 ns * 248,--
        --                           '0' after 104160 ns * 249,--
        --                           '0' after 104160 ns * 250,--
        --                           '0' after 104160 ns * 251,--
        --                           '0' after 104160 ns * 252,-- 
        --                           '1' after 104160 ns * 253,--parity to end on 1
        --                           '0' after 104160 ns * 255,
        --                           '0' after 104160 ns * 256,--24
        --                           '0' after 104160 ns * 257,--
        --                           '0' after 104160 ns * 258,--
        --                           '1' after 104160 ns * 259,--
        --                           '1' after 104160 ns * 260,--
        --                           '1' after 104160 ns * 261,--
        --                           '0' after 104160 ns * 262,--
        --                           '0' after 104160 ns * 263,-- 
        --                           '1' after 104160 ns * 264,--parity to end on 1
        --                           '0' after 104160 ns * 266,
        --                           '1' after 104160 ns * 267,--25
        --                           '0' after 104160 ns * 268,--
        --                           '1' after 104160 ns * 269,--
        --                           '1' after 104160 ns * 270,--
        --                           '1' after 104160 ns * 271,--
        --                           '0' after 104160 ns * 272,--
        --                           '0' after 104160 ns * 273,--
        --                           '0' after 104160 ns * 274,-- 
        --                           '1' after 104160 ns * 275;--parity to end on 1
       
        tb_rxd_data_in_highest <= '1',
                                  '0' after 104160 ns * 1,
                                  '1' after 104160 ns * 2,--1
                                  '0' after 104160 ns * 3,--
                                  '0' after 104160 ns * 4,--
                                  '1' after 104160 ns * 5,--
                                  '1' after 104160 ns * 6,--
                                  '0' after 104160 ns * 7,--
                                  '0' after 104160 ns * 8,--
                                  '0' after 104160 ns * 9,--                       
                                  '0' after 104160 ns * 10,
                                  '0' after 104160 ns * 11,--2
                                  '0' after 104160 ns * 12,--
                                  '0' after 104160 ns * 13,--
                                  '1' after 104160 ns * 14,--
                                  '1' after 104160 ns * 15,--
                                  '0' after 104160 ns * 16,--
                                  '0' after 104160 ns * 17,--
                                  '0' after 104160 ns * 18,--    
                                  '0' after 104160 ns * 19,
                                  '1' after 104160 ns * 20,--3
                                  '0' after 104160 ns * 21,--
                                  '0' after 104160 ns * 22,--
                                  '0' after 104160 ns * 23,--
                                  '1' after 104160 ns * 24,--
                                  '0' after 104160 ns * 25,--
                                  '0' after 104160 ns * 26,--                      
                                  '0' after 104160 ns * 27,--
                                  '0' after 104160 ns * 28,
                                  '0' after 104160 ns * 29,--4
                                  '0' after 104160 ns * 30,--
                                  '0' after 104160 ns * 31,--
                                  '0' after 104160 ns * 32,--
                                  '1' after 104160 ns * 33,--
                                  '0' after 104160 ns * 34,--
                                  '0' after 104160 ns * 35,--                      
                                  '0' after 104160 ns * 36,--
                                  '0' after 104160 ns * 37,
                                  '1' after 104160 ns * 38,--5
                                  '0' after 104160 ns * 39,--
                                  '0' after 104160 ns * 40,--
                                  '1' after 104160 ns * 41,--
                                  '0' after 104160 ns * 42,--
                                  '0' after 104160 ns * 43,--
                                  '0' after 104160 ns * 44,--                      
                                  '0' after 104160 ns * 45,--
                                  '0' after 104160 ns * 46,
                                  '0' after 104160 ns * 47,--6
                                  '0' after 104160 ns * 48,--
                                  '0' after 104160 ns * 49,--
                                  '1' after 104160 ns * 50,--
                                  '0' after 104160 ns * 51,--
                                  '0' after 104160 ns * 52,--
                                  '0' after 104160 ns * 53,--                    
                                  '0' after 104160 ns * 54,-- 
                                  '0' after 104160 ns * 55,
                                  '1' after 104160 ns * 56,--7
                                  '0' after 104160 ns * 57,--
                                  '0' after 104160 ns * 58,--
                                  '0' after 104160 ns * 59,--
                                  '0' after 104160 ns * 60,--
                                  '0' after 104160 ns * 61,--
                                  '0' after 104160 ns * 62,--                  
                                  '0' after 104160 ns * 63,--
                                  '0' after 104160 ns * 64,
                                  '0' after 104160 ns * 65,--8
                                  '0' after 104160 ns * 66,--
                                  '0' after 104160 ns * 67,--
                                  '0' after 104160 ns * 68,--
                                  '0' after 104160 ns * 69,--
                                  '0' after 104160 ns * 70,--
                                  '0' after 104160 ns * 71,--               
                                  '0' after 104160 ns * 72,-- 
                                  '0' after 104160 ns * 73,
                                  '1' after 104160 ns * 74,--9
                                  '0' after 104160 ns * 75,--
                                  '1' after 104160 ns * 76,--
                                  '0' after 104160 ns * 77,--
                                  '0' after 104160 ns * 78,--
                                  '1' after 104160 ns * 79,--
                                  '1' after 104160 ns * 80,--               
                                  '0' after 104160 ns * 81,--
                                  '0' after 104160 ns * 82,
                                  '1' after 104160 ns * 83,--10
                                  '0' after 104160 ns * 84,--
                                  '1' after 104160 ns * 85,--
                                  '0' after 104160 ns * 86,--
                                  '0' after 104160 ns * 87,--
                                  '1' after 104160 ns * 88,--
                                  '1' after 104160 ns * 89,--
                                  '0' after 104160 ns * 90,-- 
                                  '0' after 104160 ns * 91,
                                  '0' after 104160 ns * 92,--11
                                  '0' after 104160 ns * 93,--
                                  '0' after 104160 ns * 94,--
                                  '1' after 104160 ns * 95,--
                                  '0' after 104160 ns * 96,--
                                  '1' after 104160 ns * 97,--
                                  '1' after 104160 ns * 98,--
                                  '0' after 104160 ns * 99,-- 
                                  '0' after 104160 ns * 100,
                                  '1' after 104160 ns * 101,--12
                                  '1' after 104160 ns * 102,--
                                  '1' after 104160 ns * 103,--
                                  '0' after 104160 ns * 104,--
                                  '1' after 104160 ns * 105,--
                                  '1' after 104160 ns * 106,--
                                  '1' after 104160 ns * 107,--
                                  '0' after 104160 ns * 108,--
                                  '0' after 104160 ns * 109,
                                  '1' after 104160 ns * 110,--13
                                  '1' after 104160 ns * 111,--
                                  '0' after 104160 ns * 112,--
                                  '0' after 104160 ns * 113,--
                                  '0' after 104160 ns * 114,--
                                  '1' after 104160 ns * 115,--
                                  '1' after 104160 ns * 116,--
                                  '1' after 104160 ns * 117,--
                                  '0' after 104160 ns * 118,
                                  '1' after 104160 ns * 119,--14
                                  '0' after 104160 ns * 120,--
                                  '1' after 104160 ns * 121,--
                                  '1' after 104160 ns * 122,--
                                  '1' after 104160 ns * 123,--
                                  '0' after 104160 ns * 124,--
                                  '0' after 104160 ns * 125,--
                                  '0' after 104160 ns * 126,-- 
                                  '0' after 104160 ns * 127,
                                  '1' after 104160 ns * 128,--15
                                  '0' after 104160 ns * 129,--
                                  '0' after 104160 ns * 130,--
                                  '1' after 104160 ns * 131,--
                                  '0' after 104160 ns * 132,--
                                  '0' after 104160 ns * 133,--
                                  '0' after 104160 ns * 134,--
                                  '0' after 104160 ns * 135,-- 
                                  '0' after 104160 ns * 136,
                                  '1' after 104160 ns * 137,--16
                                  '0' after 104160 ns * 138,--
                                  '0' after 104160 ns * 139,--
                                  '1' after 104160 ns * 140,--
                                  '1' after 104160 ns * 141,--
                                  '0' after 104160 ns * 142,--
                                  '1' after 104160 ns * 143,--
                                  '0' after 104160 ns * 144,-- 
                                  '0' after 104160 ns * 145,
                                  '1' after 104160 ns * 146,--17
                                  '0' after 104160 ns * 147,--
                                  '0' after 104160 ns * 148,--
                                  '0' after 104160 ns * 149,--
                                  '1' after 104160 ns * 150,--
                                  '0' after 104160 ns * 151,--
                                  '1' after 104160 ns * 152,--
                                  '0' after 104160 ns * 153,-- 
                                  '0' after 104160 ns * 154,
                                  '1' after 104160 ns * 155,--18
                                  '0' after 104160 ns * 156,--
                                  '0' after 104160 ns * 157,--
                                  '1' after 104160 ns * 158,--
                                  '1' after 104160 ns * 159,--
                                  '0' after 104160 ns * 160,--
                                  '0' after 104160 ns * 161,--
                                  '0' after 104160 ns * 162,-- 
                                  '0' after 104160 ns * 163,
                                  '1' after 104160 ns * 164,--19
                                  '0' after 104160 ns * 165,--
                                  '0' after 104160 ns * 166,--
                                  '1' after 104160 ns * 167,--
                                  '1' after 104160 ns * 168,--
                                  '1' after 104160 ns * 169,--
                                  '0' after 104160 ns * 170,--
                                  '0' after 104160 ns * 171,-- 
                                  '0' after 104160 ns * 172,
                                  '1' after 104160 ns * 173,--20
                                  '0' after 104160 ns * 174,--
                                  '0' after 104160 ns * 175,--
                                  '0' after 104160 ns * 176,--
                                  '1' after 104160 ns * 177,--
                                  '0' after 104160 ns * 178,--
                                  '0' after 104160 ns * 179,--
                                  '1' after 104160 ns * 180,-- 
                                  '0' after 104160 ns * 181,
                                  '1' after 104160 ns * 182,--21
                                  '0' after 104160 ns * 183,--
                                  '0' after 104160 ns * 184,--
                                  '1' after 104160 ns * 185,--
                                  '1' after 104160 ns * 186,--
                                  '0' after 104160 ns * 187,--
                                  '0' after 104160 ns * 188,--
                                  '0' after 104160 ns * 189,-- 
                                  '0' after 104160 ns * 190,
                                  '1' after 104160 ns * 191,--22
                                  '0' after 104160 ns * 192,--
                                  '1' after 104160 ns * 193,--
                                  '0' after 104160 ns * 194,--
                                  '1' after 104160 ns * 195,--
                                  '0' after 104160 ns * 196,--
                                  '0' after 104160 ns * 197,--
                                  '0' after 104160 ns * 198,-- 
                                  '0' after 104160 ns * 199,
                                  '1' after 104160 ns * 200,--23
                                  '0' after 104160 ns * 201,--
                                  '0' after 104160 ns * 202,--
                                  '1' after 104160 ns * 203,--
                                  '0' after 104160 ns * 204,--
                                  '0' after 104160 ns * 205,--
                                  '0' after 104160 ns * 206,--
                                  '0' after 104160 ns * 207,-- 
                                  '0' after 104160 ns * 208,
                                  '0' after 104160 ns * 209,--24
                                  '0' after 104160 ns * 210,--
                                  '0' after 104160 ns * 211,--
                                  '1' after 104160 ns * 212,--
                                  '1' after 104160 ns * 213,--
                                  '1' after 104160 ns * 214,--
                                  '0' after 104160 ns * 215,--
                                  '0' after 104160 ns * 216,-- 
                                  '0' after 104160 ns * 217,
                                  '1' after 104160 ns * 218,--25
                                  '0' after 104160 ns * 219,--
                                  '1' after 104160 ns * 220,--
                                  '1' after 104160 ns * 221,--
                                  '1' after 104160 ns * 222,--
                                  '0' after 104160 ns * 223,--
                                  '0' after 104160 ns * 224,--
                                  '0' after 104160 ns * 225,--
                                  '1' after 104160 ns * 226;-- end bit



        tb_RST <= '1',
                  --'1' after 250 ns,
                  '0' after 13 ns;

        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;

end Behavioral;
