-- Generated by Lava 2000

use work.all;

entity
  adder2
is
port
  -- clock
  ( clk : in bit

  -- inputs
  ; cin : in bit
  ; a : in bit
  ; b : in bit

  -- outputs
  ; sum_0 : out bit
  ; sum_1 : out bit
  ; cout : out bit
  );
end entity adder2;

architecture
  structural
of
  adder2
is
  signal w1 : bit;
  signal w2 : bit;
  signal w3 : bit;
  signal w4 : bit;
  signal w5 : bit;
  signal w6 : bit;
  signal w7 : bit;
  signal w8 : bit;
begin
  c_w2      : entity id    port map (clk, cin, w2);
  c_w4      : entity id    port map (clk, a, w4);
  c_w5      : entity id    port map (clk, b, w5);
  c_w3      : entity xor2  port map (clk, w4, w5, w3);
  c_w1      : entity xor2  port map (clk, w2, w3, w1);
  c_w7      : entity and2  port map (clk, w2, w3, w7);
  c_w8      : entity and2  port map (clk, w4, w5, w8);
  c_w6      : entity xor2  port map (clk, w7, w8, w6);

  -- naming outputs
  c_sum_0   : entity id    port map (clk, w1, sum_0);
  c_sum_1   : entity id    port map (clk, w6, sum_1);
end structural;
