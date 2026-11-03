// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module Fp32AccEngine_1 (
  input  wire          io_inputs_0_valid,
  input  wire          io_inputs_0_payload_last,
  input  wire [15:0]   io_inputs_0_payload_tdata,
  input  wire [5:0]    io_inputs_0_payload_tuser,
  input  wire          io_inputs_1_valid,
  input  wire          io_inputs_1_payload_last,
  input  wire [15:0]   io_inputs_1_payload_tdata,
  input  wire [5:0]    io_inputs_1_payload_tuser,
  input  wire          io_inputs_2_valid,
  input  wire          io_inputs_2_payload_last,
  input  wire [15:0]   io_inputs_2_payload_tdata,
  input  wire [5:0]    io_inputs_2_payload_tuser,
  input  wire          io_inputs_3_valid,
  input  wire          io_inputs_3_payload_last,
  input  wire [15:0]   io_inputs_3_payload_tdata,
  input  wire [5:0]    io_inputs_3_payload_tuser,
  input  wire          io_postScale_valid,
  output wire          io_postScale_ready,
  input  wire [31:0]   io_postScale_payload,
  output wire          io_output_valid,
  output wire [15:0]   io_output_tdata,
  output wire [5:0]    io_output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                inputs_0_to_ip_m_axis_result_tvalid;
  wire       [31:0]   inputs_0_to_ip_m_axis_result_tdata;
  wire                inputs_1_to_ip_m_axis_result_tvalid;
  wire       [31:0]   inputs_1_to_ip_m_axis_result_tdata;
  wire                inputs_2_to_ip_m_axis_result_tvalid;
  wire       [31:0]   inputs_2_to_ip_m_axis_result_tdata;
  wire                inputs_3_to_ip_m_axis_result_tvalid;
  wire       [31:0]   inputs_3_to_ip_m_axis_result_tdata;
  wire                fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  wire       [31:0]   fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tdata;
  wire                fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  wire       [31:0]   fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tdata;
  wire                fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  wire       [31:0]   fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tdata;
  wire                scaleFlow_mul_ip_m_axis_result_tvalid;
  wire       [31:0]   scaleFlow_mul_ip_m_axis_result_tdata;
  wire                accIn_acc_ip_m_axis_result_tvalid;
  wire                accIn_acc_ip_m_axis_result_tlast;
  wire       [31:0]   accIn_acc_ip_m_axis_result_tdata;
  wire                fp32Out_to_ip_m_axis_result_tvalid;
  wire       [15:0]   fp32Out_to_ip_m_axis_result_tdata;
  wire                inputs_0_valid;
  wire       [15:0]   inputs_0_payload;
  wire                inputs_1_valid;
  wire       [15:0]   inputs_1_payload;
  wire                inputs_2_valid;
  wire       [15:0]   inputs_2_payload;
  wire                inputs_3_valid;
  wire       [15:0]   inputs_3_payload;
  wire                scaleFlow_valid;
  wire       [31:0]   scaleFlow_payload;
  wire                reduceFlow_valid;
  wire       [31:0]   reduceFlow_payload;
  reg                 io_inputs_0_payload_last_delay_1;
  reg                 io_inputs_0_payload_last_delay_2;
  reg                 io_inputs_0_payload_last_delay_3;
  reg                 io_inputs_0_payload_last_delay_4;
  reg                 io_inputs_0_payload_last_delay_5;
  reg                 io_inputs_0_payload_last_delay_6;
  reg                 io_inputs_0_payload_last_delay_7;
  reg                 io_inputs_0_payload_last_delay_8;
  reg                 io_inputs_0_payload_last_delay_9;
  reg                 io_inputs_0_payload_last_delay_10;
  reg                 io_inputs_0_payload_last_delay_11;
  reg                 io_inputs_0_payload_last_delay_12;
  reg                 io_inputs_0_payload_last_delay_13;
  reg                 io_inputs_0_payload_last_delay_14;
  reg                 io_inputs_0_payload_last_delay_15;
  reg                 io_inputs_0_payload_last_delay_16;
  reg                 io_inputs_0_payload_last_delay_17;
  reg                 io_inputs_0_payload_last_delay_18;
  reg                 io_inputs_0_payload_last_delay_19;
  reg                 io_inputs_0_payload_last_delay_20;
  reg                 io_inputs_0_payload_last_delay_21;
  reg                 io_inputs_0_payload_last_delay_22;
  reg                 io_inputs_0_payload_last_delay_23;
  reg                 io_inputs_0_payload_last_delay_24;
  reg                 io_inputs_0_payload_last_delay_25;
  reg                 io_inputs_0_payload_last_delay_26;
  reg                 io_inputs_0_payload_last_delay_27;
  reg                 io_inputs_0_payload_last_delay_28;
  reg                 io_inputs_0_payload_last_delay_29;
  reg                 io_inputs_0_payload_last_delay_30;
  reg                 io_inputs_0_payload_last_delay_31;
  reg                 lastDly;
  wire                accIn_valid;
  wire                accIn_payload_last;
  wire       [31:0]   accIn_payload_fragment;
  wire                accOut_valid;
  wire                accOut_payload_last;
  wire       [31:0]   accOut_payload_fragment;
  wire                fp32Out_valid;
  wire       [31:0]   fp32Out_payload;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_1;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_2;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_3;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_4;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_5;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_6;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_7;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_8;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_9;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_10;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_11;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_12;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_13;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_14;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_15;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_16;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_17;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_18;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_19;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_20;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_21;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_22;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_23;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_24;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_25;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_26;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_27;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_28;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_29;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_30;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_31;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_32;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_33;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_34;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_35;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_36;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_37;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_38;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_39;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_40;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_41;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_42;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_43;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_44;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_45;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_46;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_47;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_48;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_49;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_50;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_51;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_52;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_53;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_54;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_55;
  reg        [5:0]    io_inputs_0_payload_tuser_delay_56;
  reg        [5:0]    tuserDly;

  fp16toFp32 inputs_0_to_ip (
    .aclk                 (clk_0_clk                               ), //i
    .s_axis_a_tvalid      (inputs_0_valid                          ), //i
    .s_axis_a_tdata       (inputs_0_payload[15:0]                  ), //i
    .m_axis_result_tvalid (inputs_0_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (inputs_0_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32 inputs_1_to_ip (
    .aclk                 (clk_0_clk                               ), //i
    .s_axis_a_tvalid      (inputs_1_valid                          ), //i
    .s_axis_a_tdata       (inputs_1_payload[15:0]                  ), //i
    .m_axis_result_tvalid (inputs_1_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (inputs_1_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32 inputs_2_to_ip (
    .aclk                 (clk_0_clk                               ), //i
    .s_axis_a_tvalid      (inputs_2_valid                          ), //i
    .s_axis_a_tdata       (inputs_2_payload[15:0]                  ), //i
    .m_axis_result_tvalid (inputs_2_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (inputs_2_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32 inputs_3_to_ip (
    .aclk                 (clk_0_clk                               ), //i
    .s_axis_a_tvalid      (inputs_3_valid                          ), //i
    .s_axis_a_tdata       (inputs_3_payload[15:0]                  ), //i
    .m_axis_result_tvalid (inputs_3_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (inputs_3_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32add11 fp32Acc_inputs_0_to_ip_m_axis_result_add_ip (
    .aclk                 (clk_0_clk                                                            ), //i
    .s_axis_a_tvalid      (inputs_0_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (inputs_0_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .s_axis_b_tvalid      (inputs_1_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_b_tdata       (inputs_1_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .m_axis_result_tvalid (fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32add11 fp32Acc_inputs_2_to_ip_m_axis_result_add_ip (
    .aclk                 (clk_0_clk                                                            ), //i
    .s_axis_a_tvalid      (inputs_2_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (inputs_2_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .s_axis_b_tvalid      (inputs_3_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_b_tdata       (inputs_3_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .m_axis_result_tvalid (fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32add11 fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip (
    .aclk                 (clk_0_clk                                                                                         ), //i
    .s_axis_a_tvalid      (fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_tdata[31:0]                             ), //i
    .s_axis_b_tvalid      (fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_b_tdata       (fp32Acc_inputs_2_to_ip_m_axis_result_add_ip_m_axis_result_tdata[31:0]                             ), //i
    .m_axis_result_tvalid (fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32mul8 scaleFlow_mul_ip (
    .aclk                 (clk_0_clk                                 ), //i
    .s_axis_a_tvalid      (scaleFlow_valid                           ), //i
    .s_axis_a_tdata       (scaleFlow_payload[31:0]                   ), //i
    .s_axis_b_tvalid      (reduceFlow_valid                          ), //i
    .s_axis_b_tdata       (reduceFlow_payload[31:0]                  ), //i
    .m_axis_result_tvalid (scaleFlow_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (scaleFlow_mul_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32acc22 accIn_acc_ip (
    .aclk                 (clk_0_clk                             ), //i
    .aresetn              (clk_0_resetn                          ), //i
    .s_axis_a_tvalid      (accIn_valid                           ), //i
    .s_axis_a_tlast       (accIn_payload_last                    ), //i
    .s_axis_a_tdata       (accIn_payload_fragment[31:0]          ), //i
    .m_axis_result_tvalid (accIn_acc_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tlast  (accIn_acc_ip_m_axis_result_tlast      ), //o
    .m_axis_result_tdata  (accIn_acc_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32toFp16 fp32Out_to_ip (
    .aclk                 (clk_0_clk                              ), //i
    .s_axis_a_tvalid      (fp32Out_valid                          ), //i
    .s_axis_a_tdata       (fp32Out_payload[31:0]                  ), //i
    .m_axis_result_tvalid (fp32Out_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (fp32Out_to_ip_m_axis_result_tdata[15:0])  //o
  );
  assign inputs_0_valid = io_inputs_0_valid;
  assign inputs_1_valid = io_inputs_1_valid;
  assign inputs_2_valid = io_inputs_2_valid;
  assign inputs_3_valid = io_inputs_3_valid;
  assign inputs_0_payload = io_inputs_0_payload_tdata;
  assign inputs_1_payload = io_inputs_1_payload_tdata;
  assign inputs_2_payload = io_inputs_2_payload_tdata;
  assign inputs_3_payload = io_inputs_3_payload_tdata;
  assign reduceFlow_valid = fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  assign reduceFlow_payload = fp32Acc_fp32Acc_inputs_0_to_ip_m_axis_result_add_ip_m_axis_result_add_ip_m_axis_result_tdata;
  assign scaleFlow_valid = reduceFlow_valid;
  assign scaleFlow_payload = io_postScale_payload;
  assign io_postScale_ready = reduceFlow_valid;
  assign accIn_valid = scaleFlow_mul_ip_m_axis_result_tvalid;
  assign accIn_payload_fragment = scaleFlow_mul_ip_m_axis_result_tdata;
  assign accIn_payload_last = lastDly;
  assign accOut_valid = accIn_acc_ip_m_axis_result_tvalid;
  assign accOut_payload_last = accIn_acc_ip_m_axis_result_tlast;
  assign accOut_payload_fragment = accIn_acc_ip_m_axis_result_tdata;
  assign fp32Out_valid = (accOut_valid && accOut_payload_last);
  assign fp32Out_payload = accOut_payload_fragment;
  assign io_output_valid = fp32Out_to_ip_m_axis_result_tvalid;
  assign io_output_tdata = fp32Out_to_ip_m_axis_result_tdata;
  assign io_output_tuser = tuserDly;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      io_inputs_0_payload_last_delay_1 <= 1'b0;
      io_inputs_0_payload_last_delay_2 <= 1'b0;
      io_inputs_0_payload_last_delay_3 <= 1'b0;
      io_inputs_0_payload_last_delay_4 <= 1'b0;
      io_inputs_0_payload_last_delay_5 <= 1'b0;
      io_inputs_0_payload_last_delay_6 <= 1'b0;
      io_inputs_0_payload_last_delay_7 <= 1'b0;
      io_inputs_0_payload_last_delay_8 <= 1'b0;
      io_inputs_0_payload_last_delay_9 <= 1'b0;
      io_inputs_0_payload_last_delay_10 <= 1'b0;
      io_inputs_0_payload_last_delay_11 <= 1'b0;
      io_inputs_0_payload_last_delay_12 <= 1'b0;
      io_inputs_0_payload_last_delay_13 <= 1'b0;
      io_inputs_0_payload_last_delay_14 <= 1'b0;
      io_inputs_0_payload_last_delay_15 <= 1'b0;
      io_inputs_0_payload_last_delay_16 <= 1'b0;
      io_inputs_0_payload_last_delay_17 <= 1'b0;
      io_inputs_0_payload_last_delay_18 <= 1'b0;
      io_inputs_0_payload_last_delay_19 <= 1'b0;
      io_inputs_0_payload_last_delay_20 <= 1'b0;
      io_inputs_0_payload_last_delay_21 <= 1'b0;
      io_inputs_0_payload_last_delay_22 <= 1'b0;
      io_inputs_0_payload_last_delay_23 <= 1'b0;
      io_inputs_0_payload_last_delay_24 <= 1'b0;
      io_inputs_0_payload_last_delay_25 <= 1'b0;
      io_inputs_0_payload_last_delay_26 <= 1'b0;
      io_inputs_0_payload_last_delay_27 <= 1'b0;
      io_inputs_0_payload_last_delay_28 <= 1'b0;
      io_inputs_0_payload_last_delay_29 <= 1'b0;
      io_inputs_0_payload_last_delay_30 <= 1'b0;
      io_inputs_0_payload_last_delay_31 <= 1'b0;
      lastDly <= 1'b0;
      io_inputs_0_payload_tuser_delay_1 <= 6'h0;
      io_inputs_0_payload_tuser_delay_2 <= 6'h0;
      io_inputs_0_payload_tuser_delay_3 <= 6'h0;
      io_inputs_0_payload_tuser_delay_4 <= 6'h0;
      io_inputs_0_payload_tuser_delay_5 <= 6'h0;
      io_inputs_0_payload_tuser_delay_6 <= 6'h0;
      io_inputs_0_payload_tuser_delay_7 <= 6'h0;
      io_inputs_0_payload_tuser_delay_8 <= 6'h0;
      io_inputs_0_payload_tuser_delay_9 <= 6'h0;
      io_inputs_0_payload_tuser_delay_10 <= 6'h0;
      io_inputs_0_payload_tuser_delay_11 <= 6'h0;
      io_inputs_0_payload_tuser_delay_12 <= 6'h0;
      io_inputs_0_payload_tuser_delay_13 <= 6'h0;
      io_inputs_0_payload_tuser_delay_14 <= 6'h0;
      io_inputs_0_payload_tuser_delay_15 <= 6'h0;
      io_inputs_0_payload_tuser_delay_16 <= 6'h0;
      io_inputs_0_payload_tuser_delay_17 <= 6'h0;
      io_inputs_0_payload_tuser_delay_18 <= 6'h0;
      io_inputs_0_payload_tuser_delay_19 <= 6'h0;
      io_inputs_0_payload_tuser_delay_20 <= 6'h0;
      io_inputs_0_payload_tuser_delay_21 <= 6'h0;
      io_inputs_0_payload_tuser_delay_22 <= 6'h0;
      io_inputs_0_payload_tuser_delay_23 <= 6'h0;
      io_inputs_0_payload_tuser_delay_24 <= 6'h0;
      io_inputs_0_payload_tuser_delay_25 <= 6'h0;
      io_inputs_0_payload_tuser_delay_26 <= 6'h0;
      io_inputs_0_payload_tuser_delay_27 <= 6'h0;
      io_inputs_0_payload_tuser_delay_28 <= 6'h0;
      io_inputs_0_payload_tuser_delay_29 <= 6'h0;
      io_inputs_0_payload_tuser_delay_30 <= 6'h0;
      io_inputs_0_payload_tuser_delay_31 <= 6'h0;
      io_inputs_0_payload_tuser_delay_32 <= 6'h0;
      io_inputs_0_payload_tuser_delay_33 <= 6'h0;
      io_inputs_0_payload_tuser_delay_34 <= 6'h0;
      io_inputs_0_payload_tuser_delay_35 <= 6'h0;
      io_inputs_0_payload_tuser_delay_36 <= 6'h0;
      io_inputs_0_payload_tuser_delay_37 <= 6'h0;
      io_inputs_0_payload_tuser_delay_38 <= 6'h0;
      io_inputs_0_payload_tuser_delay_39 <= 6'h0;
      io_inputs_0_payload_tuser_delay_40 <= 6'h0;
      io_inputs_0_payload_tuser_delay_41 <= 6'h0;
      io_inputs_0_payload_tuser_delay_42 <= 6'h0;
      io_inputs_0_payload_tuser_delay_43 <= 6'h0;
      io_inputs_0_payload_tuser_delay_44 <= 6'h0;
      io_inputs_0_payload_tuser_delay_45 <= 6'h0;
      io_inputs_0_payload_tuser_delay_46 <= 6'h0;
      io_inputs_0_payload_tuser_delay_47 <= 6'h0;
      io_inputs_0_payload_tuser_delay_48 <= 6'h0;
      io_inputs_0_payload_tuser_delay_49 <= 6'h0;
      io_inputs_0_payload_tuser_delay_50 <= 6'h0;
      io_inputs_0_payload_tuser_delay_51 <= 6'h0;
      io_inputs_0_payload_tuser_delay_52 <= 6'h0;
      io_inputs_0_payload_tuser_delay_53 <= 6'h0;
      io_inputs_0_payload_tuser_delay_54 <= 6'h0;
      io_inputs_0_payload_tuser_delay_55 <= 6'h0;
      io_inputs_0_payload_tuser_delay_56 <= 6'h0;
      tuserDly <= 6'h0;
    end else begin
      io_inputs_0_payload_last_delay_1 <= io_inputs_0_payload_last;
      io_inputs_0_payload_last_delay_2 <= io_inputs_0_payload_last_delay_1;
      io_inputs_0_payload_last_delay_3 <= io_inputs_0_payload_last_delay_2;
      io_inputs_0_payload_last_delay_4 <= io_inputs_0_payload_last_delay_3;
      io_inputs_0_payload_last_delay_5 <= io_inputs_0_payload_last_delay_4;
      io_inputs_0_payload_last_delay_6 <= io_inputs_0_payload_last_delay_5;
      io_inputs_0_payload_last_delay_7 <= io_inputs_0_payload_last_delay_6;
      io_inputs_0_payload_last_delay_8 <= io_inputs_0_payload_last_delay_7;
      io_inputs_0_payload_last_delay_9 <= io_inputs_0_payload_last_delay_8;
      io_inputs_0_payload_last_delay_10 <= io_inputs_0_payload_last_delay_9;
      io_inputs_0_payload_last_delay_11 <= io_inputs_0_payload_last_delay_10;
      io_inputs_0_payload_last_delay_12 <= io_inputs_0_payload_last_delay_11;
      io_inputs_0_payload_last_delay_13 <= io_inputs_0_payload_last_delay_12;
      io_inputs_0_payload_last_delay_14 <= io_inputs_0_payload_last_delay_13;
      io_inputs_0_payload_last_delay_15 <= io_inputs_0_payload_last_delay_14;
      io_inputs_0_payload_last_delay_16 <= io_inputs_0_payload_last_delay_15;
      io_inputs_0_payload_last_delay_17 <= io_inputs_0_payload_last_delay_16;
      io_inputs_0_payload_last_delay_18 <= io_inputs_0_payload_last_delay_17;
      io_inputs_0_payload_last_delay_19 <= io_inputs_0_payload_last_delay_18;
      io_inputs_0_payload_last_delay_20 <= io_inputs_0_payload_last_delay_19;
      io_inputs_0_payload_last_delay_21 <= io_inputs_0_payload_last_delay_20;
      io_inputs_0_payload_last_delay_22 <= io_inputs_0_payload_last_delay_21;
      io_inputs_0_payload_last_delay_23 <= io_inputs_0_payload_last_delay_22;
      io_inputs_0_payload_last_delay_24 <= io_inputs_0_payload_last_delay_23;
      io_inputs_0_payload_last_delay_25 <= io_inputs_0_payload_last_delay_24;
      io_inputs_0_payload_last_delay_26 <= io_inputs_0_payload_last_delay_25;
      io_inputs_0_payload_last_delay_27 <= io_inputs_0_payload_last_delay_26;
      io_inputs_0_payload_last_delay_28 <= io_inputs_0_payload_last_delay_27;
      io_inputs_0_payload_last_delay_29 <= io_inputs_0_payload_last_delay_28;
      io_inputs_0_payload_last_delay_30 <= io_inputs_0_payload_last_delay_29;
      io_inputs_0_payload_last_delay_31 <= io_inputs_0_payload_last_delay_30;
      lastDly <= io_inputs_0_payload_last_delay_31;
      io_inputs_0_payload_tuser_delay_1 <= io_inputs_0_payload_tuser;
      io_inputs_0_payload_tuser_delay_2 <= io_inputs_0_payload_tuser_delay_1;
      io_inputs_0_payload_tuser_delay_3 <= io_inputs_0_payload_tuser_delay_2;
      io_inputs_0_payload_tuser_delay_4 <= io_inputs_0_payload_tuser_delay_3;
      io_inputs_0_payload_tuser_delay_5 <= io_inputs_0_payload_tuser_delay_4;
      io_inputs_0_payload_tuser_delay_6 <= io_inputs_0_payload_tuser_delay_5;
      io_inputs_0_payload_tuser_delay_7 <= io_inputs_0_payload_tuser_delay_6;
      io_inputs_0_payload_tuser_delay_8 <= io_inputs_0_payload_tuser_delay_7;
      io_inputs_0_payload_tuser_delay_9 <= io_inputs_0_payload_tuser_delay_8;
      io_inputs_0_payload_tuser_delay_10 <= io_inputs_0_payload_tuser_delay_9;
      io_inputs_0_payload_tuser_delay_11 <= io_inputs_0_payload_tuser_delay_10;
      io_inputs_0_payload_tuser_delay_12 <= io_inputs_0_payload_tuser_delay_11;
      io_inputs_0_payload_tuser_delay_13 <= io_inputs_0_payload_tuser_delay_12;
      io_inputs_0_payload_tuser_delay_14 <= io_inputs_0_payload_tuser_delay_13;
      io_inputs_0_payload_tuser_delay_15 <= io_inputs_0_payload_tuser_delay_14;
      io_inputs_0_payload_tuser_delay_16 <= io_inputs_0_payload_tuser_delay_15;
      io_inputs_0_payload_tuser_delay_17 <= io_inputs_0_payload_tuser_delay_16;
      io_inputs_0_payload_tuser_delay_18 <= io_inputs_0_payload_tuser_delay_17;
      io_inputs_0_payload_tuser_delay_19 <= io_inputs_0_payload_tuser_delay_18;
      io_inputs_0_payload_tuser_delay_20 <= io_inputs_0_payload_tuser_delay_19;
      io_inputs_0_payload_tuser_delay_21 <= io_inputs_0_payload_tuser_delay_20;
      io_inputs_0_payload_tuser_delay_22 <= io_inputs_0_payload_tuser_delay_21;
      io_inputs_0_payload_tuser_delay_23 <= io_inputs_0_payload_tuser_delay_22;
      io_inputs_0_payload_tuser_delay_24 <= io_inputs_0_payload_tuser_delay_23;
      io_inputs_0_payload_tuser_delay_25 <= io_inputs_0_payload_tuser_delay_24;
      io_inputs_0_payload_tuser_delay_26 <= io_inputs_0_payload_tuser_delay_25;
      io_inputs_0_payload_tuser_delay_27 <= io_inputs_0_payload_tuser_delay_26;
      io_inputs_0_payload_tuser_delay_28 <= io_inputs_0_payload_tuser_delay_27;
      io_inputs_0_payload_tuser_delay_29 <= io_inputs_0_payload_tuser_delay_28;
      io_inputs_0_payload_tuser_delay_30 <= io_inputs_0_payload_tuser_delay_29;
      io_inputs_0_payload_tuser_delay_31 <= io_inputs_0_payload_tuser_delay_30;
      io_inputs_0_payload_tuser_delay_32 <= io_inputs_0_payload_tuser_delay_31;
      io_inputs_0_payload_tuser_delay_33 <= io_inputs_0_payload_tuser_delay_32;
      io_inputs_0_payload_tuser_delay_34 <= io_inputs_0_payload_tuser_delay_33;
      io_inputs_0_payload_tuser_delay_35 <= io_inputs_0_payload_tuser_delay_34;
      io_inputs_0_payload_tuser_delay_36 <= io_inputs_0_payload_tuser_delay_35;
      io_inputs_0_payload_tuser_delay_37 <= io_inputs_0_payload_tuser_delay_36;
      io_inputs_0_payload_tuser_delay_38 <= io_inputs_0_payload_tuser_delay_37;
      io_inputs_0_payload_tuser_delay_39 <= io_inputs_0_payload_tuser_delay_38;
      io_inputs_0_payload_tuser_delay_40 <= io_inputs_0_payload_tuser_delay_39;
      io_inputs_0_payload_tuser_delay_41 <= io_inputs_0_payload_tuser_delay_40;
      io_inputs_0_payload_tuser_delay_42 <= io_inputs_0_payload_tuser_delay_41;
      io_inputs_0_payload_tuser_delay_43 <= io_inputs_0_payload_tuser_delay_42;
      io_inputs_0_payload_tuser_delay_44 <= io_inputs_0_payload_tuser_delay_43;
      io_inputs_0_payload_tuser_delay_45 <= io_inputs_0_payload_tuser_delay_44;
      io_inputs_0_payload_tuser_delay_46 <= io_inputs_0_payload_tuser_delay_45;
      io_inputs_0_payload_tuser_delay_47 <= io_inputs_0_payload_tuser_delay_46;
      io_inputs_0_payload_tuser_delay_48 <= io_inputs_0_payload_tuser_delay_47;
      io_inputs_0_payload_tuser_delay_49 <= io_inputs_0_payload_tuser_delay_48;
      io_inputs_0_payload_tuser_delay_50 <= io_inputs_0_payload_tuser_delay_49;
      io_inputs_0_payload_tuser_delay_51 <= io_inputs_0_payload_tuser_delay_50;
      io_inputs_0_payload_tuser_delay_52 <= io_inputs_0_payload_tuser_delay_51;
      io_inputs_0_payload_tuser_delay_53 <= io_inputs_0_payload_tuser_delay_52;
      io_inputs_0_payload_tuser_delay_54 <= io_inputs_0_payload_tuser_delay_53;
      io_inputs_0_payload_tuser_delay_55 <= io_inputs_0_payload_tuser_delay_54;
      io_inputs_0_payload_tuser_delay_56 <= io_inputs_0_payload_tuser_delay_55;
      tuserDly <= io_inputs_0_payload_tuser_delay_56;
    end
  end


endmodule

//MulAddEngineNew_7 replaced by MulAddEngineNew_4

//MulAddEngineNew_6 replaced by MulAddEngineNew_4

//MulAddEngineNew_5 replaced by MulAddEngineNew_4

