 

library work;
	use work.keccak_globals.all;
		use work.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;	


entity k12xof is
port(
        InxDI     : in  std_logic_vector(127 downto 0);
        KeyxDI    : in  std_logic_vector(127 downto 0);
        OutxDO    : out std_logic_vector(127 downto 0);
        ClkxCI    : in  std_logic
    );

end k12xof;

architecture rtl of k12xof is

signal State: k_state;
type Sigtype is array (0 to 12) of  k_state;
signal S: Sigtype;
  ----------------------------------------------------------------------------
  -- Internal signal declarations
  ----------------------------------------------------------------------------
type RCtype  is array (0 to 11)  of std_logic_vector(63 downto 0);
 
constant RCL : RCtype := (

  X"000000008000808B" ,
  X"800000000000008B" ,
  X"8000000000008089" ,
  X"8000000000008003" ,
  X"8000000000008002" ,
  X"8000000000000080" ,
  X"000000000000800A" ,
  X"800000008000000A" ,
  X"8000000080008081" ,
  X"8000000000008080" ,
  X"0000000080000001" ,
  X"8000000080008008"   

);
 
  
begin  -- Rtl

        
i002: for x in 0 to 1 generate
	i003: for i in 0 to 7 generate
                   i004: for j in 0 to 7 generate
		         State(0)(x)(63-8*i-j) <= InxDI(127-64*x-64+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;

 j002: for x in 0 to 1 generate
	j003: for i in 0 to 7 generate
                   j004: for j in 0 to 7 generate
		         State(0)(2+x)(63-8*i-j) <= KeyxDI(127-64*x-64+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;


State(0)(4) <= x"0000000000070110" ;
State(4)(0) <= x"8000000000000000" ;
 
State(1)(0) <= x"0000000000000000" ;
State(2)(0) <= x"0000000000000000" ;
State(3)(0) <= x"0000000000000000" ;

u: for x in 1 to 4 generate
    u1: for y in 1 to 4 generate

          State(x)(y)<= (others=>'0');
	end generate;
end generate;

S(0)<=State;

bl0: for i in 0 to 11 generate

   l0:   entity keccak_round (rtl) port map(S(i),  RCL(i), S(i+1));
 
end generate bl0;

         
k002: for x in 0 to 1 generate
	k003: for i in 0 to 7 generate
                   k004: for j in 0 to 7 generate
		         OutxDO(127-64*x-64+(i+1)*8-j)<=  S(12)(0)(x)(63-8*i-j)  ;
                   end generate;
	end generate;
end generate;

end rtl;
