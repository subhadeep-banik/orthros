library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;             
use work.all;

entity Lin is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Lin;


architecture l0 of Lin is


signal X0xD, X1xD : std_logic_vector(127 downto 0);
 
begin   

           
kml01: entity Matmult (m00) port map (InpxDI, X0xD);
  
  X1xD <= X0xD(127 downto 120) &  X0xD(71  downto  64) & X0xD(15  downto   8) & X0xD(55  downto 48) &
          X0xD(87  downto  80) &  X0xD(111 downto 104) & X0xD(39  downto  32) & X0xD(31  downto 24) &
          X0xD(7   downto   0) &  X0xD(63  downto  56) & X0xD(119 downto 112) & X0xD(79  downto 72) &
          X0xD(47  downto  40) &  X0xD(23  downto  16) & X0xD(95  downto  88) & X0xD(103 downto 96) ;

 

  

OupxDO<=X1xD;
  

end architecture l0;
 