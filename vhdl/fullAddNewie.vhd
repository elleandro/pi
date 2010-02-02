library ieee;

use ieee.std_logic_1164.all;

entity
  fullAddNewie
is
port
  ( 
 
    
    cin : in std_logic
  ; a : in std_logic
  ; b : in std_logic

  
  ; sum : out std_logic
  ; cout : out std_logic
  );
end fullAddNewie;

architecture
  structural
of
  fullAddNewie
is
  signal w1 : std_logic;
  signal w2 : std_logic;
  signal w3 : std_logic;
  signal w4 : std_logic;
  signal w5 : std_logic;
  signal w6 : std_logic;
  signal w7 : std_logic;
  signal w8 : std_logic;
begin
  c_w2      : entity work.wire  port map (cin, w2);
  c_w4      : entity work.wire  port map (a, w4);
  c_w5      : entity work.wire  port map (b, w5);
  c_w3      : entity work.xorG  port map (w4, w5, w3);
  c_w1      : entity work.xorG  port map (w2, w3, w1);
  c_w7      : entity work.andG  port map (w2, w3, w7);
  c_w8      : entity work.andG  port map (w4, w5, w8);
  c_w6      : entity work.xorG  port map (w7, w8, w6);

  
  c_sum     : entity work.wire  port map (w1, sum);
  c_cout    : entity work.wire  port map (w6, cout);
end structural;
