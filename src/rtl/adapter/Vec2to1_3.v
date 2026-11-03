// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module Vec2to1_3 (
  input  wire          io_in0_valid,
  input  wire [15:0]   io_in0_payload_0,
  input  wire [15:0]   io_in0_payload_1,
  input  wire [15:0]   io_in0_payload_2,
  input  wire [15:0]   io_in0_payload_3,
  input  wire [15:0]   io_in0_payload_4,
  input  wire [15:0]   io_in0_payload_5,
  input  wire [15:0]   io_in0_payload_6,
  input  wire [15:0]   io_in0_payload_7,
  input  wire [15:0]   io_in0_payload_8,
  input  wire [15:0]   io_in0_payload_9,
  input  wire [15:0]   io_in0_payload_10,
  input  wire [15:0]   io_in0_payload_11,
  input  wire [15:0]   io_in0_payload_12,
  input  wire [15:0]   io_in0_payload_13,
  input  wire [15:0]   io_in0_payload_14,
  input  wire [15:0]   io_in0_payload_15,
  input  wire [15:0]   io_in0_payload_16,
  input  wire [15:0]   io_in0_payload_17,
  input  wire [15:0]   io_in0_payload_18,
  input  wire [15:0]   io_in0_payload_19,
  input  wire [15:0]   io_in0_payload_20,
  input  wire [15:0]   io_in0_payload_21,
  input  wire [15:0]   io_in0_payload_22,
  input  wire [15:0]   io_in0_payload_23,
  input  wire [15:0]   io_in0_payload_24,
  input  wire [15:0]   io_in0_payload_25,
  input  wire [15:0]   io_in0_payload_26,
  input  wire [15:0]   io_in0_payload_27,
  input  wire [15:0]   io_in0_payload_28,
  input  wire [15:0]   io_in0_payload_29,
  input  wire [15:0]   io_in0_payload_30,
  input  wire [15:0]   io_in0_payload_31,
  input  wire          io_in1_valid,
  input  wire [15:0]   io_in1_payload_0,
  input  wire [15:0]   io_in1_payload_1,
  input  wire [15:0]   io_in1_payload_2,
  input  wire [15:0]   io_in1_payload_3,
  input  wire [15:0]   io_in1_payload_4,
  input  wire [15:0]   io_in1_payload_5,
  input  wire [15:0]   io_in1_payload_6,
  input  wire [15:0]   io_in1_payload_7,
  input  wire [15:0]   io_in1_payload_8,
  input  wire [15:0]   io_in1_payload_9,
  input  wire [15:0]   io_in1_payload_10,
  input  wire [15:0]   io_in1_payload_11,
  input  wire [15:0]   io_in1_payload_12,
  input  wire [15:0]   io_in1_payload_13,
  input  wire [15:0]   io_in1_payload_14,
  input  wire [15:0]   io_in1_payload_15,
  input  wire [15:0]   io_in1_payload_16,
  input  wire [15:0]   io_in1_payload_17,
  input  wire [15:0]   io_in1_payload_18,
  input  wire [15:0]   io_in1_payload_19,
  input  wire [15:0]   io_in1_payload_20,
  input  wire [15:0]   io_in1_payload_21,
  input  wire [15:0]   io_in1_payload_22,
  input  wire [15:0]   io_in1_payload_23,
  input  wire [15:0]   io_in1_payload_24,
  input  wire [15:0]   io_in1_payload_25,
  input  wire [15:0]   io_in1_payload_26,
  input  wire [15:0]   io_in1_payload_27,
  input  wire [15:0]   io_in1_payload_28,
  input  wire [15:0]   io_in1_payload_29,
  input  wire [15:0]   io_in1_payload_30,
  input  wire [15:0]   io_in1_payload_31,
  output wire          io_res_valid,
  output wire [15:0]   io_res_payload_0,
  output wire [15:0]   io_res_payload_1,
  output wire [15:0]   io_res_payload_2,
  output wire [15:0]   io_res_payload_3,
  output wire [15:0]   io_res_payload_4,
  output wire [15:0]   io_res_payload_5,
  output wire [15:0]   io_res_payload_6,
  output wire [15:0]   io_res_payload_7,
  output wire [15:0]   io_res_payload_8,
  output wire [15:0]   io_res_payload_9,
  output wire [15:0]   io_res_payload_10,
  output wire [15:0]   io_res_payload_11,
  output wire [15:0]   io_res_payload_12,
  output wire [15:0]   io_res_payload_13,
  output wire [15:0]   io_res_payload_14,
  output wire [15:0]   io_res_payload_15,
  output wire [15:0]   io_res_payload_16,
  output wire [15:0]   io_res_payload_17,
  output wire [15:0]   io_res_payload_18,
  output wire [15:0]   io_res_payload_19,
  output wire [15:0]   io_res_payload_20,
  output wire [15:0]   io_res_payload_21,
  output wire [15:0]   io_res_payload_22,
  output wire [15:0]   io_res_payload_23,
  output wire [15:0]   io_res_payload_24,
  output wire [15:0]   io_res_payload_25,
  output wire [15:0]   io_res_payload_26,
  output wire [15:0]   io_res_payload_27,
  output wire [15:0]   io_res_payload_28,
  output wire [15:0]   io_res_payload_29,
  output wire [15:0]   io_res_payload_30,
  output wire [15:0]   io_res_payload_31,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                flowVec0_0_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_0_mul_ip_m_axis_result_tdata;
  wire                flowVec0_1_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_1_mul_ip_m_axis_result_tdata;
  wire                flowVec0_2_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_2_mul_ip_m_axis_result_tdata;
  wire                flowVec0_3_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_3_mul_ip_m_axis_result_tdata;
  wire                flowVec0_4_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_4_mul_ip_m_axis_result_tdata;
  wire                flowVec0_5_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_5_mul_ip_m_axis_result_tdata;
  wire                flowVec0_6_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_6_mul_ip_m_axis_result_tdata;
  wire                flowVec0_7_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_7_mul_ip_m_axis_result_tdata;
  wire                flowVec0_8_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_8_mul_ip_m_axis_result_tdata;
  wire                flowVec0_9_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_9_mul_ip_m_axis_result_tdata;
  wire                flowVec0_10_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_10_mul_ip_m_axis_result_tdata;
  wire                flowVec0_11_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_11_mul_ip_m_axis_result_tdata;
  wire                flowVec0_12_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_12_mul_ip_m_axis_result_tdata;
  wire                flowVec0_13_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_13_mul_ip_m_axis_result_tdata;
  wire                flowVec0_14_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_14_mul_ip_m_axis_result_tdata;
  wire                flowVec0_15_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_15_mul_ip_m_axis_result_tdata;
  wire                flowVec0_16_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_16_mul_ip_m_axis_result_tdata;
  wire                flowVec0_17_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_17_mul_ip_m_axis_result_tdata;
  wire                flowVec0_18_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_18_mul_ip_m_axis_result_tdata;
  wire                flowVec0_19_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_19_mul_ip_m_axis_result_tdata;
  wire                flowVec0_20_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_20_mul_ip_m_axis_result_tdata;
  wire                flowVec0_21_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_21_mul_ip_m_axis_result_tdata;
  wire                flowVec0_22_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_22_mul_ip_m_axis_result_tdata;
  wire                flowVec0_23_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_23_mul_ip_m_axis_result_tdata;
  wire                flowVec0_24_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_24_mul_ip_m_axis_result_tdata;
  wire                flowVec0_25_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_25_mul_ip_m_axis_result_tdata;
  wire                flowVec0_26_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_26_mul_ip_m_axis_result_tdata;
  wire                flowVec0_27_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_27_mul_ip_m_axis_result_tdata;
  wire                flowVec0_28_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_28_mul_ip_m_axis_result_tdata;
  wire                flowVec0_29_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_29_mul_ip_m_axis_result_tdata;
  wire                flowVec0_30_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_30_mul_ip_m_axis_result_tdata;
  wire                flowVec0_31_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   flowVec0_31_mul_ip_m_axis_result_tdata;
  wire                flowVec0_0_valid;
  wire       [15:0]   flowVec0_0_payload;
  wire                flowVec0_1_valid;
  wire       [15:0]   flowVec0_1_payload;
  wire                flowVec0_2_valid;
  wire       [15:0]   flowVec0_2_payload;
  wire                flowVec0_3_valid;
  wire       [15:0]   flowVec0_3_payload;
  wire                flowVec0_4_valid;
  wire       [15:0]   flowVec0_4_payload;
  wire                flowVec0_5_valid;
  wire       [15:0]   flowVec0_5_payload;
  wire                flowVec0_6_valid;
  wire       [15:0]   flowVec0_6_payload;
  wire                flowVec0_7_valid;
  wire       [15:0]   flowVec0_7_payload;
  wire                flowVec0_8_valid;
  wire       [15:0]   flowVec0_8_payload;
  wire                flowVec0_9_valid;
  wire       [15:0]   flowVec0_9_payload;
  wire                flowVec0_10_valid;
  wire       [15:0]   flowVec0_10_payload;
  wire                flowVec0_11_valid;
  wire       [15:0]   flowVec0_11_payload;
  wire                flowVec0_12_valid;
  wire       [15:0]   flowVec0_12_payload;
  wire                flowVec0_13_valid;
  wire       [15:0]   flowVec0_13_payload;
  wire                flowVec0_14_valid;
  wire       [15:0]   flowVec0_14_payload;
  wire                flowVec0_15_valid;
  wire       [15:0]   flowVec0_15_payload;
  wire                flowVec0_16_valid;
  wire       [15:0]   flowVec0_16_payload;
  wire                flowVec0_17_valid;
  wire       [15:0]   flowVec0_17_payload;
  wire                flowVec0_18_valid;
  wire       [15:0]   flowVec0_18_payload;
  wire                flowVec0_19_valid;
  wire       [15:0]   flowVec0_19_payload;
  wire                flowVec0_20_valid;
  wire       [15:0]   flowVec0_20_payload;
  wire                flowVec0_21_valid;
  wire       [15:0]   flowVec0_21_payload;
  wire                flowVec0_22_valid;
  wire       [15:0]   flowVec0_22_payload;
  wire                flowVec0_23_valid;
  wire       [15:0]   flowVec0_23_payload;
  wire                flowVec0_24_valid;
  wire       [15:0]   flowVec0_24_payload;
  wire                flowVec0_25_valid;
  wire       [15:0]   flowVec0_25_payload;
  wire                flowVec0_26_valid;
  wire       [15:0]   flowVec0_26_payload;
  wire                flowVec0_27_valid;
  wire       [15:0]   flowVec0_27_payload;
  wire                flowVec0_28_valid;
  wire       [15:0]   flowVec0_28_payload;
  wire                flowVec0_29_valid;
  wire       [15:0]   flowVec0_29_payload;
  wire                flowVec0_30_valid;
  wire       [15:0]   flowVec0_30_payload;
  wire                flowVec0_31_valid;
  wire       [15:0]   flowVec0_31_payload;
  wire                flowVec1_0_valid;
  wire       [15:0]   flowVec1_0_payload;
  wire                flowVec1_1_valid;
  wire       [15:0]   flowVec1_1_payload;
  wire                flowVec1_2_valid;
  wire       [15:0]   flowVec1_2_payload;
  wire                flowVec1_3_valid;
  wire       [15:0]   flowVec1_3_payload;
  wire                flowVec1_4_valid;
  wire       [15:0]   flowVec1_4_payload;
  wire                flowVec1_5_valid;
  wire       [15:0]   flowVec1_5_payload;
  wire                flowVec1_6_valid;
  wire       [15:0]   flowVec1_6_payload;
  wire                flowVec1_7_valid;
  wire       [15:0]   flowVec1_7_payload;
  wire                flowVec1_8_valid;
  wire       [15:0]   flowVec1_8_payload;
  wire                flowVec1_9_valid;
  wire       [15:0]   flowVec1_9_payload;
  wire                flowVec1_10_valid;
  wire       [15:0]   flowVec1_10_payload;
  wire                flowVec1_11_valid;
  wire       [15:0]   flowVec1_11_payload;
  wire                flowVec1_12_valid;
  wire       [15:0]   flowVec1_12_payload;
  wire                flowVec1_13_valid;
  wire       [15:0]   flowVec1_13_payload;
  wire                flowVec1_14_valid;
  wire       [15:0]   flowVec1_14_payload;
  wire                flowVec1_15_valid;
  wire       [15:0]   flowVec1_15_payload;
  wire                flowVec1_16_valid;
  wire       [15:0]   flowVec1_16_payload;
  wire                flowVec1_17_valid;
  wire       [15:0]   flowVec1_17_payload;
  wire                flowVec1_18_valid;
  wire       [15:0]   flowVec1_18_payload;
  wire                flowVec1_19_valid;
  wire       [15:0]   flowVec1_19_payload;
  wire                flowVec1_20_valid;
  wire       [15:0]   flowVec1_20_payload;
  wire                flowVec1_21_valid;
  wire       [15:0]   flowVec1_21_payload;
  wire                flowVec1_22_valid;
  wire       [15:0]   flowVec1_22_payload;
  wire                flowVec1_23_valid;
  wire       [15:0]   flowVec1_23_payload;
  wire                flowVec1_24_valid;
  wire       [15:0]   flowVec1_24_payload;
  wire                flowVec1_25_valid;
  wire       [15:0]   flowVec1_25_payload;
  wire                flowVec1_26_valid;
  wire       [15:0]   flowVec1_26_payload;
  wire                flowVec1_27_valid;
  wire       [15:0]   flowVec1_27_payload;
  wire                flowVec1_28_valid;
  wire       [15:0]   flowVec1_28_payload;
  wire                flowVec1_29_valid;
  wire       [15:0]   flowVec1_29_payload;
  wire                flowVec1_30_valid;
  wire       [15:0]   flowVec1_30_payload;
  wire                flowVec1_31_valid;
  wire       [15:0]   flowVec1_31_payload;
  reg                 t_io_res_valid;
  reg                 t_io_res_valid_1;
  reg                 t_io_res_valid_2;
  reg                 t_io_res_valid_3;
  reg                 t_io_res_valid_4;
  reg                 t_io_res_valid_5;

  fp16mul6 flowVec0_0_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_0_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_0_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_0_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_0_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_0_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_0_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_1_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_1_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_1_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_1_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_1_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_1_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_1_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_2_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_2_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_2_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_2_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_2_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_2_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_2_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_3_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_3_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_3_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_3_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_3_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_3_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_3_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_4_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_4_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_4_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_4_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_4_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_4_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_4_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_5_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_5_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_5_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_5_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_5_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_5_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_5_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_6_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_6_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_6_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_6_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_6_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_6_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_6_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_7_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_7_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_7_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_7_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_7_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_7_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_7_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_8_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_8_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_8_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_8_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_8_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_8_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_8_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_9_mul_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (flowVec0_9_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_9_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_9_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_9_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_9_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_9_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_10_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_10_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_10_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_10_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_10_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_10_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_10_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_11_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_11_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_11_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_11_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_11_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_11_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_11_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_12_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_12_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_12_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_12_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_12_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_12_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_12_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_13_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_13_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_13_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_13_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_13_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_13_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_13_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_14_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_14_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_14_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_14_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_14_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_14_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_14_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_15_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_15_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_15_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_15_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_15_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_15_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_15_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_16_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_16_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_16_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_16_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_16_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_16_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_16_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_17_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_17_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_17_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_17_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_17_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_17_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_17_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_18_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_18_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_18_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_18_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_18_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_18_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_18_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_19_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_19_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_19_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_19_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_19_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_19_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_19_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_20_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_20_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_20_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_20_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_20_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_20_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_20_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_21_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_21_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_21_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_21_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_21_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_21_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_21_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_22_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_22_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_22_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_22_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_22_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_22_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_22_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_23_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_23_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_23_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_23_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_23_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_23_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_23_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_24_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_24_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_24_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_24_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_24_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_24_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_24_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_25_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_25_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_25_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_25_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_25_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_25_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_25_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_26_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_26_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_26_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_26_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_26_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_26_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_26_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_27_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_27_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_27_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_27_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_27_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_27_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_27_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_28_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_28_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_28_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_28_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_28_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_28_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_28_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_29_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_29_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_29_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_29_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_29_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_29_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_29_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_30_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_30_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_30_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_30_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_30_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_30_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_30_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 flowVec0_31_mul_ip (
    .aclk                 (clk_1_clk                                   ), //i
    .s_axis_a_tvalid      (flowVec0_31_valid                           ), //i
    .s_axis_a_tdata       (flowVec0_31_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (flowVec1_31_valid                           ), //i
    .s_axis_b_tdata       (flowVec1_31_payload[15:0]                   ), //i
    .m_axis_result_tvalid (flowVec0_31_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (flowVec0_31_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  assign flowVec0_0_valid = 1'b1;
  assign flowVec0_1_valid = 1'b1;
  assign flowVec0_2_valid = 1'b1;
  assign flowVec0_3_valid = 1'b1;
  assign flowVec0_4_valid = 1'b1;
  assign flowVec0_5_valid = 1'b1;
  assign flowVec0_6_valid = 1'b1;
  assign flowVec0_7_valid = 1'b1;
  assign flowVec0_8_valid = 1'b1;
  assign flowVec0_9_valid = 1'b1;
  assign flowVec0_10_valid = 1'b1;
  assign flowVec0_11_valid = 1'b1;
  assign flowVec0_12_valid = 1'b1;
  assign flowVec0_13_valid = 1'b1;
  assign flowVec0_14_valid = 1'b1;
  assign flowVec0_15_valid = 1'b1;
  assign flowVec0_16_valid = 1'b1;
  assign flowVec0_17_valid = 1'b1;
  assign flowVec0_18_valid = 1'b1;
  assign flowVec0_19_valid = 1'b1;
  assign flowVec0_20_valid = 1'b1;
  assign flowVec0_21_valid = 1'b1;
  assign flowVec0_22_valid = 1'b1;
  assign flowVec0_23_valid = 1'b1;
  assign flowVec0_24_valid = 1'b1;
  assign flowVec0_25_valid = 1'b1;
  assign flowVec0_26_valid = 1'b1;
  assign flowVec0_27_valid = 1'b1;
  assign flowVec0_28_valid = 1'b1;
  assign flowVec0_29_valid = 1'b1;
  assign flowVec0_30_valid = 1'b1;
  assign flowVec0_31_valid = 1'b1;
  assign flowVec0_0_payload = io_in0_payload_0;
  assign flowVec0_1_payload = io_in0_payload_1;
  assign flowVec0_2_payload = io_in0_payload_2;
  assign flowVec0_3_payload = io_in0_payload_3;
  assign flowVec0_4_payload = io_in0_payload_4;
  assign flowVec0_5_payload = io_in0_payload_5;
  assign flowVec0_6_payload = io_in0_payload_6;
  assign flowVec0_7_payload = io_in0_payload_7;
  assign flowVec0_8_payload = io_in0_payload_8;
  assign flowVec0_9_payload = io_in0_payload_9;
  assign flowVec0_10_payload = io_in0_payload_10;
  assign flowVec0_11_payload = io_in0_payload_11;
  assign flowVec0_12_payload = io_in0_payload_12;
  assign flowVec0_13_payload = io_in0_payload_13;
  assign flowVec0_14_payload = io_in0_payload_14;
  assign flowVec0_15_payload = io_in0_payload_15;
  assign flowVec0_16_payload = io_in0_payload_16;
  assign flowVec0_17_payload = io_in0_payload_17;
  assign flowVec0_18_payload = io_in0_payload_18;
  assign flowVec0_19_payload = io_in0_payload_19;
  assign flowVec0_20_payload = io_in0_payload_20;
  assign flowVec0_21_payload = io_in0_payload_21;
  assign flowVec0_22_payload = io_in0_payload_22;
  assign flowVec0_23_payload = io_in0_payload_23;
  assign flowVec0_24_payload = io_in0_payload_24;
  assign flowVec0_25_payload = io_in0_payload_25;
  assign flowVec0_26_payload = io_in0_payload_26;
  assign flowVec0_27_payload = io_in0_payload_27;
  assign flowVec0_28_payload = io_in0_payload_28;
  assign flowVec0_29_payload = io_in0_payload_29;
  assign flowVec0_30_payload = io_in0_payload_30;
  assign flowVec0_31_payload = io_in0_payload_31;
  assign flowVec1_0_valid = 1'b1;
  assign flowVec1_1_valid = 1'b1;
  assign flowVec1_2_valid = 1'b1;
  assign flowVec1_3_valid = 1'b1;
  assign flowVec1_4_valid = 1'b1;
  assign flowVec1_5_valid = 1'b1;
  assign flowVec1_6_valid = 1'b1;
  assign flowVec1_7_valid = 1'b1;
  assign flowVec1_8_valid = 1'b1;
  assign flowVec1_9_valid = 1'b1;
  assign flowVec1_10_valid = 1'b1;
  assign flowVec1_11_valid = 1'b1;
  assign flowVec1_12_valid = 1'b1;
  assign flowVec1_13_valid = 1'b1;
  assign flowVec1_14_valid = 1'b1;
  assign flowVec1_15_valid = 1'b1;
  assign flowVec1_16_valid = 1'b1;
  assign flowVec1_17_valid = 1'b1;
  assign flowVec1_18_valid = 1'b1;
  assign flowVec1_19_valid = 1'b1;
  assign flowVec1_20_valid = 1'b1;
  assign flowVec1_21_valid = 1'b1;
  assign flowVec1_22_valid = 1'b1;
  assign flowVec1_23_valid = 1'b1;
  assign flowVec1_24_valid = 1'b1;
  assign flowVec1_25_valid = 1'b1;
  assign flowVec1_26_valid = 1'b1;
  assign flowVec1_27_valid = 1'b1;
  assign flowVec1_28_valid = 1'b1;
  assign flowVec1_29_valid = 1'b1;
  assign flowVec1_30_valid = 1'b1;
  assign flowVec1_31_valid = 1'b1;
  assign flowVec1_0_payload = io_in1_payload_0;
  assign flowVec1_1_payload = io_in1_payload_1;
  assign flowVec1_2_payload = io_in1_payload_2;
  assign flowVec1_3_payload = io_in1_payload_3;
  assign flowVec1_4_payload = io_in1_payload_4;
  assign flowVec1_5_payload = io_in1_payload_5;
  assign flowVec1_6_payload = io_in1_payload_6;
  assign flowVec1_7_payload = io_in1_payload_7;
  assign flowVec1_8_payload = io_in1_payload_8;
  assign flowVec1_9_payload = io_in1_payload_9;
  assign flowVec1_10_payload = io_in1_payload_10;
  assign flowVec1_11_payload = io_in1_payload_11;
  assign flowVec1_12_payload = io_in1_payload_12;
  assign flowVec1_13_payload = io_in1_payload_13;
  assign flowVec1_14_payload = io_in1_payload_14;
  assign flowVec1_15_payload = io_in1_payload_15;
  assign flowVec1_16_payload = io_in1_payload_16;
  assign flowVec1_17_payload = io_in1_payload_17;
  assign flowVec1_18_payload = io_in1_payload_18;
  assign flowVec1_19_payload = io_in1_payload_19;
  assign flowVec1_20_payload = io_in1_payload_20;
  assign flowVec1_21_payload = io_in1_payload_21;
  assign flowVec1_22_payload = io_in1_payload_22;
  assign flowVec1_23_payload = io_in1_payload_23;
  assign flowVec1_24_payload = io_in1_payload_24;
  assign flowVec1_25_payload = io_in1_payload_25;
  assign flowVec1_26_payload = io_in1_payload_26;
  assign flowVec1_27_payload = io_in1_payload_27;
  assign flowVec1_28_payload = io_in1_payload_28;
  assign flowVec1_29_payload = io_in1_payload_29;
  assign flowVec1_30_payload = io_in1_payload_30;
  assign flowVec1_31_payload = io_in1_payload_31;
  assign io_res_payload_0 = flowVec0_0_mul_ip_m_axis_result_tdata;
  assign io_res_payload_1 = flowVec0_1_mul_ip_m_axis_result_tdata;
  assign io_res_payload_2 = flowVec0_2_mul_ip_m_axis_result_tdata;
  assign io_res_payload_3 = flowVec0_3_mul_ip_m_axis_result_tdata;
  assign io_res_payload_4 = flowVec0_4_mul_ip_m_axis_result_tdata;
  assign io_res_payload_5 = flowVec0_5_mul_ip_m_axis_result_tdata;
  assign io_res_payload_6 = flowVec0_6_mul_ip_m_axis_result_tdata;
  assign io_res_payload_7 = flowVec0_7_mul_ip_m_axis_result_tdata;
  assign io_res_payload_8 = flowVec0_8_mul_ip_m_axis_result_tdata;
  assign io_res_payload_9 = flowVec0_9_mul_ip_m_axis_result_tdata;
  assign io_res_payload_10 = flowVec0_10_mul_ip_m_axis_result_tdata;
  assign io_res_payload_11 = flowVec0_11_mul_ip_m_axis_result_tdata;
  assign io_res_payload_12 = flowVec0_12_mul_ip_m_axis_result_tdata;
  assign io_res_payload_13 = flowVec0_13_mul_ip_m_axis_result_tdata;
  assign io_res_payload_14 = flowVec0_14_mul_ip_m_axis_result_tdata;
  assign io_res_payload_15 = flowVec0_15_mul_ip_m_axis_result_tdata;
  assign io_res_payload_16 = flowVec0_16_mul_ip_m_axis_result_tdata;
  assign io_res_payload_17 = flowVec0_17_mul_ip_m_axis_result_tdata;
  assign io_res_payload_18 = flowVec0_18_mul_ip_m_axis_result_tdata;
  assign io_res_payload_19 = flowVec0_19_mul_ip_m_axis_result_tdata;
  assign io_res_payload_20 = flowVec0_20_mul_ip_m_axis_result_tdata;
  assign io_res_payload_21 = flowVec0_21_mul_ip_m_axis_result_tdata;
  assign io_res_payload_22 = flowVec0_22_mul_ip_m_axis_result_tdata;
  assign io_res_payload_23 = flowVec0_23_mul_ip_m_axis_result_tdata;
  assign io_res_payload_24 = flowVec0_24_mul_ip_m_axis_result_tdata;
  assign io_res_payload_25 = flowVec0_25_mul_ip_m_axis_result_tdata;
  assign io_res_payload_26 = flowVec0_26_mul_ip_m_axis_result_tdata;
  assign io_res_payload_27 = flowVec0_27_mul_ip_m_axis_result_tdata;
  assign io_res_payload_28 = flowVec0_28_mul_ip_m_axis_result_tdata;
  assign io_res_payload_29 = flowVec0_29_mul_ip_m_axis_result_tdata;
  assign io_res_payload_30 = flowVec0_30_mul_ip_m_axis_result_tdata;
  assign io_res_payload_31 = flowVec0_31_mul_ip_m_axis_result_tdata;
  assign io_res_valid = t_io_res_valid_5;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      t_io_res_valid <= 1'b0;
      t_io_res_valid_1 <= 1'b0;
      t_io_res_valid_2 <= 1'b0;
      t_io_res_valid_3 <= 1'b0;
      t_io_res_valid_4 <= 1'b0;
      t_io_res_valid_5 <= 1'b0;
    end else begin
      t_io_res_valid <= (io_in0_valid && io_in1_valid);
      t_io_res_valid_1 <= t_io_res_valid;
      t_io_res_valid_2 <= t_io_res_valid_1;
      t_io_res_valid_3 <= t_io_res_valid_2;
      t_io_res_valid_4 <= t_io_res_valid_3;
      t_io_res_valid_5 <= t_io_res_valid_4;
    end
  end


endmodule

//StreamMux_45 replaced by StreamMux_49

//StreamDemux_21 replaced by StreamDemux_25

//StreamFifo_131 replaced by StreamFifo_128

//StreamFifo_130 replaced by StreamFifo_128

//StreamFifo_129 replaced by StreamFifo_128

