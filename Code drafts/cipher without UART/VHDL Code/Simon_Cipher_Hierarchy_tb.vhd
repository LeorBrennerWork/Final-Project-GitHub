library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity simon_cipher_hierarchy_tb is
end simon_cipher_hierarchy_tb;

architecture simon_cipher_hierarchy_tb_arc of simon_cipher_hierarchy_tb is

    component simon_cipher_hierarchy
        port 
            (
            CLK: in std_logic; 
            RST: in std_logic;
            PLNTXT: in std_logic_vector(31 downto 0);
            LOAD_PLNTXT: in std_logic;
            KEY: in std_logic_vector(63 downto 0);
            LOAD_KEY: in std_logic;
            CPHRTXT: out std_logic_vector(31 downto 0)
            );
    end component;

    signal tb_CLK : std_logic := '0';
    signal tb_RST : std_logic := '0';
    signal tb_PLNTXT, tb_NEW_PLNTXT, tb_CPHRTXT : std_logic_vector(31 downto 0);
    signal tb_KEY, tb_NEW_KEY : std_logic_vector(63 downto 0);
    signal tb_LOAD_PLNTXT, tb_LOAD_KEY : std_logic;

    begin
        DUT : simon_cipher_hierarchy
        port map (
            CLK => tb_CLK, 
            RST => tb_RST,
            PLNTXT => tb_PLNTXT,
            LOAD_PLNTXT => tb_LOAD_PLNTXT,
            KEY => tb_KEY,
            LOAD_KEY => tb_LOAD_KEY,
            CPHRTXT => tb_CPHRTXT
        );
        tb_RST <= '0',
                  '1' after 2 ns,
                  '0' after 7 ns,
                  '1' after 500 ns,
                  '0' after 600 ns,
                  '1' after 1145 ns,
                  '0' after 1155 ns, 
                  '1' after 1800 ns,
                  '0' after 1830 ns;
                     
        tb_KEY <= x"1918111009080100",
                  x"1234567890abcdef" after 3150 ns,
                  x"4527844325eabced" after 3300 ns;
        tb_LOAD_KEY <= '1',
                       '0' after 50 ns,
                       '1' after 600 ns,
                       '0' after 610 ns,
                       '1' after 1155 ns,
                       '0' after 1165 ns,
                       '1' after 1825 ns,
                       '0' after 1850 ns,
                       '1' after 3200 ns;

        tb_PLNTXT <= x"65656877",
                     x"68656c6c" after 3150 ns,
                     x"62726f74" after 3300 ns;
        tb_LOAD_PLNTXT <= '1',
                          '0' after 50 ns,
                          '1' after 600 ns,
                          '0' after 610 ns,
                          '1' after 1155 ns,
                          '0' after 1165 ns,
                          '1' after 1825 ns,
                          '0' after 1850 ns,
                          '1' after 3200 ns;        
        clock : process
        begin
           wait for 5 ns;
           tb_CLK <= not(tb_CLK);
        end process;


end simon_cipher_hierarchy_tb_arc;
