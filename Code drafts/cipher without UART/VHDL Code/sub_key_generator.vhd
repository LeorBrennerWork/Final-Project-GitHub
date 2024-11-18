library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity sub_key_generator is
    port 
        (
        S_CLK: in std_logic; 
        S_RST: in std_logic;
        Z_COUNTER: in integer range 0 to 27; --most possible rounds is 72 so we can just add bit to z_const 
        SUB_KEY_i_1: in std_logic_vector(15 downto 0);
        SUB_KEY_i_m: in std_logic_vector(15 downto 0);
        SUB_KEY_i_3: in std_logic_vector(15 downto 0); --if m=4
        SUB_KEY_i: out std_logic_vector(15 downto 0)
        );
end sub_key_generator;

architecture sub_key_generator_arc of sub_key_generator is
    constant const : std_logic_vector(15 downto 0) := "1111111111111100"; 
    constant z_const : std_logic_vector(31 downto 0) := "10110011100001101010010001011111"; 
    signal SR3 : std_logic_vector(15 downto 0);
    
    begin   
        process
        begin
            wait until rising_edge(S_CLK);
            if S_RST = '1' then
                SUB_KEY_i <= (others => '0');
                SR3 <= (others => '0');
            else
                SR3 <= (SUB_KEY_i_1(2 downto 0) & SUB_KEY_i_1(15 downto 3)) xor SUB_KEY_i_3; --if m=4 else no xor here
                SUB_KEY_i <= SR3 xor (SR3(0) & SR3(15 downto 1)) xor SUB_KEY_i_m xor const xor ("000000000000000" & z_const(Z_COUNTER)); 
            end if; 
        end process;
end sub_key_generator_arc;
