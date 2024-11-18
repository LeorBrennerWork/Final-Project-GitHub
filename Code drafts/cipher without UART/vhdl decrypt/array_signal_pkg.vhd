library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std_unsigned.all;
package array_signal_pkg is
    type array_signal is array (natural range <>) of std_logic_vector(15 downto 0);
end package;