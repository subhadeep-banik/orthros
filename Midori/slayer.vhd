library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Slayer is
port ( InpxDI : in  std_logic_vector(127 downto 0);
       OupxDO : out std_logic_vector(127 downto 0));
end entity Slayer;

architecture sl of Slayer is 


subtype Int3Type is integer range 0 to 7;
type PermType is array (0 to 7) of Int3Type;
constant P0  : PermType := (4,1,6,3, 0,5,2,7);
constant IP0 : PermType := (4,1,6,3, 0,5,2,7);


constant P1  : PermType := (3,0,5,6, 7,4,1,2);
constant IP1 : PermType := (1,6,7,0, 5,2,3,4);

constant P2  : PermType := (6,3,0,1, 2,7,4,5);
constant IP2 : PermType := (2,3,4,1, 6,7,0,5);

constant P3  : PermType := (5,2,3,4, 1,6,7,0);
constant IP3 : PermType := (7,4,1,2, 3,0,5,6);

signal PermxD,SubxD : std_logic_vector (127 downto 0);
begin 


loop1: for i in 0 to 3 generate 
  

  
    loop2: for j in 0 to 7 generate 
  
        PermxD (127 - i*32 -P0(j) ) <= InpxDI(127 - i*32 -j);
  
  
    end generate loop2; 
    
    loop3: for j in 0 to 7 generate 
  
        PermxD (119 - i*32 -P1(j) ) <= InpxDI(119 - i*32 -j);
  
  
    end generate loop3;
    
    loop4: for j in 0 to 7 generate 
  
        PermxD (111 - i*32 -P2(j) ) <= InpxDI(111 - i*32 -j);
  
  
    end generate loop4;
    
    loop5: for j in 0 to 7 generate 
  
        PermxD (103 - i*32 -P3(j) ) <= InpxDI(103 - i*32 -j);
  
  
    end generate loop5;
  
end generate loop1;


loop6: for i in 0 to 31 generate 
  
  i_sbox: entity sboxf(lookuptable) port map (PermxD (4*i+3 downto 4*i), SubxD(4*i+3 downto 4*i)); 
    
end generate loop6;


loop7: for i in 0 to 3 generate 
  

  
    loop8: for j in 0 to 7 generate 
  
        OupxDO (127 - i*32 -IP0(j) ) <= SubxD(127 - i*32 -j);
  
  
    end generate loop8; 
    
    loop9: for j in 0 to 7 generate 
  
        OupxDO (119 - i*32 -IP1(j) ) <= SubxD(119 - i*32 -j);
  
  
    end generate loop9;
    
    loopa: for j in 0 to 7 generate 
  
        OupxDO (111 - i*32 -IP2(j) ) <= SubxD(111 - i*32 -j);
  
  
    end generate loopa;
    
    loopb: for j in 0 to 7 generate 
  
        OupxDO (103 - i*32 -IP3(j) ) <= SubxD(103 - i*32 -j);
  
  
    end generate loopb;
  
end generate loop7;

end architecture sl;



--
