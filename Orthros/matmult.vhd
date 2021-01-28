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


signal X0xD, X1xD, X2xD, X3xD: std_logic_vector(15 downto 0);
signal X4xD, X5xD, X6xD, X7xD: std_logic_vector(15 downto 0);

signal Y0xD, Y1xD, Y2xD, Y3xD: std_logic_vector(15 downto 0);
signal Y4xD, Y5xD, Y6xD, Y7xD: std_logic_vector(15 downto 0);
  
begin   

 X0xD <= InpxDI(127 downto 112); X1xD <= InpxDI(111 downto 96); X2xD <= InpxDI(95 downto 80); X3xD <= InpxDI(79 downto 64);
 X4xD <= InpxDI(63 downto 48);   X5xD <= InpxDI(47 downto 32);  X6xD <= InpxDI(31 downto 16); X7xD <= InpxDI(15 downto 0);
 
 n0: entity Amds (a01) port map(X0xD,Y0xD);
 n1: entity Amds (a01) port map(X1xD,Y1xD);
 n2: entity Amds (a01) port map(X2xD,Y2xD);
 n3: entity Amds (a01) port map(X3xD,Y3xD);  
 n4: entity Amds (a01) port map(X4xD,Y4xD);
 n5: entity Amds (a01) port map(X5xD,Y5xD);
 n6: entity Amds (a01) port map(X6xD,Y6xD);
 n7: entity Amds (a01) port map(X7xD,Y7xD);  


 
 OupxDO <= Y0xD & Y1xD & Y2xD & Y3xD & Y4xD & Y5xD & Y6xD & Y7xD   ; 
  

end architecture m00;
 
