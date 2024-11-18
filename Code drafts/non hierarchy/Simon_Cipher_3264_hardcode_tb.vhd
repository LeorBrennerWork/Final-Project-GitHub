library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std_unsigned.all;

entity simon_cipher_tb is
end simon_cipher_tb;

architecture simon_cipher_tb_arc of simon_cipher_tb is

    component simon_cipher
        port 
            (
            CLK: in std_logic; 
            --RST: in std_logic;
            PLNTXT: in std_logic_vector(31 downto 0);
            KEY: in std_logic_vector(63 downto 0);
            CPHRTXT: out std_logic_vector(31 downto 0)
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_PLNTXT, tb_CPHRTXT : std_logic_vector(31 downto 0);
    signal tb_KEY : std_logic_vector(63 downto 0);

    begin
        DUT : simon_cipher
        port map (
            CLK => tb_CLK, 
            PLNTXT => tb_PLNTXT,
            KEY => tb_KEY,
            CPHRTXT => tb_CPHRTXT
        );

        tb_KEY <= x"1918111009080100";
        tb_PLNTXT <= x"65656877";

        clock : process
        begin
           wait for 50 ps;
           tb_CLK <= not(tb_CLK);
        end process;


end simon_cipher_tb_arc;
