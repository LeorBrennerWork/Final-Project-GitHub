library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity sub_key_generator_128 is
    port 
        (
        S_CLK: in std_logic; 
        S_RST: in std_logic;
        Z_COUNTER: in integer range 0 to 65; --66 subkeys to generate
        SUB_KEY_i_1: in std_logic_vector(63 downto 0);
        SUB_KEY_i_m: in std_logic_vector(63 downto 0);
        --SUB_KEY_i_3: in std_logic_vector(63 downto 0); --if m=4, m=2 here
        SUB_KEY_i: out std_logic_vector(63 downto 0)
        );
end sub_key_generator_128;

architecture sub_key_generator_128_arc of sub_key_generator_128 is
    constant const : std_logic_vector(63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111100"; 
    constant z_const : std_logic_vector(65 downto 0) := "010111001101101001111110001000010100011001001011000000111011110101"; --66 bits for z const (add extra bits beyond 62 from the end to the beginning)
    signal SR3 : std_logic_vector(63 downto 0);
    
    begin   
        process
        begin
            wait until rising_edge(S_CLK);
            if S_RST = '1' then
                SUB_KEY_i <= (others => '0'); 
                SR3 <= (others => '0');
            else
                SR3 <= (SUB_KEY_i_1(2 downto 0) & SUB_KEY_i_1(63 downto 3)); --m=2 so no xor
                SUB_KEY_i <= SR3 xor (SR3(0) & SR3(63 downto 1)) xor SUB_KEY_i_m xor const xor ("000000000000000000000000000000000000000000000000000000000000000" & z_const(Z_COUNTER)); 
            end if; 
        end process;
end sub_key_generator_128_arc;
