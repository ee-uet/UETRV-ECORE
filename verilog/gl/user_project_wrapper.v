module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire io_uart_tx;
 wire io_spi_cs;
 wire io_spi_clk;
 wire io_spi_mosi;
 wire io_pwm_high;
 wire io_pwm_low;
 wire \core_io_dbus_addr[0] ;
 wire \core_io_dbus_addr[10] ;
 wire \core_io_dbus_addr[11] ;
 wire \core_io_dbus_addr[12] ;
 wire \core_io_dbus_addr[13] ;
 wire \core_io_dbus_addr[14] ;
 wire \core_io_dbus_addr[15] ;
 wire \core_io_dbus_addr[16] ;
 wire \core_io_dbus_addr[17] ;
 wire \core_io_dbus_addr[18] ;
 wire \core_io_dbus_addr[19] ;
 wire \core_io_dbus_addr[1] ;
 wire \core_io_dbus_addr[20] ;
 wire \core_io_dbus_addr[21] ;
 wire \core_io_dbus_addr[22] ;
 wire \core_io_dbus_addr[23] ;
 wire \core_io_dbus_addr[24] ;
 wire \core_io_dbus_addr[25] ;
 wire \core_io_dbus_addr[26] ;
 wire \core_io_dbus_addr[27] ;
 wire \core_io_dbus_addr[28] ;
 wire \core_io_dbus_addr[29] ;
 wire \core_io_dbus_addr[2] ;
 wire \core_io_dbus_addr[30] ;
 wire \core_io_dbus_addr[31] ;
 wire \core_io_dbus_addr[3] ;
 wire \core_io_dbus_addr[4] ;
 wire \core_io_dbus_addr[5] ;
 wire \core_io_dbus_addr[6] ;
 wire \core_io_dbus_addr[7] ;
 wire \core_io_dbus_addr[8] ;
 wire \core_io_dbus_addr[9] ;
 wire \core_io_dbus_ld_type[0] ;
 wire \core_io_dbus_ld_type[1] ;
 wire \core_io_dbus_ld_type[2] ;
 wire core_io_dbus_rd_en;
 wire \core_io_dbus_rdata[0] ;
 wire \core_io_dbus_rdata[10] ;
 wire \core_io_dbus_rdata[11] ;
 wire \core_io_dbus_rdata[12] ;
 wire \core_io_dbus_rdata[13] ;
 wire \core_io_dbus_rdata[14] ;
 wire \core_io_dbus_rdata[15] ;
 wire \core_io_dbus_rdata[16] ;
 wire \core_io_dbus_rdata[17] ;
 wire \core_io_dbus_rdata[18] ;
 wire \core_io_dbus_rdata[19] ;
 wire \core_io_dbus_rdata[1] ;
 wire \core_io_dbus_rdata[20] ;
 wire \core_io_dbus_rdata[21] ;
 wire \core_io_dbus_rdata[22] ;
 wire \core_io_dbus_rdata[23] ;
 wire \core_io_dbus_rdata[24] ;
 wire \core_io_dbus_rdata[25] ;
 wire \core_io_dbus_rdata[26] ;
 wire \core_io_dbus_rdata[27] ;
 wire \core_io_dbus_rdata[28] ;
 wire \core_io_dbus_rdata[29] ;
 wire \core_io_dbus_rdata[2] ;
 wire \core_io_dbus_rdata[30] ;
 wire \core_io_dbus_rdata[31] ;
 wire \core_io_dbus_rdata[3] ;
 wire \core_io_dbus_rdata[4] ;
 wire \core_io_dbus_rdata[5] ;
 wire \core_io_dbus_rdata[6] ;
 wire \core_io_dbus_rdata[7] ;
 wire \core_io_dbus_rdata[8] ;
 wire \core_io_dbus_rdata[9] ;
 wire \core_io_dbus_st_type[0] ;
 wire \core_io_dbus_st_type[1] ;
 wire core_io_dbus_valid;
 wire \core_io_dbus_wdata[0] ;
 wire \core_io_dbus_wdata[10] ;
 wire \core_io_dbus_wdata[11] ;
 wire \core_io_dbus_wdata[12] ;
 wire \core_io_dbus_wdata[13] ;
 wire \core_io_dbus_wdata[14] ;
 wire \core_io_dbus_wdata[15] ;
 wire \core_io_dbus_wdata[16] ;
 wire \core_io_dbus_wdata[17] ;
 wire \core_io_dbus_wdata[18] ;
 wire \core_io_dbus_wdata[19] ;
 wire \core_io_dbus_wdata[1] ;
 wire \core_io_dbus_wdata[20] ;
 wire \core_io_dbus_wdata[21] ;
 wire \core_io_dbus_wdata[22] ;
 wire \core_io_dbus_wdata[23] ;
 wire \core_io_dbus_wdata[24] ;
 wire \core_io_dbus_wdata[25] ;
 wire \core_io_dbus_wdata[26] ;
 wire \core_io_dbus_wdata[27] ;
 wire \core_io_dbus_wdata[28] ;
 wire \core_io_dbus_wdata[29] ;
 wire \core_io_dbus_wdata[2] ;
 wire \core_io_dbus_wdata[30] ;
 wire \core_io_dbus_wdata[31] ;
 wire \core_io_dbus_wdata[3] ;
 wire \core_io_dbus_wdata[4] ;
 wire \core_io_dbus_wdata[5] ;
 wire \core_io_dbus_wdata[6] ;
 wire \core_io_dbus_wdata[7] ;
 wire \core_io_dbus_wdata[8] ;
 wire \core_io_dbus_wdata[9] ;
 wire core_io_dbus_wr_en;
 wire \core_io_ibus_addr[0] ;
 wire \core_io_ibus_addr[10] ;
 wire \core_io_ibus_addr[11] ;
 wire \core_io_ibus_addr[12] ;
 wire \core_io_ibus_addr[13] ;
 wire \core_io_ibus_addr[14] ;
 wire \core_io_ibus_addr[15] ;
 wire \core_io_ibus_addr[16] ;
 wire \core_io_ibus_addr[17] ;
 wire \core_io_ibus_addr[18] ;
 wire \core_io_ibus_addr[19] ;
 wire \core_io_ibus_addr[1] ;
 wire \core_io_ibus_addr[20] ;
 wire \core_io_ibus_addr[21] ;
 wire \core_io_ibus_addr[22] ;
 wire \core_io_ibus_addr[23] ;
 wire \core_io_ibus_addr[24] ;
 wire \core_io_ibus_addr[25] ;
 wire \core_io_ibus_addr[26] ;
 wire \core_io_ibus_addr[27] ;
 wire \core_io_ibus_addr[28] ;
 wire \core_io_ibus_addr[29] ;
 wire \core_io_ibus_addr[2] ;
 wire \core_io_ibus_addr[30] ;
 wire \core_io_ibus_addr[31] ;
 wire \core_io_ibus_addr[3] ;
 wire \core_io_ibus_addr[4] ;
 wire \core_io_ibus_addr[5] ;
 wire \core_io_ibus_addr[6] ;
 wire \core_io_ibus_addr[7] ;
 wire \core_io_ibus_addr[8] ;
 wire \core_io_ibus_addr[9] ;
 wire \core_io_ibus_inst[0] ;
 wire \core_io_ibus_inst[10] ;
 wire \core_io_ibus_inst[11] ;
 wire \core_io_ibus_inst[12] ;
 wire \core_io_ibus_inst[13] ;
 wire \core_io_ibus_inst[14] ;
 wire \core_io_ibus_inst[15] ;
 wire \core_io_ibus_inst[16] ;
 wire \core_io_ibus_inst[17] ;
 wire \core_io_ibus_inst[18] ;
 wire \core_io_ibus_inst[19] ;
 wire \core_io_ibus_inst[1] ;
 wire \core_io_ibus_inst[20] ;
 wire \core_io_ibus_inst[21] ;
 wire \core_io_ibus_inst[22] ;
 wire \core_io_ibus_inst[23] ;
 wire \core_io_ibus_inst[24] ;
 wire \core_io_ibus_inst[25] ;
 wire \core_io_ibus_inst[26] ;
 wire \core_io_ibus_inst[27] ;
 wire \core_io_ibus_inst[28] ;
 wire \core_io_ibus_inst[29] ;
 wire \core_io_ibus_inst[2] ;
 wire \core_io_ibus_inst[30] ;
 wire \core_io_ibus_inst[31] ;
 wire \core_io_ibus_inst[3] ;
 wire \core_io_ibus_inst[4] ;
 wire \core_io_ibus_inst[5] ;
 wire \core_io_ibus_inst[6] ;
 wire \core_io_ibus_inst[7] ;
 wire \core_io_ibus_inst[8] ;
 wire \core_io_ibus_inst[9] ;
 wire core_io_ibus_valid;
 wire core_io_irq_motor_irq;
 wire core_io_irq_spi_irq;
 wire core_io_irq_uart_irq;
 wire \dmem_io_addr[0] ;
 wire \dmem_io_addr[1] ;
 wire \dmem_io_addr[2] ;
 wire \dmem_io_addr[3] ;
 wire \dmem_io_addr[4] ;
 wire \dmem_io_addr[5] ;
 wire \dmem_io_addr[6] ;
 wire \dmem_io_addr[7] ;
 wire dmem_io_cs;
 wire \dmem_io_rdata[0] ;
 wire \dmem_io_rdata[10] ;
 wire \dmem_io_rdata[11] ;
 wire \dmem_io_rdata[12] ;
 wire \dmem_io_rdata[13] ;
 wire \dmem_io_rdata[14] ;
 wire \dmem_io_rdata[15] ;
 wire \dmem_io_rdata[16] ;
 wire \dmem_io_rdata[17] ;
 wire \dmem_io_rdata[18] ;
 wire \dmem_io_rdata[19] ;
 wire \dmem_io_rdata[1] ;
 wire \dmem_io_rdata[20] ;
 wire \dmem_io_rdata[21] ;
 wire \dmem_io_rdata[22] ;
 wire \dmem_io_rdata[23] ;
 wire \dmem_io_rdata[24] ;
 wire \dmem_io_rdata[25] ;
 wire \dmem_io_rdata[26] ;
 wire \dmem_io_rdata[27] ;
 wire \dmem_io_rdata[28] ;
 wire \dmem_io_rdata[29] ;
 wire \dmem_io_rdata[2] ;
 wire \dmem_io_rdata[30] ;
 wire \dmem_io_rdata[31] ;
 wire \dmem_io_rdata[3] ;
 wire \dmem_io_rdata[4] ;
 wire \dmem_io_rdata[5] ;
 wire \dmem_io_rdata[6] ;
 wire \dmem_io_rdata[7] ;
 wire \dmem_io_rdata[8] ;
 wire \dmem_io_rdata[9] ;
 wire \dmem_io_st_type[0] ;
 wire \dmem_io_st_type[1] ;
 wire \dmem_io_st_type[2] ;
 wire \dmem_io_st_type[3] ;
 wire \dmem_io_wdata[0] ;
 wire \dmem_io_wdata[10] ;
 wire \dmem_io_wdata[11] ;
 wire \dmem_io_wdata[12] ;
 wire \dmem_io_wdata[13] ;
 wire \dmem_io_wdata[14] ;
 wire \dmem_io_wdata[15] ;
 wire \dmem_io_wdata[16] ;
 wire \dmem_io_wdata[17] ;
 wire \dmem_io_wdata[18] ;
 wire \dmem_io_wdata[19] ;
 wire \dmem_io_wdata[1] ;
 wire \dmem_io_wdata[20] ;
 wire \dmem_io_wdata[21] ;
 wire \dmem_io_wdata[22] ;
 wire \dmem_io_wdata[23] ;
 wire \dmem_io_wdata[24] ;
 wire \dmem_io_wdata[25] ;
 wire \dmem_io_wdata[26] ;
 wire \dmem_io_wdata[27] ;
 wire \dmem_io_wdata[28] ;
 wire \dmem_io_wdata[29] ;
 wire \dmem_io_wdata[2] ;
 wire \dmem_io_wdata[30] ;
 wire \dmem_io_wdata[31] ;
 wire \dmem_io_wdata[3] ;
 wire \dmem_io_wdata[4] ;
 wire \dmem_io_wdata[5] ;
 wire \dmem_io_wdata[6] ;
 wire \dmem_io_wdata[7] ;
 wire \dmem_io_wdata[8] ;
 wire \dmem_io_wdata[9] ;
 wire dmem_io_wr_en;
 wire \imem_io_addr[0] ;
 wire \imem_io_addr[1] ;
 wire \imem_io_addr[2] ;
 wire \imem_io_addr[3] ;
 wire \imem_io_addr[4] ;
 wire \imem_io_addr[5] ;
 wire \imem_io_addr[6] ;
 wire \imem_io_addr[7] ;
 wire \imem_io_addr[8] ;
 wire imem_io_cs;
 wire \imem_io_rdata[0] ;
 wire \imem_io_rdata[10] ;
 wire \imem_io_rdata[11] ;
 wire \imem_io_rdata[12] ;
 wire \imem_io_rdata[13] ;
 wire \imem_io_rdata[14] ;
 wire \imem_io_rdata[15] ;
 wire \imem_io_rdata[16] ;
 wire \imem_io_rdata[17] ;
 wire \imem_io_rdata[18] ;
 wire \imem_io_rdata[19] ;
 wire \imem_io_rdata[1] ;
 wire \imem_io_rdata[20] ;
 wire \imem_io_rdata[21] ;
 wire \imem_io_rdata[22] ;
 wire \imem_io_rdata[23] ;
 wire \imem_io_rdata[24] ;
 wire \imem_io_rdata[25] ;
 wire \imem_io_rdata[26] ;
 wire \imem_io_rdata[27] ;
 wire \imem_io_rdata[28] ;
 wire \imem_io_rdata[29] ;
 wire \imem_io_rdata[2] ;
 wire \imem_io_rdata[30] ;
 wire \imem_io_rdata[31] ;
 wire \imem_io_rdata[3] ;
 wire \imem_io_rdata[4] ;
 wire \imem_io_rdata[5] ;
 wire \imem_io_rdata[6] ;
 wire \imem_io_rdata[7] ;
 wire \imem_io_rdata[8] ;
 wire \imem_io_rdata[9] ;
 wire \imem_io_wdata[0] ;
 wire \imem_io_wdata[10] ;
 wire \imem_io_wdata[11] ;
 wire \imem_io_wdata[12] ;
 wire \imem_io_wdata[13] ;
 wire \imem_io_wdata[14] ;
 wire \imem_io_wdata[15] ;
 wire \imem_io_wdata[16] ;
 wire \imem_io_wdata[17] ;
 wire \imem_io_wdata[18] ;
 wire \imem_io_wdata[19] ;
 wire \imem_io_wdata[1] ;
 wire \imem_io_wdata[20] ;
 wire \imem_io_wdata[21] ;
 wire \imem_io_wdata[22] ;
 wire \imem_io_wdata[23] ;
 wire \imem_io_wdata[24] ;
 wire \imem_io_wdata[25] ;
 wire \imem_io_wdata[26] ;
 wire \imem_io_wdata[27] ;
 wire \imem_io_wdata[28] ;
 wire \imem_io_wdata[29] ;
 wire \imem_io_wdata[2] ;
 wire \imem_io_wdata[30] ;
 wire \imem_io_wdata[31] ;
 wire \imem_io_wdata[3] ;
 wire \imem_io_wdata[4] ;
 wire \imem_io_wdata[5] ;
 wire \imem_io_wdata[6] ;
 wire \imem_io_wdata[7] ;
 wire \imem_io_wdata[8] ;
 wire \imem_io_wdata[9] ;
 wire imem_io_wr_en;
 wire motor_io_ba_match;
 wire motor_io_wbs_ack_o;
 wire \motor_io_wbs_data_o[0] ;
 wire \motor_io_wbs_data_o[10] ;
 wire \motor_io_wbs_data_o[11] ;
 wire \motor_io_wbs_data_o[12] ;
 wire \motor_io_wbs_data_o[13] ;
 wire \motor_io_wbs_data_o[14] ;
 wire \motor_io_wbs_data_o[15] ;
 wire \motor_io_wbs_data_o[16] ;
 wire \motor_io_wbs_data_o[17] ;
 wire \motor_io_wbs_data_o[18] ;
 wire \motor_io_wbs_data_o[19] ;
 wire \motor_io_wbs_data_o[1] ;
 wire \motor_io_wbs_data_o[20] ;
 wire \motor_io_wbs_data_o[21] ;
 wire \motor_io_wbs_data_o[22] ;
 wire \motor_io_wbs_data_o[23] ;
 wire \motor_io_wbs_data_o[24] ;
 wire \motor_io_wbs_data_o[25] ;
 wire \motor_io_wbs_data_o[26] ;
 wire \motor_io_wbs_data_o[27] ;
 wire \motor_io_wbs_data_o[28] ;
 wire \motor_io_wbs_data_o[29] ;
 wire \motor_io_wbs_data_o[2] ;
 wire \motor_io_wbs_data_o[30] ;
 wire \motor_io_wbs_data_o[31] ;
 wire \motor_io_wbs_data_o[3] ;
 wire \motor_io_wbs_data_o[4] ;
 wire \motor_io_wbs_data_o[5] ;
 wire \motor_io_wbs_data_o[6] ;
 wire \motor_io_wbs_data_o[7] ;
 wire \motor_io_wbs_data_o[8] ;
 wire \motor_io_wbs_data_o[9] ;
 wire \motor_io_wbs_m2s_addr[0] ;
 wire \motor_io_wbs_m2s_addr[10] ;
 wire \motor_io_wbs_m2s_addr[11] ;
 wire \motor_io_wbs_m2s_addr[12] ;
 wire \motor_io_wbs_m2s_addr[13] ;
 wire \motor_io_wbs_m2s_addr[14] ;
 wire \motor_io_wbs_m2s_addr[15] ;
 wire \motor_io_wbs_m2s_addr[1] ;
 wire \motor_io_wbs_m2s_addr[2] ;
 wire \motor_io_wbs_m2s_addr[3] ;
 wire \motor_io_wbs_m2s_addr[4] ;
 wire \motor_io_wbs_m2s_addr[5] ;
 wire \motor_io_wbs_m2s_addr[6] ;
 wire \motor_io_wbs_m2s_addr[7] ;
 wire \motor_io_wbs_m2s_addr[8] ;
 wire \motor_io_wbs_m2s_addr[9] ;
 wire \motor_io_wbs_m2s_data[0] ;
 wire \motor_io_wbs_m2s_data[10] ;
 wire \motor_io_wbs_m2s_data[11] ;
 wire \motor_io_wbs_m2s_data[12] ;
 wire \motor_io_wbs_m2s_data[13] ;
 wire \motor_io_wbs_m2s_data[14] ;
 wire \motor_io_wbs_m2s_data[15] ;
 wire \motor_io_wbs_m2s_data[16] ;
 wire \motor_io_wbs_m2s_data[17] ;
 wire \motor_io_wbs_m2s_data[18] ;
 wire \motor_io_wbs_m2s_data[19] ;
 wire \motor_io_wbs_m2s_data[1] ;
 wire \motor_io_wbs_m2s_data[20] ;
 wire \motor_io_wbs_m2s_data[21] ;
 wire \motor_io_wbs_m2s_data[22] ;
 wire \motor_io_wbs_m2s_data[23] ;
 wire \motor_io_wbs_m2s_data[24] ;
 wire \motor_io_wbs_m2s_data[25] ;
 wire \motor_io_wbs_m2s_data[26] ;
 wire \motor_io_wbs_m2s_data[27] ;
 wire \motor_io_wbs_m2s_data[28] ;
 wire \motor_io_wbs_m2s_data[29] ;
 wire \motor_io_wbs_m2s_data[2] ;
 wire \motor_io_wbs_m2s_data[30] ;
 wire \motor_io_wbs_m2s_data[31] ;
 wire \motor_io_wbs_m2s_data[3] ;
 wire \motor_io_wbs_m2s_data[4] ;
 wire \motor_io_wbs_m2s_data[5] ;
 wire \motor_io_wbs_m2s_data[6] ;
 wire \motor_io_wbs_m2s_data[7] ;
 wire \motor_io_wbs_m2s_data[8] ;
 wire \motor_io_wbs_m2s_data[9] ;
 wire \motor_io_wbs_m2s_sel[0] ;
 wire \motor_io_wbs_m2s_sel[1] ;
 wire \motor_io_wbs_m2s_sel[2] ;
 wire \motor_io_wbs_m2s_sel[3] ;
 wire motor_io_wbs_m2s_stb;
 wire motor_io_wbs_m2s_we;

 Core core (.clock(wb_clk_i),
    .io_dbus_rd_en(core_io_dbus_rd_en),
    .io_dbus_valid(core_io_dbus_valid),
    .io_dbus_wr_en(core_io_dbus_wr_en),
    .io_ibus_valid(core_io_ibus_valid),
    .io_irq_motor_irq(core_io_irq_motor_irq),
    .io_irq_spi_irq(core_io_irq_spi_irq),
    .io_irq_uart_irq(core_io_irq_uart_irq),
    .reset(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_dbus_addr({\core_io_dbus_addr[31] ,
    \core_io_dbus_addr[30] ,
    \core_io_dbus_addr[29] ,
    \core_io_dbus_addr[28] ,
    \core_io_dbus_addr[27] ,
    \core_io_dbus_addr[26] ,
    \core_io_dbus_addr[25] ,
    \core_io_dbus_addr[24] ,
    \core_io_dbus_addr[23] ,
    \core_io_dbus_addr[22] ,
    \core_io_dbus_addr[21] ,
    \core_io_dbus_addr[20] ,
    \core_io_dbus_addr[19] ,
    \core_io_dbus_addr[18] ,
    \core_io_dbus_addr[17] ,
    \core_io_dbus_addr[16] ,
    \core_io_dbus_addr[15] ,
    \core_io_dbus_addr[14] ,
    \core_io_dbus_addr[13] ,
    \core_io_dbus_addr[12] ,
    \core_io_dbus_addr[11] ,
    \core_io_dbus_addr[10] ,
    \core_io_dbus_addr[9] ,
    \core_io_dbus_addr[8] ,
    \core_io_dbus_addr[7] ,
    \core_io_dbus_addr[6] ,
    \core_io_dbus_addr[5] ,
    \core_io_dbus_addr[4] ,
    \core_io_dbus_addr[3] ,
    \core_io_dbus_addr[2] ,
    \core_io_dbus_addr[1] ,
    \core_io_dbus_addr[0] }),
    .io_dbus_ld_type({\core_io_dbus_ld_type[2] ,
    \core_io_dbus_ld_type[1] ,
    \core_io_dbus_ld_type[0] }),
    .io_dbus_rdata({\core_io_dbus_rdata[31] ,
    \core_io_dbus_rdata[30] ,
    \core_io_dbus_rdata[29] ,
    \core_io_dbus_rdata[28] ,
    \core_io_dbus_rdata[27] ,
    \core_io_dbus_rdata[26] ,
    \core_io_dbus_rdata[25] ,
    \core_io_dbus_rdata[24] ,
    \core_io_dbus_rdata[23] ,
    \core_io_dbus_rdata[22] ,
    \core_io_dbus_rdata[21] ,
    \core_io_dbus_rdata[20] ,
    \core_io_dbus_rdata[19] ,
    \core_io_dbus_rdata[18] ,
    \core_io_dbus_rdata[17] ,
    \core_io_dbus_rdata[16] ,
    \core_io_dbus_rdata[15] ,
    \core_io_dbus_rdata[14] ,
    \core_io_dbus_rdata[13] ,
    \core_io_dbus_rdata[12] ,
    \core_io_dbus_rdata[11] ,
    \core_io_dbus_rdata[10] ,
    \core_io_dbus_rdata[9] ,
    \core_io_dbus_rdata[8] ,
    \core_io_dbus_rdata[7] ,
    \core_io_dbus_rdata[6] ,
    \core_io_dbus_rdata[5] ,
    \core_io_dbus_rdata[4] ,
    \core_io_dbus_rdata[3] ,
    \core_io_dbus_rdata[2] ,
    \core_io_dbus_rdata[1] ,
    \core_io_dbus_rdata[0] }),
    .io_dbus_st_type({\core_io_dbus_st_type[1] ,
    \core_io_dbus_st_type[0] }),
    .io_dbus_wdata({\core_io_dbus_wdata[31] ,
    \core_io_dbus_wdata[30] ,
    \core_io_dbus_wdata[29] ,
    \core_io_dbus_wdata[28] ,
    \core_io_dbus_wdata[27] ,
    \core_io_dbus_wdata[26] ,
    \core_io_dbus_wdata[25] ,
    \core_io_dbus_wdata[24] ,
    \core_io_dbus_wdata[23] ,
    \core_io_dbus_wdata[22] ,
    \core_io_dbus_wdata[21] ,
    \core_io_dbus_wdata[20] ,
    \core_io_dbus_wdata[19] ,
    \core_io_dbus_wdata[18] ,
    \core_io_dbus_wdata[17] ,
    \core_io_dbus_wdata[16] ,
    \core_io_dbus_wdata[15] ,
    \core_io_dbus_wdata[14] ,
    \core_io_dbus_wdata[13] ,
    \core_io_dbus_wdata[12] ,
    \core_io_dbus_wdata[11] ,
    \core_io_dbus_wdata[10] ,
    \core_io_dbus_wdata[9] ,
    \core_io_dbus_wdata[8] ,
    \core_io_dbus_wdata[7] ,
    \core_io_dbus_wdata[6] ,
    \core_io_dbus_wdata[5] ,
    \core_io_dbus_wdata[4] ,
    \core_io_dbus_wdata[3] ,
    \core_io_dbus_wdata[2] ,
    \core_io_dbus_wdata[1] ,
    \core_io_dbus_wdata[0] }),
    .io_ibus_addr({\core_io_ibus_addr[31] ,
    \core_io_ibus_addr[30] ,
    \core_io_ibus_addr[29] ,
    \core_io_ibus_addr[28] ,
    \core_io_ibus_addr[27] ,
    \core_io_ibus_addr[26] ,
    \core_io_ibus_addr[25] ,
    \core_io_ibus_addr[24] ,
    \core_io_ibus_addr[23] ,
    \core_io_ibus_addr[22] ,
    \core_io_ibus_addr[21] ,
    \core_io_ibus_addr[20] ,
    \core_io_ibus_addr[19] ,
    \core_io_ibus_addr[18] ,
    \core_io_ibus_addr[17] ,
    \core_io_ibus_addr[16] ,
    \core_io_ibus_addr[15] ,
    \core_io_ibus_addr[14] ,
    \core_io_ibus_addr[13] ,
    \core_io_ibus_addr[12] ,
    \core_io_ibus_addr[11] ,
    \core_io_ibus_addr[10] ,
    \core_io_ibus_addr[9] ,
    \core_io_ibus_addr[8] ,
    \core_io_ibus_addr[7] ,
    \core_io_ibus_addr[6] ,
    \core_io_ibus_addr[5] ,
    \core_io_ibus_addr[4] ,
    \core_io_ibus_addr[3] ,
    \core_io_ibus_addr[2] ,
    \core_io_ibus_addr[1] ,
    \core_io_ibus_addr[0] }),
    .io_ibus_inst({\core_io_ibus_inst[31] ,
    \core_io_ibus_inst[30] ,
    \core_io_ibus_inst[29] ,
    \core_io_ibus_inst[28] ,
    \core_io_ibus_inst[27] ,
    \core_io_ibus_inst[26] ,
    \core_io_ibus_inst[25] ,
    \core_io_ibus_inst[24] ,
    \core_io_ibus_inst[23] ,
    \core_io_ibus_inst[22] ,
    \core_io_ibus_inst[21] ,
    \core_io_ibus_inst[20] ,
    \core_io_ibus_inst[19] ,
    \core_io_ibus_inst[18] ,
    \core_io_ibus_inst[17] ,
    \core_io_ibus_inst[16] ,
    \core_io_ibus_inst[15] ,
    \core_io_ibus_inst[14] ,
    \core_io_ibus_inst[13] ,
    \core_io_ibus_inst[12] ,
    \core_io_ibus_inst[11] ,
    \core_io_ibus_inst[10] ,
    \core_io_ibus_inst[9] ,
    \core_io_ibus_inst[8] ,
    \core_io_ibus_inst[7] ,
    \core_io_ibus_inst[6] ,
    \core_io_ibus_inst[5] ,
    \core_io_ibus_inst[4] ,
    \core_io_ibus_inst[3] ,
    \core_io_ibus_inst[2] ,
    \core_io_ibus_inst[1] ,
    \core_io_ibus_inst[0] }));
 sky130_sram_1kbyte_1rw1r_32x256_8 dmem (.csb0(dmem_io_cs),
    .web0(dmem_io_wr_en),
    .clk0(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\dmem_io_addr[7] ,
    \dmem_io_addr[6] ,
    \dmem_io_addr[5] ,
    \dmem_io_addr[4] ,
    \dmem_io_addr[3] ,
    \dmem_io_addr[2] ,
    \dmem_io_addr[1] ,
    \dmem_io_addr[0] }),
    .addr1({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8}),
    .din0({\dmem_io_wdata[31] ,
    \dmem_io_wdata[30] ,
    \dmem_io_wdata[29] ,
    \dmem_io_wdata[28] ,
    \dmem_io_wdata[27] ,
    \dmem_io_wdata[26] ,
    \dmem_io_wdata[25] ,
    \dmem_io_wdata[24] ,
    \dmem_io_wdata[23] ,
    \dmem_io_wdata[22] ,
    \dmem_io_wdata[21] ,
    \dmem_io_wdata[20] ,
    \dmem_io_wdata[19] ,
    \dmem_io_wdata[18] ,
    \dmem_io_wdata[17] ,
    \dmem_io_wdata[16] ,
    \dmem_io_wdata[15] ,
    \dmem_io_wdata[14] ,
    \dmem_io_wdata[13] ,
    \dmem_io_wdata[12] ,
    \dmem_io_wdata[11] ,
    \dmem_io_wdata[10] ,
    \dmem_io_wdata[9] ,
    \dmem_io_wdata[8] ,
    \dmem_io_wdata[7] ,
    \dmem_io_wdata[6] ,
    \dmem_io_wdata[5] ,
    \dmem_io_wdata[4] ,
    \dmem_io_wdata[3] ,
    \dmem_io_wdata[2] ,
    \dmem_io_wdata[1] ,
    \dmem_io_wdata[0] }),
    .dout0({\dmem_io_rdata[31] ,
    \dmem_io_rdata[30] ,
    \dmem_io_rdata[29] ,
    \dmem_io_rdata[28] ,
    \dmem_io_rdata[27] ,
    \dmem_io_rdata[26] ,
    \dmem_io_rdata[25] ,
    \dmem_io_rdata[24] ,
    \dmem_io_rdata[23] ,
    \dmem_io_rdata[22] ,
    \dmem_io_rdata[21] ,
    \dmem_io_rdata[20] ,
    \dmem_io_rdata[19] ,
    \dmem_io_rdata[18] ,
    \dmem_io_rdata[17] ,
    \dmem_io_rdata[16] ,
    \dmem_io_rdata[15] ,
    \dmem_io_rdata[14] ,
    \dmem_io_rdata[13] ,
    \dmem_io_rdata[12] ,
    \dmem_io_rdata[11] ,
    \dmem_io_rdata[10] ,
    \dmem_io_rdata[9] ,
    \dmem_io_rdata[8] ,
    \dmem_io_rdata[7] ,
    \dmem_io_rdata[6] ,
    \dmem_io_rdata[5] ,
    \dmem_io_rdata[4] ,
    \dmem_io_rdata[3] ,
    \dmem_io_rdata[2] ,
    \dmem_io_rdata[1] ,
    \dmem_io_rdata[0] }),
    .dout1({_NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24,
    _NC25,
    _NC26,
    _NC27,
    _NC28,
    _NC29,
    _NC30,
    _NC31,
    _NC32,
    _NC33,
    _NC34,
    _NC35,
    _NC36,
    _NC37,
    _NC38,
    _NC39,
    _NC40}),
    .wmask0({\dmem_io_st_type[3] ,
    \dmem_io_st_type[2] ,
    \dmem_io_st_type[1] ,
    \dmem_io_st_type[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 imem (.csb0(imem_io_cs),
    .web0(imem_io_wr_en),
    .clk0(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\imem_io_addr[8] ,
    \imem_io_addr[7] ,
    \imem_io_addr[6] ,
    \imem_io_addr[5] ,
    \imem_io_addr[4] ,
    \imem_io_addr[3] ,
    \imem_io_addr[2] ,
    \imem_io_addr[1] ,
    \imem_io_addr[0] }),
    .addr1({_NC41,
    _NC42,
    _NC43,
    _NC44,
    _NC45,
    _NC46,
    _NC47,
    _NC48,
    _NC49}),
    .din0({\imem_io_wdata[31] ,
    \imem_io_wdata[30] ,
    \imem_io_wdata[29] ,
    \imem_io_wdata[28] ,
    \imem_io_wdata[27] ,
    \imem_io_wdata[26] ,
    \imem_io_wdata[25] ,
    \imem_io_wdata[24] ,
    \imem_io_wdata[23] ,
    \imem_io_wdata[22] ,
    \imem_io_wdata[21] ,
    \imem_io_wdata[20] ,
    \imem_io_wdata[19] ,
    \imem_io_wdata[18] ,
    \imem_io_wdata[17] ,
    \imem_io_wdata[16] ,
    \imem_io_wdata[15] ,
    \imem_io_wdata[14] ,
    \imem_io_wdata[13] ,
    \imem_io_wdata[12] ,
    \imem_io_wdata[11] ,
    \imem_io_wdata[10] ,
    \imem_io_wdata[9] ,
    \imem_io_wdata[8] ,
    \imem_io_wdata[7] ,
    \imem_io_wdata[6] ,
    \imem_io_wdata[5] ,
    \imem_io_wdata[4] ,
    \imem_io_wdata[3] ,
    \imem_io_wdata[2] ,
    \imem_io_wdata[1] ,
    \imem_io_wdata[0] }),
    .dout0({\imem_io_rdata[31] ,
    \imem_io_rdata[30] ,
    \imem_io_rdata[29] ,
    \imem_io_rdata[28] ,
    \imem_io_rdata[27] ,
    \imem_io_rdata[26] ,
    \imem_io_rdata[25] ,
    \imem_io_rdata[24] ,
    \imem_io_rdata[23] ,
    \imem_io_rdata[22] ,
    \imem_io_rdata[21] ,
    \imem_io_rdata[20] ,
    \imem_io_rdata[19] ,
    \imem_io_rdata[18] ,
    \imem_io_rdata[17] ,
    \imem_io_rdata[16] ,
    \imem_io_rdata[15] ,
    \imem_io_rdata[14] ,
    \imem_io_rdata[13] ,
    \imem_io_rdata[12] ,
    \imem_io_rdata[11] ,
    \imem_io_rdata[10] ,
    \imem_io_rdata[9] ,
    \imem_io_rdata[8] ,
    \imem_io_rdata[7] ,
    \imem_io_rdata[6] ,
    \imem_io_rdata[5] ,
    \imem_io_rdata[4] ,
    \imem_io_rdata[3] ,
    \imem_io_rdata[2] ,
    \imem_io_rdata[1] ,
    \imem_io_rdata[0] }),
    .dout1({_NC50,
    _NC51,
    _NC52,
    _NC53,
    _NC54,
    _NC55,
    _NC56,
    _NC57,
    _NC58,
    _NC59,
    _NC60,
    _NC61,
    _NC62,
    _NC63,
    _NC64,
    _NC65,
    _NC66,
    _NC67,
    _NC68,
    _NC69,
    _NC70,
    _NC71,
    _NC72,
    _NC73,
    _NC74,
    _NC75,
    _NC76,
    _NC77,
    _NC78,
    _NC79,
    _NC80,
    _NC81}),
    .wmask0({\dmem_io_st_type[3] ,
    \dmem_io_st_type[2] ,
    \dmem_io_st_type[1] ,
    \dmem_io_st_type[0] }));
 Motor_Top motor (.clock(wb_clk_i),
    .io_ba_match(motor_io_ba_match),
    .io_motor_irq(core_io_irq_motor_irq),
    .io_pwm_high(io_pwm_high),
    .io_pwm_low(io_pwm_low),
    .io_qei_ch_a(io_in[2]),
    .io_qei_ch_b(io_in[3]),
    .io_wbs_ack_o(motor_io_wbs_ack_o),
    .io_wbs_m2s_stb(motor_io_wbs_m2s_stb),
    .io_wbs_m2s_we(motor_io_wbs_m2s_we),
    .reset(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_wbs_data_o({\motor_io_wbs_data_o[31] ,
    \motor_io_wbs_data_o[30] ,
    \motor_io_wbs_data_o[29] ,
    \motor_io_wbs_data_o[28] ,
    \motor_io_wbs_data_o[27] ,
    \motor_io_wbs_data_o[26] ,
    \motor_io_wbs_data_o[25] ,
    \motor_io_wbs_data_o[24] ,
    \motor_io_wbs_data_o[23] ,
    \motor_io_wbs_data_o[22] ,
    \motor_io_wbs_data_o[21] ,
    \motor_io_wbs_data_o[20] ,
    \motor_io_wbs_data_o[19] ,
    \motor_io_wbs_data_o[18] ,
    \motor_io_wbs_data_o[17] ,
    \motor_io_wbs_data_o[16] ,
    \motor_io_wbs_data_o[15] ,
    \motor_io_wbs_data_o[14] ,
    \motor_io_wbs_data_o[13] ,
    \motor_io_wbs_data_o[12] ,
    \motor_io_wbs_data_o[11] ,
    \motor_io_wbs_data_o[10] ,
    \motor_io_wbs_data_o[9] ,
    \motor_io_wbs_data_o[8] ,
    \motor_io_wbs_data_o[7] ,
    \motor_io_wbs_data_o[6] ,
    \motor_io_wbs_data_o[5] ,
    \motor_io_wbs_data_o[4] ,
    \motor_io_wbs_data_o[3] ,
    \motor_io_wbs_data_o[2] ,
    \motor_io_wbs_data_o[1] ,
    \motor_io_wbs_data_o[0] }),
    .io_wbs_m2s_addr({\motor_io_wbs_m2s_addr[15] ,
    \motor_io_wbs_m2s_addr[14] ,
    \motor_io_wbs_m2s_addr[13] ,
    \motor_io_wbs_m2s_addr[12] ,
    \motor_io_wbs_m2s_addr[11] ,
    \motor_io_wbs_m2s_addr[10] ,
    \motor_io_wbs_m2s_addr[9] ,
    \motor_io_wbs_m2s_addr[8] ,
    \motor_io_wbs_m2s_addr[7] ,
    \motor_io_wbs_m2s_addr[6] ,
    \motor_io_wbs_m2s_addr[5] ,
    \motor_io_wbs_m2s_addr[4] ,
    \motor_io_wbs_m2s_addr[3] ,
    \motor_io_wbs_m2s_addr[2] ,
    \motor_io_wbs_m2s_addr[1] ,
    \motor_io_wbs_m2s_addr[0] }),
    .io_wbs_m2s_data({\motor_io_wbs_m2s_data[31] ,
    \motor_io_wbs_m2s_data[30] ,
    \motor_io_wbs_m2s_data[29] ,
    \motor_io_wbs_m2s_data[28] ,
    \motor_io_wbs_m2s_data[27] ,
    \motor_io_wbs_m2s_data[26] ,
    \motor_io_wbs_m2s_data[25] ,
    \motor_io_wbs_m2s_data[24] ,
    \motor_io_wbs_m2s_data[23] ,
    \motor_io_wbs_m2s_data[22] ,
    \motor_io_wbs_m2s_data[21] ,
    \motor_io_wbs_m2s_data[20] ,
    \motor_io_wbs_m2s_data[19] ,
    \motor_io_wbs_m2s_data[18] ,
    \motor_io_wbs_m2s_data[17] ,
    \motor_io_wbs_m2s_data[16] ,
    \motor_io_wbs_m2s_data[15] ,
    \motor_io_wbs_m2s_data[14] ,
    \motor_io_wbs_m2s_data[13] ,
    \motor_io_wbs_m2s_data[12] ,
    \motor_io_wbs_m2s_data[11] ,
    \motor_io_wbs_m2s_data[10] ,
    \motor_io_wbs_m2s_data[9] ,
    \motor_io_wbs_m2s_data[8] ,
    \motor_io_wbs_m2s_data[7] ,
    \motor_io_wbs_m2s_data[6] ,
    \motor_io_wbs_m2s_data[5] ,
    \motor_io_wbs_m2s_data[4] ,
    \motor_io_wbs_m2s_data[3] ,
    \motor_io_wbs_m2s_data[2] ,
    \motor_io_wbs_m2s_data[1] ,
    \motor_io_wbs_m2s_data[0] }),
    .io_wbs_m2s_sel({\motor_io_wbs_m2s_sel[3] ,
    \motor_io_wbs_m2s_sel[2] ,
    \motor_io_wbs_m2s_sel[1] ,
    \motor_io_wbs_m2s_sel[0] }));
 WB_InterConnect wb_inter_connect (.clock(wb_clk_i),
    .io_dbus_rd_en(core_io_dbus_rd_en),
    .io_dbus_valid(core_io_dbus_valid),
    .io_dbus_wr_en(core_io_dbus_wr_en),
    .io_dmem_io_cs(dmem_io_cs),
    .io_dmem_io_wr_en(dmem_io_wr_en),
    .io_ibus_valid(core_io_ibus_valid),
    .io_imem_io_cs(imem_io_cs),
    .io_imem_io_wr_en(imem_io_wr_en),
    .io_motor_ack_i(motor_io_wbs_ack_o),
    .io_motor_addr_sel(motor_io_ba_match),
    .io_spi_clk(io_spi_clk),
    .io_spi_cs(io_spi_cs),
    .io_spi_irq(core_io_irq_spi_irq),
    .io_spi_miso(io_in[1]),
    .io_spi_mosi(io_spi_mosi),
    .io_uart_irq(core_io_irq_uart_irq),
    .io_uart_rx(io_in[0]),
    .io_uart_tx(io_uart_tx),
    .io_wbm_m2s_stb(motor_io_wbs_m2s_stb),
    .io_wbm_m2s_we(motor_io_wbs_m2s_we),
    .reset(wb_rst_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_dbus_addr({\core_io_dbus_addr[31] ,
    \core_io_dbus_addr[30] ,
    \core_io_dbus_addr[29] ,
    \core_io_dbus_addr[28] ,
    \core_io_dbus_addr[27] ,
    \core_io_dbus_addr[26] ,
    \core_io_dbus_addr[25] ,
    \core_io_dbus_addr[24] ,
    \core_io_dbus_addr[23] ,
    \core_io_dbus_addr[22] ,
    \core_io_dbus_addr[21] ,
    \core_io_dbus_addr[20] ,
    \core_io_dbus_addr[19] ,
    \core_io_dbus_addr[18] ,
    \core_io_dbus_addr[17] ,
    \core_io_dbus_addr[16] ,
    \core_io_dbus_addr[15] ,
    \core_io_dbus_addr[14] ,
    \core_io_dbus_addr[13] ,
    \core_io_dbus_addr[12] ,
    \core_io_dbus_addr[11] ,
    \core_io_dbus_addr[10] ,
    \core_io_dbus_addr[9] ,
    \core_io_dbus_addr[8] ,
    \core_io_dbus_addr[7] ,
    \core_io_dbus_addr[6] ,
    \core_io_dbus_addr[5] ,
    \core_io_dbus_addr[4] ,
    \core_io_dbus_addr[3] ,
    \core_io_dbus_addr[2] ,
    \core_io_dbus_addr[1] ,
    \core_io_dbus_addr[0] }),
    .io_dbus_ld_type({\core_io_dbus_ld_type[2] ,
    \core_io_dbus_ld_type[1] ,
    \core_io_dbus_ld_type[0] }),
    .io_dbus_rdata({\core_io_dbus_rdata[31] ,
    \core_io_dbus_rdata[30] ,
    \core_io_dbus_rdata[29] ,
    \core_io_dbus_rdata[28] ,
    \core_io_dbus_rdata[27] ,
    \core_io_dbus_rdata[26] ,
    \core_io_dbus_rdata[25] ,
    \core_io_dbus_rdata[24] ,
    \core_io_dbus_rdata[23] ,
    \core_io_dbus_rdata[22] ,
    \core_io_dbus_rdata[21] ,
    \core_io_dbus_rdata[20] ,
    \core_io_dbus_rdata[19] ,
    \core_io_dbus_rdata[18] ,
    \core_io_dbus_rdata[17] ,
    \core_io_dbus_rdata[16] ,
    \core_io_dbus_rdata[15] ,
    \core_io_dbus_rdata[14] ,
    \core_io_dbus_rdata[13] ,
    \core_io_dbus_rdata[12] ,
    \core_io_dbus_rdata[11] ,
    \core_io_dbus_rdata[10] ,
    \core_io_dbus_rdata[9] ,
    \core_io_dbus_rdata[8] ,
    \core_io_dbus_rdata[7] ,
    \core_io_dbus_rdata[6] ,
    \core_io_dbus_rdata[5] ,
    \core_io_dbus_rdata[4] ,
    \core_io_dbus_rdata[3] ,
    \core_io_dbus_rdata[2] ,
    \core_io_dbus_rdata[1] ,
    \core_io_dbus_rdata[0] }),
    .io_dbus_st_type({\core_io_dbus_st_type[1] ,
    \core_io_dbus_st_type[0] }),
    .io_dbus_wdata({\core_io_dbus_wdata[31] ,
    \core_io_dbus_wdata[30] ,
    \core_io_dbus_wdata[29] ,
    \core_io_dbus_wdata[28] ,
    \core_io_dbus_wdata[27] ,
    \core_io_dbus_wdata[26] ,
    \core_io_dbus_wdata[25] ,
    \core_io_dbus_wdata[24] ,
    \core_io_dbus_wdata[23] ,
    \core_io_dbus_wdata[22] ,
    \core_io_dbus_wdata[21] ,
    \core_io_dbus_wdata[20] ,
    \core_io_dbus_wdata[19] ,
    \core_io_dbus_wdata[18] ,
    \core_io_dbus_wdata[17] ,
    \core_io_dbus_wdata[16] ,
    \core_io_dbus_wdata[15] ,
    \core_io_dbus_wdata[14] ,
    \core_io_dbus_wdata[13] ,
    \core_io_dbus_wdata[12] ,
    \core_io_dbus_wdata[11] ,
    \core_io_dbus_wdata[10] ,
    \core_io_dbus_wdata[9] ,
    \core_io_dbus_wdata[8] ,
    \core_io_dbus_wdata[7] ,
    \core_io_dbus_wdata[6] ,
    \core_io_dbus_wdata[5] ,
    \core_io_dbus_wdata[4] ,
    \core_io_dbus_wdata[3] ,
    \core_io_dbus_wdata[2] ,
    \core_io_dbus_wdata[1] ,
    \core_io_dbus_wdata[0] }),
    .io_dmem_io_addr({\dmem_io_addr[7] ,
    \dmem_io_addr[6] ,
    \dmem_io_addr[5] ,
    \dmem_io_addr[4] ,
    \dmem_io_addr[3] ,
    \dmem_io_addr[2] ,
    \dmem_io_addr[1] ,
    \dmem_io_addr[0] }),
    .io_dmem_io_rdata({\dmem_io_rdata[31] ,
    \dmem_io_rdata[30] ,
    \dmem_io_rdata[29] ,
    \dmem_io_rdata[28] ,
    \dmem_io_rdata[27] ,
    \dmem_io_rdata[26] ,
    \dmem_io_rdata[25] ,
    \dmem_io_rdata[24] ,
    \dmem_io_rdata[23] ,
    \dmem_io_rdata[22] ,
    \dmem_io_rdata[21] ,
    \dmem_io_rdata[20] ,
    \dmem_io_rdata[19] ,
    \dmem_io_rdata[18] ,
    \dmem_io_rdata[17] ,
    \dmem_io_rdata[16] ,
    \dmem_io_rdata[15] ,
    \dmem_io_rdata[14] ,
    \dmem_io_rdata[13] ,
    \dmem_io_rdata[12] ,
    \dmem_io_rdata[11] ,
    \dmem_io_rdata[10] ,
    \dmem_io_rdata[9] ,
    \dmem_io_rdata[8] ,
    \dmem_io_rdata[7] ,
    \dmem_io_rdata[6] ,
    \dmem_io_rdata[5] ,
    \dmem_io_rdata[4] ,
    \dmem_io_rdata[3] ,
    \dmem_io_rdata[2] ,
    \dmem_io_rdata[1] ,
    \dmem_io_rdata[0] }),
    .io_dmem_io_st_type({\dmem_io_st_type[3] ,
    \dmem_io_st_type[2] ,
    \dmem_io_st_type[1] ,
    \dmem_io_st_type[0] }),
    .io_dmem_io_wdata({\dmem_io_wdata[31] ,
    \dmem_io_wdata[30] ,
    \dmem_io_wdata[29] ,
    \dmem_io_wdata[28] ,
    \dmem_io_wdata[27] ,
    \dmem_io_wdata[26] ,
    \dmem_io_wdata[25] ,
    \dmem_io_wdata[24] ,
    \dmem_io_wdata[23] ,
    \dmem_io_wdata[22] ,
    \dmem_io_wdata[21] ,
    \dmem_io_wdata[20] ,
    \dmem_io_wdata[19] ,
    \dmem_io_wdata[18] ,
    \dmem_io_wdata[17] ,
    \dmem_io_wdata[16] ,
    \dmem_io_wdata[15] ,
    \dmem_io_wdata[14] ,
    \dmem_io_wdata[13] ,
    \dmem_io_wdata[12] ,
    \dmem_io_wdata[11] ,
    \dmem_io_wdata[10] ,
    \dmem_io_wdata[9] ,
    \dmem_io_wdata[8] ,
    \dmem_io_wdata[7] ,
    \dmem_io_wdata[6] ,
    \dmem_io_wdata[5] ,
    \dmem_io_wdata[4] ,
    \dmem_io_wdata[3] ,
    \dmem_io_wdata[2] ,
    \dmem_io_wdata[1] ,
    \dmem_io_wdata[0] }),
    .io_ibus_addr({\core_io_ibus_addr[31] ,
    \core_io_ibus_addr[30] ,
    \core_io_ibus_addr[29] ,
    \core_io_ibus_addr[28] ,
    \core_io_ibus_addr[27] ,
    \core_io_ibus_addr[26] ,
    \core_io_ibus_addr[25] ,
    \core_io_ibus_addr[24] ,
    \core_io_ibus_addr[23] ,
    \core_io_ibus_addr[22] ,
    \core_io_ibus_addr[21] ,
    \core_io_ibus_addr[20] ,
    \core_io_ibus_addr[19] ,
    \core_io_ibus_addr[18] ,
    \core_io_ibus_addr[17] ,
    \core_io_ibus_addr[16] ,
    \core_io_ibus_addr[15] ,
    \core_io_ibus_addr[14] ,
    \core_io_ibus_addr[13] ,
    \core_io_ibus_addr[12] ,
    \core_io_ibus_addr[11] ,
    \core_io_ibus_addr[10] ,
    \core_io_ibus_addr[9] ,
    \core_io_ibus_addr[8] ,
    \core_io_ibus_addr[7] ,
    \core_io_ibus_addr[6] ,
    \core_io_ibus_addr[5] ,
    \core_io_ibus_addr[4] ,
    \core_io_ibus_addr[3] ,
    \core_io_ibus_addr[2] ,
    \core_io_ibus_addr[1] ,
    \core_io_ibus_addr[0] }),
    .io_ibus_inst({\core_io_ibus_inst[31] ,
    \core_io_ibus_inst[30] ,
    \core_io_ibus_inst[29] ,
    \core_io_ibus_inst[28] ,
    \core_io_ibus_inst[27] ,
    \core_io_ibus_inst[26] ,
    \core_io_ibus_inst[25] ,
    \core_io_ibus_inst[24] ,
    \core_io_ibus_inst[23] ,
    \core_io_ibus_inst[22] ,
    \core_io_ibus_inst[21] ,
    \core_io_ibus_inst[20] ,
    \core_io_ibus_inst[19] ,
    \core_io_ibus_inst[18] ,
    \core_io_ibus_inst[17] ,
    \core_io_ibus_inst[16] ,
    \core_io_ibus_inst[15] ,
    \core_io_ibus_inst[14] ,
    \core_io_ibus_inst[13] ,
    \core_io_ibus_inst[12] ,
    \core_io_ibus_inst[11] ,
    \core_io_ibus_inst[10] ,
    \core_io_ibus_inst[9] ,
    \core_io_ibus_inst[8] ,
    \core_io_ibus_inst[7] ,
    \core_io_ibus_inst[6] ,
    \core_io_ibus_inst[5] ,
    \core_io_ibus_inst[4] ,
    \core_io_ibus_inst[3] ,
    \core_io_ibus_inst[2] ,
    \core_io_ibus_inst[1] ,
    \core_io_ibus_inst[0] }),
    .io_imem_io_addr({\imem_io_addr[8] ,
    \imem_io_addr[7] ,
    \imem_io_addr[6] ,
    \imem_io_addr[5] ,
    \imem_io_addr[4] ,
    \imem_io_addr[3] ,
    \imem_io_addr[2] ,
    \imem_io_addr[1] ,
    \imem_io_addr[0] }),
    .io_imem_io_rdata({\imem_io_rdata[31] ,
    \imem_io_rdata[30] ,
    \imem_io_rdata[29] ,
    \imem_io_rdata[28] ,
    \imem_io_rdata[27] ,
    \imem_io_rdata[26] ,
    \imem_io_rdata[25] ,
    \imem_io_rdata[24] ,
    \imem_io_rdata[23] ,
    \imem_io_rdata[22] ,
    \imem_io_rdata[21] ,
    \imem_io_rdata[20] ,
    \imem_io_rdata[19] ,
    \imem_io_rdata[18] ,
    \imem_io_rdata[17] ,
    \imem_io_rdata[16] ,
    \imem_io_rdata[15] ,
    \imem_io_rdata[14] ,
    \imem_io_rdata[13] ,
    \imem_io_rdata[12] ,
    \imem_io_rdata[11] ,
    \imem_io_rdata[10] ,
    \imem_io_rdata[9] ,
    \imem_io_rdata[8] ,
    \imem_io_rdata[7] ,
    \imem_io_rdata[6] ,
    \imem_io_rdata[5] ,
    \imem_io_rdata[4] ,
    \imem_io_rdata[3] ,
    \imem_io_rdata[2] ,
    \imem_io_rdata[1] ,
    \imem_io_rdata[0] }),
    .io_imem_io_wdata({\imem_io_wdata[31] ,
    \imem_io_wdata[30] ,
    \imem_io_wdata[29] ,
    \imem_io_wdata[28] ,
    \imem_io_wdata[27] ,
    \imem_io_wdata[26] ,
    \imem_io_wdata[25] ,
    \imem_io_wdata[24] ,
    \imem_io_wdata[23] ,
    \imem_io_wdata[22] ,
    \imem_io_wdata[21] ,
    \imem_io_wdata[20] ,
    \imem_io_wdata[19] ,
    \imem_io_wdata[18] ,
    \imem_io_wdata[17] ,
    \imem_io_wdata[16] ,
    \imem_io_wdata[15] ,
    \imem_io_wdata[14] ,
    \imem_io_wdata[13] ,
    \imem_io_wdata[12] ,
    \imem_io_wdata[11] ,
    \imem_io_wdata[10] ,
    \imem_io_wdata[9] ,
    \imem_io_wdata[8] ,
    \imem_io_wdata[7] ,
    \imem_io_wdata[6] ,
    \imem_io_wdata[5] ,
    \imem_io_wdata[4] ,
    \imem_io_wdata[3] ,
    \imem_io_wdata[2] ,
    \imem_io_wdata[1] ,
    \imem_io_wdata[0] }),
    .io_motor_data_i({\motor_io_wbs_data_o[31] ,
    \motor_io_wbs_data_o[30] ,
    \motor_io_wbs_data_o[29] ,
    \motor_io_wbs_data_o[28] ,
    \motor_io_wbs_data_o[27] ,
    \motor_io_wbs_data_o[26] ,
    \motor_io_wbs_data_o[25] ,
    \motor_io_wbs_data_o[24] ,
    \motor_io_wbs_data_o[23] ,
    \motor_io_wbs_data_o[22] ,
    \motor_io_wbs_data_o[21] ,
    \motor_io_wbs_data_o[20] ,
    \motor_io_wbs_data_o[19] ,
    \motor_io_wbs_data_o[18] ,
    \motor_io_wbs_data_o[17] ,
    \motor_io_wbs_data_o[16] ,
    \motor_io_wbs_data_o[15] ,
    \motor_io_wbs_data_o[14] ,
    \motor_io_wbs_data_o[13] ,
    \motor_io_wbs_data_o[12] ,
    \motor_io_wbs_data_o[11] ,
    \motor_io_wbs_data_o[10] ,
    \motor_io_wbs_data_o[9] ,
    \motor_io_wbs_data_o[8] ,
    \motor_io_wbs_data_o[7] ,
    \motor_io_wbs_data_o[6] ,
    \motor_io_wbs_data_o[5] ,
    \motor_io_wbs_data_o[4] ,
    \motor_io_wbs_data_o[3] ,
    \motor_io_wbs_data_o[2] ,
    \motor_io_wbs_data_o[1] ,
    \motor_io_wbs_data_o[0] }),
    .io_wbm_m2s_addr({\motor_io_wbs_m2s_addr[15] ,
    \motor_io_wbs_m2s_addr[14] ,
    \motor_io_wbs_m2s_addr[13] ,
    \motor_io_wbs_m2s_addr[12] ,
    \motor_io_wbs_m2s_addr[11] ,
    \motor_io_wbs_m2s_addr[10] ,
    \motor_io_wbs_m2s_addr[9] ,
    \motor_io_wbs_m2s_addr[8] ,
    \motor_io_wbs_m2s_addr[7] ,
    \motor_io_wbs_m2s_addr[6] ,
    \motor_io_wbs_m2s_addr[5] ,
    \motor_io_wbs_m2s_addr[4] ,
    \motor_io_wbs_m2s_addr[3] ,
    \motor_io_wbs_m2s_addr[2] ,
    \motor_io_wbs_m2s_addr[1] ,
    \motor_io_wbs_m2s_addr[0] }),
    .io_wbm_m2s_data({\motor_io_wbs_m2s_data[31] ,
    \motor_io_wbs_m2s_data[30] ,
    \motor_io_wbs_m2s_data[29] ,
    \motor_io_wbs_m2s_data[28] ,
    \motor_io_wbs_m2s_data[27] ,
    \motor_io_wbs_m2s_data[26] ,
    \motor_io_wbs_m2s_data[25] ,
    \motor_io_wbs_m2s_data[24] ,
    \motor_io_wbs_m2s_data[23] ,
    \motor_io_wbs_m2s_data[22] ,
    \motor_io_wbs_m2s_data[21] ,
    \motor_io_wbs_m2s_data[20] ,
    \motor_io_wbs_m2s_data[19] ,
    \motor_io_wbs_m2s_data[18] ,
    \motor_io_wbs_m2s_data[17] ,
    \motor_io_wbs_m2s_data[16] ,
    \motor_io_wbs_m2s_data[15] ,
    \motor_io_wbs_m2s_data[14] ,
    \motor_io_wbs_m2s_data[13] ,
    \motor_io_wbs_m2s_data[12] ,
    \motor_io_wbs_m2s_data[11] ,
    \motor_io_wbs_m2s_data[10] ,
    \motor_io_wbs_m2s_data[9] ,
    \motor_io_wbs_m2s_data[8] ,
    \motor_io_wbs_m2s_data[7] ,
    \motor_io_wbs_m2s_data[6] ,
    \motor_io_wbs_m2s_data[5] ,
    \motor_io_wbs_m2s_data[4] ,
    \motor_io_wbs_m2s_data[3] ,
    \motor_io_wbs_m2s_data[2] ,
    \motor_io_wbs_m2s_data[1] ,
    \motor_io_wbs_m2s_data[0] }),
    .io_wbm_m2s_sel({\motor_io_wbs_m2s_sel[3] ,
    \motor_io_wbs_m2s_sel[2] ,
    \motor_io_wbs_m2s_sel[1] ,
    \motor_io_wbs_m2s_sel[0] }));
 assign io_out[0] = io_uart_tx;
 assign io_out[1] = io_spi_cs;
 assign io_out[2] = io_spi_clk;
 assign io_out[3] = io_spi_mosi;
 assign io_out[4] = io_pwm_high;
 assign io_out[5] = io_pwm_low;
endmodule
