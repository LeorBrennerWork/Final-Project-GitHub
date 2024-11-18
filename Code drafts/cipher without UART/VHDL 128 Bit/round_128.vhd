library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity round_128 is
    port 
        (
        R_CLK: in std_logic; 
        R_RST: in std_logic;
        SUB_KEY: in std_logic_vector(63 downto 0);
        U_PLNTXT: in std_logic_vector(63 downto 0);
        L_PLNTXT: in std_logic_vector(63 downto 0);
        U_CPHRTXT: out std_logic_vector(63 downto 0);
        L_CPHRTXT: out std_logic_vector(63 downto 0)
        );
end round_128;

architecture round_128_arc of round_128 is
    begin
        encryption_round : process
        begin
            wait until rising_edge(R_CLK);
            if (R_RST = '1') then
                L_CPHRTXT <= (others => '0');
                U_CPHRTXT <= (others => '0');
            else
                L_CPHRTXT <= U_PLNTXT;                               
                U_CPHRTXT <= ((U_PLNTXT(62 downto 0) & U_PLNTXT(63)) and (U_PLNTXT(55 downto 0) & U_PLNTXT(63 downto 56))) xor (U_PLNTXT(61 downto 0) & U_PLNTXT(63 downto 62)) xor L_PLNTXT xor SUB_KEY;
            end if;
        end process;
    
end round_128_arc;