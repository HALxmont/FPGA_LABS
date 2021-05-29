# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/mxmont/Desktop/XADCC/XADC_Vitis_system/_ide/scripts/debugger_xadc_vitis-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/mxmont/Desktop/XADCC/XADC_Vitis_system/_ide/scripts/debugger_xadc_vitis-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279A42739A" && level==0 && jtag_device_ctx=="jsn-Zybo-210279A42739A-13722093-0"}
fpga -file /home/mxmont/Desktop/XADCC/XADC_Vitis/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/mxmont/Desktop/XADCC/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/mxmont/Desktop/XADCC/XADC_Vitis/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
configparams force-mem-access 0
