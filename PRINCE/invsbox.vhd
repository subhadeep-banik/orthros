library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity invsbox is
  
  port (
    InpxDI : in  std_logic_vector(3 downto 0);
    OupxDO : out std_logic_vector(3 downto 0)
    );

end invsbox;


architecture invlookuptable of invsbox is

  subtype Int4Type is integer range 0 to 15;
  type Int4Array is array (0 to 15) of Int4Type;
  constant SBOX : Int4Array := (

11,7,3,2,15,13,8,9,10,6,4,0,5,14,12,1

);

  
begin  -- lookuptable

  OupxDO <= std_logic_vector(to_unsigned(SBOX(to_integer(unsigned(InpxDI(3 downto 0)))), 4));
  

end invlookuptable;
