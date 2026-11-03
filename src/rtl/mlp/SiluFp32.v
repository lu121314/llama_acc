// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SiluFp32 (
  input  wire          io_in_valid,
  input  wire [15:0]   io_in_payload,
  output wire          io_out_valid,
  output wire [15:0]   io_out_payload,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                io_in_to_ip_m_axis_result_tvalid;
  wire       [31:0]   io_in_to_ip_m_axis_result_tdata;
  wire                ipFlowIO_m_axis_result_tvalid;
  wire       [31:0]   ipFlowIO_m_axis_result_tdata;
  wire                fp32One_add_ip_m_axis_result_tvalid;
  wire       [31:0]   fp32One_add_ip_m_axis_result_tdata;
  wire                inDly_div_ip_m_axis_result_tvalid;
  wire       [31:0]   inDly_div_ip_m_axis_result_tdata;
  wire                siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tvalid;
  wire       [15:0]   siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tdata;
  reg        [31:0]   t_s_axis_a_tdata;
  wire                fp32One_valid;
  wire       [31:0]   fp32One_payload;
  wire                inDly_valid;
  wire       [31:0]   inDly_payload;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_1;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_2;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_3;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_4;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_5;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_6;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_7;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_8;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_9;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_10;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_11;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_12;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_13;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_14;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_15;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_16;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_17;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_18;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_19;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_20;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_21;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_22;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_23;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_24;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_25;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_26;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_27;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_28;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_29;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_30;
  reg        [31:0]   siluAct_io_in_to_ip_m_axis_result_tdata_delay_31;

  fp16toFp32 io_in_to_ip (
    .aclk                 (clk_1_clk                            ), //i
    .s_axis_a_tvalid      (io_in_valid                          ), //i
    .s_axis_a_tdata       (io_in_payload[15:0]                  ), //i
    .m_axis_result_tvalid (io_in_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (io_in_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32exp20 ipFlowIO (
    .aclk                 (clk_1_clk                         ), //i
    .s_axis_a_tvalid      (io_in_to_ip_m_axis_result_tvalid  ), //i
    .s_axis_a_tdata       (t_s_axis_a_tdata[31:0]            ), //i
    .m_axis_result_tvalid (ipFlowIO_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (ipFlowIO_m_axis_result_tdata[31:0])  //o
  );
  fp32add11 fp32One_add_ip (
    .aclk                 (clk_1_clk                               ), //i
    .s_axis_a_tvalid      (fp32One_valid                           ), //i
    .s_axis_a_tdata       (fp32One_payload[31:0]                   ), //i
    .s_axis_b_tvalid      (ipFlowIO_m_axis_result_tvalid           ), //i
    .s_axis_b_tdata       (ipFlowIO_m_axis_result_tdata[31:0]      ), //i
    .m_axis_result_tvalid (fp32One_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (fp32One_add_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32div28 inDly_div_ip (
    .aclk                 (clk_1_clk                               ), //i
    .s_axis_a_tvalid      (inDly_valid                             ), //i
    .s_axis_a_tdata       (inDly_payload[31:0]                     ), //i
    .s_axis_b_tvalid      (fp32One_add_ip_m_axis_result_tvalid     ), //i
    .s_axis_b_tdata       (fp32One_add_ip_m_axis_result_tdata[31:0]), //i
    .m_axis_result_tvalid (inDly_div_ip_m_axis_result_tvalid       ), //o
    .m_axis_result_tdata  (inDly_div_ip_m_axis_result_tdata[31:0]  )  //o
  );
  fp32toFp16 siluAct_inDly_div_ip_m_axis_result_to_ip (
    .aclk                 (clk_1_clk                                                         ), //i
    .s_axis_a_tvalid      (inDly_div_ip_m_axis_result_tvalid                                 ), //i
    .s_axis_a_tdata       (inDly_div_ip_m_axis_result_tdata[31:0]                            ), //i
    .m_axis_result_tvalid (siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tdata[15:0])  //o
  );
  always @(*) begin
    t_s_axis_a_tdata = io_in_to_ip_m_axis_result_tdata;
    t_s_axis_a_tdata[31] = (! io_in_to_ip_m_axis_result_tdata[31]);
  end

  assign fp32One_valid = 1'b1;
  assign fp32One_payload = 32'h3f800000;
  assign inDly_payload = siluAct_io_in_to_ip_m_axis_result_tdata_delay_31;
  assign inDly_valid = fp32One_add_ip_m_axis_result_tvalid;
  assign io_out_valid = siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tvalid;
  assign io_out_payload = siluAct_inDly_div_ip_m_axis_result_to_ip_m_axis_result_tdata;
  always @(posedge clk_1_clk) begin
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_1 <= io_in_to_ip_m_axis_result_tdata;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_2 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_1;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_3 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_2;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_4 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_3;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_5 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_4;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_6 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_5;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_7 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_6;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_8 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_7;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_9 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_8;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_10 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_9;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_11 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_10;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_12 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_11;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_13 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_12;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_14 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_13;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_15 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_14;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_16 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_15;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_17 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_16;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_18 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_17;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_19 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_18;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_20 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_19;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_21 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_20;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_22 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_21;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_23 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_22;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_24 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_23;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_25 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_24;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_26 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_25;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_27 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_26;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_28 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_27;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_29 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_28;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_30 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_29;
    siluAct_io_in_to_ip_m_axis_result_tdata_delay_31 <= siluAct_io_in_to_ip_m_axis_result_tdata_delay_30;
  end


endmodule

