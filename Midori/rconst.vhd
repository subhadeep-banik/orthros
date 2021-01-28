library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity Rconst is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    RCxDI  : in  std_logic_vector(15 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Rconst;


architecture rc of Rconst is


signal A1xD,A2xD,A3xD, A4xD,A5xD,A6xD: std_logic_vector(4 downto 0);
  
begin   

loop1: for i in 0 to 15 generate
  
  OupxDO(8*i) <= InpxDI(8*i) xor RCxDI(i);

end generate loop1;

loop2: for i in 0 to 15 generate
  
  loop3: for j in 1 to 7  generate
  
  
      OupxDO(8*i+j) <= InpxDI(8*i+j);
      
  end generate loop3;
    

end generate loop2;
  
 

end architecture rc;
