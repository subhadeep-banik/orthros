library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- contains conversion functions
use work.all;
entity Pbl is
  
  port (
    InpxDI : in  std_logic_vector(127 downto 0);
    OupxDO : out std_logic_vector(127 downto 0)
    );

end Pbl;


architecture p of Pbl is

  subtype Int7Type is integer range 0 to 127;
  type Int7Array is array (0 to 127) of Int7Type;
  constant P : Int7Array := (
        6 , 46 , 62 , 126 , 70 , 52 , 28 , 14 , 36 , 125 , 72 , 83 , 106 , 95 , 4 , 35,	
	25 , 41 , 10 , 76 , 87 , 74 , 120 , 42 , 88 , 21 , 11 , 67 , 64 , 38 , 112 , 50,
	85 , 109 , 24 , 65 , 99 , 0 , 49 , 37 , 8 , 66 , 114 , 47 , 127 , 100 , 56 , 40,
	13 , 117 , 78 , 86 , 92 , 58 , 124 , 101 , 55 , 89 , 97 , 9 , 18 , 116 , 59 , 15,
	20 , 45 , 75 , 2 , 77 , 27 , 1 , 60 , 115 , 107 , 26 , 69 , 119 , 3 , 84 , 51,
	123 , 110 , 31 , 82 , 113 , 53 , 81 , 102 , 63 , 118 , 93 , 12 , 30 , 94 , 108 , 32,
	5 , 111 , 29 , 43 , 91 , 19 , 79 , 33 , 73 , 44 , 98 , 48 , 22 , 61 , 68 , 105,
	34 , 71 , 54 , 104 , 17 , 57 , 80 , 103 , 96 , 121 , 23 , 39 , 122 , 90 , 7 , 16
);
 
  signal X,O: std_logic_vector(127 downto 0);
begin   



l:  for i in 0 to 127 generate 


  X(i)<= InpxDI(127-i);
  O(P(i)) <= X(i);
  OupxDO(i)<= O(127-i);
end generate l; 
  

end architecture p;
