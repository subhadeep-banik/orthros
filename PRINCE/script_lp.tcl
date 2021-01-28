sh rm -rf WORK/*
remove_design -all


define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {./HDL/RTL/invsbox.vhd 
./HDL/RTL/sbox.vhd 
./HDL/RTL/Mux64.vhd 
./HDL/RTL/MatMul.vhd 
./HDL/RTL/slayer.vhd 
./HDL/RTL/islayer.vhd 
./HDL/RTL/xorgate.vhd 
./HDL/RTL/prince.vhd}

 
elaborate PRINCE -architecture BEHAV -library WORK

set_max_delay 5 -from InxDI -to OutxDO  
set_max_delay 5  -from KeyxDI -to OutxDO 

create_clock -name "ClkxCI" -period 100 -waveform { 0 50  }  { ClkxCI  }
 
compile_ultra

change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group > timing_lp.txt}

uplevel #0 { report_area -hierarchy > area_lp.txt}
 
write -hierarchy -format verilog -output prince-syn.v 

write_sdf prince-syn.sdf  

write -hierarchy -format ddc -output ./prince.ddc

 

