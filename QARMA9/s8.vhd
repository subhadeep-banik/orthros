library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;

entity s8 is
  
  port (
    InpxDI : in  std_logic_vector(7 downto 0);
    OupxDO : out std_logic_vector(7 downto 0)
    );

end s8;


architecture com of s8 is

signal AxD: std_logic_vector(7 downto 0);
  
begin   

 
s1: entity sbox(lookuptable) port map (InpxDI (7 downto 4 ), AxD(7 downto 4)); 
s0: entity sbox(lookuptable) port map (InpxDI (3 downto 0 ), AxD(3 downto 0)); 
  

OupxDO(7) <= AxD(7); 
OupxDO(6) <= AxD(3); 
OupxDO(5) <= AxD(6); 
OupxDO(4) <= AxD(2); 
OupxDO(3) <= AxD(5); 
OupxDO(2) <= AxD(1);  
OupxDO(1) <= AxD(4); 
OupxDO(0) <= AxD(0); 

end architecture com;

