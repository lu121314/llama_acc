// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module RMSNormFp32 (
  input  wire          io_toBeNorm_valid,
  input  wire [15:0]   io_toBeNorm_payload,
  input  wire          io_scale_valid,
  output wire          io_scale_ready,
  input  wire [15:0]   io_scale_payload,
  output wire          io_normOut_valid,
  output wire [15:0]   io_normOut_payload,
  input  wire          isAttnLn,
  input  wire          isLmHeadLn,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                fifo_io_push_valid;
  wire                io_toBeNorm_to_ip_m_axis_result_tvalid;
  wire       [31:0]   io_toBeNorm_to_ip_m_axis_result_tdata;
  wire                rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tvalid;
  wire       [31:0]   rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tdata;
  wire                accIn_acc_ip_m_axis_result_tvalid;
  wire                accIn_acc_ip_m_axis_result_tlast;
  wire       [31:0]   accIn_acc_ip_m_axis_result_tdata;
  wire                ipFlowIO_m_axis_result_tvalid;
  wire       [31:0]   ipFlowIO_m_axis_result_tdata;
  wire                rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tvalid;
  wire       [31:0]   rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tdata;
  wire                rsqrtIn_rsqrt_ip_m_axis_result_tvalid;
  wire       [31:0]   rsqrtIn_rsqrt_ip_m_axis_result_tdata;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [15:0]   fifo_io_pop_payload;
  wire       [11:0]   fifo_io_occupancy;
  wire       [11:0]   fifo_io_availability;
  wire                inputFp32_mul_ip_s_axis_a_tready;
  wire                inputFp32_mul_ip_s_axis_b_tready;
  wire                inputFp32_mul_ip_m_axis_result_tvalid;
  wire       [31:0]   inputFp32_mul_ip_m_axis_result_tdata;
  wire                rmsNorm_fifo_io_pop_to_ip_s_axis_a_tready;
  wire                rmsNorm_fifo_io_pop_to_ip_m_axis_result_tvalid;
  wire       [31:0]   rmsNorm_fifo_io_pop_to_ip_m_axis_result_tdata;
  wire                io_scale_to_ip_s_axis_a_tready;
  wire                io_scale_to_ip_m_axis_result_tvalid;
  wire       [31:0]   io_scale_to_ip_m_axis_result_tdata;
  wire                scaledOutFlow_mul_ip_m_axis_result_tvalid;
  wire       [31:0]   scaledOutFlow_mul_ip_m_axis_result_tdata;
  wire                rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid;
  wire       [15:0]   rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tdata;
  reg        [11:0]   sqrCnt;
  wire                sqrCntOvf;
  wire                accIn_valid;
  wire                accIn_payload_last;
  wire       [31:0]   accIn_payload_fragment;
  wire                accOut_valid;
  wire                accOut_payload_last;
  wire       [31:0]   accOut_payload_fragment;
  wire                rsqrtIn_valid;
  wire       [31:0]   rsqrtIn_payload;
  wire                t_s_axis_a_tvalid;
  reg                 rsqrtOutLock_valid;
  reg        [31:0]   rsqrtOutLock_payload;
  reg        [0:0]    coreCnt;
  reg        [10:0]   dimPerCoreCnt;
  wire                inputFp32_valid;
  wire                inputFp32_ready;
  wire       [31:0]   inputFp32_payload;
  wire                scaleFp32_valid;
  wire                scaleFp32_ready;
  wire       [31:0]   scaleFp32_payload;
  wire                enRsqrtCnt;
  reg        [11:0]   rsqrtCnt;
  wire                rsqrtCntOvf;
  wire                scaledOutFlow_valid;
  wire       [31:0]   scaledOutFlow_payload;
  wire                scaledOutFire;

  fp16toFp32 io_toBeNorm_to_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (io_toBeNorm_valid                          ), //i
    .s_axis_a_tdata       (io_toBeNorm_payload[15:0]                  ), //i
    .m_axis_result_tvalid (io_toBeNorm_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (io_toBeNorm_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32mul8 rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip (
    .aclk                 (clk_1_clk                                                               ), //i
    .s_axis_a_tvalid      (io_toBeNorm_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (io_toBeNorm_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .s_axis_b_tvalid      (io_toBeNorm_to_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_b_tdata       (io_toBeNorm_to_ip_m_axis_result_tdata[31:0]                             ), //i
    .m_axis_result_tvalid (rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32acc22 accIn_acc_ip (
    .aclk                 (clk_1_clk                             ), //i
    .aresetn              (clk_1_resetn                          ), //i
    .s_axis_a_tvalid      (accIn_valid                           ), //i
    .s_axis_a_tlast       (accIn_payload_last                    ), //i
    .s_axis_a_tdata       (accIn_payload_fragment[31:0]          ), //i
    .m_axis_result_tvalid (accIn_acc_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tlast  (accIn_acc_ip_m_axis_result_tlast      ), //o
    .m_axis_result_tdata  (accIn_acc_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32mul8 ipFlowIO (
    .aclk                 (clk_1_clk                         ), //i
    .s_axis_a_tvalid      (t_s_axis_a_tvalid                 ), //i
    .s_axis_a_tdata       (accOut_payload_fragment[31:0]     ), //i
    .s_axis_b_tvalid      (t_s_axis_a_tvalid                 ), //i
    .s_axis_b_tdata       (32'h39aaaaab                      ), //i
    .m_axis_result_tvalid (ipFlowIO_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (ipFlowIO_m_axis_result_tdata[31:0])  //o
  );
  fp32add11 rmsNorm_ipFlowIO_m_axis_result_add_ip (
    .aclk                 (clk_1_clk                                                      ), //i
    .s_axis_a_tvalid      (ipFlowIO_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (ipFlowIO_m_axis_result_tdata[31:0]                             ), //i
    .s_axis_b_tvalid      (ipFlowIO_m_axis_result_tvalid                                  ), //i
    .s_axis_b_tdata       (32'h3727c5ac                                                   ), //i
    .m_axis_result_tvalid (rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32rsqrt32 rsqrtIn_rsqrt_ip (
    .aclk                 (clk_1_clk                                 ), //i
    .s_axis_a_tvalid      (rsqrtIn_valid                             ), //i
    .s_axis_a_tdata       (rsqrtIn_payload[31:0]                     ), //i
    .m_axis_result_tvalid (rsqrtIn_rsqrt_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (rsqrtIn_rsqrt_ip_m_axis_result_tdata[31:0])  //o
  );
  StreamFifo_76 fifo (
    .io_push_valid   (fifo_io_push_valid                       ), //i
    .io_push_ready   (fifo_io_push_ready                       ), //o
    .io_push_payload (io_toBeNorm_payload[15:0]                ), //i
    .io_pop_valid    (fifo_io_pop_valid                        ), //o
    .io_pop_ready    (rmsNorm_fifo_io_pop_to_ip_s_axis_a_tready), //i
    .io_pop_payload  (fifo_io_pop_payload[15:0]                ), //o
    .io_flush        (1'b0                                     ), //i
    .io_occupancy    (fifo_io_occupancy[11:0]                  ), //o
    .io_availability (fifo_io_availability[11:0]               ), //o
    .clk_1_clk       (clk_1_clk                                ), //i
    .clk_1_resetn    (clk_1_resetn                             )  //i
  );
  fp32mul8s inputFp32_mul_ip (
    .aclk                 (clk_1_clk                                 ), //i
    .s_axis_a_tvalid      (inputFp32_valid                           ), //i
    .s_axis_a_tready      (inputFp32_mul_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (inputFp32_payload[31:0]                   ), //i
    .s_axis_b_tvalid      (scaleFp32_valid                           ), //i
    .s_axis_b_tready      (inputFp32_mul_ip_s_axis_b_tready          ), //o
    .s_axis_b_tdata       (scaleFp32_payload[31:0]                   ), //i
    .m_axis_result_tvalid (inputFp32_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (rsqrtOutLock_valid                        ), //i
    .m_axis_result_tdata  (inputFp32_mul_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32s rmsNorm_fifo_io_pop_to_ip (
    .aclk                 (clk_1_clk                                          ), //i
    .s_axis_a_tvalid      (fifo_io_pop_valid                                  ), //i
    .s_axis_a_tready      (rmsNorm_fifo_io_pop_to_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (fifo_io_pop_payload[15:0]                          ), //i
    .m_axis_result_tvalid (rmsNorm_fifo_io_pop_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (inputFp32_ready                                    ), //i
    .m_axis_result_tdata  (rmsNorm_fifo_io_pop_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32s io_scale_to_ip (
    .aclk                 (clk_1_clk                               ), //i
    .s_axis_a_tvalid      (io_scale_valid                          ), //i
    .s_axis_a_tready      (io_scale_to_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (io_scale_payload[15:0]                  ), //i
    .m_axis_result_tvalid (io_scale_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (scaleFp32_ready                         ), //i
    .m_axis_result_tdata  (io_scale_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32mul8 scaledOutFlow_mul_ip (
    .aclk                 (clk_1_clk                                     ), //i
    .s_axis_a_tvalid      (scaledOutFlow_valid                           ), //i
    .s_axis_a_tdata       (scaledOutFlow_payload[31:0]                   ), //i
    .s_axis_b_tvalid      (rsqrtOutLock_valid                            ), //i
    .s_axis_b_tdata       (rsqrtOutLock_payload[31:0]                    ), //i
    .m_axis_result_tvalid (scaledOutFlow_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (scaledOutFlow_mul_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32toFp16 rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip (
    .aclk                 (clk_1_clk                                                                 ), //i
    .s_axis_a_tvalid      (scaledOutFlow_mul_ip_m_axis_result_tvalid                                 ), //i
    .s_axis_a_tdata       (scaledOutFlow_mul_ip_m_axis_result_tdata[31:0]                            ), //i
    .m_axis_result_tvalid (rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tdata[15:0])  //o
  );
  assign sqrCntOvf = (sqrCnt == 12'hbff);
  assign accIn_valid = rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tvalid;
  assign accIn_payload_fragment = rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tdata;
  assign accIn_payload_last = sqrCntOvf;
  assign accOut_valid = accIn_acc_ip_m_axis_result_tvalid;
  assign accOut_payload_last = accIn_acc_ip_m_axis_result_tlast;
  assign accOut_payload_fragment = accIn_acc_ip_m_axis_result_tdata;
  assign t_s_axis_a_tvalid = (accOut_valid && accOut_payload_last);
  assign rsqrtIn_valid = rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tvalid;
  assign rsqrtIn_payload = rmsNorm_ipFlowIO_m_axis_result_add_ip_m_axis_result_tdata;
  assign fifo_io_push_valid = (io_toBeNorm_valid && (isAttnLn ? 1'b1 : (isLmHeadLn ? (coreCnt == 1'b0) : (coreCnt == 1'b1))));
  assign inputFp32_ready = inputFp32_mul_ip_s_axis_a_tready;
  assign scaleFp32_ready = inputFp32_mul_ip_s_axis_b_tready;
  assign inputFp32_valid = rmsNorm_fifo_io_pop_to_ip_m_axis_result_tvalid;
  assign inputFp32_payload = rmsNorm_fifo_io_pop_to_ip_m_axis_result_tdata;
  assign io_scale_ready = io_scale_to_ip_s_axis_a_tready;
  assign scaleFp32_valid = io_scale_to_ip_m_axis_result_tvalid;
  assign scaleFp32_payload = io_scale_to_ip_m_axis_result_tdata;
  assign rsqrtCntOvf = (rsqrtCnt == (isAttnLn ? 12'hbff : 12'h5ff));
  assign scaledOutFire = (inputFp32_mul_ip_m_axis_result_tvalid && rsqrtOutLock_valid);
  assign scaledOutFlow_valid = scaledOutFire;
  assign scaledOutFlow_payload = inputFp32_mul_ip_m_axis_result_tdata;
  assign enRsqrtCnt = scaledOutFire;
  assign io_normOut_valid = rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid;
  assign io_normOut_payload = rmsNorm_scaledOutFlow_mul_ip_m_axis_result_to_ip_m_axis_result_tdata;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      sqrCnt <= 12'h0;
      rsqrtOutLock_valid <= 1'b0;
      coreCnt <= 1'b0;
      dimPerCoreCnt <= 11'h0;
      rsqrtCnt <= 12'h0;
    end else begin
      if(rmsNorm_io_toBeNorm_to_ip_m_axis_result_mul_ip_m_axis_result_tvalid) begin
        sqrCnt <= (sqrCnt + 12'h001);
        if(sqrCntOvf) begin
          sqrCnt <= 12'h0;
        end
      end
      if(rsqrtIn_rsqrt_ip_m_axis_result_tvalid) begin
        rsqrtOutLock_valid <= 1'b1;
      end
      if(io_toBeNorm_valid) begin
        dimPerCoreCnt <= (dimPerCoreCnt + 11'h001);
        if((dimPerCoreCnt == 11'h5ff)) begin
          dimPerCoreCnt <= 11'h0;
          coreCnt <= (coreCnt + 1'b1);
          if((coreCnt == 1'b1)) begin
            coreCnt <= 1'b0;
          end
        end
      end
      if(enRsqrtCnt) begin
        rsqrtCnt <= (rsqrtCnt + 12'h001);
        if(rsqrtCntOvf) begin
          rsqrtCnt <= 12'h0;
          rsqrtOutLock_valid <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(rsqrtIn_rsqrt_ip_m_axis_result_tvalid) begin
      rsqrtOutLock_payload <= rsqrtIn_rsqrt_ip_m_axis_result_tdata;
    end
  end


endmodule

