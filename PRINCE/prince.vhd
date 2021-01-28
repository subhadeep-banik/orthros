 
 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.all;
     -- Brings NW and BW; NW is num_of_words-1 and BW is the bit_width  

entity prince is
  port(
        InxDI     : in  std_logic_vector(63 downto 0);
        KeyxDI    : in  std_logic_vector(127 downto 0);
        OutxDO    : out std_logic_vector(63 downto 0);
        ClkxCI    : in  std_logic
      );

end prince;


architecture behav of prince is
 
 
 

  signal PTxD, CTxD, K0xD,K1xD,KmxD,KnxD : std_logic_vector(63 downto 0);
  signal KeyxD : std_logic_vector(127 downto 0);
  
 
  signal EncxD      : std_logic_vector(63 downto 0);
  
  
  signal I2xD,I3xD,I4xD,I5xD,I6xD,I7xD,I8xD,I9xD,IAxD,IBxD,ICxD :  std_logic_vector(63 downto 0);
  
  signal S2xD,S3xD,S4xD,S5xD,S6xD,S7xD,S1xD  :  std_logic_vector(63 downto 0);
  
  signal M2xD,M3xD,M4xD,M5xD,M6xD,M7xD,M8xD,M9xD,MAxD,MBxD,M1xD :  std_logic_vector(63 downto 0);
  
  signal Ax7xD,Ax8xD,Ax9xD,AxAxD,AxBxD :  std_logic_vector(63 downto 0);
  
  signal ASR2xD,ASR3xD,ASR4xD,ASR5xD,ASR1xD :  std_logic_vector(63 downto 0);
  
  signal ASRI7xD,ASRI8xD,ASRI9xD,ASRIAxD,ASRIBxD :  std_logic_vector(63 downto 0);
  
begin

PTxD <= InxDI;
KeyxD <= KeyxDI;


K0xD <= KeyxDI(127 downto 64);
K1xD <= KeyxDI(63 downto 0);

KmxD (63 downto 1) <= ( K0xD(0) & K0xD(63 downto 2) ) ;
KmxD (0) <=  K0xD(1) xor K0xD(63);
KnxD<= KmxD xor x"c0ac29b7c97c50dd";

xg00: entity Xorgate (xg) port map (PTxD,K0xD,K1xD, EncxD);

-----------------------

-- Forward rnds

-----------------------


sl1: entity Slayer (sl) port map (EncxD, S1xD);

MC1: entity MatMul (mm) port map (S1xD,M1xD);

ASR1xD <=   M1xD (63 downto 60) & M1xD (43 downto 40) & M1xD (23 downto 20) & M1xD (3 downto 0)   &
            M1xD (47 downto 44) & M1xD (27 downto 24) & M1xD (7 downto 4)   & M1xD (51 downto 48) &
            M1xD (31 downto 28) & M1xD (11 downto 8)  & M1xD (55 downto 52) & M1xD (35 downto 32) &
            M1xD (15 downto 12) & M1xD (59 downto 56) & M1xD (39 downto 36) & M1xD (19 downto 16) ;
            



 
xg01: entity Xorgate (xg) port map (ASR1xD , x"13198a2e03707344" , K1xD, I2xD);
  
---------------------------------------------------------------------------------------------------------------------

 
sl2: entity Slayer (sl) port map (I2xD, S2xD);
  
MC2: entity MatMul (mm) port map (S2xD,M2xD);

ASR2xD <=   M2xD (63 downto 60) & M2xD (43 downto 40) & M2xD (23 downto 20) & M2xD (3 downto 0)   &
            M2xD (47 downto 44) & M2xD (27 downto 24) & M2xD (7 downto 4)   & M2xD (51 downto 48) &
            M2xD (31 downto 28) & M2xD (11 downto 8)  & M2xD (55 downto 52) & M2xD (35 downto 32) &
            M2xD (15 downto 12) & M2xD (59 downto 56) & M2xD (39 downto 36) & M2xD (19 downto 16) ;
            



  
xg02: entity Xorgate (xg) port map (ASR2xD , x"a4093822299f31d0" , K1xD, I3xD);

  
 
---------------------------------------------------------------------------------------------------------------------
 
sl3: entity Slayer (sl) port map (I3xD, S3xD);
 

  
MC3: entity MatMul (mm) port map (S3xD,M3xD);

ASR3xD <=   M3xD (63 downto 60) & M3xD (43 downto 40) & M3xD (23 downto 20) & M3xD (3 downto 0)   &
            M3xD (47 downto 44) & M3xD (27 downto 24) & M3xD (7 downto 4)   & M3xD (51 downto 48) &
            M3xD (31 downto 28) & M3xD (11 downto 8)  & M3xD (55 downto 52) & M3xD (35 downto 32) &
            M3xD (15 downto 12) & M3xD (59 downto 56) & M3xD (39 downto 36) & M3xD (19 downto 16) ;


xg03: entity Xorgate (xg) port map (ASR3xD , x"082efa98ec4e6c89" , K1xD, I4xD);
 
 

---------------------------------------------------------------------------------------------------------------------

sl4: entity Slayer (sl) port map (I4xD, S4xD);


MC4: entity MatMul (mm) port map (S4xD,M4xD);

ASR4xD <=   M4xD (63 downto 60) & M4xD (43 downto 40) & M4xD (23 downto 20) & M4xD (3 downto 0)   &
            M4xD (47 downto 44) & M4xD (27 downto 24) & M4xD (7 downto 4)   & M4xD (51 downto 48) &
            M4xD (31 downto 28) & M4xD (11 downto 8)  & M4xD (55 downto 52) & M4xD (35 downto 32) &
            M4xD (15 downto 12) & M4xD (59 downto 56) & M4xD (39 downto 36) & M4xD (19 downto 16) ;


 
xg04: entity Xorgate (xg) port map (ASR4xD , x"452821e638d01377" , K1xD, I5xD); 

  
 

---------------------------------------------------------------------------------------------------------------------

sl5: entity Slayer (sl) port map (I5xD, S5xD);
 

MC5: entity MatMul (mm) port map (S5xD,M5xD);

ASR5xD <=   M5xD (63 downto 60) & M5xD (43 downto 40) & M5xD (23 downto 20) & M5xD (3 downto 0)   &
            M5xD (47 downto 44) & M5xD (27 downto 24) & M5xD (7 downto 4)   & M5xD (51 downto 48) &
            M5xD (31 downto 28) & M5xD (11 downto 8)  & M5xD (55 downto 52) & M5xD (35 downto 32) &
            M5xD (15 downto 12) & M5xD (59 downto 56) & M5xD (39 downto 36) & M5xD (19 downto 16) ;


xg05: entity Xorgate (xg) port map (ASR5xD , x"be5466cf34e90c6c" , K1xD, I6xD); 
  
 

---------------------------------------------------------------------------------------------------------------------

--mid 

---------------------------------------------------------------------------------------------------------------------
 
sl6: entity Slayer (sl) port map (I6xD, S6xD);
 
MC6: entity MatMul (mm) port map (S6xD,M6xD);
 
isl6: entity ISlayer (isl) port map (M6xD, S7xD);  
 
I7xD <= S7xD;

-----------------------------------------------------------------------------------------------------------------------

-- reflection

-----------------------------------------------------------------------------------------------------------------------

xg07: entity Xorgate (xg) port map (I7xD , x"7ef84f78fd955cb1" , K1xD, Ax7xD); 


ASRI7xD <=  Ax7xD(63 downto 60) & Ax7xD(11 downto 8)  & Ax7xD(23 downto 20) & Ax7xD(35 downto 32) & 
            Ax7xD(47 downto 44) & Ax7xD(59 downto 56) & Ax7xD(7 downto 4)   & Ax7xD(19 downto 16) & 
            Ax7xD(31 downto 28) & Ax7xD(43 downto 40) & Ax7xD(55 downto 52) & Ax7xD(3 downto 0)   & 
            Ax7xD(15 downto 12) & Ax7xD(27 downto 24) & Ax7xD(39 downto 36) & Ax7xD(51 downto 48) ; 


MC7: entity MatMul (mm) port map (ASRI7xD,M7xD); 
  
isl7: entity ISlayer (isl) port map (M7xD, I8xD); 
 

------------------------------------------------------------------------------------------------------------------------

xg08: entity Xorgate (xg) port map (I8xD , x"85840851f1ac43aa" , K1xD, Ax8xD); 

 

ASRI8xD <=  Ax8xD(63 downto 60) & Ax8xD(11 downto 8)  & Ax8xD(23 downto 20) & Ax8xD(35 downto 32) & 
            Ax8xD(47 downto 44) & Ax8xD(59 downto 56) & Ax8xD(7 downto 4)   & Ax8xD(19 downto 16) & 
            Ax8xD(31 downto 28) & Ax8xD(43 downto 40) & Ax8xD(55 downto 52) & Ax8xD(3 downto 0)   & 
            Ax8xD(15 downto 12) & Ax8xD(27 downto 24) & Ax8xD(39 downto 36) & Ax8xD(51 downto 48) ; 


MC8: entity MatMul (mm) port map (ASRI8xD,M8xD); 
  
isl8: entity ISlayer (isl) port map (M8xD, I9xD); 
 

------------------------------------------------------------------------------------------------------------------------

xg09: entity Xorgate (xg) port map (I9xD , x"c882d32f25323c54" , K1xD, Ax9xD); 



ASRI9xD <=  Ax9xD(63 downto 60) & Ax9xD(11 downto 8)  & Ax9xD(23 downto 20) & Ax9xD(35 downto 32) & 
            Ax9xD(47 downto 44) & Ax9xD(59 downto 56) & Ax9xD(7 downto 4)   & Ax9xD(19 downto 16) & 
            Ax9xD(31 downto 28) & Ax9xD(43 downto 40) & Ax9xD(55 downto 52) & Ax9xD(3 downto 0)   & 
            Ax9xD(15 downto 12) & Ax9xD(27 downto 24) & Ax9xD(39 downto 36) & Ax9xD(51 downto 48) ; 


MC9: entity MatMul (mm) port map (ASRI9xD,M9xD); 
  
isl9: entity ISlayer (isl) port map (M9xD, IAxD);   
 

------------------------------------------------------------------------------------------------------------------------

xg0a: entity Xorgate (xg) port map (IAxD , x"64a51195e0e3610d" , K1xD, AxAxD); 



ASRIAxD <=  AxAxD(63 downto 60) & AxAxD(11 downto 8)  & AxAxD(23 downto 20) & AxAxD(35 downto 32) & 
            AxAxD(47 downto 44) & AxAxD(59 downto 56) & AxAxD(7 downto 4)   & AxAxD(19 downto 16) & 
            AxAxD(31 downto 28) & AxAxD(43 downto 40) & AxAxD(55 downto 52) & AxAxD(3 downto 0)   & 
            AxAxD(15 downto 12) & AxAxD(27 downto 24) & AxAxD(39 downto 36) & AxAxD(51 downto 48) ; 


MCA: entity MatMul (mm) port map (ASRIAxD,MAxD); 
  
isla: entity ISlayer (isl) port map (MAxD, IBxD);   
 

------------------------------------------------------------------------------------------------------------------------

xg0b: entity Xorgate (xg) port map (IBxD , x"d3b5a399ca0c2399" , K1xD, AxBxD); 



ASRIBxD <=  AxBxD(63 downto 60) & AxBxD(11 downto 8)  & AxBxD(23 downto 20) & AxBxD(35 downto 32) & 
            AxBxD(47 downto 44) & AxBxD(59 downto 56) & AxBxD(7 downto 4)   & AxBxD(19 downto 16) & 
            AxBxD(31 downto 28) & AxBxD(43 downto 40) & AxBxD(55 downto 52) & AxBxD(3 downto 0)   & 
            AxBxD(15 downto 12) & AxBxD(27 downto 24) & AxBxD(39 downto 36) & AxBxD(51 downto 48) ; 


MCB: entity MatMul (mm) port map (ASRIBxD,MBxD); 
  
islb: entity ISlayer (isl) port map (MBxD, ICxD);   


------------------------------------------------------------------------------------------------------------------------
 
xg0c: entity Xorgate (xg) port map (ICxD , KnxD , K1xD, OutxDO); 
      

 

end architecture behav;

