library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;             
use work.all;

entity Matmult is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Matmult;


architecture m00 of Matmult is


signal X0xD, X1xD, X2xD, X3xD: std_logic_vector(31 downto 0);
signal Y0xD, Y1xD, Y2xD, Y3xD: std_logic_vector(31 downto 0);
  
begin   

 X0xD <= InpxDI(127 downto 96); X1xD <= InpxDI(95 downto 64); X2xD <= InpxDI(63 downto 32); X3xD <= InpxDI(31 downto 0);
 
 
 n0: entity Amds (a01) port map(X0xD,Y0xD);
 n1: entity Amds (a01) port map(X1xD,Y1xD);
 n2: entity Amds (a01) port map(X2xD,Y2xD);
 n3: entity Amds (a01) port map(X3xD,Y3xD);  
 
 OupxDO <= Y0xD & Y1xD & Y2xD & Y3xD; 
  

end architecture m00;
 