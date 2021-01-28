library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity Fround is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    KeyxDI : in  std_logic_vector(127 downto 0);
    RCxDI  : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Fround;


architecture fr of Fround is


signal SxD : std_logic_vector(127 downto 0);

begin



s0: entity Slayer (sl) port map(InpxDI,SxD);

 

OupxDO <= SxD xor KeyxDI xor RCxDI ;







end architecture fr; 
