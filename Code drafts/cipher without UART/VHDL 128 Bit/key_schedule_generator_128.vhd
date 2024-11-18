library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

use work.array_signal_pkg_128.all;

entity key_schedule_generator_128 is
    port 
        (
        C_CLK: in std_logic; 
        C_RST: in std_logic;
        C_KEY: in std_logic_vector(127 downto 0);
        KEY_SCHDL: out array_signal(0 to 67) --68 subkeys
        );
end key_schedule_generator_128;

architecture key_schedule_generator_128_arc of key_schedule_generator_128 is

    signal c_key_schedule_in : array_signal(0 to 66);
    signal c_key_schedule_out : array_signal(0 to 67);

    component sub_key_generator_128
        port 
            (
            S_CLK: in std_logic; 
            S_RST: in std_logic;
            Z_COUNTER: in integer range 0 to 65; --most possible rounds is 72 so we can just add bit to z_const
            SUB_KEY_i_1: in std_logic_vector(63 downto 0);
            SUB_KEY_i_m: in std_logic_vector(63 downto 0);
            --SUB_KEY_i_3: in std_logic_vector(63 downto 0); --if m=4, m=2
            SUB_KEY_i: out std_logic_vector(63 downto 0)
            );
    end component;
    --for m<4 we start with entities 2 and 3
    begin
        synch_key_round_signals : process 
        begin
            wait until rising_edge(C_CLK);
            if C_RST = '1' then
                c_key_schedule_in <= (others => (others => '0'));
            else
                c_key_schedule_in <= c_key_schedule_out(0 to 66);   
            end if; 
        end process;
        
        signal_out : process --only 2 intial subkeys
        begin
            wait until rising_edge(C_CLK);
            if C_RST = '1' then
                c_key_schedule_out(0) <= (others => '0');
                c_key_schedule_out(1) <= (others => '0');
            else --mux here
                c_key_schedule_out(0) <= C_KEY(63 downto 0);
                c_key_schedule_out(1) <= C_KEY(127 downto 64);
            end if;
        end process;

        output : process 
        begin
            wait until rising_edge(C_CLK);
            if C_RST = '1' then
                KEY_SCHDL <= (others => (others => '0')); 
            else
                KEY_SCHDL <= c_key_schedule_out; 
            end if;   
        end process;
        
        sub_key_generator_2 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 0,
            SUB_KEY_i_1 => c_key_schedule_in(1),
            SUB_KEY_i_m => c_key_schedule_in(0),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(2)
        );
        sub_key_generator_3 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 1,
            SUB_KEY_i_1 => c_key_schedule_in(2),
            SUB_KEY_i_m => c_key_schedule_in(1),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(3)
        );
        sub_key_generator_4 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 2,
            SUB_KEY_i_1 => c_key_schedule_in(3),
            SUB_KEY_i_m => c_key_schedule_in(2),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(4)
        );
        sub_key_generator_5 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 3,
            SUB_KEY_i_1 => c_key_schedule_in(4),
            SUB_KEY_i_m => c_key_schedule_in(3),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(5)
        );
        sub_key_generator_6 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 4,
            SUB_KEY_i_1 => c_key_schedule_in(5),
            SUB_KEY_i_m => c_key_schedule_in(4),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(6)
        );
        sub_key_generator_7 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 5,
            SUB_KEY_i_1 => c_key_schedule_in(6),
            SUB_KEY_i_m => c_key_schedule_in(5),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(7)
        );
        sub_key_generator_8 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 6,
            SUB_KEY_i_1 => c_key_schedule_in(7),
            SUB_KEY_i_m => c_key_schedule_in(6),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(8)
        );
        sub_key_generator_9 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 7,
            SUB_KEY_i_1 => c_key_schedule_in(8),
            SUB_KEY_i_m => c_key_schedule_in(7),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(9)
        );
        sub_key_generator_10 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 8,
            SUB_KEY_i_1 => c_key_schedule_in(9),
            SUB_KEY_i_m => c_key_schedule_in(8),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(10)
        );
        sub_key_generator_11 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 9,
            SUB_KEY_i_1 => c_key_schedule_in(10),
            SUB_KEY_i_m => c_key_schedule_in(9),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(11)
        );
        sub_key_generator_12 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 10,
            SUB_KEY_i_1 => c_key_schedule_in(11),
            SUB_KEY_i_m => c_key_schedule_in(10),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(12)
        );
        sub_key_generator_13 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 11,
            SUB_KEY_i_1 => c_key_schedule_in(12),
            SUB_KEY_i_m => c_key_schedule_in(11),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(13)
        );
        sub_key_generator_14 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 12,
            SUB_KEY_i_1 => c_key_schedule_in(13),
            SUB_KEY_i_m => c_key_schedule_in(12),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(14)
        );
        sub_key_generator_15 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 13,
            SUB_KEY_i_1 => c_key_schedule_in(14),
            SUB_KEY_i_m => c_key_schedule_in(13),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(15)
        );
        sub_key_generator_16 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 14,
            SUB_KEY_i_1 => c_key_schedule_in(15),
            SUB_KEY_i_m => c_key_schedule_in(14),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(16)
        );
        sub_key_generator_17 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 15,
            SUB_KEY_i_1 => c_key_schedule_in(16),
            SUB_KEY_i_m => c_key_schedule_in(15),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(17)
        );
        sub_key_generator_18 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 16,
            SUB_KEY_i_1 => c_key_schedule_in(17),
            SUB_KEY_i_m => c_key_schedule_in(16),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(18)
        );
        sub_key_generator_19 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 17,
            SUB_KEY_i_1 => c_key_schedule_in(18),
            SUB_KEY_i_m => c_key_schedule_in(17),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(19)
        );
        sub_key_generator_20 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 18,
            SUB_KEY_i_1 => c_key_schedule_in(19),
            SUB_KEY_i_m => c_key_schedule_in(18),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(20)
        );
        sub_key_generator_21 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 19,
            SUB_KEY_i_1 => c_key_schedule_in(20),
            SUB_KEY_i_m => c_key_schedule_in(19),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(21)
        );
        sub_key_generator_22 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 20,
            SUB_KEY_i_1 => c_key_schedule_in(21),
            SUB_KEY_i_m => c_key_schedule_in(20),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(22)
        );
        sub_key_generator_23 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 21,
            SUB_KEY_i_1 => c_key_schedule_in(22),
            SUB_KEY_i_m => c_key_schedule_in(21),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(23)
        );
        sub_key_generator_24 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 22,
            SUB_KEY_i_1 => c_key_schedule_in(23),
            SUB_KEY_i_m => c_key_schedule_in(22),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(24)
        );
        sub_key_generator_25 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 23,
            SUB_KEY_i_1 => c_key_schedule_in(24),
            SUB_KEY_i_m => c_key_schedule_in(23),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(25)
        );
        sub_key_generator_26 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 24,
            SUB_KEY_i_1 => c_key_schedule_in(25),
            SUB_KEY_i_m => c_key_schedule_in(24),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(26)
        );
        sub_key_generator_27 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 25,
            SUB_KEY_i_1 => c_key_schedule_in(26),
            SUB_KEY_i_m => c_key_schedule_in(25),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(27)
        );
        sub_key_generator_28 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 26,
            SUB_KEY_i_1 => c_key_schedule_in(27),
            SUB_KEY_i_m => c_key_schedule_in(26),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(28)
        );
        sub_key_generator_29 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 27,
            SUB_KEY_i_1 => c_key_schedule_in(28),
            SUB_KEY_i_m => c_key_schedule_in(27),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(29)
        );
        sub_key_generator_30 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 28,
            SUB_KEY_i_1 => c_key_schedule_in(29),
            SUB_KEY_i_m => c_key_schedule_in(28),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(30)
        );
        sub_key_generator_31 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 29,
            SUB_KEY_i_1 => c_key_schedule_in(30),
            SUB_KEY_i_m => c_key_schedule_in(29),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(31)
        );
        sub_key_generator_32 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 30,
            SUB_KEY_i_1 => c_key_schedule_in(31),
            SUB_KEY_i_m => c_key_schedule_in(30),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(32)
        );
        sub_key_generator_33 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 31,
            SUB_KEY_i_1 => c_key_schedule_in(32),
            SUB_KEY_i_m => c_key_schedule_in(31),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(33)
        );
        sub_key_generator_34 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 32,
            SUB_KEY_i_1 => c_key_schedule_in(33),
            SUB_KEY_i_m => c_key_schedule_in(32),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(34)
        );
        sub_key_generator_35 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 33,
            SUB_KEY_i_1 => c_key_schedule_in(34),
            SUB_KEY_i_m => c_key_schedule_in(33),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(35)
        );
        sub_key_generator_36 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 34,
            SUB_KEY_i_1 => c_key_schedule_in(35),
            SUB_KEY_i_m => c_key_schedule_in(34),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(36)
        );
        sub_key_generator_37 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 35,
            SUB_KEY_i_1 => c_key_schedule_in(36),
            SUB_KEY_i_m => c_key_schedule_in(35),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(37)
        );
        sub_key_generator_38 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 36,
            SUB_KEY_i_1 => c_key_schedule_in(37),
            SUB_KEY_i_m => c_key_schedule_in(36),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(38)
        );
        sub_key_generator_39 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 37,
            SUB_KEY_i_1 => c_key_schedule_in(38),
            SUB_KEY_i_m => c_key_schedule_in(37),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(39)
        );
        sub_key_generator_40 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 38,
            SUB_KEY_i_1 => c_key_schedule_in(39),
            SUB_KEY_i_m => c_key_schedule_in(38),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(40)
        );
        sub_key_generator_41 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 39,
            SUB_KEY_i_1 => c_key_schedule_in(40),
            SUB_KEY_i_m => c_key_schedule_in(39),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(41)
        );
        sub_key_generator_42 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 40,
            SUB_KEY_i_1 => c_key_schedule_in(41),
            SUB_KEY_i_m => c_key_schedule_in(40),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(42)
        );
        sub_key_generator_43 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 41,
            SUB_KEY_i_1 => c_key_schedule_in(42),
            SUB_KEY_i_m => c_key_schedule_in(41),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(43)
        );
        sub_key_generator_44 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 42,
            SUB_KEY_i_1 => c_key_schedule_in(43),
            SUB_KEY_i_m => c_key_schedule_in(42),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(44)
        );
        sub_key_generator_45 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 43,
            SUB_KEY_i_1 => c_key_schedule_in(44),
            SUB_KEY_i_m => c_key_schedule_in(43),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(45)
        );
        sub_key_generator_46 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 44,
            SUB_KEY_i_1 => c_key_schedule_in(45),
            SUB_KEY_i_m => c_key_schedule_in(44),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(46)
        );
        sub_key_generator_47 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 45,
            SUB_KEY_i_1 => c_key_schedule_in(46),
            SUB_KEY_i_m => c_key_schedule_in(45),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(47)
        );
        sub_key_generator_48 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 46,
            SUB_KEY_i_1 => c_key_schedule_in(47),
            SUB_KEY_i_m => c_key_schedule_in(46),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(48)
        );
        sub_key_generator_49 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 47,
            SUB_KEY_i_1 => c_key_schedule_in(48),
            SUB_KEY_i_m => c_key_schedule_in(47),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(49)
        );
        sub_key_generator_50 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 48,
            SUB_KEY_i_1 => c_key_schedule_in(49),
            SUB_KEY_i_m => c_key_schedule_in(48),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(50)
        );
        sub_key_generator_51 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 49,
            SUB_KEY_i_1 => c_key_schedule_in(50),
            SUB_KEY_i_m => c_key_schedule_in(49),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(51)
        );
        sub_key_generator_52 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 50,
            SUB_KEY_i_1 => c_key_schedule_in(51),
            SUB_KEY_i_m => c_key_schedule_in(50),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(52)
        );
        sub_key_generator_53 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 51,
            SUB_KEY_i_1 => c_key_schedule_in(52),
            SUB_KEY_i_m => c_key_schedule_in(51),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(53)
        );
        sub_key_generator_54 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 52,
            SUB_KEY_i_1 => c_key_schedule_in(53),
            SUB_KEY_i_m => c_key_schedule_in(52),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(54)
        );
        sub_key_generator_55 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 53,
            SUB_KEY_i_1 => c_key_schedule_in(54),
            SUB_KEY_i_m => c_key_schedule_in(53),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(55)
        );
        sub_key_generator_56 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 54,
            SUB_KEY_i_1 => c_key_schedule_in(55),
            SUB_KEY_i_m => c_key_schedule_in(54),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(56)
        );
        sub_key_generator_57 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 55,
            SUB_KEY_i_1 => c_key_schedule_in(56),
            SUB_KEY_i_m => c_key_schedule_in(55),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(57)
        );
        sub_key_generator_58 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 56,
            SUB_KEY_i_1 => c_key_schedule_in(57),
            SUB_KEY_i_m => c_key_schedule_in(56),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(58)
        );
        sub_key_generator_59 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 57,
            SUB_KEY_i_1 => c_key_schedule_in(58),
            SUB_KEY_i_m => c_key_schedule_in(57),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(59)
        );
        sub_key_generator_60 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 58,
            SUB_KEY_i_1 => c_key_schedule_in(59),
            SUB_KEY_i_m => c_key_schedule_in(58),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(60)
        );
        sub_key_generator_61 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 59,
            SUB_KEY_i_1 => c_key_schedule_in(60),
            SUB_KEY_i_m => c_key_schedule_in(59),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(61)
        );
        sub_key_generator_62 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 60,
            SUB_KEY_i_1 => c_key_schedule_in(61),
            SUB_KEY_i_m => c_key_schedule_in(60),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(62)
        );
        sub_key_generator_63 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 61,
            SUB_KEY_i_1 => c_key_schedule_in(62),
            SUB_KEY_i_m => c_key_schedule_in(61),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(63)
        );
        sub_key_generator_64 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 62,
            SUB_KEY_i_1 => c_key_schedule_in(63),
            SUB_KEY_i_m => c_key_schedule_in(62),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(64)
        );
        sub_key_generator_65 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 63,
            SUB_KEY_i_1 => c_key_schedule_in(64),
            SUB_KEY_i_m => c_key_schedule_in(63),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(65)
        );
        sub_key_generator_66 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 64,
            SUB_KEY_i_1 => c_key_schedule_in(65),
            SUB_KEY_i_m => c_key_schedule_in(64),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(66)
        );
        sub_key_generator_67 : sub_key_generator_128 port map (
            S_CLK => C_CLK,
            S_RST => C_RST,
            Z_COUNTER => 65,
            SUB_KEY_i_1 => c_key_schedule_in(66),
            SUB_KEY_i_m => c_key_schedule_in(65),
            --SUB_KEY_i_3 => c_key_schedule_in(1),
            SUB_KEY_i => c_key_schedule_out(67)
        );
            

end key_schedule_generator_128_arc;