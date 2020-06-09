library ieee;
use ieee.std_logic_1164.all;

entity upDown00_99 is
  port (Mode: in std_logic;
        CLK : in std_logic;
        CounterUP   : out std_logic_vector(7 downto 0);
        CounterDOWN : out std_logic_vector(7 downto 0));
end entity;

architecture arch of upDown00_99 is
  component upDownCont is
    port (Mode: in std_logic;
          CLK : in std_logic;
          RES : in std_logic;
          En:   in std_logic;
          Qdown   : out std_logic_vector (3 downto 0);
          Qup     : out std_logic_vector (3 downto 0));
  end component;

  signal andEn1 : std_logic;
  signal andEn2 : std_logic;
  signal Qd    : std_logic_vector(7 downto 0);
  signal Qu    : std_logic_vector(7 downto 0);
  signal Qen   : std_logic;
  signal ign   : std_logic;
  signal notAnden1: std_logic;
  begin
    andEn1 <= Qu(1) and Qu(3);
    andEn2 <= Qu(5) and Qu(7);
    notAnden1 <= not andEn1;

    C1: upDownCont   port map (Mode,
                                CLK,
                                andEn1,
                                notAnden1,
                                Qd(3 downto 0),
                                Qu(3 downto 0));
    C2: upDownCont   port map (Mode, CLK, andEn2, andEn1, Qd(7 downto 4), Qu(7 downto 4));

    CounterUP   <= Qu;
    CounterDOWN <= Qd;
end arch;
