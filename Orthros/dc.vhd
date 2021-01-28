-------------------------------------------------------------------------------
-- Title      : ORTHROS
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dc.vhd
-- Author     : Subhadeep Banik  <subhadeep.banik@epfl.ch>
-- Company    : LASEC, EPF Lausanne
-- Created    : 2006-04-06
-- Last update: 2006-04-10
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Main DC block
-------------------------------------------------------------------------------
 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2006-04-06  1.0      kgf	Created
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.all;
     -- Brings NW and BW; NW is num_of_words-1 and BW is the bit_width  

entity dc128 is
  port(
        InxDI     : in  std_logic_vector(127 downto 0);
        KeyxDI    : in  std_logic_vector(127 downto 0);
        OutxDO    : out std_logic_vector(127 downto 0);
        ClkxCI    : in  std_logic
      );

end dc128;


architecture behav of dc128 is
 
 
subtype Int6Type is integer range 0 to 200;

constant mul : Int6Type := 12;



 signal PTxD, K0xD : std_logic_vector(127 downto 0);
 
  
 type Sigtype is array (0 to 12) of std_logic_vector(127 downto 0);
 type Keytype is array (0 to 13) of std_logic_vector(127 downto 0);
 type RCtype  is array (0 to 11)  of std_logic_vector(127 downto 0);

 signal RxD,BL,BR: Sigtype;
 signal BKL,BKR: Keytype;


 constant RCL : RCtype := (

x"a0ac9329ac4bc991c2313219c193ca81",
x"4420cb8b49cc9ba882c104ba4a22c918",
x"3c0b2031431044cc31401a4129a108b8",
x"33cc10a4043289941183323849c22304",
x"aa82c1118b929aca0409424088ba2814",
x"2081380c9c290882aacb223114a44aa4",
x"981c0cb22144084bab32c99a2309423a",
x"b24119bc33c18b2938900c848a2b242b",
x"3491a301a430822a1933241099c9b039",
x"301248a0939b922c380330318aac40ba",
x"440a904904b141492a048b8a9b21b3c4",
x"92c81b00089982982a44102332909c20"
);

 constant RCR : RCtype := (
x"a34a8ca0a88b04a1982b9381b2bacac8",
x"ca98490c308b9c0c99308bc988288c2a",
x"403a2311bccb13a4ab39a8c42ba93924",
x"48913c9c0c1808ca4894c19b399b1220",
x"32b3218430109ca4a31ca91239b8c838",
x"10bcc304a1b813b829c90b8bb1498bb3",
x"a91c233a40c233b34a028990002b4093",
x"8a2931ab0413bc2bb89a13abbc4b048b",
x"9b1b8bc390a342204809124a9a180a32",
x"a4ac29b88283c913cb4492c491aa100c",
x"cab089094810cb043201a20c0acc09b1",
x"4bba3b8984cb028c3839089a4cccccc1");
 
  
begin

PTxD <= InxDI;



 
K0xD <= KeyxDI(127 downto 0);

 
 

  
-----------------------
BL(0)<= PTxD xor BKL(1); 
BR(0)<= PTxD xor BKR(1); 
BKL(0)<= K0xD; 
BKR(0)<= K0xD; 
-----------------------

ks0: for i in 1 to 13 generate

   lk0:   entity KSchl (kl) port map(BKL(i-1), BKL(i));
 
end generate ks0;
 
ks1: for i in 1 to 13 generate

   rk0:   entity KSchr (kr) port map(BKR(i-1), BKR(i));
 
end generate ks1;

 

-----------------------------------------------------------------------------

bl0: for i in 1 to 4 generate

   l0:   entity Lround1 (lr) port map(BL(i-1), BKL(i+1),RCL(i-1), BL(i));
 
end generate bl0;

bl1: for i in 5 to 11 generate

   l0:   entity Lround2 (lr) port map(BL(i-1), BKL(i+1),RCL(i-1), BL(i));
 
end generate bl1;




br0: for i in 1 to 4 generate

   r0:   entity Rround1 (rr) port map(BR(i-1), BKR(i+1),RCR(i-1), BR(i));
 
end generate br0;

br1: for i in 5 to 11 generate

   r0:   entity Rround2 (rr) port map(BR(i-1), BKR(i+1),RCR(i-1), BR(i));
 
end generate br1;



-------------------------------------------------------------------------------

--LAST ROUNDS--
--------------
 
fr1:  entity Fround (fr) port map(BR(11),BKR(13),RCR(11) , BR(12));

fr2:  entity Fround (fr) port map(BL(11),BKL(13),RCL(11) , BL(12));

OutxDO<= BR(12) xor BL(12);


end architecture behav;


