library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Mux64 is 
port ( In0xDI, In1xDI : in std_logic_vector(63 downto 0);
       SelxSI : in std_logic;
       OpxDO : out std_logic_vector(63 downto 0));
end entity Mux64;

architecture m64 of Mux64 is 
 
begin
 process (In0xDI,In1xDI, SelxSI) is
   begin
     if SelxSI = '0' then
   OpxDO <= In0xDI;
elsif SelxSI = '1' then
   OpxDO <= In1xDI;
end if;

end process;

end architecture m64;
