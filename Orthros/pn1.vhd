library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity Pn1 is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Pn1;


architecture p1 of Pn1 is

  subtype Int5Type is integer range 0 to 31;
  type Int5Array is array (0 to 31) of Int5Type;
  constant P : Int5Array := (
        
10,27,5,1,30,23,16,13,21,31,6,14,0,25,11,18,
15,28,19,24,7,8,22,3,4,29,9,2,26,20,12,17
);
 
    signal X,O: std_logic_vector(127 downto 0);
begin   

l:  for i in 0 to 31 generate 
  X(4*i+3 downto 4*i)<= InpxDI (127-4*i downto 124-4*i);
  O(4*P(i)+3 downto 4*P(i)) <= X(4*i+3 downto 4*i);
  OupxDO(4*i+3 downto 4*i)<= O (127-4*i downto 124-4*i);
end generate l; 
  

end architecture p1;
