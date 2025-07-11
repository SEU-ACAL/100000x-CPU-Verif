set top_module dut_top

#design_read -netlist $env(VSYN_VCOM_LIB)/vtech_vivado_vcom.v
#design_read -netlist ./xpm_primitives.g.v
#design_read -netlist ./vivado_xpm.g.v


design_read -netlist ./${top_module}.vg
design_load -top ${top_module} 

# if use wrong HDF, will get [error] 11273 Download failed because TDM training failed on board: 0 fpga: 0.

#emulator_spec -add "file ./hw_8fpga_LAB_2Frames.hdf"
#emulator_spec -add "file ./hw-config.hdf"
#emulator_spec -add "file ./hw_2P2.hdf"
emulator_spec -add "file ./hw-config.hdf"
emulator_util -add {default 0}
emulator_util -add {0.A 70}
emulator_util -add {0.B 70}
if { [file exist ./vedit_keep.tcl] } {
  source ./vedit_keep.tcl
}

#registers_visibility -effort low


###############################################################################
#need to use ../../../../src, due to NL_FILE_PATH will be executed in part_b1_f0 folder
#design_read -netlist ../../src/dut/ip/axi_uartlite_0/axi_uartlite_0_stub.v
#netlistmacro -add {work axi_uartlite_0} -resource {LUT:4000 BRAM:200}
#netlistmacro_param -module axi_uartlite_0 -attribute {NL_FILE_PATH ../../../../src/dut/ip/axi_uartlite_0/axi_uartlite_0.dcp}
#netlistmacro_param -module axi_uartlite_0 -attribute {XDC_DIR_PATH ../../../../src/dut/ip/axi_uartlite_0}

create_clock -sigName ${top_module}.i_pad_clk -frequency 10Mhz
create_clock -sigName ${top_module}.i_pad_jtg_tclk -frequency 10Mhz
#create_clock -sigName clk3 -frequency 30Mhz
#create_clock -sigName clk4 -frequency 40Mhz
#create_clock -sigName clk5 -frequency 50Mhz
#create_clock -sigName clk6 -frequency 60Mhz
#create_clock -sigName clk7 -frequency 70Mhz
#create_clock -sigName clk8 -frequency 80Mhz

dump_clock_region_ports
#logic_replication -enable

memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram0.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram1.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram2.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram3.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram4.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram5.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram6.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram7.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram8.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram9.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram10.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram11.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram12.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram13.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram14.mem}
memory_options -add {use_xdram dut_top.x_axi_slave128.x_f_spsram_large.ram15.mem}

#util_rule_check -disable
#emulator_util -add {default 0}
#emulator_util -add {0.A 50}
#emulator_util -add {0.B 50}
#emulator_util -add {0.C 50}
#emulator_util -add {0.D 50}
#emulator_util -add {1.A 60}
#emulator_util -add {1.B 60}


#set_dr_mode -add enable
#memory_options -add {force_refresh_area ON}
#xpm_threshold -DWIDTH_MAX 8192 -AWIDTH 8192


#cable_connection -def {cable1 PHC 0.A.17}
#terminal_assign -add {cable1 B3 uart0_rx}
#terminal_assign -add {cable1 B2 uart0_tx}

#par_group -instance {gp0 dut_top.u_system.u_amber}
#par_group -instance {gp1 dut_top.u_system.u_boot_mem}
#par_group -instance {gp1 dut_top.u_system.u_uart0}
#par_group -instance {gp1 dut_top.u_system.u_uart1}
#par_group -instance {gp1 dut_top.u_system.u_wishbone_arbiter}
#par_assign -add {gp0 0.A}
#par_assign -add {gp1 0.B}

#indivisible_group -add {gp0}
#indivisible_group -add {gp1}

#memory_access -add {u_system.\boot_mem32.u_boot_mem .u_mem.mem_2_mem_0_0}


write_net -add {b_pad_gpio_porta[7:0] i_pad_clk i_pad_jtg_tclk i_pad_jtg_tdi i_pad_jtg_tms i_pad_jtg_trst_b i_pad_rst_b i_pad_uart0_sin o_pad_jtg_tdo o_pad_uart0_sout}
read_net -add {b_pad_gpio_porta[7:0] i_pad_clk i_pad_jtg_tclk i_pad_jtg_tdi i_pad_jtg_tms i_pad_jtg_trst_b i_pad_rst_b i_pad_uart0_sin o_pad_jtg_tdo o_pad_uart0_sout}
trace_net -add {b_pad_gpio_porta[7:0] i_pad_clk i_pad_jtg_tclk i_pad_jtg_tdi i_pad_jtg_tms i_pad_jtg_trst_b i_pad_rst_b i_pad_uart0_sin o_pad_jtg_tdo o_pad_uart0_sout}


#will failed for RnD domain P1
#[2023-03-27 11:05:13] [error] 25117 Total area is larger than max resource the fpgas can provide.
#[2023-03-27 11:05:13] [error] 25117 BRAM [5892] exceed resource limit [5040]
trace_net -depth 1 -add dut_top.x_axi_slave128.x_f_spsram_large

#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.Q[127:0]}
#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.A[18:0]}
#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.CEN}
#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.CLK}
#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.D[127:0]}
#trace_net -add {dut_top.x_axi_slave128.x_f_spsram_large.WEN[15:0]}
#
#key signal
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_iu_top.x_ct_iu_rbus.rbus_pipe0_wb_data[63:0]}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_iu_top.x_ct_iu_rbus.rbus_pipe1_wb_data[63:0]}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_lsu_top.x_ct_lsu_ld_wb.ld_wb_preg_data_sign_extend[63:0]}

#XPDA debug signal
trace_net -depth 1 -add dut_top.x_cpu_sub_system_axi
trace_net -depth 1 -add dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_sysio_top
#trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_sysio_top.pad_cpu_sys_cnt[63:0]}
#trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_sysio_top.x_ct_sysio_core0.axim_clk_en}


trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_acready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_araddr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arbar}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arburst}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arcache}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_ardomain}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arlen}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arlock}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arprot}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arsize}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arsnoop}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_aruser}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awaddr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awbar}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awburst}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awcache}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awdomain}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awlen}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awlock}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awprot}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awsize}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awsnoop}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awunique}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awuser}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_back}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_bready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cddata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cderr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cdlast}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cdvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cnt_en}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_crresp}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_crvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_csr_sel}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_csr_wdata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_jdb_pm}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_lpmd_b}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_rack}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_rready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wdata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_werr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wlast}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wns}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wstrb}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.cp0_pad_mstatus}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_cpu_no_retire}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire0}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire0_pc}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire1}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire1_pc}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire2}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire2_pc}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_dbg_ack_pc}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_enter_dbg_req_o}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_exit_dbg_req_o}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_regs_serial_data}



trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.ir_corex_wdata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acaddr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acprot}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acsnoop}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_arready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_awready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bresp}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_cdready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_crready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_csr_cmplt}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_csr_rdata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_dbgrq_b}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_hpcp_l2of_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_me_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ms_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_mt_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rdata}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rlast}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rresp}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rvalid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_se_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ss_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_st_int}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wns_awready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wns_wready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ws_awready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ws_wready}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_hartid}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_rst_b}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_rvba}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_cpu_rst_b}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_xx_apb_base}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_xx_time}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_icg_scan_en}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_mbist_mode}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_scan_mode}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_scan_rst_b}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pll_core_clk}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.sm_update_dr}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.sm_update_ir}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_enter_dbg_req_i}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_exit_dbg_req_i}
trace_net -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_had_dbg_mask}


#adding below to identify which is causing post vcom simulaiton fail
#logic_replication -enable
#clock_recognization -enable
#clock_localization -enable
#routing_localization -enable
#elim_common_logic -enable
design_edit

design_generation

