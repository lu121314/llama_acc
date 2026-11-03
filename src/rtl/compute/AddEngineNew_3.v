// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AddEngineNew_3 (
  input  wire          mulRes_tvalid,
  output wire          mulRes_tready,
  input  wire [511:0]  mulRes_tdata,
  input  wire          resAdd_tvalid,
  output wire          resAdd_tready,
  input  wire [511:0]  resAdd_tdata,
  output wire          vecOut_tvalid,
  output wire [511:0]  vecOut_tdata,
  output wire [5:0]    vecOut_tuser,
  output wire          scalarOut_tvalid,
  output wire          scalarOut_tlast,
  output wire [15:0]   scalarOut_tdata,
  output wire [5:0]    scalarOut_tuser,
  input  wire          cfg_tvalid,
  output wire          cfg_tready,
  input  wire [31:0]   cfg_tdata,
  output wire [5:0]    postCfgTag,
  input  wire          popVldNext,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                fifoCtrl_io_push_valid;
  wire       [511:0]  fifoCtrl_io_push_payload;
  wire                fifoCtrl_io_pop_ready;
  wire       [511:0]  fifoCtrl_rdPort_rsp;
  reg        [511:0]  t_1_spinal_port1;
  wire                fifoCtrl_io_push_ready;
  wire                fifoCtrl_io_pop_valid;
  wire       [511:0]  fifoCtrl_io_pop_payload;
  wire       [5:0]    fifoCtrl_io_occupancy;
  wire       [5:0]    fifoCtrl_io_availability;
  wire                fifoCtrl_rdPort_cmd_valid;
  wire       [4:0]    fifoCtrl_rdPort_cmd_payload;
  wire                fifoCtrl_wrPort_valid;
  wire       [4:0]    fifoCtrl_wrPort_payload_address;
  wire       [511:0]  fifoCtrl_wrPort_payload_data;
  wire                addLogic_a_0_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_0_add_ip_m_axis_result_tdata;
  wire                addLogic_a_1_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_1_add_ip_m_axis_result_tdata;
  wire                addLogic_a_2_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_2_add_ip_m_axis_result_tdata;
  wire                addLogic_a_3_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_3_add_ip_m_axis_result_tdata;
  wire                addLogic_a_4_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_4_add_ip_m_axis_result_tdata;
  wire                addLogic_a_5_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_5_add_ip_m_axis_result_tdata;
  wire                addLogic_a_6_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_6_add_ip_m_axis_result_tdata;
  wire                addLogic_a_7_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_7_add_ip_m_axis_result_tdata;
  wire                addLogic_a_8_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_8_add_ip_m_axis_result_tdata;
  wire                addLogic_a_9_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_9_add_ip_m_axis_result_tdata;
  wire                addLogic_a_10_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_10_add_ip_m_axis_result_tdata;
  wire                addLogic_a_11_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_11_add_ip_m_axis_result_tdata;
  wire                addLogic_a_12_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_12_add_ip_m_axis_result_tdata;
  wire                addLogic_a_13_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_13_add_ip_m_axis_result_tdata;
  wire                addLogic_a_14_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_14_add_ip_m_axis_result_tdata;
  wire                addLogic_a_15_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_15_add_ip_m_axis_result_tdata;
  wire                addLogic_a_16_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_16_add_ip_m_axis_result_tdata;
  wire                addLogic_a_17_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_17_add_ip_m_axis_result_tdata;
  wire                addLogic_a_18_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_18_add_ip_m_axis_result_tdata;
  wire                addLogic_a_19_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_19_add_ip_m_axis_result_tdata;
  wire                addLogic_a_20_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_20_add_ip_m_axis_result_tdata;
  wire                addLogic_a_21_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_21_add_ip_m_axis_result_tdata;
  wire                addLogic_a_22_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_22_add_ip_m_axis_result_tdata;
  wire                addLogic_a_23_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_23_add_ip_m_axis_result_tdata;
  wire                addLogic_a_24_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_24_add_ip_m_axis_result_tdata;
  wire                addLogic_a_25_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_25_add_ip_m_axis_result_tdata;
  wire                addLogic_a_26_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_26_add_ip_m_axis_result_tdata;
  wire                addLogic_a_27_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_27_add_ip_m_axis_result_tdata;
  wire                addLogic_a_28_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_28_add_ip_m_axis_result_tdata;
  wire                addLogic_a_29_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_29_add_ip_m_axis_result_tdata;
  wire                addLogic_a_30_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_30_add_ip_m_axis_result_tdata;
  wire                addLogic_a_31_add_ip_m_axis_result_tvalid;
  wire       [15:0]   addLogic_a_31_add_ip_m_axis_result_tdata;
  reg        [15:0]   t_addLogic_a_0_payload;
  reg        [15:0]   t_addLogic_b_0_payload;
  reg        [15:0]   t_addLogic_a_1_payload;
  reg        [15:0]   t_addLogic_b_1_payload;
  reg        [15:0]   t_addLogic_a_2_payload;
  reg        [15:0]   t_addLogic_b_2_payload;
  reg        [15:0]   t_addLogic_a_3_payload;
  reg        [15:0]   t_addLogic_b_3_payload;
  reg        [15:0]   t_addLogic_a_4_payload;
  reg        [15:0]   t_addLogic_b_4_payload;
  reg        [15:0]   t_addLogic_a_5_payload;
  reg        [15:0]   t_addLogic_b_5_payload;
  reg        [15:0]   t_addLogic_a_6_payload;
  reg        [15:0]   t_addLogic_b_6_payload;
  reg        [15:0]   t_addLogic_a_7_payload;
  reg        [15:0]   t_addLogic_b_7_payload;
  reg        [15:0]   t_addLogic_a_8_payload;
  reg        [15:0]   t_addLogic_b_8_payload;
  reg        [15:0]   t_addLogic_a_9_payload;
  reg        [15:0]   t_addLogic_b_9_payload;
  reg        [15:0]   t_addLogic_a_10_payload;
  reg        [15:0]   t_addLogic_b_10_payload;
  reg        [15:0]   t_addLogic_a_11_payload;
  reg        [15:0]   t_addLogic_b_11_payload;
  reg        [15:0]   t_addLogic_a_12_payload;
  reg        [15:0]   t_addLogic_b_12_payload;
  reg        [15:0]   t_addLogic_a_13_payload;
  reg        [15:0]   t_addLogic_b_13_payload;
  reg        [15:0]   t_addLogic_a_14_payload;
  reg        [15:0]   t_addLogic_b_14_payload;
  reg        [15:0]   t_addLogic_a_15_payload;
  reg        [15:0]   t_addLogic_b_15_payload;
  reg        [15:0]   t_addLogic_a_16_payload;
  reg        [15:0]   t_addLogic_b_16_payload;
  reg        [15:0]   t_addLogic_a_17_payload;
  reg        [15:0]   t_addLogic_b_17_payload;
  reg        [15:0]   t_addLogic_a_18_payload;
  reg        [15:0]   t_addLogic_b_18_payload;
  reg        [15:0]   t_addLogic_a_19_payload;
  reg        [15:0]   t_addLogic_b_19_payload;
  reg        [15:0]   t_addLogic_a_20_payload;
  reg        [15:0]   t_addLogic_b_20_payload;
  reg        [15:0]   t_addLogic_a_21_payload;
  reg        [15:0]   t_addLogic_b_21_payload;
  reg        [15:0]   t_addLogic_a_22_payload;
  reg        [15:0]   t_addLogic_b_22_payload;
  reg        [15:0]   t_addLogic_a_23_payload;
  reg        [15:0]   t_addLogic_b_23_payload;
  reg        [15:0]   t_addLogic_a_24_payload;
  reg        [15:0]   t_addLogic_b_24_payload;
  reg        [15:0]   t_addLogic_a_25_payload;
  reg        [15:0]   t_addLogic_b_25_payload;
  reg        [15:0]   t_addLogic_a_26_payload;
  reg        [15:0]   t_addLogic_b_26_payload;
  reg        [15:0]   t_addLogic_a_27_payload;
  reg        [15:0]   t_addLogic_b_27_payload;
  reg        [15:0]   t_addLogic_a_28_payload;
  reg        [15:0]   t_addLogic_b_28_payload;
  reg        [15:0]   t_addLogic_a_29_payload;
  reg        [15:0]   t_addLogic_b_29_payload;
  reg        [15:0]   t_addLogic_a_30_payload;
  reg        [15:0]   t_addLogic_b_30_payload;
  reg        [15:0]   t_addLogic_a_31_payload;
  reg        [15:0]   t_addLogic_b_31_payload;
  wire       [255:0]  t_io_push_payload;
  wire       [255:0]  t_vecOut_tdata;
  wire       [6:0]    t_dotCtrl_accCntOvf;
  wire       [16:0]   t_pAxpyCtrl_mulResCntOvfNext;
  wire                t_when;
  wire       [16:0]   t_pAxpyCtrl_lastElemNext_2;
  wire       [16:0]   t_pAxpyCtrl_lastElemNext_3;
  wire       [16:0]   t_pAxpyCtrl_lastElemNext_4;
  reg                 t_io_push_valid;
  reg                 t_io_pop_ready;
  reg        [1:0]    t_aSelNext;
  reg        [1:0]    t_bSelNext;
  reg                 mulResFire;
  wire                mulResFireNext;
  wire       [5:0]    tag;
  reg        [5:0]    tag_delay_1;
  reg        [5:0]    tag_delay_2;
  reg        [5:0]    tag_delay_3;
  reg        [5:0]    tag_delay_4;
  reg        [5:0]    tag_delay_5;
  reg        [5:0]    tag_delay_6;
  reg        [5:0]    tag_delay_7;
  reg        [5:0]    tag_delay_8;
  reg        [5:0]    tag_delay_9;
  reg        [5:0]    tag_delay_10;
  reg        [5:0]    tag_delay_11;
  reg        [5:0]    tag_delay_12;
  reg        [5:0]    tag_delay_13;
  reg        [5:0]    tag_delay_14;
  reg        [5:0]    tag_delay_15;
  reg        [5:0]    tag_delay_16;
  reg        [5:0]    tag_delay_17;
  reg        [5:0]    tag_delay_18;
  reg        [5:0]    tag_delay_19;
  reg        [5:0]    tag_delay_20;
  reg        [5:0]    tag_delay_21;
  reg        [5:0]    tagReduceDly;
  reg        [5:0]    tag_delay_1_1;
  reg        [5:0]    tag_delay_2_1;
  reg        [5:0]    tag_delay_3_1;
  reg        [5:0]    tag_delay_4_1;
  reg        [5:0]    tag_delay_5_1;
  reg        [5:0]    tagAddDly;
  wire                dotCond;
  wire                fAxpyCond;
  wire                pAxpyCond;
  reg                 ret_0_valid;
  wire                ret_0_ready;
  wire       [31:0]   ret_0_payload;
  reg                 ret_1_valid;
  wire                ret_1_ready;
  wire       [31:0]   ret_1_payload;
  reg                 ret_2_valid;
  wire                ret_2_ready;
  wire       [31:0]   ret_2_payload;
  wire       [1:0]    addLogic_aSel;
  wire       [1:0]    addLogic_bSel;
  wire       [15:0]   addLogic_mul_0;
  wire       [15:0]   addLogic_mul_1;
  wire       [15:0]   addLogic_mul_2;
  wire       [15:0]   addLogic_mul_3;
  wire       [15:0]   addLogic_mul_4;
  wire       [15:0]   addLogic_mul_5;
  wire       [15:0]   addLogic_mul_6;
  wire       [15:0]   addLogic_mul_7;
  wire       [15:0]   addLogic_mul_8;
  wire       [15:0]   addLogic_mul_9;
  wire       [15:0]   addLogic_mul_10;
  wire       [15:0]   addLogic_mul_11;
  wire       [15:0]   addLogic_mul_12;
  wire       [15:0]   addLogic_mul_13;
  wire       [15:0]   addLogic_mul_14;
  wire       [15:0]   addLogic_mul_15;
  wire       [15:0]   addLogic_mul_16;
  wire       [15:0]   addLogic_mul_17;
  wire       [15:0]   addLogic_mul_18;
  wire       [15:0]   addLogic_mul_19;
  wire       [15:0]   addLogic_mul_20;
  wire       [15:0]   addLogic_mul_21;
  wire       [15:0]   addLogic_mul_22;
  wire       [15:0]   addLogic_mul_23;
  wire       [15:0]   addLogic_mul_24;
  wire       [15:0]   addLogic_mul_25;
  wire       [15:0]   addLogic_mul_26;
  wire       [15:0]   addLogic_mul_27;
  wire       [15:0]   addLogic_mul_28;
  wire       [15:0]   addLogic_mul_29;
  wire       [15:0]   addLogic_mul_30;
  wire       [15:0]   addLogic_mul_31;
  wire       [15:0]   addLogic_psum_0;
  wire       [15:0]   addLogic_psum_1;
  wire       [15:0]   addLogic_psum_2;
  wire       [15:0]   addLogic_psum_3;
  wire       [15:0]   addLogic_psum_4;
  wire       [15:0]   addLogic_psum_5;
  wire       [15:0]   addLogic_psum_6;
  wire       [15:0]   addLogic_psum_7;
  wire       [15:0]   addLogic_psum_8;
  wire       [15:0]   addLogic_psum_9;
  wire       [15:0]   addLogic_psum_10;
  wire       [15:0]   addLogic_psum_11;
  wire       [15:0]   addLogic_psum_12;
  wire       [15:0]   addLogic_psum_13;
  wire       [15:0]   addLogic_psum_14;
  wire       [15:0]   addLogic_psum_15;
  wire       [15:0]   addLogic_psum_16;
  wire       [15:0]   addLogic_psum_17;
  wire       [15:0]   addLogic_psum_18;
  wire       [15:0]   addLogic_psum_19;
  wire       [15:0]   addLogic_psum_20;
  wire       [15:0]   addLogic_psum_21;
  wire       [15:0]   addLogic_psum_22;
  wire       [15:0]   addLogic_psum_23;
  wire       [15:0]   addLogic_psum_24;
  wire       [15:0]   addLogic_psum_25;
  wire       [15:0]   addLogic_psum_26;
  wire       [15:0]   addLogic_psum_27;
  wire       [15:0]   addLogic_psum_28;
  wire       [15:0]   addLogic_psum_29;
  wire       [15:0]   addLogic_psum_30;
  wire       [15:0]   addLogic_psum_31;
  wire       [15:0]   addLogic_psumDly_0;
  wire       [15:0]   addLogic_psumDly_1;
  wire       [15:0]   addLogic_psumDly_2;
  wire       [15:0]   addLogic_psumDly_3;
  wire       [15:0]   addLogic_psumDly_4;
  wire       [15:0]   addLogic_psumDly_5;
  wire       [15:0]   addLogic_psumDly_6;
  wire       [15:0]   addLogic_psumDly_7;
  wire       [15:0]   addLogic_psumDly_8;
  wire       [15:0]   addLogic_psumDly_9;
  wire       [15:0]   addLogic_psumDly_10;
  wire       [15:0]   addLogic_psumDly_11;
  wire       [15:0]   addLogic_psumDly_12;
  wire       [15:0]   addLogic_psumDly_13;
  wire       [15:0]   addLogic_psumDly_14;
  wire       [15:0]   addLogic_psumDly_15;
  wire       [15:0]   addLogic_psumDly_16;
  wire       [15:0]   addLogic_psumDly_17;
  wire       [15:0]   addLogic_psumDly_18;
  wire       [15:0]   addLogic_psumDly_19;
  wire       [15:0]   addLogic_psumDly_20;
  wire       [15:0]   addLogic_psumDly_21;
  wire       [15:0]   addLogic_psumDly_22;
  wire       [15:0]   addLogic_psumDly_23;
  wire       [15:0]   addLogic_psumDly_24;
  wire       [15:0]   addLogic_psumDly_25;
  wire       [15:0]   addLogic_psumDly_26;
  wire       [15:0]   addLogic_psumDly_27;
  wire       [15:0]   addLogic_psumDly_28;
  wire       [15:0]   addLogic_psumDly_29;
  wire       [15:0]   addLogic_psumDly_30;
  wire       [15:0]   addLogic_psumDly_31;
  wire       [15:0]   addLogic_res_0;
  wire       [15:0]   addLogic_res_1;
  wire       [15:0]   addLogic_res_2;
  wire       [15:0]   addLogic_res_3;
  wire       [15:0]   addLogic_res_4;
  wire       [15:0]   addLogic_res_5;
  wire       [15:0]   addLogic_res_6;
  wire       [15:0]   addLogic_res_7;
  wire       [15:0]   addLogic_res_8;
  wire       [15:0]   addLogic_res_9;
  wire       [15:0]   addLogic_res_10;
  wire       [15:0]   addLogic_res_11;
  wire       [15:0]   addLogic_res_12;
  wire       [15:0]   addLogic_res_13;
  wire       [15:0]   addLogic_res_14;
  wire       [15:0]   addLogic_res_15;
  wire       [15:0]   addLogic_res_16;
  wire       [15:0]   addLogic_res_17;
  wire       [15:0]   addLogic_res_18;
  wire       [15:0]   addLogic_res_19;
  wire       [15:0]   addLogic_res_20;
  wire       [15:0]   addLogic_res_21;
  wire       [15:0]   addLogic_res_22;
  wire       [15:0]   addLogic_res_23;
  wire       [15:0]   addLogic_res_24;
  wire       [15:0]   addLogic_res_25;
  wire       [15:0]   addLogic_res_26;
  wire       [15:0]   addLogic_res_27;
  wire       [15:0]   addLogic_res_28;
  wire       [15:0]   addLogic_res_29;
  wire       [15:0]   addLogic_res_30;
  wire       [15:0]   addLogic_res_31;
  wire       [15:0]   addLogic_zero;
  wire                addLogic_a_0_valid;
  wire       [15:0]   addLogic_a_0_payload;
  wire                addLogic_a_1_valid;
  wire       [15:0]   addLogic_a_1_payload;
  wire                addLogic_a_2_valid;
  wire       [15:0]   addLogic_a_2_payload;
  wire                addLogic_a_3_valid;
  wire       [15:0]   addLogic_a_3_payload;
  wire                addLogic_a_4_valid;
  wire       [15:0]   addLogic_a_4_payload;
  wire                addLogic_a_5_valid;
  wire       [15:0]   addLogic_a_5_payload;
  wire                addLogic_a_6_valid;
  wire       [15:0]   addLogic_a_6_payload;
  wire                addLogic_a_7_valid;
  wire       [15:0]   addLogic_a_7_payload;
  wire                addLogic_a_8_valid;
  wire       [15:0]   addLogic_a_8_payload;
  wire                addLogic_a_9_valid;
  wire       [15:0]   addLogic_a_9_payload;
  wire                addLogic_a_10_valid;
  wire       [15:0]   addLogic_a_10_payload;
  wire                addLogic_a_11_valid;
  wire       [15:0]   addLogic_a_11_payload;
  wire                addLogic_a_12_valid;
  wire       [15:0]   addLogic_a_12_payload;
  wire                addLogic_a_13_valid;
  wire       [15:0]   addLogic_a_13_payload;
  wire                addLogic_a_14_valid;
  wire       [15:0]   addLogic_a_14_payload;
  wire                addLogic_a_15_valid;
  wire       [15:0]   addLogic_a_15_payload;
  wire                addLogic_a_16_valid;
  wire       [15:0]   addLogic_a_16_payload;
  wire                addLogic_a_17_valid;
  wire       [15:0]   addLogic_a_17_payload;
  wire                addLogic_a_18_valid;
  wire       [15:0]   addLogic_a_18_payload;
  wire                addLogic_a_19_valid;
  wire       [15:0]   addLogic_a_19_payload;
  wire                addLogic_a_20_valid;
  wire       [15:0]   addLogic_a_20_payload;
  wire                addLogic_a_21_valid;
  wire       [15:0]   addLogic_a_21_payload;
  wire                addLogic_a_22_valid;
  wire       [15:0]   addLogic_a_22_payload;
  wire                addLogic_a_23_valid;
  wire       [15:0]   addLogic_a_23_payload;
  wire                addLogic_a_24_valid;
  wire       [15:0]   addLogic_a_24_payload;
  wire                addLogic_a_25_valid;
  wire       [15:0]   addLogic_a_25_payload;
  wire                addLogic_a_26_valid;
  wire       [15:0]   addLogic_a_26_payload;
  wire                addLogic_a_27_valid;
  wire       [15:0]   addLogic_a_27_payload;
  wire                addLogic_a_28_valid;
  wire       [15:0]   addLogic_a_28_payload;
  wire                addLogic_a_29_valid;
  wire       [15:0]   addLogic_a_29_payload;
  wire                addLogic_a_30_valid;
  wire       [15:0]   addLogic_a_30_payload;
  wire                addLogic_a_31_valid;
  wire       [15:0]   addLogic_a_31_payload;
  wire                addLogic_b_0_valid;
  wire       [15:0]   addLogic_b_0_payload;
  wire                addLogic_b_1_valid;
  wire       [15:0]   addLogic_b_1_payload;
  wire                addLogic_b_2_valid;
  wire       [15:0]   addLogic_b_2_payload;
  wire                addLogic_b_3_valid;
  wire       [15:0]   addLogic_b_3_payload;
  wire                addLogic_b_4_valid;
  wire       [15:0]   addLogic_b_4_payload;
  wire                addLogic_b_5_valid;
  wire       [15:0]   addLogic_b_5_payload;
  wire                addLogic_b_6_valid;
  wire       [15:0]   addLogic_b_6_payload;
  wire                addLogic_b_7_valid;
  wire       [15:0]   addLogic_b_7_payload;
  wire                addLogic_b_8_valid;
  wire       [15:0]   addLogic_b_8_payload;
  wire                addLogic_b_9_valid;
  wire       [15:0]   addLogic_b_9_payload;
  wire                addLogic_b_10_valid;
  wire       [15:0]   addLogic_b_10_payload;
  wire                addLogic_b_11_valid;
  wire       [15:0]   addLogic_b_11_payload;
  wire                addLogic_b_12_valid;
  wire       [15:0]   addLogic_b_12_payload;
  wire                addLogic_b_13_valid;
  wire       [15:0]   addLogic_b_13_payload;
  wire                addLogic_b_14_valid;
  wire       [15:0]   addLogic_b_14_payload;
  wire                addLogic_b_15_valid;
  wire       [15:0]   addLogic_b_15_payload;
  wire                addLogic_b_16_valid;
  wire       [15:0]   addLogic_b_16_payload;
  wire                addLogic_b_17_valid;
  wire       [15:0]   addLogic_b_17_payload;
  wire                addLogic_b_18_valid;
  wire       [15:0]   addLogic_b_18_payload;
  wire                addLogic_b_19_valid;
  wire       [15:0]   addLogic_b_19_payload;
  wire                addLogic_b_20_valid;
  wire       [15:0]   addLogic_b_20_payload;
  wire                addLogic_b_21_valid;
  wire       [15:0]   addLogic_b_21_payload;
  wire                addLogic_b_22_valid;
  wire       [15:0]   addLogic_b_22_payload;
  wire                addLogic_b_23_valid;
  wire       [15:0]   addLogic_b_23_payload;
  wire                addLogic_b_24_valid;
  wire       [15:0]   addLogic_b_24_payload;
  wire                addLogic_b_25_valid;
  wire       [15:0]   addLogic_b_25_payload;
  wire                addLogic_b_26_valid;
  wire       [15:0]   addLogic_b_26_payload;
  wire                addLogic_b_27_valid;
  wire       [15:0]   addLogic_b_27_payload;
  wire                addLogic_b_28_valid;
  wire       [15:0]   addLogic_b_28_payload;
  wire                addLogic_b_29_valid;
  wire       [15:0]   addLogic_b_29_payload;
  wire                addLogic_b_30_valid;
  wire       [15:0]   addLogic_b_30_payload;
  wire                addLogic_b_31_valid;
  wire       [15:0]   addLogic_b_31_payload;
  wire                addLogic_c_0_valid;
  wire       [15:0]   addLogic_c_0_payload;
  wire                addLogic_c_1_valid;
  wire       [15:0]   addLogic_c_1_payload;
  wire                addLogic_c_2_valid;
  wire       [15:0]   addLogic_c_2_payload;
  wire                addLogic_c_3_valid;
  wire       [15:0]   addLogic_c_3_payload;
  wire                addLogic_c_4_valid;
  wire       [15:0]   addLogic_c_4_payload;
  wire                addLogic_c_5_valid;
  wire       [15:0]   addLogic_c_5_payload;
  wire                addLogic_c_6_valid;
  wire       [15:0]   addLogic_c_6_payload;
  wire                addLogic_c_7_valid;
  wire       [15:0]   addLogic_c_7_payload;
  wire                addLogic_c_8_valid;
  wire       [15:0]   addLogic_c_8_payload;
  wire                addLogic_c_9_valid;
  wire       [15:0]   addLogic_c_9_payload;
  wire                addLogic_c_10_valid;
  wire       [15:0]   addLogic_c_10_payload;
  wire                addLogic_c_11_valid;
  wire       [15:0]   addLogic_c_11_payload;
  wire                addLogic_c_12_valid;
  wire       [15:0]   addLogic_c_12_payload;
  wire                addLogic_c_13_valid;
  wire       [15:0]   addLogic_c_13_payload;
  wire                addLogic_c_14_valid;
  wire       [15:0]   addLogic_c_14_payload;
  wire                addLogic_c_15_valid;
  wire       [15:0]   addLogic_c_15_payload;
  wire                addLogic_c_16_valid;
  wire       [15:0]   addLogic_c_16_payload;
  wire                addLogic_c_17_valid;
  wire       [15:0]   addLogic_c_17_payload;
  wire                addLogic_c_18_valid;
  wire       [15:0]   addLogic_c_18_payload;
  wire                addLogic_c_19_valid;
  wire       [15:0]   addLogic_c_19_payload;
  wire                addLogic_c_20_valid;
  wire       [15:0]   addLogic_c_20_payload;
  wire                addLogic_c_21_valid;
  wire       [15:0]   addLogic_c_21_payload;
  wire                addLogic_c_22_valid;
  wire       [15:0]   addLogic_c_22_payload;
  wire                addLogic_c_23_valid;
  wire       [15:0]   addLogic_c_23_payload;
  wire                addLogic_c_24_valid;
  wire       [15:0]   addLogic_c_24_payload;
  wire                addLogic_c_25_valid;
  wire       [15:0]   addLogic_c_25_payload;
  wire                addLogic_c_26_valid;
  wire       [15:0]   addLogic_c_26_payload;
  wire                addLogic_c_27_valid;
  wire       [15:0]   addLogic_c_27_payload;
  wire                addLogic_c_28_valid;
  wire       [15:0]   addLogic_c_28_payload;
  wire                addLogic_c_29_valid;
  wire       [15:0]   addLogic_c_29_payload;
  wire                addLogic_c_30_valid;
  wire       [15:0]   addLogic_c_30_payload;
  wire                addLogic_c_31_valid;
  wire       [15:0]   addLogic_c_31_payload;
  wire       [15:0]   addLogic_vecOut_0;
  wire       [15:0]   addLogic_vecOut_1;
  wire       [15:0]   addLogic_vecOut_2;
  wire       [15:0]   addLogic_vecOut_3;
  wire       [15:0]   addLogic_vecOut_4;
  wire       [15:0]   addLogic_vecOut_5;
  wire       [15:0]   addLogic_vecOut_6;
  wire       [15:0]   addLogic_vecOut_7;
  wire       [15:0]   addLogic_vecOut_8;
  wire       [15:0]   addLogic_vecOut_9;
  wire       [15:0]   addLogic_vecOut_10;
  wire       [15:0]   addLogic_vecOut_11;
  wire       [15:0]   addLogic_vecOut_12;
  wire       [15:0]   addLogic_vecOut_13;
  wire       [15:0]   addLogic_vecOut_14;
  wire       [15:0]   addLogic_vecOut_15;
  wire       [15:0]   addLogic_vecOut_16;
  wire       [15:0]   addLogic_vecOut_17;
  wire       [15:0]   addLogic_vecOut_18;
  wire       [15:0]   addLogic_vecOut_19;
  wire       [15:0]   addLogic_vecOut_20;
  wire       [15:0]   addLogic_vecOut_21;
  wire       [15:0]   addLogic_vecOut_22;
  wire       [15:0]   addLogic_vecOut_23;
  wire       [15:0]   addLogic_vecOut_24;
  wire       [15:0]   addLogic_vecOut_25;
  wire       [15:0]   addLogic_vecOut_26;
  wire       [15:0]   addLogic_vecOut_27;
  wire       [15:0]   addLogic_vecOut_28;
  wire       [15:0]   addLogic_vecOut_29;
  wire       [15:0]   addLogic_vecOut_30;
  wire       [15:0]   addLogic_vecOut_31;
  wire       [15:0]   addLogic_scalarOut;
  reg        [511:0]  addLogic_popDly;
  reg        [31:0]   dotCtrl_cfgPayload;
  (* max_fanout = 100 *) reg                 dotCtrl_cfgVld;
  wire       [1:0]    dotCtrl_aSelNext;
  wire       [1:0]    dotCtrl_bSelNext;
  wire                dotCtrl_enMulResCntNext;
  reg                 dotCtrl_enMulResCnt;
  reg        [6:0]    dotCtrl_muResCnt_0;
  reg        [16:0]   dotCtrl_muResCnt_1;
  reg                 dotCtrl_mulResCntOvf_0;
  reg                 dotCtrl_mulResCntOvf_1;
  reg                 dotCtrl_mulResCntOvfReduce;
  reg        [6:0]    t_dotCtrl_muResCnt_0;
  reg        [16:0]   t_dotCtrl_muResCnt_1;
  wire                t_dotCtrl_mulResCntOvf_0;
  wire                t_dotCtrl_mulResCntOvf_1;
  reg                 dotCtrl_enMulResCnt_delay_1;
  reg                 dotCtrl_enMulResCnt_delay_2;
  reg                 dotCtrl_enMulResCnt_delay_3;
  reg                 dotCtrl_enMulResCnt_delay_4;
  reg                 dotCtrl_enMulResCnt_delay_5;
  reg                 dotCtrl_enMulResCnt_delay_6;
  reg                 dotCtrl_enMulResCnt_delay_7;
  reg                 dotCtrl_enMulResCnt_delay_8;
  reg                 dotCtrl_enMulResCnt_delay_9;
  reg                 dotCtrl_enMulResCnt_delay_10;
  reg                 dotCtrl_enMulResCnt_delay_11;
  reg                 dotCtrl_enMulResCnt_delay_12;
  reg                 dotCtrl_enMulResCnt_delay_13;
  reg                 dotCtrl_enMulResCnt_delay_14;
  reg                 dotCtrl_enMulResCnt_delay_15;
  reg                 dotCtrl_enMulResCnt_delay_16;
  reg                 dotCtrl_enMulResCnt_delay_17;
  reg                 dotCtrl_enMulResCnt_delay_18;
  reg                 dotCtrl_enMulResCnt_delay_19;
  reg                 dotCtrl_enMulResCnt_delay_20;
  reg                 dotCtrl_enMulResCnt_delay_21;
  reg                 dotCtrl_enMulResCnt_delay_22;
  reg                 dotCtrl_enMulResCnt_delay_23;
  reg                 dotCtrl_enMulResCnt_delay_24;
  reg                 dotCtrl_enMulResCnt_delay_25;
  reg                 dotCtrl_enMulResCnt_delay_26;
  reg                 dotCtrl_enMulResCnt_delay_27;
  reg                 dotCtrl_enMulResCnt_delay_28;
  reg                 dotCtrl_enMulResCnt_delay_29;
  reg                 dotCtrl_enAddOutCnt;
  reg                 dotCtrl_mulResCntOvf_0_delay_1;
  reg                 dotCtrl_mulResCntOvf_0_delay_2;
  reg                 dotCtrl_mulResCntOvf_0_delay_3;
  reg                 dotCtrl_mulResCntOvf_0_delay_4;
  reg                 dotCtrl_mulResCntOvf_0_delay_5;
  reg                 dotCtrl_mulResCntOvf_0_delay_6;
  reg                 dotCtrl_mulResCntOvf_0_delay_7;
  reg                 dotCtrl_mulResCntOvf_0_delay_8;
  reg                 dotCtrl_mulResCntOvf_0_delay_9;
  reg                 dotCtrl_mulResCntOvf_0_delay_10;
  reg                 dotCtrl_mulResCntOvf_0_delay_11;
  reg                 dotCtrl_mulResCntOvf_0_delay_12;
  reg                 dotCtrl_mulResCntOvf_0_delay_13;
  reg                 dotCtrl_mulResCntOvf_0_delay_14;
  reg                 dotCtrl_mulResCntOvf_0_delay_15;
  reg                 dotCtrl_mulResCntOvf_0_delay_16;
  reg                 dotCtrl_mulResCntOvf_0_delay_17;
  reg                 dotCtrl_mulResCntOvf_0_delay_18;
  reg                 dotCtrl_mulResCntOvf_0_delay_19;
  reg                 dotCtrl_mulResCntOvf_0_delay_20;
  reg                 dotCtrl_mulResCntOvf_0_delay_21;
  reg                 dotCtrl_mulResCntOvf_0_delay_22;
  reg                 dotCtrl_mulResCntOvf_0_delay_23;
  reg                 dotCtrl_mulResCntOvf_0_delay_24;
  reg                 dotCtrl_mulResCntOvf_0_delay_25;
  reg                 dotCtrl_mulResCntOvf_0_delay_26;
  reg                 dotCtrl_mulResCntOvf_0_delay_27;
  reg                 dotCtrl_mulResCntOvf_0_delay_28;
  reg                 dotCtrl_mulResCntOvf_0_delay_29;
  reg                 dotCtrl_addOutCntOvf_0;
  reg                 dotCtrl_mulResCntOvf_1_delay_1;
  reg                 dotCtrl_mulResCntOvf_1_delay_2;
  reg                 dotCtrl_mulResCntOvf_1_delay_3;
  reg                 dotCtrl_mulResCntOvf_1_delay_4;
  reg                 dotCtrl_mulResCntOvf_1_delay_5;
  reg                 dotCtrl_mulResCntOvf_1_delay_6;
  reg                 dotCtrl_mulResCntOvf_1_delay_7;
  reg                 dotCtrl_mulResCntOvf_1_delay_8;
  reg                 dotCtrl_mulResCntOvf_1_delay_9;
  reg                 dotCtrl_mulResCntOvf_1_delay_10;
  reg                 dotCtrl_mulResCntOvf_1_delay_11;
  reg                 dotCtrl_mulResCntOvf_1_delay_12;
  reg                 dotCtrl_mulResCntOvf_1_delay_13;
  reg                 dotCtrl_mulResCntOvf_1_delay_14;
  reg                 dotCtrl_mulResCntOvf_1_delay_15;
  reg                 dotCtrl_mulResCntOvf_1_delay_16;
  reg                 dotCtrl_mulResCntOvf_1_delay_17;
  reg                 dotCtrl_mulResCntOvf_1_delay_18;
  reg                 dotCtrl_mulResCntOvf_1_delay_19;
  reg                 dotCtrl_mulResCntOvf_1_delay_20;
  reg                 dotCtrl_mulResCntOvf_1_delay_21;
  reg                 dotCtrl_mulResCntOvf_1_delay_22;
  reg                 dotCtrl_mulResCntOvf_1_delay_23;
  reg                 dotCtrl_mulResCntOvf_1_delay_24;
  reg                 dotCtrl_mulResCntOvf_1_delay_25;
  reg                 dotCtrl_mulResCntOvf_1_delay_26;
  reg                 dotCtrl_mulResCntOvf_1_delay_27;
  reg                 dotCtrl_mulResCntOvf_1_delay_28;
  reg                 dotCtrl_mulResCntOvf_1_delay_29;
  reg                 dotCtrl_addOutCntOvf_1;
  wire                dotCtrl_flagClrCond;
  reg                 dotCtrl_flagSetCond;
  reg                 dotCtrl_flagInv;
  reg                 dotCtrl_flagInvNext;
  reg        [4:0]    dotCtrl_accCnt;
  wire                dotCtrl_accCntOvf;
  reg                 dotCtrl_accCntOvf_delay_1;
  reg                 dotCtrl_accCntOvf_delay_2;
  reg                 dotCtrl_accCntOvf_delay_3;
  reg                 dotCtrl_accCntOvf_delay_4;
  reg                 dotCtrl_accCntOvf_delay_5;
  reg                 dotCtrl_accCntOvf_delay_6;
  reg                 dotCtrl_accCntOvf_delay_7;
  reg                 dotCtrl_accCntOvf_delay_8;
  reg                 dotCtrl_accCntOvf_delay_9;
  reg                 dotCtrl_accCntOvf_delay_10;
  reg                 dotCtrl_accCntOvf_delay_11;
  reg                 dotCtrl_accCntOvf_delay_12;
  reg                 dotCtrl_accCntOvf_delay_13;
  reg                 dotCtrl_accCntOvf_delay_14;
  reg                 dotCtrl_accCntOvf_delay_15;
  reg                 dotCtrl_accCntOvf_delay_16;
  reg                 dotCtrl_accCntOvf_delay_17;
  reg                 dotCtrl_accCntOvf_delay_18;
  reg                 dotCtrl_accCntOvf_delay_19;
  reg                 dotCtrl_accCntOvf_delay_20;
  reg                 dotCtrl_accCntOvf_delay_21;
  reg                 dotCtrl_accCntOvf_delay_22;
  reg                 dotCtrl_accCntOvf_delay_23;
  reg                 dotCtrl_accCntOvf_delay_24;
  reg                 dotCtrl_accCntOvf_delay_25;
  reg                 dotCtrl_accCntOvf_delay_26;
  reg                 dotCtrl_accCntOvf_delay_27;
  reg                 dotCtrl_accCntOvf_delay_28;
  reg                 dotCtrl_accCntOvf_delay_29;
  reg                 dotCtrl_accCntOvf_delay_30;
  reg                 dotCtrl_accCntOvf_delay_31;
  reg                 dotCtrl_accCntOvf_delay_32;
  reg                 dotCtrl_accCntOvf_delay_33;
  reg                 dotCtrl_accCntOvf_delay_34;
  reg                 dotCtrl_accCntOvf_delay_35;
  reg                 dotCtrl_accCntOvfDly;
  reg                 dotCtrl_accCntOvf_delay_1_1;
  reg                 dotCtrl_accCntOvf_delay_2_1;
  reg                 dotCtrl_accCntOvf_delay_3_1;
  reg                 dotCtrl_accCntOvf_delay_4_1;
  reg                 dotCtrl_accCntOvf_delay_5_1;
  reg                 dotCtrl_accCntOvf_delay_6_1;
  reg                 dotCtrl_accCntOvf_delay_7_1;
  reg                 dotCtrl_accCntOvf_delay_8_1;
  reg                 dotCtrl_accCntOvf_delay_9_1;
  reg                 dotCtrl_accCntOvf_delay_10_1;
  reg                 dotCtrl_accCntOvf_delay_11_1;
  reg                 dotCtrl_accCntOvf_delay_12_1;
  reg                 dotCtrl_accCntOvf_delay_13_1;
  reg                 dotCtrl_accCntOvf_delay_14_1;
  reg                 dotCtrl_accCntOvf_delay_15_1;
  reg                 dotCtrl_accCntOvf_delay_16_1;
  reg                 dotCtrl_accCntOvf_delay_17_1;
  reg                 dotCtrl_accCntOvf_delay_18_1;
  reg                 dotCtrl_accCntOvf_delay_19_1;
  reg                 dotCtrl_accCntOvf_delay_20_1;
  reg                 dotCtrl_accCntOvf_delay_21_1;
  reg                 dotCtrl_accCntOvf_delay_22_1;
  reg                 dotCtrl_accCntOvf_delay_23_1;
  reg                 dotCtrl_accCntOvf_delay_24_1;
  reg                 dotCtrl_accCntOvf_delay_25_1;
  reg                 dotCtrl_accCntOvf_delay_26_1;
  reg                 dotCtrl_accCntOvf_delay_27_1;
  reg                 dotCtrl_accCntOvf_delay_28_1;
  reg                 dotCtrl_accCntOvf_delay_29_1;
  reg                 dotCtrl_accCntOvf_delay_30_1;
  reg        [31:0]   fAxpyCtrl_cfgPayload;
  (* max_fanout = 100 *) reg                 fAxpyCtrl_cfgVld;
  wire                fAxpyCtrl_psumPopEn;
  wire                fAxpyCtrl_psumPushEn;
  wire                fAxpyCtrl_enMulResCntNext;
  reg                 fAxpyCtrl_enMulResCnt;
  reg        [6:0]    fAxpyCtrl_muResCnt_0;
  reg        [16:0]   fAxpyCtrl_muResCnt_1;
  reg                 fAxpyCtrl_mulResCntOvf_0;
  reg                 fAxpyCtrl_mulResCntOvf_1;
  reg                 fAxpyCtrl_mulResCntOvfReduce;
  reg        [6:0]    t_fAxpyCtrl_muResCnt_0;
  reg        [16:0]   t_fAxpyCtrl_muResCnt_1;
  wire                t_fAxpyCtrl_mulResCntOvf_0;
  wire                t_fAxpyCtrl_mulResCntOvf_1;
  reg                 fAxpyCtrl_mulResCntLastZero;
  reg                 fAxpyCtrl_mulResCntLastZeroNext;
  reg                 fAxpyCtrl_mulResCntLastNotZero;
  reg                 fAxpyCtrl_mulResCntLastNotZeroNext;
  reg                 fAxpyCtrl_enMulResCnt_delay_1;
  reg                 fAxpyCtrl_enMulResCnt_delay_2;
  reg                 fAxpyCtrl_enMulResCnt_delay_3;
  reg                 fAxpyCtrl_enMulResCnt_delay_4;
  reg                 fAxpyCtrl_enMulResCnt_delay_5;
  reg                 fAxpyCtrl_enAddOutCnt;
  reg                 fAxpyCtrl_mulResCntOvf_0_delay_1;
  reg                 fAxpyCtrl_mulResCntOvf_0_delay_2;
  reg                 fAxpyCtrl_mulResCntOvf_0_delay_3;
  reg                 fAxpyCtrl_mulResCntOvf_0_delay_4;
  reg                 fAxpyCtrl_mulResCntOvf_0_delay_5;
  reg                 fAxpyCtrl_addOutCntOvf_0;
  reg                 fAxpyCtrl_mulResCntOvf_1_delay_1;
  reg                 fAxpyCtrl_mulResCntOvf_1_delay_2;
  reg                 fAxpyCtrl_mulResCntOvf_1_delay_3;
  reg                 fAxpyCtrl_mulResCntOvf_1_delay_4;
  reg                 fAxpyCtrl_mulResCntOvf_1_delay_5;
  reg                 fAxpyCtrl_addOutCntOvf_1;
  reg                 t_fAxpyCtrl_psumPushEnReg;
  reg                 t_fAxpyCtrl_psumPushEnReg_1;
  reg                 t_fAxpyCtrl_psumPushEnReg_2;
  reg                 t_fAxpyCtrl_psumPushEnReg_3;
  reg                 t_fAxpyCtrl_psumPushEnReg_4;
  reg                 fAxpyCtrl_psumPushEnReg;
  reg                 fAxpyCtrl_resAddReady;
  wire                fAxpyCtrl_resAddReadyNext;
  reg                 fAxpyCtrl_psumPopEnReg;
  wire                fAxpyCtrl_psumPopEnRegNext;
  wire       [1:0]    fAxpyCtrl_aSelNext;
  reg        [1:0]    fAxpyCtrl_bSelNext;
  wire                fAxpyCtrl_vecOutVld;
  reg        [31:0]   pAxpyCtrl_cfgPayload;
  (* max_fanout = 100 *) reg                 pAxpyCtrl_cfgVld;
  reg                 pAxpyCtrl_cycleReduce;
  reg                 pAxpyCtrl_cycleReduceNext;
  reg                 pAxpyCtrl_cycleReduceDly;
  wire                pAxpyCtrl_enMulResCntNext;
  reg                 pAxpyCtrl_enMulResCnt;
  reg        [15:0]   pAxpyCtrl_mulResCnt;
  reg        [15:0]   pAxpyCtrl_mulResCntNext;
  wire       [2:0]    pAxpyCtrl_mulResCntLow;
  wire       [12:0]   pAxpyCtrl_mulResCntHigh;
  reg                 pAxpyCtrl_mulResCntOvf;
  wire                pAxpyCtrl_mulResCntOvfNext;
  reg                 pAxpyCtrl_mulResCntHighZero;
  reg                 pAxpyCtrl_mulResCntHighZeroNext;
  reg                 pAxpyCtrl_mulResCntHighNotZero;
  reg                 pAxpyCtrl_mulResCntHighNotZeroNext;
  reg                 pAxpyCtrl_enMulResCnt_delay_1;
  reg                 pAxpyCtrl_enMulResCnt_delay_2;
  reg                 pAxpyCtrl_enMulResCnt_delay_3;
  reg                 pAxpyCtrl_enMulResCnt_delay_4;
  reg                 pAxpyCtrl_enMulResCnt_delay_5;
  reg                 pAxpyCtrl_enMulResCntDly;
  wire                pAxpyCtrl_enAddOutCnt;
  reg                 pAxpyCtrl_mulResCntOvf_delay_1;
  reg                 pAxpyCtrl_mulResCntOvf_delay_2;
  reg                 pAxpyCtrl_mulResCntOvf_delay_3;
  reg                 pAxpyCtrl_mulResCntOvf_delay_4;
  reg                 pAxpyCtrl_mulResCntOvf_delay_5;
  reg                 pAxpyCtrl_addOutCntOvf;
  wire                pAxpyCtrl_reduceVldDly;
  wire                pAxpyCtrl_enCycleCnt;
  reg        [2:0]    pAxpyCtrl_cycleCnt;
  reg        [2:0]    pAxpyCtrl_cycleCntNext;
  (* max_fanout = 100 *) reg                 pAxpyCtrl_lastElem;
  wire       [2:0]    t_pAxpyCtrl_lastElemNext;
  wire       [16:0]   t_pAxpyCtrl_lastElemNext_1;
  wire                pAxpyCtrl_lastElemNext;
  wire                pAxpyCtrl_psumPushEn;
  reg                 pAxpyCtrl_psumPopEn;
  reg                 pAxpyCtrl_psumPopEnNext;
  wire       [1:0]    pAxpyCtrl_aSelNext;
  wire       [1:0]    pAxpyCtrl_bSelNext;
  reg                 pAxpyCtrl_bSelBit;
  wire                pAxpyCtrl_bSelBitNext;
  wire                pAxpyCtrl_flagClrCond;
  reg                 pAxpyCtrl_flagSetCond;
  reg                 pAxpyCtrl_flagInv;
  reg                 pAxpyCtrl_flagInvNext;
  reg                 pAxpyCtrl_vldToggle;
  wire                add_fifoCtrl_io_pop_fire;
  wire                pAxpyCtrl_reduceVld;
  reg                 pAxpyCtrl_psumVld;
  reg                 t_pAxpyCtrl_reduceVldDly;
  reg                 t_pAxpyCtrl_reduceVldDly_1;
  reg                 t_pAxpyCtrl_reduceVldDly_2;
  reg                 t_pAxpyCtrl_reduceVldDly_3;
  reg                 t_pAxpyCtrl_reduceVldDly_4;
  reg                 t_pAxpyCtrl_reduceVldDly_5;
  wire                pAxpyCtrl_vecOutVld;
  wire       [2:0]    selVldNextOneHot;
  wire                t_selVldNextUInt;
  wire                t_selVldNextUInt_1;
  wire       [1:0]    selVldNextUInt;
  reg        [1:0]    selVldUIntReg;
  (* keep = "true" *) reg        [1:0]    selFifoPushUInt;
  (* keep = "true" *) reg        [1:0]    selFifoPopUInt;
  (* max_fanout = 100 *) reg        [1:0]    aSel;
  (* max_fanout = 100 *) reg        [1:0]    bSel;
  wire       [1:0]    aSelNext;
  wire       [1:0]    bSelNext;
  (* max_fanout = 100 *) reg                 ready;
  reg                 readyNext;
  (* ram_style = "distributed" *) reg [511:0] t_1 [0:31];

  assign t_when = (&pAxpyCtrl_mulResCntLow);
  assign t_dotCtrl_accCntOvf = {2'd0, dotCtrl_accCnt};
  assign t_pAxpyCtrl_mulResCntOvfNext = {1'd0, pAxpyCtrl_mulResCntNext};
  assign t_pAxpyCtrl_lastElemNext_2 = {14'd0, pAxpyCtrl_cycleCntNext};
  assign t_pAxpyCtrl_lastElemNext_3 = {14'd0, t_pAxpyCtrl_lastElemNext};
  assign t_pAxpyCtrl_lastElemNext_4 = {14'd0, t_pAxpyCtrl_lastElemNext};
  assign t_io_push_payload = {addLogic_vecOut_15,{addLogic_vecOut_14,{addLogic_vecOut_13,{addLogic_vecOut_12,{addLogic_vecOut_11,{addLogic_vecOut_10,{addLogic_vecOut_9,{addLogic_vecOut_8,{addLogic_vecOut_7,{addLogic_vecOut_6,{addLogic_vecOut_5,{addLogic_vecOut_4,{addLogic_vecOut_3,{addLogic_vecOut_2,{addLogic_vecOut_1,addLogic_vecOut_0}}}}}}}}}}}}}}};
  assign t_vecOut_tdata = {addLogic_vecOut_15,{addLogic_vecOut_14,{addLogic_vecOut_13,{addLogic_vecOut_12,{addLogic_vecOut_11,{addLogic_vecOut_10,{addLogic_vecOut_9,{addLogic_vecOut_8,{addLogic_vecOut_7,{addLogic_vecOut_6,{addLogic_vecOut_5,{addLogic_vecOut_4,{addLogic_vecOut_3,{addLogic_vecOut_2,{addLogic_vecOut_1,addLogic_vecOut_0}}}}}}}}}}}}}}};
  always @(posedge clk_1_clk) begin
    if(fifoCtrl_wrPort_valid) begin
      t_1[fifoCtrl_wrPort_payload_address] <= fifoCtrl_wrPort_payload_data;
    end
  end

  always @(posedge clk_1_clk) begin
    if(fifoCtrl_rdPort_cmd_valid) begin
      t_1_spinal_port1 <= t_1[fifoCtrl_rdPort_cmd_payload];
    end
  end

  StreamFifoCtrl_3 fifoCtrl (
    .io_push_valid          (fifoCtrl_io_push_valid              ), //i
    .io_push_ready          (fifoCtrl_io_push_ready              ), //o
    .io_push_payload        (fifoCtrl_io_push_payload[511:0]     ), //i
    .io_pop_valid           (fifoCtrl_io_pop_valid               ), //o
    .io_pop_ready           (fifoCtrl_io_pop_ready               ), //i
    .io_pop_payload         (fifoCtrl_io_pop_payload[511:0]      ), //o
    .io_flush               (1'b0                                ), //i
    .io_occupancy           (fifoCtrl_io_occupancy[5:0]          ), //o
    .io_availability        (fifoCtrl_io_availability[5:0]       ), //o
    .rdPort_cmd_valid       (fifoCtrl_rdPort_cmd_valid           ), //o
    .rdPort_cmd_payload     (fifoCtrl_rdPort_cmd_payload[4:0]    ), //o
    .rdPort_rsp             (fifoCtrl_rdPort_rsp[511:0]          ), //i
    .wrPort_valid           (fifoCtrl_wrPort_valid               ), //o
    .wrPort_payload_address (fifoCtrl_wrPort_payload_address[4:0]), //o
    .wrPort_payload_data    (fifoCtrl_wrPort_payload_data[511:0] ), //o
    .clk_1_clk              (clk_1_clk                           ), //i
    .clk_1_resetn           (clk_1_resetn                        )  //i
  );
  fp16add6 addLogic_a_0_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_0_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_0_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_0_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_0_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_0_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_0_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_1_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_1_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_1_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_1_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_1_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_1_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_1_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_2_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_2_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_2_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_2_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_2_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_2_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_2_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_3_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_3_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_3_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_3_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_3_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_3_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_3_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_4_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_4_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_4_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_4_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_4_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_4_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_4_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_5_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_5_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_5_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_5_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_5_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_5_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_5_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_6_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_6_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_6_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_6_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_6_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_6_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_6_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_7_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_7_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_7_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_7_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_7_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_7_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_7_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_8_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_8_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_8_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_8_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_8_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_8_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_8_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_9_add_ip (
    .aclk                 (clk_1_clk                                    ), //i
    .s_axis_a_tvalid      (addLogic_a_9_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_9_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_9_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_9_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_9_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_9_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_10_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_10_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_10_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_10_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_10_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_10_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_10_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_11_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_11_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_11_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_11_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_11_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_11_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_11_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_12_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_12_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_12_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_12_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_12_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_12_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_12_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_13_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_13_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_13_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_13_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_13_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_13_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_13_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_14_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_14_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_14_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_14_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_14_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_14_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_14_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_15_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_15_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_15_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_15_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_15_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_15_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_15_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_16_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_16_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_16_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_16_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_16_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_16_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_16_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_17_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_17_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_17_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_17_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_17_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_17_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_17_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_18_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_18_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_18_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_18_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_18_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_18_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_18_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_19_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_19_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_19_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_19_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_19_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_19_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_19_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_20_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_20_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_20_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_20_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_20_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_20_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_20_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_21_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_21_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_21_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_21_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_21_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_21_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_21_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_22_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_22_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_22_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_22_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_22_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_22_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_22_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_23_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_23_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_23_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_23_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_23_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_23_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_23_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_24_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_24_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_24_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_24_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_24_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_24_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_24_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_25_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_25_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_25_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_25_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_25_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_25_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_25_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_26_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_26_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_26_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_26_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_26_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_26_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_26_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_27_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_27_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_27_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_27_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_27_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_27_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_27_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_28_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_28_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_28_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_28_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_28_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_28_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_28_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_29_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_29_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_29_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_29_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_29_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_29_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_29_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_30_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_30_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_30_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_30_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_30_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_30_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_30_add_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 addLogic_a_31_add_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (addLogic_a_31_valid                           ), //i
    .s_axis_a_tdata       (addLogic_a_31_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (addLogic_b_31_valid                           ), //i
    .s_axis_b_tdata       (addLogic_b_31_payload[15:0]                   ), //i
    .m_axis_result_tvalid (addLogic_a_31_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (addLogic_a_31_add_ip_m_axis_result_tdata[15:0])  //o
  );
  always @(*) begin
    case(addLogic_aSel)
      2'b00 : begin
        t_addLogic_a_0_payload = addLogic_mul_0;
        t_addLogic_a_1_payload = addLogic_mul_1;
        t_addLogic_a_2_payload = addLogic_mul_2;
        t_addLogic_a_3_payload = addLogic_mul_3;
        t_addLogic_a_4_payload = addLogic_mul_4;
        t_addLogic_a_5_payload = addLogic_mul_5;
        t_addLogic_a_6_payload = addLogic_mul_6;
        t_addLogic_a_7_payload = addLogic_mul_7;
        t_addLogic_a_8_payload = addLogic_mul_8;
        t_addLogic_a_9_payload = addLogic_mul_9;
        t_addLogic_a_10_payload = addLogic_mul_10;
        t_addLogic_a_11_payload = addLogic_mul_11;
        t_addLogic_a_12_payload = addLogic_mul_12;
        t_addLogic_a_13_payload = addLogic_mul_13;
        t_addLogic_a_14_payload = addLogic_mul_14;
        t_addLogic_a_15_payload = addLogic_mul_15;
        t_addLogic_a_16_payload = addLogic_mul_16;
        t_addLogic_a_17_payload = addLogic_mul_17;
        t_addLogic_a_18_payload = addLogic_mul_18;
        t_addLogic_a_19_payload = addLogic_mul_19;
        t_addLogic_a_20_payload = addLogic_mul_20;
        t_addLogic_a_21_payload = addLogic_mul_21;
        t_addLogic_a_22_payload = addLogic_mul_22;
        t_addLogic_a_23_payload = addLogic_mul_23;
        t_addLogic_a_24_payload = addLogic_mul_24;
        t_addLogic_a_25_payload = addLogic_mul_25;
        t_addLogic_a_26_payload = addLogic_mul_26;
        t_addLogic_a_27_payload = addLogic_mul_27;
        t_addLogic_a_28_payload = addLogic_mul_28;
        t_addLogic_a_29_payload = addLogic_mul_29;
        t_addLogic_a_30_payload = addLogic_mul_30;
        t_addLogic_a_31_payload = addLogic_mul_31;
      end
      2'b01 : begin
        t_addLogic_a_0_payload = addLogic_c_1_payload;
        t_addLogic_a_1_payload = addLogic_c_3_payload;
        t_addLogic_a_2_payload = addLogic_c_5_payload;
        t_addLogic_a_3_payload = addLogic_c_7_payload;
        t_addLogic_a_4_payload = addLogic_c_9_payload;
        t_addLogic_a_5_payload = addLogic_c_11_payload;
        t_addLogic_a_6_payload = addLogic_c_13_payload;
        t_addLogic_a_7_payload = addLogic_c_15_payload;
        t_addLogic_a_8_payload = addLogic_c_17_payload;
        t_addLogic_a_9_payload = addLogic_c_19_payload;
        t_addLogic_a_10_payload = addLogic_c_21_payload;
        t_addLogic_a_11_payload = addLogic_c_23_payload;
        t_addLogic_a_12_payload = addLogic_c_25_payload;
        t_addLogic_a_13_payload = addLogic_c_27_payload;
        t_addLogic_a_14_payload = addLogic_c_29_payload;
        t_addLogic_a_15_payload = addLogic_mul_0;
        t_addLogic_a_16_payload = addLogic_mul_2;
        t_addLogic_a_17_payload = addLogic_mul_4;
        t_addLogic_a_18_payload = addLogic_mul_6;
        t_addLogic_a_19_payload = addLogic_mul_8;
        t_addLogic_a_20_payload = addLogic_mul_10;
        t_addLogic_a_21_payload = addLogic_mul_12;
        t_addLogic_a_22_payload = addLogic_mul_14;
        t_addLogic_a_23_payload = addLogic_mul_16;
        t_addLogic_a_24_payload = addLogic_mul_18;
        t_addLogic_a_25_payload = addLogic_mul_20;
        t_addLogic_a_26_payload = addLogic_mul_22;
        t_addLogic_a_27_payload = addLogic_mul_24;
        t_addLogic_a_28_payload = addLogic_mul_26;
        t_addLogic_a_29_payload = addLogic_mul_28;
        t_addLogic_a_30_payload = addLogic_mul_30;
        t_addLogic_a_31_payload = addLogic_zero;
      end
      2'b10 : begin
        t_addLogic_a_0_payload = addLogic_psumDly_0;
        t_addLogic_a_1_payload = addLogic_psumDly_1;
        t_addLogic_a_2_payload = addLogic_psumDly_2;
        t_addLogic_a_3_payload = addLogic_psumDly_3;
        t_addLogic_a_4_payload = addLogic_psumDly_4;
        t_addLogic_a_5_payload = addLogic_psumDly_5;
        t_addLogic_a_6_payload = addLogic_psumDly_6;
        t_addLogic_a_7_payload = addLogic_psumDly_7;
        t_addLogic_a_8_payload = addLogic_psumDly_8;
        t_addLogic_a_9_payload = addLogic_psumDly_9;
        t_addLogic_a_10_payload = addLogic_psumDly_10;
        t_addLogic_a_11_payload = addLogic_psumDly_11;
        t_addLogic_a_12_payload = addLogic_psumDly_12;
        t_addLogic_a_13_payload = addLogic_psumDly_13;
        t_addLogic_a_14_payload = addLogic_psumDly_14;
        t_addLogic_a_15_payload = addLogic_psumDly_15;
        t_addLogic_a_16_payload = addLogic_psumDly_16;
        t_addLogic_a_17_payload = addLogic_psumDly_17;
        t_addLogic_a_18_payload = addLogic_psumDly_18;
        t_addLogic_a_19_payload = addLogic_psumDly_19;
        t_addLogic_a_20_payload = addLogic_psumDly_20;
        t_addLogic_a_21_payload = addLogic_psumDly_21;
        t_addLogic_a_22_payload = addLogic_psumDly_22;
        t_addLogic_a_23_payload = addLogic_psumDly_23;
        t_addLogic_a_24_payload = addLogic_psumDly_24;
        t_addLogic_a_25_payload = addLogic_psumDly_25;
        t_addLogic_a_26_payload = addLogic_psumDly_26;
        t_addLogic_a_27_payload = addLogic_psumDly_27;
        t_addLogic_a_28_payload = addLogic_psumDly_28;
        t_addLogic_a_29_payload = addLogic_psumDly_29;
        t_addLogic_a_30_payload = addLogic_psumDly_30;
        t_addLogic_a_31_payload = addLogic_psumDly_31;
      end
      default : begin
        t_addLogic_a_0_payload = addLogic_zero;
        t_addLogic_a_1_payload = addLogic_zero;
        t_addLogic_a_2_payload = addLogic_zero;
        t_addLogic_a_3_payload = addLogic_zero;
        t_addLogic_a_4_payload = addLogic_zero;
        t_addLogic_a_5_payload = addLogic_zero;
        t_addLogic_a_6_payload = addLogic_zero;
        t_addLogic_a_7_payload = addLogic_zero;
        t_addLogic_a_8_payload = addLogic_zero;
        t_addLogic_a_9_payload = addLogic_zero;
        t_addLogic_a_10_payload = addLogic_zero;
        t_addLogic_a_11_payload = addLogic_zero;
        t_addLogic_a_12_payload = addLogic_zero;
        t_addLogic_a_13_payload = addLogic_zero;
        t_addLogic_a_14_payload = addLogic_zero;
        t_addLogic_a_15_payload = addLogic_zero;
        t_addLogic_a_16_payload = addLogic_zero;
        t_addLogic_a_17_payload = addLogic_zero;
        t_addLogic_a_18_payload = addLogic_zero;
        t_addLogic_a_19_payload = addLogic_zero;
        t_addLogic_a_20_payload = addLogic_zero;
        t_addLogic_a_21_payload = addLogic_zero;
        t_addLogic_a_22_payload = addLogic_zero;
        t_addLogic_a_23_payload = addLogic_zero;
        t_addLogic_a_24_payload = addLogic_zero;
        t_addLogic_a_25_payload = addLogic_zero;
        t_addLogic_a_26_payload = addLogic_zero;
        t_addLogic_a_27_payload = addLogic_zero;
        t_addLogic_a_28_payload = addLogic_zero;
        t_addLogic_a_29_payload = addLogic_zero;
        t_addLogic_a_30_payload = addLogic_zero;
        t_addLogic_a_31_payload = addLogic_zero;
      end
    endcase
  end

  always @(*) begin
    case(addLogic_bSel)
      2'b00 : begin
        t_addLogic_b_0_payload = addLogic_psum_0;
        t_addLogic_b_1_payload = addLogic_psum_1;
        t_addLogic_b_2_payload = addLogic_psum_2;
        t_addLogic_b_3_payload = addLogic_psum_3;
        t_addLogic_b_4_payload = addLogic_psum_4;
        t_addLogic_b_5_payload = addLogic_psum_5;
        t_addLogic_b_6_payload = addLogic_psum_6;
        t_addLogic_b_7_payload = addLogic_psum_7;
        t_addLogic_b_8_payload = addLogic_psum_8;
        t_addLogic_b_9_payload = addLogic_psum_9;
        t_addLogic_b_10_payload = addLogic_psum_10;
        t_addLogic_b_11_payload = addLogic_psum_11;
        t_addLogic_b_12_payload = addLogic_psum_12;
        t_addLogic_b_13_payload = addLogic_psum_13;
        t_addLogic_b_14_payload = addLogic_psum_14;
        t_addLogic_b_15_payload = addLogic_psum_15;
        t_addLogic_b_16_payload = addLogic_psum_16;
        t_addLogic_b_17_payload = addLogic_psum_17;
        t_addLogic_b_18_payload = addLogic_psum_18;
        t_addLogic_b_19_payload = addLogic_psum_19;
        t_addLogic_b_20_payload = addLogic_psum_20;
        t_addLogic_b_21_payload = addLogic_psum_21;
        t_addLogic_b_22_payload = addLogic_psum_22;
        t_addLogic_b_23_payload = addLogic_psum_23;
        t_addLogic_b_24_payload = addLogic_psum_24;
        t_addLogic_b_25_payload = addLogic_psum_25;
        t_addLogic_b_26_payload = addLogic_psum_26;
        t_addLogic_b_27_payload = addLogic_psum_27;
        t_addLogic_b_28_payload = addLogic_psum_28;
        t_addLogic_b_29_payload = addLogic_psum_29;
        t_addLogic_b_30_payload = addLogic_psum_30;
        t_addLogic_b_31_payload = addLogic_psum_31;
      end
      2'b01 : begin
        t_addLogic_b_0_payload = addLogic_c_2_payload;
        t_addLogic_b_1_payload = addLogic_c_4_payload;
        t_addLogic_b_2_payload = addLogic_c_6_payload;
        t_addLogic_b_3_payload = addLogic_c_8_payload;
        t_addLogic_b_4_payload = addLogic_c_10_payload;
        t_addLogic_b_5_payload = addLogic_c_12_payload;
        t_addLogic_b_6_payload = addLogic_c_14_payload;
        t_addLogic_b_7_payload = addLogic_c_16_payload;
        t_addLogic_b_8_payload = addLogic_c_18_payload;
        t_addLogic_b_9_payload = addLogic_c_20_payload;
        t_addLogic_b_10_payload = addLogic_c_22_payload;
        t_addLogic_b_11_payload = addLogic_c_24_payload;
        t_addLogic_b_12_payload = addLogic_c_26_payload;
        t_addLogic_b_13_payload = addLogic_c_28_payload;
        t_addLogic_b_14_payload = addLogic_c_30_payload;
        t_addLogic_b_15_payload = addLogic_mul_1;
        t_addLogic_b_16_payload = addLogic_mul_3;
        t_addLogic_b_17_payload = addLogic_mul_5;
        t_addLogic_b_18_payload = addLogic_mul_7;
        t_addLogic_b_19_payload = addLogic_mul_9;
        t_addLogic_b_20_payload = addLogic_mul_11;
        t_addLogic_b_21_payload = addLogic_mul_13;
        t_addLogic_b_22_payload = addLogic_mul_15;
        t_addLogic_b_23_payload = addLogic_mul_17;
        t_addLogic_b_24_payload = addLogic_mul_19;
        t_addLogic_b_25_payload = addLogic_mul_21;
        t_addLogic_b_26_payload = addLogic_mul_23;
        t_addLogic_b_27_payload = addLogic_mul_25;
        t_addLogic_b_28_payload = addLogic_mul_27;
        t_addLogic_b_29_payload = addLogic_mul_29;
        t_addLogic_b_30_payload = addLogic_mul_31;
        t_addLogic_b_31_payload = addLogic_zero;
      end
      2'b10 : begin
        t_addLogic_b_0_payload = addLogic_res_0;
        t_addLogic_b_1_payload = addLogic_res_1;
        t_addLogic_b_2_payload = addLogic_res_2;
        t_addLogic_b_3_payload = addLogic_res_3;
        t_addLogic_b_4_payload = addLogic_res_4;
        t_addLogic_b_5_payload = addLogic_res_5;
        t_addLogic_b_6_payload = addLogic_res_6;
        t_addLogic_b_7_payload = addLogic_res_7;
        t_addLogic_b_8_payload = addLogic_res_8;
        t_addLogic_b_9_payload = addLogic_res_9;
        t_addLogic_b_10_payload = addLogic_res_10;
        t_addLogic_b_11_payload = addLogic_res_11;
        t_addLogic_b_12_payload = addLogic_res_12;
        t_addLogic_b_13_payload = addLogic_res_13;
        t_addLogic_b_14_payload = addLogic_res_14;
        t_addLogic_b_15_payload = addLogic_res_15;
        t_addLogic_b_16_payload = addLogic_res_16;
        t_addLogic_b_17_payload = addLogic_res_17;
        t_addLogic_b_18_payload = addLogic_res_18;
        t_addLogic_b_19_payload = addLogic_res_19;
        t_addLogic_b_20_payload = addLogic_res_20;
        t_addLogic_b_21_payload = addLogic_res_21;
        t_addLogic_b_22_payload = addLogic_res_22;
        t_addLogic_b_23_payload = addLogic_res_23;
        t_addLogic_b_24_payload = addLogic_res_24;
        t_addLogic_b_25_payload = addLogic_res_25;
        t_addLogic_b_26_payload = addLogic_res_26;
        t_addLogic_b_27_payload = addLogic_res_27;
        t_addLogic_b_28_payload = addLogic_res_28;
        t_addLogic_b_29_payload = addLogic_res_29;
        t_addLogic_b_30_payload = addLogic_res_30;
        t_addLogic_b_31_payload = addLogic_res_31;
      end
      default : begin
        t_addLogic_b_0_payload = addLogic_zero;
        t_addLogic_b_1_payload = addLogic_zero;
        t_addLogic_b_2_payload = addLogic_zero;
        t_addLogic_b_3_payload = addLogic_zero;
        t_addLogic_b_4_payload = addLogic_zero;
        t_addLogic_b_5_payload = addLogic_zero;
        t_addLogic_b_6_payload = addLogic_zero;
        t_addLogic_b_7_payload = addLogic_zero;
        t_addLogic_b_8_payload = addLogic_zero;
        t_addLogic_b_9_payload = addLogic_zero;
        t_addLogic_b_10_payload = addLogic_zero;
        t_addLogic_b_11_payload = addLogic_zero;
        t_addLogic_b_12_payload = addLogic_zero;
        t_addLogic_b_13_payload = addLogic_zero;
        t_addLogic_b_14_payload = addLogic_zero;
        t_addLogic_b_15_payload = addLogic_zero;
        t_addLogic_b_16_payload = addLogic_zero;
        t_addLogic_b_17_payload = addLogic_zero;
        t_addLogic_b_18_payload = addLogic_zero;
        t_addLogic_b_19_payload = addLogic_zero;
        t_addLogic_b_20_payload = addLogic_zero;
        t_addLogic_b_21_payload = addLogic_zero;
        t_addLogic_b_22_payload = addLogic_zero;
        t_addLogic_b_23_payload = addLogic_zero;
        t_addLogic_b_24_payload = addLogic_zero;
        t_addLogic_b_25_payload = addLogic_zero;
        t_addLogic_b_26_payload = addLogic_zero;
        t_addLogic_b_27_payload = addLogic_zero;
        t_addLogic_b_28_payload = addLogic_zero;
        t_addLogic_b_29_payload = addLogic_zero;
        t_addLogic_b_30_payload = addLogic_zero;
        t_addLogic_b_31_payload = addLogic_zero;
      end
    endcase
  end

  always @(*) begin
    case(selFifoPushUInt)
      2'b00 : t_io_push_valid = 1'b0;
      2'b01 : t_io_push_valid = fAxpyCtrl_psumPushEn;
      default : t_io_push_valid = pAxpyCtrl_psumPushEn;
    endcase
  end

  always @(*) begin
    case(selFifoPopUInt)
      2'b00 : t_io_pop_ready = 1'b0;
      2'b01 : t_io_pop_ready = fAxpyCtrl_psumPopEn;
      default : t_io_pop_ready = pAxpyCtrl_psumPopEn;
    endcase
  end

  always @(*) begin
    case(selVldNextUInt)
      2'b00 : begin
        t_aSelNext = dotCtrl_aSelNext;
        t_bSelNext = dotCtrl_bSelNext;
      end
      2'b01 : begin
        t_aSelNext = fAxpyCtrl_aSelNext;
        t_bSelNext = fAxpyCtrl_bSelNext;
      end
      default : begin
        t_aSelNext = pAxpyCtrl_aSelNext;
        t_bSelNext = pAxpyCtrl_bSelNext;
      end
    endcase
  end

  assign tag = cfg_tdata[31 : 26];
  assign dotCond = (! cfg_tdata[24]);
  assign fAxpyCond = (cfg_tdata[24] && (cfg_tdata[22 : 16] != 7'h0));
  assign pAxpyCond = (cfg_tdata[24] && (cfg_tdata[22 : 16] == 7'h0));
  always @(*) begin
    ret_0_valid = (cfg_tvalid && dotCond);
    if(ret_0_ready) begin
      ret_0_valid = 1'b0;
    end
  end

  assign ret_0_payload = cfg_tdata;
  always @(*) begin
    ret_1_valid = (cfg_tvalid && fAxpyCond);
    if(ret_1_ready) begin
      ret_1_valid = 1'b0;
    end
  end

  assign ret_1_payload = cfg_tdata;
  always @(*) begin
    ret_2_valid = (cfg_tvalid && pAxpyCond);
    if(ret_2_ready) begin
      ret_2_valid = 1'b0;
    end
  end

  assign ret_2_payload = cfg_tdata;
  assign cfg_tready = (|{(ret_2_ready && pAxpyCond),{(ret_1_ready && fAxpyCond),(ret_0_ready && dotCond)}});
  assign fifoCtrl_rdPort_rsp = t_1_spinal_port1;
  assign addLogic_zero = 16'h0;
  assign addLogic_mul_0 = mulRes_tdata[15 : 0];
  assign addLogic_mul_1 = mulRes_tdata[31 : 16];
  assign addLogic_mul_2 = mulRes_tdata[47 : 32];
  assign addLogic_mul_3 = mulRes_tdata[63 : 48];
  assign addLogic_mul_4 = mulRes_tdata[79 : 64];
  assign addLogic_mul_5 = mulRes_tdata[95 : 80];
  assign addLogic_mul_6 = mulRes_tdata[111 : 96];
  assign addLogic_mul_7 = mulRes_tdata[127 : 112];
  assign addLogic_mul_8 = mulRes_tdata[143 : 128];
  assign addLogic_mul_9 = mulRes_tdata[159 : 144];
  assign addLogic_mul_10 = mulRes_tdata[175 : 160];
  assign addLogic_mul_11 = mulRes_tdata[191 : 176];
  assign addLogic_mul_12 = mulRes_tdata[207 : 192];
  assign addLogic_mul_13 = mulRes_tdata[223 : 208];
  assign addLogic_mul_14 = mulRes_tdata[239 : 224];
  assign addLogic_mul_15 = mulRes_tdata[255 : 240];
  assign addLogic_mul_16 = mulRes_tdata[271 : 256];
  assign addLogic_mul_17 = mulRes_tdata[287 : 272];
  assign addLogic_mul_18 = mulRes_tdata[303 : 288];
  assign addLogic_mul_19 = mulRes_tdata[319 : 304];
  assign addLogic_mul_20 = mulRes_tdata[335 : 320];
  assign addLogic_mul_21 = mulRes_tdata[351 : 336];
  assign addLogic_mul_22 = mulRes_tdata[367 : 352];
  assign addLogic_mul_23 = mulRes_tdata[383 : 368];
  assign addLogic_mul_24 = mulRes_tdata[399 : 384];
  assign addLogic_mul_25 = mulRes_tdata[415 : 400];
  assign addLogic_mul_26 = mulRes_tdata[431 : 416];
  assign addLogic_mul_27 = mulRes_tdata[447 : 432];
  assign addLogic_mul_28 = mulRes_tdata[463 : 448];
  assign addLogic_mul_29 = mulRes_tdata[479 : 464];
  assign addLogic_mul_30 = mulRes_tdata[495 : 480];
  assign addLogic_mul_31 = mulRes_tdata[511 : 496];
  assign addLogic_res_0 = resAdd_tdata[15 : 0];
  assign addLogic_res_1 = resAdd_tdata[31 : 16];
  assign addLogic_res_2 = resAdd_tdata[47 : 32];
  assign addLogic_res_3 = resAdd_tdata[63 : 48];
  assign addLogic_res_4 = resAdd_tdata[79 : 64];
  assign addLogic_res_5 = resAdd_tdata[95 : 80];
  assign addLogic_res_6 = resAdd_tdata[111 : 96];
  assign addLogic_res_7 = resAdd_tdata[127 : 112];
  assign addLogic_res_8 = resAdd_tdata[143 : 128];
  assign addLogic_res_9 = resAdd_tdata[159 : 144];
  assign addLogic_res_10 = resAdd_tdata[175 : 160];
  assign addLogic_res_11 = resAdd_tdata[191 : 176];
  assign addLogic_res_12 = resAdd_tdata[207 : 192];
  assign addLogic_res_13 = resAdd_tdata[223 : 208];
  assign addLogic_res_14 = resAdd_tdata[239 : 224];
  assign addLogic_res_15 = resAdd_tdata[255 : 240];
  assign addLogic_res_16 = resAdd_tdata[271 : 256];
  assign addLogic_res_17 = resAdd_tdata[287 : 272];
  assign addLogic_res_18 = resAdd_tdata[303 : 288];
  assign addLogic_res_19 = resAdd_tdata[319 : 304];
  assign addLogic_res_20 = resAdd_tdata[335 : 320];
  assign addLogic_res_21 = resAdd_tdata[351 : 336];
  assign addLogic_res_22 = resAdd_tdata[367 : 352];
  assign addLogic_res_23 = resAdd_tdata[383 : 368];
  assign addLogic_res_24 = resAdd_tdata[399 : 384];
  assign addLogic_res_25 = resAdd_tdata[415 : 400];
  assign addLogic_res_26 = resAdd_tdata[431 : 416];
  assign addLogic_res_27 = resAdd_tdata[447 : 432];
  assign addLogic_res_28 = resAdd_tdata[463 : 448];
  assign addLogic_res_29 = resAdd_tdata[479 : 464];
  assign addLogic_res_30 = resAdd_tdata[495 : 480];
  assign addLogic_res_31 = resAdd_tdata[511 : 496];
  assign addLogic_a_0_valid = 1'b1;
  assign addLogic_a_1_valid = 1'b1;
  assign addLogic_a_2_valid = 1'b1;
  assign addLogic_a_3_valid = 1'b1;
  assign addLogic_a_4_valid = 1'b1;
  assign addLogic_a_5_valid = 1'b1;
  assign addLogic_a_6_valid = 1'b1;
  assign addLogic_a_7_valid = 1'b1;
  assign addLogic_a_8_valid = 1'b1;
  assign addLogic_a_9_valid = 1'b1;
  assign addLogic_a_10_valid = 1'b1;
  assign addLogic_a_11_valid = 1'b1;
  assign addLogic_a_12_valid = 1'b1;
  assign addLogic_a_13_valid = 1'b1;
  assign addLogic_a_14_valid = 1'b1;
  assign addLogic_a_15_valid = 1'b1;
  assign addLogic_a_16_valid = 1'b1;
  assign addLogic_a_17_valid = 1'b1;
  assign addLogic_a_18_valid = 1'b1;
  assign addLogic_a_19_valid = 1'b1;
  assign addLogic_a_20_valid = 1'b1;
  assign addLogic_a_21_valid = 1'b1;
  assign addLogic_a_22_valid = 1'b1;
  assign addLogic_a_23_valid = 1'b1;
  assign addLogic_a_24_valid = 1'b1;
  assign addLogic_a_25_valid = 1'b1;
  assign addLogic_a_26_valid = 1'b1;
  assign addLogic_a_27_valid = 1'b1;
  assign addLogic_a_28_valid = 1'b1;
  assign addLogic_a_29_valid = 1'b1;
  assign addLogic_a_30_valid = 1'b1;
  assign addLogic_a_31_valid = 1'b1;
  assign addLogic_b_0_valid = 1'b1;
  assign addLogic_b_1_valid = 1'b1;
  assign addLogic_b_2_valid = 1'b1;
  assign addLogic_b_3_valid = 1'b1;
  assign addLogic_b_4_valid = 1'b1;
  assign addLogic_b_5_valid = 1'b1;
  assign addLogic_b_6_valid = 1'b1;
  assign addLogic_b_7_valid = 1'b1;
  assign addLogic_b_8_valid = 1'b1;
  assign addLogic_b_9_valid = 1'b1;
  assign addLogic_b_10_valid = 1'b1;
  assign addLogic_b_11_valid = 1'b1;
  assign addLogic_b_12_valid = 1'b1;
  assign addLogic_b_13_valid = 1'b1;
  assign addLogic_b_14_valid = 1'b1;
  assign addLogic_b_15_valid = 1'b1;
  assign addLogic_b_16_valid = 1'b1;
  assign addLogic_b_17_valid = 1'b1;
  assign addLogic_b_18_valid = 1'b1;
  assign addLogic_b_19_valid = 1'b1;
  assign addLogic_b_20_valid = 1'b1;
  assign addLogic_b_21_valid = 1'b1;
  assign addLogic_b_22_valid = 1'b1;
  assign addLogic_b_23_valid = 1'b1;
  assign addLogic_b_24_valid = 1'b1;
  assign addLogic_b_25_valid = 1'b1;
  assign addLogic_b_26_valid = 1'b1;
  assign addLogic_b_27_valid = 1'b1;
  assign addLogic_b_28_valid = 1'b1;
  assign addLogic_b_29_valid = 1'b1;
  assign addLogic_b_30_valid = 1'b1;
  assign addLogic_b_31_valid = 1'b1;
  assign addLogic_c_0_valid = addLogic_a_0_add_ip_m_axis_result_tvalid;
  assign addLogic_c_0_payload = addLogic_a_0_add_ip_m_axis_result_tdata;
  assign addLogic_c_1_valid = addLogic_a_1_add_ip_m_axis_result_tvalid;
  assign addLogic_c_1_payload = addLogic_a_1_add_ip_m_axis_result_tdata;
  assign addLogic_c_2_valid = addLogic_a_2_add_ip_m_axis_result_tvalid;
  assign addLogic_c_2_payload = addLogic_a_2_add_ip_m_axis_result_tdata;
  assign addLogic_c_3_valid = addLogic_a_3_add_ip_m_axis_result_tvalid;
  assign addLogic_c_3_payload = addLogic_a_3_add_ip_m_axis_result_tdata;
  assign addLogic_c_4_valid = addLogic_a_4_add_ip_m_axis_result_tvalid;
  assign addLogic_c_4_payload = addLogic_a_4_add_ip_m_axis_result_tdata;
  assign addLogic_c_5_valid = addLogic_a_5_add_ip_m_axis_result_tvalid;
  assign addLogic_c_5_payload = addLogic_a_5_add_ip_m_axis_result_tdata;
  assign addLogic_c_6_valid = addLogic_a_6_add_ip_m_axis_result_tvalid;
  assign addLogic_c_6_payload = addLogic_a_6_add_ip_m_axis_result_tdata;
  assign addLogic_c_7_valid = addLogic_a_7_add_ip_m_axis_result_tvalid;
  assign addLogic_c_7_payload = addLogic_a_7_add_ip_m_axis_result_tdata;
  assign addLogic_c_8_valid = addLogic_a_8_add_ip_m_axis_result_tvalid;
  assign addLogic_c_8_payload = addLogic_a_8_add_ip_m_axis_result_tdata;
  assign addLogic_c_9_valid = addLogic_a_9_add_ip_m_axis_result_tvalid;
  assign addLogic_c_9_payload = addLogic_a_9_add_ip_m_axis_result_tdata;
  assign addLogic_c_10_valid = addLogic_a_10_add_ip_m_axis_result_tvalid;
  assign addLogic_c_10_payload = addLogic_a_10_add_ip_m_axis_result_tdata;
  assign addLogic_c_11_valid = addLogic_a_11_add_ip_m_axis_result_tvalid;
  assign addLogic_c_11_payload = addLogic_a_11_add_ip_m_axis_result_tdata;
  assign addLogic_c_12_valid = addLogic_a_12_add_ip_m_axis_result_tvalid;
  assign addLogic_c_12_payload = addLogic_a_12_add_ip_m_axis_result_tdata;
  assign addLogic_c_13_valid = addLogic_a_13_add_ip_m_axis_result_tvalid;
  assign addLogic_c_13_payload = addLogic_a_13_add_ip_m_axis_result_tdata;
  assign addLogic_c_14_valid = addLogic_a_14_add_ip_m_axis_result_tvalid;
  assign addLogic_c_14_payload = addLogic_a_14_add_ip_m_axis_result_tdata;
  assign addLogic_c_15_valid = addLogic_a_15_add_ip_m_axis_result_tvalid;
  assign addLogic_c_15_payload = addLogic_a_15_add_ip_m_axis_result_tdata;
  assign addLogic_c_16_valid = addLogic_a_16_add_ip_m_axis_result_tvalid;
  assign addLogic_c_16_payload = addLogic_a_16_add_ip_m_axis_result_tdata;
  assign addLogic_c_17_valid = addLogic_a_17_add_ip_m_axis_result_tvalid;
  assign addLogic_c_17_payload = addLogic_a_17_add_ip_m_axis_result_tdata;
  assign addLogic_c_18_valid = addLogic_a_18_add_ip_m_axis_result_tvalid;
  assign addLogic_c_18_payload = addLogic_a_18_add_ip_m_axis_result_tdata;
  assign addLogic_c_19_valid = addLogic_a_19_add_ip_m_axis_result_tvalid;
  assign addLogic_c_19_payload = addLogic_a_19_add_ip_m_axis_result_tdata;
  assign addLogic_c_20_valid = addLogic_a_20_add_ip_m_axis_result_tvalid;
  assign addLogic_c_20_payload = addLogic_a_20_add_ip_m_axis_result_tdata;
  assign addLogic_c_21_valid = addLogic_a_21_add_ip_m_axis_result_tvalid;
  assign addLogic_c_21_payload = addLogic_a_21_add_ip_m_axis_result_tdata;
  assign addLogic_c_22_valid = addLogic_a_22_add_ip_m_axis_result_tvalid;
  assign addLogic_c_22_payload = addLogic_a_22_add_ip_m_axis_result_tdata;
  assign addLogic_c_23_valid = addLogic_a_23_add_ip_m_axis_result_tvalid;
  assign addLogic_c_23_payload = addLogic_a_23_add_ip_m_axis_result_tdata;
  assign addLogic_c_24_valid = addLogic_a_24_add_ip_m_axis_result_tvalid;
  assign addLogic_c_24_payload = addLogic_a_24_add_ip_m_axis_result_tdata;
  assign addLogic_c_25_valid = addLogic_a_25_add_ip_m_axis_result_tvalid;
  assign addLogic_c_25_payload = addLogic_a_25_add_ip_m_axis_result_tdata;
  assign addLogic_c_26_valid = addLogic_a_26_add_ip_m_axis_result_tvalid;
  assign addLogic_c_26_payload = addLogic_a_26_add_ip_m_axis_result_tdata;
  assign addLogic_c_27_valid = addLogic_a_27_add_ip_m_axis_result_tvalid;
  assign addLogic_c_27_payload = addLogic_a_27_add_ip_m_axis_result_tdata;
  assign addLogic_c_28_valid = addLogic_a_28_add_ip_m_axis_result_tvalid;
  assign addLogic_c_28_payload = addLogic_a_28_add_ip_m_axis_result_tdata;
  assign addLogic_c_29_valid = addLogic_a_29_add_ip_m_axis_result_tvalid;
  assign addLogic_c_29_payload = addLogic_a_29_add_ip_m_axis_result_tdata;
  assign addLogic_c_30_valid = addLogic_a_30_add_ip_m_axis_result_tvalid;
  assign addLogic_c_30_payload = addLogic_a_30_add_ip_m_axis_result_tdata;
  assign addLogic_c_31_valid = addLogic_a_31_add_ip_m_axis_result_tvalid;
  assign addLogic_c_31_payload = addLogic_a_31_add_ip_m_axis_result_tdata;
  assign addLogic_a_0_payload = t_addLogic_a_0_payload;
  assign addLogic_b_0_payload = t_addLogic_b_0_payload;
  assign addLogic_a_1_payload = t_addLogic_a_1_payload;
  assign addLogic_b_1_payload = t_addLogic_b_1_payload;
  assign addLogic_a_2_payload = t_addLogic_a_2_payload;
  assign addLogic_b_2_payload = t_addLogic_b_2_payload;
  assign addLogic_a_3_payload = t_addLogic_a_3_payload;
  assign addLogic_b_3_payload = t_addLogic_b_3_payload;
  assign addLogic_a_4_payload = t_addLogic_a_4_payload;
  assign addLogic_b_4_payload = t_addLogic_b_4_payload;
  assign addLogic_a_5_payload = t_addLogic_a_5_payload;
  assign addLogic_b_5_payload = t_addLogic_b_5_payload;
  assign addLogic_a_6_payload = t_addLogic_a_6_payload;
  assign addLogic_b_6_payload = t_addLogic_b_6_payload;
  assign addLogic_a_7_payload = t_addLogic_a_7_payload;
  assign addLogic_b_7_payload = t_addLogic_b_7_payload;
  assign addLogic_a_8_payload = t_addLogic_a_8_payload;
  assign addLogic_b_8_payload = t_addLogic_b_8_payload;
  assign addLogic_a_9_payload = t_addLogic_a_9_payload;
  assign addLogic_b_9_payload = t_addLogic_b_9_payload;
  assign addLogic_a_10_payload = t_addLogic_a_10_payload;
  assign addLogic_b_10_payload = t_addLogic_b_10_payload;
  assign addLogic_a_11_payload = t_addLogic_a_11_payload;
  assign addLogic_b_11_payload = t_addLogic_b_11_payload;
  assign addLogic_a_12_payload = t_addLogic_a_12_payload;
  assign addLogic_b_12_payload = t_addLogic_b_12_payload;
  assign addLogic_a_13_payload = t_addLogic_a_13_payload;
  assign addLogic_b_13_payload = t_addLogic_b_13_payload;
  assign addLogic_a_14_payload = t_addLogic_a_14_payload;
  assign addLogic_b_14_payload = t_addLogic_b_14_payload;
  assign addLogic_a_15_payload = t_addLogic_a_15_payload;
  assign addLogic_b_15_payload = t_addLogic_b_15_payload;
  assign addLogic_a_16_payload = t_addLogic_a_16_payload;
  assign addLogic_b_16_payload = t_addLogic_b_16_payload;
  assign addLogic_a_17_payload = t_addLogic_a_17_payload;
  assign addLogic_b_17_payload = t_addLogic_b_17_payload;
  assign addLogic_a_18_payload = t_addLogic_a_18_payload;
  assign addLogic_b_18_payload = t_addLogic_b_18_payload;
  assign addLogic_a_19_payload = t_addLogic_a_19_payload;
  assign addLogic_b_19_payload = t_addLogic_b_19_payload;
  assign addLogic_a_20_payload = t_addLogic_a_20_payload;
  assign addLogic_b_20_payload = t_addLogic_b_20_payload;
  assign addLogic_a_21_payload = t_addLogic_a_21_payload;
  assign addLogic_b_21_payload = t_addLogic_b_21_payload;
  assign addLogic_a_22_payload = t_addLogic_a_22_payload;
  assign addLogic_b_22_payload = t_addLogic_b_22_payload;
  assign addLogic_a_23_payload = t_addLogic_a_23_payload;
  assign addLogic_b_23_payload = t_addLogic_b_23_payload;
  assign addLogic_a_24_payload = t_addLogic_a_24_payload;
  assign addLogic_b_24_payload = t_addLogic_b_24_payload;
  assign addLogic_a_25_payload = t_addLogic_a_25_payload;
  assign addLogic_b_25_payload = t_addLogic_b_25_payload;
  assign addLogic_a_26_payload = t_addLogic_a_26_payload;
  assign addLogic_b_26_payload = t_addLogic_b_26_payload;
  assign addLogic_a_27_payload = t_addLogic_a_27_payload;
  assign addLogic_b_27_payload = t_addLogic_b_27_payload;
  assign addLogic_a_28_payload = t_addLogic_a_28_payload;
  assign addLogic_b_28_payload = t_addLogic_b_28_payload;
  assign addLogic_a_29_payload = t_addLogic_a_29_payload;
  assign addLogic_b_29_payload = t_addLogic_b_29_payload;
  assign addLogic_a_30_payload = t_addLogic_a_30_payload;
  assign addLogic_b_30_payload = t_addLogic_b_30_payload;
  assign addLogic_a_31_payload = t_addLogic_a_31_payload;
  assign addLogic_b_31_payload = t_addLogic_b_31_payload;
  assign addLogic_vecOut_0 = addLogic_c_0_payload;
  assign addLogic_vecOut_1 = addLogic_c_1_payload;
  assign addLogic_vecOut_2 = addLogic_c_2_payload;
  assign addLogic_vecOut_3 = addLogic_c_3_payload;
  assign addLogic_vecOut_4 = addLogic_c_4_payload;
  assign addLogic_vecOut_5 = addLogic_c_5_payload;
  assign addLogic_vecOut_6 = addLogic_c_6_payload;
  assign addLogic_vecOut_7 = addLogic_c_7_payload;
  assign addLogic_vecOut_8 = addLogic_c_8_payload;
  assign addLogic_vecOut_9 = addLogic_c_9_payload;
  assign addLogic_vecOut_10 = addLogic_c_10_payload;
  assign addLogic_vecOut_11 = addLogic_c_11_payload;
  assign addLogic_vecOut_12 = addLogic_c_12_payload;
  assign addLogic_vecOut_13 = addLogic_c_13_payload;
  assign addLogic_vecOut_14 = addLogic_c_14_payload;
  assign addLogic_vecOut_15 = addLogic_c_15_payload;
  assign addLogic_vecOut_16 = addLogic_c_16_payload;
  assign addLogic_vecOut_17 = addLogic_c_17_payload;
  assign addLogic_vecOut_18 = addLogic_c_18_payload;
  assign addLogic_vecOut_19 = addLogic_c_19_payload;
  assign addLogic_vecOut_20 = addLogic_c_20_payload;
  assign addLogic_vecOut_21 = addLogic_c_21_payload;
  assign addLogic_vecOut_22 = addLogic_c_22_payload;
  assign addLogic_vecOut_23 = addLogic_c_23_payload;
  assign addLogic_vecOut_24 = addLogic_c_24_payload;
  assign addLogic_vecOut_25 = addLogic_c_25_payload;
  assign addLogic_vecOut_26 = addLogic_c_26_payload;
  assign addLogic_vecOut_27 = addLogic_c_27_payload;
  assign addLogic_vecOut_28 = addLogic_c_28_payload;
  assign addLogic_vecOut_29 = addLogic_c_29_payload;
  assign addLogic_vecOut_30 = addLogic_c_30_payload;
  assign addLogic_vecOut_31 = addLogic_c_31_payload;
  assign addLogic_scalarOut = addLogic_c_0_payload;
  assign addLogic_psumDly_0 = addLogic_popDly[15 : 0];
  assign addLogic_psumDly_1 = addLogic_popDly[31 : 16];
  assign addLogic_psumDly_2 = addLogic_popDly[47 : 32];
  assign addLogic_psumDly_3 = addLogic_popDly[63 : 48];
  assign addLogic_psumDly_4 = addLogic_popDly[79 : 64];
  assign addLogic_psumDly_5 = addLogic_popDly[95 : 80];
  assign addLogic_psumDly_6 = addLogic_popDly[111 : 96];
  assign addLogic_psumDly_7 = addLogic_popDly[127 : 112];
  assign addLogic_psumDly_8 = addLogic_popDly[143 : 128];
  assign addLogic_psumDly_9 = addLogic_popDly[159 : 144];
  assign addLogic_psumDly_10 = addLogic_popDly[175 : 160];
  assign addLogic_psumDly_11 = addLogic_popDly[191 : 176];
  assign addLogic_psumDly_12 = addLogic_popDly[207 : 192];
  assign addLogic_psumDly_13 = addLogic_popDly[223 : 208];
  assign addLogic_psumDly_14 = addLogic_popDly[239 : 224];
  assign addLogic_psumDly_15 = addLogic_popDly[255 : 240];
  assign addLogic_psumDly_16 = addLogic_popDly[271 : 256];
  assign addLogic_psumDly_17 = addLogic_popDly[287 : 272];
  assign addLogic_psumDly_18 = addLogic_popDly[303 : 288];
  assign addLogic_psumDly_19 = addLogic_popDly[319 : 304];
  assign addLogic_psumDly_20 = addLogic_popDly[335 : 320];
  assign addLogic_psumDly_21 = addLogic_popDly[351 : 336];
  assign addLogic_psumDly_22 = addLogic_popDly[367 : 352];
  assign addLogic_psumDly_23 = addLogic_popDly[383 : 368];
  assign addLogic_psumDly_24 = addLogic_popDly[399 : 384];
  assign addLogic_psumDly_25 = addLogic_popDly[415 : 400];
  assign addLogic_psumDly_26 = addLogic_popDly[431 : 416];
  assign addLogic_psumDly_27 = addLogic_popDly[447 : 432];
  assign addLogic_psumDly_28 = addLogic_popDly[463 : 448];
  assign addLogic_psumDly_29 = addLogic_popDly[479 : 464];
  assign addLogic_psumDly_30 = addLogic_popDly[495 : 480];
  assign addLogic_psumDly_31 = addLogic_popDly[511 : 496];
  assign addLogic_psum_0 = fifoCtrl_io_pop_payload[15 : 0];
  assign addLogic_psum_1 = fifoCtrl_io_pop_payload[31 : 16];
  assign addLogic_psum_2 = fifoCtrl_io_pop_payload[47 : 32];
  assign addLogic_psum_3 = fifoCtrl_io_pop_payload[63 : 48];
  assign addLogic_psum_4 = fifoCtrl_io_pop_payload[79 : 64];
  assign addLogic_psum_5 = fifoCtrl_io_pop_payload[95 : 80];
  assign addLogic_psum_6 = fifoCtrl_io_pop_payload[111 : 96];
  assign addLogic_psum_7 = fifoCtrl_io_pop_payload[127 : 112];
  assign addLogic_psum_8 = fifoCtrl_io_pop_payload[143 : 128];
  assign addLogic_psum_9 = fifoCtrl_io_pop_payload[159 : 144];
  assign addLogic_psum_10 = fifoCtrl_io_pop_payload[175 : 160];
  assign addLogic_psum_11 = fifoCtrl_io_pop_payload[191 : 176];
  assign addLogic_psum_12 = fifoCtrl_io_pop_payload[207 : 192];
  assign addLogic_psum_13 = fifoCtrl_io_pop_payload[223 : 208];
  assign addLogic_psum_14 = fifoCtrl_io_pop_payload[239 : 224];
  assign addLogic_psum_15 = fifoCtrl_io_pop_payload[255 : 240];
  assign addLogic_psum_16 = fifoCtrl_io_pop_payload[271 : 256];
  assign addLogic_psum_17 = fifoCtrl_io_pop_payload[287 : 272];
  assign addLogic_psum_18 = fifoCtrl_io_pop_payload[303 : 288];
  assign addLogic_psum_19 = fifoCtrl_io_pop_payload[319 : 304];
  assign addLogic_psum_20 = fifoCtrl_io_pop_payload[335 : 320];
  assign addLogic_psum_21 = fifoCtrl_io_pop_payload[351 : 336];
  assign addLogic_psum_22 = fifoCtrl_io_pop_payload[367 : 352];
  assign addLogic_psum_23 = fifoCtrl_io_pop_payload[383 : 368];
  assign addLogic_psum_24 = fifoCtrl_io_pop_payload[399 : 384];
  assign addLogic_psum_25 = fifoCtrl_io_pop_payload[415 : 400];
  assign addLogic_psum_26 = fifoCtrl_io_pop_payload[431 : 416];
  assign addLogic_psum_27 = fifoCtrl_io_pop_payload[447 : 432];
  assign addLogic_psum_28 = fifoCtrl_io_pop_payload[463 : 448];
  assign addLogic_psum_29 = fifoCtrl_io_pop_payload[479 : 464];
  assign addLogic_psum_30 = fifoCtrl_io_pop_payload[495 : 480];
  assign addLogic_psum_31 = fifoCtrl_io_pop_payload[511 : 496];
  assign fifoCtrl_io_push_payload = {addLogic_vecOut_31,{addLogic_vecOut_30,{addLogic_vecOut_29,{addLogic_vecOut_28,{addLogic_vecOut_27,{addLogic_vecOut_26,{addLogic_vecOut_25,{addLogic_vecOut_24,{addLogic_vecOut_23,{addLogic_vecOut_22,{addLogic_vecOut_21,{addLogic_vecOut_20,{addLogic_vecOut_19,{addLogic_vecOut_18,{addLogic_vecOut_17,{addLogic_vecOut_16,t_io_push_payload}}}}}}}}}}}}}}}};
  assign vecOut_tdata = {addLogic_vecOut_31,{addLogic_vecOut_30,{addLogic_vecOut_29,{addLogic_vecOut_28,{addLogic_vecOut_27,{addLogic_vecOut_26,{addLogic_vecOut_25,{addLogic_vecOut_24,{addLogic_vecOut_23,{addLogic_vecOut_22,{addLogic_vecOut_21,{addLogic_vecOut_20,{addLogic_vecOut_19,{addLogic_vecOut_18,{addLogic_vecOut_17,{addLogic_vecOut_16,t_vecOut_tdata}}}}}}}}}}}}}}}};
  assign dotCtrl_aSelNext = 2'b01;
  assign dotCtrl_bSelNext = 2'b01;
  assign dotCtrl_enMulResCntNext = (mulResFireNext && ret_0_valid);
  assign t_dotCtrl_mulResCntOvf_0 = (t_dotCtrl_muResCnt_0 == ret_0_payload[22 : 16]);
  assign t_dotCtrl_mulResCntOvf_1 = (t_dotCtrl_muResCnt_1 == {ret_0_payload[23],ret_0_payload[15 : 0]});
  always @(*) begin
    t_dotCtrl_muResCnt_0 = dotCtrl_muResCnt_0;
    if(dotCtrl_enMulResCnt) begin
      t_dotCtrl_muResCnt_0 = (dotCtrl_muResCnt_0 + 7'h01);
      if(dotCtrl_mulResCntOvf_0) begin
        t_dotCtrl_muResCnt_0 = 7'h0;
      end
    end
  end

  always @(*) begin
    t_dotCtrl_muResCnt_1 = dotCtrl_muResCnt_1;
    if(dotCtrl_enMulResCnt) begin
      if(dotCtrl_mulResCntOvf_0) begin
        t_dotCtrl_muResCnt_1 = (dotCtrl_muResCnt_1 + 17'h00001);
        if(dotCtrl_mulResCntOvf_1) begin
          t_dotCtrl_muResCnt_1 = 17'h0;
        end
      end
    end
  end

  assign dotCtrl_flagClrCond = (dotCtrl_enMulResCnt && dotCtrl_mulResCntOvfReduce);
  always @(*) begin
    dotCtrl_flagInvNext = dotCtrl_flagInv;
    if(dotCtrl_flagClrCond) begin
      dotCtrl_flagInvNext = 1'b0;
    end
    if(dotCtrl_flagSetCond) begin
      dotCtrl_flagInvNext = 1'b1;
    end
  end

  assign dotCtrl_accCntOvf = (t_dotCtrl_accCntOvf == dotCtrl_cfgPayload[22 : 16]);
  assign scalarOut_tvalid = dotCtrl_enAddOutCnt;
  assign scalarOut_tdata = addLogic_scalarOut;
  assign scalarOut_tuser = tag;
  assign scalarOut_tlast = dotCtrl_accCntOvf_delay_30_1;
  assign ret_0_ready = (dotCtrl_enAddOutCnt && (dotCtrl_addOutCntOvf_0 && dotCtrl_addOutCntOvf_1));
  assign postCfgTag = dotCtrl_cfgPayload[31 : 26];
  assign fAxpyCtrl_enMulResCntNext = (mulResFireNext && ret_1_valid);
  assign t_fAxpyCtrl_mulResCntOvf_0 = (t_fAxpyCtrl_muResCnt_0 == ret_1_payload[22 : 16]);
  assign t_fAxpyCtrl_mulResCntOvf_1 = (t_fAxpyCtrl_muResCnt_1 == {ret_1_payload[23],ret_1_payload[15 : 0]});
  always @(*) begin
    t_fAxpyCtrl_muResCnt_0 = fAxpyCtrl_muResCnt_0;
    if(fAxpyCtrl_enMulResCnt) begin
      t_fAxpyCtrl_muResCnt_0 = (fAxpyCtrl_muResCnt_0 + 7'h01);
      if(fAxpyCtrl_mulResCntOvf_0) begin
        t_fAxpyCtrl_muResCnt_0 = 7'h0;
      end
    end
  end

  always @(*) begin
    t_fAxpyCtrl_muResCnt_1 = fAxpyCtrl_muResCnt_1;
    if(fAxpyCtrl_enMulResCnt) begin
      if(fAxpyCtrl_mulResCntOvf_0) begin
        t_fAxpyCtrl_muResCnt_1 = (fAxpyCtrl_muResCnt_1 + 17'h00001);
        if(fAxpyCtrl_mulResCntOvf_1) begin
          t_fAxpyCtrl_muResCnt_1 = 17'h0;
        end
      end
    end
  end

  always @(*) begin
    fAxpyCtrl_mulResCntLastZeroNext = fAxpyCtrl_mulResCntLastZero;
    if(fAxpyCtrl_enMulResCnt) begin
      if(fAxpyCtrl_mulResCntOvf_0) begin
        fAxpyCtrl_mulResCntLastZeroNext = 1'b0;
        if(fAxpyCtrl_mulResCntOvf_1) begin
          fAxpyCtrl_mulResCntLastZeroNext = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    fAxpyCtrl_mulResCntLastNotZeroNext = fAxpyCtrl_mulResCntLastNotZero;
    if(fAxpyCtrl_enMulResCnt) begin
      if(fAxpyCtrl_mulResCntOvf_0) begin
        fAxpyCtrl_mulResCntLastNotZeroNext = 1'b1;
        if(fAxpyCtrl_mulResCntOvf_1) begin
          fAxpyCtrl_mulResCntLastNotZeroNext = 1'b0;
        end
      end
    end
  end

  assign fAxpyCtrl_psumPushEn = fAxpyCtrl_psumPushEnReg;
  assign fAxpyCtrl_resAddReadyNext = ((fAxpyCtrl_enMulResCntNext && fAxpyCtrl_mulResCntLastZeroNext) && ret_1_payload[25]);
  assign resAdd_tready = fAxpyCtrl_resAddReady;
  assign fAxpyCtrl_psumPopEnRegNext = (fAxpyCtrl_enMulResCntNext && fAxpyCtrl_mulResCntLastNotZeroNext);
  assign fAxpyCtrl_psumPopEn = fAxpyCtrl_psumPopEnReg;
  assign fAxpyCtrl_aSelNext = 2'b00;
  always @(*) begin
    fAxpyCtrl_bSelNext = 2'b11;
    if(fAxpyCtrl_resAddReadyNext) begin
      fAxpyCtrl_bSelNext = 2'b10;
    end
    if(fAxpyCtrl_psumPopEnRegNext) begin
      fAxpyCtrl_bSelNext = 2'b00;
    end
  end

  assign ret_1_ready = (fAxpyCtrl_enMulResCnt && fAxpyCtrl_mulResCntOvfReduce);
  assign fAxpyCtrl_vecOutVld = (fAxpyCtrl_enAddOutCnt && fAxpyCtrl_addOutCntOvf_1);
  always @(*) begin
    pAxpyCtrl_cycleReduceNext = pAxpyCtrl_cycleReduce;
    if(pAxpyCtrl_enMulResCnt) begin
      if(pAxpyCtrl_mulResCntOvf) begin
        pAxpyCtrl_cycleReduceNext = 1'b1;
      end
    end
    if(pAxpyCtrl_enCycleCnt) begin
      if(pAxpyCtrl_lastElem) begin
        pAxpyCtrl_cycleReduceNext = 1'b0;
      end
    end
  end

  assign pAxpyCtrl_enMulResCntNext = (mulResFireNext && ret_2_valid);
  assign pAxpyCtrl_mulResCntLow = pAxpyCtrl_mulResCnt[2 : 0];
  assign pAxpyCtrl_mulResCntHigh = pAxpyCtrl_mulResCnt[15 : 3];
  assign pAxpyCtrl_mulResCntOvfNext = (t_pAxpyCtrl_mulResCntOvfNext == {ret_2_payload[23],ret_2_payload[15 : 0]});
  always @(*) begin
    pAxpyCtrl_mulResCntHighZeroNext = pAxpyCtrl_mulResCntHighZero;
    if(pAxpyCtrl_enMulResCnt) begin
      if(t_when) begin
        pAxpyCtrl_mulResCntHighZeroNext = 1'b0;
      end
    end
    if(pAxpyCtrl_enMulResCnt) begin
      if(pAxpyCtrl_mulResCntOvf) begin
        pAxpyCtrl_mulResCntHighZeroNext = 1'b1;
      end
    end
  end

  always @(*) begin
    pAxpyCtrl_mulResCntHighNotZeroNext = pAxpyCtrl_mulResCntHighNotZero;
    if(pAxpyCtrl_enMulResCnt) begin
      if(t_when) begin
        pAxpyCtrl_mulResCntHighNotZeroNext = 1'b1;
      end
    end
    if(pAxpyCtrl_enMulResCnt) begin
      if(pAxpyCtrl_mulResCntOvf) begin
        pAxpyCtrl_mulResCntHighNotZeroNext = 1'b0;
      end
    end
  end

  always @(*) begin
    pAxpyCtrl_mulResCntNext = pAxpyCtrl_mulResCnt;
    if(pAxpyCtrl_enMulResCnt) begin
      pAxpyCtrl_mulResCntNext = (pAxpyCtrl_mulResCnt + 16'h0001);
      if(pAxpyCtrl_mulResCntOvf) begin
        pAxpyCtrl_mulResCntNext = 16'h0;
      end
    end
  end

  assign pAxpyCtrl_enAddOutCnt = (pAxpyCtrl_enMulResCntDly && (! pAxpyCtrl_cycleReduceDly));
  assign pAxpyCtrl_enCycleCnt = (pAxpyCtrl_cycleReduceDly && pAxpyCtrl_reduceVldDly);
  assign t_pAxpyCtrl_lastElemNext = 3'b110;
  assign t_pAxpyCtrl_lastElemNext_1 = ({ret_2_payload[23],ret_2_payload[15 : 0]} - 17'h00001);
  assign pAxpyCtrl_lastElemNext = (t_pAxpyCtrl_lastElemNext_2 == ((t_pAxpyCtrl_lastElemNext_3 < t_pAxpyCtrl_lastElemNext_1) ? t_pAxpyCtrl_lastElemNext_4 : t_pAxpyCtrl_lastElemNext_1));
  always @(*) begin
    pAxpyCtrl_cycleCntNext = pAxpyCtrl_cycleCnt;
    if(pAxpyCtrl_enCycleCnt) begin
      pAxpyCtrl_cycleCntNext = (pAxpyCtrl_cycleCnt + 3'b001);
      if(pAxpyCtrl_lastElem) begin
        pAxpyCtrl_cycleCntNext = 3'b000;
      end
    end
  end

  assign pAxpyCtrl_psumPushEn = (pAxpyCtrl_cycleReduceDly ? (pAxpyCtrl_enCycleCnt && (! (pAxpyCtrl_enCycleCnt && pAxpyCtrl_lastElem))) : pAxpyCtrl_enMulResCntDly);
  always @(*) begin
    pAxpyCtrl_psumPopEnNext = 1'b0;
    if((pAxpyCtrl_enMulResCntNext && pAxpyCtrl_mulResCntHighNotZeroNext)) begin
      pAxpyCtrl_psumPopEnNext = 1'b1;
    end
    if(pAxpyCtrl_cycleReduceNext) begin
      pAxpyCtrl_psumPopEnNext = 1'b1;
    end
  end

  assign pAxpyCtrl_aSelNext = {pAxpyCtrl_cycleReduceNext,1'b0};
  assign pAxpyCtrl_bSelBitNext = (pAxpyCtrl_enMulResCntNext && pAxpyCtrl_mulResCntHighZeroNext);
  assign pAxpyCtrl_bSelNext = {pAxpyCtrl_bSelBitNext,pAxpyCtrl_bSelBitNext};
  assign pAxpyCtrl_flagClrCond = (pAxpyCtrl_enMulResCnt && pAxpyCtrl_mulResCntOvf);
  always @(*) begin
    pAxpyCtrl_flagInvNext = pAxpyCtrl_flagInv;
    if(pAxpyCtrl_flagClrCond) begin
      pAxpyCtrl_flagInvNext = 1'b0;
    end
    if(pAxpyCtrl_flagSetCond) begin
      pAxpyCtrl_flagInvNext = 1'b1;
    end
  end

  assign add_fifoCtrl_io_pop_fire = (fifoCtrl_io_pop_valid && fifoCtrl_io_pop_ready);
  assign pAxpyCtrl_reduceVld = (pAxpyCtrl_vldToggle && add_fifoCtrl_io_pop_fire);
  always @(*) begin
    pAxpyCtrl_psumVld = add_fifoCtrl_io_pop_fire;
    if(pAxpyCtrl_cycleReduce) begin
      pAxpyCtrl_psumVld = pAxpyCtrl_reduceVld;
    end
  end

  assign ret_2_ready = (pAxpyCtrl_enCycleCnt && pAxpyCtrl_lastElem);
  assign pAxpyCtrl_reduceVldDly = t_pAxpyCtrl_reduceVldDly_5;
  assign pAxpyCtrl_vecOutVld = ((pAxpyCtrl_cfgVld && pAxpyCtrl_enCycleCnt) && pAxpyCtrl_lastElem);
  assign vecOut_tvalid = (fAxpyCtrl_vecOutVld || pAxpyCtrl_vecOutVld);
  assign vecOut_tuser = (fAxpyCtrl_vecOutVld ? tagAddDly : tag);
  assign selVldNextOneHot = {{ret_2_valid,ret_1_valid},ret_0_valid};
  assign t_selVldNextUInt = selVldNextOneHot[1];
  assign t_selVldNextUInt_1 = selVldNextOneHot[2];
  assign selVldNextUInt = {t_selVldNextUInt_1,t_selVldNextUInt};
  assign fifoCtrl_io_push_valid = t_io_push_valid;
  assign fifoCtrl_io_pop_ready = t_io_pop_ready;
  assign aSelNext = t_aSelNext;
  assign bSelNext = t_bSelNext;
  assign addLogic_aSel = aSel;
  assign addLogic_bSel = bSel;
  always @(*) begin
    readyNext = 1'b0;
    if(ret_0_valid) begin
      readyNext = dotCtrl_flagInvNext;
    end
    if(ret_1_valid) begin
      readyNext = 1'b1;
    end
    if(ret_2_valid) begin
      readyNext = pAxpyCtrl_flagInvNext;
    end
  end

  assign mulRes_tready = ready;
  assign mulResFireNext = (popVldNext && readyNext);
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      mulResFire <= 1'b0;
      tag_delay_1 <= 6'h0;
      tag_delay_2 <= 6'h0;
      tag_delay_3 <= 6'h0;
      tag_delay_4 <= 6'h0;
      tag_delay_5 <= 6'h0;
      tag_delay_6 <= 6'h0;
      tag_delay_7 <= 6'h0;
      tag_delay_8 <= 6'h0;
      tag_delay_9 <= 6'h0;
      tag_delay_10 <= 6'h0;
      tag_delay_11 <= 6'h0;
      tag_delay_12 <= 6'h0;
      tag_delay_13 <= 6'h0;
      tag_delay_14 <= 6'h0;
      tag_delay_15 <= 6'h0;
      tag_delay_16 <= 6'h0;
      tag_delay_17 <= 6'h0;
      tag_delay_18 <= 6'h0;
      tag_delay_19 <= 6'h0;
      tag_delay_20 <= 6'h0;
      tag_delay_21 <= 6'h0;
      tagReduceDly <= 6'h0;
      tag_delay_1_1 <= 6'h0;
      tag_delay_2_1 <= 6'h0;
      tag_delay_3_1 <= 6'h0;
      tag_delay_4_1 <= 6'h0;
      tag_delay_5_1 <= 6'h0;
      tagAddDly <= 6'h0;
      dotCtrl_cfgVld <= 1'b0;
      dotCtrl_enMulResCnt <= 1'b0;
      dotCtrl_muResCnt_0 <= 7'h0;
      dotCtrl_muResCnt_1 <= 17'h0;
      dotCtrl_mulResCntOvf_0 <= 1'b0;
      dotCtrl_mulResCntOvf_1 <= 1'b0;
      dotCtrl_mulResCntOvfReduce <= 1'b0;
      dotCtrl_enMulResCnt_delay_1 <= 1'b0;
      dotCtrl_enMulResCnt_delay_2 <= 1'b0;
      dotCtrl_enMulResCnt_delay_3 <= 1'b0;
      dotCtrl_enMulResCnt_delay_4 <= 1'b0;
      dotCtrl_enMulResCnt_delay_5 <= 1'b0;
      dotCtrl_enMulResCnt_delay_6 <= 1'b0;
      dotCtrl_enMulResCnt_delay_7 <= 1'b0;
      dotCtrl_enMulResCnt_delay_8 <= 1'b0;
      dotCtrl_enMulResCnt_delay_9 <= 1'b0;
      dotCtrl_enMulResCnt_delay_10 <= 1'b0;
      dotCtrl_enMulResCnt_delay_11 <= 1'b0;
      dotCtrl_enMulResCnt_delay_12 <= 1'b0;
      dotCtrl_enMulResCnt_delay_13 <= 1'b0;
      dotCtrl_enMulResCnt_delay_14 <= 1'b0;
      dotCtrl_enMulResCnt_delay_15 <= 1'b0;
      dotCtrl_enMulResCnt_delay_16 <= 1'b0;
      dotCtrl_enMulResCnt_delay_17 <= 1'b0;
      dotCtrl_enMulResCnt_delay_18 <= 1'b0;
      dotCtrl_enMulResCnt_delay_19 <= 1'b0;
      dotCtrl_enMulResCnt_delay_20 <= 1'b0;
      dotCtrl_enMulResCnt_delay_21 <= 1'b0;
      dotCtrl_enMulResCnt_delay_22 <= 1'b0;
      dotCtrl_enMulResCnt_delay_23 <= 1'b0;
      dotCtrl_enMulResCnt_delay_24 <= 1'b0;
      dotCtrl_enMulResCnt_delay_25 <= 1'b0;
      dotCtrl_enMulResCnt_delay_26 <= 1'b0;
      dotCtrl_enMulResCnt_delay_27 <= 1'b0;
      dotCtrl_enMulResCnt_delay_28 <= 1'b0;
      dotCtrl_enMulResCnt_delay_29 <= 1'b0;
      dotCtrl_enAddOutCnt <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_1 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_2 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_3 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_4 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_5 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_6 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_7 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_8 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_9 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_10 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_11 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_12 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_13 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_14 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_15 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_16 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_17 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_18 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_19 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_20 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_21 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_22 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_23 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_24 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_25 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_26 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_27 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_28 <= 1'b0;
      dotCtrl_mulResCntOvf_0_delay_29 <= 1'b0;
      dotCtrl_addOutCntOvf_0 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_1 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_2 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_3 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_4 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_5 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_6 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_7 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_8 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_9 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_10 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_11 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_12 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_13 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_14 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_15 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_16 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_17 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_18 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_19 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_20 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_21 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_22 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_23 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_24 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_25 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_26 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_27 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_28 <= 1'b0;
      dotCtrl_mulResCntOvf_1_delay_29 <= 1'b0;
      dotCtrl_addOutCntOvf_1 <= 1'b0;
      dotCtrl_flagSetCond <= 1'b0;
      dotCtrl_flagInv <= 1'b1;
      dotCtrl_accCnt <= 5'h0;
      dotCtrl_accCntOvf_delay_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_2 <= 1'b0;
      dotCtrl_accCntOvf_delay_3 <= 1'b0;
      dotCtrl_accCntOvf_delay_4 <= 1'b0;
      dotCtrl_accCntOvf_delay_5 <= 1'b0;
      dotCtrl_accCntOvf_delay_6 <= 1'b0;
      dotCtrl_accCntOvf_delay_7 <= 1'b0;
      dotCtrl_accCntOvf_delay_8 <= 1'b0;
      dotCtrl_accCntOvf_delay_9 <= 1'b0;
      dotCtrl_accCntOvf_delay_10 <= 1'b0;
      dotCtrl_accCntOvf_delay_11 <= 1'b0;
      dotCtrl_accCntOvf_delay_12 <= 1'b0;
      dotCtrl_accCntOvf_delay_13 <= 1'b0;
      dotCtrl_accCntOvf_delay_14 <= 1'b0;
      dotCtrl_accCntOvf_delay_15 <= 1'b0;
      dotCtrl_accCntOvf_delay_16 <= 1'b0;
      dotCtrl_accCntOvf_delay_17 <= 1'b0;
      dotCtrl_accCntOvf_delay_18 <= 1'b0;
      dotCtrl_accCntOvf_delay_19 <= 1'b0;
      dotCtrl_accCntOvf_delay_20 <= 1'b0;
      dotCtrl_accCntOvf_delay_21 <= 1'b0;
      dotCtrl_accCntOvf_delay_22 <= 1'b0;
      dotCtrl_accCntOvf_delay_23 <= 1'b0;
      dotCtrl_accCntOvf_delay_24 <= 1'b0;
      dotCtrl_accCntOvf_delay_25 <= 1'b0;
      dotCtrl_accCntOvf_delay_26 <= 1'b0;
      dotCtrl_accCntOvf_delay_27 <= 1'b0;
      dotCtrl_accCntOvf_delay_28 <= 1'b0;
      dotCtrl_accCntOvf_delay_29 <= 1'b0;
      dotCtrl_accCntOvf_delay_30 <= 1'b0;
      dotCtrl_accCntOvf_delay_31 <= 1'b0;
      dotCtrl_accCntOvf_delay_32 <= 1'b0;
      dotCtrl_accCntOvf_delay_33 <= 1'b0;
      dotCtrl_accCntOvf_delay_34 <= 1'b0;
      dotCtrl_accCntOvf_delay_35 <= 1'b0;
      dotCtrl_accCntOvfDly <= 1'b0;
      dotCtrl_accCntOvf_delay_1_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_2_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_3_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_4_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_5_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_6_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_7_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_8_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_9_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_10_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_11_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_12_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_13_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_14_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_15_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_16_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_17_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_18_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_19_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_20_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_21_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_22_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_23_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_24_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_25_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_26_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_27_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_28_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_29_1 <= 1'b0;
      dotCtrl_accCntOvf_delay_30_1 <= 1'b0;
      fAxpyCtrl_cfgVld <= 1'b0;
      fAxpyCtrl_enMulResCnt <= 1'b0;
      fAxpyCtrl_muResCnt_0 <= 7'h0;
      fAxpyCtrl_muResCnt_1 <= 17'h0;
      fAxpyCtrl_mulResCntOvf_0 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1 <= 1'b0;
      fAxpyCtrl_mulResCntOvfReduce <= 1'b0;
      fAxpyCtrl_mulResCntLastZero <= 1'b1;
      fAxpyCtrl_mulResCntLastNotZero <= 1'b0;
      fAxpyCtrl_enMulResCnt_delay_1 <= 1'b0;
      fAxpyCtrl_enMulResCnt_delay_2 <= 1'b0;
      fAxpyCtrl_enMulResCnt_delay_3 <= 1'b0;
      fAxpyCtrl_enMulResCnt_delay_4 <= 1'b0;
      fAxpyCtrl_enMulResCnt_delay_5 <= 1'b0;
      fAxpyCtrl_enAddOutCnt <= 1'b0;
      fAxpyCtrl_mulResCntOvf_0_delay_1 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_0_delay_2 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_0_delay_3 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_0_delay_4 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_0_delay_5 <= 1'b0;
      fAxpyCtrl_addOutCntOvf_0 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1_delay_1 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1_delay_2 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1_delay_3 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1_delay_4 <= 1'b0;
      fAxpyCtrl_mulResCntOvf_1_delay_5 <= 1'b0;
      fAxpyCtrl_addOutCntOvf_1 <= 1'b0;
      t_fAxpyCtrl_psumPushEnReg <= 1'b0;
      t_fAxpyCtrl_psumPushEnReg_1 <= 1'b0;
      t_fAxpyCtrl_psumPushEnReg_2 <= 1'b0;
      t_fAxpyCtrl_psumPushEnReg_3 <= 1'b0;
      t_fAxpyCtrl_psumPushEnReg_4 <= 1'b0;
      fAxpyCtrl_psumPushEnReg <= 1'b0;
      fAxpyCtrl_resAddReady <= 1'b0;
      fAxpyCtrl_psumPopEnReg <= 1'b0;
      pAxpyCtrl_cfgVld <= 1'b0;
      pAxpyCtrl_cycleReduce <= 1'b0;
      pAxpyCtrl_cycleReduceDly <= 1'b0;
      pAxpyCtrl_enMulResCnt <= 1'b0;
      pAxpyCtrl_mulResCnt <= 16'h0;
      pAxpyCtrl_mulResCntOvf <= 1'b0;
      pAxpyCtrl_mulResCntHighZero <= 1'b1;
      pAxpyCtrl_mulResCntHighNotZero <= 1'b0;
      pAxpyCtrl_enMulResCnt_delay_1 <= 1'b0;
      pAxpyCtrl_enMulResCnt_delay_2 <= 1'b0;
      pAxpyCtrl_enMulResCnt_delay_3 <= 1'b0;
      pAxpyCtrl_enMulResCnt_delay_4 <= 1'b0;
      pAxpyCtrl_enMulResCnt_delay_5 <= 1'b0;
      pAxpyCtrl_enMulResCntDly <= 1'b0;
      pAxpyCtrl_mulResCntOvf_delay_1 <= 1'b0;
      pAxpyCtrl_mulResCntOvf_delay_2 <= 1'b0;
      pAxpyCtrl_mulResCntOvf_delay_3 <= 1'b0;
      pAxpyCtrl_mulResCntOvf_delay_4 <= 1'b0;
      pAxpyCtrl_mulResCntOvf_delay_5 <= 1'b0;
      pAxpyCtrl_addOutCntOvf <= 1'b0;
      pAxpyCtrl_cycleCnt <= 3'b000;
      pAxpyCtrl_lastElem <= 1'b0;
      pAxpyCtrl_psumPopEn <= 1'b0;
      pAxpyCtrl_bSelBit <= 1'b0;
      pAxpyCtrl_flagSetCond <= 1'b0;
      pAxpyCtrl_flagInv <= 1'b1;
      pAxpyCtrl_vldToggle <= 1'b0;
      t_pAxpyCtrl_reduceVldDly <= 1'b0;
      t_pAxpyCtrl_reduceVldDly_1 <= 1'b0;
      t_pAxpyCtrl_reduceVldDly_2 <= 1'b0;
      t_pAxpyCtrl_reduceVldDly_3 <= 1'b0;
      t_pAxpyCtrl_reduceVldDly_4 <= 1'b0;
      t_pAxpyCtrl_reduceVldDly_5 <= 1'b0;
      selVldUIntReg <= 2'b00;
      selFifoPushUInt <= 2'b00;
      selFifoPopUInt <= 2'b00;
      aSel <= 2'b01;
      bSel <= 2'b01;
      ready <= 1'b0;
    end else begin
      tag_delay_1 <= tag;
      tag_delay_2 <= tag_delay_1;
      tag_delay_3 <= tag_delay_2;
      tag_delay_4 <= tag_delay_3;
      tag_delay_5 <= tag_delay_4;
      tag_delay_6 <= tag_delay_5;
      tag_delay_7 <= tag_delay_6;
      tag_delay_8 <= tag_delay_7;
      tag_delay_9 <= tag_delay_8;
      tag_delay_10 <= tag_delay_9;
      tag_delay_11 <= tag_delay_10;
      tag_delay_12 <= tag_delay_11;
      tag_delay_13 <= tag_delay_12;
      tag_delay_14 <= tag_delay_13;
      tag_delay_15 <= tag_delay_14;
      tag_delay_16 <= tag_delay_15;
      tag_delay_17 <= tag_delay_16;
      tag_delay_18 <= tag_delay_17;
      tag_delay_19 <= tag_delay_18;
      tag_delay_20 <= tag_delay_19;
      tag_delay_21 <= tag_delay_20;
      tagReduceDly <= tag_delay_21;
      tag_delay_1_1 <= tag;
      tag_delay_2_1 <= tag_delay_1_1;
      tag_delay_3_1 <= tag_delay_2_1;
      tag_delay_4_1 <= tag_delay_3_1;
      tag_delay_5_1 <= tag_delay_4_1;
      tagAddDly <= tag_delay_5_1;
      dotCtrl_cfgVld <= ret_0_valid;
      dotCtrl_enMulResCnt <= dotCtrl_enMulResCntNext;
      dotCtrl_muResCnt_0 <= t_dotCtrl_muResCnt_0;
      dotCtrl_muResCnt_1 <= t_dotCtrl_muResCnt_1;
      dotCtrl_mulResCntOvf_0 <= t_dotCtrl_mulResCntOvf_0;
      dotCtrl_mulResCntOvf_1 <= t_dotCtrl_mulResCntOvf_1;
      dotCtrl_mulResCntOvfReduce <= (t_dotCtrl_mulResCntOvf_0 && t_dotCtrl_mulResCntOvf_1);
      dotCtrl_enMulResCnt_delay_1 <= dotCtrl_enMulResCnt;
      dotCtrl_enMulResCnt_delay_2 <= dotCtrl_enMulResCnt_delay_1;
      dotCtrl_enMulResCnt_delay_3 <= dotCtrl_enMulResCnt_delay_2;
      dotCtrl_enMulResCnt_delay_4 <= dotCtrl_enMulResCnt_delay_3;
      dotCtrl_enMulResCnt_delay_5 <= dotCtrl_enMulResCnt_delay_4;
      dotCtrl_enMulResCnt_delay_6 <= dotCtrl_enMulResCnt_delay_5;
      dotCtrl_enMulResCnt_delay_7 <= dotCtrl_enMulResCnt_delay_6;
      dotCtrl_enMulResCnt_delay_8 <= dotCtrl_enMulResCnt_delay_7;
      dotCtrl_enMulResCnt_delay_9 <= dotCtrl_enMulResCnt_delay_8;
      dotCtrl_enMulResCnt_delay_10 <= dotCtrl_enMulResCnt_delay_9;
      dotCtrl_enMulResCnt_delay_11 <= dotCtrl_enMulResCnt_delay_10;
      dotCtrl_enMulResCnt_delay_12 <= dotCtrl_enMulResCnt_delay_11;
      dotCtrl_enMulResCnt_delay_13 <= dotCtrl_enMulResCnt_delay_12;
      dotCtrl_enMulResCnt_delay_14 <= dotCtrl_enMulResCnt_delay_13;
      dotCtrl_enMulResCnt_delay_15 <= dotCtrl_enMulResCnt_delay_14;
      dotCtrl_enMulResCnt_delay_16 <= dotCtrl_enMulResCnt_delay_15;
      dotCtrl_enMulResCnt_delay_17 <= dotCtrl_enMulResCnt_delay_16;
      dotCtrl_enMulResCnt_delay_18 <= dotCtrl_enMulResCnt_delay_17;
      dotCtrl_enMulResCnt_delay_19 <= dotCtrl_enMulResCnt_delay_18;
      dotCtrl_enMulResCnt_delay_20 <= dotCtrl_enMulResCnt_delay_19;
      dotCtrl_enMulResCnt_delay_21 <= dotCtrl_enMulResCnt_delay_20;
      dotCtrl_enMulResCnt_delay_22 <= dotCtrl_enMulResCnt_delay_21;
      dotCtrl_enMulResCnt_delay_23 <= dotCtrl_enMulResCnt_delay_22;
      dotCtrl_enMulResCnt_delay_24 <= dotCtrl_enMulResCnt_delay_23;
      dotCtrl_enMulResCnt_delay_25 <= dotCtrl_enMulResCnt_delay_24;
      dotCtrl_enMulResCnt_delay_26 <= dotCtrl_enMulResCnt_delay_25;
      dotCtrl_enMulResCnt_delay_27 <= dotCtrl_enMulResCnt_delay_26;
      dotCtrl_enMulResCnt_delay_28 <= dotCtrl_enMulResCnt_delay_27;
      dotCtrl_enMulResCnt_delay_29 <= dotCtrl_enMulResCnt_delay_28;
      dotCtrl_enAddOutCnt <= dotCtrl_enMulResCnt_delay_29;
      dotCtrl_mulResCntOvf_0_delay_1 <= dotCtrl_mulResCntOvf_0;
      dotCtrl_mulResCntOvf_0_delay_2 <= dotCtrl_mulResCntOvf_0_delay_1;
      dotCtrl_mulResCntOvf_0_delay_3 <= dotCtrl_mulResCntOvf_0_delay_2;
      dotCtrl_mulResCntOvf_0_delay_4 <= dotCtrl_mulResCntOvf_0_delay_3;
      dotCtrl_mulResCntOvf_0_delay_5 <= dotCtrl_mulResCntOvf_0_delay_4;
      dotCtrl_mulResCntOvf_0_delay_6 <= dotCtrl_mulResCntOvf_0_delay_5;
      dotCtrl_mulResCntOvf_0_delay_7 <= dotCtrl_mulResCntOvf_0_delay_6;
      dotCtrl_mulResCntOvf_0_delay_8 <= dotCtrl_mulResCntOvf_0_delay_7;
      dotCtrl_mulResCntOvf_0_delay_9 <= dotCtrl_mulResCntOvf_0_delay_8;
      dotCtrl_mulResCntOvf_0_delay_10 <= dotCtrl_mulResCntOvf_0_delay_9;
      dotCtrl_mulResCntOvf_0_delay_11 <= dotCtrl_mulResCntOvf_0_delay_10;
      dotCtrl_mulResCntOvf_0_delay_12 <= dotCtrl_mulResCntOvf_0_delay_11;
      dotCtrl_mulResCntOvf_0_delay_13 <= dotCtrl_mulResCntOvf_0_delay_12;
      dotCtrl_mulResCntOvf_0_delay_14 <= dotCtrl_mulResCntOvf_0_delay_13;
      dotCtrl_mulResCntOvf_0_delay_15 <= dotCtrl_mulResCntOvf_0_delay_14;
      dotCtrl_mulResCntOvf_0_delay_16 <= dotCtrl_mulResCntOvf_0_delay_15;
      dotCtrl_mulResCntOvf_0_delay_17 <= dotCtrl_mulResCntOvf_0_delay_16;
      dotCtrl_mulResCntOvf_0_delay_18 <= dotCtrl_mulResCntOvf_0_delay_17;
      dotCtrl_mulResCntOvf_0_delay_19 <= dotCtrl_mulResCntOvf_0_delay_18;
      dotCtrl_mulResCntOvf_0_delay_20 <= dotCtrl_mulResCntOvf_0_delay_19;
      dotCtrl_mulResCntOvf_0_delay_21 <= dotCtrl_mulResCntOvf_0_delay_20;
      dotCtrl_mulResCntOvf_0_delay_22 <= dotCtrl_mulResCntOvf_0_delay_21;
      dotCtrl_mulResCntOvf_0_delay_23 <= dotCtrl_mulResCntOvf_0_delay_22;
      dotCtrl_mulResCntOvf_0_delay_24 <= dotCtrl_mulResCntOvf_0_delay_23;
      dotCtrl_mulResCntOvf_0_delay_25 <= dotCtrl_mulResCntOvf_0_delay_24;
      dotCtrl_mulResCntOvf_0_delay_26 <= dotCtrl_mulResCntOvf_0_delay_25;
      dotCtrl_mulResCntOvf_0_delay_27 <= dotCtrl_mulResCntOvf_0_delay_26;
      dotCtrl_mulResCntOvf_0_delay_28 <= dotCtrl_mulResCntOvf_0_delay_27;
      dotCtrl_mulResCntOvf_0_delay_29 <= dotCtrl_mulResCntOvf_0_delay_28;
      dotCtrl_addOutCntOvf_0 <= dotCtrl_mulResCntOvf_0_delay_29;
      dotCtrl_mulResCntOvf_1_delay_1 <= dotCtrl_mulResCntOvf_1;
      dotCtrl_mulResCntOvf_1_delay_2 <= dotCtrl_mulResCntOvf_1_delay_1;
      dotCtrl_mulResCntOvf_1_delay_3 <= dotCtrl_mulResCntOvf_1_delay_2;
      dotCtrl_mulResCntOvf_1_delay_4 <= dotCtrl_mulResCntOvf_1_delay_3;
      dotCtrl_mulResCntOvf_1_delay_5 <= dotCtrl_mulResCntOvf_1_delay_4;
      dotCtrl_mulResCntOvf_1_delay_6 <= dotCtrl_mulResCntOvf_1_delay_5;
      dotCtrl_mulResCntOvf_1_delay_7 <= dotCtrl_mulResCntOvf_1_delay_6;
      dotCtrl_mulResCntOvf_1_delay_8 <= dotCtrl_mulResCntOvf_1_delay_7;
      dotCtrl_mulResCntOvf_1_delay_9 <= dotCtrl_mulResCntOvf_1_delay_8;
      dotCtrl_mulResCntOvf_1_delay_10 <= dotCtrl_mulResCntOvf_1_delay_9;
      dotCtrl_mulResCntOvf_1_delay_11 <= dotCtrl_mulResCntOvf_1_delay_10;
      dotCtrl_mulResCntOvf_1_delay_12 <= dotCtrl_mulResCntOvf_1_delay_11;
      dotCtrl_mulResCntOvf_1_delay_13 <= dotCtrl_mulResCntOvf_1_delay_12;
      dotCtrl_mulResCntOvf_1_delay_14 <= dotCtrl_mulResCntOvf_1_delay_13;
      dotCtrl_mulResCntOvf_1_delay_15 <= dotCtrl_mulResCntOvf_1_delay_14;
      dotCtrl_mulResCntOvf_1_delay_16 <= dotCtrl_mulResCntOvf_1_delay_15;
      dotCtrl_mulResCntOvf_1_delay_17 <= dotCtrl_mulResCntOvf_1_delay_16;
      dotCtrl_mulResCntOvf_1_delay_18 <= dotCtrl_mulResCntOvf_1_delay_17;
      dotCtrl_mulResCntOvf_1_delay_19 <= dotCtrl_mulResCntOvf_1_delay_18;
      dotCtrl_mulResCntOvf_1_delay_20 <= dotCtrl_mulResCntOvf_1_delay_19;
      dotCtrl_mulResCntOvf_1_delay_21 <= dotCtrl_mulResCntOvf_1_delay_20;
      dotCtrl_mulResCntOvf_1_delay_22 <= dotCtrl_mulResCntOvf_1_delay_21;
      dotCtrl_mulResCntOvf_1_delay_23 <= dotCtrl_mulResCntOvf_1_delay_22;
      dotCtrl_mulResCntOvf_1_delay_24 <= dotCtrl_mulResCntOvf_1_delay_23;
      dotCtrl_mulResCntOvf_1_delay_25 <= dotCtrl_mulResCntOvf_1_delay_24;
      dotCtrl_mulResCntOvf_1_delay_26 <= dotCtrl_mulResCntOvf_1_delay_25;
      dotCtrl_mulResCntOvf_1_delay_27 <= dotCtrl_mulResCntOvf_1_delay_26;
      dotCtrl_mulResCntOvf_1_delay_28 <= dotCtrl_mulResCntOvf_1_delay_27;
      dotCtrl_mulResCntOvf_1_delay_29 <= dotCtrl_mulResCntOvf_1_delay_28;
      dotCtrl_addOutCntOvf_1 <= dotCtrl_mulResCntOvf_1_delay_29;
      dotCtrl_flagSetCond <= (dotCtrl_enAddOutCnt && (dotCtrl_addOutCntOvf_0 && dotCtrl_addOutCntOvf_1));
      dotCtrl_flagInv <= dotCtrl_flagInvNext;
      dotCtrl_accCntOvf_delay_1 <= dotCtrl_accCntOvf;
      dotCtrl_accCntOvf_delay_2 <= dotCtrl_accCntOvf_delay_1;
      dotCtrl_accCntOvf_delay_3 <= dotCtrl_accCntOvf_delay_2;
      dotCtrl_accCntOvf_delay_4 <= dotCtrl_accCntOvf_delay_3;
      dotCtrl_accCntOvf_delay_5 <= dotCtrl_accCntOvf_delay_4;
      dotCtrl_accCntOvf_delay_6 <= dotCtrl_accCntOvf_delay_5;
      dotCtrl_accCntOvf_delay_7 <= dotCtrl_accCntOvf_delay_6;
      dotCtrl_accCntOvf_delay_8 <= dotCtrl_accCntOvf_delay_7;
      dotCtrl_accCntOvf_delay_9 <= dotCtrl_accCntOvf_delay_8;
      dotCtrl_accCntOvf_delay_10 <= dotCtrl_accCntOvf_delay_9;
      dotCtrl_accCntOvf_delay_11 <= dotCtrl_accCntOvf_delay_10;
      dotCtrl_accCntOvf_delay_12 <= dotCtrl_accCntOvf_delay_11;
      dotCtrl_accCntOvf_delay_13 <= dotCtrl_accCntOvf_delay_12;
      dotCtrl_accCntOvf_delay_14 <= dotCtrl_accCntOvf_delay_13;
      dotCtrl_accCntOvf_delay_15 <= dotCtrl_accCntOvf_delay_14;
      dotCtrl_accCntOvf_delay_16 <= dotCtrl_accCntOvf_delay_15;
      dotCtrl_accCntOvf_delay_17 <= dotCtrl_accCntOvf_delay_16;
      dotCtrl_accCntOvf_delay_18 <= dotCtrl_accCntOvf_delay_17;
      dotCtrl_accCntOvf_delay_19 <= dotCtrl_accCntOvf_delay_18;
      dotCtrl_accCntOvf_delay_20 <= dotCtrl_accCntOvf_delay_19;
      dotCtrl_accCntOvf_delay_21 <= dotCtrl_accCntOvf_delay_20;
      dotCtrl_accCntOvf_delay_22 <= dotCtrl_accCntOvf_delay_21;
      dotCtrl_accCntOvf_delay_23 <= dotCtrl_accCntOvf_delay_22;
      dotCtrl_accCntOvf_delay_24 <= dotCtrl_accCntOvf_delay_23;
      dotCtrl_accCntOvf_delay_25 <= dotCtrl_accCntOvf_delay_24;
      dotCtrl_accCntOvf_delay_26 <= dotCtrl_accCntOvf_delay_25;
      dotCtrl_accCntOvf_delay_27 <= dotCtrl_accCntOvf_delay_26;
      dotCtrl_accCntOvf_delay_28 <= dotCtrl_accCntOvf_delay_27;
      dotCtrl_accCntOvf_delay_29 <= dotCtrl_accCntOvf_delay_28;
      dotCtrl_accCntOvf_delay_30 <= dotCtrl_accCntOvf_delay_29;
      dotCtrl_accCntOvf_delay_31 <= dotCtrl_accCntOvf_delay_30;
      dotCtrl_accCntOvf_delay_32 <= dotCtrl_accCntOvf_delay_31;
      dotCtrl_accCntOvf_delay_33 <= dotCtrl_accCntOvf_delay_32;
      dotCtrl_accCntOvf_delay_34 <= dotCtrl_accCntOvf_delay_33;
      dotCtrl_accCntOvf_delay_35 <= dotCtrl_accCntOvf_delay_34;
      dotCtrl_accCntOvfDly <= dotCtrl_accCntOvf_delay_35;
      if(dotCtrl_enMulResCnt) begin
        dotCtrl_accCnt <= (dotCtrl_accCnt + 5'h01);
        if(dotCtrl_accCntOvf) begin
          dotCtrl_accCnt <= 5'h0;
        end
      end
      dotCtrl_accCntOvf_delay_1_1 <= dotCtrl_accCntOvf;
      dotCtrl_accCntOvf_delay_2_1 <= dotCtrl_accCntOvf_delay_1_1;
      dotCtrl_accCntOvf_delay_3_1 <= dotCtrl_accCntOvf_delay_2_1;
      dotCtrl_accCntOvf_delay_4_1 <= dotCtrl_accCntOvf_delay_3_1;
      dotCtrl_accCntOvf_delay_5_1 <= dotCtrl_accCntOvf_delay_4_1;
      dotCtrl_accCntOvf_delay_6_1 <= dotCtrl_accCntOvf_delay_5_1;
      dotCtrl_accCntOvf_delay_7_1 <= dotCtrl_accCntOvf_delay_6_1;
      dotCtrl_accCntOvf_delay_8_1 <= dotCtrl_accCntOvf_delay_7_1;
      dotCtrl_accCntOvf_delay_9_1 <= dotCtrl_accCntOvf_delay_8_1;
      dotCtrl_accCntOvf_delay_10_1 <= dotCtrl_accCntOvf_delay_9_1;
      dotCtrl_accCntOvf_delay_11_1 <= dotCtrl_accCntOvf_delay_10_1;
      dotCtrl_accCntOvf_delay_12_1 <= dotCtrl_accCntOvf_delay_11_1;
      dotCtrl_accCntOvf_delay_13_1 <= dotCtrl_accCntOvf_delay_12_1;
      dotCtrl_accCntOvf_delay_14_1 <= dotCtrl_accCntOvf_delay_13_1;
      dotCtrl_accCntOvf_delay_15_1 <= dotCtrl_accCntOvf_delay_14_1;
      dotCtrl_accCntOvf_delay_16_1 <= dotCtrl_accCntOvf_delay_15_1;
      dotCtrl_accCntOvf_delay_17_1 <= dotCtrl_accCntOvf_delay_16_1;
      dotCtrl_accCntOvf_delay_18_1 <= dotCtrl_accCntOvf_delay_17_1;
      dotCtrl_accCntOvf_delay_19_1 <= dotCtrl_accCntOvf_delay_18_1;
      dotCtrl_accCntOvf_delay_20_1 <= dotCtrl_accCntOvf_delay_19_1;
      dotCtrl_accCntOvf_delay_21_1 <= dotCtrl_accCntOvf_delay_20_1;
      dotCtrl_accCntOvf_delay_22_1 <= dotCtrl_accCntOvf_delay_21_1;
      dotCtrl_accCntOvf_delay_23_1 <= dotCtrl_accCntOvf_delay_22_1;
      dotCtrl_accCntOvf_delay_24_1 <= dotCtrl_accCntOvf_delay_23_1;
      dotCtrl_accCntOvf_delay_25_1 <= dotCtrl_accCntOvf_delay_24_1;
      dotCtrl_accCntOvf_delay_26_1 <= dotCtrl_accCntOvf_delay_25_1;
      dotCtrl_accCntOvf_delay_27_1 <= dotCtrl_accCntOvf_delay_26_1;
      dotCtrl_accCntOvf_delay_28_1 <= dotCtrl_accCntOvf_delay_27_1;
      dotCtrl_accCntOvf_delay_29_1 <= dotCtrl_accCntOvf_delay_28_1;
      dotCtrl_accCntOvf_delay_30_1 <= dotCtrl_accCntOvf_delay_29_1;
      fAxpyCtrl_cfgVld <= ret_1_valid;
      fAxpyCtrl_enMulResCnt <= fAxpyCtrl_enMulResCntNext;
      fAxpyCtrl_muResCnt_0 <= t_fAxpyCtrl_muResCnt_0;
      fAxpyCtrl_muResCnt_1 <= t_fAxpyCtrl_muResCnt_1;
      fAxpyCtrl_mulResCntOvf_0 <= t_fAxpyCtrl_mulResCntOvf_0;
      fAxpyCtrl_mulResCntOvf_1 <= t_fAxpyCtrl_mulResCntOvf_1;
      fAxpyCtrl_mulResCntOvfReduce <= (t_fAxpyCtrl_mulResCntOvf_0 && t_fAxpyCtrl_mulResCntOvf_1);
      fAxpyCtrl_mulResCntLastZero <= fAxpyCtrl_mulResCntLastZeroNext;
      fAxpyCtrl_mulResCntLastNotZero <= fAxpyCtrl_mulResCntLastNotZeroNext;
      fAxpyCtrl_enMulResCnt_delay_1 <= fAxpyCtrl_enMulResCnt;
      fAxpyCtrl_enMulResCnt_delay_2 <= fAxpyCtrl_enMulResCnt_delay_1;
      fAxpyCtrl_enMulResCnt_delay_3 <= fAxpyCtrl_enMulResCnt_delay_2;
      fAxpyCtrl_enMulResCnt_delay_4 <= fAxpyCtrl_enMulResCnt_delay_3;
      fAxpyCtrl_enMulResCnt_delay_5 <= fAxpyCtrl_enMulResCnt_delay_4;
      fAxpyCtrl_enAddOutCnt <= fAxpyCtrl_enMulResCnt_delay_5;
      fAxpyCtrl_mulResCntOvf_0_delay_1 <= fAxpyCtrl_mulResCntOvf_0;
      fAxpyCtrl_mulResCntOvf_0_delay_2 <= fAxpyCtrl_mulResCntOvf_0_delay_1;
      fAxpyCtrl_mulResCntOvf_0_delay_3 <= fAxpyCtrl_mulResCntOvf_0_delay_2;
      fAxpyCtrl_mulResCntOvf_0_delay_4 <= fAxpyCtrl_mulResCntOvf_0_delay_3;
      fAxpyCtrl_mulResCntOvf_0_delay_5 <= fAxpyCtrl_mulResCntOvf_0_delay_4;
      fAxpyCtrl_addOutCntOvf_0 <= fAxpyCtrl_mulResCntOvf_0_delay_5;
      fAxpyCtrl_mulResCntOvf_1_delay_1 <= fAxpyCtrl_mulResCntOvf_1;
      fAxpyCtrl_mulResCntOvf_1_delay_2 <= fAxpyCtrl_mulResCntOvf_1_delay_1;
      fAxpyCtrl_mulResCntOvf_1_delay_3 <= fAxpyCtrl_mulResCntOvf_1_delay_2;
      fAxpyCtrl_mulResCntOvf_1_delay_4 <= fAxpyCtrl_mulResCntOvf_1_delay_3;
      fAxpyCtrl_mulResCntOvf_1_delay_5 <= fAxpyCtrl_mulResCntOvf_1_delay_4;
      fAxpyCtrl_addOutCntOvf_1 <= fAxpyCtrl_mulResCntOvf_1_delay_5;
      t_fAxpyCtrl_psumPushEnReg <= (fAxpyCtrl_enMulResCnt && (! fAxpyCtrl_mulResCntOvf_1));
      t_fAxpyCtrl_psumPushEnReg_1 <= t_fAxpyCtrl_psumPushEnReg;
      t_fAxpyCtrl_psumPushEnReg_2 <= t_fAxpyCtrl_psumPushEnReg_1;
      t_fAxpyCtrl_psumPushEnReg_3 <= t_fAxpyCtrl_psumPushEnReg_2;
      t_fAxpyCtrl_psumPushEnReg_4 <= t_fAxpyCtrl_psumPushEnReg_3;
      fAxpyCtrl_psumPushEnReg <= t_fAxpyCtrl_psumPushEnReg_4;
      fAxpyCtrl_resAddReady <= fAxpyCtrl_resAddReadyNext;
      fAxpyCtrl_psumPopEnReg <= fAxpyCtrl_psumPopEnRegNext;
      pAxpyCtrl_cfgVld <= ret_2_valid;
      pAxpyCtrl_cycleReduce <= pAxpyCtrl_cycleReduceNext;
      pAxpyCtrl_enMulResCnt <= pAxpyCtrl_enMulResCntNext;
      pAxpyCtrl_mulResCntOvf <= pAxpyCtrl_mulResCntOvfNext;
      pAxpyCtrl_mulResCntHighZero <= pAxpyCtrl_mulResCntHighZeroNext;
      pAxpyCtrl_mulResCntHighNotZero <= pAxpyCtrl_mulResCntHighNotZeroNext;
      pAxpyCtrl_mulResCnt <= pAxpyCtrl_mulResCntNext;
      pAxpyCtrl_enMulResCnt_delay_1 <= pAxpyCtrl_enMulResCnt;
      pAxpyCtrl_enMulResCnt_delay_2 <= pAxpyCtrl_enMulResCnt_delay_1;
      pAxpyCtrl_enMulResCnt_delay_3 <= pAxpyCtrl_enMulResCnt_delay_2;
      pAxpyCtrl_enMulResCnt_delay_4 <= pAxpyCtrl_enMulResCnt_delay_3;
      pAxpyCtrl_enMulResCnt_delay_5 <= pAxpyCtrl_enMulResCnt_delay_4;
      pAxpyCtrl_enMulResCntDly <= pAxpyCtrl_enMulResCnt_delay_5;
      pAxpyCtrl_mulResCntOvf_delay_1 <= pAxpyCtrl_mulResCntOvf;
      pAxpyCtrl_mulResCntOvf_delay_2 <= pAxpyCtrl_mulResCntOvf_delay_1;
      pAxpyCtrl_mulResCntOvf_delay_3 <= pAxpyCtrl_mulResCntOvf_delay_2;
      pAxpyCtrl_mulResCntOvf_delay_4 <= pAxpyCtrl_mulResCntOvf_delay_3;
      pAxpyCtrl_mulResCntOvf_delay_5 <= pAxpyCtrl_mulResCntOvf_delay_4;
      pAxpyCtrl_addOutCntOvf <= pAxpyCtrl_mulResCntOvf_delay_5;
      if((pAxpyCtrl_enAddOutCnt && pAxpyCtrl_addOutCntOvf)) begin
        pAxpyCtrl_cycleReduceDly <= 1'b1;
      end
      pAxpyCtrl_lastElem <= pAxpyCtrl_lastElemNext;
      pAxpyCtrl_cycleCnt <= pAxpyCtrl_cycleCntNext;
      if(pAxpyCtrl_enCycleCnt) begin
        if(pAxpyCtrl_lastElem) begin
          pAxpyCtrl_cycleReduceDly <= 1'b0;
        end
      end
      pAxpyCtrl_psumPopEn <= pAxpyCtrl_psumPopEnNext;
      pAxpyCtrl_bSelBit <= pAxpyCtrl_bSelBitNext;
      pAxpyCtrl_flagSetCond <= (pAxpyCtrl_enCycleCnt && pAxpyCtrl_lastElem);
      pAxpyCtrl_flagInv <= pAxpyCtrl_flagInvNext;
      if((pAxpyCtrl_cycleReduce && add_fifoCtrl_io_pop_fire)) begin
        pAxpyCtrl_vldToggle <= (! pAxpyCtrl_vldToggle);
      end
      t_pAxpyCtrl_reduceVldDly <= (pAxpyCtrl_psumVld && pAxpyCtrl_reduceVld);
      t_pAxpyCtrl_reduceVldDly_1 <= t_pAxpyCtrl_reduceVldDly;
      t_pAxpyCtrl_reduceVldDly_2 <= t_pAxpyCtrl_reduceVldDly_1;
      t_pAxpyCtrl_reduceVldDly_3 <= t_pAxpyCtrl_reduceVldDly_2;
      t_pAxpyCtrl_reduceVldDly_4 <= t_pAxpyCtrl_reduceVldDly_3;
      t_pAxpyCtrl_reduceVldDly_5 <= t_pAxpyCtrl_reduceVldDly_4;
      selVldUIntReg <= selVldNextUInt;
      selFifoPopUInt <= selVldNextUInt;
      selFifoPushUInt <= selVldNextUInt;
      aSel <= aSelNext;
      bSel <= bSelNext;
      ready <= readyNext;
      mulResFire <= mulResFireNext;
    end
  end

  always @(posedge clk_1_clk) begin
    if(fifoCtrl_io_pop_valid) begin
      addLogic_popDly <= fifoCtrl_io_pop_payload;
    end
    dotCtrl_cfgPayload <= ret_0_payload;
    fAxpyCtrl_cfgPayload <= ret_1_payload;
    pAxpyCtrl_cfgPayload <= ret_2_payload;
  end


endmodule

