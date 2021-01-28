sh rm -rf WORK/*
remove_design -all


define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {./HDL/RTL/sbox.vhd
./HDL/RTL/s8.vhd
./HDL/RTL/is8.vhd
./HDL/RTL/slayer.vhd
./HDL/RTL/islayer.vhd
./HDL/RTL/shuffle.vhd 
./HDL/RTL/ishuffle.vhd 
./HDL/RTL/mixcol.vhd 
./HDL/RTL/tweaku.vhd 
./HDL/RTL/q9.vhd
}

 

elaborate QARMA128 -architecture BEHAV -library WORK

#set_max_delay 7  -from InxDI -to OutxDO  
#set_max_delay 7  -from KeyxDI -to OutxDO 
#set_max_delay 7  -from WxDI -to OutxDO 

 
create_clock -name "ClkxCI" -period 100 -waveform { 0 50 }  { ClkxCI  }

  
 set_max_area 0


compile_ultra

change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > timing_lp.txt}

uplevel #0 { report_area -hierarchy > area_lp.txt}
 
write -hierarchy -format verilog -output qarma128-syn.v 

write_sdf qarma128-syn.sdf  

write -hierarchy -format ddc -output qarma128.ddc

write -hierarchy -format vhdl -output qarma128.vhdl

