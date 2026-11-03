// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SerialSafeSoftmax_1 (
  input  wire          io_input_0_valid,
  input  wire [15:0]   io_input_0_tdata,
  input  wire [5:0]    io_input_0_tuser,
  input  wire          io_input_1_valid,
  input  wire [15:0]   io_input_1_tdata,
  input  wire [5:0]    io_input_1_tuser,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [15:0]   io_output_payload_tdata,
  output wire [5:0]    io_output_payload_tuser,
  input  wire          io_seqLen_valid,
  output reg           io_seqLen_ready,
  input  wire [12:0]   io_seqLen_payload,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                fifo_io_push_valid;
  wire       [15:0]   fifo_io_push_payload;
  wire                fifo_io_pop_ready;
  wire                ipFlowIO_m_axis_result_tvalid;
  wire       [7:0]    ipFlowIO_m_axis_result_tdata;
  wire                toSubFlow_sub_ip_m_axis_result_tvalid;
  wire       [15:0]   toSubFlow_sub_ip_m_axis_result_tdata;
  wire                ipFlowIO_1_m_axis_result_tvalid;
  wire       [7:0]    ipFlowIO_1_m_axis_result_tdata;
  wire                toExpClip_exp_ip_m_axis_result_tvalid;
  wire       [15:0]   toExpClip_exp_ip_m_axis_result_tdata;
  wire                accIn_acc_ip_m_axis_result_tvalid;
  wire                accIn_acc_ip_m_axis_result_tlast;
  wire       [15:0]   accIn_acc_ip_m_axis_result_tdata;
  wire                toDivFlow_regNext_div_ip_m_axis_result_tvalid;
  wire       [15:0]   toDivFlow_regNext_div_ip_m_axis_result_tdata;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [15:0]   fifo_io_pop_payload;
  wire       [13:0]   fifo_io_occupancy;
  wire       [13:0]   fifo_io_availability;
  wire       [15:0]   fp16Minus16Bits;
  wire                localQKIn_valid;
  wire       [15:0]   localQKIn_payload;
  wire                dotQKIn_valid;
  wire       [15:0]   dotQKIn_payload;
  wire                muxOut_valid;
  wire       [15:0]   muxOut_payload;
  reg                 input_valid;
  reg        [15:0]   input_payload;
  reg        [12:0]   inCnt;
  wire                inCntZero;
  wire                inCntOvf;
  reg                 maxValFlow_valid;
  reg        [15:0]   maxValFlow_payload;
  wire                toSubFlow_valid;
  wire       [15:0]   toSubFlow_payload;
  wire                toExpClip_valid;
  reg        [15:0]   toExpClip_payload;
  wire                accIn_valid;
  wire                accIn_payload_last;
  wire       [15:0]   accIn_payload_fragment;
  reg        [12:0]   accInCnt;
  wire                accInCntOvf;
  reg                 normFlow_valid;
  reg        [15:0]   normFlow_payload;
  wire                toDivFlow_valid;
  wire       [15:0]   toDivFlow_payload;
  reg                 toDivFlow_regNext_valid;
  reg        [15:0]   toDivFlow_regNext_payload;
  reg                 normFlow_regNext_valid;
  reg        [15:0]   normFlow_regNext_payload;
  reg        [12:0]   outCnt;
  wire                outCntOvf;
  wire       [16:0]   t_normFlow_valid;
  reg        [12:0]   subCnt;
  wire                subCntOvf;
  reg                 phase0;
  reg                 phase1;
  wire                conflict;

  fp16lt0 ipFlowIO (
    .s_axis_a_tvalid      (1'b1                             ), //i
    .s_axis_a_tdata       (maxValFlow_payload[15:0]         ), //i
    .s_axis_b_tvalid      (1'b1                             ), //i
    .s_axis_b_tdata       (input_payload[15:0]              ), //i
    .m_axis_result_tvalid (ipFlowIO_m_axis_result_tvalid    ), //o
    .m_axis_result_tdata  (ipFlowIO_m_axis_result_tdata[7:0])  //o
  );
  fp16sub8 toSubFlow_sub_ip (
    .aclk                 (clk_0_clk                                 ), //i
    .s_axis_a_tvalid      (toSubFlow_valid                           ), //i
    .s_axis_a_tdata       (toSubFlow_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (maxValFlow_valid                          ), //i
    .s_axis_b_tdata       (maxValFlow_payload[15:0]                  ), //i
    .m_axis_result_tvalid (toSubFlow_sub_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (toSubFlow_sub_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16lt0 ipFlowIO_1 (
    .s_axis_a_tvalid      (1'b1                                      ), //i
    .s_axis_a_tdata       (toSubFlow_sub_ip_m_axis_result_tdata[15:0]), //i
    .s_axis_b_tvalid      (1'b1                                      ), //i
    .s_axis_b_tdata       (fp16Minus16Bits[15:0]                     ), //i
    .m_axis_result_tvalid (ipFlowIO_1_m_axis_result_tvalid           ), //o
    .m_axis_result_tdata  (ipFlowIO_1_m_axis_result_tdata[7:0]       )  //o
  );
  fp16ex12 toExpClip_exp_ip (
    .aclk                 (clk_0_clk                                 ), //i
    .s_axis_a_tvalid      (toExpClip_valid                           ), //i
    .s_axis_a_tdata       (toExpClip_payload[15:0]                   ), //i
    .m_axis_result_tvalid (toExpClip_exp_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (toExpClip_exp_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16acc16 accIn_acc_ip (
    .aclk                 (clk_0_clk                             ), //i
    .aresetn              (clk_0_resetn                          ), //i
    .s_axis_a_tvalid      (accIn_valid                           ), //i
    .s_axis_a_tlast       (accIn_payload_last                    ), //i
    .s_axis_a_tdata       (accIn_payload_fragment[15:0]          ), //i
    .m_axis_result_tvalid (accIn_acc_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tlast  (accIn_acc_ip_m_axis_result_tlast      ), //o
    .m_axis_result_tdata  (accIn_acc_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16div12 toDivFlow_regNext_div_ip (
    .aclk                 (clk_0_clk                                         ), //i
    .s_axis_a_tvalid      (toDivFlow_regNext_valid                           ), //i
    .s_axis_a_tdata       (toDivFlow_regNext_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (normFlow_regNext_valid                            ), //i
    .s_axis_b_tdata       (normFlow_regNext_payload[15:0]                    ), //i
    .m_axis_result_tvalid (toDivFlow_regNext_div_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (toDivFlow_regNext_div_ip_m_axis_result_tdata[15:0])  //o
  );
  StreamFifo_111 fifo (
    .io_push_valid   (fifo_io_push_valid        ), //i
    .io_push_ready   (fifo_io_push_ready        ), //o
    .io_push_payload (fifo_io_push_payload[15:0]), //i
    .io_pop_valid    (fifo_io_pop_valid         ), //o
    .io_pop_ready    (fifo_io_pop_ready         ), //i
    .io_pop_payload  (fifo_io_pop_payload[15:0] ), //o
    .io_flush        (1'b0                      ), //i
    .io_occupancy    (fifo_io_occupancy[13:0]   ), //o
    .io_availability (fifo_io_availability[13:0]), //o
    .clk_0_clk       (clk_0_clk                 ), //i
    .clk_0_resetn    (clk_0_resetn              )  //i
  );
  assign fp16Minus16Bits = 16'hcc00;
  assign localQKIn_valid = (io_input_1_valid && (io_input_1_tuser == 6'h0c));
  assign localQKIn_payload = io_input_1_tdata;
  assign dotQKIn_valid = (io_input_0_valid && (io_input_0_tuser == 6'h0d));
  assign dotQKIn_payload = io_input_0_tdata;
  assign muxOut_valid = (|{dotQKIn_valid,localQKIn_valid});
  assign muxOut_payload = (localQKIn_valid ? localQKIn_payload : dotQKIn_payload);
  assign inCntZero = (inCnt == 13'h0);
  assign inCntOvf = (inCnt == io_seqLen_payload);
  assign toExpClip_valid = toSubFlow_sub_ip_m_axis_result_tvalid;
  always @(*) begin
    toExpClip_payload = toSubFlow_sub_ip_m_axis_result_tdata;
    if(ipFlowIO_1_m_axis_result_tdata[0]) begin
      toExpClip_payload = fp16Minus16Bits;
    end
  end

  assign accInCntOvf = (accInCnt == io_seqLen_payload);
  assign accIn_valid = toExpClip_exp_ip_m_axis_result_tvalid;
  assign accIn_payload_fragment = toExpClip_exp_ip_m_axis_result_tdata;
  assign accIn_payload_last = accInCntOvf;
  assign io_output_valid = toDivFlow_regNext_div_ip_m_axis_result_tvalid;
  assign io_output_payload_tdata = toDivFlow_regNext_div_ip_m_axis_result_tdata;
  assign io_output_payload_tuser = 6'h0e;
  always @(*) begin
    io_seqLen_ready = 1'b0;
    if(io_output_valid) begin
      if(outCntOvf) begin
        io_seqLen_ready = 1'b1;
      end
    end
  end

  assign outCntOvf = (outCnt == io_seqLen_payload);
  assign t_normFlow_valid = 17'h0;
  assign io_output_payload_last = outCntOvf;
  assign subCntOvf = (subCnt == io_seqLen_payload);
  assign conflict = (input_valid && accIn_valid);
  assign fifo_io_push_valid = (input_valid || accIn_valid);
  assign fifo_io_push_payload = (input_valid ? input_payload : accIn_payload_fragment);
  assign toSubFlow_valid = (fifo_io_pop_valid && phase1);
  assign toSubFlow_payload = fifo_io_pop_payload;
  assign toDivFlow_valid = (fifo_io_pop_valid && normFlow_valid);
  assign toDivFlow_payload = fifo_io_pop_payload;
  assign fifo_io_pop_ready = (phase1 ? phase1 : normFlow_valid);
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      input_valid <= 1'b0;
      inCnt <= 13'h0;
      maxValFlow_payload <= 16'hfc00;
      maxValFlow_valid <= 1'b0;
      accInCnt <= 13'h0;
      normFlow_valid <= 1'b0;
      normFlow_payload <= 16'h0;
      toDivFlow_regNext_valid <= 1'b0;
      normFlow_regNext_valid <= 1'b0;
      outCnt <= 13'h0;
      subCnt <= 13'h0;
      phase0 <= 1'b1;
      phase1 <= 1'b0;
    end else begin
      input_valid <= muxOut_valid;
      if(input_valid) begin
        inCnt <= (inCnt + 13'h0001);
        if(inCntOvf) begin
          inCnt <= 13'h0;
        end
      end
      if(input_valid) begin
        if(ipFlowIO_m_axis_result_tdata[0]) begin
          maxValFlow_payload <= input_payload;
        end
        if(inCntOvf) begin
          maxValFlow_valid <= 1'b1;
        end
      end
      if(accIn_valid) begin
        accInCnt <= (accInCnt + 13'h0001);
        if(accInCntOvf) begin
          accInCnt <= 13'h0;
        end
      end
      if((accIn_acc_ip_m_axis_result_tvalid && accIn_acc_ip_m_axis_result_tlast)) begin
        normFlow_valid <= 1'b1;
        normFlow_payload <= accIn_acc_ip_m_axis_result_tdata;
      end
      toDivFlow_regNext_valid <= toDivFlow_valid;
      normFlow_regNext_valid <= normFlow_valid;
      if(io_output_valid) begin
        outCnt <= (outCnt + 13'h0001);
        if(outCntOvf) begin
          outCnt <= 13'h0;
          maxValFlow_valid <= 1'b0;
          maxValFlow_payload <= 16'hfc00;
          normFlow_valid <= t_normFlow_valid[0];
          normFlow_payload <= t_normFlow_valid[16 : 1];
        end
      end
      if(toSubFlow_valid) begin
        subCnt <= (subCnt + 13'h0001);
        if(subCntOvf) begin
          subCnt <= 13'h0;
        end
      end
      if(input_valid) begin
        if(inCntOvf) begin
          phase0 <= 1'b0;
          phase1 <= 1'b1;
        end
      end
      if(toSubFlow_valid) begin
        if(subCntOvf) begin
          phase1 <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk_0_clk) begin
    input_payload <= muxOut_payload;
    toDivFlow_regNext_payload <= toDivFlow_payload;
    normFlow_regNext_payload <= normFlow_payload;
  end


endmodule

