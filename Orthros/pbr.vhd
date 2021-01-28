library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity Pbr is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Pbr;


architecture p of Pbr is

  subtype Int7Type is integer range 0 to 127;
  type Int7Array is array (0 to 127) of Int7Type;
  constant P : Int7Array := (
        20 , 122 , 74 , 62 , 119 , 35 , 15 , 66 , 9 , 85 , 32 , 117 , 21 , 83 , 127 , 106,	
	11 , 98 , 115 , 59 , 71 , 90 , 56 , 26 , 2 , 44 , 103 , 121 , 114 , 107 , 68 , 16,	
	84 , 1 , 102 , 33 , 80 , 52 , 76 , 36 , 27 , 94 , 37 , 55 , 82 , 12 , 112 , 64,
	105 , 14 , 91 , 17 , 108 , 124 , 6 , 93 , 29 , 86 , 123 , 79 , 72 , 53 , 19 , 99,
	50 , 18 , 81 , 73 , 67 , 88 , 4 , 61 , 111 , 49 , 24 , 45 , 57 , 78 , 100 , 22,	
	110 , 47 , 116 , 54 , 60 , 70 , 97 , 39 , 3 , 41 , 48 , 96 , 23 , 42 , 113 , 87,	
	126 , 13 , 31 , 40 , 51 , 25 , 65 , 125 , 8 , 101 , 118 , 28 , 38 , 89 , 5 , 104,	
	109 , 120 , 69 , 43 , 7 , 77 , 58 , 34 , 10 , 63 , 30 , 95 , 75 , 46 , 0 , 92
);
 
  signal X,O: std_logic_vector(127 downto 0);
begin   



l:  for i in 0 to 127 generate 


  X(i)<= InpxDI(127-i);
  O(P(i)) <= X(i);
  OupxDO(i)<= O(127-i);
end generate l; 
  

end architecture p;
