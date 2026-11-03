// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module GetScaleZero (
  input  wire          max_tvalid,
  input  wire [15:0]   max_tdata,
  input  wire          min_tvalid,
  input  wire [15:0]   min_tdata,
  output wire          scale_tvalid,
  output wire [15:0]   scale_tdata,
  output wire          zero_tvalid,
  output wire [7:0]    zero_tdata,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [15:0]   fifo_io_pop_payload;
  wire       [5:0]    fifo_io_occupancy;
  wire       [5:0]    fifo_io_availability;
  wire                max_sub_ip_m_axis_result_tvalid;
  wire       [15:0]   max_sub_ip_m_axis_result_tdata;
  wire                getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tvalid;
  wire       [15:0]   getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tdata;
  wire                minFlowDly_div_ip_m_axis_result_tvalid;
  wire       [15:0]   minFlowDly_div_ip_m_axis_result_tdata;
  wire                divRev_to_ip_m_axis_result_tvalid;
  wire       [15:0]   divRev_to_ip_m_axis_result_tdata;
  wire       [15:0]   t_when;
  wire                maxIntFlow_valid;
  wire       [15:0]   maxIntFlow_payload;
  wire                minFlowDly_valid;
  wire       [15:0]   minFlowDly_payload;
  wire                scale_valid;
  wire       [15:0]   scale_payload;
  wire                divRev_valid;
  wire       [15:0]   divRev_payload;
  wire       [7:0]    maxInt;
  reg        [7:0]    zero;

  assign t_when = {8'd0, maxInt};
  StreamFifo_132 fifo (
    .io_push_valid   (min_tvalid               ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_push_payload (min_tdata[15:0]          ), //i
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (scale_valid              ), //i
    .io_pop_payload  (fifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                     ), //i
    .io_occupancy    (fifo_io_occupancy[5:0]   ), //o
    .io_availability (fifo_io_availability[5:0]), //o
    .clk_1_clk       (clk_1_clk                ), //i
    .clk_1_resetn    (clk_1_resetn             )  //i
  );
  fp16sub8 max_sub_ip (
    .aclk                 (clk_1_clk                           ), //i
    .s_axis_a_tvalid      (max_tvalid                          ), //i
    .s_axis_a_tdata       (max_tdata[15:0]                     ), //i
    .s_axis_b_tvalid      (min_tvalid                          ), //i
    .s_axis_b_tdata       (min_tdata[15:0]                     ), //i
    .m_axis_result_tvalid (max_sub_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (max_sub_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16div12 getCfg_max_sub_ip_m_axis_result_div_ip (
    .aclk                 (clk_1_clk                                                       ), //i
    .s_axis_a_tvalid      (max_sub_ip_m_axis_result_tvalid                                 ), //i
    .s_axis_a_tdata       (max_sub_ip_m_axis_result_tdata[15:0]                            ), //i
    .s_axis_b_tvalid      (maxIntFlow_valid                                                ), //i
    .s_axis_b_tdata       (maxIntFlow_payload[15:0]                                        ), //i
    .m_axis_result_tvalid (getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16div12 minFlowDly_div_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (minFlowDly_valid                           ), //i
    .s_axis_a_tdata       (minFlowDly_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (scale_valid                                ), //i
    .s_axis_b_tdata       (scale_payload[15:0]                        ), //i
    .m_axis_result_tvalid (minFlowDly_div_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (minFlowDly_div_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16toint9d4 divRev_to_ip (
    .aclk                 (clk_1_clk                             ), //i
    .s_axis_a_tvalid      (divRev_valid                          ), //i
    .s_axis_a_tdata       (divRev_payload[15:0]                  ), //i
    .m_axis_result_tvalid (divRev_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (divRev_to_ip_m_axis_result_tdata[15:0])  //o
  );
  assign maxIntFlow_valid = 1'b1;
  assign maxIntFlow_payload = 16'h5bf8;
  assign scale_valid = getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tvalid;
  assign scale_payload = getCfg_max_sub_ip_m_axis_result_div_ip_m_axis_result_tdata;
  assign divRev_valid = minFlowDly_div_ip_m_axis_result_tvalid;
  assign divRev_payload = {(~ minFlowDly_div_ip_m_axis_result_tdata[15 : 15]),minFlowDly_div_ip_m_axis_result_tdata[14 : 0]};
  assign minFlowDly_valid = fifo_io_pop_valid;
  assign minFlowDly_payload = fifo_io_pop_payload;
  assign maxInt = 8'hff;
  always @(*) begin
    zero = divRev_to_ip_m_axis_result_tdata[7:0];
    if((t_when < divRev_to_ip_m_axis_result_tdata)) begin
      zero = maxInt;
    end
  end

  assign zero_tvalid = divRev_to_ip_m_axis_result_tvalid;
  assign zero_tdata = zero;
  assign scale_tvalid = scale_valid;
  assign scale_tdata = scale_payload;

endmodule

