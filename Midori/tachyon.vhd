library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Tachyon is 
port ( KeyxDI : in std_logic_vector(127 downto 0); 
       InxDI:   in std_logic_vector(127 downto 0); 
       ClkxCI:  in std_logic; 
       OpxDO: out std_logic_vector(127 downto 0) );
end entity Tachyon;

architecture tach64 of Tachyon is

signal ExorxD: std_logic_vector(127 downto 0); 

 

 

signal Sub1xD,Sub2xD,Sub3xD,Sub4xD, Sub5xD,Sub6xD,Sub7xD,Sub8xD,Sub9xD,SubaxD,SubbxD,SubcxD,SubdxD,SubexD,SubfxD,SubgxD,SubhxD,SubixD,SubjxD,SubkxD: std_logic_vector(127 downto 0); 
 
signal Mult1xD,Mult2xD,Mult3xD,Mult4xD, Mult5xD,Mult6xD,Mult7xD,Mult8xD,Mult9xD,MultaxD,MultbxD,MultcxD,MultdxD,MultexD,MultfxD,MultgxD,MulthxD,MultixD,MultjxD,MultkxD: std_logic_vector(127 downto 0);  
 
signal Shuf1xD,Shuf2xD,Shuf3xD,Shuf4xD, Shuf5xD,Shuf6xD,Shuf7xD,Shuf8xD,Shuf9xD,ShufaxD,ShufbxD,ShufcxD,ShufdxD,ShufexD,ShuffxD,ShufgxD,ShufhxD,ShufixD,ShufjxD,ShufkxD: std_logic_vector(127 downto 0); 
 
signal Ark1xD,Ark2xD,Ark3xD,Ark4xD, Ark5xD,Ark6xD,Ark7xD,Ark8xD,Ark9xD,ArkaxD,ArkbxD,ArkcxD,ArkdxD,ArkexD,ArkfxD,ArkgxD,ArkhxD,ArkixD,ArkjxD,ArkkxD: std_logic_vector(127 downto 0); 
 
signal Rout1xD,Rout2xD,Rout3xD,Rout4xD, Rout5xD,Rout6xD,Rout7xD,Rout8xD,Rout9xD,RoutaxD,RoutbxD,RoutcxD,RoutdxD,RoutexD,RoutfxD,RoutgxD,RouthxD,RoutixD,RoutjxD,RoutkxD: std_logic_vector(127 downto 0);

begin


 


 
 
xg0: entity Xorgate (xg) port map (KeyxDI , InxDI, ExorxD);
 
--------------------------------------------------------------------------------------------------------------

sl01x: entity Slayer (sl) port map (ExorxD, Sub1xD);
  
Shuf1xD<= Sub1xD(127 downto 120) &  Sub1xD(47  downto 40) & Sub1xD(87  downto  80) & Sub1xD(7   downto   0) &
          Sub1xD(15  downto   8) &  Sub1xD(95  downto 88) & Sub1xD(39  downto  32) & Sub1xD(119 downto 112) &
          Sub1xD(55  downto  48) &  Sub1xD(103 downto 96) & Sub1xD(31  downto  24) & Sub1xD(79  downto  72) &
          Sub1xD(71  downto  64) &  Sub1xD(23  downto 16) & Sub1xD(111 downto 104) & Sub1xD(63  downto  56) ;
 

ml01x: entity Matmult (m00) port map (Shuf1xD , Mult1xD);
  
 
xg01x: entity Xorgate (xg) port map (Mult1xD , KeyxDI, Ark1xD);  

Rout1xD <= Ark1xD xor  x"00000001000100010100010100000101";--
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------

sl02x: entity Slayer (sl) port map (Rout1xD, Sub2xD);
  
Shuf2xD<= Sub2xD(127 downto 120) &  Sub2xD(47  downto 40) & Sub2xD(87  downto  80) & Sub2xD(7   downto   0) &
          Sub2xD(15  downto   8) &  Sub2xD(95  downto 88) & Sub2xD(39  downto  32) & Sub2xD(119 downto 112) &
          Sub2xD(55  downto  48) &  Sub2xD(103 downto 96) & Sub2xD(31  downto  24) & Sub2xD(79  downto  72) &
          Sub2xD(71  downto  64) &  Sub2xD(23  downto 16) & Sub2xD(111 downto 104) & Sub2xD(63  downto  56) ;
 

ml02x: entity Matmult (m00) port map (Shuf2xD , Mult2xD);
  
 
xg02x: entity Xorgate (xg) port map (Mult2xD , KeyxDI, Ark2xD);  

Rout2xD <= Ark2xD xor  x"00010101010000000101000000000000";---
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl03x: entity Slayer (sl) port map (Rout2xD, Sub3xD);
  
Shuf3xD<= Sub3xD(127 downto 120) &  Sub3xD(47  downto 40) & Sub3xD(87  downto  80) & Sub3xD(7   downto   0) &
          Sub3xD(15  downto   8) &  Sub3xD(95  downto 88) & Sub3xD(39  downto  32) & Sub3xD(119 downto 112) &
          Sub3xD(55  downto  48) &  Sub3xD(103 downto 96) & Sub3xD(31  downto  24) & Sub3xD(79  downto  72) &
          Sub3xD(71  downto  64) &  Sub3xD(23  downto 16) & Sub3xD(111 downto 104) & Sub3xD(63  downto  56) ;
 

ml03x: entity Matmult (m00) port map (Shuf3xD , Mult3xD);
  
 
xg03x: entity Xorgate (xg) port map (Mult3xD , KeyxDI, Ark3xD);  

Rout3xD <= Ark3xD xor  x"01000100000100000000010100010001";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl04x: entity Slayer (sl) port map (Rout3xD, Sub4xD);
  
Shuf4xD<= Sub4xD(127 downto 120) &  Sub4xD(47  downto 40) & Sub4xD(87  downto  80) & Sub4xD(7   downto   0) &
          Sub4xD(15  downto   8) &  Sub4xD(95  downto 88) & Sub4xD(39  downto  32) & Sub4xD(119 downto 112) &
          Sub4xD(55  downto  48) &  Sub4xD(103 downto 96) & Sub4xD(31  downto  24) & Sub4xD(79  downto  72) &
          Sub4xD(71  downto  64) &  Sub4xD(23  downto 16) & Sub4xD(111 downto 104) & Sub4xD(63  downto  56) ;
 

ml04x: entity Matmult (m00) port map (Shuf4xD , Mult4xD);
  
 
xg04x: entity Xorgate (xg) port map (Mult4xD , KeyxDI, Ark4xD);  

Rout4xD <= Ark4xD xor  x"00010100000001000000000100000101";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl05x: entity Slayer (sl) port map (Rout4xD, Sub5xD);
  
Shuf5xD<= Sub5xD(127 downto 120) &  Sub5xD(47  downto 40) & Sub5xD(87  downto  80) & Sub5xD(7   downto   0) &
          Sub5xD(15  downto   8) &  Sub5xD(95  downto 88) & Sub5xD(39  downto  32) & Sub5xD(119 downto 112) &
          Sub5xD(55  downto  48) &  Sub5xD(103 downto 96) & Sub5xD(31  downto  24) & Sub5xD(79  downto  72) &
          Sub5xD(71  downto  64) &  Sub5xD(23  downto 16) & Sub5xD(111 downto 104) & Sub5xD(63  downto  56) ;
 

ml05x: entity Matmult (m00) port map (Shuf5xD , Mult5xD);
  
 
xg05x: entity Xorgate (xg) port map (Mult5xD , KeyxDI, Ark5xD);  

Rout5xD <= Ark5xD xor  x"00000001000000000001000001010101";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl06x: entity Slayer (sl) port map (Rout5xD, Sub6xD);
  
Shuf6xD<= Sub6xD(127 downto 120) &  Sub6xD(47  downto 40) & Sub6xD(87  downto  80) & Sub6xD(7   downto   0) &
          Sub6xD(15  downto   8) &  Sub6xD(95  downto 88) & Sub6xD(39  downto  32) & Sub6xD(119 downto 112) &
          Sub6xD(55  downto  48) &  Sub6xD(103 downto 96) & Sub6xD(31  downto  24) & Sub6xD(79  downto  72) &
          Sub6xD(71  downto  64) &  Sub6xD(23  downto 16) & Sub6xD(111 downto 104) & Sub6xD(63  downto  56) ;
 

ml06x: entity Matmult (m00) port map (Shuf6xD , Mult6xD);
  
 
xg06x: entity Xorgate (xg) port map (Mult6xD , KeyxDI, Ark6xD);  

Rout6xD <= Ark6xD xor  x"01010001000000010001010100000000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl07x: entity Slayer (sl) port map (Rout6xD, Sub7xD);
  
Shuf7xD<= Sub7xD(127 downto 120) &  Sub7xD(47  downto 40) & Sub7xD(87  downto  80) & Sub7xD(7   downto   0) &
          Sub7xD(15  downto   8) &  Sub7xD(95  downto 88) & Sub7xD(39  downto  32) & Sub7xD(119 downto 112) &
          Sub7xD(55  downto  48) &  Sub7xD(103 downto 96) & Sub7xD(31  downto  24) & Sub7xD(79  downto  72) &
          Sub7xD(71  downto  64) &  Sub7xD(23  downto 16) & Sub7xD(111 downto 104) & Sub7xD(63  downto  56) ;
 

ml07x: entity Matmult (m00) port map (Shuf7xD , Mult7xD);
  
 
xg07x: entity Xorgate (xg) port map (Mult7xD , KeyxDI, Ark7xD);  

Rout7xD <= Ark7xD xor  x"00000000000001000001010000010100";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl08x: entity Slayer (sl) port map (Rout7xD, Sub8xD);
  
Shuf8xD<= Sub8xD(127 downto 120) &  Sub8xD(47  downto 40) & Sub8xD(87  downto  80) & Sub8xD(7   downto   0) &
          Sub8xD(15  downto   8) &  Sub8xD(95  downto 88) & Sub8xD(39  downto  32) & Sub8xD(119 downto 112) &
          Sub8xD(55  downto  48) &  Sub8xD(103 downto 96) & Sub8xD(31  downto  24) & Sub8xD(79  downto  72) &
          Sub8xD(71  downto  64) &  Sub8xD(23  downto 16) & Sub8xD(111 downto 104) & Sub8xD(63  downto  56) ;
 

ml08x: entity Matmult (m00) port map (Shuf8xD , Mult8xD);
  
 
xg08x: entity Xorgate (xg) port map (Mult8xD , KeyxDI, Ark8xD);  

Rout8xD <= Ark8xD xor  x"00000000010001010101000001010000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl09x: entity Slayer (sl) port map (Rout8xD, Sub9xD);
  
Shuf9xD<= Sub9xD(127 downto 120) &  Sub9xD(47  downto 40) & Sub9xD(87  downto  80) & Sub9xD(7   downto   0) &
          Sub9xD(15  downto   8) &  Sub9xD(95  downto 88) & Sub9xD(39  downto  32) & Sub9xD(119 downto 112) &
          Sub9xD(55  downto  48) &  Sub9xD(103 downto 96) & Sub9xD(31  downto  24) & Sub9xD(79  downto  72) &
          Sub9xD(71  downto  64) &  Sub9xD(23  downto 16) & Sub9xD(111 downto 104) & Sub9xD(63  downto  56) ;
 

ml09x: entity Matmult (m00) port map (Shuf9xD , Mult9xD);
  
 
xg09x: entity Xorgate (xg) port map (Mult9xD , KeyxDI, Ark9xD);  

Rout9xD <= Ark9xD xor  x"01000001000100000100000000000001";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0ax: entity Slayer (sl) port map (Rout9xD, SubaxD);
  
ShufaxD<= SubaxD(127 downto 120) &  SubaxD(47  downto 40) & SubaxD(87  downto  80) & SubaxD(7   downto   0) &
          SubaxD(15  downto   8) &  SubaxD(95  downto 88) & SubaxD(39  downto  32) & SubaxD(119 downto 112) &
          SubaxD(55  downto  48) &  SubaxD(103 downto 96) & SubaxD(31  downto  24) & SubaxD(79  downto  72) &
          SubaxD(71  downto  64) &  SubaxD(23  downto 16) & SubaxD(111 downto 104) & SubaxD(63  downto  56) ;
 

ml0ax: entity Matmult (m00) port map (ShufaxD , MultaxD);
  
 
xg0ax: entity Xorgate (xg) port map (MultaxD , KeyxDI, ArkaxD);  

RoutaxD <= ArkaxD xor  x"00010000000000000100010101000000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0bx: entity Slayer (sl) port map (RoutaxD, SubbxD);
  
ShufbxD<= SubbxD(127 downto 120) &  SubbxD(47  downto 40) & SubbxD(87  downto  80) & SubbxD(7   downto   0) &
          SubbxD(15  downto   8) &  SubbxD(95  downto 88) & SubbxD(39  downto  32) & SubbxD(119 downto 112) &
          SubbxD(55  downto  48) &  SubbxD(103 downto 96) & SubbxD(31  downto  24) & SubbxD(79  downto  72) &
          SubbxD(71  downto  64) &  SubbxD(23  downto 16) & SubbxD(111 downto 104) & SubbxD(63  downto  56) ;
 

ml0bx: entity Matmult (m00) port map (ShufbxD , MultbxD);
  
 
xg0bx: entity Xorgate (xg) port map (MultbxD , KeyxDI, ArkbxD);  

RoutbxD <= ArkbxD xor  x"00010101000000010100000100010101";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0cx: entity Slayer (sl) port map (RoutbxD, SubcxD);
  
ShufcxD<= SubcxD(127 downto 120) &  SubcxD(47  downto 40) & SubcxD(87  downto  80) & SubcxD(7   downto   0) &
          SubcxD(15  downto   8) &  SubcxD(95  downto 88) & SubcxD(39  downto  32) & SubcxD(119 downto 112) &
          SubcxD(55  downto  48) &  SubcxD(103 downto 96) & SubcxD(31  downto  24) & SubcxD(79  downto  72) &
          SubcxD(71  downto  64) &  SubcxD(23  downto 16) & SubcxD(111 downto 104) & SubcxD(63  downto  56) ;
 

ml0cx: entity Matmult (m00) port map (ShufcxD , MultcxD);
  
 
xg0cx: entity Xorgate (xg) port map (MultcxD , KeyxDI, ArkcxD);  

RoutcxD <= ArkcxD xor  x"00000100000001000100000001010100";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0dx: entity Slayer (sl) port map (RoutcxD, SubdxD);
  
ShufdxD<= SubdxD(127 downto 120) &  SubdxD(47  downto 40) & SubdxD(87  downto  80) & SubdxD(7   downto   0) &
          SubdxD(15  downto   8) &  SubdxD(95  downto 88) & SubdxD(39  downto  32) & SubdxD(119 downto 112) &
          SubdxD(55  downto  48) &  SubdxD(103 downto 96) & SubdxD(31  downto  24) & SubdxD(79  downto  72) &
          SubdxD(71  downto  64) &  SubdxD(23  downto 16) & SubdxD(111 downto 104) & SubdxD(63  downto  56) ;
 

ml0dx: entity Matmult (m00) port map (ShufdxD , MultdxD);
  
 
xg0dx: entity Xorgate (xg) port map (MultdxD , KeyxDI, ArkdxD);  

RoutdxD <= ArkdxD xor  x"00010001000000010000010100000000";---
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0ex: entity Slayer (sl) port map (RoutdxD, SubexD);
  
ShufexD<= SubexD(127 downto 120) &  SubexD(47  downto 40) & SubexD(87  downto  80) & SubexD(7   downto   0) &
          SubexD(15  downto   8) &  SubexD(95  downto 88) & SubexD(39  downto  32) & SubexD(119 downto 112) &
          SubexD(55  downto  48) &  SubexD(103 downto 96) & SubexD(31  downto  24) & SubexD(79  downto  72) &
          SubexD(71  downto  64) &  SubexD(23  downto 16) & SubexD(111 downto 104) & SubexD(63  downto  56) ;
 

ml0ex: entity Matmult (m00) port map (ShufexD , MultexD);
  
 
xg0ex: entity Xorgate (xg) port map (MultexD , KeyxDI, ArkexD);  

RoutexD <= ArkexD xor  x"01010101010000000101000001000100";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0fx: entity Slayer (sl) port map (RoutexD, SubfxD);
  
ShuffxD<= SubfxD(127 downto 120) &  SubfxD(47  downto 40) & SubfxD(87  downto  80) & SubfxD(7   downto   0) &
          SubfxD(15  downto   8) &  SubfxD(95  downto 88) & SubfxD(39  downto  32) & SubfxD(119 downto 112) &
          SubfxD(55  downto  48) &  SubfxD(103 downto 96) & SubfxD(31  downto  24) & SubfxD(79  downto  72) &
          SubfxD(71  downto  64) &  SubfxD(23  downto 16) & SubfxD(111 downto 104) & SubfxD(63  downto  56) ;
 

ml0fx: entity Matmult (m00) port map (ShuffxD , MultfxD);
  
 
xg0fx: entity Xorgate (xg) port map (MultfxD , KeyxDI, ArkfxD);  

RoutfxD <= ArkfxD xor  x"01010001010101010100000100000000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0gx: entity Slayer (sl) port map (RoutfxD, SubgxD);
  
ShufgxD<= SubgxD(127 downto 120) &  SubgxD(47  downto 40) & SubgxD(87  downto  80) & SubgxD(7   downto   0) &
          SubgxD(15  downto   8) &  SubgxD(95  downto 88) & SubgxD(39  downto  32) & SubgxD(119 downto 112) &
          SubgxD(55  downto  48) &  SubgxD(103 downto 96) & SubgxD(31  downto  24) & SubgxD(79  downto  72) &
          SubgxD(71  downto  64) &  SubgxD(23  downto 16) & SubgxD(111 downto 104) & SubgxD(63  downto  56) ;
 

ml0gx: entity Matmult (m00) port map (ShufgxD , MultgxD);
  
 
xg0gx: entity Xorgate (xg) port map (MultgxD , KeyxDI, ArkgxD);  

RoutgxD <= ArkgxD xor  x"00010101010100000100000000000001";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0hx: entity Slayer (sl) port map (RoutgxD, SubhxD);
  
ShufhxD<= SubhxD(127 downto 120) &  SubhxD(47  downto 40) & SubhxD(87  downto  80) & SubhxD(7   downto   0) &
          SubhxD(15  downto   8) &  SubhxD(95  downto 88) & SubhxD(39  downto  32) & SubhxD(119 downto 112) &
          SubhxD(55  downto  48) &  SubhxD(103 downto 96) & SubhxD(31  downto  24) & SubhxD(79  downto  72) &
          SubhxD(71  downto  64) &  SubhxD(23  downto 16) & SubhxD(111 downto 104) & SubhxD(63  downto  56) ;
 

ml0hx: entity Matmult (m00) port map (ShufhxD , MulthxD);
  
 
xg0hx: entity Xorgate (xg) port map (MulthxD , KeyxDI, ArkhxD);  

RouthxD <= ArkhxD xor  x"00000001010100000000010000010000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0ix: entity Slayer (sl) port map (RouthxD, SubixD);
  
ShufixD<= SubixD(127 downto 120) &  SubixD(47  downto 40) & SubixD(87  downto  80) & SubixD(7   downto   0) &
          SubixD(15  downto   8) &  SubixD(95  downto 88) & SubixD(39  downto  32) & SubixD(119 downto 112) &
          SubixD(55  downto  48) &  SubixD(103 downto 96) & SubixD(31  downto  24) & SubixD(79  downto  72) &
          SubixD(71  downto  64) &  SubixD(23  downto 16) & SubixD(111 downto 104) & SubixD(63  downto  56) ;
 

ml0ix: entity Matmult (m00) port map (ShufixD , MultixD);
  
 
xg0ix: entity Xorgate (xg) port map (MultixD , KeyxDI, ArkixD);  

RoutixD <= ArkixD xor  x"00000100000001010100010100010000";--
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

sl0jx: entity Slayer (sl) port map (RoutixD, SubjxD);
  
ShufjxD<= SubjxD(127 downto 120) &  SubjxD(47  downto 40) & SubjxD(87  downto  80) & SubjxD(7   downto   0) &
          SubjxD(15  downto   8) &  SubjxD(95  downto 88) & SubjxD(39  downto  32) & SubjxD(119 downto 112) &
          SubjxD(55  downto  48) &  SubjxD(103 downto 96) & SubjxD(31  downto  24) & SubjxD(79  downto  72) &
          SubjxD(71  downto  64) &  SubjxD(23  downto 16) & SubjxD(111 downto 104) & SubjxD(63  downto  56) ;
 

ml0jx: entity Matmult (m00) port map (ShufjxD , MultjxD);
  
 
xg0jx: entity Xorgate (xg) port map (MultjxD , KeyxDI, ArkjxD);  

RoutjxD <= ArkjxD xor  x"00010100000001000100000001000100";--
--------------------------------------------------------------------------------------------------------------

sl0kx: entity Slayer (sl) port map (RoutjxD, SubkxD);

xg0kx: entity Xorgate (xg) port map (SubkxD , KeyxDI, ArkkxD);  

OpxDO <= ArkkxD;

--------------------------------------------------------------------------------------------------------------






end architecture tach64;

