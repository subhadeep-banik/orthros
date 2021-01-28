sh rm -rf WORK/*
remove_design -all


define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {./HDL/RTL/amds.vhd
./HDL/RTL/matmult.vhd
./HDL/RTL/sbox.vhd
./HDL/RTL/slayer.vhd
./HDL/RTL/pbl.vhd
./HDL/RTL/pbr.vhd
./HDL/RTL/pn1.vhd
./HDL/RTL/pn2.vhd
./HDL/RTL/kschr.vhd
./HDL/RTL/kschl.vhd
./HDL/RTL/lround1.vhd
./HDL/RTL/lround2.vhd
./HDL/RTL/rround1.vhd
./HDL/RTL/rround2.vhd
./HDL/RTL/fround.vhd
./HDL/RTL/dc.vhd
}



elaborate DC128 -architecture BEHAV -library WORK

set_max_delay 2 -from InxDI -to OutxDO  #set delay here
set_max_delay 2 -from KeyxDI -to OutxDO  #set delay here

create_clock -name "ClkxCI" -period 100 -waveform { 0 50  }  { ClkxCI  }

set_max_area 0

compile_ultra

change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

uplevel #0 { report_timing -path full -delay max -nworst 40 -max_paths 40 -significant_digits 2 -sort_by group > timing_lp.txt}

uplevel #0 { report_area -hierarchy > area_lp.txt}
 
write -hierarchy -format verilog -output dc-syn.v 

write_sdf dc-syn.sdf  

write -hierarchy -format ddc -output dc.ddc

write -hierarchy -format vhdl -output dc.vhdl

write_sdc -nosplit dc.sdc



