library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Slayer is
port ( InpxDI : in  std_logic_vector(127 downto 0);
       OupxDO : out std_logic_vector(127 downto 0));
end entity Slayer;

architecture sl of Slayer is 

begin 


loop1: for i in 0 to 15 generate 
  
i_sbox: entity s8(com) port map (InpxDI (8*i+7 downto 8*i), OupxDO(8*i+7 downto 8*i)); 
  
end generate loop1;

end architecture sl;
