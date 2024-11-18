library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std_unsigned.all;

entity simon_cipher is
    port 
        (
        CLK: in std_logic; 
        --RST: in std_logic;
        PLNTXT: in std_logic_vector(31 downto 0);
        KEY: in std_logic_vector(63 downto 0);
        CPHRTXT: out std_logic_vector(31 downto 0)
        );
end simon_cipher;

architecture simon_cipher_arc of simon_cipher is
    type key_vector is array (0 to 31) of std_logic_vector(15 downto 0);
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

    signal SL1 : key_vector;
    signal SL2 : key_vector;
    signal SL8 : key_vector;
    signal rnd_XOR1 : key_vector;
    signal rnd_AND : key_vector;
    signal rnd_XOR2 : key_vector;
    signal rnd_XOR3 : key_vector;
    signal upper_plntxt : key_vector;
    signal lower_plntxt : key_vector;

    signal sCLK : integer range 0 to 32 := 0;
    begin
        -- clock : process 
        -- begin
        --     wait for 50 ps;
        --     sCLK <= not(sCLK);
        -- end process;

        key_schedule_create : process 
        begin
            --l_key_schedule: for i in 4 to 32 loop
            --end loop l_key_schedule;
            wait until rising_edge(CLK);
            --iteration 1 of 32
            key_schedule(0) <= KEY(15 downto 0);

            --iteration 2 of 32
            key_schedule(1) <= KEY(31 downto 16);

            --iteration 3 of 32
            key_schedule(2) <= KEY(47 downto 32);

            --iteration 4 of 32
            key_schedule(3) <= KEY(63 downto 48);

            --iteration 5 of 32 
            -- SR3(0) <= rotate_right(key_schedule(3), 3);
            -- SR3_tmp(0) <= SR3(0) xor key_schedule(1);
            -- SR4(0) <= ROTATE_RIGHT(SR3_tmp(0), 1);
            -- key_XOR1(0) <= SR3_tmp(0) xor SR4(0);
            -- key_XOR2(0) <= key_schedule(0) xor key_XOR1(0);
            -- key_XOR3(0) <= const xor key_XOR2(0);
            -- key_z(0) <= ("000000000000000" & z_const(0));
            -- key_schedule(4) <= key_z(0) xor key_XOR3(0) ; 

            SR3(0) <= rotate_right(key_schedule(3), 3);
            SR3_tmp(0) <= SR3(0) xor key_schedule(1);
            SR4(0) <= ROTATE_RIGHT(SR3_tmp(0), 1);
            key_schedule(4) <= SR3_tmp(0) xor SR4(0) xor key_schedule(0) xor const xor ("000000000000000" & z_const(sCLK)); 
            -- key_XOR2(0) <= key_schedule(0) xor key_XOR1(0);
            -- key_XOR3(0) <= const xor key_XOR2(0);
            -- key_z(0) <= ("000000000000000" & z_const(0));
            -- key_schedule(4) <= key_z(0) xor key_XOR3(0) ;

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
        encrytion : process
        begin
            --l_encryption: for i in 0 to 32 loop
            --end loop l_encryption;
            wait until rising_edge(CLK);
            --round 0 of 32
            upper_plntxt(0) <= PLNTXT(31 downto 16);
            lower_plntxt(0) <= PLNTXT(15 downto 0);
            
            --round 1 of 32
            SL1(0) <= ROTATE_LEFT(upper_plntxt(0), 1);
            SL2(0) <= ROTATE_LEFT(upper_plntxt(0), 2);
            SL8(0) <= ROTATE_LEFT(upper_plntxt(0), 8);
            rnd_AND(0) <= (SL1(0) and SL8(0)) xor SL2(0) xor lower_plntxt(0) xor key_schedule(0);
            -- rnd_XOR1(0) <= rnd_AND(0) xor SL2(0);
            -- rnd_XOR2(0) <= rnd_XOR1(0) xor lower_plntxt(0);
            -- rnd_XOR3(0) <= rnd_XOR2(0) xor key_schedule(0);
            lower_plntxt(1) <= upper_plntxt(0);
            upper_plntxt(1) <= rnd_AND(0);

            --round 2 of 32
            SL1(1) <= ROTATE_LEFT(upper_plntxt(1), 1);
            SL2(1) <= ROTATE_LEFT(upper_plntxt(1), 2);
            SL8(1) <= ROTATE_LEFT(upper_plntxt(1), 8);
            rnd_AND(1) <= SL1(1) and SL8(1);
            rnd_XOR1(1) <= rnd_AND(1) xor SL2(1);
            rnd_XOR2(1) <= rnd_XOR1(1) xor lower_plntxt(1);
            rnd_XOR3(1) <= rnd_XOR2(1) xor key_schedule(1);
            lower_plntxt(2) <= upper_plntxt(1);
            upper_plntxt(2) <= rnd_XOR3(1);

            --round 3 of 32
            SL1(2) <= ROTATE_LEFT(upper_plntxt(2), 1);
            SL2(2) <= ROTATE_LEFT(upper_plntxt(2), 2);
            SL8(2) <= ROTATE_LEFT(upper_plntxt(2), 8);
            rnd_AND(2) <= SL1(2) and SL8(2);
            rnd_XOR1(2) <= rnd_AND(2) xor SL2(2);
            rnd_XOR2(2) <= rnd_XOR1(2) xor lower_plntxt(2);
            rnd_XOR3(2) <= rnd_XOR2(2) xor key_schedule(2);
            lower_plntxt(3) <= upper_plntxt(2);
            upper_plntxt(3) <= rnd_XOR3(2);

            --round 4 of 32
            SL1(3) <= ROTATE_LEFT(upper_plntxt(3), 1);
            SL2(3) <= ROTATE_LEFT(upper_plntxt(3), 2);
            SL8(3) <= ROTATE_LEFT(upper_plntxt(3), 8);
            rnd_AND(3) <= SL1(3) and SL8(3);
            rnd_XOR1(3) <= rnd_AND(3) xor SL2(3);
            rnd_XOR2(3) <= rnd_XOR1(3) xor lower_plntxt(3);
            rnd_XOR3(3) <= rnd_XOR2(3) xor key_schedule(3);
            lower_plntxt(4) <= upper_plntxt(3);
            upper_plntxt(4) <= rnd_XOR3(3);

            --round 5 of 32
            SL1(4) <= ROTATE_LEFT(upper_plntxt(4), 1);
            SL2(4) <= ROTATE_LEFT(upper_plntxt(4), 2);
            SL8(4) <= ROTATE_LEFT(upper_plntxt(4), 8);
            rnd_AND(4) <= SL1(4) and SL8(4);
            rnd_XOR1(4) <= rnd_AND(4) xor SL2(4);
            rnd_XOR2(4) <= rnd_XOR1(4) xor lower_plntxt(4);
            rnd_XOR3(4) <= rnd_XOR2(4) xor key_schedule(4);
            lower_plntxt(5) <= upper_plntxt(4);
            upper_plntxt(5) <= rnd_XOR3(4);

            --round 6 of 32
            SL1(5) <= ROTATE_LEFT(upper_plntxt(5), 1);
            SL2(5) <= ROTATE_LEFT(upper_plntxt(5), 2);
            SL8(5) <= ROTATE_LEFT(upper_plntxt(5), 8);
            rnd_AND(5) <= SL1(5) and SL8(5);
            rnd_XOR1(5) <= rnd_AND(5) xor SL2(5);
            rnd_XOR2(5) <= rnd_XOR1(5) xor lower_plntxt(5);
            rnd_XOR3(5) <= rnd_XOR2(5) xor key_schedule(5);
            lower_plntxt(6) <= upper_plntxt(5);
            upper_plntxt(6) <= rnd_XOR3(5);

            --round 7 of 32
            SL1(6) <= ROTATE_LEFT(upper_plntxt(6), 1);
            SL2(6) <= ROTATE_LEFT(upper_plntxt(6), 2);
            SL8(6) <= ROTATE_LEFT(upper_plntxt(6), 8);
            rnd_AND(6) <= SL1(6) and SL8(6);
            rnd_XOR1(6) <= rnd_AND(6) xor SL2(6);
            rnd_XOR2(6) <= rnd_XOR1(6) xor lower_plntxt(6);
            rnd_XOR3(6) <= rnd_XOR2(6) xor key_schedule(6);
            lower_plntxt(7) <= upper_plntxt(6);
            upper_plntxt(7) <= rnd_XOR3(6);

            --round 8 of 32
            SL1(7) <= ROTATE_LEFT(upper_plntxt(7), 1);
            SL2(7) <= ROTATE_LEFT(upper_plntxt(7), 2);
            SL8(7) <= ROTATE_LEFT(upper_plntxt(7), 8);
            rnd_AND(7) <= SL1(7) and SL8(7);
            rnd_XOR1(7) <= rnd_AND(7) xor SL2(7);
            rnd_XOR2(7) <= rnd_XOR1(7) xor lower_plntxt(7);
            rnd_XOR3(7) <= rnd_XOR2(7) xor key_schedule(7);
            lower_plntxt(8) <= upper_plntxt(7);
            upper_plntxt(8) <= rnd_XOR3(7);

            --round 9 of 32
            SL1(8) <= ROTATE_LEFT(upper_plntxt(8), 1);
            SL2(8) <= ROTATE_LEFT(upper_plntxt(8), 2);
            SL8(8) <= ROTATE_LEFT(upper_plntxt(8), 8);
            rnd_AND(8) <= SL1(8) and SL8(8);
            rnd_XOR1(8) <= rnd_AND(8) xor SL2(8);
            rnd_XOR2(8) <= rnd_XOR1(8) xor lower_plntxt(8);
            rnd_XOR3(8) <= rnd_XOR2(8) xor key_schedule(8);
            lower_plntxt(9) <= upper_plntxt(8);
            upper_plntxt(9) <= rnd_XOR3(8);

            --round 10 of 32
            SL1(9) <= ROTATE_LEFT(upper_plntxt(9), 1);
            SL2(9) <= ROTATE_LEFT(upper_plntxt(9), 2);
            SL8(9) <= ROTATE_LEFT(upper_plntxt(9), 8);
            rnd_AND(9) <= SL1(9) and SL8(9);
            rnd_XOR1(9) <= rnd_AND(9) xor SL2(9);
            rnd_XOR2(9) <= rnd_XOR1(9) xor lower_plntxt(9);
            rnd_XOR3(9) <= rnd_XOR2(9) xor key_schedule(9);
            lower_plntxt(10) <= upper_plntxt(9);
            upper_plntxt(10) <= rnd_XOR3(9);

            --round 11 of 32
            SL1(10) <= ROTATE_LEFT(upper_plntxt(10), 1);
            SL2(10) <= ROTATE_LEFT(upper_plntxt(10), 2);
            SL8(10) <= ROTATE_LEFT(upper_plntxt(10), 8);
            rnd_AND(10) <= SL1(10) and SL8(10);
            rnd_XOR1(10) <= rnd_AND(10) xor SL2(10);
            rnd_XOR2(10) <= rnd_XOR1(10) xor lower_plntxt(10);
            rnd_XOR3(10) <= rnd_XOR2(10) xor key_schedule(10);
            lower_plntxt(11) <= upper_plntxt(10);
            upper_plntxt(11) <= rnd_XOR3(10);

            --round 12 of 32
            SL1(11) <= ROTATE_LEFT(upper_plntxt(11), 1);
            SL2(11) <= ROTATE_LEFT(upper_plntxt(11), 2);
            SL8(11) <= ROTATE_LEFT(upper_plntxt(11), 8);
            rnd_AND(11) <= SL1(11) and SL8(11);
            rnd_XOR1(11) <= rnd_AND(11) xor SL2(11);
            rnd_XOR2(11) <= rnd_XOR1(11) xor lower_plntxt(11);
            rnd_XOR3(11) <= rnd_XOR2(11) xor key_schedule(11);
            lower_plntxt(12) <= upper_plntxt(11);
            upper_plntxt(12) <= rnd_XOR3(11);

            --round 13 of 32
            SL1(12) <= ROTATE_LEFT(upper_plntxt(12), 1);
            SL2(12) <= ROTATE_LEFT(upper_plntxt(12), 2);
            SL8(12) <= ROTATE_LEFT(upper_plntxt(12), 8);
            rnd_AND(12) <= SL1(12) and SL8(12);
            rnd_XOR1(12) <= rnd_AND(12) xor SL2(12);
            rnd_XOR2(12) <= rnd_XOR1(12) xor lower_plntxt(12);
            rnd_XOR3(12) <= rnd_XOR2(12) xor key_schedule(12);
            lower_plntxt(13) <= upper_plntxt(12);
            upper_plntxt(13) <= rnd_XOR3(12);

            --round 14 of 32
            SL1(13) <= ROTATE_LEFT(upper_plntxt(13), 1);
            SL2(13) <= ROTATE_LEFT(upper_plntxt(13), 2);
            SL8(13) <= ROTATE_LEFT(upper_plntxt(13), 8);
            rnd_AND(13) <= SL1(13) and SL8(13);
            rnd_XOR1(13) <= rnd_AND(13) xor SL2(13);
            rnd_XOR2(13) <= rnd_XOR1(13) xor lower_plntxt(13);
            rnd_XOR3(13) <= rnd_XOR2(13) xor key_schedule(13);
            lower_plntxt(14) <= upper_plntxt(13);
            upper_plntxt(14) <= rnd_XOR3(13);

            --round 15 of 32
            SL1(14) <= ROTATE_LEFT(upper_plntxt(14), 1);
            SL2(14) <= ROTATE_LEFT(upper_plntxt(14), 2);
            SL8(14) <= ROTATE_LEFT(upper_plntxt(14), 8);
            rnd_AND(14) <= SL1(14) and SL8(14);
            rnd_XOR1(14) <= rnd_AND(14) xor SL2(14);
            rnd_XOR2(14) <= rnd_XOR1(14) xor lower_plntxt(14);
            rnd_XOR3(14) <= rnd_XOR2(14) xor key_schedule(14);
            lower_plntxt(15) <= upper_plntxt(14);
            upper_plntxt(15) <= rnd_XOR3(14);

            --round 16 of 32
            SL1(15) <= ROTATE_LEFT(upper_plntxt(15), 1);
            SL2(15) <= ROTATE_LEFT(upper_plntxt(15), 2);
            SL8(15) <= ROTATE_LEFT(upper_plntxt(15), 8);
            rnd_AND(15) <= SL1(15) and SL8(15);
            rnd_XOR1(15) <= rnd_AND(15) xor SL2(15);
            rnd_XOR2(15) <= rnd_XOR1(15) xor lower_plntxt(15);
            rnd_XOR3(15) <= rnd_XOR2(15) xor key_schedule(15);
            lower_plntxt(16) <= upper_plntxt(15);
            upper_plntxt(16) <= rnd_XOR3(15);

            --round 17 of 32
            SL1(16) <= ROTATE_LEFT(upper_plntxt(16), 1);
            SL2(16) <= ROTATE_LEFT(upper_plntxt(16), 2);
            SL8(16) <= ROTATE_LEFT(upper_plntxt(16), 8);
            rnd_AND(16) <= SL1(16) and SL8(16);
            rnd_XOR1(16) <= rnd_AND(16) xor SL2(16);
            rnd_XOR2(16) <= rnd_XOR1(16) xor lower_plntxt(16);
            rnd_XOR3(16) <= rnd_XOR2(16) xor key_schedule(16);
            lower_plntxt(17) <= upper_plntxt(16);
            upper_plntxt(17) <= rnd_XOR3(16);

            --round 18 of 32
            SL1(17) <= ROTATE_LEFT(upper_plntxt(17), 1);
            SL2(17) <= ROTATE_LEFT(upper_plntxt(17), 2);
            SL8(17) <= ROTATE_LEFT(upper_plntxt(17), 8);
            rnd_AND(17) <= SL1(17) and SL8(17);
            rnd_XOR1(17) <= rnd_AND(17) xor SL2(17);
            rnd_XOR2(17) <= rnd_XOR1(17) xor lower_plntxt(17);
            rnd_XOR3(17) <= rnd_XOR2(17) xor key_schedule(17);
            lower_plntxt(18) <= upper_plntxt(17);
            upper_plntxt(18) <= rnd_XOR3(17);

            --round 19 of 32
            SL1(18) <= ROTATE_LEFT(upper_plntxt(18), 1);
            SL2(18) <= ROTATE_LEFT(upper_plntxt(18), 2);
            SL8(18) <= ROTATE_LEFT(upper_plntxt(18), 8);
            rnd_AND(18) <= SL1(18) and SL8(18);
            rnd_XOR1(18) <= rnd_AND(18) xor SL2(18);
            rnd_XOR2(18) <= rnd_XOR1(18) xor lower_plntxt(18);
            rnd_XOR3(18) <= rnd_XOR2(18) xor key_schedule(18);
            lower_plntxt(19) <= upper_plntxt(18);
            upper_plntxt(19) <= rnd_XOR3(18);

            --round 20 of 32
            SL1(19) <= ROTATE_LEFT(upper_plntxt(19), 1);
            SL2(19) <= ROTATE_LEFT(upper_plntxt(19), 2);
            SL8(19) <= ROTATE_LEFT(upper_plntxt(19), 8);
            rnd_AND(19) <= SL1(19) and SL8(19);
            rnd_XOR1(19) <= rnd_AND(19) xor SL2(19);
            rnd_XOR2(19) <= rnd_XOR1(19) xor lower_plntxt(19);
            rnd_XOR3(19) <= rnd_XOR2(19) xor key_schedule(19);
            lower_plntxt(20) <= upper_plntxt(19);
            upper_plntxt(20) <= rnd_XOR3(19);

            --round 21 of 32
            SL1(20) <= ROTATE_LEFT(upper_plntxt(20), 1);
            SL2(20) <= ROTATE_LEFT(upper_plntxt(20), 2);
            SL8(20) <= ROTATE_LEFT(upper_plntxt(20), 8);
            rnd_AND(20) <= SL1(20) and SL8(20);
            rnd_XOR1(20) <= rnd_AND(20) xor SL2(20);
            rnd_XOR2(20) <= rnd_XOR1(20) xor lower_plntxt(20);
            rnd_XOR3(20) <= rnd_XOR2(20) xor key_schedule(20);
            lower_plntxt(21) <= upper_plntxt(20);
            upper_plntxt(21) <= rnd_XOR3(20);

            --round 22 of 32
            SL1(21) <= ROTATE_LEFT(upper_plntxt(21), 1);
            SL2(21) <= ROTATE_LEFT(upper_plntxt(21), 2);
            SL8(21) <= ROTATE_LEFT(upper_plntxt(21), 8);
            rnd_AND(21) <= SL1(21) and SL8(21);
            rnd_XOR1(21) <= rnd_AND(21) xor SL2(21);
            rnd_XOR2(21) <= rnd_XOR1(21) xor lower_plntxt(21);
            rnd_XOR3(21) <= rnd_XOR2(21) xor key_schedule(21);
            lower_plntxt(22) <= upper_plntxt(21);
            upper_plntxt(22) <= rnd_XOR3(21);

            --round 23 of 32
            SL1(22) <= ROTATE_LEFT(upper_plntxt(22), 1);
            SL2(22) <= ROTATE_LEFT(upper_plntxt(22), 2);
            SL8(22) <= ROTATE_LEFT(upper_plntxt(22), 8);
            rnd_AND(22) <= SL1(22) and SL8(22);
            rnd_XOR1(22) <= rnd_AND(22) xor SL2(22);
            rnd_XOR2(22) <= rnd_XOR1(22) xor lower_plntxt(22);
            rnd_XOR3(22) <= rnd_XOR2(22) xor key_schedule(22);
            lower_plntxt(23) <= upper_plntxt(22);
            upper_plntxt(23) <= rnd_XOR3(22);

            --round 24 of 32
            SL1(23) <= ROTATE_LEFT(upper_plntxt(23), 1);
            SL2(23) <= ROTATE_LEFT(upper_plntxt(23), 2);
            SL8(23) <= ROTATE_LEFT(upper_plntxt(23), 8);
            rnd_AND(23) <= SL1(23) and SL8(23);
            rnd_XOR1(23) <= rnd_AND(23) xor SL2(23);
            rnd_XOR2(23) <= rnd_XOR1(23) xor lower_plntxt(23);
            rnd_XOR3(23) <= rnd_XOR2(23) xor key_schedule(23);
            lower_plntxt(24) <= upper_plntxt(23);
            upper_plntxt(24) <= rnd_XOR3(23);

            --round 25 of 32
            SL1(24) <= ROTATE_LEFT(upper_plntxt(24), 1);
            SL2(24) <= ROTATE_LEFT(upper_plntxt(24), 2);
            SL8(24) <= ROTATE_LEFT(upper_plntxt(24), 8);
            rnd_AND(24) <= SL1(24) and SL8(24);
            rnd_XOR1(24) <= rnd_AND(24) xor SL2(24);
            rnd_XOR2(24) <= rnd_XOR1(24) xor lower_plntxt(24);
            rnd_XOR3(24) <= rnd_XOR2(24) xor key_schedule(24);
            lower_plntxt(25) <= upper_plntxt(24);
            upper_plntxt(25) <= rnd_XOR3(24);

            --round 26 of 32
            SL1(25) <= ROTATE_LEFT(upper_plntxt(25), 1);
            SL2(25) <= ROTATE_LEFT(upper_plntxt(25), 2);
            SL8(25) <= ROTATE_LEFT(upper_plntxt(25), 8);
            rnd_AND(25) <= SL1(25) and SL8(25);
            rnd_XOR1(25) <= rnd_AND(25) xor SL2(25);
            rnd_XOR2(25) <= rnd_XOR1(25) xor lower_plntxt(25);
            rnd_XOR3(25) <= rnd_XOR2(25) xor key_schedule(25);
            lower_plntxt(26) <= upper_plntxt(25);
            upper_plntxt(26) <= rnd_XOR3(25);

            --round 27 of 32
            SL1(26) <= ROTATE_LEFT(upper_plntxt(26), 1);
            SL2(26) <= ROTATE_LEFT(upper_plntxt(26), 2);
            SL8(26) <= ROTATE_LEFT(upper_plntxt(26), 8);
            rnd_AND(26) <= SL1(26) and SL8(26);
            rnd_XOR1(26) <= rnd_AND(26) xor SL2(26);
            rnd_XOR2(26) <= rnd_XOR1(26) xor lower_plntxt(26);
            rnd_XOR3(26) <= rnd_XOR2(26) xor key_schedule(26);
            lower_plntxt(27) <= upper_plntxt(26);
            upper_plntxt(27) <= rnd_XOR3(26);

            --round 28 of 32
            SL1(27) <= ROTATE_LEFT(upper_plntxt(27), 1);
            SL2(27) <= ROTATE_LEFT(upper_plntxt(27), 2);
            SL8(27) <= ROTATE_LEFT(upper_plntxt(27), 8);
            rnd_AND(27) <= SL1(27) and SL8(27);
            rnd_XOR1(27) <= rnd_AND(27) xor SL2(27);
            rnd_XOR2(27) <= rnd_XOR1(27) xor lower_plntxt(27);
            rnd_XOR3(27) <= rnd_XOR2(27) xor key_schedule(27);
            lower_plntxt(28) <= upper_plntxt(27);
            upper_plntxt(28) <= rnd_XOR3(27);

            --round 29 of 32
            SL1(28) <= ROTATE_LEFT(upper_plntxt(28), 1);
            SL2(28) <= ROTATE_LEFT(upper_plntxt(28), 2);
            SL8(28) <= ROTATE_LEFT(upper_plntxt(28), 8);
            rnd_AND(28) <= SL1(28) and SL8(28);
            rnd_XOR1(28) <= rnd_AND(28) xor SL2(28);
            rnd_XOR2(28) <= rnd_XOR1(28) xor lower_plntxt(28);
            rnd_XOR3(28) <= rnd_XOR2(28) xor key_schedule(28);
            lower_plntxt(29) <= upper_plntxt(28);
            upper_plntxt(29) <= rnd_XOR3(28);

            --round 30 of 32
            SL1(29) <= ROTATE_LEFT(upper_plntxt(29), 1);
            SL2(29) <= ROTATE_LEFT(upper_plntxt(29), 2);
            SL8(29) <= ROTATE_LEFT(upper_plntxt(29), 8);
            rnd_AND(29) <= SL1(29) and SL8(29);
            rnd_XOR1(29) <= rnd_AND(29) xor SL2(29);
            rnd_XOR2(29) <= rnd_XOR1(29) xor lower_plntxt(29);
            rnd_XOR3(29) <= rnd_XOR2(29) xor key_schedule(29);
            lower_plntxt(30) <= upper_plntxt(29);
            upper_plntxt(30) <= rnd_XOR3(29);

            --round 31 of 32
            SL1(30) <= ROTATE_LEFT(upper_plntxt(30), 1);
            SL2(30) <= ROTATE_LEFT(upper_plntxt(30), 2);
            SL8(30) <= ROTATE_LEFT(upper_plntxt(30), 8);
            rnd_AND(30) <= SL1(30) and SL8(30);
            rnd_XOR1(30) <= rnd_AND(30) xor SL2(30);
            rnd_XOR2(30) <= rnd_XOR1(30) xor lower_plntxt(30);
            rnd_XOR3(30) <= rnd_XOR2(30) xor key_schedule(30);
            lower_plntxt(31) <= upper_plntxt(30);
            upper_plntxt(31) <= rnd_XOR3(30);

            --round 32 of 32
            SL1(31) <= ROTATE_LEFT(upper_plntxt(31), 1);
            SL2(31) <= ROTATE_LEFT(upper_plntxt(31), 2);
            SL8(31) <= ROTATE_LEFT(upper_plntxt(31), 8);
            rnd_AND(31) <= SL1(31) and SL8(31);
            rnd_XOR1(31) <= rnd_AND(31) xor SL2(31);
            rnd_XOR2(31) <= rnd_XOR1(31) xor lower_plntxt(31);
            rnd_XOR3(31) <= rnd_XOR2(31) xor key_schedule(31);
            CPHRTXT(15 downto 0) <= upper_plntxt(31);
            CPHRTXT(31 downto 16) <= rnd_XOR3(31);
        end process;

end simon_cipher_arc;

