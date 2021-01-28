library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;


entity Mux128 is
port ( Inp1xDI : in  std_logic_vector(127 downto 0);
       Inp2xDI : in  std_logic_vector(127 downto 0);
       SelxSI  : in std_logic;
       OupxDO : out std_logic_vector(127 downto 0));
end entity Mux128;



architecture m128 of Mux128 is

begin 


OupxDO <= Inp1xDI when SelxSI ='0' else Inp2xDI;
 

end architecture m128; 