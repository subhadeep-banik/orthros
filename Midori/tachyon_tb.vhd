-------------------------------------------------------------------------------
-- Project    : 
-------------------------------------------------------------------------------
 
-- Author     : Subhadeep Banik  
 
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
 
-------------------------------------------------------------------------------
 
-------------------------------------------------------------------------------
 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
--use work.aes_pack.all;

entity tachyon_tb is
end tachyon_tb;


architecture tb of tachyon_tb is   

 
 signal   InxD      : std_logic_vector (127 downto 0);
 signal   KeyxD     : std_logic_vector (127 downto 0);
 signal   OpxD      : std_logic_vector (127 downto 0);
 

  signal ClkxC : std_logic;                    -- driving clock
     




  component tachyon
  port(
       KeyxDI : in std_logic_vector(127 downto 0); 
       InxDI:   in std_logic_vector(127 downto 0); 
       ClkxCI:  in std_logic;  
       OpxDO: out std_logic_vector(127 downto 0) 
  );
  end component;
       


   
begin

  -- Instantiate the module under test (MUT)
  mut: tachyon
    port map (
       KeyxDI => KeyxD,
       InxDI  => InxD,
       ClkxCI => ClkxC,
       OpxDO  => OpxD
  );

  -- Generate the clock
--  ClkxC <= not (ClkxC) after clkphasehigh;


  Tb_clkgen : process
  begin
     ClkxC <= '1';
     wait for 50 ns;
     ClkxC <= '0';
     wait for 50 ns;
  end process Tb_clkgen;

  -- obtain stimulus and apply it to MUT
  ----------------------------------------------------------------------------
  B1 : block
   begin


  -- timing of clock and simulation events
 


  Tb_stimappli : process
    variable INLine   : line;
    variable temp_p   : STD_LOGIC_VECTOR(127 downto 0);
    variable temp_k   : STD_LOGIC_VECTOR(127 downto 0); 
    variable temp_ed  : STD_LOGIC_VECTOR(3 downto 0); 
    constant clkphasehigh: time:= 50 ns;
    constant clkphaselow: time:= 50 ns;
 
    constant resetactivetime:         time:= 25 ns;

 
  file keyfile,infile,edfile : TEXT;



  begin
    -- Opening Input File
    file_open(keyfile, "Key.txt", read_mode);
    file_open(infile, "Inp.txt", read_mode);
    -- default values

    -- process until we run out of stimuli
    appli_loop : while not (endfile(keyfile)) loop
      readline(keyfile,INLine);
      hread(INLine,temp_k);
      KeyxD <= temp_k;
      readline(infile,INLine);
      hread(INLine,temp_p);
      InxD <= temp_p;
    
     
    wait for 2*clkphasehigh ;
   
    end loop appli_loop;
    wait until ClkxC'event and ClkxC = '1';
    file_close(infile);
    wait;
  end process Tb_stimappli;
end block;
end tb;
