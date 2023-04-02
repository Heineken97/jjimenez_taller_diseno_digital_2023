create_clock -period 10.0 -name clk -waveform {0.0 5.0} [get_ports clk]

create_clock -period 10.0 -name reset -waveform {0.0 5.0} [get_ports reset]

derive_pll_clocks

set_false_path -from [get_ports reset]

set_false_path -from [get_ports change_switches]

set_false_path -from [get_ports switches]

set_false_path -from [get_ports leftover_leds]

set_max_delay 5.0 -from [get_ports switches] -to [get_cells uut_rsw/d]

set_max_delay 5.0 -from [get_ports change_switches] -to [get_cells uut_scw/d]

set_max_delay 5.0 -from [get_cells uut_rsw/q] -to [get_cells dut/a], [get_cells uut_unit_d/bin_number], [get_cells uut_converter/bin]

set_max_delay 5.0 -from [get_cells uut_scw/q] -to [get_cells dut/uc], [get_cells uut_sign/n]

set_max_delay 5.0 -from [get_cells dut/result], [get_cells dut/n], [get_cells dut/z], [get_cells dut/c], [get_cells dut/v] -to [get_cells uut_converter/bin]

set_max_delay 5.0 -from [get_cells uut_converter/bin_unit], [get_cells uut_unit_d/bcd_number] -to [get_cells uut_sdu/d]

set_max_delay 5.0 -from [get_cells uut_converter/bin_ten], [get_cells uut_ten_d/bcd_number] -to [get_cells uut_sdt/d]

set_max_delay 5.0 -from [get_cells uut_sign/seg] -to [get_cells uut_sds/d]
