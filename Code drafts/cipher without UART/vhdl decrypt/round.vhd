library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity round is
    port 
        (
        R_CLK: in std_logic; 
        R_RST: in std_logic;
        SUB_KEY: in std_logic_vector(15 downto 0);
        U_PLNTXT: in std_logic_vector(15 downto 0);
        L_PLNTXT: in std_logic_vector(15 downto 0);
        U_CPHRTXT: out std_logic_vector(15 downto 0);
        L_CPHRTXT: out std_logic_vector(15 downto 0)
        );
end round;

architecture round_arc of round is
    begin
        encryption_round : process
        begin
            wait until rising_edge(R_CLK);
            if (R_RST = '1') then
                L_CPHRTXT <= (others => '0');
                U_CPHRTXT <= (others => '0');
            else
                L_CPHRTXT <= U_PLNTXT;                               
                U_CPHRTXT <= ((U_PLNTXT(14 downto 0) & U_PLNTXT(15)) and (U_PLNTXT(7 downto 0) & U_PLNTXT(15 downto 8))) xor (U_PLNTXT(13 downto 0) & U_PLNTXT(15 downto 14)) xor L_PLNTXT xor SUB_KEY;
            end if;
        end process;
    
end round_arc;