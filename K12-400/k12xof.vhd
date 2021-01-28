 

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
type RCtype  is array (0 to 11)  of std_logic_vector(15 downto 0);
 
constant RCL : RCtype := (

  X"808B" ,
  X"008B" ,
  X"8089" ,
  X"8003" ,
  X"8002" ,
  X"0080" ,
  X"800A" ,
  X"000A" ,
  X"8081" ,
  X"8080" ,
  X"0001" ,
  X"8008"   

);
 
  
begin  -- Rtl

        
i002: for x in 0 to 4 generate
	i003: for i in 0 to 1 generate
                   i004: for j in 0 to 7 generate
		         State(0)(x)(15-8*i-j) <= InxDI(127-16*x-16+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;

i012: for x in 0 to 2 generate
	i013: for i in 0 to 1 generate
                   i014: for j in 0 to 7 generate
		         State(1)(x)(15-8*i-j) <= InxDI(47-16*x-16+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;






 j002: for x in 0 to 1 generate
	j003: for i in 0 to 1 generate
                   j004: for j in 0 to 7 generate
		         State(1)(3+x)(15-8*i-j) <= KeyxDI(127-16*x-16+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;

 j012: for x in 0 to 4 generate
	j013: for i in 0 to 1 generate
                   j014: for j in 0 to 7 generate
		         State(2)(x)(15-8*i-j) <= KeyxDI(95-16*x-16+(i+1)*8-j) ;
                   end generate;
	end generate;
end generate;


 
	j023: for i in 0 to 1 generate
                   j024: for j in 0 to 7 generate
		         State(3)(0)(15-8*i-j) <= KeyxDI(15     -16+(i+1)*8-j) ;
                   end generate;
	end generate;
 
State(3)(1) <= x"0110" ;
State(3)(2) <= x"0700" ;
State(3)(3) <= x"0000" ;
State(3)(4) <= x"0000" ;
 
State(4)(0) <= x"8000" ;
State(4)(1) <= x"0000" ;
State(4)(2) <= x"0000" ;
State(4)(3) <= x"0000" ;
State(4)(4) <= x"0000" ;

 

S(0)<=State;

bl0: for i in 0 to 11 generate

   l0:   entity keccak_round (rtl) port map(S(i),  RCL(i), S(i+1));
 
end generate bl0;

         
k002: for x in 0 to 4 generate
	k003: for i in 0 to 1 generate
                   k004: for j in 0 to 7 generate
		          OutxDO(127-16*x-16+(i+1)*8-j)<= S(12)(0)(x)(15-8*i-j) ;
                   end generate;
	end generate;
end generate;

k012: for x in 0 to 2 generate
	k013: for i in 0 to 1 generate
                   k014: for j in 0 to 7 generate
		          OutxDO(47-16*x-16+(i+1)*8-j)<= S(12)(1)(x)(15-8*i-j);
                   end generate;
	end generate;
end generate;



end rtl;
