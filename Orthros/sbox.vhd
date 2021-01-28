library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity sbox is
  
  port (
    InpxDI : in  std_logic_vector(3 downto 0);
    OupxDO : out std_logic_vector(3 downto 0)
    );

end sbox;


architecture lookuptable of sbox is

  subtype Int4Type is integer range 0 to 15;
  type Int4Array is array (0 to 15) of Int4Type;
  constant SBOX : Int4Array := (
1,0,2,4,3,8,6,13, 9,10,11,14,15, 12,7,5
);
  
begin  -- lookuptable

  OupxDO <= std_logic_vector(to_unsigned(SBOX(to_integer(unsigned(InpxDI(3 downto 0)))), 4));
  

end lookuptable;

