library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity sboxf is
  
  port (
    InpxDI : in  std_logic_vector(3 downto 0);
    OupxDO : out std_logic_vector(3 downto 0)
    );

end sboxf;


architecture lookuptable of sboxf is

  subtype Int4Type is integer range 0 to 15;
  type Int4Array is array (0 to 15) of Int4Type;
  constant SBOX : Int4Array := (

 1,  0,  5,  3,
14,  2, 15,  7,
13, 10,  9, 11,
12,  8,  4,  6 
 
);

  
begin  -- lookuptable

  OupxDO <= std_logic_vector(to_unsigned(SBOX(to_integer(unsigned(InpxDI(3 downto 0)))), 4));
  

end architecture lookuptable;
 