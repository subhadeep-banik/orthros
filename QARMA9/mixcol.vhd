library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity Mixcol is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Mixcol;


architecture mc of Mixcol is

type Coltype is array (0 to 3) of std_logic_vector(31 downto 0);
signal IxD,OxD: Coltype;

 

begin

 

IxD(0) <= InpxDI(127 downto 120) & InpxDI(95 downto 88) &  InpxDI(63 downto 56) &  InpxDI(31 downto 24);
IxD(1) <= InpxDI(119 downto 112) & InpxDI(87 downto 80) &  InpxDI(55 downto 48) &  InpxDI(23 downto 16);
IxD(2) <= InpxDI(111 downto 104) & InpxDI(79 downto 72) &  InpxDI(47 downto 40) &  InpxDI(15 downto 8);
IxD(3) <= InpxDI(103 downto 96)  & InpxDI(71 downto 64) &  InpxDI(39 downto 32) &  InpxDI(7  downto 0);

a1: for i in 0 to 3 generate

      OxD(0)(31-8*i downto 24-8*i) <= (IxD(i)(22 downto 16) & IxD(i)(23) )  xor (IxD(i)(11 downto 8) & IxD(i)(15 downto 12) ) xor (IxD(i)(2 downto 0) & IxD(i)(7 downto 3) );--0145
      OxD(1)(31-8*i downto 24-8*i) <= (IxD(i)(26 downto 24) & IxD(i)(31 downto 27) )  xor (IxD(i)(14 downto 8) & IxD(i)(15) ) xor (IxD(i)(3 downto 0) & IxD(i)(7 downto 4) );       --5014
      OxD(2)(31-8*i downto 24-8*i) <= (IxD(i)(27 downto 24) & IxD(i)(31 downto 28) )  xor (IxD(i)(18 downto 16) & IxD(i)(23 downto 19) )  xor (IxD(i)(6 downto 0) & IxD(i)(7) ); --4501
      OxD(3)(31-8*i downto 24-8*i) <= (IxD(i)(30 downto 24) & IxD(i)(31) )  xor (IxD(i)(19 downto 16) & IxD(i)(23 downto 20) ) xor (IxD(i)(10 downto 8) & IxD(i)(15 downto 11) );    --1450

end generate a1;

OupxDO<= OxD(0) & OxD(1) & OxD(2) & OxD(3);


end architecture mc ;
 
