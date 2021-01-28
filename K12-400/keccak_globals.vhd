--taken from Guido Bertoni, Joan Daemen, Seth Hoffert, Michaël Peeters, Gilles Van
--Assche, and Ronny Van Keer. Team keccak: Hardware resources. https://keccak.team/hardware.html. 
 
library STD;
 use STD.textio.all;


  library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_misc.all;
    use IEEE.std_logic_arith.all;
    

library work;


package keccak_globals is


constant num_plane : integer := 5;
constant num_sheet : integer := 5;
constant logD : integer :=4;
constant N : integer := 16;



--types
 type k_lane        is  array ((N-1) downto 0)  of std_logic;    
 type k_plane        is array ((num_sheet-1) downto 0)  of k_lane;    
 type k_state        is array ((num_plane-1) downto 0)  of k_plane;  

end package;
