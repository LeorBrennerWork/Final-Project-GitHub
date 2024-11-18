library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std_unsigned.all;
package key_vector_pkg is
    type key_vector is array (0 to 31) of std_logic_vector(15 downto 0);
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std_unsigned.all;
use work.key_vector_pkg.all;

entity key_expansion is
    port 
        (
        CLK: in std_logic; 
        RST: in std_logic;
        KEY: in std_logic_vector(63 downto 0);
        KEY_SCHDL: out key_vector
        );
end key_expansion;

architecture key_expansion_arc of key_expansion is
    --type key_vector is array (0 to 31) of std_logic_vector(15 downto 0);
    signal new_process : std_logic;
    signal key_schedule : key_vector;
    signal const : std_logic_vector(15 downto 0) := "1111111111111100";
    signal z_const : std_logic_vector(31 downto 0) := "10110011100001101010010001011111";
    signal SR3 : key_vector;
    signal SR3_tmp : key_vector;
    signal SR4 : key_vector;
    signal key_XOR1 : key_vector;
    signal key_XOR2 : key_vector;
    signal key_XOR3 : key_vector;
    signal key_z : key_vector;
    signal sCLK : std_logic := '0';
    begin
    clock : process 
        begin
            wait for 50 ps;
            sCLK <= not(sCLK);
    end process;

    key_schedule_create : process 
        begin
            --l_key_schedule: for i in 4 to 32 loop
            --end loop l_key_schedule;
            wait until rising_edge(sCLK);
            --iteration 1 of 32
            key_schedule(0) <= KEY(15 downto 0);

            --iteration 2 of 32
            key_schedule(1) <= KEY(31 downto 16);

            --iteration 3 of 32
            key_schedule(2) <= KEY(47 downto 32);

            --iteration 4 of 32
            key_schedule(3) <= KEY(63 downto 48);

            --iteration 5 of 32 
            SR3(0) <= rotate_right(key_schedule(3), 3);
            SR3_tmp(0) <= SR3(0) xor key_schedule(1);
            SR4(0) <= ROTATE_RIGHT(SR3_tmp(0), 1);
            key_XOR1(0) <= SR3_tmp(0) xor SR4(0);
            key_XOR2(0) <= key_schedule(0) xor key_XOR1(0);
            key_XOR3(0) <= const xor key_XOR2(0);
            key_z(0) <= ("000000000000000" & z_const(0));
            key_schedule(4) <= key_z(0) xor key_XOR3(0) ; 

            --iteration 6 of 32 
            SR3(1) <= rotate_right(key_schedule(4), 3);
            SR3_tmp(1) <= SR3(1) xor key_schedule(2);
            SR4(1) <= ROTATE_RIGHT(SR3_tmp(1), 1);
            key_XOR1(1) <= SR3_tmp(1) xor SR4(1);
            key_XOR2(1) <= key_schedule(1) xor key_XOR1(1);
            key_XOR3(1) <= const xor key_XOR2(1);
            key_z(1) <= ("000000000000000" & z_const(1));
            key_schedule(5) <= key_z(1) xor key_XOR3(1);

            --iteration 7 of 32 
            SR3(2) <= rotate_right(key_schedule(5), 3);
            SR3_tmp(2) <= SR3(2) xor key_schedule(3);
            SR4(2) <= ROTATE_RIGHT(SR3_tmp(2), 1);
            key_XOR1(2) <= SR3_tmp(2) xor SR4(2);
            key_XOR2(2) <= key_schedule(2) xor key_XOR1(2);
            key_XOR3(2) <= const xor key_XOR2(2);
            key_z(2) <= ("000000000000000" & z_const(2));
            key_schedule(6) <= key_z(2) xor key_XOR3(2);

            --iteration 8 of 32 
            SR3(3) <= rotate_right(key_schedule(6), 3);
            SR3_tmp(3) <= SR3(3) xor key_schedule(4);
            SR4(3) <= ROTATE_RIGHT(SR3_tmp(3), 1);
            key_XOR1(3) <= SR3_tmp(3) xor SR4(3);
            key_XOR2(3) <= key_schedule(3) xor key_XOR1(3);
            key_XOR3(3) <= const xor key_XOR2(3);
            key_z(3) <= ("000000000000000" & z_const(3));
            key_schedule(7) <= key_z(3) xor key_XOR3(3);

            --iteration 9 of 32 
            SR3(4) <= rotate_right(key_schedule(7), 3);
            SR3_tmp(4) <= SR3(4) xor key_schedule(5);
            SR4(4) <= ROTATE_RIGHT(SR3_tmp(4), 1);
            key_XOR1(4) <= SR3_tmp(4) xor SR4(4);
            key_XOR2(4) <= key_schedule(4) xor key_XOR1(4);
            key_XOR3(4) <= const xor key_XOR2(4);
            key_z(4) <= ("000000000000000" & z_const(4));
            key_schedule(8) <= key_z(4) xor key_XOR3(4);

            --iteration 10 of 32 
            SR3(5) <= rotate_right(key_schedule(8), 3);
            SR3_tmp(5) <= SR3(5) xor key_schedule(6);
            SR4(5) <= ROTATE_RIGHT(SR3_tmp(5), 1);
            key_XOR1(5) <= SR3_tmp(5) xor SR4(5);
            key_XOR2(5) <= key_schedule(5) xor key_XOR1(5);
            key_XOR3(5) <= const xor key_XOR2(5);
            key_z(5) <= ("000000000000000" & z_const(5));
            key_schedule(9) <= key_z(5) xor key_XOR3(5);

            --iteration 11 of 32 
            SR3(6) <= rotate_right(key_schedule(9), 3);
            SR3_tmp(6) <= SR3(6) xor key_schedule(7);
            SR4(6) <= ROTATE_RIGHT(SR3_tmp(6), 1);
            key_XOR1(6) <= SR3_tmp(6) xor SR4(6);
            key_XOR2(6) <= key_schedule(6) xor key_XOR1(6);
            key_XOR3(6) <= const xor key_XOR2(6);
            key_z(6) <= ("000000000000000" & z_const(6));
            key_schedule(10) <= key_z(6) xor key_XOR3(6);

            --iteration 12 of 32 
            SR3(7) <= rotate_right(key_schedule(10), 3);
            SR3_tmp(7) <= SR3(7) xor key_schedule(8);
            SR4(7) <= ROTATE_RIGHT(SR3_tmp(7), 1);
            key_XOR1(7) <= SR3_tmp(7) xor SR4(7);
            key_XOR2(7) <= key_schedule(7) xor key_XOR1(7);
            key_XOR3(7) <= const xor key_XOR2(7);
            key_z(7) <= ("000000000000000" & z_const(7));
            key_schedule(11) <= key_z(7) xor key_XOR3(7);

            --iteration 13 of 32 
            SR3(8) <= rotate_right(key_schedule(11), 3);
            SR3_tmp(8) <= SR3(8) xor key_schedule(9);
            SR4(8) <= ROTATE_RIGHT(SR3_tmp(8), 1);
            key_XOR1(8) <= SR3_tmp(8) xor SR4(8);
            key_XOR2(8) <= key_schedule(8) xor key_XOR1(8);
            key_XOR3(8) <= const xor key_XOR2(8);
            key_z(8) <= ("000000000000000" & z_const(8));
            key_schedule(12) <= key_z(8) xor key_XOR3(8);

            --iteration 14 of 32 
            SR3(9) <= rotate_right(key_schedule(12), 3);
            SR3_tmp(9) <= SR3(9) xor key_schedule(10);
            SR4(9) <= ROTATE_RIGHT(SR3_tmp(9), 1);
            key_XOR1(9) <= SR3_tmp(9) xor SR4(9);
            key_XOR2(9) <= key_schedule(9) xor key_XOR1(9);
            key_XOR3(9) <= const xor key_XOR2(9);
            key_z(9) <= ("000000000000000" & z_const(9));
            key_schedule(13) <= key_z(9) xor key_XOR3(9);

            --iteration 15 of 32 
            SR3(10) <= rotate_right(key_schedule(13), 3);
            SR3_tmp(10) <= SR3(10) xor key_schedule(11);
            SR4(10) <= ROTATE_RIGHT(SR3_tmp(10), 1);
            key_XOR1(10) <= SR3_tmp(10) xor SR4(10);
            key_XOR2(10) <= key_schedule(10) xor key_XOR1(10);
            key_XOR3(10) <= const xor key_XOR2(10);
            key_z(10) <= ("000000000000000" & z_const(10));
            key_schedule(14) <= key_z(10) xor key_XOR3(10);

            --iteration 16 of 32 
            SR3(11) <= rotate_right(key_schedule(14), 3);
            SR3_tmp(11) <= SR3(11) xor key_schedule(12);
            SR4(11) <= ROTATE_RIGHT(SR3_tmp(11), 1);
            key_XOR1(11) <= SR3_tmp(11) xor SR4(11);
            key_XOR2(11) <= key_schedule(11) xor key_XOR1(11);
            key_XOR3(11) <= const xor key_XOR2(11);
            key_z(11) <= ("000000000000000" & z_const(11));
            key_schedule(15) <= key_z(11) xor key_XOR3(11);

            --iteration 17 of 32 
            SR3(12) <= rotate_right(key_schedule(15), 3);
            SR3_tmp(12) <= SR3(12) xor key_schedule(13);
            SR4(12) <= ROTATE_RIGHT(SR3_tmp(12), 1);
            key_XOR1(12) <= SR3_tmp(12) xor SR4(12);
            key_XOR2(12) <= key_schedule(12) xor key_XOR1(12);
            key_XOR3(12) <= const xor key_XOR2(12);
            key_z(12) <= ("000000000000000" & z_const(12));
            key_schedule(16) <= key_z(12) xor key_XOR3(12);

            --iteration 18 of 32 
            SR3(13) <= rotate_right(key_schedule(16), 3);
            SR3_tmp(13) <= SR3(13) xor key_schedule(14);
            SR4(13) <= ROTATE_RIGHT(SR3_tmp(13), 1);
            key_XOR1(13) <= SR3_tmp(13) xor SR4(13);
            key_XOR2(13) <= key_schedule(13) xor key_XOR1(13);
            key_XOR3(13) <= const xor key_XOR2(13);
            key_z(13) <= ("000000000000000" & z_const(13));
            key_schedule(17) <= key_z(13) xor key_XOR3(13);

            --iteration 19 of 32 
            SR3(14) <= rotate_right(key_schedule(17), 3);
            SR3_tmp(14) <= SR3(14) xor key_schedule(15);
            SR4(14) <= ROTATE_RIGHT(SR3_tmp(14), 1);
            key_XOR1(14) <= SR3_tmp(14) xor SR4(14);
            key_XOR2(14) <= key_schedule(14) xor key_XOR1(14);
            key_XOR3(14) <= const xor key_XOR2(14);
            key_z(14) <= ("000000000000000" & z_const(14));
            key_schedule(18) <= key_z(14) xor key_XOR3(14);

            --iteration 20 of 32 
            SR3(15) <= rotate_right(key_schedule(18), 3);
            SR3_tmp(15) <= SR3(15) xor key_schedule(16);
            SR4(15) <= ROTATE_RIGHT(SR3_tmp(15), 1);
            key_XOR1(15) <= SR3_tmp(15) xor SR4(15);
            key_XOR2(15) <= key_schedule(15) xor key_XOR1(15);
            key_XOR3(15) <= const xor key_XOR2(15);
            key_z(15) <= ("000000000000000" & z_const(15));
            key_schedule(19) <= key_z(15) xor key_XOR3(15);

            --iteration 21 of 32 
            SR3(16) <= rotate_right(key_schedule(19), 3);
            SR3_tmp(16) <= SR3(16) xor key_schedule(17);
            SR4(16) <= ROTATE_RIGHT(SR3_tmp(16), 1);
            key_XOR1(16) <= SR3_tmp(16) xor SR4(16);
            key_XOR2(16) <= key_schedule(16) xor key_XOR1(16);
            key_XOR3(16) <= const xor key_XOR2(16);
            key_z(16) <= ("000000000000000" & z_const(16));
            key_schedule(20) <= key_z(16) xor key_XOR3(16);

            --iteration 22 of 32 
            SR3(17) <= rotate_right(key_schedule(20), 3);
            SR3_tmp(17) <= SR3(17) xor key_schedule(18);
            SR4(17) <= ROTATE_RIGHT(SR3_tmp(17), 1);
            key_XOR1(17) <= SR3_tmp(17) xor SR4(17);
            key_XOR2(17) <= key_schedule(17) xor key_XOR1(17);
            key_XOR3(17) <= const xor key_XOR2(17);
            key_z(17) <= ("000000000000000" & z_const(17));
            key_schedule(21) <= key_z(17) xor key_XOR3(17);

            --iteration 23 of 32 
            SR3(18) <= rotate_right(key_schedule(21), 3);
            SR3_tmp(18) <= SR3(18) xor key_schedule(19);
            SR4(18) <= ROTATE_RIGHT(SR3_tmp(18), 1);
            key_XOR1(18) <= SR3_tmp(18) xor SR4(18);
            key_XOR2(18) <= key_schedule(18) xor key_XOR1(18);
            key_XOR3(18) <= const xor key_XOR2(18);
            key_z(18) <= ("000000000000000" & z_const(18));
            key_schedule(22) <= key_z(18) xor key_XOR3(18);

            --iteration 24 of 32 
            SR3(19) <= rotate_right(key_schedule(22), 3);
            SR3_tmp(19) <= SR3(19) xor key_schedule(20);
            SR4(19) <= ROTATE_RIGHT(SR3_tmp(19), 1);
            key_XOR1(19) <= SR3_tmp(19) xor SR4(19);
            key_XOR2(19) <= key_schedule(19) xor key_XOR1(19);
            key_XOR3(19) <= const xor key_XOR2(19);
            key_z(19) <= ("000000000000000" & z_const(19));
            key_schedule(23) <= key_z(19) xor key_XOR3(19);

            --iteration 25 of 32 
            SR3(20) <= rotate_right(key_schedule(23), 3);
            SR3_tmp(20) <= SR3(20) xor key_schedule(21);
            SR4(20) <= ROTATE_RIGHT(SR3_tmp(20), 1);
            key_XOR1(20) <= SR3_tmp(20) xor SR4(20);
            key_XOR2(20) <= key_schedule(20) xor key_XOR1(20);
            key_XOR3(20) <= const xor key_XOR2(20);
            key_z(20) <= ("000000000000000" & z_const(20));
            key_schedule(24) <= key_z(20) xor key_XOR3(20);

            --iteration 26 of 32 
            SR3(21) <= rotate_right(key_schedule(24), 3);
            SR3_tmp(21) <= SR3(21) xor key_schedule(22);
            SR4(21) <= ROTATE_RIGHT(SR3_tmp(21), 1);
            key_XOR1(21) <= SR3_tmp(21) xor SR4(21);
            key_XOR2(21) <= key_schedule(21) xor key_XOR1(21);
            key_XOR3(21) <= const xor key_XOR2(21);
            key_z(21) <= ("000000000000000" & z_const(21));
            key_schedule(25) <= key_z(21) xor key_XOR3(21);

            --iteration 27 of 32 
            SR3(22) <= rotate_right(key_schedule(25), 3);
            SR3_tmp(22) <= SR3(22) xor key_schedule(23);
            SR4(22) <= ROTATE_RIGHT(SR3_tmp(22), 1);
            key_XOR1(22) <= SR3_tmp(22) xor SR4(22);
            key_XOR2(22) <= key_schedule(22) xor key_XOR1(22);
            key_XOR3(22) <= const xor key_XOR2(22);
            key_z(22) <= ("000000000000000" & z_const(22));
            key_schedule(26) <= key_z(22) xor key_XOR3(22);

            --iteration 28 of 32 
            SR3(23) <= rotate_right(key_schedule(26), 3);
            SR3_tmp(23) <= SR3(23) xor key_schedule(24);
            SR4(23) <= ROTATE_RIGHT(SR3_tmp(23), 1);
            key_XOR1(23) <= SR3_tmp(23) xor SR4(23);
            key_XOR2(23) <= key_schedule(23) xor key_XOR1(23);
            key_XOR3(23) <= const xor key_XOR2(23);
            key_z(23) <= ("000000000000000" & z_const(23));
            key_schedule(27) <= key_z(23) xor key_XOR3(23);

            --iteration 29 of 32 
            SR3(24) <= rotate_right(key_schedule(27), 3);
            SR3_tmp(24) <= SR3(24) xor key_schedule(25);
            SR4(24) <= ROTATE_RIGHT(SR3_tmp(24), 1);
            key_XOR1(24) <= SR3_tmp(24) xor SR4(24);
            key_XOR2(24) <= key_schedule(24) xor key_XOR1(24);
            key_XOR3(24) <= const xor key_XOR2(24);
            key_z(24) <= ("000000000000000" & z_const(24));
            key_schedule(28) <= key_z(24) xor key_XOR3(24);

            --iteration 30 of 32 
            SR3(25) <= rotate_right(key_schedule(28), 3);
            SR3_tmp(25) <= SR3(25) xor key_schedule(26);
            SR4(25) <= ROTATE_RIGHT(SR3_tmp(25), 1);
            key_XOR1(25) <= SR3_tmp(25) xor SR4(25);
            key_XOR2(25) <= key_schedule(25) xor key_XOR1(25);
            key_XOR3(25) <= const xor key_XOR2(25);
            key_z(25) <= ("000000000000000" & z_const(25));
            key_schedule(29) <= key_z(25) xor key_XOR3(25);

            --iteration 31 of 32 
            SR3(26) <= rotate_right(key_schedule(29), 3);
            SR3_tmp(26) <= SR3(26) xor key_schedule(27);
            SR4(26) <= ROTATE_RIGHT(SR3_tmp(26), 1);
            key_XOR1(26) <= SR3_tmp(26) xor SR4(26);
            key_XOR2(26) <= key_schedule(26) xor key_XOR1(26);
            key_XOR3(26) <= const xor key_XOR2(26);
            key_z(26) <= ("000000000000000" & z_const(26));
            key_schedule(30) <= key_z(26) xor key_XOR3(26);

            --iteration 32 of 32 
            SR3(27) <= rotate_right(key_schedule(30), 3);
            SR3_tmp(27) <= SR3(27) xor key_schedule(28);
            SR4(27) <= ROTATE_RIGHT(SR3_tmp(27), 1);
            key_XOR1(27) <= SR3_tmp(27) xor SR4(27);
            key_XOR2(27) <= key_schedule(27) xor key_XOR1(27);
            key_XOR3(27) <= const xor key_XOR2(27);
            key_z(27) <= ("000000000000000" & z_const(27));
            key_schedule(31) <= key_z(27) xor key_XOR3(27);
    end process;
end key_expansion_arc;