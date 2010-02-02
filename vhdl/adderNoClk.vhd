library ieee;

use ieee.std_logic_1164.all;

entity
  adderNoClk
is
port
  ( 
 
    
    cin : in std_logic
  ; a_0 : in std_logic
  ; a_1 : in std_logic
  ; a_2 : in std_logic
  ; a_3 : in std_logic
  ; b_0 : in std_logic
  ; b_1 : in std_logic
  ; b_2 : in std_logic
  ; b_3 : in std_logic

  
  ; sum_0 : out std_logic
  ; sum_1 : out std_logic
  ; sum_2 : out std_logic
  ; sum_3 : out std_logic
  ; cout : out std_logic
  );
end adderNoClk;

architecture
  structural
of
  adderNoClk
is
  signal w1 : std_logic;
  signal w2 : std_logic;
  signal w3 : std_logic;
  signal w4 : std_logic;
  signal w5 : std_logic;
  signal w6 : std_logic;
  signal w7 : std_logic;
  signal w8 : std_logic;
  signal w9 : std_logic;
  signal w10 : std_logic;
  signal w11 : std_logic;
  signal w12 : std_logic;
  signal w13 : std_logic;
  signal w14 : std_logic;
  signal w15 : std_logic;
  signal w16 : std_logic;
  signal w17 : std_logic;
  signal w18 : std_logic;
  signal w19 : std_logic;
  signal w20 : std_logic;
  signal w21 : std_logic;
  signal w22 : std_logic;
  signal w23 : std_logic;
  signal w24 : std_logic;
  signal w25 : std_logic;
  signal w26 : std_logic;
  signal w27 : std_logic;
  signal w28 : std_logic;
  signal w29 : std_logic;
begin
  c_w2      : entity work.wire  port map (cin, w2);
  c_w4      : entity work.wire  port map (a_0, w4);
  c_w5      : entity work.wire  port map (b_0, w5);
  c_w3      : entity work.xorG  port map (w4, w5, w3);
  c_w1      : entity work.xorG  port map (w2, w3, w1);
  c_w8      : entity work.andG  port map (w2, w3, w8);
  c_w9      : entity work.andG  port map (w4, w5, w9);
  c_w7      : entity work.xorG  port map (w8, w9, w7);
  c_w11     : entity work.wire  port map (a_1, w11);
  c_w12     : entity work.wire  port map (b_1, w12);
  c_w10     : entity work.xorG  port map (w11, w12, w10);
  c_w6      : entity work.xorG  port map (w7, w10, w6);
  c_w15     : entity work.andG  port map (w7, w10, w15);
  c_w16     : entity work.andG  port map (w11, w12, w16);
  c_w14     : entity work.xorG  port map (w15, w16, w14);
  c_w18     : entity work.wire  port map (a_2, w18);
  c_w19     : entity work.wire  port map (b_2, w19);
  c_w17     : entity work.xorG  port map (w18, w19, w17);
  c_w13     : entity work.xorG  port map (w14, w17, w13);
  c_w22     : entity work.andG  port map (w14, w17, w22);
  c_w23     : entity work.andG  port map (w18, w19, w23);
  c_w21     : entity work.xorG  port map (w22, w23, w21);
  c_w25     : entity work.wire  port map (a_3, w25);
  c_w26     : entity work.wire  port map (b_3, w26);
  c_w24     : entity work.xorG  port map (w25, w26, w24);
  c_w20     : entity work.xorG  port map (w21, w24, w20);
  c_w28     : entity work.andG  port map (w21, w24, w28);
  c_w29     : entity work.andG  port map (w25, w26, w29);
  c_w27     : entity work.xorG  port map (w28, w29, w27);

  
  c_sum_0   : entity work.wire  port map (w1, sum_0);
  c_sum_1   : entity work.wire  port map (w6, sum_1);
  c_sum_2   : entity work.wire  port map (w13, sum_2);
  c_sum_3   : entity work.wire  port map (w20, sum_3);
  c_cout    : entity work.wire  port map (w27, cout);
end structural;
