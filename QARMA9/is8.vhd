library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;


entity is8 is
  
  port (
    InpxDI : in  std_logic_vector(7 downto 0);
    OupxDO : out std_logic_vector(7 downto 0)
    );

end is8;


architecture icom of is8 is

signal AxD: std_logic_vector(7 downto 0);
  
begin   

 
s1: entity sbox(lookuptable) port map (AxD (7 downto 4 ), OupxDO(7 downto 4)); 
s0: entity sbox(lookuptable) port map (AxD (3 downto 0 ), OupxDO(3 downto 0)); 
  

AxD(7) <= InpxDI (7); 
AxD(6) <= InpxDI (5); 
AxD(5) <= InpxDI (3); 
AxD(4) <= InpxDI (1); 
AxD(3) <= InpxDI (6); 
AxD(2) <= InpxDI (4);  
AxD(1) <= InpxDI (2); 
AxD(0) <= InpxDI (0); 

end architecture icom;

