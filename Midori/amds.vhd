library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity Amds is
  
  port (
    InpxDI : in  std_logic_vector(31 downto 0);
    OupxDO : out std_logic_vector(31 downto 0)
    );

end Amds;


architecture a01 of Amds is


signal X0xD, X1xD, X2xD, X3xD: std_logic_vector(7 downto 0);
signal X03xD, X12xD          : std_logic_vector(7 downto 0);
signal Y0xD, Y1xD, Y2xD, Y3xD: std_logic_vector(7 downto 0);
  
begin   

 X0xD <= InpxDI(31 downto 24); X1xD <= InpxDI(23 downto 16); X2xD <= InpxDI(15 downto 8); X3xD <= InpxDI(7 downto 0);
 
 X12xD <= X1xD xor X2xD;
 X03xD <= X0xD xor X3xD;
 
 Y0xD <= X3xD xor X12xD;
 Y1xD <= X2xD xor X03xD;
 Y2xD <= X1xD xor X03xD;
 Y3xD <= X0xD xor X12xD;   
 
 OupxDO <= Y0xD & Y1xD & Y2xD & Y3xD; 
  

end architecture a01;
 