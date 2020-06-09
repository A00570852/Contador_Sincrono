library ieee;
use ieee.std_logic_1164.all;

entity upDownCont is
  port (Mode: in std_logic;
        CLK : in std_logic;
        RES : in std_logic;
        En  : in std_logic;
        Qdown   : out std_logic_vector (3 downto 0);
        Qup     : out std_logic_vector (3 downto 0));
end entity;

architecture arch of upDownCont is

  component flipflop_J_K is
    port(
      J, K: in std_logic;
      CLK:  in std_logic;
      RES:  in std_logic;
      Q:  out std_logic;
      nQ: out std_logic);
  end component;

  signal Qd: std_logic_vector(3 downto 0)    := "0000";
  signal Qu  : std_logic_vector(3 downto 0)  := "0000";
  signal or1  : std_logic   := '0';
  signal or2  : std_logic   := '0';
  signal or3  : std_logic   := '0';
  signal and1U : std_logic  := '0';
  signal and2U : std_logic  := '0';
  signal and3U : std_logic  := '0';
  signal and1D : std_logic  := '0';
  signal and2D : std_logic  := '0';
  signal and3D : std_logic  := '0';


  begin

    Q0: flipflop_J_K port map (En, En, CLK, RES, Qu(0), Qd(0));
    and1U <= (Qu(0) and Mode);
    and1D <= (Qd(0) and not Mode);
    or1   <= and1U or and1D;
    Q1: flipflop_J_K port map (or1, or1, CLK, RES, Qu(1), Qd(1));
    and2U <= (Qu(1) and and1U);
    and2D <= (Qd(1) and and1D);
    or2   <= and2U or and2D;
    Q2: flipflop_J_K port map (or2, or2, CLK, RES, Qu(2), Qd(2));
    and3U <= (Qu(2) and and2U);
    and3D <= (Qd(2) and and2D);
    or3   <= and3U or and3D;
    Q3: flipflop_J_K port map (or3, or3, CLK, RES, Qu(3), Qd(3));

    Qdown <= Qd;
    Qup   <= Qu;

end arch;
