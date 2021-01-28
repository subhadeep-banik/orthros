sh rm -rf WORK/*
remove_design -all


define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {./HDL/RTL/sboxf.vhd
./HDL/RTL/slayer.vhd
./HDL/RTL/xorgate.vhd
./HDL/RTL/amds.vhd
./HDL/RTL/matmult.vhd
./HDL/RTL/lin.vhd
./HDL/RTL/rconst.vhd
./HDL/RTL/m64.vhd
./HDL/RTL/sreg.vhd
./HDL/RTL/tachyon.vhd}

 
elaborate TACHYON -architecture TACH64 -library WORK

#set_max_delay 6  -from InxDI -to OpxDO  
#set_max_delay 6  -from KeyxDI -to OpxDO  

create_clock -name "ClkxCI" -period 100 -waveform { 0 50  }  { ClkxCI  }

set_max_area 0

compile_ultra

change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

uplevel #0 { report_timing -path full -delay max -nworst 40 -max_paths 40 -significant_digits 2 -sort_by group > timing_lp.txt}

uplevel #0 { report_area -hierarchy > area_lp.txt}
 
write -hierarchy -format verilog -output tachyon-syn.v 

write_sdf tachyon-syn.sdf  

write -hierarchy -format ddc -output tachyon.ddc

write -hierarchy -format vhdl -output tachyon.vhdl

write_sdc -nosplit tachyon.sdc


