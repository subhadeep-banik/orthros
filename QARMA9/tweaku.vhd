library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity Tweakup is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Tweakup;


architecture tu of Tweakup is

type Coltype is array (0 to 15) of std_logic_vector(7 downto 0);
signal IxD,OxD,QxD: Coltype;

subtype Int4Type is integer range 0 to 15;
type Int4Array is array (0 to 15) of Int4Type;
constant P: Int4Array := (

 6,5,14,15,0,1,2,3,7,12,13,4,8,9,10,11
 
);
  

begin


a1: for i in 0 to 15 generate

     IxD(i) <= InpxDI(127-8*i downto 120-8*i);
     OupxDO(127-8*i downto 120-8*i) <= QxD(i);    

end generate a1;

b1: for i in 0 to 15 generate

     OxD(i) <= IxD(P(i));

end generate b1;

 
QxD(0) <= ( OxD(0)(2) xor OxD(0)(0) ) & OxD(0)(7 downto 1);
QxD(1) <= ( OxD(1)(2) xor OxD(1)(0) ) & OxD(1)(7 downto 1);
QxD(2) <= OxD(2);
QxD(3) <= ( OxD(3)(2) xor OxD(3)(0) ) & OxD(3)(7 downto 1);

QxD(4) <= ( OxD(4)(2) xor OxD(4)(0) ) & OxD(4)(7 downto 1);
QxD(5) <= OxD(5);
QxD(6) <= OxD(6);
QxD(7) <= OxD(7);

QxD(8) <= ( OxD(8)(2) xor OxD(8)(0) ) & OxD(8)(7 downto 1);
QxD(9) <= OxD(9) ;
QxD(10) <= OxD(10);
QxD(11) <= ( OxD(11)(2) xor OxD(11)(0) ) & OxD(11)(7 downto 1);

QxD(12) <= OxD(12) ;
QxD(13) <= ( OxD(13)(2) xor OxD(13)(0) ) & OxD(13)(7 downto 1);
QxD(14) <= OxD(14);
QxD(15) <= OxD(15);


end architecture tu ;
