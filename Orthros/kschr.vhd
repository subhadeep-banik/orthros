library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity KSchr is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end KSchr;


architecture kr of KSchr is

  subtype Int7Type is integer range 0 to 127;
  type Int7Array is array (0 to 127) of Int7Type;
  constant P : Int7Array := (
        	76 , 30 , 53 , 35 , 31 , 46 , 2 , 79 , 11 , 125 , 110 , 87 , 39 , 91 , 14 , 101,			
	97 , 118 , 36 , 48 , 29 , 80 , 57 , 115 , 49 , 18 , 74 , 85 , 61 , 82 , 105 , 126,
	70 , 12 , 47 , 111 , 51 , 17 , 66 , 1 , 60 , 96 , 116 , 71 , 81 , 114 , 104 , 15,
	42 , 124 , 100 , 4 , 113 , 44 , 75 , 89 , 23 , 0 , 84 , 107 , 32 , 26 , 88 , 8,	
	69 , 121 , 38 , 94 , 37 , 86 , 54 , 21 , 62 , 123 , 41 , 10 , 16 , 95 , 117 , 65,	
	45 , 50 , 72 , 20 , 109 , 58 , 7 , 67 , 108 , 28 , 3 , 55 , 92 , 103 , 24 , 5,
	77 , 9 , 27 , 102 , 122 , 6 , 106 , 22 , 99 , 34 , 90 , 56 , 43 , 83 , 120 , 64,	
	78 , 59 , 119 , 93 , 40 , 98 , 52 , 68 , 112 , 33 , 63 , 25 , 19 , 73 , 127 , 13
);
 
  signal X,O: std_logic_vector(127 downto 0);
begin   



l:  for i in 0 to 127 generate 


  X(i)<= InpxDI(127-i);
  O(P(i)) <= X(i);
  OupxDO(i)<= O(127-i);
end generate l; 
  

end architecture kr;
