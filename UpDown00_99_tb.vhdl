library ieee;
use ieee.std_logic_1164.all;

entity UpDown00_99_tb is
end entity;

architecture arch of UpDown00_99_tb is
  component upDown00_99 is
    port (Mode: in std_logic;
          CLK : in std_logic;
          CounterUP   : out std_logic_vector(7 downto 0);
          CounterDOWN : out std_logic_vector(7 downto 0));
  end component;

  signal sMode: std_logic := '1';
  signal sCLK : std_logic := '0';
  signal sCup : std_logic_vector(7 downto 0) :="00000000";
  signal sCdown:std_logic_vector(7 downto 0) :="00000000";

  begin
      UUT: upDown00_99 port map (sMode, sCLK, sCup, sCdown);

      CLK_Process : Process
      begin
        sCLK <= '0';
        wait for 10 ns;
        sCLK <= '1';
        wait for 10 ns;
      end process;
end arch;
