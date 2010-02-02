library ieee;

use ieee.std_logic_1164.all;

entity
  BrentKungFastAdder
is
port
  ( 
 
    
    a_0 : in std_logic
  ; a_1 : in std_logic
  ; a_2 : in std_logic
  ; a_3 : in std_logic
  ; a_4 : in std_logic
  ; a_5 : in std_logic
  ; a_6 : in std_logic
  ; a_7 : in std_logic
  ; a_8 : in std_logic
  ; a_9 : in std_logic
  ; a_10 : in std_logic
  ; a_11 : in std_logic
  ; a_12 : in std_logic
  ; a_13 : in std_logic
  ; a_14 : in std_logic
  ; a_15 : in std_logic
  ; b_0 : in std_logic
  ; b_1 : in std_logic
  ; b_2 : in std_logic
  ; b_3 : in std_logic
  ; b_4 : in std_logic
  ; b_5 : in std_logic
  ; b_6 : in std_logic
  ; b_7 : in std_logic
  ; b_8 : in std_logic
  ; b_9 : in std_logic
  ; b_10 : in std_logic
  ; b_11 : in std_logic
  ; b_12 : in std_logic
  ; b_13 : in std_logic
  ; b_14 : in std_logic
  ; b_15 : in std_logic

  
  ; sum_0 : out std_logic
  ; sum_1 : out std_logic
  ; sum_2 : out std_logic
  ; sum_3 : out std_logic
  ; sum_4 : out std_logic
  ; sum_5 : out std_logic
  ; sum_6 : out std_logic
  ; sum_7 : out std_logic
  ; sum_8 : out std_logic
  ; sum_9 : out std_logic
  ; sum_10 : out std_logic
  ; sum_11 : out std_logic
  ; sum_12 : out std_logic
  ; sum_13 : out std_logic
  ; sum_14 : out std_logic
  ; sum_15 : out std_logic
  ; cout : out std_logic
  );
end BrentKungFastAdder;

architecture
  structural
of
  BrentKungFastAdder
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
  signal w30 : std_logic;
  signal w31 : std_logic;
  signal w32 : std_logic;
  signal w33 : std_logic;
  signal w34 : std_logic;
  signal w35 : std_logic;
  signal w36 : std_logic;
  signal w37 : std_logic;
  signal w38 : std_logic;
  signal w39 : std_logic;
  signal w40 : std_logic;
  signal w41 : std_logic;
  signal w42 : std_logic;
  signal w43 : std_logic;
  signal w44 : std_logic;
  signal w45 : std_logic;
  signal w46 : std_logic;
  signal w47 : std_logic;
  signal w48 : std_logic;
  signal w49 : std_logic;
  signal w50 : std_logic;
  signal w51 : std_logic;
  signal w52 : std_logic;
  signal w53 : std_logic;
  signal w54 : std_logic;
  signal w55 : std_logic;
  signal w56 : std_logic;
  signal w57 : std_logic;
  signal w58 : std_logic;
  signal w59 : std_logic;
  signal w60 : std_logic;
  signal w61 : std_logic;
  signal w62 : std_logic;
  signal w63 : std_logic;
  signal w64 : std_logic;
  signal w65 : std_logic;
  signal w66 : std_logic;
  signal w67 : std_logic;
  signal w68 : std_logic;
  signal w69 : std_logic;
  signal w70 : std_logic;
  signal w71 : std_logic;
  signal w72 : std_logic;
  signal w73 : std_logic;
  signal w74 : std_logic;
  signal w75 : std_logic;
  signal w76 : std_logic;
  signal w77 : std_logic;
  signal w78 : std_logic;
  signal w79 : std_logic;
  signal w80 : std_logic;
  signal w81 : std_logic;
  signal w82 : std_logic;
  signal w83 : std_logic;
  signal w84 : std_logic;
  signal w85 : std_logic;
  signal w86 : std_logic;
  signal w87 : std_logic;
  signal w88 : std_logic;
  signal w89 : std_logic;
  signal w90 : std_logic;
  signal w91 : std_logic;
  signal w92 : std_logic;
  signal w93 : std_logic;
  signal w94 : std_logic;
  signal w95 : std_logic;
  signal w96 : std_logic;
  signal w97 : std_logic;
  signal w98 : std_logic;
  signal w99 : std_logic;
  signal w100 : std_logic;
  signal w101 : std_logic;
  signal w102 : std_logic;
  signal w103 : std_logic;
  signal w104 : std_logic;
  signal w105 : std_logic;
  signal w106 : std_logic;
  signal w107 : std_logic;
  signal w108 : std_logic;
  signal w109 : std_logic;
  signal w110 : std_logic;
  signal w111 : std_logic;
  signal w112 : std_logic;
  signal w113 : std_logic;
  signal w114 : std_logic;
  signal w115 : std_logic;
  signal w116 : std_logic;
  signal w117 : std_logic;
  signal w118 : std_logic;
  signal w119 : std_logic;
  signal w120 : std_logic;
  signal w121 : std_logic;
  signal w122 : std_logic;
  signal w123 : std_logic;
  signal w124 : std_logic;
  signal w125 : std_logic;
  signal w126 : std_logic;
  signal w127 : std_logic;
  signal w128 : std_logic;
  signal w129 : std_logic;
  signal w130 : std_logic;
  signal w131 : std_logic;
  signal w132 : std_logic;
  signal w133 : std_logic;
  signal w134 : std_logic;
  signal w135 : std_logic;
  signal w136 : std_logic;
  signal w137 : std_logic;
  signal w138 : std_logic;
  signal w139 : std_logic;
  signal w140 : std_logic;
  signal w141 : std_logic;
  signal w142 : std_logic;
begin
  c_w2      : entity work.wire  port map (a_0, w2);
  c_w3      : entity work.wire  port map (b_0, w3);
  c_w1      : entity work.xorG  port map (w2, w3, w1);
  c_w6      : entity work.wire  port map (a_1, w6);
  c_w7      : entity work.wire  port map (b_1, w7);
  c_w5      : entity work.xorG  port map (w6, w7, w5);
  c_w8      : entity work.andG  port map (w2, w3, w8);
  c_w4      : entity work.xorG  port map (w5, w8, w4);
  c_w11     : entity work.wire  port map (a_2, w11);
  c_w12     : entity work.wire  port map (b_2, w12);
  c_w10     : entity work.xorG  port map (w11, w12, w10);
  c_w14     : entity work.andG  port map (w6, w7, w14);
  c_w15     : entity work.andG  port map (w5, w8, w15);
  c_w13     : entity work.orG   port map (w14, w15, w13);
  c_w9      : entity work.xorG  port map (w10, w13, w9);
  c_w18     : entity work.wire  port map (a_3, w18);
  c_w19     : entity work.wire  port map (b_3, w19);
  c_w17     : entity work.xorG  port map (w18, w19, w17);
  c_w21     : entity work.andG  port map (w11, w12, w21);
  c_w22     : entity work.andG  port map (w10, w13, w22);
  c_w20     : entity work.orG   port map (w21, w22, w20);
  c_w16     : entity work.xorG  port map (w17, w20, w16);
  c_w25     : entity work.wire  port map (a_4, w25);
  c_w26     : entity work.wire  port map (b_4, w26);
  c_w24     : entity work.xorG  port map (w25, w26, w24);
  c_w29     : entity work.andG  port map (w18, w19, w29);
  c_w30     : entity work.andG  port map (w17, w21, w30);
  c_w28     : entity work.orG   port map (w29, w30, w28);
  c_w32     : entity work.andG  port map (w17, w10, w32);
  c_w31     : entity work.andG  port map (w32, w13, w31);
  c_w27     : entity work.orG   port map (w28, w31, w27);
  c_w23     : entity work.xorG  port map (w24, w27, w23);
  c_w35     : entity work.wire  port map (a_5, w35);
  c_w36     : entity work.wire  port map (b_5, w36);
  c_w34     : entity work.xorG  port map (w35, w36, w34);
  c_w38     : entity work.andG  port map (w25, w26, w38);
  c_w39     : entity work.andG  port map (w24, w27, w39);
  c_w37     : entity work.orG   port map (w38, w39, w37);
  c_w33     : entity work.xorG  port map (w34, w37, w33);
  c_w42     : entity work.wire  port map (a_6, w42);
  c_w43     : entity work.wire  port map (b_6, w43);
  c_w41     : entity work.xorG  port map (w42, w43, w41);
  c_w46     : entity work.andG  port map (w35, w36, w46);
  c_w47     : entity work.andG  port map (w34, w38, w47);
  c_w45     : entity work.orG   port map (w46, w47, w45);
  c_w49     : entity work.andG  port map (w34, w24, w49);
  c_w48     : entity work.andG  port map (w49, w27, w48);
  c_w44     : entity work.orG   port map (w45, w48, w44);
  c_w40     : entity work.xorG  port map (w41, w44, w40);
  c_w52     : entity work.wire  port map (a_7, w52);
  c_w53     : entity work.wire  port map (b_7, w53);
  c_w51     : entity work.xorG  port map (w52, w53, w51);
  c_w55     : entity work.andG  port map (w42, w43, w55);
  c_w56     : entity work.andG  port map (w41, w44, w56);
  c_w54     : entity work.orG   port map (w55, w56, w54);
  c_w50     : entity work.xorG  port map (w51, w54, w50);
  c_w59     : entity work.wire  port map (a_8, w59);
  c_w60     : entity work.wire  port map (b_8, w60);
  c_w58     : entity work.xorG  port map (w59, w60, w58);
  c_w64     : entity work.andG  port map (w52, w53, w64);
  c_w65     : entity work.andG  port map (w51, w55, w65);
  c_w63     : entity work.orG   port map (w64, w65, w63);
  c_w67     : entity work.andG  port map (w51, w41, w67);
  c_w66     : entity work.andG  port map (w67, w45, w66);
  c_w62     : entity work.orG   port map (w63, w66, w62);
  c_w69     : entity work.andG  port map (w67, w49, w69);
  c_w68     : entity work.andG  port map (w69, w27, w68);
  c_w61     : entity work.orG   port map (w62, w68, w61);
  c_w57     : entity work.xorG  port map (w58, w61, w57);
  c_w72     : entity work.wire  port map (a_9, w72);
  c_w73     : entity work.wire  port map (b_9, w73);
  c_w71     : entity work.xorG  port map (w72, w73, w71);
  c_w75     : entity work.andG  port map (w59, w60, w75);
  c_w76     : entity work.andG  port map (w58, w61, w76);
  c_w74     : entity work.orG   port map (w75, w76, w74);
  c_w70     : entity work.xorG  port map (w71, w74, w70);
  c_w79     : entity work.wire  port map (a_10, w79);
  c_w80     : entity work.wire  port map (b_10, w80);
  c_w78     : entity work.xorG  port map (w79, w80, w78);
  c_w83     : entity work.andG  port map (w72, w73, w83);
  c_w84     : entity work.andG  port map (w71, w75, w84);
  c_w82     : entity work.orG   port map (w83, w84, w82);
  c_w86     : entity work.andG  port map (w71, w58, w86);
  c_w85     : entity work.andG  port map (w86, w61, w85);
  c_w81     : entity work.orG   port map (w82, w85, w81);
  c_w77     : entity work.xorG  port map (w78, w81, w77);
  c_w89     : entity work.wire  port map (a_11, w89);
  c_w90     : entity work.wire  port map (b_11, w90);
  c_w88     : entity work.xorG  port map (w89, w90, w88);
  c_w92     : entity work.andG  port map (w79, w80, w92);
  c_w93     : entity work.andG  port map (w78, w81, w93);
  c_w91     : entity work.orG   port map (w92, w93, w91);
  c_w87     : entity work.xorG  port map (w88, w91, w87);
  c_w96     : entity work.wire  port map (a_12, w96);
  c_w97     : entity work.wire  port map (b_12, w97);
  c_w95     : entity work.xorG  port map (w96, w97, w95);
  c_w101    : entity work.andG  port map (w89, w90, w101);
  c_w102    : entity work.andG  port map (w88, w92, w102);
  c_w100    : entity work.orG   port map (w101, w102, w100);
  c_w104    : entity work.andG  port map (w88, w78, w104);
  c_w103    : entity work.andG  port map (w104, w82, w103);
  c_w99     : entity work.orG   port map (w100, w103, w99);
  c_w106    : entity work.andG  port map (w104, w86, w106);
  c_w105    : entity work.andG  port map (w106, w61, w105);
  c_w98     : entity work.orG   port map (w99, w105, w98);
  c_w94     : entity work.xorG  port map (w95, w98, w94);
  c_w109    : entity work.wire  port map (a_13, w109);
  c_w110    : entity work.wire  port map (b_13, w110);
  c_w108    : entity work.xorG  port map (w109, w110, w108);
  c_w112    : entity work.andG  port map (w96, w97, w112);
  c_w113    : entity work.andG  port map (w95, w98, w113);
  c_w111    : entity work.orG   port map (w112, w113, w111);
  c_w107    : entity work.xorG  port map (w108, w111, w107);
  c_w116    : entity work.wire  port map (a_14, w116);
  c_w117    : entity work.wire  port map (b_14, w117);
  c_w115    : entity work.xorG  port map (w116, w117, w115);
  c_w120    : entity work.andG  port map (w109, w110, w120);
  c_w121    : entity work.andG  port map (w108, w112, w121);
  c_w119    : entity work.orG   port map (w120, w121, w119);
  c_w123    : entity work.andG  port map (w108, w95, w123);
  c_w122    : entity work.andG  port map (w123, w98, w122);
  c_w118    : entity work.orG   port map (w119, w122, w118);
  c_w114    : entity work.xorG  port map (w115, w118, w114);
  c_w126    : entity work.wire  port map (a_15, w126);
  c_w127    : entity work.wire  port map (b_15, w127);
  c_w125    : entity work.xorG  port map (w126, w127, w125);
  c_w129    : entity work.andG  port map (w116, w117, w129);
  c_w130    : entity work.andG  port map (w115, w118, w130);
  c_w128    : entity work.orG   port map (w129, w130, w128);
  c_w124    : entity work.xorG  port map (w125, w128, w124);
  c_w135    : entity work.andG  port map (w126, w127, w135);
  c_w136    : entity work.andG  port map (w125, w129, w136);
  c_w134    : entity work.orG   port map (w135, w136, w134);
  c_w138    : entity work.andG  port map (w125, w115, w138);
  c_w137    : entity work.andG  port map (w138, w119, w137);
  c_w133    : entity work.orG   port map (w134, w137, w133);
  c_w140    : entity work.andG  port map (w138, w123, w140);
  c_w139    : entity work.andG  port map (w140, w99, w139);
  c_w132    : entity work.orG   port map (w133, w139, w132);
  c_w142    : entity work.andG  port map (w140, w106, w142);
  c_w141    : entity work.andG  port map (w142, w61, w141);
  c_w131    : entity work.orG   port map (w132, w141, w131);

  
  c_sum_0   : entity work.wire  port map (w1, sum_0);
  c_sum_1   : entity work.wire  port map (w4, sum_1);
  c_sum_2   : entity work.wire  port map (w9, sum_2);
  c_sum_3   : entity work.wire  port map (w16, sum_3);
  c_sum_4   : entity work.wire  port map (w23, sum_4);
  c_sum_5   : entity work.wire  port map (w33, sum_5);
  c_sum_6   : entity work.wire  port map (w40, sum_6);
  c_sum_7   : entity work.wire  port map (w50, sum_7);
  c_sum_8   : entity work.wire  port map (w57, sum_8);
  c_sum_9   : entity work.wire  port map (w70, sum_9);
  c_sum_10  : entity work.wire  port map (w77, sum_10);
  c_sum_11  : entity work.wire  port map (w87, sum_11);
  c_sum_12  : entity work.wire  port map (w94, sum_12);
  c_sum_13  : entity work.wire  port map (w107, sum_13);
  c_sum_14  : entity work.wire  port map (w114, sum_14);
  c_sum_15  : entity work.wire  port map (w124, sum_15);
  c_cout    : entity work.wire  port map (w131, cout);
end structural;
