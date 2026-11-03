// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module UGMul (
  input  wire          predIndexIn_valid,
  input  wire          predIndexIn_payload_last,
  input  wire [15:0]   predIndexIn_payload_tdata,
  input  wire [5:0]    predIndexIn_payload_tuser,
  output wire          gateIndexOut_valid,
  output wire          gateIndexOut_payload_last,
  output wire [15:0]   gateIndexOut_payload_tdata,
  output wire [5:0]    gateIndexOut_payload_tuser,
  output wire          ugIndexOut_valid,
  output wire          ugIndexOut_payload_last,
  output wire [15:0]   ugIndexOut_payload_tdata,
  output wire [5:0]    ugIndexOut_payload_tuser,
  input  wire          allReduceOut_valid,
  input  wire [15:0]   allReduceOut_tdata,
  input  wire [5:0]    allReduceOut_tuser,
  output wire          ugOut_tvalid,
  output wire          ugOut_tlast,
  output wire [15:0]   ugOut_tdata,
  output wire [5:0]    ugOut_tuser,
  input  wire          status_enPredictor,
  input  wire          status_enFatRelu,
  output wire          silu_to_valid,
  output wire [15:0]   silu_to_payload,
  input  wire          silu_from_valid,
  input  wire [15:0]   silu_from_payload,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                fifo_io_pop_ready;
  wire                gateFilterAlign_io_input_valid;
  wire                gateFilterAlign_io_input_payload_last;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire                fifo_io_pop_payload_last;
  wire       [15:0]   fifo_io_pop_payload_fragment;
  wire                threshold_lt_async_ip_m_axis_result_tvalid;
  wire       [7:0]    threshold_lt_async_ip_m_axis_result_tdata;
  wire                indexAlign_io_output_valid;
  wire                indexAlign_io_output_payload_last;
  wire       [15:0]   indexAlign_io_output_payload_tdata;
  wire       [5:0]    indexAlign_io_output_payload_tuser;
  wire                gateFilterAlign_io_output_valid;
  wire                gateFilterAlign_io_output_payload_last;
  wire       [15:0]   gateFilterAlign_io_output_payload_fragment;
  wire                u_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   u_mul_ip_m_axis_result_tdata;
  wire                ugIndexFifo_io_push_ready;
  wire                ugIndexFifo_io_pop_valid;
  wire                ugIndexFifo_io_pop_payload_last;
  wire       [15:0]   ugIndexFifo_io_pop_payload_fragment;
  wire       [15:0]   fp16SiLUThresholdBits;
  wire       [15:0]   fatReluBits;
  wire                indexIn_valid;
  wire       [15:0]   indexIn_payload;
  reg        [15:0]   indexCnt;
  reg        [15:0]   indexCntLock;
  wire                gateIn_tvalid;
  wire       [15:0]   gateIn_tdata;
  reg        [15:0]   gateCnt;
  wire                gateCntOvf;
  wire                threshold_valid;
  wire       [15:0]   threshold_payload;
  wire                cmpRes_valid;
  wire                cmpRes_payload;
  wire                zeroLtIn_valid;
  wire                zeroLtIn_payload;
  wire                indexOut_valid;
  wire                indexOut_payload_last;
  wire       [15:0]   indexOut_payload_tdata;
  wire       [5:0]    indexOut_payload_tuser;
  reg                 indexOut_regNext_valid;
  reg                 indexOut_regNext_payload_last;
  reg        [15:0]   indexOut_regNext_payload_tdata;
  reg        [5:0]    indexOut_regNext_payload_tuser;
  wire                gateFilter_valid;
  wire       [15:0]   gateFilter_payload;
  wire                actOut_valid;
  wire       [15:0]   actOut_payload;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_1;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_2;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_3;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_4;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_5;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_6;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_7;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_8;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_9;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_10;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_11;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_12;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_13;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_14;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_15;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_16;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_17;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_18;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_19;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_20;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_21;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_22;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_23;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_24;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_25;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_26;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_27;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_28;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_29;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_30;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_31;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_32;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_33;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_34;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_35;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_36;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_37;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_38;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_39;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_40;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_41;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_42;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_43;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_44;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_45;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_46;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_47;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_48;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_49;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_50;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_51;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_52;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_53;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_54;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_55;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_56;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_57;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_58;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_59;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_60;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_61;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_62;
  reg                 ug_gateFilterAlign_io_output_payload_last_delay_63;
  reg                 siluOutLast;
  wire                actOutLast;
  wire                u_tvalid;
  wire       [15:0]   u_tdata;
  wire                g_tvalid;
  wire       [15:0]   g_tdata;
  reg                 t_io_push_valid;
  reg                 t_io_push_payload_last;
  reg        [15:0]   t_io_push_payload_fragment;
  reg        [15:0]   ugLastIndexLock;
  reg                 gateIndexOut_valid_regNext;
  reg        [15:0]   gateIndexOut_payload_tdata_regNext;
  reg                 gateIndexOut_payload_last_regNext;
  wire                hit;
  wire                ug_ugIndexFifo_io_pop_fire;

  URAM16x16384Fifo_2 fifo (
    .io_push_valid            (t_io_push_valid                   ), //i
    .io_push_ready            (fifo_io_push_ready                ), //o
    .io_push_payload_last     (t_io_push_payload_last            ), //i
    .io_push_payload_fragment (t_io_push_payload_fragment[15:0]  ), //i
    .io_pop_valid             (fifo_io_pop_valid                 ), //o
    .io_pop_ready             (fifo_io_pop_ready                 ), //i
    .io_pop_payload_last      (fifo_io_pop_payload_last          ), //o
    .io_pop_payload_fragment  (fifo_io_pop_payload_fragment[15:0]), //o
    .clk_1_clk                (clk_1_clk                         ), //i
    .clk_1_resetn             (clk_1_resetn                      )  //i
  );
  fp16lt0 threshold_lt_async_ip (
    .s_axis_a_tvalid      (threshold_valid                               ), //i
    .s_axis_a_tdata       (threshold_payload[15:0]                       ), //i
    .s_axis_b_tvalid      (gateIn_tvalid                                 ), //i
    .s_axis_b_tdata       (gateIn_tdata[15:0]                            ), //i
    .m_axis_result_tvalid (threshold_lt_async_ip_m_axis_result_tvalid    ), //o
    .m_axis_result_tdata  (threshold_lt_async_ip_m_axis_result_tdata[7:0])  //o
  );
  FlowFragmentAlign indexAlign (
    .io_input_valid          (indexOut_regNext_valid                  ), //i
    .io_input_payload_last   (indexOut_regNext_payload_last           ), //i
    .io_input_payload_tdata  (indexOut_regNext_payload_tdata[15:0]    ), //i
    .io_input_payload_tuser  (indexOut_regNext_payload_tuser[5:0]     ), //i
    .io_output_valid         (indexAlign_io_output_valid              ), //o
    .io_output_payload_last  (indexAlign_io_output_payload_last       ), //o
    .io_output_payload_tdata (indexAlign_io_output_payload_tdata[15:0]), //o
    .io_output_payload_tuser (indexAlign_io_output_payload_tuser[5:0] ), //o
    .clk_1_clk               (clk_1_clk                               ), //i
    .clk_1_resetn            (clk_1_resetn                            )  //i
  );
  FlowFragmentAlign_1 gateFilterAlign (
    .io_input_valid             (gateFilterAlign_io_input_valid                  ), //i
    .io_input_payload_last      (gateFilterAlign_io_input_payload_last           ), //i
    .io_input_payload_fragment  (gateIn_tdata[15:0]                              ), //i
    .io_output_valid            (gateFilterAlign_io_output_valid                 ), //o
    .io_output_payload_last     (gateFilterAlign_io_output_payload_last          ), //o
    .io_output_payload_fragment (gateFilterAlign_io_output_payload_fragment[15:0]), //o
    .clk_1_clk                  (clk_1_clk                                       ), //i
    .clk_1_resetn               (clk_1_resetn                                    )  //i
  );
  fp16mul6 u_mul_ip (
    .aclk                 (clk_1_clk                         ), //i
    .s_axis_a_tvalid      (u_tvalid                          ), //i
    .s_axis_a_tdata       (u_tdata[15:0]                     ), //i
    .s_axis_b_tvalid      (g_tvalid                          ), //i
    .s_axis_b_tdata       (g_tdata[15:0]                     ), //i
    .m_axis_result_tvalid (u_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (u_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  URAM16x16384Fifo_2 ugIndexFifo (
    .io_push_valid            (gateIndexOut_valid_regNext               ), //i
    .io_push_ready            (ugIndexFifo_io_push_ready                ), //o
    .io_push_payload_last     (gateIndexOut_payload_last_regNext        ), //i
    .io_push_payload_fragment (gateIndexOut_payload_tdata_regNext[15:0] ), //i
    .io_pop_valid             (ugIndexFifo_io_pop_valid                 ), //o
    .io_pop_ready             (u_mul_ip_m_axis_result_tvalid            ), //i
    .io_pop_payload_last      (ugIndexFifo_io_pop_payload_last          ), //o
    .io_pop_payload_fragment  (ugIndexFifo_io_pop_payload_fragment[15:0]), //o
    .clk_1_clk                (clk_1_clk                                ), //i
    .clk_1_resetn             (clk_1_resetn                             )  //i
  );
  assign fp16SiLUThresholdBits = 16'hc900;
  assign fatReluBits = 16'h211f;
  assign indexIn_valid = (predIndexIn_valid && (predIndexIn_payload_tuser == 6'h1e));
  assign indexIn_payload = predIndexIn_payload_tdata;
  assign gateIn_tvalid = (allReduceOut_valid && (allReduceOut_tuser == 6'h16));
  assign gateIn_tdata = allReduceOut_tdata;
  assign gateCntOvf = (gateCnt == (status_enPredictor ? indexCntLock : 16'h1fff));
  assign threshold_valid = 1'b1;
  assign threshold_payload = fatReluBits;
  assign cmpRes_valid = threshold_lt_async_ip_m_axis_result_tvalid;
  assign cmpRes_payload = threshold_lt_async_ip_m_axis_result_tdata[0];
  assign zeroLtIn_valid = gateIn_tvalid;
  assign zeroLtIn_payload = (status_enFatRelu ? cmpRes_payload : 1'b1);
  assign indexOut_valid = (gateIn_tvalid && zeroLtIn_payload);
  assign indexOut_payload_tdata = (status_enPredictor ? fifo_io_pop_payload_fragment : gateCnt);
  assign indexOut_payload_tuser = 6'h17;
  assign indexOut_payload_last = (gateIn_tvalid && gateCntOvf);
  assign gateIndexOut_valid = indexAlign_io_output_valid;
  assign gateIndexOut_payload_last = indexAlign_io_output_payload_last;
  assign gateIndexOut_payload_tdata = indexAlign_io_output_payload_tdata;
  assign gateIndexOut_payload_tuser = indexAlign_io_output_payload_tuser;
  assign gateFilterAlign_io_input_valid = (gateIn_tvalid && zeroLtIn_payload);
  assign gateFilterAlign_io_input_payload_last = (gateIn_tvalid && gateCntOvf);
  assign gateFilter_valid = gateFilterAlign_io_output_valid;
  assign gateFilter_payload = gateFilterAlign_io_output_payload_fragment;
  assign silu_to_valid = gateFilter_valid;
  assign silu_to_payload = gateFilter_payload;
  assign actOut_valid = (status_enFatRelu ? gateFilter_valid : silu_from_valid);
  assign actOut_payload = (status_enFatRelu ? gateFilter_payload : silu_from_payload);
  assign actOutLast = (status_enFatRelu ? gateFilterAlign_io_output_payload_last : siluOutLast);
  assign u_tvalid = (allReduceOut_valid && (allReduceOut_tuser == 6'h18));
  assign u_tdata = allReduceOut_tdata;
  assign g_tvalid = u_tvalid;
  assign g_tdata = fifo_io_pop_payload_fragment;
  assign fifo_io_pop_ready = (u_tvalid || (status_enPredictor && gateIn_tvalid));
  assign ugOut_tvalid = u_mul_ip_m_axis_result_tvalid;
  assign ugOut_tdata = u_mul_ip_m_axis_result_tdata;
  assign ugOut_tuser = 6'h19;
  assign hit = (ugLastIndexLock == ugIndexFifo_io_pop_payload_fragment);
  assign ug_ugIndexFifo_io_pop_fire = (ugIndexFifo_io_pop_valid && u_mul_ip_m_axis_result_tvalid);
  assign ugIndexOut_valid = ug_ugIndexFifo_io_pop_fire;
  assign ugIndexOut_payload_tdata = ugIndexFifo_io_pop_payload_fragment;
  assign ugIndexOut_payload_tuser = 6'h1a;
  assign ugIndexOut_payload_last = hit;
  assign ugOut_tlast = hit;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      indexCnt <= 16'h0;
      indexCntLock <= 16'h0;
      gateCnt <= 16'h0;
      indexOut_regNext_valid <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_1 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_2 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_3 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_4 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_5 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_6 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_7 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_8 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_9 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_10 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_11 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_12 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_13 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_14 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_15 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_16 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_17 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_18 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_19 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_20 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_21 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_22 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_23 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_24 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_25 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_26 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_27 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_28 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_29 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_30 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_31 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_32 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_33 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_34 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_35 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_36 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_37 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_38 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_39 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_40 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_41 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_42 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_43 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_44 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_45 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_46 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_47 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_48 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_49 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_50 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_51 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_52 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_53 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_54 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_55 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_56 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_57 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_58 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_59 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_60 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_61 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_62 <= 1'b0;
      ug_gateFilterAlign_io_output_payload_last_delay_63 <= 1'b0;
      siluOutLast <= 1'b0;
      t_io_push_valid <= 1'b0;
      t_io_push_payload_last <= 1'b0;
      ugLastIndexLock <= 16'hffff;
      gateIndexOut_valid_regNext <= 1'b0;
      gateIndexOut_payload_last_regNext <= 1'b0;
    end else begin
      if(indexIn_valid) begin
        indexCnt <= (indexCnt + 16'h0001);
        if((indexIn_valid && predIndexIn_payload_last)) begin
          indexCntLock <= indexCnt;
          indexCnt <= 16'h0;
        end
      end
      if(gateIn_tvalid) begin
        gateCnt <= (gateCnt + 16'h0001);
        if(gateCntOvf) begin
          gateCnt <= 16'h0;
          indexCntLock <= 16'h0;
        end
      end
      indexOut_regNext_valid <= indexOut_valid;
      ug_gateFilterAlign_io_output_payload_last_delay_1 <= gateFilterAlign_io_output_payload_last;
      ug_gateFilterAlign_io_output_payload_last_delay_2 <= ug_gateFilterAlign_io_output_payload_last_delay_1;
      ug_gateFilterAlign_io_output_payload_last_delay_3 <= ug_gateFilterAlign_io_output_payload_last_delay_2;
      ug_gateFilterAlign_io_output_payload_last_delay_4 <= ug_gateFilterAlign_io_output_payload_last_delay_3;
      ug_gateFilterAlign_io_output_payload_last_delay_5 <= ug_gateFilterAlign_io_output_payload_last_delay_4;
      ug_gateFilterAlign_io_output_payload_last_delay_6 <= ug_gateFilterAlign_io_output_payload_last_delay_5;
      ug_gateFilterAlign_io_output_payload_last_delay_7 <= ug_gateFilterAlign_io_output_payload_last_delay_6;
      ug_gateFilterAlign_io_output_payload_last_delay_8 <= ug_gateFilterAlign_io_output_payload_last_delay_7;
      ug_gateFilterAlign_io_output_payload_last_delay_9 <= ug_gateFilterAlign_io_output_payload_last_delay_8;
      ug_gateFilterAlign_io_output_payload_last_delay_10 <= ug_gateFilterAlign_io_output_payload_last_delay_9;
      ug_gateFilterAlign_io_output_payload_last_delay_11 <= ug_gateFilterAlign_io_output_payload_last_delay_10;
      ug_gateFilterAlign_io_output_payload_last_delay_12 <= ug_gateFilterAlign_io_output_payload_last_delay_11;
      ug_gateFilterAlign_io_output_payload_last_delay_13 <= ug_gateFilterAlign_io_output_payload_last_delay_12;
      ug_gateFilterAlign_io_output_payload_last_delay_14 <= ug_gateFilterAlign_io_output_payload_last_delay_13;
      ug_gateFilterAlign_io_output_payload_last_delay_15 <= ug_gateFilterAlign_io_output_payload_last_delay_14;
      ug_gateFilterAlign_io_output_payload_last_delay_16 <= ug_gateFilterAlign_io_output_payload_last_delay_15;
      ug_gateFilterAlign_io_output_payload_last_delay_17 <= ug_gateFilterAlign_io_output_payload_last_delay_16;
      ug_gateFilterAlign_io_output_payload_last_delay_18 <= ug_gateFilterAlign_io_output_payload_last_delay_17;
      ug_gateFilterAlign_io_output_payload_last_delay_19 <= ug_gateFilterAlign_io_output_payload_last_delay_18;
      ug_gateFilterAlign_io_output_payload_last_delay_20 <= ug_gateFilterAlign_io_output_payload_last_delay_19;
      ug_gateFilterAlign_io_output_payload_last_delay_21 <= ug_gateFilterAlign_io_output_payload_last_delay_20;
      ug_gateFilterAlign_io_output_payload_last_delay_22 <= ug_gateFilterAlign_io_output_payload_last_delay_21;
      ug_gateFilterAlign_io_output_payload_last_delay_23 <= ug_gateFilterAlign_io_output_payload_last_delay_22;
      ug_gateFilterAlign_io_output_payload_last_delay_24 <= ug_gateFilterAlign_io_output_payload_last_delay_23;
      ug_gateFilterAlign_io_output_payload_last_delay_25 <= ug_gateFilterAlign_io_output_payload_last_delay_24;
      ug_gateFilterAlign_io_output_payload_last_delay_26 <= ug_gateFilterAlign_io_output_payload_last_delay_25;
      ug_gateFilterAlign_io_output_payload_last_delay_27 <= ug_gateFilterAlign_io_output_payload_last_delay_26;
      ug_gateFilterAlign_io_output_payload_last_delay_28 <= ug_gateFilterAlign_io_output_payload_last_delay_27;
      ug_gateFilterAlign_io_output_payload_last_delay_29 <= ug_gateFilterAlign_io_output_payload_last_delay_28;
      ug_gateFilterAlign_io_output_payload_last_delay_30 <= ug_gateFilterAlign_io_output_payload_last_delay_29;
      ug_gateFilterAlign_io_output_payload_last_delay_31 <= ug_gateFilterAlign_io_output_payload_last_delay_30;
      ug_gateFilterAlign_io_output_payload_last_delay_32 <= ug_gateFilterAlign_io_output_payload_last_delay_31;
      ug_gateFilterAlign_io_output_payload_last_delay_33 <= ug_gateFilterAlign_io_output_payload_last_delay_32;
      ug_gateFilterAlign_io_output_payload_last_delay_34 <= ug_gateFilterAlign_io_output_payload_last_delay_33;
      ug_gateFilterAlign_io_output_payload_last_delay_35 <= ug_gateFilterAlign_io_output_payload_last_delay_34;
      ug_gateFilterAlign_io_output_payload_last_delay_36 <= ug_gateFilterAlign_io_output_payload_last_delay_35;
      ug_gateFilterAlign_io_output_payload_last_delay_37 <= ug_gateFilterAlign_io_output_payload_last_delay_36;
      ug_gateFilterAlign_io_output_payload_last_delay_38 <= ug_gateFilterAlign_io_output_payload_last_delay_37;
      ug_gateFilterAlign_io_output_payload_last_delay_39 <= ug_gateFilterAlign_io_output_payload_last_delay_38;
      ug_gateFilterAlign_io_output_payload_last_delay_40 <= ug_gateFilterAlign_io_output_payload_last_delay_39;
      ug_gateFilterAlign_io_output_payload_last_delay_41 <= ug_gateFilterAlign_io_output_payload_last_delay_40;
      ug_gateFilterAlign_io_output_payload_last_delay_42 <= ug_gateFilterAlign_io_output_payload_last_delay_41;
      ug_gateFilterAlign_io_output_payload_last_delay_43 <= ug_gateFilterAlign_io_output_payload_last_delay_42;
      ug_gateFilterAlign_io_output_payload_last_delay_44 <= ug_gateFilterAlign_io_output_payload_last_delay_43;
      ug_gateFilterAlign_io_output_payload_last_delay_45 <= ug_gateFilterAlign_io_output_payload_last_delay_44;
      ug_gateFilterAlign_io_output_payload_last_delay_46 <= ug_gateFilterAlign_io_output_payload_last_delay_45;
      ug_gateFilterAlign_io_output_payload_last_delay_47 <= ug_gateFilterAlign_io_output_payload_last_delay_46;
      ug_gateFilterAlign_io_output_payload_last_delay_48 <= ug_gateFilterAlign_io_output_payload_last_delay_47;
      ug_gateFilterAlign_io_output_payload_last_delay_49 <= ug_gateFilterAlign_io_output_payload_last_delay_48;
      ug_gateFilterAlign_io_output_payload_last_delay_50 <= ug_gateFilterAlign_io_output_payload_last_delay_49;
      ug_gateFilterAlign_io_output_payload_last_delay_51 <= ug_gateFilterAlign_io_output_payload_last_delay_50;
      ug_gateFilterAlign_io_output_payload_last_delay_52 <= ug_gateFilterAlign_io_output_payload_last_delay_51;
      ug_gateFilterAlign_io_output_payload_last_delay_53 <= ug_gateFilterAlign_io_output_payload_last_delay_52;
      ug_gateFilterAlign_io_output_payload_last_delay_54 <= ug_gateFilterAlign_io_output_payload_last_delay_53;
      ug_gateFilterAlign_io_output_payload_last_delay_55 <= ug_gateFilterAlign_io_output_payload_last_delay_54;
      ug_gateFilterAlign_io_output_payload_last_delay_56 <= ug_gateFilterAlign_io_output_payload_last_delay_55;
      ug_gateFilterAlign_io_output_payload_last_delay_57 <= ug_gateFilterAlign_io_output_payload_last_delay_56;
      ug_gateFilterAlign_io_output_payload_last_delay_58 <= ug_gateFilterAlign_io_output_payload_last_delay_57;
      ug_gateFilterAlign_io_output_payload_last_delay_59 <= ug_gateFilterAlign_io_output_payload_last_delay_58;
      ug_gateFilterAlign_io_output_payload_last_delay_60 <= ug_gateFilterAlign_io_output_payload_last_delay_59;
      ug_gateFilterAlign_io_output_payload_last_delay_61 <= ug_gateFilterAlign_io_output_payload_last_delay_60;
      ug_gateFilterAlign_io_output_payload_last_delay_62 <= ug_gateFilterAlign_io_output_payload_last_delay_61;
      ug_gateFilterAlign_io_output_payload_last_delay_63 <= ug_gateFilterAlign_io_output_payload_last_delay_62;
      siluOutLast <= ug_gateFilterAlign_io_output_payload_last_delay_63;
      t_io_push_valid <= (actOut_valid || indexIn_valid);
      t_io_push_payload_last <= ((actOut_valid && actOutLast) || (indexIn_valid && predIndexIn_payload_last));
      if((gateIndexOut_valid && gateIndexOut_payload_last)) begin
        ugLastIndexLock <= gateIndexOut_payload_tdata;
      end
      if((ugIndexOut_valid && ugIndexOut_payload_last)) begin
        ugLastIndexLock <= 16'hffff;
      end
      gateIndexOut_valid_regNext <= gateIndexOut_valid;
      gateIndexOut_payload_last_regNext <= gateIndexOut_payload_last;
    end
  end

  always @(posedge clk_1_clk) begin
    indexOut_regNext_payload_last <= indexOut_payload_last;
    indexOut_regNext_payload_tdata <= indexOut_payload_tdata;
    indexOut_regNext_payload_tuser <= indexOut_payload_tuser;
    t_io_push_payload_fragment <= (actOut_valid ? actOut_payload : indexIn_payload);
    gateIndexOut_payload_tdata_regNext <= gateIndexOut_payload_tdata;
  end


endmodule

