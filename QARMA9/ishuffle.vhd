library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity IShuffle is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end IShuffle;


architecture ir of IShuffle is

type Coltype is array (0 to 15) of std_logic_vector(7 downto 0);
signal IxD,OxD: Coltype;

subtype Int4Type is integer range 0 to 15;
type Int4Array is array (0 to 15) of Int4Type;
constant P: Int4Array := (

 
0, 5,15,10,  13, 8, 2, 7,  11,14, 4, 1,   6, 3, 9,12
);
  

begin


a1: for i in 0 to 15 generate

     IxD(i) <= InpxDI(127-8*i downto 120-8*i);
     OupxDO(127-8*i downto 120-8*i) <= OxD(i);    

end generate a1;

b1: for i in 0 to 15 generate

     OxD(i) <= IxD(P(i));

end generate b1;

 

 


end architecture ir ;
