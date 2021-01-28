library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity Pn2 is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Pn2;


architecture p2 of Pn2 is

  subtype Int5Type is integer range 0 to 31;
  type Int5Array is array (0 to 31) of Int5Type;
  constant P : Int5Array := (
        
 26,13,7,11,29,0,17,21,23,5,18,25,12,10,28,2,
	14,19,24,22,1,8,4,31,15,6,27,9,16,30,20,3
);
 
signal X,O: std_logic_vector(127 downto 0); 
begin   

l:  for i in 0 to 31 generate 

  X(4*i+3 downto 4*i)<= InpxDI (127-4*i downto 124-4*i);
  O(4*P(i)+3 downto 4*P(i)) <= X(4*i+3 downto 4*i);
  OupxDO(4*i+3 downto 4*i)<= O (127-4*i downto 124-4*i);

end generate l; 
  

end architecture p2;
