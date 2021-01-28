library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;


entity Xorgate is
port ( Inp1xDI : in  std_logic_vector(127 downto 0);
       Inp2xDI : in  std_logic_vector(127 downto 0);
       OupxDO : out std_logic_vector(127 downto 0));
end entity Xorgate;



architecture xg of Xorgate is 

begin

OupxDO <= Inp1xDI xor Inp2xDI;

end architecture xg; 