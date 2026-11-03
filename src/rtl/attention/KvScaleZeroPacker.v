// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module KvScaleZeroPacker (
  input  wire          io_qScale_valid,
  input  wire [15:0]   io_qScale_payload,
  input  wire          io_qZero_valid,
  input  wire [7:0]    io_qZero_payload,
  input  wire          io_qOut_valid,
  input  wire          io_qOut_payload_last,
  input  wire [7:0]    io_qOut_payload_fragment,
  output wire          io_kvBus_valid,
  input  wire          io_kvBus_ready,
  output wire          io_kvBus_payload_last,
  output wire [511:0]  io_kvBus_payload_fragment,
  output wire          io_kSzOut_valid,
  input  wire          io_kSzOut_ready,
  output wire [31:0]   io_kSzOut_payload,
  output wire          io_vSzOut_valid,
  input  wire          io_vSzOut_ready,
  output wire [31:0]   io_vSzOut_payload,
  input  wire          io_nextLayer,
  input  wire          io_tokenIndexFlow_valid,
  input  wire [5:0]    io_tokenIndexFlow_payload,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  reg                 k_prefillIn_fifo_io_pop_ready;
  wire                k_fifo_io_push_valid;
  reg                 k_fifo_io_pop_ready;
  reg                 v_prefillIn_fifo_io_pop_ready;
  wire                v_fifo_io_push_valid;
  reg                 v_fifo_io_pop_ready;
  wire                k_prefillIn_fifo_io_push_ready;
  wire                k_prefillIn_fifo_io_pop_valid;
  wire                k_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    k_prefillIn_fifo_io_occupancy;
  wire       [6:0]    k_prefillIn_fifo_io_availability;
  wire                k_fifo_io_push_ready;
  wire                k_fifo_io_pop_valid;
  wire       [511:0]  k_fifo_io_pop_payload;
  wire                v_prefillIn_fifo_io_push_ready;
  wire                v_prefillIn_fifo_io_pop_valid;
  wire                v_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    v_prefillIn_fifo_io_occupancy;
  wire       [6:0]    v_prefillIn_fifo_io_availability;
  wire                v_fifo_io_push_ready;
  wire                v_fifo_io_pop_valid;
  wire       [511:0]  v_fifo_io_pop_payload;
  wire                busFifo_io_push_ready;
  wire                busFifo_io_pop_valid;
  wire                busFifo_io_pop_payload_last;
  wire       [511:0]  busFifo_io_pop_payload_fragment;
  wire       [5:0]    busFifo_io_occupancy;
  wire       [5:0]    busFifo_io_availability;
  wire                busMux_io_inputs_0_ready;
  wire                busMux_io_inputs_1_ready;
  wire                busMux_io_inputs_2_ready;
  wire                busMux_io_output_valid;
  wire                busMux_io_output_payload_last;
  wire       [511:0]  busMux_io_output_payload_fragment;
  wire       [4:0]    t_kScale_payload;
  wire       [5:0]    t_kScale_payload_1;
  wire       [4:0]    t_vScale_payload;
  wire       [5:0]    t_vScale_payload_1;
  wire       [3:0]    t_k_outCntOvf;
  wire                t_when;
  reg        [31:0]   t_k_sOut_payload;
  wire       [3:0]    t_v_outCntOvf;
  wire                t_when_1;
  reg        [31:0]   t_v_sOut_payload;
  wire       [383:0]  t_qOutAdapt_64;
  wire       [255:0]  t_qOutAdapt_65;
  wire       [127:0]  t_qOutAdapt_66;
  wire                t_when_2;
  wire                t_when_3;
  reg                 scaleIsV;
  reg                 zeroIsV;
  wire                kScale_valid;
  reg                 kScale_ready;
  wire       [15:0]   kScale_payload;
  wire                kScalePipe_valid;
  wire                kScalePipe_ready;
  wire       [15:0]   kScalePipe_payload;
  reg                 kScale_rValid;
  reg        [15:0]   kScale_rData;
  wire                kZero_valid;
  reg                 kZero_ready;
  wire       [7:0]    kZero_payload;
  wire                kZeroPipe_valid;
  wire                kZeroPipe_ready;
  wire       [7:0]    kZeroPipe_payload;
  reg                 kZero_rValid;
  reg        [7:0]    kZero_rData;
  wire                vScale_valid;
  reg                 vScale_ready;
  wire       [15:0]   vScale_payload;
  wire                vScalePipe_valid;
  wire                vScalePipe_ready;
  wire       [15:0]   vScalePipe_payload;
  reg                 vScale_rValid;
  reg        [15:0]   vScale_rData;
  wire                vZero_valid;
  reg                 vZero_ready;
  wire       [7:0]    vZero_payload;
  wire                vZeroPipe_valid;
  wire                vZeroPipe_ready;
  wire       [7:0]    vZeroPipe_payload;
  reg                 vZero_rValid;
  reg        [7:0]    vZero_rData;
  wire                kJoinEvent_valid;
  wire                kJoinEvent_ready;
  wire                kJoinEvent_fire;
  wire                kSz_valid;
  wire                kSz_ready;
  wire       [31:0]   kSz_payload;
  wire                vJoinEvent_valid;
  wire                vJoinEvent_ready;
  wire                vJoinEvent_fire;
  wire                vSz_valid;
  wire                vSz_ready;
  wire       [31:0]   vSz_payload;
  reg        [15:0]   tokenIndexCnt;
  wire                firstTokenIndex;
  wire                k_prefillIn_valid;
  wire                k_prefillIn_ready;
  wire                k_prefillIn_payload;
  wire                k_data_valid;
  wire                k_data_ready;
  wire       [31:0]   k_data_payload;
  wire                k_dataFire;
  wire                k_fifoPop_valid;
  wire                k_fifoPop_ready;
  wire       [511:0]  k_fifoPop_payload;
  reg                 szPacker_k_fifo_io_pop_rValid;
  reg        [511:0]  szPacker_k_fifo_io_pop_rData;
  reg        [3:0]    k_tokenCnt;
  reg        [8:0]    k_depthCnt;
  wire                k_tokenCntAbout2Ovf;
  wire                k_depthCntOvf;
  (* max_fanout = "100" *) reg                 k_isTokenZero;
  reg                 k_tokenCntOvfReg;
  reg        [31:0]   k_pushVec_0;
  reg        [31:0]   k_pushVec_1;
  reg        [31:0]   k_pushVec_2;
  reg        [31:0]   k_pushVec_3;
  reg        [31:0]   k_pushVec_4;
  reg        [31:0]   k_pushVec_5;
  reg        [31:0]   k_pushVec_6;
  reg        [31:0]   k_pushVec_7;
  reg        [31:0]   k_pushVec_8;
  reg        [31:0]   k_pushVec_9;
  reg        [31:0]   k_pushVec_10;
  reg        [31:0]   k_pushVec_11;
  reg        [31:0]   k_pushVec_12;
  reg        [31:0]   k_pushVec_13;
  reg        [31:0]   k_pushVec_14;
  reg        [31:0]   k_pushVec_15;
  wire       [15:0]   t_1;
  wire       [511:0]  k_pushVecBits;
  wire                k_toBus_valid;
  reg                 k_toBus_ready;
  wire                k_toBus_payload_last;
  wire       [511:0]  k_toBus_payload_fragment;
  (* max_fanout = "100" *) reg                 k_flag;
  wire                k_fifoPop_fire;
  (* max_fanout = "100" *) reg                 k_vld;
  wire                k_sOut_valid;
  reg                 k_sOut_ready;
  wire       [31:0]   k_sOut_payload;
  reg        [3:0]    k_outCnt;
  wire                k_outCntOvf;
  reg        [3:0]    k_headCnt;
  reg        [4:0]    k_layerCnt;
  wire                k_lastLayer;
  wire                k_sOutFire;
  wire       [31:0]   k_dataSplit_0;
  wire       [31:0]   k_dataSplit_1;
  wire       [31:0]   k_dataSplit_2;
  wire       [31:0]   k_dataSplit_3;
  wire       [31:0]   k_dataSplit_4;
  wire       [31:0]   k_dataSplit_5;
  wire       [31:0]   k_dataSplit_6;
  wire       [31:0]   k_dataSplit_7;
  wire       [31:0]   k_dataSplit_8;
  wire       [31:0]   k_dataSplit_9;
  wire       [31:0]   k_dataSplit_10;
  wire       [31:0]   k_dataSplit_11;
  wire       [31:0]   k_dataSplit_12;
  wire       [31:0]   k_dataSplit_13;
  wire       [31:0]   k_dataSplit_14;
  wire       [31:0]   k_dataSplit_15;
  wire                k_throwCond;
  reg                 k_sOutThrow_valid;
  reg                 k_sOutThrow_ready;
  wire       [31:0]   k_sOutThrow_payload;
  wire                v_prefillIn_valid;
  wire                v_prefillIn_ready;
  wire                v_prefillIn_payload;
  wire                v_data_valid;
  wire                v_data_ready;
  wire       [31:0]   v_data_payload;
  wire                v_dataFire;
  wire                v_fifoPop_valid;
  wire                v_fifoPop_ready;
  wire       [511:0]  v_fifoPop_payload;
  reg                 szPacker_v_fifo_io_pop_rValid;
  reg        [511:0]  szPacker_v_fifo_io_pop_rData;
  reg        [3:0]    v_tokenCnt;
  reg        [8:0]    v_depthCnt;
  wire                v_tokenCntAbout2Ovf;
  wire                v_depthCntOvf;
  (* max_fanout = "100" *) reg                 v_isTokenZero;
  reg                 v_tokenCntOvfReg;
  reg        [31:0]   v_pushVec_0;
  reg        [31:0]   v_pushVec_1;
  reg        [31:0]   v_pushVec_2;
  reg        [31:0]   v_pushVec_3;
  reg        [31:0]   v_pushVec_4;
  reg        [31:0]   v_pushVec_5;
  reg        [31:0]   v_pushVec_6;
  reg        [31:0]   v_pushVec_7;
  reg        [31:0]   v_pushVec_8;
  reg        [31:0]   v_pushVec_9;
  reg        [31:0]   v_pushVec_10;
  reg        [31:0]   v_pushVec_11;
  reg        [31:0]   v_pushVec_12;
  reg        [31:0]   v_pushVec_13;
  reg        [31:0]   v_pushVec_14;
  reg        [31:0]   v_pushVec_15;
  wire       [15:0]   t_2;
  wire       [511:0]  v_pushVecBits;
  wire                v_toBus_valid;
  reg                 v_toBus_ready;
  wire                v_toBus_payload_last;
  wire       [511:0]  v_toBus_payload_fragment;
  (* max_fanout = "100" *) reg                 v_flag;
  wire                v_fifoPop_fire;
  (* max_fanout = "100" *) reg                 v_vld;
  wire                v_sOut_valid;
  reg                 v_sOut_ready;
  wire       [31:0]   v_sOut_payload;
  reg        [3:0]    v_outCnt;
  wire                v_outCntOvf;
  reg        [3:0]    v_headCnt;
  reg        [4:0]    v_layerCnt;
  wire                v_lastLayer;
  wire                v_sOutFire;
  wire       [31:0]   v_dataSplit_0;
  wire       [31:0]   v_dataSplit_1;
  wire       [31:0]   v_dataSplit_2;
  wire       [31:0]   v_dataSplit_3;
  wire       [31:0]   v_dataSplit_4;
  wire       [31:0]   v_dataSplit_5;
  wire       [31:0]   v_dataSplit_6;
  wire       [31:0]   v_dataSplit_7;
  wire       [31:0]   v_dataSplit_8;
  wire       [31:0]   v_dataSplit_9;
  wire       [31:0]   v_dataSplit_10;
  wire       [31:0]   v_dataSplit_11;
  wire       [31:0]   v_dataSplit_12;
  wire       [31:0]   v_dataSplit_13;
  wire       [31:0]   v_dataSplit_14;
  wire       [31:0]   v_dataSplit_15;
  wire                v_throwCond;
  reg                 v_sOutThrow_valid;
  reg                 v_sOutThrow_ready;
  wire       [31:0]   v_sOutThrow_payload;
  wire       [7:0]    t_qOutAdapt;
  reg        [7:0]    t_qOutAdapt_1;
  reg        [7:0]    t_qOutAdapt_2;
  reg        [7:0]    t_qOutAdapt_3;
  reg        [7:0]    t_qOutAdapt_4;
  reg        [7:0]    t_qOutAdapt_5;
  reg        [7:0]    t_qOutAdapt_6;
  reg        [7:0]    t_qOutAdapt_7;
  reg        [7:0]    t_qOutAdapt_8;
  reg        [7:0]    t_qOutAdapt_9;
  reg        [7:0]    t_qOutAdapt_10;
  reg        [7:0]    t_qOutAdapt_11;
  reg        [7:0]    t_qOutAdapt_12;
  reg        [7:0]    t_qOutAdapt_13;
  reg        [7:0]    t_qOutAdapt_14;
  reg        [7:0]    t_qOutAdapt_15;
  reg        [7:0]    t_qOutAdapt_16;
  reg        [7:0]    t_qOutAdapt_17;
  reg        [7:0]    t_qOutAdapt_18;
  reg        [7:0]    t_qOutAdapt_19;
  reg        [7:0]    t_qOutAdapt_20;
  reg        [7:0]    t_qOutAdapt_21;
  reg        [7:0]    t_qOutAdapt_22;
  reg        [7:0]    t_qOutAdapt_23;
  reg        [7:0]    t_qOutAdapt_24;
  reg        [7:0]    t_qOutAdapt_25;
  reg        [7:0]    t_qOutAdapt_26;
  reg        [7:0]    t_qOutAdapt_27;
  reg        [7:0]    t_qOutAdapt_28;
  reg        [7:0]    t_qOutAdapt_29;
  reg        [7:0]    t_qOutAdapt_30;
  reg        [7:0]    t_qOutAdapt_31;
  reg        [7:0]    t_qOutAdapt_32;
  reg        [7:0]    t_qOutAdapt_33;
  reg        [7:0]    t_qOutAdapt_34;
  reg        [7:0]    t_qOutAdapt_35;
  reg        [7:0]    t_qOutAdapt_36;
  reg        [7:0]    t_qOutAdapt_37;
  reg        [7:0]    t_qOutAdapt_38;
  reg        [7:0]    t_qOutAdapt_39;
  reg        [7:0]    t_qOutAdapt_40;
  reg        [7:0]    t_qOutAdapt_41;
  reg        [7:0]    t_qOutAdapt_42;
  reg        [7:0]    t_qOutAdapt_43;
  reg        [7:0]    t_qOutAdapt_44;
  reg        [7:0]    t_qOutAdapt_45;
  reg        [7:0]    t_qOutAdapt_46;
  reg        [7:0]    t_qOutAdapt_47;
  reg        [7:0]    t_qOutAdapt_48;
  reg        [7:0]    t_qOutAdapt_49;
  reg        [7:0]    t_qOutAdapt_50;
  reg        [7:0]    t_qOutAdapt_51;
  reg        [7:0]    t_qOutAdapt_52;
  reg        [7:0]    t_qOutAdapt_53;
  reg        [7:0]    t_qOutAdapt_54;
  reg        [7:0]    t_qOutAdapt_55;
  reg        [7:0]    t_qOutAdapt_56;
  reg        [7:0]    t_qOutAdapt_57;
  reg        [7:0]    t_qOutAdapt_58;
  reg        [7:0]    t_qOutAdapt_59;
  reg        [7:0]    t_qOutAdapt_60;
  reg        [7:0]    t_qOutAdapt_61;
  reg        [7:0]    t_qOutAdapt_62;
  reg        [7:0]    t_qOutAdapt_63;
  wire       [511:0]  qOutAdapt;
  reg        [5:0]    qOutCnt;
  wire                qOutCntOvf;
  wire                qOutBus_valid;
  reg                 qOutBus_ready;
  wire                qOutBus_payload_last;
  wire       [511:0]  qOutBus_payload_fragment;
  wire                k_sOutThrow_m2sPipe_valid;
  reg                 k_sOutThrow_m2sPipe_ready;
  wire       [31:0]   k_sOutThrow_m2sPipe_payload;
  reg                 k_sOutThrow_rValid;
  reg        [31:0]   k_sOutThrow_rData;
  wire                k_sOutThrow_m2sPipe_m2sPipe_valid;
  wire                k_sOutThrow_m2sPipe_m2sPipe_ready;
  wire       [31:0]   k_sOutThrow_m2sPipe_m2sPipe_payload;
  reg                 k_sOutThrow_m2sPipe_rValid;
  reg        [31:0]   k_sOutThrow_m2sPipe_rData;
  wire                v_sOutThrow_m2sPipe_valid;
  reg                 v_sOutThrow_m2sPipe_ready;
  wire       [31:0]   v_sOutThrow_m2sPipe_payload;
  reg                 v_sOutThrow_rValid;
  reg        [31:0]   v_sOutThrow_rData;
  wire                v_sOutThrow_m2sPipe_m2sPipe_valid;
  wire                v_sOutThrow_m2sPipe_m2sPipe_ready;
  wire       [31:0]   v_sOutThrow_m2sPipe_m2sPipe_payload;
  reg                 v_sOutThrow_m2sPipe_rValid;
  reg        [31:0]   v_sOutThrow_m2sPipe_rData;
  wire                qOutBus_m2sPipe_valid;
  reg                 qOutBus_m2sPipe_ready;
  wire                qOutBus_m2sPipe_payload_last;
  wire       [511:0]  qOutBus_m2sPipe_payload_fragment;
  reg                 qOutBus_rValid;
  reg                 qOutBus_rData_last;
  reg        [511:0]  qOutBus_rData_fragment;
  wire                qOutBusPipe_valid;
  wire                qOutBusPipe_ready;
  wire                qOutBusPipe_payload_last;
  wire       [511:0]  qOutBusPipe_payload_fragment;
  reg                 qOutBus_m2sPipe_rValid;
  reg                 qOutBus_m2sPipe_rData_last;
  reg        [511:0]  qOutBus_m2sPipe_rData_fragment;
  wire                kToBusPipe_valid;
  wire                kToBusPipe_ready;
  wire                kToBusPipe_payload_last;
  wire       [511:0]  kToBusPipe_payload_fragment;
  reg                 k_toBus_rValid;
  reg                 k_toBus_rData_last;
  reg        [511:0]  k_toBus_rData_fragment;
  wire                vToBusPipe_valid;
  wire                vToBusPipe_ready;
  wire                vToBusPipe_payload_last;
  wire       [511:0]  vToBusPipe_payload_fragment;
  reg                 v_toBus_rValid;
  reg                 v_toBus_rData_last;
  reg        [511:0]  v_toBus_rData_fragment;
  wire                enInc;
  reg        [4:0]    headCnt;
  reg        [4:0]    layerCnt;
  reg        [3:0]    tokenCnt;
  reg                 szToMem;
  reg                 szToMemNext;
  wire                enStateCntInc;
  reg        [1:0]    stateCnt;
  reg        [1:0]    stateCntNext;
  wire                qOutBusPipe_fire;
  wire                szPacker_busMux_io_output_fire;
  (* max_fanout = 100 *) reg        [1:0]    select_1;
  reg        [1:0]    selectNext;

  assign t_when = (k_headCnt == 4'b1011);
  assign t_when_1 = (v_headCnt == 4'b1011);
  assign t_when_2 = (headCnt == 5'h17);
  assign t_when_3 = (layerCnt == 5'h1b);
  assign t_kScale_payload = (t_kScale_payload_1[4 : 0] + 5'h02);
  assign t_kScale_payload_1 = io_qScale_payload[15 : 10];
  assign t_vScale_payload = (t_vScale_payload_1[4 : 0] + 5'h02);
  assign t_vScale_payload_1 = io_qScale_payload[15 : 10];
  assign t_k_outCntOvf = (k_tokenCnt - 4'b0001);
  assign t_v_outCntOvf = (v_tokenCnt - 4'b0001);
  assign t_qOutAdapt_64 = {t_qOutAdapt_16,{t_qOutAdapt_17,{t_qOutAdapt_18,{t_qOutAdapt_19,{t_qOutAdapt_20,{t_qOutAdapt_21,{t_qOutAdapt_22,{t_qOutAdapt_23,{t_qOutAdapt_24,{t_qOutAdapt_25,{t_qOutAdapt_26,{t_qOutAdapt_27,{t_qOutAdapt_28,{t_qOutAdapt_29,{t_qOutAdapt_30,{t_qOutAdapt_31,t_qOutAdapt_65}}}}}}}}}}}}}}}};
  assign t_qOutAdapt_65 = {t_qOutAdapt_32,{t_qOutAdapt_33,{t_qOutAdapt_34,{t_qOutAdapt_35,{t_qOutAdapt_36,{t_qOutAdapt_37,{t_qOutAdapt_38,{t_qOutAdapt_39,{t_qOutAdapt_40,{t_qOutAdapt_41,{t_qOutAdapt_42,{t_qOutAdapt_43,{t_qOutAdapt_44,{t_qOutAdapt_45,{t_qOutAdapt_46,{t_qOutAdapt_47,t_qOutAdapt_66}}}}}}}}}}}}}}}};
  assign t_qOutAdapt_66 = {t_qOutAdapt_48,{t_qOutAdapt_49,{t_qOutAdapt_50,{t_qOutAdapt_51,{t_qOutAdapt_52,{t_qOutAdapt_53,{t_qOutAdapt_54,{t_qOutAdapt_55,{t_qOutAdapt_56,{t_qOutAdapt_57,{t_qOutAdapt_58,{t_qOutAdapt_59,{t_qOutAdapt_60,{t_qOutAdapt_61,{t_qOutAdapt_62,t_qOutAdapt_63}}}}}}}}}}}}}}};
  StreamFifo_69 k_prefillIn_fifo (
    .io_push_valid   (k_prefillIn_valid                    ), //i
    .io_push_ready   (k_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (k_prefillIn_payload                  ), //i
    .io_pop_valid    (k_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (k_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (k_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                 ), //i
    .io_occupancy    (k_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (k_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                            ), //i
    .clk_1_resetn    (clk_1_resetn                         )  //i
  );
  BottleNeckFifo k_fifo (
    .io_push_valid   (k_fifo_io_push_valid        ), //i
    .io_push_ready   (k_fifo_io_push_ready        ), //o
    .io_push_payload (k_pushVecBits[511:0]        ), //i
    .io_pop_valid    (k_fifo_io_pop_valid         ), //o
    .io_pop_ready    (k_fifo_io_pop_ready         ), //i
    .io_pop_payload  (k_fifo_io_pop_payload[511:0]), //o
    .clk_1_clk       (clk_1_clk                   ), //i
    .clk_1_resetn    (clk_1_resetn                )  //i
  );
  StreamFifo_69 v_prefillIn_fifo (
    .io_push_valid   (v_prefillIn_valid                    ), //i
    .io_push_ready   (v_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (v_prefillIn_payload                  ), //i
    .io_pop_valid    (v_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (v_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (v_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                 ), //i
    .io_occupancy    (v_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (v_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                            ), //i
    .clk_1_resetn    (clk_1_resetn                         )  //i
  );
  BottleNeckFifo_1 v_fifo (
    .io_push_valid   (v_fifo_io_push_valid        ), //i
    .io_push_ready   (v_fifo_io_push_ready        ), //o
    .io_push_payload (v_pushVecBits[511:0]        ), //i
    .io_pop_valid    (v_fifo_io_pop_valid         ), //o
    .io_pop_ready    (v_fifo_io_pop_ready         ), //i
    .io_pop_payload  (v_fifo_io_pop_payload[511:0]), //o
    .clk_1_clk       (clk_1_clk                   ), //i
    .clk_1_resetn    (clk_1_resetn                )  //i
  );
  StreamFifo_8 busFifo (
    .io_push_valid            (busMux_io_output_valid                  ), //i
    .io_push_ready            (busFifo_io_push_ready                   ), //o
    .io_push_payload_last     (busMux_io_output_payload_last           ), //i
    .io_push_payload_fragment (busMux_io_output_payload_fragment[511:0]), //i
    .io_pop_valid             (busFifo_io_pop_valid                    ), //o
    .io_pop_ready             (io_kvBus_ready                          ), //i
    .io_pop_payload_last      (busFifo_io_pop_payload_last             ), //o
    .io_pop_payload_fragment  (busFifo_io_pop_payload_fragment[511:0]  ), //o
    .io_flush                 (1'b0                                    ), //i
    .io_occupancy             (busFifo_io_occupancy[5:0]               ), //o
    .io_availability          (busFifo_io_availability[5:0]            ), //o
    .clk_1_clk                (clk_1_clk                               ), //i
    .clk_1_resetn             (clk_1_resetn                            )  //i
  );
  StreamMux_20 busMux (
    .io_select                    (select_1[1:0]                           ), //i
    .io_inputs_0_valid            (kToBusPipe_valid                        ), //i
    .io_inputs_0_ready            (busMux_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_last     (kToBusPipe_payload_last                 ), //i
    .io_inputs_0_payload_fragment (kToBusPipe_payload_fragment[511:0]      ), //i
    .io_inputs_1_valid            (vToBusPipe_valid                        ), //i
    .io_inputs_1_ready            (busMux_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_last     (vToBusPipe_payload_last                 ), //i
    .io_inputs_1_payload_fragment (vToBusPipe_payload_fragment[511:0]      ), //i
    .io_inputs_2_valid            (qOutBusPipe_valid                       ), //i
    .io_inputs_2_ready            (busMux_io_inputs_2_ready                ), //o
    .io_inputs_2_payload_last     (qOutBusPipe_payload_last                ), //i
    .io_inputs_2_payload_fragment (qOutBusPipe_payload_fragment[511:0]     ), //i
    .io_output_valid              (busMux_io_output_valid                  ), //o
    .io_output_ready              (busFifo_io_push_ready                   ), //i
    .io_output_payload_last       (busMux_io_output_payload_last           ), //o
    .io_output_payload_fragment   (busMux_io_output_payload_fragment[511:0])  //o
  );
  always @(*) begin
    case(k_outCnt)
      4'b0000 : t_k_sOut_payload = k_dataSplit_0;
      4'b0001 : t_k_sOut_payload = k_dataSplit_1;
      4'b0010 : t_k_sOut_payload = k_dataSplit_2;
      4'b0011 : t_k_sOut_payload = k_dataSplit_3;
      4'b0100 : t_k_sOut_payload = k_dataSplit_4;
      4'b0101 : t_k_sOut_payload = k_dataSplit_5;
      4'b0110 : t_k_sOut_payload = k_dataSplit_6;
      4'b0111 : t_k_sOut_payload = k_dataSplit_7;
      4'b1000 : t_k_sOut_payload = k_dataSplit_8;
      4'b1001 : t_k_sOut_payload = k_dataSplit_9;
      4'b1010 : t_k_sOut_payload = k_dataSplit_10;
      4'b1011 : t_k_sOut_payload = k_dataSplit_11;
      4'b1100 : t_k_sOut_payload = k_dataSplit_12;
      4'b1101 : t_k_sOut_payload = k_dataSplit_13;
      4'b1110 : t_k_sOut_payload = k_dataSplit_14;
      default : t_k_sOut_payload = k_dataSplit_15;
    endcase
  end

  always @(*) begin
    case(v_outCnt)
      4'b0000 : t_v_sOut_payload = v_dataSplit_0;
      4'b0001 : t_v_sOut_payload = v_dataSplit_1;
      4'b0010 : t_v_sOut_payload = v_dataSplit_2;
      4'b0011 : t_v_sOut_payload = v_dataSplit_3;
      4'b0100 : t_v_sOut_payload = v_dataSplit_4;
      4'b0101 : t_v_sOut_payload = v_dataSplit_5;
      4'b0110 : t_v_sOut_payload = v_dataSplit_6;
      4'b0111 : t_v_sOut_payload = v_dataSplit_7;
      4'b1000 : t_v_sOut_payload = v_dataSplit_8;
      4'b1001 : t_v_sOut_payload = v_dataSplit_9;
      4'b1010 : t_v_sOut_payload = v_dataSplit_10;
      4'b1011 : t_v_sOut_payload = v_dataSplit_11;
      4'b1100 : t_v_sOut_payload = v_dataSplit_12;
      4'b1101 : t_v_sOut_payload = v_dataSplit_13;
      4'b1110 : t_v_sOut_payload = v_dataSplit_14;
      default : t_v_sOut_payload = v_dataSplit_15;
    endcase
  end

  always @(*) begin
    kScale_ready = kScalePipe_ready;
    if((! kScalePipe_valid)) begin
      kScale_ready = 1'b1;
    end
  end

  assign kScalePipe_valid = kScale_rValid;
  assign kScalePipe_payload = kScale_rData;
  assign kScale_valid = (io_qScale_valid && (! scaleIsV));
  assign kScale_payload = {{io_qScale_payload[15],t_kScale_payload},io_qScale_payload[9 : 0]};
  always @(*) begin
    kZero_ready = kZeroPipe_ready;
    if((! kZeroPipe_valid)) begin
      kZero_ready = 1'b1;
    end
  end

  assign kZeroPipe_valid = kZero_rValid;
  assign kZeroPipe_payload = kZero_rData;
  assign kZero_valid = (io_qZero_valid && (! zeroIsV));
  assign kZero_payload = io_qZero_payload;
  always @(*) begin
    vScale_ready = vScalePipe_ready;
    if((! vScalePipe_valid)) begin
      vScale_ready = 1'b1;
    end
  end

  assign vScalePipe_valid = vScale_rValid;
  assign vScalePipe_payload = vScale_rData;
  assign vScale_valid = (io_qScale_valid && scaleIsV);
  assign vScale_payload = {{io_qScale_payload[15],t_vScale_payload},io_qScale_payload[9 : 0]};
  always @(*) begin
    vZero_ready = vZeroPipe_ready;
    if((! vZeroPipe_valid)) begin
      vZero_ready = 1'b1;
    end
  end

  assign vZeroPipe_valid = vZero_rValid;
  assign vZeroPipe_payload = vZero_rData;
  assign vZero_valid = (io_qZero_valid && zeroIsV);
  assign vZero_payload = io_qZero_payload;
  assign kScalePipe_ready = kJoinEvent_fire;
  assign kZeroPipe_ready = kJoinEvent_fire;
  assign kJoinEvent_valid = (kScalePipe_valid && kZeroPipe_valid);
  assign kJoinEvent_fire = (kJoinEvent_valid && kJoinEvent_ready);
  assign kSz_valid = kJoinEvent_valid;
  assign kJoinEvent_ready = kSz_ready;
  assign kSz_payload = {{8'h0,kZeroPipe_payload},kScalePipe_payload};
  assign vScalePipe_ready = vJoinEvent_fire;
  assign vZeroPipe_ready = vJoinEvent_fire;
  assign vJoinEvent_valid = (vScalePipe_valid && vZeroPipe_valid);
  assign vJoinEvent_fire = (vJoinEvent_valid && vJoinEvent_ready);
  assign vSz_valid = vJoinEvent_valid;
  assign vJoinEvent_ready = vSz_ready;
  assign vSz_payload = {{8'h0,vZeroPipe_payload},vScalePipe_payload};
  assign firstTokenIndex = (tokenIndexCnt[3 : 0] == 4'b0000);
  assign k_prefillIn_valid = (io_tokenIndexFlow_valid && (! firstTokenIndex));
  assign k_prefillIn_payload = (io_tokenIndexFlow_payload == 6'h0);
  assign k_prefillIn_ready = k_prefillIn_fifo_io_push_ready;
  always @(*) begin
    k_prefillIn_fifo_io_pop_ready = 1'b0;
    if(k_sOutFire) begin
      if(k_outCntOvf) begin
        if(t_when) begin
          if(k_lastLayer) begin
            k_prefillIn_fifo_io_pop_ready = 1'b1;
          end
        end
      end
    end
  end

  assign k_dataFire = (k_data_valid && k_data_ready);
  always @(*) begin
    k_fifo_io_pop_ready = k_fifoPop_ready;
    if((! k_fifoPop_valid)) begin
      k_fifo_io_pop_ready = 1'b1;
    end
  end

  assign k_fifoPop_valid = szPacker_k_fifo_io_pop_rValid;
  assign k_fifoPop_payload = szPacker_k_fifo_io_pop_rData;
  assign k_tokenCntAbout2Ovf = (k_tokenCnt == 4'b1110);
  assign k_depthCntOvf = (k_depthCnt == 9'h14f);
  always @(*) begin
    k_pushVec_0 = k_fifoPop_payload[31 : 0];
    if(t_1[0]) begin
      k_pushVec_0 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_1 = k_fifoPop_payload[63 : 32];
    if(t_1[1]) begin
      k_pushVec_1 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_2 = k_fifoPop_payload[95 : 64];
    if(t_1[2]) begin
      k_pushVec_2 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_3 = k_fifoPop_payload[127 : 96];
    if(t_1[3]) begin
      k_pushVec_3 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_4 = k_fifoPop_payload[159 : 128];
    if(t_1[4]) begin
      k_pushVec_4 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_5 = k_fifoPop_payload[191 : 160];
    if(t_1[5]) begin
      k_pushVec_5 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_6 = k_fifoPop_payload[223 : 192];
    if(t_1[6]) begin
      k_pushVec_6 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_7 = k_fifoPop_payload[255 : 224];
    if(t_1[7]) begin
      k_pushVec_7 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_8 = k_fifoPop_payload[287 : 256];
    if(t_1[8]) begin
      k_pushVec_8 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_9 = k_fifoPop_payload[319 : 288];
    if(t_1[9]) begin
      k_pushVec_9 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_10 = k_fifoPop_payload[351 : 320];
    if(t_1[10]) begin
      k_pushVec_10 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_11 = k_fifoPop_payload[383 : 352];
    if(t_1[11]) begin
      k_pushVec_11 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_12 = k_fifoPop_payload[415 : 384];
    if(t_1[12]) begin
      k_pushVec_12 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_13 = k_fifoPop_payload[447 : 416];
    if(t_1[13]) begin
      k_pushVec_13 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_14 = k_fifoPop_payload[479 : 448];
    if(t_1[14]) begin
      k_pushVec_14 = k_data_payload;
    end
  end

  always @(*) begin
    k_pushVec_15 = k_fifoPop_payload[511 : 480];
    if(t_1[15]) begin
      k_pushVec_15 = k_data_payload;
    end
  end

  assign t_1 = ({15'd0,1'b1} <<< k_tokenCnt);
  assign k_pushVecBits = {k_pushVec_15,{k_pushVec_14,{k_pushVec_13,{k_pushVec_12,{k_pushVec_11,{k_pushVec_10,{k_pushVec_9,{k_pushVec_8,{k_pushVec_7,{k_pushVec_6,{k_pushVec_5,{k_pushVec_4,{k_pushVec_3,{k_pushVec_2,{k_pushVec_1,k_pushVec_0}}}}}}}}}}}}}}};
  assign k_fifo_io_push_valid = (k_dataFire && (! k_tokenCntOvfReg));
  assign k_fifoPop_ready = (k_dataFire && (! k_isTokenZero));
  assign k_toBus_valid = (k_dataFire && k_tokenCntOvfReg);
  assign k_toBus_payload_last = 1'b1;
  assign k_toBus_payload_fragment = k_pushVecBits;
  assign k_fifoPop_fire = (k_fifoPop_valid && k_fifoPop_ready);
  assign k_sOut_valid = (((k_fifoPop_valid && k_flag) && (! k_isTokenZero)) && k_vld);
  assign k_outCntOvf = (k_outCnt == t_k_outCntOvf);
  assign k_lastLayer = (k_layerCnt == 5'h1b);
  assign k_sOutFire = (k_sOut_valid && k_sOut_ready);
  assign k_data_valid = kSz_valid;
  assign kSz_ready = k_data_ready;
  assign k_data_payload = kSz_payload;
  assign k_data_ready = (! k_sOut_valid);
  assign k_dataSplit_0 = k_fifoPop_payload[31 : 0];
  assign k_dataSplit_1 = k_fifoPop_payload[63 : 32];
  assign k_dataSplit_2 = k_fifoPop_payload[95 : 64];
  assign k_dataSplit_3 = k_fifoPop_payload[127 : 96];
  assign k_dataSplit_4 = k_fifoPop_payload[159 : 128];
  assign k_dataSplit_5 = k_fifoPop_payload[191 : 160];
  assign k_dataSplit_6 = k_fifoPop_payload[223 : 192];
  assign k_dataSplit_7 = k_fifoPop_payload[255 : 224];
  assign k_dataSplit_8 = k_fifoPop_payload[287 : 256];
  assign k_dataSplit_9 = k_fifoPop_payload[319 : 288];
  assign k_dataSplit_10 = k_fifoPop_payload[351 : 320];
  assign k_dataSplit_11 = k_fifoPop_payload[383 : 352];
  assign k_dataSplit_12 = k_fifoPop_payload[415 : 384];
  assign k_dataSplit_13 = k_fifoPop_payload[447 : 416];
  assign k_dataSplit_14 = k_fifoPop_payload[479 : 448];
  assign k_dataSplit_15 = k_fifoPop_payload[511 : 480];
  assign k_sOut_payload = t_k_sOut_payload;
  assign k_throwCond = (k_prefillIn_fifo_io_pop_payload && k_lastLayer);
  always @(*) begin
    k_sOutThrow_valid = k_sOut_valid;
    if(k_throwCond) begin
      k_sOutThrow_valid = 1'b0;
    end
  end

  always @(*) begin
    k_sOut_ready = k_sOutThrow_ready;
    if(k_throwCond) begin
      k_sOut_ready = 1'b1;
    end
  end

  assign k_sOutThrow_payload = k_sOut_payload;
  assign v_prefillIn_valid = (io_tokenIndexFlow_valid && (! firstTokenIndex));
  assign v_prefillIn_payload = (io_tokenIndexFlow_payload == 6'h0);
  assign v_prefillIn_ready = v_prefillIn_fifo_io_push_ready;
  always @(*) begin
    v_prefillIn_fifo_io_pop_ready = 1'b0;
    if(v_sOutFire) begin
      if(v_outCntOvf) begin
        if(t_when_1) begin
          if(v_lastLayer) begin
            v_prefillIn_fifo_io_pop_ready = 1'b1;
          end
        end
      end
    end
  end

  assign v_dataFire = (v_data_valid && v_data_ready);
  always @(*) begin
    v_fifo_io_pop_ready = v_fifoPop_ready;
    if((! v_fifoPop_valid)) begin
      v_fifo_io_pop_ready = 1'b1;
    end
  end

  assign v_fifoPop_valid = szPacker_v_fifo_io_pop_rValid;
  assign v_fifoPop_payload = szPacker_v_fifo_io_pop_rData;
  assign v_tokenCntAbout2Ovf = (v_tokenCnt == 4'b1110);
  assign v_depthCntOvf = (v_depthCnt == 9'h14f);
  always @(*) begin
    v_pushVec_0 = v_fifoPop_payload[31 : 0];
    if(t_2[0]) begin
      v_pushVec_0 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_1 = v_fifoPop_payload[63 : 32];
    if(t_2[1]) begin
      v_pushVec_1 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_2 = v_fifoPop_payload[95 : 64];
    if(t_2[2]) begin
      v_pushVec_2 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_3 = v_fifoPop_payload[127 : 96];
    if(t_2[3]) begin
      v_pushVec_3 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_4 = v_fifoPop_payload[159 : 128];
    if(t_2[4]) begin
      v_pushVec_4 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_5 = v_fifoPop_payload[191 : 160];
    if(t_2[5]) begin
      v_pushVec_5 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_6 = v_fifoPop_payload[223 : 192];
    if(t_2[6]) begin
      v_pushVec_6 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_7 = v_fifoPop_payload[255 : 224];
    if(t_2[7]) begin
      v_pushVec_7 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_8 = v_fifoPop_payload[287 : 256];
    if(t_2[8]) begin
      v_pushVec_8 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_9 = v_fifoPop_payload[319 : 288];
    if(t_2[9]) begin
      v_pushVec_9 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_10 = v_fifoPop_payload[351 : 320];
    if(t_2[10]) begin
      v_pushVec_10 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_11 = v_fifoPop_payload[383 : 352];
    if(t_2[11]) begin
      v_pushVec_11 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_12 = v_fifoPop_payload[415 : 384];
    if(t_2[12]) begin
      v_pushVec_12 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_13 = v_fifoPop_payload[447 : 416];
    if(t_2[13]) begin
      v_pushVec_13 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_14 = v_fifoPop_payload[479 : 448];
    if(t_2[14]) begin
      v_pushVec_14 = v_data_payload;
    end
  end

  always @(*) begin
    v_pushVec_15 = v_fifoPop_payload[511 : 480];
    if(t_2[15]) begin
      v_pushVec_15 = v_data_payload;
    end
  end

  assign t_2 = ({15'd0,1'b1} <<< v_tokenCnt);
  assign v_pushVecBits = {v_pushVec_15,{v_pushVec_14,{v_pushVec_13,{v_pushVec_12,{v_pushVec_11,{v_pushVec_10,{v_pushVec_9,{v_pushVec_8,{v_pushVec_7,{v_pushVec_6,{v_pushVec_5,{v_pushVec_4,{v_pushVec_3,{v_pushVec_2,{v_pushVec_1,v_pushVec_0}}}}}}}}}}}}}}};
  assign v_fifo_io_push_valid = (v_dataFire && (! v_tokenCntOvfReg));
  assign v_fifoPop_ready = (v_dataFire && (! v_isTokenZero));
  assign v_toBus_valid = (v_dataFire && v_tokenCntOvfReg);
  assign v_toBus_payload_last = 1'b1;
  assign v_toBus_payload_fragment = v_pushVecBits;
  assign v_fifoPop_fire = (v_fifoPop_valid && v_fifoPop_ready);
  assign v_sOut_valid = (((v_fifoPop_valid && v_flag) && (! v_isTokenZero)) && v_vld);
  assign v_outCntOvf = (v_outCnt == t_v_outCntOvf);
  assign v_lastLayer = (v_layerCnt == 5'h1b);
  assign v_sOutFire = (v_sOut_valid && v_sOut_ready);
  assign v_data_valid = vSz_valid;
  assign vSz_ready = v_data_ready;
  assign v_data_payload = vSz_payload;
  assign v_data_ready = (! v_sOut_valid);
  assign v_dataSplit_0 = v_fifoPop_payload[31 : 0];
  assign v_dataSplit_1 = v_fifoPop_payload[63 : 32];
  assign v_dataSplit_2 = v_fifoPop_payload[95 : 64];
  assign v_dataSplit_3 = v_fifoPop_payload[127 : 96];
  assign v_dataSplit_4 = v_fifoPop_payload[159 : 128];
  assign v_dataSplit_5 = v_fifoPop_payload[191 : 160];
  assign v_dataSplit_6 = v_fifoPop_payload[223 : 192];
  assign v_dataSplit_7 = v_fifoPop_payload[255 : 224];
  assign v_dataSplit_8 = v_fifoPop_payload[287 : 256];
  assign v_dataSplit_9 = v_fifoPop_payload[319 : 288];
  assign v_dataSplit_10 = v_fifoPop_payload[351 : 320];
  assign v_dataSplit_11 = v_fifoPop_payload[383 : 352];
  assign v_dataSplit_12 = v_fifoPop_payload[415 : 384];
  assign v_dataSplit_13 = v_fifoPop_payload[447 : 416];
  assign v_dataSplit_14 = v_fifoPop_payload[479 : 448];
  assign v_dataSplit_15 = v_fifoPop_payload[511 : 480];
  assign v_sOut_payload = t_v_sOut_payload;
  assign v_throwCond = (v_prefillIn_fifo_io_pop_payload && v_lastLayer);
  always @(*) begin
    v_sOutThrow_valid = v_sOut_valid;
    if(v_throwCond) begin
      v_sOutThrow_valid = 1'b0;
    end
  end

  always @(*) begin
    v_sOut_ready = v_sOutThrow_ready;
    if(v_throwCond) begin
      v_sOut_ready = 1'b1;
    end
  end

  assign v_sOutThrow_payload = v_sOut_payload;
  assign t_qOutAdapt = io_qOut_payload_fragment;
  assign qOutAdapt = {t_qOutAdapt,{t_qOutAdapt_1,{t_qOutAdapt_2,{t_qOutAdapt_3,{t_qOutAdapt_4,{t_qOutAdapt_5,{t_qOutAdapt_6,{t_qOutAdapt_7,{t_qOutAdapt_8,{t_qOutAdapt_9,{t_qOutAdapt_10,{t_qOutAdapt_11,{t_qOutAdapt_12,{t_qOutAdapt_13,{t_qOutAdapt_14,{t_qOutAdapt_15,t_qOutAdapt_64}}}}}}}}}}}}}}}};
  assign qOutCntOvf = (qOutCnt == 6'h3f);
  assign qOutBus_valid = (io_qOut_valid && qOutCntOvf);
  assign qOutBus_payload_last = io_qOut_payload_last;
  assign qOutBus_payload_fragment = qOutAdapt;
  always @(*) begin
    k_sOutThrow_ready = k_sOutThrow_m2sPipe_ready;
    if((! k_sOutThrow_m2sPipe_valid)) begin
      k_sOutThrow_ready = 1'b1;
    end
  end

  assign k_sOutThrow_m2sPipe_valid = k_sOutThrow_rValid;
  assign k_sOutThrow_m2sPipe_payload = k_sOutThrow_rData;
  always @(*) begin
    k_sOutThrow_m2sPipe_ready = k_sOutThrow_m2sPipe_m2sPipe_ready;
    if((! k_sOutThrow_m2sPipe_m2sPipe_valid)) begin
      k_sOutThrow_m2sPipe_ready = 1'b1;
    end
  end

  assign k_sOutThrow_m2sPipe_m2sPipe_valid = k_sOutThrow_m2sPipe_rValid;
  assign k_sOutThrow_m2sPipe_m2sPipe_payload = k_sOutThrow_m2sPipe_rData;
  assign io_kSzOut_valid = k_sOutThrow_m2sPipe_m2sPipe_valid;
  assign k_sOutThrow_m2sPipe_m2sPipe_ready = io_kSzOut_ready;
  assign io_kSzOut_payload = k_sOutThrow_m2sPipe_m2sPipe_payload;
  always @(*) begin
    v_sOutThrow_ready = v_sOutThrow_m2sPipe_ready;
    if((! v_sOutThrow_m2sPipe_valid)) begin
      v_sOutThrow_ready = 1'b1;
    end
  end

  assign v_sOutThrow_m2sPipe_valid = v_sOutThrow_rValid;
  assign v_sOutThrow_m2sPipe_payload = v_sOutThrow_rData;
  always @(*) begin
    v_sOutThrow_m2sPipe_ready = v_sOutThrow_m2sPipe_m2sPipe_ready;
    if((! v_sOutThrow_m2sPipe_m2sPipe_valid)) begin
      v_sOutThrow_m2sPipe_ready = 1'b1;
    end
  end

  assign v_sOutThrow_m2sPipe_m2sPipe_valid = v_sOutThrow_m2sPipe_rValid;
  assign v_sOutThrow_m2sPipe_m2sPipe_payload = v_sOutThrow_m2sPipe_rData;
  assign io_vSzOut_valid = v_sOutThrow_m2sPipe_m2sPipe_valid;
  assign v_sOutThrow_m2sPipe_m2sPipe_ready = io_vSzOut_ready;
  assign io_vSzOut_payload = v_sOutThrow_m2sPipe_m2sPipe_payload;
  always @(*) begin
    qOutBus_ready = qOutBus_m2sPipe_ready;
    if((! qOutBus_m2sPipe_valid)) begin
      qOutBus_ready = 1'b1;
    end
  end

  assign qOutBus_m2sPipe_valid = qOutBus_rValid;
  assign qOutBus_m2sPipe_payload_last = qOutBus_rData_last;
  assign qOutBus_m2sPipe_payload_fragment = qOutBus_rData_fragment;
  always @(*) begin
    qOutBus_m2sPipe_ready = qOutBusPipe_ready;
    if((! qOutBusPipe_valid)) begin
      qOutBus_m2sPipe_ready = 1'b1;
    end
  end

  assign qOutBusPipe_valid = qOutBus_m2sPipe_rValid;
  assign qOutBusPipe_payload_last = qOutBus_m2sPipe_rData_last;
  assign qOutBusPipe_payload_fragment = qOutBus_m2sPipe_rData_fragment;
  always @(*) begin
    k_toBus_ready = kToBusPipe_ready;
    if((! kToBusPipe_valid)) begin
      k_toBus_ready = 1'b1;
    end
  end

  assign kToBusPipe_valid = k_toBus_rValid;
  assign kToBusPipe_payload_last = k_toBus_rData_last;
  assign kToBusPipe_payload_fragment = k_toBus_rData_fragment;
  always @(*) begin
    v_toBus_ready = vToBusPipe_ready;
    if((! vToBusPipe_valid)) begin
      v_toBus_ready = 1'b1;
    end
  end

  assign vToBusPipe_valid = v_toBus_rValid;
  assign vToBusPipe_payload_last = v_toBus_rData_last;
  assign vToBusPipe_payload_fragment = v_toBus_rData_fragment;
  assign kToBusPipe_ready = busMux_io_inputs_0_ready;
  assign vToBusPipe_ready = busMux_io_inputs_1_ready;
  assign qOutBusPipe_ready = busMux_io_inputs_2_ready;
  assign io_kvBus_valid = busFifo_io_pop_valid;
  assign io_kvBus_payload_last = busFifo_io_pop_payload_last;
  assign io_kvBus_payload_fragment = busFifo_io_pop_payload_fragment;
  always @(*) begin
    szToMemNext = szToMem;
    if(enInc) begin
      if(t_when_2) begin
        if(t_when_3) begin
          if((tokenCnt == 4'b1110)) begin
            szToMemNext = 1'b1;
          end
          if(szToMem) begin
            szToMemNext = 1'b0;
          end
        end
      end
    end
  end

  always @(*) begin
    stateCntNext = stateCnt;
    if(enStateCntInc) begin
      stateCntNext = (stateCnt + 2'b01);
    end
  end

  assign qOutBusPipe_fire = (qOutBusPipe_valid && qOutBusPipe_ready);
  assign enInc = (qOutBusPipe_fire && qOutBusPipe_payload_last);
  assign szPacker_busMux_io_output_fire = (busMux_io_output_valid && busFifo_io_push_ready);
  assign enStateCntInc = ((szToMem && szPacker_busMux_io_output_fire) && busMux_io_output_payload_last);
  always @(*) begin
    selectNext = 2'b10;
    if((szToMemNext && (stateCntNext == 2'b00))) begin
      selectNext = 2'b00;
    end
    if((szToMemNext && (stateCntNext == 2'b10))) begin
      selectNext = 2'b01;
    end
  end

  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      scaleIsV <= 1'b0;
      zeroIsV <= 1'b0;
      kScale_rValid <= 1'b0;
      kZero_rValid <= 1'b0;
      vScale_rValid <= 1'b0;
      vZero_rValid <= 1'b0;
      tokenIndexCnt <= 16'h0;
      szPacker_k_fifo_io_pop_rValid <= 1'b0;
      k_tokenCnt <= 4'b0000;
      k_depthCnt <= 9'h0;
      k_isTokenZero <= 1'b1;
      k_tokenCntOvfReg <= 1'b0;
      k_flag <= 1'b1;
      k_vld <= 1'b1;
      k_outCnt <= 4'b0000;
      k_headCnt <= 4'b0000;
      k_layerCnt <= 5'h0;
      szPacker_v_fifo_io_pop_rValid <= 1'b0;
      v_tokenCnt <= 4'b0000;
      v_depthCnt <= 9'h0;
      v_isTokenZero <= 1'b1;
      v_tokenCntOvfReg <= 1'b0;
      v_flag <= 1'b1;
      v_vld <= 1'b1;
      v_outCnt <= 4'b0000;
      v_headCnt <= 4'b0000;
      v_layerCnt <= 5'h0;
      qOutCnt <= 6'h0;
      k_sOutThrow_rValid <= 1'b0;
      k_sOutThrow_m2sPipe_rValid <= 1'b0;
      v_sOutThrow_rValid <= 1'b0;
      v_sOutThrow_m2sPipe_rValid <= 1'b0;
      qOutBus_rValid <= 1'b0;
      qOutBus_m2sPipe_rValid <= 1'b0;
      k_toBus_rValid <= 1'b0;
      v_toBus_rValid <= 1'b0;
      headCnt <= 5'h0;
      layerCnt <= 5'h0;
      tokenCnt <= 4'b0000;
      szToMem <= 1'b0;
      stateCnt <= 2'b00;
      select_1 <= 2'b10;
    end else begin
      if(io_qScale_valid) begin
        scaleIsV <= (! scaleIsV);
      end
      if(io_qZero_valid) begin
        zeroIsV <= (! zeroIsV);
      end
      if(kScale_ready) begin
        kScale_rValid <= kScale_valid;
      end
      if(kZero_ready) begin
        kZero_rValid <= kZero_valid;
      end
      if(vScale_ready) begin
        vScale_rValid <= vScale_valid;
      end
      if(vZero_ready) begin
        vZero_rValid <= vZero_valid;
      end
      if(io_tokenIndexFlow_valid) begin
        tokenIndexCnt <= (tokenIndexCnt + 16'h0001);
      end
      if(k_fifo_io_pop_ready) begin
        szPacker_k_fifo_io_pop_rValid <= k_fifo_io_pop_valid;
      end
      if(k_dataFire) begin
        k_depthCnt <= (k_depthCnt + 9'h001);
        if(k_depthCntOvf) begin
          k_tokenCnt <= (k_tokenCnt + 4'b0001);
          k_isTokenZero <= 1'b0;
          k_depthCnt <= 9'h0;
          if(k_tokenCntAbout2Ovf) begin
            k_tokenCntOvfReg <= 1'b1;
          end
          if(k_tokenCntOvfReg) begin
            k_tokenCnt <= 4'b0000;
            k_isTokenZero <= 1'b1;
            k_tokenCntOvfReg <= 1'b0;
          end
        end
      end
      if(k_fifoPop_fire) begin
        k_flag <= 1'b1;
      end
      if(io_nextLayer) begin
        k_vld <= 1'b1;
      end
      if(k_sOutFire) begin
        k_outCnt <= (k_outCnt + 4'b0001);
        if(k_outCntOvf) begin
          k_outCnt <= 4'b0000;
          k_flag <= 1'b0;
          k_headCnt <= (k_headCnt + 4'b0001);
          if(t_when) begin
            k_headCnt <= 4'b0000;
            k_vld <= 1'b0;
            k_layerCnt <= (k_layerCnt + 5'h01);
            if(k_lastLayer) begin
              k_layerCnt <= 5'h0;
            end
          end
        end
      end
      if(v_fifo_io_pop_ready) begin
        szPacker_v_fifo_io_pop_rValid <= v_fifo_io_pop_valid;
      end
      if(v_dataFire) begin
        v_depthCnt <= (v_depthCnt + 9'h001);
        if(v_depthCntOvf) begin
          v_tokenCnt <= (v_tokenCnt + 4'b0001);
          v_isTokenZero <= 1'b0;
          v_depthCnt <= 9'h0;
          if(v_tokenCntAbout2Ovf) begin
            v_tokenCntOvfReg <= 1'b1;
          end
          if(v_tokenCntOvfReg) begin
            v_tokenCnt <= 4'b0000;
            v_isTokenZero <= 1'b1;
            v_tokenCntOvfReg <= 1'b0;
          end
        end
      end
      if(v_fifoPop_fire) begin
        v_flag <= 1'b1;
      end
      if(io_nextLayer) begin
        v_vld <= 1'b1;
      end
      if(v_sOutFire) begin
        v_outCnt <= (v_outCnt + 4'b0001);
        if(v_outCntOvf) begin
          v_outCnt <= 4'b0000;
          v_flag <= 1'b0;
          v_headCnt <= (v_headCnt + 4'b0001);
          if(t_when_1) begin
            v_headCnt <= 4'b0000;
            v_vld <= 1'b0;
            v_layerCnt <= (v_layerCnt + 5'h01);
            if(v_lastLayer) begin
              v_layerCnt <= 5'h0;
            end
          end
        end
      end
      if(io_qOut_valid) begin
        qOutCnt <= (qOutCnt + 6'h01);
        if(qOutCntOvf) begin
          qOutCnt <= 6'h0;
        end
      end
      if(k_sOutThrow_ready) begin
        k_sOutThrow_rValid <= k_sOutThrow_valid;
      end
      if(k_sOutThrow_m2sPipe_ready) begin
        k_sOutThrow_m2sPipe_rValid <= k_sOutThrow_m2sPipe_valid;
      end
      if(v_sOutThrow_ready) begin
        v_sOutThrow_rValid <= v_sOutThrow_valid;
      end
      if(v_sOutThrow_m2sPipe_ready) begin
        v_sOutThrow_m2sPipe_rValid <= v_sOutThrow_m2sPipe_valid;
      end
      if(qOutBus_ready) begin
        qOutBus_rValid <= qOutBus_valid;
      end
      if(qOutBus_m2sPipe_ready) begin
        qOutBus_m2sPipe_rValid <= qOutBus_m2sPipe_valid;
      end
      if(k_toBus_ready) begin
        k_toBus_rValid <= k_toBus_valid;
      end
      if(v_toBus_ready) begin
        v_toBus_rValid <= v_toBus_valid;
      end
      szToMem <= szToMemNext;
      if(enInc) begin
        headCnt <= (headCnt + 5'h01);
        if(t_when_2) begin
          headCnt <= 5'h0;
          layerCnt <= (layerCnt + 5'h01);
          if(t_when_3) begin
            layerCnt <= 5'h0;
            tokenCnt <= (tokenCnt + 4'b0001);
          end
        end
      end
      stateCnt <= stateCntNext;
      select_1 <= selectNext;
    end
  end

  always @(posedge clk_1_clk) begin
    if(kScale_ready) begin
      kScale_rData <= kScale_payload;
    end
    if(kZero_ready) begin
      kZero_rData <= kZero_payload;
    end
    if(vScale_ready) begin
      vScale_rData <= vScale_payload;
    end
    if(vZero_ready) begin
      vZero_rData <= vZero_payload;
    end
    if(k_fifo_io_pop_ready) begin
      szPacker_k_fifo_io_pop_rData <= k_fifo_io_pop_payload;
    end
    if(v_fifo_io_pop_ready) begin
      szPacker_v_fifo_io_pop_rData <= v_fifo_io_pop_payload;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_1 <= t_qOutAdapt;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_2 <= t_qOutAdapt_1;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_3 <= t_qOutAdapt_2;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_4 <= t_qOutAdapt_3;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_5 <= t_qOutAdapt_4;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_6 <= t_qOutAdapt_5;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_7 <= t_qOutAdapt_6;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_8 <= t_qOutAdapt_7;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_9 <= t_qOutAdapt_8;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_10 <= t_qOutAdapt_9;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_11 <= t_qOutAdapt_10;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_12 <= t_qOutAdapt_11;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_13 <= t_qOutAdapt_12;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_14 <= t_qOutAdapt_13;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_15 <= t_qOutAdapt_14;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_16 <= t_qOutAdapt_15;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_17 <= t_qOutAdapt_16;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_18 <= t_qOutAdapt_17;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_19 <= t_qOutAdapt_18;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_20 <= t_qOutAdapt_19;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_21 <= t_qOutAdapt_20;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_22 <= t_qOutAdapt_21;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_23 <= t_qOutAdapt_22;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_24 <= t_qOutAdapt_23;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_25 <= t_qOutAdapt_24;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_26 <= t_qOutAdapt_25;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_27 <= t_qOutAdapt_26;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_28 <= t_qOutAdapt_27;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_29 <= t_qOutAdapt_28;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_30 <= t_qOutAdapt_29;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_31 <= t_qOutAdapt_30;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_32 <= t_qOutAdapt_31;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_33 <= t_qOutAdapt_32;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_34 <= t_qOutAdapt_33;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_35 <= t_qOutAdapt_34;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_36 <= t_qOutAdapt_35;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_37 <= t_qOutAdapt_36;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_38 <= t_qOutAdapt_37;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_39 <= t_qOutAdapt_38;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_40 <= t_qOutAdapt_39;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_41 <= t_qOutAdapt_40;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_42 <= t_qOutAdapt_41;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_43 <= t_qOutAdapt_42;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_44 <= t_qOutAdapt_43;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_45 <= t_qOutAdapt_44;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_46 <= t_qOutAdapt_45;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_47 <= t_qOutAdapt_46;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_48 <= t_qOutAdapt_47;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_49 <= t_qOutAdapt_48;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_50 <= t_qOutAdapt_49;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_51 <= t_qOutAdapt_50;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_52 <= t_qOutAdapt_51;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_53 <= t_qOutAdapt_52;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_54 <= t_qOutAdapt_53;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_55 <= t_qOutAdapt_54;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_56 <= t_qOutAdapt_55;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_57 <= t_qOutAdapt_56;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_58 <= t_qOutAdapt_57;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_59 <= t_qOutAdapt_58;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_60 <= t_qOutAdapt_59;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_61 <= t_qOutAdapt_60;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_62 <= t_qOutAdapt_61;
    end
    if(io_qOut_valid) begin
      t_qOutAdapt_63 <= t_qOutAdapt_62;
    end
    if(k_sOutThrow_ready) begin
      k_sOutThrow_rData <= k_sOutThrow_payload;
    end
    if(k_sOutThrow_m2sPipe_ready) begin
      k_sOutThrow_m2sPipe_rData <= k_sOutThrow_m2sPipe_payload;
    end
    if(v_sOutThrow_ready) begin
      v_sOutThrow_rData <= v_sOutThrow_payload;
    end
    if(v_sOutThrow_m2sPipe_ready) begin
      v_sOutThrow_m2sPipe_rData <= v_sOutThrow_m2sPipe_payload;
    end
    if(qOutBus_ready) begin
      qOutBus_rData_last <= qOutBus_payload_last;
      qOutBus_rData_fragment <= qOutBus_payload_fragment;
    end
    if(qOutBus_m2sPipe_ready) begin
      qOutBus_m2sPipe_rData_last <= qOutBus_m2sPipe_payload_last;
      qOutBus_m2sPipe_rData_fragment <= qOutBus_m2sPipe_payload_fragment;
    end
    if(k_toBus_ready) begin
      k_toBus_rData_last <= k_toBus_payload_last;
      k_toBus_rData_fragment <= k_toBus_payload_fragment;
    end
    if(v_toBus_ready) begin
      v_toBus_rData_last <= v_toBus_payload_last;
      v_toBus_rData_fragment <= v_toBus_payload_fragment;
    end
  end


endmodule

