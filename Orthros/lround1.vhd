library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity Lround1 is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    KeyxDI : in  std_logic_vector(127 downto 0);
    RCxDI  : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Lround1;


architecture lr of Lround1 is


signal SxD,PxD,MxD: std_logic_vector(127 downto 0);

begin



s0: entity Slayer (sl) port map(InpxDI,SxD);

p0: entity Pbl (p) port map(SxD,PxD);

m0: entity Matmult (m00) port map(PxD,MxD);

OupxDO <= MxD xor KeyxDI xor RCxDI;







end architecture lr; 
