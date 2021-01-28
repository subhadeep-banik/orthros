-------------------------------------------------------------------------------
-- Title      : QARMA
-- Project    : 
-------------------------------------------------------------------------------
-- File       : qarma.vhd
-- Author     : Subhadeep Banik  <subhadeep.banik@epfl.ch>
-- Company    : LASEC, EPF Lausanne
-- Created    : 2006-04-06
-- Last update: 2006-04-10
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Main QARMA block
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

entity qarma128 is
  port(
        InxDI     : in  std_logic_vector(127 downto 0);
        KeyxDI    : in  std_logic_vector(127 downto 0);
        WxDI      : in  std_logic_vector(127 downto 0);
        TweakxDI  : in  std_logic_vector(127 downto 0);
        OutxDO    : out std_logic_vector(127 downto 0);
        ClkxCI    : in  std_logic
      );

end qarma128;


architecture behav of qarma128 is
 
 
subtype Int6Type is integer range 0 to 200;

constant mul : Int6Type := 9;



 signal PTxD, K0xD, K1xD, W0xD, W1xD ,QxD: std_logic_vector(127 downto 0);
 
  
 type Sigtype is array (0 to 31) of std_logic_vector(127 downto 0);
 signal CxD,DxD,RxD,TxD,ExD,FxD,GxD,HxD: Sigtype;
 
 
 type RconType is array (0 to 14) of std_logic_vector(127 downto 0);
 constant RC : RconType := (
 x"00000000000000000000000000000000",
 x"A4093822299F31D0082EFA98EC4E6C89",
 x"452821E638D01377BE5466CF34E90C6C",
 x"C0AC29B7C97C50DD3F84D5B5B5470917",
 x"9216D5D98979FB1BD1310BA698DFB5AC",
 x"2FFD72DBD01ADFB7B8E1AFED6A267E96",
 x"BA7C9045F12C7F9924A19947B3916CF7",
 x"0801F2E2858EFC16636920D871574E69",
 x"A458FEA3F4933D7E0D95748F728EB658",
 x"718BCD5882154AEE7B54A41DC25A59B5",
 x"9C30D5392AF26013C5D1B023286085F0",
 x"CA417918B8DB38EF8E79DCB0603A180E",
 x"6C9E0E8BB01E8A3ED71577C1BD314B27",
 x"78AF2FDA55605C60E65525F3AA55AB94",
 x"5748986263E8144055CA396A2AAB10B6"
 ); 
  
begin

PTxD <= InxDI;



W0xD <= WxDI  (127 downto 0);
K0xD <= KeyxDI(127 downto 0);

K1xD <= K0xD;
 

W1xD (127 downto 1) <= ( W0xD(0) & W0xD(127 downto 2) ) ;
W1xD (0) <=  W0xD(1) xor W0xD(127);

 
--whitening
RxD(0) <= PTxD xor W0xD; 
TxD(0) <= TweakxDI; 
-----------------------

-- Forward rnds

 
-----------------------------------------------------------------------------
--i=0

CxD(0) <= RxD(0); --zero rc
DxD(0) <= CxD(0) xor K0xD xor TxD(0);

sl0: entity Slayer  (sl) port map (DxD(0), RxD(1));
tu0: entity Tweakup (tu) port map (TxD(0), TxD(1));

 
-----------------------------------------------------------------------------

fw: for i in 1 to mul-1 generate

    
    CxD(i) <= RxD(i) xor RC(i);
    DxD(i) <= CxD(i) xor K0xD xor TxD(i);

 

   sl: entity Shuffle (sr) port map (DxD(i), ExD(i));

   mc: entity Mixcol  (mc) port map (ExD(i), FxD(i));

   sh: entity Slayer  (sl) port map (FxD(i), RxD(i+1));

   tu: entity Tweakup (tu) port map (TxD(i), TxD(i+1)); 
 
end generate fw;
-------------------------------------------------------------------------------

--MID ROUNDS--
--------------


CxD(mul) <= RxD(mul) ;
DxD(mul) <= CxD(mul) xor W1xD xor TxD(mul);

sr11: entity Shuffle (sr) port map (DxD(mul), ExD(mul));

mc11: entity Mixcol  (mc) port map (ExD(mul), FxD(mul));

sl11: entity Slayer  (sl) port map (FxD(mul), RxD(mul+1));
---------------

sr12: entity Shuffle (sr)  port map (RxD(mul+1), ExD(mul+1)); 
mc12: entity Mixcol  (mc)  port map (ExD(mul+1), FxD(mul+1));
QxD <= FxD(mul+1) xor K1xD;
ir12: entity IShuffle( ir) port map (QxD, RxD(mul+2)); 

---------------
sl13: entity ISlayer (il) port map (RxD(mul+2), ExD(mul+2));

mc13: entity Mixcol  (mc) port map (ExD(mul+2), FxD(mul+2));

ir13: entity IShuffle(ir) port map (FxD(mul+2), GxD(0)); 

RxD(mul+3) <= GxD(0) xor TxD(mul) xor W0xD;
-------------------------------------------------------------------------------
--BCK ROUNDS--
--------------
bw: for i in mul+3 to 2*mul+1 generate

 il: entity ISlayer (il) port map (RxD(i), ExD(i));

 mc: entity Mixcol  (mc) port map (ExD(i), FxD(i));
 
 ir: entity IShuffle(ir) port map (FxD(i), GxD(i-mul-2)); 

 HxD(i-mul-2) <= GxD(i-mul-2) xor TxD(2*mul+2-i) xor K0xD;
 RxD(i+1)  <= HxD(i-mul-2) xor RC(2*mul+2-i) xor x"243F6A8885A308D313198A2E03707344";

end generate bw;
-------------------------------------------------------------------------------
 


il24: entity ISlayer  (il) port map (RxD(2*mul+2), ExD(2*mul+2));



HxD(mul) <= ExD(2*mul+2) xor TxD(0) xor K0xD;
RxD(2*mul+3) <= HxD(mul) xor x"243F6A8885A308D313198A2E03707344";
-------------------------------------------------------------------------------

OutxDO <= RxD(2*mul+3) xor W1xD;

end architecture behav;


