// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module QKMul (
  input  wire          io_input_valid,
  input  wire [15:0]   io_input_tdata,
  input  wire [5:0]    io_input_tuser,
  output wire          io_output_valid,
  output wire [15:0]   io_output_tdata,
  output wire [5:0]    io_output_tuser,
  output wire          qProbe_valid,
  output wire [15:0]   qProbe_payload,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                qIn_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   qIn_mul_ip_m_axis_result_tdata;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [15:0]   fifo_io_pop_payload;
  wire       [7:0]    fifo_io_occupancy;
  wire       [7:0]    fifo_io_availability;
  wire                qFlow_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   qFlow_mul_ip_m_axis_result_tdata;
  wire                accIn_acc_ip_m_axis_result_tvalid;
  wire                accIn_acc_ip_m_axis_result_tlast;
  wire       [15:0]   accIn_acc_ip_m_axis_result_tdata;
  wire                qIn_tvalid;
  wire       [15:0]   qIn_tdata;
  reg        [6:0]    inCnt;
  reg        [4:0]    headCnt;
  wire                kInput_valid;
  wire       [15:0]   kInput_payload;
  wire                sqrtD_valid;
  wire       [15:0]   sqrtD_payload;
  wire                qFlow_valid;
  wire       [15:0]   qFlow_payload;
  wire                kFlow_valid;
  wire       [15:0]   kFlow_payload;
  wire                accIn_valid;
  wire                accIn_payload_last;
  wire       [15:0]   accIn_payload_fragment;
  reg        [6:0]    accInCnt;
  wire                accInCntOvf;

  fp16mul6 qIn_mul_ip (
    .aclk                 (clk_1_clk                           ), //i
    .s_axis_a_tvalid      (qIn_tvalid                          ), //i
    .s_axis_a_tdata       (qIn_tdata[15:0]                     ), //i
    .s_axis_b_tvalid      (sqrtD_valid                         ), //i
    .s_axis_b_tdata       (sqrtD_payload[15:0]                 ), //i
    .m_axis_result_tvalid (qIn_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (qIn_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  StreamFifo_78 fifo (
    .io_push_valid   (qIn_mul_ip_m_axis_result_tvalid     ), //i
    .io_push_ready   (fifo_io_push_ready                  ), //o
    .io_push_payload (qIn_mul_ip_m_axis_result_tdata[15:0]), //i
    .io_pop_valid    (fifo_io_pop_valid                   ), //o
    .io_pop_ready    (kFlow_valid                         ), //i
    .io_pop_payload  (fifo_io_pop_payload[15:0]           ), //o
    .io_flush        (1'b0                                ), //i
    .io_occupancy    (fifo_io_occupancy[7:0]              ), //o
    .io_availability (fifo_io_availability[7:0]           ), //o
    .clk_1_clk       (clk_1_clk                           ), //i
    .clk_1_resetn    (clk_1_resetn                        )  //i
  );
  fp16mul6 qFlow_mul_ip (
    .aclk                 (clk_1_clk                             ), //i
    .s_axis_a_tvalid      (qFlow_valid                           ), //i
    .s_axis_a_tdata       (qFlow_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (kFlow_valid                           ), //i
    .s_axis_b_tdata       (kFlow_payload[15:0]                   ), //i
    .m_axis_result_tvalid (qFlow_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (qFlow_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16acc16 accIn_acc_ip (
    .aclk                 (clk_1_clk                             ), //i
    .aresetn              (clk_1_resetn                          ), //i
    .s_axis_a_tvalid      (accIn_valid                           ), //i
    .s_axis_a_tlast       (accIn_payload_last                    ), //i
    .s_axis_a_tdata       (accIn_payload_fragment[15:0]          ), //i
    .m_axis_result_tvalid (accIn_acc_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tlast  (accIn_acc_ip_m_axis_result_tlast      ), //o
    .m_axis_result_tdata  (accIn_acc_ip_m_axis_result_tdata[15:0])  //o
  );
  assign qIn_tvalid = (io_input_valid && (io_input_tuser == 6'h08));
  assign qIn_tdata = io_input_tdata;
  assign qProbe_valid = ((qIn_tvalid && (inCnt == 7'h0)) && (headCnt == 5'h0));
  assign qProbe_payload = qIn_tdata;
  assign kInput_valid = (io_input_valid && (io_input_tuser == 6'h09));
  assign kInput_payload = io_input_tdata;
  assign sqrtD_payload = 16'h2da8;
  assign sqrtD_valid = 1'b1;
  assign qFlow_valid = kFlow_valid;
  assign qFlow_payload = fifo_io_pop_payload;
  assign kFlow_payload = kInput_payload;
  assign kFlow_valid = kInput_valid;
  assign accInCntOvf = (accInCnt == 7'h7f);
  assign accIn_valid = qFlow_mul_ip_m_axis_result_tvalid;
  assign accIn_payload_fragment = qFlow_mul_ip_m_axis_result_tdata;
  assign accIn_payload_last = accInCntOvf;
  assign io_output_valid = (accIn_acc_ip_m_axis_result_tvalid && accIn_acc_ip_m_axis_result_tlast);
  assign io_output_tdata = accIn_acc_ip_m_axis_result_tdata;
  assign io_output_tuser = 6'h0c;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      inCnt <= 7'h0;
      headCnt <= 5'h0;
      accInCnt <= 7'h0;
    end else begin
      if(qIn_tvalid) begin
        inCnt <= (inCnt + 7'h01);
        if((inCnt == 7'h7f)) begin
          inCnt <= 7'h0;
          headCnt <= (headCnt + 5'h01);
        end
      end
      if(qFlow_mul_ip_m_axis_result_tvalid) begin
        accInCnt <= (accInCnt + 7'h01);
        if(accInCntOvf) begin
          accInCnt <= 7'h0;
        end
      end
    end
  end


endmodule

