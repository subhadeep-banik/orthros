library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions

entity MatMul is
  
  port (
    InpxDI : in  std_logic_vector(63 downto 0);
    OupxDO : out std_logic_vector(63 downto 0)
    );

end MatMul;


architecture mm of MatMul is

signal I1xD,I2xD,I3xD,I4xD: std_logic_vector(15 downto 0);
signal O1xD,O2xD,O3xD,O4xD: std_logic_vector(15 downto 0);

begin


I1xD <= InpxDI(63 downto 48);
I2xD <= InpxDI(47 downto 32);
I3xD <= InpxDI(31 downto 16);
I4xD <= InpxDI(15 downto 0);

--------------------
---- M0
--------------------

O1xD(15) <= I1xD(11) xor I1xD(7) xor I1xD(3);
O1xD(14) <= I1xD(14) xor I1xD(6) xor I1xD(2);

O1xD(13) <= I1xD(13) xor I1xD(9) xor I1xD(1);
O1xD(12) <= I1xD(12) xor I1xD(8) xor I1xD(4);



O1xD(11) <= I1xD(15) xor I1xD(11) xor I1xD(7);
O1xD(10) <= I1xD(10) xor I1xD(6) xor I1xD(2);

O1xD(9) <= I1xD(13) xor I1xD(5) xor I1xD(1);
O1xD(8) <= I1xD(12) xor I1xD(8) xor I1xD(0);


O1xD(7) <= I1xD(15) xor I1xD(11) xor I1xD(3);
O1xD(6) <= I1xD(14) xor I1xD(10) xor I1xD(6);

O1xD(5) <= I1xD(9) xor I1xD(5) xor I1xD(1);
O1xD(4) <= I1xD(12) xor I1xD(4) xor I1xD(0);



O1xD(3) <= I1xD(15) xor I1xD(7) xor I1xD(3);
O1xD(2) <= I1xD(14) xor I1xD(10) xor I1xD(2);

O1xD(1) <= I1xD(13) xor I1xD(9) xor I1xD(5);
O1xD(0) <= I1xD(8) xor I1xD(4) xor I1xD(0);

-----------------------------------------------------

O4xD(15) <= I4xD(11) xor I4xD(7) xor I4xD(3);
O4xD(14) <= I4xD(14) xor I4xD(6) xor I4xD(2);

O4xD(13) <= I4xD(13) xor I4xD(9) xor I4xD(1);
O4xD(12) <= I4xD(12) xor I4xD(8) xor I4xD(4);



O4xD(11) <= I4xD(15) xor I4xD(11) xor I4xD(7);
O4xD(10) <= I4xD(10) xor I4xD(6) xor I4xD(2);

O4xD(9) <= I4xD(13) xor I4xD(5) xor I4xD(1);
O4xD(8) <= I4xD(12) xor I4xD(8) xor I4xD(0);


O4xD(7) <= I4xD(15) xor I4xD(11) xor I4xD(3);
O4xD(6) <= I4xD(14) xor I4xD(10) xor I4xD(6);

O4xD(5) <= I4xD(9) xor I4xD(5) xor I4xD(1);
O4xD(4) <= I4xD(12) xor I4xD(4) xor I4xD(0);



O4xD(3) <= I4xD(15) xor I4xD(7) xor I4xD(3);
O4xD(2) <= I4xD(14) xor I4xD(10) xor I4xD(2);

O4xD(1) <= I4xD(13) xor I4xD(9) xor I4xD(5);
O4xD(0) <= I4xD(8) xor I4xD(4) xor I4xD(0);


--------------------
---- M1
--------------------


O2xD(3) <= I2xD(11) xor I2xD(7) xor I2xD(3);
O2xD(2) <= I2xD(14) xor I2xD(6) xor I2xD(2);

O2xD(1) <= I2xD(13) xor I2xD(9) xor I2xD(1);
O2xD(0) <= I2xD(12) xor I2xD(8) xor I2xD(4);



O2xD(15) <= I2xD(15) xor I2xD(11) xor I2xD(7);
O2xD(14) <= I2xD(10) xor I2xD(6) xor I2xD(2);

O2xD(13) <= I2xD(13) xor I2xD(5) xor I2xD(1);
O2xD(12) <= I2xD(12) xor I2xD(8) xor I2xD(0);


O2xD(11) <= I2xD(15) xor I2xD(11) xor I2xD(3);
O2xD(10) <= I2xD(14) xor I2xD(10) xor I2xD(6);

O2xD(9) <= I2xD(9) xor I2xD(5) xor I2xD(1);
O2xD(8) <= I2xD(12) xor I2xD(4) xor I2xD(0);



O2xD(7) <= I2xD(15) xor I2xD(7) xor I2xD(3);
O2xD(6) <= I2xD(14) xor I2xD(10) xor I2xD(2);

O2xD(5) <= I2xD(13) xor I2xD(9) xor I2xD(5);
O2xD(4) <= I2xD(8) xor I2xD(4) xor I2xD(0);

-----------------------------------------------
O3xD(3) <= I3xD(11) xor I3xD(7) xor I3xD(3);
O3xD(2) <= I3xD(14) xor I3xD(6) xor I3xD(2);

O3xD(1) <= I3xD(13) xor I3xD(9) xor I3xD(1);
O3xD(0) <= I3xD(12) xor I3xD(8) xor I3xD(4);



O3xD(15) <= I3xD(15) xor I3xD(11) xor I3xD(7);
O3xD(14) <= I3xD(10) xor I3xD(6) xor I3xD(2);

O3xD(13) <= I3xD(13) xor I3xD(5) xor I3xD(1);
O3xD(12) <= I3xD(12) xor I3xD(8) xor I3xD(0);


O3xD(11) <= I3xD(15) xor I3xD(11) xor I3xD(3);
O3xD(10) <= I3xD(14) xor I3xD(10) xor I3xD(6);

O3xD(9) <= I3xD(9) xor I3xD(5) xor I3xD(1);
O3xD(8) <= I3xD(12) xor I3xD(4) xor I3xD(0);



O3xD(7) <= I3xD(15) xor I3xD(7) xor I3xD(3);
O3xD(6) <= I3xD(14) xor I3xD(10) xor I3xD(2);

O3xD(5) <= I3xD(13) xor I3xD(9) xor I3xD(5);
O3xD(4) <= I3xD(8) xor I3xD(4) xor I3xD(0);


OupxDO<=  O1xD & O2xD & O3xD & O4xD;


end architecture mm;