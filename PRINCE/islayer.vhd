library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity ISlayer is
port ( InpxDI : in  std_logic_vector(63 downto 0);
       OupxDO : out std_logic_vector(63 downto 0));
end entity ISlayer;

architecture isl of ISlayer is 

begin 


loop1: for i in 0 to 15 generate 
  
i_sbox: entity invsbox(invlookuptable) port map (InpxDI (4*i+3 downto 4*i), OupxDO(4*i+3 downto 4*i)); 
  
end generate loop1;

end architecture isl;
