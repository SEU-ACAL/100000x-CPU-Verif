design .
hw_server 127.0.0.1
download
#default is 5 but hit trace_net -upload issue, need user to increase
#set_div 70

set_debug_mod -on
set_trace_size 2000000rclk

tracedb -enable
tracedb -open c910 -overwrite -xedb
trace_signals -add {i_pad_jtg_tdi}
trace_signals -add {i_pad_jtg_tms}
trace_signals -add {i_pad_jtg_trst_b}
trace_signals -add {i_pad_rst_b}
trace_signals -add {i_pad_uart0_sin}
trace_signals -add {i_pad_clk}
trace_signals -add {b_pad_gpio_porta[7:0]}

trace_signals -add {x_axi_slave128.x_f_spsram_large.Q[127:0]}
trace_signals -add {x_axi_slave128.x_f_spsram_large.A[18:0]}
trace_signals -add {x_axi_slave128.x_f_spsram_large.CEN}
trace_signals -add {x_axi_slave128.x_f_spsram_large.CLK}
trace_signals -add {x_axi_slave128.x_f_spsram_large.D[127:0]}
trace_signals -add {x_axi_slave128.x_f_spsram_large.WEN[15:0]}

trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_iu_top.x_ct_iu_rbus.rbus_pipe0_wb_data[63:0]}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_iu_top.x_ct_iu_rbus.rbus_pipe1_wb_data[63:0]}
#trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_ct_core.x_ct_lsu_top.x_ct_lsu_ld_wb.ld_wb_preg_data_sign_extend[63:0]}

trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rresp}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ms_int}

trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_acready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_araddr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arbar}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arburst}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arcache}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_ardomain}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arlen}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arlock}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arprot}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arsize}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arsnoop}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_aruser}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_arvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awaddr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awbar}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awburst}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awcache}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awdomain}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awlen}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awlock}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awprot}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awsize}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awsnoop}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awunique}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awuser}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_awvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_back}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_bready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cddata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cderr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cdlast}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cdvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_cnt_en}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_crresp}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_crvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_csr_sel}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_csr_wdata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_jdb_pm}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_lpmd_b}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_rack}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_rready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wdata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_werr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wlast}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wns}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wstrb}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.cp0_pad_mstatus}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_cpu_no_retire}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire0}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire0_pc}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire1}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire1_pc}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire2}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.rtu_pad_retire2_pc}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_dbg_ack_pc}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_enter_dbg_req_o}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_exit_dbg_req_o}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_regs_serial_data}



trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.ir_corex_wdata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acaddr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acprot}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acsnoop}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_acvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_arready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_awready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bresp}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_bvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_cdready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_crready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_csr_cmplt}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_csr_rdata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_dbgrq_b}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_hpcp_l2of_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_me_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_mt_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rdata}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rlast}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_rvalid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_se_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ss_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_st_int}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wns_awready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wns_wready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_wready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ws_awready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_biu_ws_wready}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_hartid}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_rst_b}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_core_rvba}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_cpu_rst_b}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_xx_apb_base}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_xx_time}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_icg_scan_en}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_mbist_mode}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_scan_mode}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pad_yy_scan_rst_b}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.pll_core_clk}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.sm_update_dr}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.sm_update_ir}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_enter_dbg_req_i}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_exit_dbg_req_i}
trace_signals -add {dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.x_had_dbg_mask}



puts "waveform added"

memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram0.mem -file ./rtl_tb/dut_ram0.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram1.mem -file ./rtl_tb/dut_ram1.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram2.mem -file ./rtl_tb/dut_ram2.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram3.mem -file ./rtl_tb/dut_ram3.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram4.mem -file ./rtl_tb/dut_ram4.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram5.mem -file ./rtl_tb/dut_ram5.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram6.mem -file ./rtl_tb/dut_ram6.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram7.mem -file ./rtl_tb/dut_ram7.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram8.mem -file ./rtl_tb/dut_ram8.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram9.mem -file ./rtl_tb/dut_ram9.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram10.mem -file ./rtl_tb/dut_ram10.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram11.mem -file ./rtl_tb/dut_ram11.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram12.mem -file ./rtl_tb/dut_ram12.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram13.mem -file ./rtl_tb/dut_ram13.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram14.mem -file ./rtl_tb/dut_ram14.txt
memory -write -format %readmemh -name dut_top.x_axi_slave128.x_f_spsram_large.ram15.mem -file ./rtl_tb/dut_ram15.txt

force i_pad_jtg_tdi 0
force i_pad_jtg_tms 0
force i_pad_jtg_trst_b 1
force i_pad_rst_b 1
force i_pad_uart0_sin 1
run 100
force i_pad_rst_b 0
run 100
force i_pad_rst_b 1
run 1000
force i_pad_jtg_trst_b 0
run 1000
force i_pad_jtg_trst_b 1
run 300000

#for {set c 0} {$c <= 4000} {incr c} {
#	run 8192 
#	tracedb -upload
#}
run 30000000

tracedb -upload
tracedb -close
puts "waveform closed"
exit


