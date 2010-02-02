library ieee;
use ieee.std_logic_1164.all;

entity gnd is
  port ( o: out std_logic);
end gnd;

architecture arch of gnd is

begin

  o <= '0';

end arch;

library ieee;
use ieee.std_logic_1164.all;

entity vdd is
  port ( o: out std_logic);
end vdd;

architecture arch of vdd is

begin
  
  o <= '1';

end arch;


library ieee;
use ieee.std_logic_1164.all;

entity wire is
port ( i : in std_logic; o : out std_logic);
end wire;

architecture arch of wire is

begin  -- arch

  o <= i;

end arch;


library ieee;

use ieee.std_logic_1164.all;


entity invG is
port ( i : in std_logic; o : out std_logic);
end invG;

architecture a of invG is

begin

  o <= not i;

end a;



library ieee;

use ieee.std_logic_1164.all;


entity dff is
port (CLK, D        : in std_logic;
         Q          : out std_logic:='0');
end dff;

architecture arch of dff is
begin
      process
      begin
          wait until CLK'event and CLK='1';
          Q <= D;
      end process;
end arch;


library ieee;
use ieee.std_logic_1164.all;

entity orG is
 port (a,b : in std_logic; o : out std_logic);
end orG;

architecture arch of orG is

begin

  o <= a or b;

end arch;


library ieee;
use ieee.std_logic_1164.all;


entity xorG is
 port (a,b : in std_logic; o : out std_logic);
end xorG;
architecture arch of xorG is

begin  

  o <= a xor b;

end arch;


library ieee;
use ieee.std_logic_1164.all;


entity andG is
 port (a,b : in std_logic; o : out std_logic);
end andG;

architecture arch of andG is

begin  

  o <= a and b;

end arch;


