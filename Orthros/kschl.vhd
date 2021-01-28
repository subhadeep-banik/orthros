library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity KSchl is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end KSchl;


architecture kl of KSchl is

  subtype Int7Type is integer range 0 to 127;
  type Int7Array is array (0 to 127) of Int7Type;
  constant P : Int7Array := (
    	0 , 53 , 87 , 73 , 22 , 95 , 99 , 48 , 61 , 36 , 108 , 1 , 24 , 67 , 119 , 93,	
	54 , 103 , 69 , 112 , 16 , 111 , 94 , 122 , 31 , 66 , 33 , 83 , 47 , 3 , 65 , 62,
	123 , 9 , 101 , 19 , 5 , 58 , 89 , 37 , 38 , 51 , 28 , 106 , 82 , 76 , 121 , 4,		
	70 , 7 , 42 , 92 , 104 , 80 , 45 , 75 , 114 , 17 , 2 , 97 , 46 , 107 , 63 , 18,			
	109 , 15 , 127 , 43 , 13 , 59 , 29 , 125 , 77 , 11 , 50 , 30 , 12 , 90 , 118 , 64,			
	20 , 35 , 57 , 10 , 124 , 56 , 68 , 91 , 116 , 21 , 84 , 98 , 52 , 81 , 126 , 34,
	105 , 27 , 120 , 74 , 6 , 85 , 40 , 72 , 113 , 41 , 23 , 49 , 79 , 55 , 102 , 8,			
	117 , 39 , 88 , 26 , 25 , 110 , 14 , 32 , 115 , 100 , 86 , 71 , 78 , 44 , 96 , 60
);
 
  signal X,O: std_logic_vector(127 downto 0);
begin   



l:  for i in 0 to 127 generate 


  X(i)<= InpxDI(127-i);
  O(P(i)) <= X(i);
  OupxDO(i)<= O(127-i);
end generate l; 
  

end architecture kl;
