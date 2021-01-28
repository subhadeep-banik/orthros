 
library work;
 
		use work.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;	


entity sdeck is
port(
        InxDI     : in  std_logic_vector(127 downto 0);
        KeyxDI    : in  std_logic_vector(127 downto 0);
        OutxDO    : out std_logic_vector(127 downto 0);
        ClkxCI    : in  std_logic
    );

end sdeck;

architecture rtl of sdeck is
 
type Sigtype is array (0 to 22) of  std_logic_vector(256 downto 0);
type Optype is array (0 to 21) of  std_logic_vector(31 downto 0);
type Abtype is array (0 to 3) of  std_logic_vector(32 downto 0);

signal s: Sigtype;
signal op: Optype;
signal k,p: Abtype;

signal state :std_logic_vector(256 downto 0);
  ----------------------------------------------------------------------------
  -- Internal signal declarations
  ----------------------------------------------------------------------------
 
 
  
begin  -- Rtl

         
state <= (others=>'0');

s(0)<=state;

div: for i in 0 to 3 generate 
   k(i) <=KeyxDI(127 -i*32 downto 96 - i*32) & '1';
   p(i) <=InxDI(127 -i*32 downto 96 - i*32) & '1';
end generate;

keya: for i in 0 to 3 generate

  ka: entity subround (rtl) port map(s(i), k(i), s(i+1), op(i));
end generate;

  kb: entity subround (rtl) port map(s(4), '1' & x"00000000"   , s(5), op(4));


inpa: for i in 5 to 8 generate

  ma: entity subround (rtl) port map(s(i), p(i-5), s(i+1), op(i));
end generate;

  mb: entity subround (rtl) port map(s(9), '1' & x"00000000"  , s(10), op(9));

blnk: for i in 10 to 17 generate

  ba: entity subround (rtl) port map(s(i), '1' & x"00000000" , s(i+1), op(i));
end generate;


opsq: for i in 18 to 21 generate

  sq: entity subround (rtl) port map(s(i), '1' & x"00000000" , s(i+1), op(i));
end generate;

OutxDO <= op(18) & op(19) & op(20) & op(21);





end rtl;
