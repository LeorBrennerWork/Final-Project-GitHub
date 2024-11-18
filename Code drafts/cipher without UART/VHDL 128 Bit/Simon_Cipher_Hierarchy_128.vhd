library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.array_signal_pkg_128.all;

entity simon_cipher_hierarchy_128 is
    port 
        (
        CLK: in std_logic; 
        RST: in std_logic;
        PLNTXT: in std_logic_vector(127 downto 0);
        LOAD_PLNTXT: in std_logic;
        KEY: in std_logic_vector(127 downto 0);
        LOAD_KEY: in std_logic;
        CPHRTXT: out std_logic_vector(127 downto 0)
        );
end simon_cipher_hierarchy_128;

architecture simon_cipher_hierarchy_128_arc of simon_cipher_hierarchy_128 is
    --create signals for component outputs
    signal key_schedule : array_signal(0 to 67);
    signal upper_plaintext : array_signal(0 to 66);
    signal lower_plaintext : array_signal(0 to 66);
    signal upper_ciphertext : array_signal(0 to 67);
    signal lower_ciphertext : array_signal(0 to 67);
    signal counter : std_logic_vector(7 downto 0);
    signal current_plaintext : std_logic_vector(127 downto 0);
    signal new_plaintext : std_logic_vector(127 downto 0);
    signal current_key : std_logic_vector(127 downto 0);
    signal new_key : std_logic_vector(127 downto 0);
    --we can make these (N downto 0) and choose N by MUX
    component key_schedule_generator_128
        port 
            (
            C_CLK: in std_logic; 
            C_RST: in std_logic;
            C_KEY: in std_logic_vector(127 downto 0);
            KEY_SCHDL: out array_signal(0 to 67)
            );
    end component;

    component round_128
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
    end component;
    begin

        synch_round_signals : process 
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                upper_plaintext <= (others => (others => '0'));
                lower_plaintext <= (others => (others => '0'));
            else
                upper_plaintext <= upper_ciphertext(0 to 66);
                lower_plaintext <= lower_ciphertext(0 to 66);
            end if; 
        end process;
        
        new_plntxt_in : process
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                new_plaintext <= (others => '0');
            else
                new_plaintext <= PLNTXT;
            end if;     
        end process; 

        new_key_in : process 
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                new_key <= (others => '0');
            else
                new_key <= KEY;
            end if;     
        end process;

        counter_control : process 
        begin
            wait until rising_edge(CLK);
            if RST = '1' then 
                counter <= "00000000";
            elsif (counter < "11001000") then --72 
                counter <= counter + 1;
            end if;  
            if (((LOAD_PLNTXT = '1') and (current_plaintext /= new_plaintext)) or ((current_key /= new_key) and (LOAD_KEY = '1'))) then
                counter <= "00000000";
            end if; 
        end process;
        
        load_plaintext_p : process 
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                current_plaintext <= (others => '0'); 
            elsif LOAD_PLNTXT = '1' then
                current_plaintext <= new_plaintext;
            end if;
        end process;

        load_key_p : process 
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                current_key <= (others => '0'); 
            elsif LOAD_KEY = '1' then
                current_key <= new_key; 
            end if;
        end process;

        output : process --mux here
        begin
            wait until rising_edge(CLK);
            if RST = '1' then
                CPHRTXT <= (others => '0'); 
            --elsif counter /= "11001000" then  --counter looks like 194/195 (C3) from 1st glance
                --CPHRTXT <= (others => '0'); 
            else 
                CPHRTXT <= (upper_ciphertext(67) & lower_ciphertext(67)); 
            end if;  
        end process; 

        key_schedule_create : key_schedule_generator_128 port map (
            C_CLK => CLK,
            C_RST => RST,
            C_KEY => KEY, --mux here
            KEY_SCHDL => key_schedule --out
        );
        
        
        round_1 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(0),
            U_PLNTXT => current_plaintext(127 downto 64),
            L_PLNTXT => current_plaintext(63 downto 0),
            U_CPHRTXT => upper_ciphertext(0),
            L_CPHRTXT => lower_ciphertext(0)
        );
        round_2 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(1),
            U_PLNTXT => upper_plaintext(0),
            L_PLNTXT => lower_plaintext(0),
            U_CPHRTXT => upper_ciphertext(1),
            L_CPHRTXT => lower_ciphertext(1)
        );
        round_3 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(2),
            U_PLNTXT => upper_plaintext(1),
            L_PLNTXT => lower_plaintext(1),
            U_CPHRTXT => upper_ciphertext(2),
            L_CPHRTXT => lower_ciphertext(2)
        );
        round_4 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(3),
            U_PLNTXT => upper_plaintext(2),
            L_PLNTXT => lower_plaintext(2),
            U_CPHRTXT => upper_ciphertext(3),
            L_CPHRTXT => lower_ciphertext(3)
        );
        round_5 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(4),
            U_PLNTXT => upper_plaintext(3),
            L_PLNTXT => lower_plaintext(3),
            U_CPHRTXT => upper_ciphertext(4),
            L_CPHRTXT => lower_ciphertext(4)
        );
        round_6 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(5),
            U_PLNTXT => upper_plaintext(4),
            L_PLNTXT => lower_plaintext(4),
            U_CPHRTXT => upper_ciphertext(5),
            L_CPHRTXT => lower_ciphertext(5)
        );
        round_7 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(6),
            U_PLNTXT => upper_plaintext(5),
            L_PLNTXT => lower_plaintext(5),
            U_CPHRTXT => upper_ciphertext(6),
            L_CPHRTXT => lower_ciphertext(6)
        );
        round_8 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(7),
            U_PLNTXT => upper_plaintext(6),
            L_PLNTXT => lower_plaintext(6),
            U_CPHRTXT => upper_ciphertext(7),
            L_CPHRTXT => lower_ciphertext(7)
        );
        round_9 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(8),
            U_PLNTXT => upper_plaintext(7),
            L_PLNTXT => lower_plaintext(7),
            U_CPHRTXT => upper_ciphertext(8),
            L_CPHRTXT => lower_ciphertext(8)
        );
        round_10 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(9),
            U_PLNTXT => upper_plaintext(8),
            L_PLNTXT => lower_plaintext(8),
            U_CPHRTXT => upper_ciphertext(9),
            L_CPHRTXT => lower_ciphertext(9)
        );
        round_11 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(10),
            U_PLNTXT => upper_plaintext(9),
            L_PLNTXT => lower_plaintext(9),
            U_CPHRTXT => upper_ciphertext(10),
            L_CPHRTXT => lower_ciphertext(10)
        );
        round_12 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(11),
            U_PLNTXT => upper_plaintext(10),
            L_PLNTXT => lower_plaintext(10),
            U_CPHRTXT => upper_ciphertext(11),
            L_CPHRTXT => lower_ciphertext(11)
        );
        round_13 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(12),
            U_PLNTXT => upper_plaintext(11),
            L_PLNTXT => lower_plaintext(11),
            U_CPHRTXT => upper_ciphertext(12),
            L_CPHRTXT => lower_ciphertext(12)
        );
        round_14 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(13),
            U_PLNTXT => upper_plaintext(12),
            L_PLNTXT => lower_plaintext(12),
            U_CPHRTXT => upper_ciphertext(13),
            L_CPHRTXT => lower_ciphertext(13)
        );
        round_15 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(14),
            U_PLNTXT => upper_plaintext(13),
            L_PLNTXT => lower_plaintext(13),
            U_CPHRTXT => upper_ciphertext(14),
            L_CPHRTXT => lower_ciphertext(14)
        );
        round_16 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(15),
            U_PLNTXT => upper_plaintext(14),
            L_PLNTXT => lower_plaintext(14),
            U_CPHRTXT => upper_ciphertext(15),
            L_CPHRTXT => lower_ciphertext(15)
        );
        round_17 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(16),
            U_PLNTXT => upper_plaintext(15),
            L_PLNTXT => lower_plaintext(15),
            U_CPHRTXT => upper_ciphertext(16),
            L_CPHRTXT => lower_ciphertext(16)
        );
        round_18 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(17),
            U_PLNTXT => upper_plaintext(16),
            L_PLNTXT => lower_plaintext(16),
            U_CPHRTXT => upper_ciphertext(17),
            L_CPHRTXT => lower_ciphertext(17)
        );
        round_19 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(18),
            U_PLNTXT => upper_plaintext(17),
            L_PLNTXT => lower_plaintext(17),
            U_CPHRTXT => upper_ciphertext(18),
            L_CPHRTXT => lower_ciphertext(18)
        );
        round_20 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(19),
            U_PLNTXT => upper_plaintext(18),
            L_PLNTXT => lower_plaintext(18),
            U_CPHRTXT => upper_ciphertext(19),
            L_CPHRTXT => lower_ciphertext(19)
        );
        round_21 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(20),
            U_PLNTXT => upper_plaintext(19),
            L_PLNTXT => lower_plaintext(19),
            U_CPHRTXT => upper_ciphertext(20),
            L_CPHRTXT => lower_ciphertext(20)
        );
        round_22 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(21),
            U_PLNTXT => upper_plaintext(20),
            L_PLNTXT => lower_plaintext(20),
            U_CPHRTXT => upper_ciphertext(21),
            L_CPHRTXT => lower_ciphertext(21)
        );
        round_23 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(22),
            U_PLNTXT => upper_plaintext(21),
            L_PLNTXT => lower_plaintext(21),
            U_CPHRTXT => upper_ciphertext(22),
            L_CPHRTXT => lower_ciphertext(22)
        );
        round_24 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(23),
            U_PLNTXT => upper_plaintext(22),
            L_PLNTXT => lower_plaintext(22),
            U_CPHRTXT => upper_ciphertext(23),
            L_CPHRTXT => lower_ciphertext(23)
        );
        round_25 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(24),
            U_PLNTXT => upper_plaintext(23),
            L_PLNTXT => lower_plaintext(23),
            U_CPHRTXT => upper_ciphertext(24),
            L_CPHRTXT => lower_ciphertext(24)
        );
        round_26 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(25),
            U_PLNTXT => upper_plaintext(24),
            L_PLNTXT => lower_plaintext(24),
            U_CPHRTXT => upper_ciphertext(25),
            L_CPHRTXT => lower_ciphertext(25)
        );
        round_27 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(26),
            U_PLNTXT => upper_plaintext(25),
            L_PLNTXT => lower_plaintext(25),
            U_CPHRTXT => upper_ciphertext(26),
            L_CPHRTXT => lower_ciphertext(26)
        );
        round_28 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(27),
            U_PLNTXT => upper_plaintext(26),
            L_PLNTXT => lower_plaintext(26),
            U_CPHRTXT => upper_ciphertext(27),
            L_CPHRTXT => lower_ciphertext(27)
        );
        round_29 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(28),
            U_PLNTXT => upper_plaintext(27),
            L_PLNTXT => lower_plaintext(27),
            U_CPHRTXT => upper_ciphertext(28),
            L_CPHRTXT => lower_ciphertext(28)
        );
        round_30 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(29),
            U_PLNTXT => upper_plaintext(28),
            L_PLNTXT => lower_plaintext(28),
            U_CPHRTXT => upper_ciphertext(29),
            L_CPHRTXT => lower_ciphertext(29)
        );
        round_31 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(30),
            U_PLNTXT => upper_plaintext(29),
            L_PLNTXT => lower_plaintext(29),
            U_CPHRTXT => upper_ciphertext(30),
            L_CPHRTXT => lower_ciphertext(30)
        );
        round_32 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(31),
            U_PLNTXT => upper_plaintext(30),
            L_PLNTXT => lower_plaintext(30),
            U_CPHRTXT => upper_ciphertext(31),
            L_CPHRTXT => lower_ciphertext(31)
        );
        round_33 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(32),
            U_PLNTXT => upper_plaintext(31),
            L_PLNTXT => lower_plaintext(31),
            U_CPHRTXT => upper_ciphertext(32),
            L_CPHRTXT => lower_ciphertext(32)
        );
        round_34 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(33),
            U_PLNTXT => upper_plaintext(32),
            L_PLNTXT => lower_plaintext(32),
            U_CPHRTXT => upper_ciphertext(33),
            L_CPHRTXT => lower_ciphertext(33)
        );
        round_35 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(34),
            U_PLNTXT => upper_plaintext(33),
            L_PLNTXT => lower_plaintext(33),
            U_CPHRTXT => upper_ciphertext(34),
            L_CPHRTXT => lower_ciphertext(34)
        );
        round_36 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(35),
            U_PLNTXT => upper_plaintext(34),
            L_PLNTXT => lower_plaintext(34),
            U_CPHRTXT => upper_ciphertext(35),
            L_CPHRTXT => lower_ciphertext(35)
        );
        round_37 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(36),
            U_PLNTXT => upper_plaintext(35),
            L_PLNTXT => lower_plaintext(35),
            U_CPHRTXT => upper_ciphertext(36),
            L_CPHRTXT => lower_ciphertext(36)
        );
        round_38 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(37),
            U_PLNTXT => upper_plaintext(36),
            L_PLNTXT => lower_plaintext(36),
            U_CPHRTXT => upper_ciphertext(37),
            L_CPHRTXT => lower_ciphertext(37)
        );
        round_39 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(38),
            U_PLNTXT => upper_plaintext(37),
            L_PLNTXT => lower_plaintext(37),
            U_CPHRTXT => upper_ciphertext(38),
            L_CPHRTXT => lower_ciphertext(38)
        );
        round_40 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(39),
            U_PLNTXT => upper_plaintext(38),
            L_PLNTXT => lower_plaintext(38),
            U_CPHRTXT => upper_ciphertext(39),
            L_CPHRTXT => lower_ciphertext(39)
        );
        round_41 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(40),
            U_PLNTXT => upper_plaintext(39),
            L_PLNTXT => lower_plaintext(39),
            U_CPHRTXT => upper_ciphertext(40),
            L_CPHRTXT => lower_ciphertext(40)
        );
        round_42 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(41),
            U_PLNTXT => upper_plaintext(40),
            L_PLNTXT => lower_plaintext(40),
            U_CPHRTXT => upper_ciphertext(41),
            L_CPHRTXT => lower_ciphertext(41)
        );
        round_43 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(42),
            U_PLNTXT => upper_plaintext(41),
            L_PLNTXT => lower_plaintext(41),
            U_CPHRTXT => upper_ciphertext(42),
            L_CPHRTXT => lower_ciphertext(42)
        );
        round_44 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(43),
            U_PLNTXT => upper_plaintext(42),
            L_PLNTXT => lower_plaintext(42),
            U_CPHRTXT => upper_ciphertext(43),
            L_CPHRTXT => lower_ciphertext(43)
        );
        round_45 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(44),
            U_PLNTXT => upper_plaintext(43),
            L_PLNTXT => lower_plaintext(43),
            U_CPHRTXT => upper_ciphertext(44),
            L_CPHRTXT => lower_ciphertext(44)
        );
        round_46 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(45),
            U_PLNTXT => upper_plaintext(44),
            L_PLNTXT => lower_plaintext(44),
            U_CPHRTXT => upper_ciphertext(45),
            L_CPHRTXT => lower_ciphertext(45)
        );
        round_47 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(46),
            U_PLNTXT => upper_plaintext(45),
            L_PLNTXT => lower_plaintext(45),
            U_CPHRTXT => upper_ciphertext(46),
            L_CPHRTXT => lower_ciphertext(46)
        );
        round_48 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(47),
            U_PLNTXT => upper_plaintext(46),
            L_PLNTXT => lower_plaintext(46),
            U_CPHRTXT => upper_ciphertext(47),
            L_CPHRTXT => lower_ciphertext(47)
        );
        round_49 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(48),
            U_PLNTXT => upper_plaintext(47),
            L_PLNTXT => lower_plaintext(47),
            U_CPHRTXT => upper_ciphertext(48),
            L_CPHRTXT => lower_ciphertext(48)
        );
        round_50 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(49),
            U_PLNTXT => upper_plaintext(48),
            L_PLNTXT => lower_plaintext(48),
            U_CPHRTXT => upper_ciphertext(49),
            L_CPHRTXT => lower_ciphertext(49)
        );
        round_51 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(50),
            U_PLNTXT => upper_plaintext(49),
            L_PLNTXT => lower_plaintext(49),
            U_CPHRTXT => upper_ciphertext(50),
            L_CPHRTXT => lower_ciphertext(50)
        );
        round_52 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(51),
            U_PLNTXT => upper_plaintext(50),
            L_PLNTXT => lower_plaintext(50),
            U_CPHRTXT => upper_ciphertext(51),
            L_CPHRTXT => lower_ciphertext(51)
        );
        round_53 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(52),
            U_PLNTXT => upper_plaintext(51),
            L_PLNTXT => lower_plaintext(51),
            U_CPHRTXT => upper_ciphertext(52),
            L_CPHRTXT => lower_ciphertext(52)
        );
        round_54 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(53),
            U_PLNTXT => upper_plaintext(52),
            L_PLNTXT => lower_plaintext(52),
            U_CPHRTXT => upper_ciphertext(53),
            L_CPHRTXT => lower_ciphertext(53)
        );
        round_55 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(54),
            U_PLNTXT => upper_plaintext(53),
            L_PLNTXT => lower_plaintext(53),
            U_CPHRTXT => upper_ciphertext(54),
            L_CPHRTXT => lower_ciphertext(54)
        );
        round_56 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(55),
            U_PLNTXT => upper_plaintext(54),
            L_PLNTXT => lower_plaintext(54),
            U_CPHRTXT => upper_ciphertext(55),
            L_CPHRTXT => lower_ciphertext(55)
        );
        round_57 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(56),
            U_PLNTXT => upper_plaintext(55),
            L_PLNTXT => lower_plaintext(55),
            U_CPHRTXT => upper_ciphertext(56),
            L_CPHRTXT => lower_ciphertext(56)
        );
        round_58 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(57),
            U_PLNTXT => upper_plaintext(56),
            L_PLNTXT => lower_plaintext(56),
            U_CPHRTXT => upper_ciphertext(57),
            L_CPHRTXT => lower_ciphertext(57)
        );
        round_59 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(58),
            U_PLNTXT => upper_plaintext(57),
            L_PLNTXT => lower_plaintext(57),
            U_CPHRTXT => upper_ciphertext(58),
            L_CPHRTXT => lower_ciphertext(58)
        );
        round_60 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(59),
            U_PLNTXT => upper_plaintext(58),
            L_PLNTXT => lower_plaintext(58),
            U_CPHRTXT => upper_ciphertext(59),
            L_CPHRTXT => lower_ciphertext(59)
        );
        round_61 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(60),
            U_PLNTXT => upper_plaintext(59),
            L_PLNTXT => lower_plaintext(59),
            U_CPHRTXT => upper_ciphertext(60),
            L_CPHRTXT => lower_ciphertext(60)
        );
        round_62 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(61),
            U_PLNTXT => upper_plaintext(60),
            L_PLNTXT => lower_plaintext(60),
            U_CPHRTXT => upper_ciphertext(61),
            L_CPHRTXT => lower_ciphertext(61)
        );
        round_63 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(62),
            U_PLNTXT => upper_plaintext(61),
            L_PLNTXT => lower_plaintext(61),
            U_CPHRTXT => upper_ciphertext(62),
            L_CPHRTXT => lower_ciphertext(62)
        );
        round_64 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(63),
            U_PLNTXT => upper_plaintext(62),
            L_PLNTXT => lower_plaintext(62),
            U_CPHRTXT => upper_ciphertext(63),
            L_CPHRTXT => lower_ciphertext(63)
        );
        round_65 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(64),
            U_PLNTXT => upper_plaintext(63),
            L_PLNTXT => lower_plaintext(63),
            U_CPHRTXT => upper_ciphertext(64),
            L_CPHRTXT => lower_ciphertext(64)
        );
        round_66 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(65),
            U_PLNTXT => upper_plaintext(64),
            L_PLNTXT => lower_plaintext(64),
            U_CPHRTXT => upper_ciphertext(65),
            L_CPHRTXT => lower_ciphertext(65)
        );
        round_67 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(66),
            U_PLNTXT => upper_plaintext(65),
            L_PLNTXT => lower_plaintext(65),
            U_CPHRTXT => upper_ciphertext(66),
            L_CPHRTXT => lower_ciphertext(66)
        );
        round_68 : round_128 port map (
            R_CLK => CLK,
            R_RST => RST,
            SUB_KEY => key_schedule(67),
            U_PLNTXT => upper_plaintext(66),
            L_PLNTXT => lower_plaintext(66),
            U_CPHRTXT => upper_ciphertext(67),
            L_CPHRTXT => lower_ciphertext(67)
        );  

end simon_cipher_hierarchy_128_arc;