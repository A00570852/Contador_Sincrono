library ieee;
use ieee.std_logic_1164.all;

entity flipflop_J_K is
  port(
    J, K: in std_logic;
    CLK:  in std_logic;
    RES:  in std_logic;
    Q:  out std_logic;
    nQ: out std_logic);
end flipflop_J_K;

architecture behavioral of flipflop_J_K is

  signal Qs: std_logic := '0';

  begin
    process (CLK)
    begin

      if RES = '1' then
          Qs <= '0';
      else

        if CLK = '1' and CLK'event then
          if (J = '0') and (K = '0') then
            Qs <= Qs;
          elsif (J = '0') and (K = '1') then
            Qs <= '0';
          elsif (J = '1') and (K = '0') then
            Qs <= '1';
          elsif (J = '1') and (K = '1') then
            Qs <= not Qs;
          else null;
          end if;
        else null;
      end if;
    end if;

    Q  <= Qs;
    nQ <= not Qs;

  end process;

end behavioral;
