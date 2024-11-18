library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity uart_top is
    port 
        ( 
        Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;

        rxd_data : in STD_LOGIC;
        txd_data : out STD_LOGIC; 

        Start_txd_top : in STD_LOGIC;

        Data_to_Cipher_top : out STD_LOGIC_VECTOR (7 downto 0);
        switches_top : in STD_LOGIC_VECTOR (7 downto 0)
        );
end uart_top;

architecture Behavioral of uart_top is


component uart_txd 
    port 
    (
    t_CLK : in STD_LOGIC;
    t_RST : in STD_LOGIC;
    switches : in STD_LOGIC_VECTOR (7 downto 0);
    Start_txd : in STD_LOGIC;
    LED : out std_logic_vector (7 downto 0);
    txd_data_out : out STD_LOGIC
    );
end component;

component uart_rxd 
    port 
    (
    r_CLK : in STD_LOGIC;
    r_Rst : in STD_LOGIC;
    rxd_data_in : in STD_LOGIC;
    Data_to_Cipher : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

begin

    rxd_do : uart_rxd port map (
        r_CLK => Clk,
        r_Rst => Rst,
        rxd_data_in => rxd_data,
        Data_to_Cipher => Data_to_Cipher_top
    );

    txd_do : uart_txd port map (
        t_CLK => Clk,
        t_Rst => Rst,
        txd_data_out => txd_data,
        Start_txd => Start_txd_top,
        switches => switches_top
    );
    
end Behavioral;