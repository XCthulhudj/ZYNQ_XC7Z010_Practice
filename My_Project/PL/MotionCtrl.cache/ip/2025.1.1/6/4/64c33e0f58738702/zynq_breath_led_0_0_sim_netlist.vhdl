-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
-- Date        : Mon Nov 16 17:22:19 2026
-- Host        : DESKTOP-NUN3FF0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zynq_breath_led_0_0_sim_netlist.vhdl
-- Design      : zynq_breath_led_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_top is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    led : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \freq_set_reg_reg[9]_0\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s00_axi_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_top;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_top is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cnt_1ms : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \cnt_1ms[15]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1ms[15]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1ms[15]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1ms[15]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1ms_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1ms_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_1ms_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_1ms_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_1ms_reg[15]_i_6_n_2\ : STD_LOGIC;
  signal \cnt_1ms_reg[15]_i_6_n_3\ : STD_LOGIC;
  signal \cnt_1ms_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1ms_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_1ms_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_1ms_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_1ms_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1ms_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_1ms_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_1ms_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal duty_flag_i_1_n_0 : STD_LOGIC;
  signal duty_flag_reg_n_0 : STD_LOGIC;
  signal freq_set_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \freq_set_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \freq_set_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \freq_set_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \freq_set_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \freq_set_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \freq_set_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \freq_set_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \freq_set_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal high_duty_cnt : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal high_duty_cnt0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal high_duty_cnt00_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal high_duty_cnt1 : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_n_1\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_n_2\ : STD_LOGIC;
  signal \high_duty_cnt1_carry__0_n_3\ : STD_LOGIC;
  signal high_duty_cnt1_carry_i_1_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_2_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_3_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_4_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_5_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_6_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_7_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_i_8_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_n_0 : STD_LOGIC;
  signal high_duty_cnt1_carry_n_1 : STD_LOGIC;
  signal high_duty_cnt1_carry_n_2 : STD_LOGIC;
  signal high_duty_cnt1_carry_n_3 : STD_LOGIC;
  signal \high_duty_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[10]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_4_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_5_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_6_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_7_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_8_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[11]_i_9_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[12]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[13]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[14]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_10_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_11_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_12_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_13_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_14_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_15_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_16_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_17_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_18_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_19_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_2_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_3_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_4_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_5_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_8_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[15]_i_9_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_10_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_11_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_4_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_5_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_6_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_7_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_8_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[3]_i_9_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_10_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_11_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_4_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_5_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_6_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_7_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_8_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[7]_i_9_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt[9]_i_1_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_2_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_3_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_6_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_6_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_6_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_7_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_7_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[15]_i_7_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_3_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_3_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[3]_i_3_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_3_n_1\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_3_n_2\ : STD_LOGIC;
  signal \high_duty_cnt_reg[7]_i_3_n_3\ : STD_LOGIC;
  signal led0 : STD_LOGIC;
  signal \led0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \led0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \led0_carry__0_n_1\ : STD_LOGIC;
  signal \led0_carry__0_n_2\ : STD_LOGIC;
  signal \led0_carry__0_n_3\ : STD_LOGIC;
  signal led0_carry_i_1_n_0 : STD_LOGIC;
  signal led0_carry_i_2_n_0 : STD_LOGIC;
  signal led0_carry_i_3_n_0 : STD_LOGIC;
  signal led0_carry_i_4_n_0 : STD_LOGIC;
  signal led0_carry_i_5_n_0 : STD_LOGIC;
  signal led0_carry_i_6_n_0 : STD_LOGIC;
  signal led0_carry_i_7_n_0 : STD_LOGIC;
  signal led0_carry_i_8_n_0 : STD_LOGIC;
  signal led0_carry_n_0 : STD_LOGIC;
  signal led0_carry_n_1 : STD_LOGIC;
  signal led0_carry_n_2 : STD_LOGIC;
  signal led0_carry_n_3 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_cnt_1ms_reg[15]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_1ms_reg[15]_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_high_duty_cnt1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_high_duty_cnt1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_high_duty_cnt_reg[15]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_high_duty_cnt_reg[15]_i_7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_led0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_led0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_1ms[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_1ms[15]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_1ms[15]_i_5\ : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_1ms_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1ms_reg[15]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1ms_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_1ms_reg[8]_i_2\ : label is 35;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of high_duty_cnt1_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \high_duty_cnt1_carry__0\ : label is 11;
  attribute SOFT_HLUTNM of \high_duty_cnt[15]_i_9\ : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[11]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[11]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[15]_i_6\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[15]_i_7\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[3]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[7]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \high_duty_cnt_reg[7]_i_3\ : label is 35;
  attribute COMPARATOR_THRESHOLD of led0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \led0_carry__0\ : label is 11;
begin
  SR(0) <= \^sr\(0);
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^sr\(0)
    );
\cnt_1ms[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(0),
      I1 => cnt_1ms(0),
      O => p_0_in(0)
    );
\cnt_1ms[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(10),
      O => p_0_in(10)
    );
\cnt_1ms[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(11),
      O => p_0_in(11)
    );
\cnt_1ms[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(12),
      O => p_0_in(12)
    );
\cnt_1ms[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(13),
      O => p_0_in(13)
    );
\cnt_1ms[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(14),
      O => p_0_in(14)
    );
\cnt_1ms[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(15),
      O => p_0_in(15)
    );
\cnt_1ms[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => cnt_1ms(3),
      I1 => cnt_1ms(11),
      I2 => cnt_1ms(6),
      I3 => cnt_1ms(0),
      O => \cnt_1ms[15]_i_2_n_0\
    );
\cnt_1ms[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => cnt_1ms(15),
      I1 => cnt_1ms(1),
      I2 => cnt_1ms(14),
      I3 => cnt_1ms(10),
      O => \cnt_1ms[15]_i_3_n_0\
    );
\cnt_1ms[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => cnt_1ms(5),
      I1 => cnt_1ms(4),
      I2 => cnt_1ms(9),
      I3 => cnt_1ms(13),
      O => \cnt_1ms[15]_i_4_n_0\
    );
\cnt_1ms[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => cnt_1ms(8),
      I1 => cnt_1ms(12),
      I2 => cnt_1ms(2),
      I3 => cnt_1ms(7),
      O => \cnt_1ms[15]_i_5_n_0\
    );
\cnt_1ms[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(1),
      O => p_0_in(1)
    );
\cnt_1ms[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(2),
      O => p_0_in(2)
    );
\cnt_1ms[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(3),
      O => p_0_in(3)
    );
\cnt_1ms[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(4),
      O => p_0_in(4)
    );
\cnt_1ms[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(5),
      O => p_0_in(5)
    );
\cnt_1ms[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(6),
      O => p_0_in(6)
    );
\cnt_1ms[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(7),
      O => p_0_in(7)
    );
\cnt_1ms[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(8),
      O => p_0_in(8)
    );
\cnt_1ms[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFB000000000000"
    )
        port map (
      I0 => \cnt_1ms[15]_i_2_n_0\,
      I1 => \cnt_1ms[15]_i_3_n_0\,
      I2 => \cnt_1ms[15]_i_4_n_0\,
      I3 => \cnt_1ms[15]_i_5_n_0\,
      I4 => Q(0),
      I5 => data0(9),
      O => p_0_in(9)
    );
\cnt_1ms_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(0),
      Q => cnt_1ms(0)
    );
\cnt_1ms_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(10),
      Q => cnt_1ms(10)
    );
\cnt_1ms_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(11),
      Q => cnt_1ms(11)
    );
\cnt_1ms_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(12),
      Q => cnt_1ms(12)
    );
\cnt_1ms_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1ms_reg[8]_i_2_n_0\,
      CO(3) => \cnt_1ms_reg[12]_i_2_n_0\,
      CO(2) => \cnt_1ms_reg[12]_i_2_n_1\,
      CO(1) => \cnt_1ms_reg[12]_i_2_n_2\,
      CO(0) => \cnt_1ms_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => cnt_1ms(12 downto 9)
    );
\cnt_1ms_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(13),
      Q => cnt_1ms(13)
    );
\cnt_1ms_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(14),
      Q => cnt_1ms(14)
    );
\cnt_1ms_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(15),
      Q => cnt_1ms(15)
    );
\cnt_1ms_reg[15]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1ms_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_cnt_1ms_reg[15]_i_6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_1ms_reg[15]_i_6_n_2\,
      CO(0) => \cnt_1ms_reg[15]_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_cnt_1ms_reg[15]_i_6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => cnt_1ms(15 downto 13)
    );
\cnt_1ms_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(1),
      Q => cnt_1ms(1)
    );
\cnt_1ms_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(2),
      Q => cnt_1ms(2)
    );
\cnt_1ms_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(3),
      Q => cnt_1ms(3)
    );
\cnt_1ms_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(4),
      Q => cnt_1ms(4)
    );
\cnt_1ms_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_1ms_reg[4]_i_2_n_0\,
      CO(2) => \cnt_1ms_reg[4]_i_2_n_1\,
      CO(1) => \cnt_1ms_reg[4]_i_2_n_2\,
      CO(0) => \cnt_1ms_reg[4]_i_2_n_3\,
      CYINIT => cnt_1ms(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => cnt_1ms(4 downto 1)
    );
\cnt_1ms_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(5),
      Q => cnt_1ms(5)
    );
\cnt_1ms_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(6),
      Q => cnt_1ms(6)
    );
\cnt_1ms_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(7),
      Q => cnt_1ms(7)
    );
\cnt_1ms_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(8),
      Q => cnt_1ms(8)
    );
\cnt_1ms_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_1ms_reg[4]_i_2_n_0\,
      CO(3) => \cnt_1ms_reg[8]_i_2_n_0\,
      CO(2) => \cnt_1ms_reg[8]_i_2_n_1\,
      CO(1) => \cnt_1ms_reg[8]_i_2_n_2\,
      CO(0) => \cnt_1ms_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => cnt_1ms(8 downto 5)
    );
\cnt_1ms_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => p_0_in(9),
      Q => cnt_1ms(9)
    );
duty_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BF001100"
    )
        port map (
      I0 => \high_duty_cnt[15]_i_3_n_0\,
      I1 => \high_duty_cnt[15]_i_4_n_0\,
      I2 => \high_duty_cnt[15]_i_5_n_0\,
      I3 => Q(0),
      I4 => duty_flag_reg_n_0,
      O => duty_flag_i_1_n_0
    );
duty_flag_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => duty_flag_i_1_n_0,
      Q => duty_flag_reg_n_0
    );
\freq_set_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF7F0000"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(9),
      I1 => \freq_set_reg_reg[9]_0\(8),
      I2 => \freq_set_reg_reg[9]_0\(6),
      I3 => \freq_set_reg[4]_i_2_n_0\,
      I4 => \freq_set_reg_reg[9]_0\(0),
      I5 => \freq_set_reg[2]_i_2_n_0\,
      O => \freq_set_reg[0]_i_1_n_0\
    );
\freq_set_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFF7FFF7F0000"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(9),
      I1 => \freq_set_reg_reg[9]_0\(8),
      I2 => \freq_set_reg_reg[9]_0\(6),
      I3 => \freq_set_reg[4]_i_2_n_0\,
      I4 => \freq_set_reg[2]_i_2_n_0\,
      I5 => \freq_set_reg_reg[9]_0\(1),
      O => \freq_set_reg[1]_i_1_n_0\
    );
\freq_set_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF7F0000"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(9),
      I1 => \freq_set_reg_reg[9]_0\(8),
      I2 => \freq_set_reg_reg[9]_0\(6),
      I3 => \freq_set_reg[4]_i_2_n_0\,
      I4 => \freq_set_reg_reg[9]_0\(2),
      I5 => \freq_set_reg[2]_i_2_n_0\,
      O => \freq_set_reg[2]_i_1_n_0\
    );
\freq_set_reg[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002AAAAA"
    )
        port map (
      I0 => \freq_set_reg[3]_i_2_n_0\,
      I1 => \freq_set_reg_reg[9]_0\(1),
      I2 => \freq_set_reg_reg[9]_0\(0),
      I3 => \freq_set_reg_reg[9]_0\(2),
      I4 => \freq_set_reg_reg[9]_0\(3),
      O => \freq_set_reg[2]_i_2_n_0\
    );
\freq_set_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0080"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(9),
      I1 => \freq_set_reg_reg[9]_0\(8),
      I2 => \freq_set_reg_reg[9]_0\(6),
      I3 => \freq_set_reg[4]_i_2_n_0\,
      I4 => \freq_set_reg[3]_i_2_n_0\,
      I5 => \freq_set_reg_reg[9]_0\(3),
      O => \freq_set_reg[3]_i_1_n_0\
    );
\freq_set_reg[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(4),
      I1 => \freq_set_reg_reg[9]_0\(5),
      I2 => \freq_set_reg_reg[9]_0\(9),
      I3 => \freq_set_reg_reg[9]_0\(8),
      I4 => \freq_set_reg_reg[9]_0\(7),
      I5 => \freq_set_reg_reg[9]_0\(6),
      O => \freq_set_reg[3]_i_2_n_0\
    );
\freq_set_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0000"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(9),
      I1 => \freq_set_reg_reg[9]_0\(8),
      I2 => \freq_set_reg_reg[9]_0\(6),
      I3 => \freq_set_reg[4]_i_2_n_0\,
      I4 => \freq_set_reg_reg[9]_0\(4),
      O => \freq_set_reg[4]_i_1_n_0\
    );
\freq_set_reg[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FFF"
    )
        port map (
      I0 => \freq_set_reg_reg[9]_0\(3),
      I1 => \freq_set_reg_reg[9]_0\(4),
      I2 => \freq_set_reg_reg[9]_0\(5),
      I3 => \freq_set_reg_reg[9]_0\(7),
      O => \freq_set_reg[4]_i_2_n_0\
    );
\freq_set_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg[0]_i_1_n_0\,
      Q => freq_set_reg(0)
    );
\freq_set_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg[1]_i_1_n_0\,
      Q => freq_set_reg(1)
    );
\freq_set_reg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \freq_set_reg[2]_i_1_n_0\,
      PRE => \^sr\(0),
      Q => freq_set_reg(2)
    );
\freq_set_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg[3]_i_1_n_0\,
      Q => freq_set_reg(3)
    );
\freq_set_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg[4]_i_1_n_0\,
      Q => freq_set_reg(4)
    );
\freq_set_reg_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \freq_set_reg_reg[9]_0\(5),
      PRE => \^sr\(0),
      Q => freq_set_reg(5)
    );
\freq_set_reg_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \freq_set_reg_reg[9]_0\(6),
      PRE => \^sr\(0),
      Q => freq_set_reg(6)
    );
\freq_set_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg_reg[9]_0\(7),
      Q => freq_set_reg(7)
    );
\freq_set_reg_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg_reg[9]_0\(8),
      Q => freq_set_reg(8)
    );
\freq_set_reg_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^sr\(0),
      D => \freq_set_reg_reg[9]_0\(9),
      Q => freq_set_reg(9)
    );
high_duty_cnt1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => high_duty_cnt1_carry_n_0,
      CO(2) => high_duty_cnt1_carry_n_1,
      CO(1) => high_duty_cnt1_carry_n_2,
      CO(0) => high_duty_cnt1_carry_n_3,
      CYINIT => '0',
      DI(3) => high_duty_cnt1_carry_i_1_n_0,
      DI(2) => high_duty_cnt1_carry_i_2_n_0,
      DI(1) => high_duty_cnt1_carry_i_3_n_0,
      DI(0) => high_duty_cnt1_carry_i_4_n_0,
      O(3 downto 0) => NLW_high_duty_cnt1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => high_duty_cnt1_carry_i_5_n_0,
      S(2) => high_duty_cnt1_carry_i_6_n_0,
      S(1) => high_duty_cnt1_carry_i_7_n_0,
      S(0) => high_duty_cnt1_carry_i_8_n_0
    );
\high_duty_cnt1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => high_duty_cnt1_carry_n_0,
      CO(3) => high_duty_cnt1,
      CO(2) => \high_duty_cnt1_carry__0_n_1\,
      CO(1) => \high_duty_cnt1_carry__0_n_2\,
      CO(0) => \high_duty_cnt1_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \high_duty_cnt1_carry__0_i_1_n_0\,
      O(3 downto 0) => \NLW_high_duty_cnt1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \high_duty_cnt1_carry__0_i_2_n_0\,
      S(2) => \high_duty_cnt1_carry__0_i_3_n_0\,
      S(1) => \high_duty_cnt1_carry__0_i_4_n_0\,
      S(0) => \high_duty_cnt1_carry__0_i_5_n_0\
    );
\high_duty_cnt1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => high_duty_cnt(9),
      I1 => freq_set_reg(9),
      I2 => freq_set_reg(8),
      I3 => high_duty_cnt(8),
      O => \high_duty_cnt1_carry__0_i_1_n_0\
    );
\high_duty_cnt1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(15),
      I1 => high_duty_cnt(14),
      O => \high_duty_cnt1_carry__0_i_2_n_0\
    );
\high_duty_cnt1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(13),
      I1 => high_duty_cnt(12),
      O => \high_duty_cnt1_carry__0_i_3_n_0\
    );
\high_duty_cnt1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(11),
      I1 => high_duty_cnt(10),
      O => \high_duty_cnt1_carry__0_i_4_n_0\
    );
\high_duty_cnt1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => freq_set_reg(9),
      I1 => high_duty_cnt(9),
      I2 => freq_set_reg(8),
      I3 => high_duty_cnt(8),
      O => \high_duty_cnt1_carry__0_i_5_n_0\
    );
high_duty_cnt1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => high_duty_cnt(7),
      I1 => freq_set_reg(7),
      I2 => freq_set_reg(6),
      I3 => high_duty_cnt(6),
      O => high_duty_cnt1_carry_i_1_n_0
    );
high_duty_cnt1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => high_duty_cnt(5),
      I1 => freq_set_reg(5),
      I2 => freq_set_reg(4),
      I3 => high_duty_cnt(4),
      O => high_duty_cnt1_carry_i_2_n_0
    );
high_duty_cnt1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => high_duty_cnt(3),
      I1 => freq_set_reg(3),
      I2 => freq_set_reg(2),
      I3 => high_duty_cnt(2),
      O => high_duty_cnt1_carry_i_3_n_0
    );
high_duty_cnt1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44D4"
    )
        port map (
      I0 => high_duty_cnt(1),
      I1 => freq_set_reg(1),
      I2 => freq_set_reg(0),
      I3 => high_duty_cnt(0),
      O => high_duty_cnt1_carry_i_4_n_0
    );
high_duty_cnt1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => freq_set_reg(7),
      I1 => high_duty_cnt(7),
      I2 => freq_set_reg(6),
      I3 => high_duty_cnt(6),
      O => high_duty_cnt1_carry_i_5_n_0
    );
high_duty_cnt1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => freq_set_reg(5),
      I1 => high_duty_cnt(5),
      I2 => freq_set_reg(4),
      I3 => high_duty_cnt(4),
      O => high_duty_cnt1_carry_i_6_n_0
    );
high_duty_cnt1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => freq_set_reg(3),
      I1 => high_duty_cnt(3),
      I2 => freq_set_reg(2),
      I3 => high_duty_cnt(2),
      O => high_duty_cnt1_carry_i_7_n_0
    );
high_duty_cnt1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => freq_set_reg(1),
      I1 => high_duty_cnt(1),
      I2 => freq_set_reg(0),
      I3 => high_duty_cnt(0),
      O => high_duty_cnt1_carry_i_8_n_0
    );
\high_duty_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(0),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(0),
      I4 => Q(0),
      O => \high_duty_cnt[0]_i_1_n_0\
    );
\high_duty_cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(10),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(10),
      I4 => Q(0),
      O => \high_duty_cnt[10]_i_1_n_0\
    );
\high_duty_cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(11),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(11),
      I4 => Q(0),
      O => \high_duty_cnt[11]_i_1_n_0\
    );
\high_duty_cnt[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(9),
      I1 => freq_set_reg(9),
      O => \high_duty_cnt[11]_i_4_n_0\
    );
\high_duty_cnt[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(8),
      I1 => freq_set_reg(8),
      O => \high_duty_cnt[11]_i_5_n_0\
    );
\high_duty_cnt[11]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(11),
      O => \high_duty_cnt[11]_i_6_n_0\
    );
\high_duty_cnt[11]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(10),
      O => \high_duty_cnt[11]_i_7_n_0\
    );
\high_duty_cnt[11]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(9),
      I1 => high_duty_cnt(9),
      O => \high_duty_cnt[11]_i_8_n_0\
    );
\high_duty_cnt[11]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(8),
      I1 => high_duty_cnt(8),
      O => \high_duty_cnt[11]_i_9_n_0\
    );
\high_duty_cnt[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(12),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(12),
      I4 => Q(0),
      O => \high_duty_cnt[12]_i_1_n_0\
    );
\high_duty_cnt[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(13),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(13),
      I4 => Q(0),
      O => \high_duty_cnt[13]_i_1_n_0\
    );
\high_duty_cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(14),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(14),
      I4 => Q(0),
      O => \high_duty_cnt[14]_i_1_n_0\
    );
\high_duty_cnt[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"04FF"
    )
        port map (
      I0 => \high_duty_cnt[15]_i_3_n_0\,
      I1 => \high_duty_cnt[15]_i_4_n_0\,
      I2 => \high_duty_cnt[15]_i_5_n_0\,
      I3 => Q(0),
      O => \high_duty_cnt[15]_i_1_n_0\
    );
\high_duty_cnt[15]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => high_duty_cnt(11),
      I1 => high_duty_cnt(10),
      I2 => high_duty_cnt(13),
      I3 => high_duty_cnt(12),
      O => \high_duty_cnt[15]_i_10_n_0\
    );
\high_duty_cnt[15]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000007FFF"
    )
        port map (
      I0 => high_duty_cnt(3),
      I1 => high_duty_cnt(1),
      I2 => high_duty_cnt(0),
      I3 => high_duty_cnt(2),
      I4 => high_duty_cnt(4),
      I5 => high_duty_cnt(5),
      O => \high_duty_cnt[15]_i_11_n_0\
    );
\high_duty_cnt[15]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => high_duty_cnt(8),
      I1 => high_duty_cnt(9),
      O => \high_duty_cnt[15]_i_12_n_0\
    );
\high_duty_cnt[15]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => high_duty_cnt(14),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt(15),
      O => \high_duty_cnt[15]_i_13_n_0\
    );
\high_duty_cnt[15]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => high_duty_cnt(8),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt(14),
      I3 => high_duty_cnt(15),
      I4 => high_duty_cnt(4),
      I5 => high_duty_cnt(5),
      O => \high_duty_cnt[15]_i_14_n_0\
    );
\high_duty_cnt[15]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => high_duty_cnt(6),
      I1 => high_duty_cnt(0),
      I2 => high_duty_cnt(7),
      I3 => high_duty_cnt(2),
      O => \high_duty_cnt[15]_i_15_n_0\
    );
\high_duty_cnt[15]_i_16\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(15),
      O => \high_duty_cnt[15]_i_16_n_0\
    );
\high_duty_cnt[15]_i_17\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(14),
      O => \high_duty_cnt[15]_i_17_n_0\
    );
\high_duty_cnt[15]_i_18\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(13),
      O => \high_duty_cnt[15]_i_18_n_0\
    );
\high_duty_cnt[15]_i_19\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => high_duty_cnt(12),
      O => \high_duty_cnt[15]_i_19_n_0\
    );
\high_duty_cnt[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(15),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(15),
      I4 => Q(0),
      O => \high_duty_cnt[15]_i_2_n_0\
    );
\high_duty_cnt[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
        port map (
      I0 => \cnt_1ms[15]_i_5_n_0\,
      I1 => \cnt_1ms[15]_i_4_n_0\,
      I2 => \cnt_1ms[15]_i_3_n_0\,
      I3 => \high_duty_cnt[15]_i_8_n_0\,
      I4 => \high_duty_cnt[15]_i_9_n_0\,
      O => \high_duty_cnt[15]_i_3_n_0\
    );
\high_duty_cnt[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => \high_duty_cnt[15]_i_10_n_0\,
      I1 => high_duty_cnt(7),
      I2 => \high_duty_cnt[15]_i_11_n_0\,
      I3 => high_duty_cnt(6),
      I4 => \high_duty_cnt[15]_i_12_n_0\,
      I5 => \high_duty_cnt[15]_i_13_n_0\,
      O => \high_duty_cnt[15]_i_4_n_0\
    );
\high_duty_cnt[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \high_duty_cnt[15]_i_14_n_0\,
      I1 => high_duty_cnt(9),
      I2 => high_duty_cnt(1),
      I3 => high_duty_cnt(3),
      I4 => \high_duty_cnt[15]_i_15_n_0\,
      I5 => \high_duty_cnt[15]_i_10_n_0\,
      O => \high_duty_cnt[15]_i_5_n_0\
    );
\high_duty_cnt[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF70FFFFFFFFFF"
    )
        port map (
      I0 => cnt_1ms(0),
      I1 => cnt_1ms(1),
      I2 => cnt_1ms(2),
      I3 => cnt_1ms(14),
      I4 => cnt_1ms(11),
      I5 => cnt_1ms(3),
      O => \high_duty_cnt[15]_i_8_n_0\
    );
\high_duty_cnt[15]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => cnt_1ms(8),
      I1 => cnt_1ms(7),
      I2 => cnt_1ms(6),
      O => \high_duty_cnt[15]_i_9_n_0\
    );
\high_duty_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(1),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(1),
      I4 => Q(0),
      O => \high_duty_cnt[1]_i_1_n_0\
    );
\high_duty_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(2),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(2),
      I4 => Q(0),
      O => \high_duty_cnt[2]_i_1_n_0\
    );
\high_duty_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(3),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(3),
      I4 => Q(0),
      O => \high_duty_cnt[3]_i_1_n_0\
    );
\high_duty_cnt[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(1),
      I1 => high_duty_cnt(1),
      O => \high_duty_cnt[3]_i_10_n_0\
    );
\high_duty_cnt[3]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(0),
      I1 => high_duty_cnt(0),
      O => \high_duty_cnt[3]_i_11_n_0\
    );
\high_duty_cnt[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(3),
      I1 => freq_set_reg(3),
      O => \high_duty_cnt[3]_i_4_n_0\
    );
\high_duty_cnt[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(2),
      I1 => freq_set_reg(2),
      O => \high_duty_cnt[3]_i_5_n_0\
    );
\high_duty_cnt[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(1),
      I1 => freq_set_reg(1),
      O => \high_duty_cnt[3]_i_6_n_0\
    );
\high_duty_cnt[3]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(0),
      I1 => freq_set_reg(0),
      O => \high_duty_cnt[3]_i_7_n_0\
    );
\high_duty_cnt[3]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(3),
      I1 => high_duty_cnt(3),
      O => \high_duty_cnt[3]_i_8_n_0\
    );
\high_duty_cnt[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(2),
      I1 => high_duty_cnt(2),
      O => \high_duty_cnt[3]_i_9_n_0\
    );
\high_duty_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(4),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(4),
      I4 => Q(0),
      O => \high_duty_cnt[4]_i_1_n_0\
    );
\high_duty_cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(5),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(5),
      I4 => Q(0),
      O => \high_duty_cnt[5]_i_1_n_0\
    );
\high_duty_cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(6),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(6),
      I4 => Q(0),
      O => \high_duty_cnt[6]_i_1_n_0\
    );
\high_duty_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(7),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(7),
      I4 => Q(0),
      O => \high_duty_cnt[7]_i_1_n_0\
    );
\high_duty_cnt[7]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(5),
      I1 => high_duty_cnt(5),
      O => \high_duty_cnt[7]_i_10_n_0\
    );
\high_duty_cnt[7]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(4),
      I1 => high_duty_cnt(4),
      O => \high_duty_cnt[7]_i_11_n_0\
    );
\high_duty_cnt[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(7),
      I1 => freq_set_reg(7),
      O => \high_duty_cnt[7]_i_4_n_0\
    );
\high_duty_cnt[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(6),
      I1 => freq_set_reg(6),
      O => \high_duty_cnt[7]_i_5_n_0\
    );
\high_duty_cnt[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(5),
      I1 => freq_set_reg(5),
      O => \high_duty_cnt[7]_i_6_n_0\
    );
\high_duty_cnt[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => high_duty_cnt(4),
      I1 => freq_set_reg(4),
      O => \high_duty_cnt[7]_i_7_n_0\
    );
\high_duty_cnt[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(7),
      I1 => high_duty_cnt(7),
      O => \high_duty_cnt[7]_i_8_n_0\
    );
\high_duty_cnt[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => freq_set_reg(6),
      I1 => high_duty_cnt(6),
      O => \high_duty_cnt[7]_i_9_n_0\
    );
\high_duty_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(8),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(8),
      I4 => Q(0),
      O => \high_duty_cnt[8]_i_1_n_0\
    );
\high_duty_cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E220000"
    )
        port map (
      I0 => high_duty_cnt00_in(9),
      I1 => duty_flag_reg_n_0,
      I2 => high_duty_cnt1,
      I3 => high_duty_cnt0(9),
      I4 => Q(0),
      O => \high_duty_cnt[9]_i_1_n_0\
    );
\high_duty_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[0]_i_1_n_0\,
      Q => high_duty_cnt(0)
    );
\high_duty_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[10]_i_1_n_0\,
      Q => high_duty_cnt(10)
    );
\high_duty_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[11]_i_1_n_0\,
      Q => high_duty_cnt(11)
    );
\high_duty_cnt_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[7]_i_2_n_0\,
      CO(3) => \high_duty_cnt_reg[11]_i_2_n_0\,
      CO(2) => \high_duty_cnt_reg[11]_i_2_n_1\,
      CO(1) => \high_duty_cnt_reg[11]_i_2_n_2\,
      CO(0) => \high_duty_cnt_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => high_duty_cnt(9 downto 8),
      O(3 downto 0) => high_duty_cnt00_in(11 downto 8),
      S(3 downto 2) => high_duty_cnt(11 downto 10),
      S(1) => \high_duty_cnt[11]_i_4_n_0\,
      S(0) => \high_duty_cnt[11]_i_5_n_0\
    );
\high_duty_cnt_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[7]_i_3_n_0\,
      CO(3) => \high_duty_cnt_reg[11]_i_3_n_0\,
      CO(2) => \high_duty_cnt_reg[11]_i_3_n_1\,
      CO(1) => \high_duty_cnt_reg[11]_i_3_n_2\,
      CO(0) => \high_duty_cnt_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => high_duty_cnt(11 downto 8),
      O(3 downto 0) => high_duty_cnt0(11 downto 8),
      S(3) => \high_duty_cnt[11]_i_6_n_0\,
      S(2) => \high_duty_cnt[11]_i_7_n_0\,
      S(1) => \high_duty_cnt[11]_i_8_n_0\,
      S(0) => \high_duty_cnt[11]_i_9_n_0\
    );
\high_duty_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[12]_i_1_n_0\,
      Q => high_duty_cnt(12)
    );
\high_duty_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[13]_i_1_n_0\,
      Q => high_duty_cnt(13)
    );
\high_duty_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[14]_i_1_n_0\,
      Q => high_duty_cnt(14)
    );
\high_duty_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[15]_i_2_n_0\,
      Q => high_duty_cnt(15)
    );
\high_duty_cnt_reg[15]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[11]_i_2_n_0\,
      CO(3) => \NLW_high_duty_cnt_reg[15]_i_6_CO_UNCONNECTED\(3),
      CO(2) => \high_duty_cnt_reg[15]_i_6_n_1\,
      CO(1) => \high_duty_cnt_reg[15]_i_6_n_2\,
      CO(0) => \high_duty_cnt_reg[15]_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => high_duty_cnt00_in(15 downto 12),
      S(3 downto 0) => high_duty_cnt(15 downto 12)
    );
\high_duty_cnt_reg[15]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[11]_i_3_n_0\,
      CO(3) => \NLW_high_duty_cnt_reg[15]_i_7_CO_UNCONNECTED\(3),
      CO(2) => \high_duty_cnt_reg[15]_i_7_n_1\,
      CO(1) => \high_duty_cnt_reg[15]_i_7_n_2\,
      CO(0) => \high_duty_cnt_reg[15]_i_7_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => high_duty_cnt(14 downto 12),
      O(3 downto 0) => high_duty_cnt0(15 downto 12),
      S(3) => \high_duty_cnt[15]_i_16_n_0\,
      S(2) => \high_duty_cnt[15]_i_17_n_0\,
      S(1) => \high_duty_cnt[15]_i_18_n_0\,
      S(0) => \high_duty_cnt[15]_i_19_n_0\
    );
\high_duty_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[1]_i_1_n_0\,
      Q => high_duty_cnt(1)
    );
\high_duty_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[2]_i_1_n_0\,
      Q => high_duty_cnt(2)
    );
\high_duty_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[3]_i_1_n_0\,
      Q => high_duty_cnt(3)
    );
\high_duty_cnt_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \high_duty_cnt_reg[3]_i_2_n_0\,
      CO(2) => \high_duty_cnt_reg[3]_i_2_n_1\,
      CO(1) => \high_duty_cnt_reg[3]_i_2_n_2\,
      CO(0) => \high_duty_cnt_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => high_duty_cnt(3 downto 0),
      O(3 downto 0) => high_duty_cnt00_in(3 downto 0),
      S(3) => \high_duty_cnt[3]_i_4_n_0\,
      S(2) => \high_duty_cnt[3]_i_5_n_0\,
      S(1) => \high_duty_cnt[3]_i_6_n_0\,
      S(0) => \high_duty_cnt[3]_i_7_n_0\
    );
\high_duty_cnt_reg[3]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \high_duty_cnt_reg[3]_i_3_n_0\,
      CO(2) => \high_duty_cnt_reg[3]_i_3_n_1\,
      CO(1) => \high_duty_cnt_reg[3]_i_3_n_2\,
      CO(0) => \high_duty_cnt_reg[3]_i_3_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => high_duty_cnt(3 downto 0),
      O(3 downto 0) => high_duty_cnt0(3 downto 0),
      S(3) => \high_duty_cnt[3]_i_8_n_0\,
      S(2) => \high_duty_cnt[3]_i_9_n_0\,
      S(1) => \high_duty_cnt[3]_i_10_n_0\,
      S(0) => \high_duty_cnt[3]_i_11_n_0\
    );
\high_duty_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[4]_i_1_n_0\,
      Q => high_duty_cnt(4)
    );
\high_duty_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[5]_i_1_n_0\,
      Q => high_duty_cnt(5)
    );
\high_duty_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[6]_i_1_n_0\,
      Q => high_duty_cnt(6)
    );
\high_duty_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[7]_i_1_n_0\,
      Q => high_duty_cnt(7)
    );
\high_duty_cnt_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[3]_i_2_n_0\,
      CO(3) => \high_duty_cnt_reg[7]_i_2_n_0\,
      CO(2) => \high_duty_cnt_reg[7]_i_2_n_1\,
      CO(1) => \high_duty_cnt_reg[7]_i_2_n_2\,
      CO(0) => \high_duty_cnt_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => high_duty_cnt(7 downto 4),
      O(3 downto 0) => high_duty_cnt00_in(7 downto 4),
      S(3) => \high_duty_cnt[7]_i_4_n_0\,
      S(2) => \high_duty_cnt[7]_i_5_n_0\,
      S(1) => \high_duty_cnt[7]_i_6_n_0\,
      S(0) => \high_duty_cnt[7]_i_7_n_0\
    );
\high_duty_cnt_reg[7]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \high_duty_cnt_reg[3]_i_3_n_0\,
      CO(3) => \high_duty_cnt_reg[7]_i_3_n_0\,
      CO(2) => \high_duty_cnt_reg[7]_i_3_n_1\,
      CO(1) => \high_duty_cnt_reg[7]_i_3_n_2\,
      CO(0) => \high_duty_cnt_reg[7]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => high_duty_cnt(7 downto 4),
      O(3 downto 0) => high_duty_cnt0(7 downto 4),
      S(3) => \high_duty_cnt[7]_i_8_n_0\,
      S(2) => \high_duty_cnt[7]_i_9_n_0\,
      S(1) => \high_duty_cnt[7]_i_10_n_0\,
      S(0) => \high_duty_cnt[7]_i_11_n_0\
    );
\high_duty_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[8]_i_1_n_0\,
      Q => high_duty_cnt(8)
    );
\high_duty_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \high_duty_cnt[15]_i_1_n_0\,
      CLR => \^sr\(0),
      D => \high_duty_cnt[9]_i_1_n_0\,
      Q => high_duty_cnt(9)
    );
led0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => led0_carry_n_0,
      CO(2) => led0_carry_n_1,
      CO(1) => led0_carry_n_2,
      CO(0) => led0_carry_n_3,
      CYINIT => '1',
      DI(3) => led0_carry_i_1_n_0,
      DI(2) => led0_carry_i_2_n_0,
      DI(1) => led0_carry_i_3_n_0,
      DI(0) => led0_carry_i_4_n_0,
      O(3 downto 0) => NLW_led0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => led0_carry_i_5_n_0,
      S(2) => led0_carry_i_6_n_0,
      S(1) => led0_carry_i_7_n_0,
      S(0) => led0_carry_i_8_n_0
    );
\led0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => led0_carry_n_0,
      CO(3) => led0,
      CO(2) => \led0_carry__0_n_1\,
      CO(1) => \led0_carry__0_n_2\,
      CO(0) => \led0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \led0_carry__0_i_1_n_0\,
      DI(2) => \led0_carry__0_i_2_n_0\,
      DI(1) => \led0_carry__0_i_3_n_0\,
      DI(0) => \led0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_led0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \led0_carry__0_i_5_n_0\,
      S(2) => \led0_carry__0_i_6_n_0\,
      S(1) => \led0_carry__0_i_7_n_0\,
      S(0) => \led0_carry__0_i_8_n_0\
    );
\led0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(15),
      I1 => cnt_1ms(15),
      I2 => high_duty_cnt(14),
      I3 => cnt_1ms(14),
      O => \led0_carry__0_i_1_n_0\
    );
\led0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(13),
      I1 => cnt_1ms(13),
      I2 => high_duty_cnt(12),
      I3 => cnt_1ms(12),
      O => \led0_carry__0_i_2_n_0\
    );
\led0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(11),
      I1 => cnt_1ms(11),
      I2 => high_duty_cnt(10),
      I3 => cnt_1ms(10),
      O => \led0_carry__0_i_3_n_0\
    );
\led0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(9),
      I1 => cnt_1ms(9),
      I2 => high_duty_cnt(8),
      I3 => cnt_1ms(8),
      O => \led0_carry__0_i_4_n_0\
    );
\led0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(15),
      I1 => high_duty_cnt(15),
      I2 => cnt_1ms(14),
      I3 => high_duty_cnt(14),
      O => \led0_carry__0_i_5_n_0\
    );
\led0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(13),
      I1 => high_duty_cnt(13),
      I2 => cnt_1ms(12),
      I3 => high_duty_cnt(12),
      O => \led0_carry__0_i_6_n_0\
    );
\led0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(11),
      I1 => high_duty_cnt(11),
      I2 => cnt_1ms(10),
      I3 => high_duty_cnt(10),
      O => \led0_carry__0_i_7_n_0\
    );
\led0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(9),
      I1 => high_duty_cnt(9),
      I2 => cnt_1ms(8),
      I3 => high_duty_cnt(8),
      O => \led0_carry__0_i_8_n_0\
    );
led0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(7),
      I1 => cnt_1ms(7),
      I2 => high_duty_cnt(6),
      I3 => cnt_1ms(6),
      O => led0_carry_i_1_n_0
    );
led0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(5),
      I1 => cnt_1ms(5),
      I2 => high_duty_cnt(4),
      I3 => cnt_1ms(4),
      O => led0_carry_i_2_n_0
    );
led0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(3),
      I1 => cnt_1ms(3),
      I2 => high_duty_cnt(2),
      I3 => cnt_1ms(2),
      O => led0_carry_i_3_n_0
    );
led0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => high_duty_cnt(1),
      I1 => cnt_1ms(1),
      I2 => high_duty_cnt(0),
      I3 => cnt_1ms(0),
      O => led0_carry_i_4_n_0
    );
led0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(7),
      I1 => high_duty_cnt(7),
      I2 => cnt_1ms(6),
      I3 => high_duty_cnt(6),
      O => led0_carry_i_5_n_0
    );
led0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(5),
      I1 => high_duty_cnt(5),
      I2 => cnt_1ms(4),
      I3 => high_duty_cnt(4),
      O => led0_carry_i_6_n_0
    );
led0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(3),
      I1 => high_duty_cnt(3),
      I2 => cnt_1ms(2),
      I3 => high_duty_cnt(2),
      O => led0_carry_i_7_n_0
    );
led0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms(1),
      I1 => high_duty_cnt(1),
      I2 => cnt_1ms(0),
      I3 => high_duty_cnt(0),
      O => led0_carry_i_8_n_0
    );
led_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => led0,
      I1 => Q(0),
      O => led
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_slave_lite_v1_0_S00_AXI is
  port (
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    axi_rvalid_reg_0 : out STD_LOGIC;
    led : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_slave_lite_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_slave_lite_v1_0_S00_AXI is
  signal \FSM_sequential_state_read[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_write[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_write[1]_i_1_n_0\ : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \axi_awaddr_reg_n_0_[3]\ : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_awready_i_2_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^axi_rvalid_reg_0\ : STD_LOGIC;
  signal axi_wready_i_1_n_0 : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \slv_reg0[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg0_reg_n_0_[9]\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_2_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal state_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal state_write : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal u_breath_led_top_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[0]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[1]\ : label is "Idle:00,Rdata:10,Raddr:01";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_state_write[1]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[0]\ : label is "Idle:00,Wdata:10,Waddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_write_reg[1]\ : label is "Idle:00,Wdata:10,Waddr:01";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of axi_bvalid_i_2 : label is "soft_lutpair3";
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_rvalid_reg_0 <= \^axi_rvalid_reg_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
\FSM_sequential_state_read[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0007777FFFF"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => s00_axi_rready,
      I3 => \^axi_rvalid_reg_0\,
      I4 => state_read(0),
      I5 => state_read(1),
      O => \FSM_sequential_state_read[0]_i_1_n_0\
    );
\FSM_sequential_state_read[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0FFF88880000"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => s00_axi_rready,
      I3 => \^axi_rvalid_reg_0\,
      I4 => state_read(0),
      I5 => state_read(1),
      O => \FSM_sequential_state_read[1]_i_1_n_0\
    );
\FSM_sequential_state_read_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state_read[0]_i_1_n_0\,
      Q => state_read(0),
      R => u_breath_led_top_n_0
    );
\FSM_sequential_state_read_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state_read[1]_i_1_n_0\,
      Q => state_read(1),
      R => u_breath_led_top_n_0
    );
\FSM_sequential_state_write[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF0F7FF"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => s00_axi_awvalid,
      I2 => s00_axi_wvalid,
      I3 => state_write(0),
      I4 => state_write(1),
      O => \FSM_sequential_state_write[0]_i_1_n_0\
    );
\FSM_sequential_state_write[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0F0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_wvalid,
      I3 => state_write(0),
      I4 => state_write(1),
      O => \FSM_sequential_state_write[1]_i_1_n_0\
    );
\FSM_sequential_state_write_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state_write[0]_i_1_n_0\,
      Q => state_write(0),
      R => u_breath_led_top_n_0
    );
\FSM_sequential_state_write_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_sequential_state_write[1]_i_1_n_0\,
      Q => state_write(1),
      R => u_breath_led_top_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_aresetn,
      I2 => axi_arready0,
      I3 => state_read(0),
      I4 => state_read(1),
      I5 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_aresetn,
      I2 => axi_arready0,
      I3 => state_read(0),
      I4 => state_read(1),
      I5 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => '0'
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => '0'
    );
axi_arready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C4C4C4FFCFCFCF"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => state_read(1),
      I3 => s00_axi_rready,
      I4 => \^axi_rvalid_reg_0\,
      I5 => state_read(0),
      O => axi_arready_i_1_n_0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready_i_1_n_0,
      Q => \^axi_arready_reg_0\,
      R => u_breath_led_top_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => state_write(1),
      I2 => state_write(0),
      I3 => s00_axi_awvalid,
      I4 => \^axi_awready_reg_0\,
      I5 => \axi_awaddr_reg_n_0_[2]\,
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => state_write(1),
      I2 => state_write(0),
      I3 => s00_axi_awvalid,
      I4 => \^axi_awready_reg_0\,
      I5 => \axi_awaddr_reg_n_0_[3]\,
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => \axi_awaddr_reg_n_0_[2]\,
      R => u_breath_led_top_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => \axi_awaddr_reg_n_0_[3]\,
      R => u_breath_led_top_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCC4FFCF"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      I2 => state_write(1),
      I3 => s00_axi_wvalid,
      I4 => state_write(0),
      O => axi_awready_i_2_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready_i_2_n_0,
      Q => \^axi_awready_reg_0\,
      R => u_breath_led_top_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFF3838C3FF0000"
    )
        port map (
      I0 => \axi_awready0__0\,
      I1 => state_write(0),
      I2 => state_write(1),
      I3 => s00_axi_bready,
      I4 => \^s00_axi_bvalid\,
      I5 => s00_axi_wvalid,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => \^axi_awready_reg_0\,
      O => \axi_awready0__0\
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => u_breath_led_top_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFFFF00800080"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => state_read(0),
      I3 => state_read(1),
      I4 => s00_axi_rready,
      I5 => \^axi_rvalid_reg_0\,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^axi_rvalid_reg_0\,
      R => u_breath_led_top_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => state_write(1),
      I1 => state_write(0),
      I2 => \^s00_axi_wready\,
      O => axi_wready_i_1_n_0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready_i_1_n_0,
      Q => \^s00_axi_wready\,
      R => u_breath_led_top_n_0
    );
\s00_axi_rdata[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => slv_reg3(0),
      I2 => slv_reg1(0),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg0(0),
      O => s00_axi_rdata(0)
    );
\s00_axi_rdata[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[10]\,
      I1 => slv_reg1(10),
      I2 => slv_reg2(10),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(10),
      O => s00_axi_rdata(10)
    );
\s00_axi_rdata[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[11]\,
      I1 => slv_reg1(11),
      I2 => slv_reg2(11),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(11),
      O => s00_axi_rdata(11)
    );
\s00_axi_rdata[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(12),
      I1 => slv_reg3(12),
      I2 => slv_reg1(12),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[12]\,
      O => s00_axi_rdata(12)
    );
\s00_axi_rdata[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => slv_reg2(13),
      I1 => slv_reg3(13),
      I2 => \slv_reg0_reg_n_0_[13]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(13),
      O => s00_axi_rdata(13)
    );
\s00_axi_rdata[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => slv_reg2(14),
      I1 => slv_reg3(14),
      I2 => \slv_reg0_reg_n_0_[14]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(14),
      O => s00_axi_rdata(14)
    );
\s00_axi_rdata[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[15]\,
      I1 => slv_reg1(15),
      I2 => slv_reg2(15),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(15),
      O => s00_axi_rdata(15)
    );
\s00_axi_rdata[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(16),
      I1 => slv_reg3(16),
      I2 => slv_reg1(16),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[16]\,
      O => s00_axi_rdata(16)
    );
\s00_axi_rdata[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[17]\,
      I1 => slv_reg1(17),
      I2 => slv_reg2(17),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(17),
      O => s00_axi_rdata(17)
    );
\s00_axi_rdata[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[18]\,
      I1 => slv_reg1(18),
      I2 => slv_reg2(18),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(18),
      O => s00_axi_rdata(18)
    );
\s00_axi_rdata[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[19]\,
      I1 => slv_reg1(19),
      I2 => slv_reg2(19),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(19),
      O => s00_axi_rdata(19)
    );
\s00_axi_rdata[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[1]\,
      I1 => slv_reg1(1),
      I2 => slv_reg2(1),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(1),
      O => s00_axi_rdata(1)
    );
\s00_axi_rdata[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(20),
      I1 => slv_reg3(20),
      I2 => slv_reg1(20),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[20]\,
      O => s00_axi_rdata(20)
    );
\s00_axi_rdata[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[21]\,
      I1 => slv_reg1(21),
      I2 => slv_reg2(21),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(21),
      O => s00_axi_rdata(21)
    );
\s00_axi_rdata[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[22]\,
      I1 => slv_reg1(22),
      I2 => slv_reg2(22),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(22),
      O => s00_axi_rdata(22)
    );
\s00_axi_rdata[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[23]\,
      I1 => slv_reg1(23),
      I2 => slv_reg2(23),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(23),
      O => s00_axi_rdata(23)
    );
\s00_axi_rdata[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => slv_reg2(24),
      I1 => slv_reg3(24),
      I2 => \slv_reg0_reg_n_0_[24]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(24),
      O => s00_axi_rdata(24)
    );
\s00_axi_rdata[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[25]\,
      I1 => slv_reg1(25),
      I2 => slv_reg2(25),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(25),
      O => s00_axi_rdata(25)
    );
\s00_axi_rdata[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[26]\,
      I1 => slv_reg1(26),
      I2 => slv_reg2(26),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(26),
      O => s00_axi_rdata(26)
    );
\s00_axi_rdata[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(27),
      I1 => slv_reg3(27),
      I2 => slv_reg1(27),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[27]\,
      O => s00_axi_rdata(27)
    );
\s00_axi_rdata[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAFFF0CCAA00F0"
    )
        port map (
      I0 => slv_reg2(28),
      I1 => slv_reg3(28),
      I2 => \slv_reg0_reg_n_0_[28]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(28),
      O => s00_axi_rdata(28)
    );
\s00_axi_rdata[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[29]\,
      I1 => slv_reg1(29),
      I2 => slv_reg2(29),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(29),
      O => s00_axi_rdata(29)
    );
\s00_axi_rdata[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[2]\,
      I1 => slv_reg1(2),
      I2 => slv_reg2(2),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(2),
      O => s00_axi_rdata(2)
    );
\s00_axi_rdata[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(30),
      I1 => slv_reg3(30),
      I2 => slv_reg1(30),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[30]\,
      O => s00_axi_rdata(30)
    );
\s00_axi_rdata[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAAF0CC00AAF0CC"
    )
        port map (
      I0 => slv_reg1(31),
      I1 => \slv_reg0_reg_n_0_[31]\,
      I2 => slv_reg2(31),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(31),
      O => s00_axi_rdata(31)
    );
\s00_axi_rdata[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[3]\,
      I1 => slv_reg1(3),
      I2 => slv_reg2(3),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(3),
      O => s00_axi_rdata(3)
    );
\s00_axi_rdata[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(4),
      I1 => slv_reg3(4),
      I2 => slv_reg1(4),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[4]\,
      O => s00_axi_rdata(4)
    );
\s00_axi_rdata[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[5]\,
      I1 => slv_reg1(5),
      I2 => slv_reg2(5),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(5),
      O => s00_axi_rdata(5)
    );
\s00_axi_rdata[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[6]\,
      I1 => slv_reg1(6),
      I2 => slv_reg2(6),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(6),
      O => s00_axi_rdata(6)
    );
\s00_axi_rdata[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \slv_reg0_reg_n_0_[7]\,
      I1 => slv_reg1(7),
      I2 => slv_reg2(7),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(7),
      O => s00_axi_rdata(7)
    );
\s00_axi_rdata[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAAF0FFCCAAF000"
    )
        port map (
      I0 => slv_reg2(8),
      I1 => slv_reg3(8),
      I2 => slv_reg1(8),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => \slv_reg0_reg_n_0_[8]\,
      O => s00_axi_rdata(8)
    );
\s00_axi_rdata[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAAF0CC00AAF0CC"
    )
        port map (
      I0 => slv_reg1(9),
      I1 => \slv_reg0_reg_n_0_[9]\,
      I2 => slv_reg2(9),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg3(9),
      O => s00_axi_rdata(9)
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002220200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => s00_axi_wstrb(1),
      O => \slv_reg0[15]_i_1_n_0\
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002220200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => s00_axi_wstrb(2),
      O => \slv_reg0[23]_i_1_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002220200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => s00_axi_wstrb(3),
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002220200000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => s00_axi_wstrb(0),
      O => \slv_reg0[7]_i_1_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg0_reg_n_0_[10]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg0_reg_n_0_[11]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg0_reg_n_0_[12]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg0_reg_n_0_[13]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg0_reg_n_0_[14]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg0_reg_n_0_[15]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg0_reg_n_0_[16]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg0_reg_n_0_[17]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg0_reg_n_0_[18]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg0_reg_n_0_[19]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg0_reg_n_0_[1]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg0_reg_n_0_[20]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg0_reg_n_0_[21]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg0_reg_n_0_[22]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg0_reg_n_0_[23]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg0_reg_n_0_[24]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg0_reg_n_0_[25]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg0_reg_n_0_[26]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg0_reg_n_0_[27]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg0_reg_n_0_[28]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg0_reg_n_0_[29]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg0_reg_n_0_[2]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg0_reg_n_0_[30]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg0_reg_n_0_[31]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg0_reg_n_0_[3]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg0_reg_n_0_[4]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg0_reg_n_0_[5]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg0_reg_n_0_[6]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg0_reg_n_0_[7]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg0_reg_n_0_[8]\,
      R => u_breath_led_top_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg0[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg0_reg_n_0_[9]\,
      R => u_breath_led_top_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020200000002000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(1),
      I3 => \axi_awaddr_reg_n_0_[2]\,
      I4 => s00_axi_awvalid,
      I5 => s00_axi_awaddr(0),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020200000002000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(2),
      I3 => \axi_awaddr_reg_n_0_[2]\,
      I4 => s00_axi_awvalid,
      I5 => s00_axi_awaddr(0),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020200000002000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(3),
      I3 => \axi_awaddr_reg_n_0_[2]\,
      I4 => s00_axi_awvalid,
      I5 => s00_axi_awaddr(0),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_awvalid,
      I2 => \axi_awaddr_reg_n_0_[3]\,
      O => \slv_reg1[31]_i_2_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020200000002000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(0),
      I3 => \axi_awaddr_reg_n_0_[2]\,
      I4 => s00_axi_awvalid,
      I5 => s00_axi_awaddr(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg1(1),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg1(2),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg1(3),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg1(4),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg1(5),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg1(6),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg1(7),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => u_breath_led_top_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => u_breath_led_top_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000808080"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(1),
      I3 => s00_axi_awaddr(0),
      I4 => s00_axi_awvalid,
      I5 => \axi_awaddr_reg_n_0_[2]\,
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000808080"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(2),
      I3 => s00_axi_awaddr(0),
      I4 => s00_axi_awvalid,
      I5 => \axi_awaddr_reg_n_0_[2]\,
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000808080"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(3),
      I3 => s00_axi_awaddr(0),
      I4 => s00_axi_awvalid,
      I5 => \axi_awaddr_reg_n_0_[2]\,
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000808080"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \slv_reg1[31]_i_2_n_0\,
      I2 => s00_axi_wstrb(0),
      I3 => s00_axi_awaddr(0),
      I4 => s00_axi_awvalid,
      I5 => \axi_awaddr_reg_n_0_[2]\,
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg2(10),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg2(11),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg2(12),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg2(13),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg2(14),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg2(15),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg2(1),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg2(2),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg2(3),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg2(4),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg2(5),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg2(6),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg2(7),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg2(8),
      R => u_breath_led_top_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg2(9),
      R => u_breath_led_top_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880008000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(1),
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => \slv_reg1[31]_i_2_n_0\,
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880008000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(2),
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => \slv_reg1[31]_i_2_n_0\,
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880008000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(3),
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => \slv_reg1[31]_i_2_n_0\,
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880008000000000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_wstrb(0),
      I2 => \axi_awaddr_reg_n_0_[2]\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_awaddr(0),
      I5 => \slv_reg1[31]_i_2_n_0\,
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => u_breath_led_top_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => u_breath_led_top_n_0
    );
u_breath_led_top: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_top
     port map (
      Q(0) => slv_reg0(0),
      SR(0) => u_breath_led_top_n_0,
      \freq_set_reg_reg[9]_0\(9 downto 0) => slv_reg1(9 downto 0),
      led => led,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led is
  port (
    axi_awready_reg : out STD_LOGIC;
    axi_arready_reg : out STD_LOGIC;
    axi_rvalid_reg : out STD_LOGIC;
    led : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led is
begin
breath_led_slave_lite_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led_slave_lite_v1_0_S00_AXI
     port map (
      axi_arready_reg_0 => axi_arready_reg,
      axi_awready_reg_0 => axi_awready_reg,
      axi_rvalid_reg_0 => axi_rvalid_reg,
      led => led,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    led : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "zynq_breath_led_0_0,breath_led,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "breath_led,Vivado 2025.1.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s00_axi_aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_MODE of s00_axi_aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_MODE of s00_axi_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s00_axi_awaddr : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_breath_led
     port map (
      axi_arready_reg => s00_axi_arready,
      axi_awready_reg => s00_axi_awready,
      axi_rvalid_reg => s00_axi_rvalid,
      led => led,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
