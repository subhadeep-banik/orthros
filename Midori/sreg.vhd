library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Sreg is 
port (
RegxDN : in std_logic_vector (127 downto 0);
ResxRBI : in std_logic;
ClkxCI : in std_logic;
RegxDP : out std_logic_vector (127 downto 0));
end entity Sreg;


architecture sr of Sreg is

begin


p_clk: process (ResxRBI, ClkxCI)
         begin
           if ResxRBI='0' then
                  
	           RegxDP <= (others => '0');
	          

           elsif ClkxCI'event and ClkxCI ='1' then

			
                         RegxDP <= RegxDN;
                        
           end if;
         end process p_clk;

end architecture sr;