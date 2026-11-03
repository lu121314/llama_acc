// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AxiBusDistributor (
  input  wire          io_bus_valid,
  output wire          io_bus_ready,
  input  wire [511:0]  io_bus_payload_data,
  input  wire [63:0]   io_bus_payload_keep,
  input  wire          io_bus_payload_last,
  input  wire [5:0]    io_bus_payload_dest,
  input  wire [12:0]   io_token,
  input  wire [5:0]    io_preCfgTag,
  input  wire [5:0]    io_postCfgTag,
  input  wire          io_enPredictor,
  input  wire          io_kSzOut_valid,
  output wire          io_kSzOut_ready,
  input  wire [31:0]   io_kSzOut_payload,
  input  wire          io_vSzOut_valid,
  output wire          io_vSzOut_ready,
  input  wire [31:0]   io_vSzOut_payload,
  output wire          int_bus_valid,
  input  wire          int_bus_ready,
  output wire          int_bus_payload_last,
  output wire [511:0]  int_bus_payload_tdata,
  output wire [5:0]    int_bus_payload_tuser,
  output wire          int_lnScale_valid,
  input  wire          int_lnScale_ready,
  output wire [15:0]   int_lnScale_payload,
  output wire          int_zeroInt4_valid,
  input  wire          int_zeroInt4_ready,
  output wire [7:0]    int_zeroInt4_payload,
  output wire          int_zeroInt8_valid,
  input  wire          int_zeroInt8_ready,
  output wire [7:0]    int_zeroInt8_payload,
  output wire          int_preScale_valid,
  input  wire          int_preScale_ready,
  output wire [15:0]   int_preScale_payload,
  output wire          int_postScale_valid,
  input  wire          int_postScale_ready,
  output wire [31:0]   int_postScale_payload,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire       [5:0]    busLinkFifo_io_push_payload_fragment;
  wire       [9:0]    tagFifo_io_push_payload;
  wire       [1:0]    miscOutDeMux_io_select;
  wire       [127:0]  ln_buf_io_push_payload;
  wire                ln_buf_io_pop_ready;
  wire       [0:0]    dense_deMux_io_select;
  wire                dense_scaleFifo_io_pop_ready;
  wire       [5:0]    sparse_gen_io_tag;
  wire                sparse_preScaleFifo_io_push_valid;
  wire       [15:0]   sparse_preScaleFifo_io_push_payload;
  wire                sparse_postScaleFifo_io_push_valid;
  wire       [15:0]   sparse_postScaleFifo_io_push_payload;
  wire       [3:0]    sparse_zeroFifo_io_push_payload;
  wire       [0:0]    kv_extPackDeMux_io_select;
  wire       [0:0]    kv_kMux_io_select;
  wire       [0:0]    kv_vMux_io_select;
  wire       [0:0]    kv_vScaleMux_io_select;
  wire       [0:0]    zeroInt4Mux_io_select;
  reg        [1:0]    zeroInt8Mux_io_select;
  wire                busDeMux_io_input_ready;
  wire                busDeMux_io_outputs_0_valid;
  wire                busDeMux_io_outputs_1_valid;
  wire                busDeMux_io_outputs_2_valid;
  wire                busDeMux_io_outputs_3_valid;
  wire                busDeMux_io_outputs_4_valid;
  wire                busMux_io_inputs_0_ready;
  wire                busMux_io_inputs_1_ready;
  wire                busMux_io_inputs_2_ready;
  wire                busMux_io_inputs_3_ready;
  wire                busMux_io_output_valid;
  wire                miscInMux_io_inputs_0_ready;
  wire                miscInMux_io_inputs_1_ready;
  wire                miscInMux_io_inputs_2_ready;
  wire                miscInMux_io_output_valid;
  wire                busDataFifo_io_push_ready;
  wire                busDataFifo_io_pop_valid;
  wire       [511:0]  busDataFifo_io_pop_payload;
  wire       [5:0]    busDataFifo_io_occupancy;
  wire       [5:0]    busDataFifo_io_availability;
  wire                busLinkFifo_io_push_ready;
  wire                busLinkFifo_io_pop_valid;
  wire                busLinkFifo_io_pop_payload_last;
  wire       [5:0]    busLinkFifo_io_pop_payload_fragment;
  wire       [5:0]    busLinkFifo_io_occupancy;
  wire       [5:0]    busLinkFifo_io_availability;
  wire                miscFifo_io_push_ready;
  wire                miscFifo_io_pop_valid;
  wire       [511:0]  miscFifo_io_pop_payload;
  wire       [9:0]    miscFifo_io_occupancy;
  wire       [9:0]    miscFifo_io_availability;
  wire                tagFifo_io_push_ready;
  wire                tagFifo_io_pop_valid;
  wire       [9:0]    tagFifo_io_pop_payload;
  wire       [9:0]    tagFifo_io_occupancy;
  wire       [9:0]    tagFifo_io_availability;
  wire                miscOutDeMux_io_input_ready;
  wire                miscOutDeMux_io_outputs_0_valid;
  wire                miscOutDeMux_io_outputs_1_valid;
  wire                miscOutDeMux_io_outputs_2_valid;
  wire                ln_buf_io_push_ready;
  wire                ln_buf_io_pop_valid;
  wire       [127:0]  ln_buf_io_pop_payload;
  wire       [9:0]    ln_buf_io_occupancy;
  wire       [9:0]    ln_buf_io_availability;
  wire                ln_scaleOut_fifo_io_push_ready;
  wire                ln_scaleOut_fifo_io_pop_valid;
  wire       [15:0]   ln_scaleOut_fifo_io_pop_payload;
  wire       [5:0]    ln_scaleOut_fifo_io_occupancy;
  wire       [5:0]    ln_scaleOut_fifo_io_availability;
  wire                dense_gen_io_bus_ready;
  wire                dense_gen_io_main_valid;
  wire                dense_gen_io_misc_valid;
  wire                dense_deMux_io_input_ready;
  wire                dense_deMux_io_outputs_0_valid;
  wire                dense_deMux_io_outputs_1_valid;
  wire                dense_scaleFifo_io_push_ready;
  wire                dense_scaleFifo_io_pop_valid;
  wire       [511:0]  dense_scaleFifo_io_pop_payload;
  wire       [3:0]    dense_scaleFifo_io_occupancy;
  wire       [3:0]    dense_scaleFifo_io_availability;
  wire                sparse_gen_io_bus_ready;
  wire                sparse_gen_io_main_valid;
  wire                sparse_gen_io_misc_valid;
  wire                sparse_preScaleFifo_io_push_ready;
  wire                sparse_preScaleFifo_io_pop_valid;
  wire       [15:0]   sparse_preScaleFifo_io_pop_payload;
  wire       [5:0]    sparse_preScaleFifo_io_occupancy;
  wire       [5:0]    sparse_preScaleFifo_io_availability;
  wire                sparse_postScaleFifo_io_push_ready;
  wire                sparse_postScaleFifo_io_pop_valid;
  wire       [15:0]   sparse_postScaleFifo_io_pop_payload;
  wire       [5:0]    sparse_postScaleFifo_io_occupancy;
  wire       [5:0]    sparse_postScaleFifo_io_availability;
  wire                sparse_zeroFifo_io_push_ready;
  wire                sparse_zeroFifo_io_pop_valid;
  wire       [3:0]    sparse_zeroFifo_io_pop_payload;
  wire       [6:0]    sparse_zeroFifo_io_occupancy;
  wire       [6:0]    sparse_zeroFifo_io_availability;
  wire                kv_gen_io_bus_ready;
  wire                kv_gen_io_main_valid;
  wire                kv_gen_io_misc_valid;
  wire                kv_extPackDeMux_io_input_ready;
  wire                kv_extPackDeMux_io_outputs_0_valid;
  wire       [31:0]   kv_extPackDeMux_io_outputs_0_payload;
  wire                kv_extPackDeMux_io_outputs_1_valid;
  wire       [31:0]   kv_extPackDeMux_io_outputs_1_payload;
  wire                kv_kMux_io_inputs_0_ready;
  wire                kv_kMux_io_inputs_1_ready;
  wire                kv_kMux_io_output_valid;
  wire       [31:0]   kv_kMux_io_output_payload;
  wire                kv_vMux_io_inputs_0_ready;
  wire                kv_vMux_io_inputs_1_ready;
  wire                kv_vMux_io_output_valid;
  wire       [31:0]   kv_vMux_io_output_payload;
  wire                kv_kFork_io_input_ready;
  wire                kv_kFork_io_outputs_0_valid;
  wire                kv_kFork_io_outputs_1_valid;
  wire                kv_vFork_io_input_ready;
  wire                kv_vFork_io_outputs_0_valid;
  wire                kv_vFork_io_outputs_1_valid;
  wire                kv_vScaleMux_io_inputs_0_ready;
  wire                kv_vScaleMux_io_inputs_1_ready;
  wire                kv_vScaleMux_io_output_valid;
  wire       [15:0]   kv_vScaleMux_io_output_payload;
  wire                zeroInt4Mux_io_inputs_0_ready;
  wire                zeroInt4Mux_io_inputs_1_ready;
  wire                zeroInt4Mux_io_output_valid;
  wire       [7:0]    zeroInt4Mux_io_output_payload;
  wire                vZeroFifo_io_push_ready;
  wire                vZeroFifo_io_pop_valid;
  wire       [7:0]    vZeroFifo_io_pop_payload;
  wire       [9:0]    vZeroFifo_io_occupancy;
  wire       [9:0]    vZeroFifo_io_availability;
  wire                vScaleFifo_io_push_ready;
  wire                vScaleFifo_io_pop_valid;
  wire       [15:0]   vScaleFifo_io_pop_payload;
  wire       [9:0]    vScaleFifo_io_occupancy;
  wire       [9:0]    vScaleFifo_io_availability;
  wire                zeroInt8Mux_io_inputs_0_ready;
  wire                zeroInt8Mux_io_inputs_1_ready;
  wire                zeroInt8Mux_io_inputs_2_ready;
  wire                zeroInt8Mux_io_output_valid;
  wire       [7:0]    zeroInt8Mux_io_output_payload;
  wire                denseScaleFifo_io_push_ready;
  wire                denseScaleFifo_io_pop_valid;
  wire       [31:0]   denseScaleFifo_io_pop_payload;
  wire       [9:0]    denseScaleFifo_io_occupancy;
  wire       [9:0]    denseScaleFifo_io_availability;
  wire                sparseScaleFifo_io_push_ready;
  wire                sparseScaleFifo_io_pop_valid;
  wire       [31:0]   sparseScaleFifo_io_pop_payload;
  wire       [9:0]    sparseScaleFifo_io_occupancy;
  wire       [9:0]    sparseScaleFifo_io_availability;
  wire                kScaleFifo_io_push_ready;
  wire                kScaleFifo_io_pop_valid;
  wire       [31:0]   kScaleFifo_io_pop_payload;
  wire       [9:0]    kScaleFifo_io_occupancy;
  wire       [9:0]    kScaleFifo_io_availability;
  wire                dense_scale_to_ip_s_axis_a_tready;
  wire                dense_scale_to_ip_m_axis_result_tvalid;
  wire       [31:0]   dense_scale_to_ip_m_axis_result_tdata;
  wire                axi_sparse_postScaleFifo_io_pop_to_ip_s_axis_a_tready;
  wire                axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tvalid;
  wire       [31:0]   axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tdata;
  wire                kv_kScale_to_ip_s_axis_a_tready;
  wire                kv_kScale_to_ip_m_axis_result_tvalid;
  wire       [31:0]   kv_kScale_to_ip_m_axis_result_tdata;
  wire                postScaleMux_io_inputs_0_ready;
  wire                postScaleMux_io_inputs_1_ready;
  wire                postScaleMux_io_inputs_2_ready;
  wire                postScaleMux_io_inputs_3_ready;
  wire                postScaleMux_io_output_valid;
  wire       [31:0]   postScaleMux_io_output_payload;
  wire                sparsePreScaleFifo_io_push_ready;
  wire                sparsePreScaleFifo_io_pop_valid;
  wire       [15:0]   sparsePreScaleFifo_io_pop_payload;
  wire       [9:0]    sparsePreScaleFifo_io_occupancy;
  wire       [9:0]    sparsePreScaleFifo_io_availability;
  wire                preScaleMux_io_inputs_0_ready;
  wire                preScaleMux_io_inputs_1_ready;
  wire                preScaleMux_io_inputs_2_ready;
  wire                preScaleMux_io_output_valid;
  wire       [15:0]   preScaleMux_io_output_payload;
  wire       [3:0]    t_tagFifoSel;
  wire       [3:0]    t_io_select;
  wire       [1:0]    t_t_io_push_payload_1;
  wire       [0:0]    t_t_io_push_payload_1_1;
  reg        [127:0]  t_io_push_payload_4;
  wire       [2:0]    t_t_ln_scaleOut_payload_1;
  wire       [0:0]    t_t_ln_scaleOut_payload_1_1;
  reg        [15:0]   t_ln_scaleOut_payload_4;
  wire       [4:0]    t_t_dense_scale_payload_1;
  wire       [0:0]    t_t_dense_scale_payload_1_1;
  reg        [15:0]   t_dense_scale_payload_4;
  wire       [6:0]    t_t_dense_zero_payload_1;
  wire       [0:0]    t_t_dense_zero_payload_1_1;
  reg        [3:0]    t_dense_zero_payload_4;
  wire       [7:0]    t_sparse_cntLv2Ovf;
  reg        [19:0]   t_sparse_packOut_payload;
  wire       [4:0]    t_sparse_packOut_payload_1;
  wire       [3:0]    t_t_kv_extPack_payload_1;
  wire       [0:0]    t_t_kv_extPack_payload_1_1;
  reg        [31:0]   t_kv_extPack_payload_4;
  wire       [12:0]   t_kv_kCntOvf;
  wire       [12:0]   t_kv_vCntOvf;
  wire       [8:0]    t_when;
  wire       [8:0]    t_when_1;
  wire       [15:0]   t_kv_kZero_payload;
  wire       [15:0]   t_kv_vZero_payload;
  wire       [5:0]    t_postCfgDenseHit;
  wire       [5:0]    t_postCfgDenseHit_1;
  wire       [5:0]    busTag;
  wire                mlpGBusHitNotSparse;
  wire                lnScaleHit;
  wire                denseHit;
  wire                sparseHit;
  wire                kvHit;
  reg        [2:0]    busDeMuxSel;
  reg        [1:0]    busMuxSel;
  reg        [1:0]    miscInMuxSel;
  wire                axi_busDataFifo_io_push_fire;
  wire                axi_busDataFifo_io_pop_fire;
  wire                isVOut;
  wire                axpyHit;
  wire                axi_miscFifo_io_push_fire;
  wire       [5:0]    tagFifoDest;
  wire       [1:0]    tagFifoSel;
  wire                axi_tagFifo_io_pop_fire;
  wire                ln_bufIn_valid;
  wire                ln_bufIn_ready;
  wire       [511:0]  ln_bufIn_payload;
  wire                axi_ln_buf_io_push_fire;
  reg                 t_io_push_payload;
  reg        [1:0]    t_io_push_payload_1;
  reg        [1:0]    t_io_push_payload_2;
  wire                t_ln_bufIn_ready;
  wire       [511:0]  t_io_push_payload_3;
  wire                ln_scaleOut_valid;
  wire                ln_scaleOut_ready;
  wire       [15:0]   ln_scaleOut_payload;
  wire                ln_scaleOut_fire;
  reg                 t_ln_scaleOut_payload;
  reg        [2:0]    t_ln_scaleOut_payload_1;
  reg        [2:0]    t_ln_scaleOut_payload_2;
  wire                t_io_pop_ready;
  wire       [127:0]  t_ln_scaleOut_payload_3;
  wire                dense_bus_valid;
  wire                dense_bus_ready;
  wire       [511:0]  dense_bus_payload;
  reg        [2:0]    dense_cnt;
  reg                 dense_cntIsZero;
  wire                dense_cntOvf;
  wire                dense_bus_fire;
  wire                dense_toScale_valid;
  wire                dense_toScale_ready;
  wire       [511:0]  dense_toScale_payload;
  wire                dense_toZero_valid;
  reg                 dense_toZero_ready;
  wire       [511:0]  dense_toZero_payload;
  wire                dense_scale_valid;
  wire                dense_scale_ready;
  wire       [15:0]   dense_scale_payload;
  wire                dense_scale_fire;
  reg                 t_dense_scale_payload;
  reg        [4:0]    t_dense_scale_payload_1;
  reg        [4:0]    t_dense_scale_payload_2;
  wire                t_io_pop_ready_1;
  wire       [511:0]  t_dense_scale_payload_3;
  wire                dense_zero_valid;
  reg                 dense_zero_ready;
  wire       [3:0]    dense_zero_payload;
  wire                dense_zeroPipe_valid;
  wire                dense_zeroPipe_ready;
  wire       [3:0]    dense_zeroPipe_payload;
  reg                 dense_zero_rValid;
  reg        [3:0]    dense_zero_rData;
  wire                dense_zeroAlign_valid;
  wire                dense_zeroAlign_ready;
  wire       [7:0]    dense_zeroAlign_payload;
  wire                dense_toZero_m2sPipe_valid;
  wire                dense_toZero_m2sPipe_ready;
  wire       [511:0]  dense_toZero_m2sPipe_payload;
  reg                 dense_toZero_rValid;
  reg        [511:0]  dense_toZero_rData;
  wire                dense_zero_fire;
  reg                 t_dense_zero_payload;
  reg        [6:0]    t_dense_zero_payload_1;
  reg        [6:0]    t_dense_zero_payload_2;
  wire                t_dense_toZero_m2sPipe_ready;
  wire       [511:0]  t_dense_zero_payload_3;
  wire                sparse_bus_valid;
  reg                 sparse_bus_ready;
  wire       [499:0]  sparse_bus_tdata;
  wire       [5:0]    sparse_bus_tuser;
  wire       [1:0]    sparse_tagHit;
  wire       [7:0]    sparse_packVec_0;
  wire       [7:0]    sparse_packVec_1;
  wire       [7:0]    sparse_packCnt;
  wire                sparse_packOut_valid;
  wire                sparse_packOut_ready;
  wire       [19:0]   sparse_packOut_payload;
  (* max_fanout = 100 *) reg        [7:0]    sparse_cntLv1;
  reg        [7:0]    sparse_cntLv2;
  wire                sparse_cntLv1Ovf;
  wire                sparse_cntLv2Ovf;
  wire                sparse_packOut_fire;
  wire       [19:0]   sparse_busPayloadSubDiv_0;
  wire       [19:0]   sparse_busPayloadSubDiv_1;
  wire       [19:0]   sparse_busPayloadSubDiv_2;
  wire       [19:0]   sparse_busPayloadSubDiv_3;
  wire       [19:0]   sparse_busPayloadSubDiv_4;
  wire       [19:0]   sparse_busPayloadSubDiv_5;
  wire       [19:0]   sparse_busPayloadSubDiv_6;
  wire       [19:0]   sparse_busPayloadSubDiv_7;
  wire       [19:0]   sparse_busPayloadSubDiv_8;
  wire       [19:0]   sparse_busPayloadSubDiv_9;
  wire       [19:0]   sparse_busPayloadSubDiv_10;
  wire       [19:0]   sparse_busPayloadSubDiv_11;
  wire       [19:0]   sparse_busPayloadSubDiv_12;
  wire       [19:0]   sparse_busPayloadSubDiv_13;
  wire       [19:0]   sparse_busPayloadSubDiv_14;
  wire       [19:0]   sparse_busPayloadSubDiv_15;
  wire       [19:0]   sparse_busPayloadSubDiv_16;
  wire       [19:0]   sparse_busPayloadSubDiv_17;
  wire       [19:0]   sparse_busPayloadSubDiv_18;
  wire       [19:0]   sparse_busPayloadSubDiv_19;
  wire       [19:0]   sparse_busPayloadSubDiv_20;
  wire       [19:0]   sparse_busPayloadSubDiv_21;
  wire       [19:0]   sparse_busPayloadSubDiv_22;
  wire       [19:0]   sparse_busPayloadSubDiv_23;
  wire       [19:0]   sparse_busPayloadSubDiv_24;
  wire                sparse_selAxpy;
  wire                sparse_zeroQueue_valid;
  wire                sparse_zeroQueue_ready;
  wire       [7:0]    sparse_zeroQueue_payload;
  wire                kv_bus_valid;
  wire                kv_bus_ready;
  wire       [511:0]  kv_bus_payload;
  wire                kv_extPack_valid;
  reg                 kv_extPack_ready;
  wire       [31:0]   kv_extPack_payload;
  wire                kv_extPack_fire;
  reg                 t_kv_extPack_payload;
  reg        [3:0]    t_kv_extPack_payload_1;
  reg        [3:0]    t_kv_extPack_payload_2;
  wire                t_kv_bus_ready;
  wire       [511:0]  t_kv_extPack_payload_3;
  wire                kv_kPack_valid;
  wire                kv_kPack_ready;
  wire       [31:0]   kv_kPack_payload;
  wire                kv_vPack_valid;
  wire                kv_vPack_ready;
  wire       [31:0]   kv_vPack_payload;
  wire                kv_isVOut;
  reg        [12:0]   kv_kCnt;
  wire                kv_kCntOvf;
  reg        [12:0]   kv_vCnt;
  wire                kv_vCntOvf;
  wire       [8:0]    kv_tokenHigh;
  wire       [8:0]    kv_kCntHigh;
  wire       [8:0]    kv_vCntHigh;
  wire       [3:0]    kv_kCntLow;
  wire       [3:0]    kv_vCntLow;
  reg                 kv_tokenHighZeroDly;
  reg                 kv_kCntHighMatch;
  wire                kv_kPack_fire;
  reg                 kv_vCntHighMatch;
  wire                kv_vPack_fire;
  wire                kv_kSelLocal;
  wire                kv_vSelLocal;
  wire                kv_extPack_m2sPipe_valid;
  wire                kv_extPack_m2sPipe_ready;
  wire       [31:0]   kv_extPack_m2sPipe_payload;
  reg                 kv_extPack_rValid;
  reg        [31:0]   kv_extPack_rData;
  wire                kv_kScale_valid;
  wire                kv_kScale_ready;
  wire       [15:0]   kv_kScale_payload;
  wire                kv_kZero_valid;
  wire                kv_kZero_ready;
  wire       [7:0]    kv_kZero_payload;
  wire                kv_vScalePreInsert_valid;
  wire                kv_vScalePreInsert_ready;
  wire       [15:0]   kv_vScalePreInsert_payload;
  wire                kv_vZero_valid;
  wire                kv_vZero_ready;
  wire       [7:0]    kv_vZero_payload;
  wire                kv_vScale_valid;
  wire                kv_vScale_ready;
  wire       [15:0]   kv_vScale_payload;
  wire                kv_vScaleOne_valid;
  wire                kv_vScaleOne_ready;
  wire       [15:0]   kv_vScaleOne_payload;
  reg        [12:0]   kv_vScaleCnt;
  reg                 kv_vScaleCntIsZero;
  wire                kv_vScale_fire;
  wire                postMlpGBusHitNotSparse;
  wire                postSparseHit;
  wire                postKHit;
  wire                postVHit;
  wire                postMlpCfgHitNotSparse;
  wire                postCfgDenseHit;
  wire                postCfgSparseHit;
  wire                postCfgKvHit;
  reg        [1:0]    postSel;
  wire                preCfgSparseHit;
  wire                preCfgKvHit;
  reg        [1:0]    preSel;

  assign t_tagFifoSel = tagFifo_io_pop_payload[9 : 6];
  assign t_io_select = tagFifo_io_pop_payload[9 : 6];
  assign t_t_io_push_payload_1_1 = t_io_push_payload;
  assign t_t_io_push_payload_1 = {1'd0, t_t_io_push_payload_1_1};
  assign t_t_ln_scaleOut_payload_1_1 = t_ln_scaleOut_payload;
  assign t_t_ln_scaleOut_payload_1 = {2'd0, t_t_ln_scaleOut_payload_1_1};
  assign t_t_dense_scale_payload_1_1 = t_dense_scale_payload;
  assign t_t_dense_scale_payload_1 = {4'd0, t_t_dense_scale_payload_1_1};
  assign t_t_dense_zero_payload_1_1 = t_dense_zero_payload;
  assign t_t_dense_zero_payload_1 = {6'd0, t_t_dense_zero_payload_1_1};
  assign t_sparse_cntLv2Ovf = (sparse_packCnt - 8'h01);
  assign t_sparse_packOut_payload_1 = sparse_cntLv1[4:0];
  assign t_t_kv_extPack_payload_1_1 = t_kv_extPack_payload;
  assign t_t_kv_extPack_payload_1 = {3'd0, t_t_kv_extPack_payload_1_1};
  assign t_kv_kCntOvf = (io_token - 13'h0001);
  assign t_kv_vCntOvf = (io_token - 13'h0001);
  assign t_when = (kv_tokenHigh - 9'h001);
  assign t_when_1 = (kv_tokenHigh - 9'h001);
  assign t_kv_kZero_payload = kv_kPack_payload[31 : 16];
  assign t_kv_vZero_payload = kv_vPack_payload[31 : 16];
  assign t_postCfgDenseHit = 6'h05;
  assign t_postCfgDenseHit_1 = 6'h06;
  StreamDemux_7 busDeMux (
    .io_select          (busDeMuxSel[2:0]           ), //i
    .io_input_valid     (io_bus_valid               ), //i
    .io_input_ready     (busDeMux_io_input_ready    ), //o
    .io_outputs_0_valid (busDeMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (busMux_io_inputs_0_ready   ), //i
    .io_outputs_1_valid (busDeMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (dense_gen_io_bus_ready     ), //i
    .io_outputs_2_valid (busDeMux_io_outputs_2_valid), //o
    .io_outputs_2_ready (sparse_gen_io_bus_ready    ), //i
    .io_outputs_3_valid (busDeMux_io_outputs_3_valid), //o
    .io_outputs_3_ready (kv_gen_io_bus_ready        ), //i
    .io_outputs_4_valid (busDeMux_io_outputs_4_valid), //o
    .io_outputs_4_ready (ln_bufIn_ready             )  //i
  );
  StreamMux_21 busMux (
    .io_select         (busMuxSel[1:0]             ), //i
    .io_inputs_0_valid (busDeMux_io_outputs_0_valid), //i
    .io_inputs_0_ready (busMux_io_inputs_0_ready   ), //o
    .io_inputs_1_valid (dense_gen_io_main_valid    ), //i
    .io_inputs_1_ready (busMux_io_inputs_1_ready   ), //o
    .io_inputs_2_valid (sparse_gen_io_main_valid   ), //i
    .io_inputs_2_ready (busMux_io_inputs_2_ready   ), //o
    .io_inputs_3_valid (kv_gen_io_main_valid       ), //i
    .io_inputs_3_ready (busMux_io_inputs_3_ready   ), //o
    .io_output_valid   (busMux_io_output_valid     ), //o
    .io_output_ready   (busDataFifo_io_push_ready  )  //i
  );
  StreamMux_22 miscInMux (
    .io_select         (miscInMuxSel[1:0]          ), //i
    .io_inputs_0_valid (dense_gen_io_misc_valid    ), //i
    .io_inputs_0_ready (miscInMux_io_inputs_0_ready), //o
    .io_inputs_1_valid (sparse_gen_io_misc_valid   ), //i
    .io_inputs_1_ready (miscInMux_io_inputs_1_ready), //o
    .io_inputs_2_valid (kv_gen_io_misc_valid       ), //i
    .io_inputs_2_ready (miscInMux_io_inputs_2_ready), //o
    .io_output_valid   (miscInMux_io_output_valid  ), //o
    .io_output_ready   (miscFifo_io_push_ready     )  //i
  );
  LargeBankFifo_2 busDataFifo (
    .io_push_valid   (busMux_io_output_valid           ), //i
    .io_push_ready   (busDataFifo_io_push_ready        ), //o
    .io_push_payload (io_bus_payload_data[511:0]       ), //i
    .io_pop_valid    (busDataFifo_io_pop_valid         ), //o
    .io_pop_ready    (int_bus_ready                    ), //i
    .io_pop_payload  (busDataFifo_io_pop_payload[511:0]), //o
    .io_occupancy    (busDataFifo_io_occupancy[5:0]    ), //o
    .io_availability (busDataFifo_io_availability[5:0] ), //o
    .clk_1_clk       (clk_1_clk                        ), //i
    .clk_1_resetn    (clk_1_resetn                     )  //i
  );
  StreamFifo_11 busLinkFifo (
    .io_push_valid            (axi_busDataFifo_io_push_fire             ), //i
    .io_push_ready            (busLinkFifo_io_push_ready                ), //o
    .io_push_payload_last     (io_bus_payload_last                      ), //i
    .io_push_payload_fragment (busLinkFifo_io_push_payload_fragment[5:0]), //i
    .io_pop_valid             (busLinkFifo_io_pop_valid                 ), //o
    .io_pop_ready             (axi_busDataFifo_io_pop_fire              ), //i
    .io_pop_payload_last      (busLinkFifo_io_pop_payload_last          ), //o
    .io_pop_payload_fragment  (busLinkFifo_io_pop_payload_fragment[5:0] ), //o
    .io_flush                 (1'b0                                     ), //i
    .io_occupancy             (busLinkFifo_io_occupancy[5:0]            ), //o
    .io_availability          (busLinkFifo_io_availability[5:0]         ), //o
    .clk_1_clk                (clk_1_clk                                ), //i
    .clk_1_resetn             (clk_1_resetn                             )  //i
  );
  LargeBankFifo_3 miscFifo (
    .io_push_valid   (miscInMux_io_output_valid     ), //i
    .io_push_ready   (miscFifo_io_push_ready        ), //o
    .io_push_payload (io_bus_payload_data[511:0]    ), //i
    .io_pop_valid    (miscFifo_io_pop_valid         ), //o
    .io_pop_ready    (axi_tagFifo_io_pop_fire       ), //i
    .io_pop_payload  (miscFifo_io_pop_payload[511:0]), //o
    .io_occupancy    (miscFifo_io_occupancy[9:0]    ), //o
    .io_availability (miscFifo_io_availability[9:0] ), //o
    .clk_1_clk       (clk_1_clk                     ), //i
    .clk_1_resetn    (clk_1_resetn                  )  //i
  );
  StreamFifo_12 tagFifo (
    .io_push_valid   (axi_miscFifo_io_push_fire   ), //i
    .io_push_ready   (tagFifo_io_push_ready       ), //o
    .io_push_payload (tagFifo_io_push_payload[9:0]), //i
    .io_pop_valid    (tagFifo_io_pop_valid        ), //o
    .io_pop_ready    (miscOutDeMux_io_input_ready ), //i
    .io_pop_payload  (tagFifo_io_pop_payload[9:0] ), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (tagFifo_io_occupancy[9:0]   ), //o
    .io_availability (tagFifo_io_availability[9:0]), //o
    .clk_1_clk       (clk_1_clk                   ), //i
    .clk_1_resetn    (clk_1_resetn                )  //i
  );
  StreamDemux_8 miscOutDeMux (
    .io_select          (miscOutDeMux_io_select[1:0]    ), //i
    .io_input_valid     (tagFifo_io_pop_valid           ), //i
    .io_input_ready     (miscOutDeMux_io_input_ready    ), //o
    .io_outputs_0_valid (miscOutDeMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (dense_bus_ready                ), //i
    .io_outputs_1_valid (miscOutDeMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (sparse_bus_ready               ), //i
    .io_outputs_2_valid (miscOutDeMux_io_outputs_2_valid), //o
    .io_outputs_2_ready (kv_bus_ready                   )  //i
  );
  StreamFifo_86 ln_buf (
    .io_push_valid   (ln_bufIn_valid               ), //i
    .io_push_ready   (ln_buf_io_push_ready         ), //o
    .io_push_payload (ln_buf_io_push_payload[127:0]), //i
    .io_pop_valid    (ln_buf_io_pop_valid          ), //o
    .io_pop_ready    (ln_buf_io_pop_ready          ), //i
    .io_pop_payload  (ln_buf_io_pop_payload[127:0] ), //o
    .io_flush        (1'b0                         ), //i
    .io_occupancy    (ln_buf_io_occupancy[9:0]     ), //o
    .io_availability (ln_buf_io_availability[9:0]  ), //o
    .clk_1_clk       (clk_1_clk                    ), //i
    .clk_1_resetn    (clk_1_resetn                 )  //i
  );
  StreamFifo_80 ln_scaleOut_fifo (
    .io_push_valid   (ln_scaleOut_valid                    ), //i
    .io_push_ready   (ln_scaleOut_fifo_io_push_ready       ), //o
    .io_push_payload (ln_scaleOut_payload[15:0]            ), //i
    .io_pop_valid    (ln_scaleOut_fifo_io_pop_valid        ), //o
    .io_pop_ready    (int_lnScale_ready                    ), //i
    .io_pop_payload  (ln_scaleOut_fifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                                 ), //i
    .io_occupancy    (ln_scaleOut_fifo_io_occupancy[5:0]   ), //o
    .io_availability (ln_scaleOut_fifo_io_availability[5:0]), //o
    .clk_1_clk       (clk_1_clk                            ), //i
    .clk_1_resetn    (clk_1_resetn                         )  //i
  );
  DenseCase dense_gen (
    .io_bus_valid  (busDeMux_io_outputs_1_valid), //i
    .io_bus_ready  (dense_gen_io_bus_ready     ), //o
    .io_main_valid (dense_gen_io_main_valid    ), //o
    .io_main_ready (busMux_io_inputs_1_ready   ), //i
    .io_misc_valid (dense_gen_io_misc_valid    ), //o
    .io_misc_ready (miscInMux_io_inputs_0_ready), //i
    .clk_1_clk     (clk_1_clk                  ), //i
    .clk_1_resetn  (clk_1_resetn               )  //i
  );
  StreamDemux_17 dense_deMux (
    .io_select          (dense_deMux_io_select         ), //i
    .io_input_valid     (dense_bus_valid               ), //i
    .io_input_ready     (dense_deMux_io_input_ready    ), //o
    .io_outputs_0_valid (dense_deMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (dense_toScale_ready           ), //i
    .io_outputs_1_valid (dense_deMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (dense_toZero_ready            )  //i
  );
  LargeBankFifo_4 dense_scaleFifo (
    .io_push_valid   (dense_toScale_valid                  ), //i
    .io_push_ready   (dense_scaleFifo_io_push_ready        ), //o
    .io_push_payload (dense_toScale_payload[511:0]         ), //i
    .io_pop_valid    (dense_scaleFifo_io_pop_valid         ), //o
    .io_pop_ready    (dense_scaleFifo_io_pop_ready         ), //i
    .io_pop_payload  (dense_scaleFifo_io_pop_payload[511:0]), //o
    .io_occupancy    (dense_scaleFifo_io_occupancy[3:0]    ), //o
    .io_availability (dense_scaleFifo_io_availability[3:0] ), //o
    .clk_1_clk       (clk_1_clk                            ), //i
    .clk_1_resetn    (clk_1_resetn                         )  //i
  );
  SparseCase sparse_gen (
    .io_tag        (sparse_gen_io_tag[5:0]     ), //i
    .io_bus_valid  (busDeMux_io_outputs_2_valid), //i
    .io_bus_ready  (sparse_gen_io_bus_ready    ), //o
    .io_main_valid (sparse_gen_io_main_valid   ), //o
    .io_main_ready (busMux_io_inputs_2_ready   ), //i
    .io_misc_valid (sparse_gen_io_misc_valid   ), //o
    .io_misc_ready (miscInMux_io_inputs_1_ready), //i
    .clk_1_clk     (clk_1_clk                  ), //i
    .clk_1_resetn  (clk_1_resetn               )  //i
  );
  StreamFifo_80 sparse_preScaleFifo (
    .io_push_valid   (sparse_preScaleFifo_io_push_valid        ), //i
    .io_push_ready   (sparse_preScaleFifo_io_push_ready        ), //o
    .io_push_payload (sparse_preScaleFifo_io_push_payload[15:0]), //i
    .io_pop_valid    (sparse_preScaleFifo_io_pop_valid         ), //o
    .io_pop_ready    (sparsePreScaleFifo_io_push_ready         ), //i
    .io_pop_payload  (sparse_preScaleFifo_io_pop_payload[15:0] ), //o
    .io_flush        (1'b0                                     ), //i
    .io_occupancy    (sparse_preScaleFifo_io_occupancy[5:0]    ), //o
    .io_availability (sparse_preScaleFifo_io_availability[5:0] ), //o
    .clk_1_clk       (clk_1_clk                                ), //i
    .clk_1_resetn    (clk_1_resetn                             )  //i
  );
  StreamFifo_80 sparse_postScaleFifo (
    .io_push_valid   (sparse_postScaleFifo_io_push_valid                   ), //i
    .io_push_ready   (sparse_postScaleFifo_io_push_ready                   ), //o
    .io_push_payload (sparse_postScaleFifo_io_push_payload[15:0]           ), //i
    .io_pop_valid    (sparse_postScaleFifo_io_pop_valid                    ), //o
    .io_pop_ready    (axi_sparse_postScaleFifo_io_pop_to_ip_s_axis_a_tready), //i
    .io_pop_payload  (sparse_postScaleFifo_io_pop_payload[15:0]            ), //o
    .io_flush        (1'b0                                                 ), //i
    .io_occupancy    (sparse_postScaleFifo_io_occupancy[5:0]               ), //o
    .io_availability (sparse_postScaleFifo_io_availability[5:0]            ), //o
    .clk_1_clk       (clk_1_clk                                            ), //i
    .clk_1_resetn    (clk_1_resetn                                         )  //i
  );
  StreamFifo_17 sparse_zeroFifo (
    .io_push_valid   (sparse_packOut_valid                ), //i
    .io_push_ready   (sparse_zeroFifo_io_push_ready       ), //o
    .io_push_payload (sparse_zeroFifo_io_push_payload[3:0]), //i
    .io_pop_valid    (sparse_zeroFifo_io_pop_valid        ), //o
    .io_pop_ready    (sparse_zeroQueue_ready              ), //i
    .io_pop_payload  (sparse_zeroFifo_io_pop_payload[3:0] ), //o
    .io_flush        (1'b0                                ), //i
    .io_occupancy    (sparse_zeroFifo_io_occupancy[6:0]   ), //o
    .io_availability (sparse_zeroFifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                           ), //i
    .clk_1_resetn    (clk_1_resetn                        )  //i
  );
  KvCacheCase kv_gen (
    .io_token      (io_token[12:0]             ), //i
    .io_bus_valid  (busDeMux_io_outputs_3_valid), //i
    .io_bus_ready  (kv_gen_io_bus_ready        ), //o
    .io_main_valid (kv_gen_io_main_valid       ), //o
    .io_main_ready (busMux_io_inputs_3_ready   ), //i
    .io_misc_valid (kv_gen_io_misc_valid       ), //o
    .io_misc_ready (miscInMux_io_inputs_2_ready), //i
    .clk_1_clk     (clk_1_clk                  ), //i
    .clk_1_resetn  (clk_1_resetn               )  //i
  );
  StreamDemux_25 kv_extPackDeMux (
    .io_select            (kv_extPackDeMux_io_select                 ), //i
    .io_input_valid       (kv_extPack_m2sPipe_valid                  ), //i
    .io_input_ready       (kv_extPackDeMux_io_input_ready            ), //o
    .io_input_payload     (kv_extPack_m2sPipe_payload[31:0]          ), //i
    .io_outputs_0_valid   (kv_extPackDeMux_io_outputs_0_valid        ), //o
    .io_outputs_0_ready   (kv_kMux_io_inputs_0_ready                 ), //i
    .io_outputs_0_payload (kv_extPackDeMux_io_outputs_0_payload[31:0]), //o
    .io_outputs_1_valid   (kv_extPackDeMux_io_outputs_1_valid        ), //o
    .io_outputs_1_ready   (kv_vMux_io_inputs_0_ready                 ), //i
    .io_outputs_1_payload (kv_extPackDeMux_io_outputs_1_payload[31:0])  //o
  );
  StreamMux_23 kv_kMux (
    .io_select           (kv_kMux_io_select                         ), //i
    .io_inputs_0_valid   (kv_extPackDeMux_io_outputs_0_valid        ), //i
    .io_inputs_0_ready   (kv_kMux_io_inputs_0_ready                 ), //o
    .io_inputs_0_payload (kv_extPackDeMux_io_outputs_0_payload[31:0]), //i
    .io_inputs_1_valid   (io_kSzOut_valid                           ), //i
    .io_inputs_1_ready   (kv_kMux_io_inputs_1_ready                 ), //o
    .io_inputs_1_payload (io_kSzOut_payload[31:0]                   ), //i
    .io_output_valid     (kv_kMux_io_output_valid                   ), //o
    .io_output_ready     (kv_kPack_ready                            ), //i
    .io_output_payload   (kv_kMux_io_output_payload[31:0]           )  //o
  );
  StreamMux_23 kv_vMux (
    .io_select           (kv_vMux_io_select                         ), //i
    .io_inputs_0_valid   (kv_extPackDeMux_io_outputs_1_valid        ), //i
    .io_inputs_0_ready   (kv_vMux_io_inputs_0_ready                 ), //o
    .io_inputs_0_payload (kv_extPackDeMux_io_outputs_1_payload[31:0]), //i
    .io_inputs_1_valid   (io_vSzOut_valid                           ), //i
    .io_inputs_1_ready   (kv_vMux_io_inputs_1_ready                 ), //o
    .io_inputs_1_payload (io_vSzOut_payload[31:0]                   ), //i
    .io_output_valid     (kv_vMux_io_output_valid                   ), //o
    .io_output_ready     (kv_vPack_ready                            ), //i
    .io_output_payload   (kv_vMux_io_output_payload[31:0]           )  //o
  );
  StreamFork kv_kFork (
    .io_input_valid     (kv_kPack_valid             ), //i
    .io_input_ready     (kv_kFork_io_input_ready    ), //o
    .io_outputs_0_valid (kv_kFork_io_outputs_0_valid), //o
    .io_outputs_0_ready (kv_kScale_ready            ), //i
    .io_outputs_1_valid (kv_kFork_io_outputs_1_valid), //o
    .io_outputs_1_ready (kv_kZero_ready             ), //i
    .clk_1_clk          (clk_1_clk                  ), //i
    .clk_1_resetn       (clk_1_resetn               )  //i
  );
  StreamFork kv_vFork (
    .io_input_valid     (kv_vPack_valid             ), //i
    .io_input_ready     (kv_vFork_io_input_ready    ), //o
    .io_outputs_0_valid (kv_vFork_io_outputs_0_valid), //o
    .io_outputs_0_ready (kv_vScalePreInsert_ready   ), //i
    .io_outputs_1_valid (kv_vFork_io_outputs_1_valid), //o
    .io_outputs_1_ready (kv_vZero_ready             ), //i
    .clk_1_clk          (clk_1_clk                  ), //i
    .clk_1_resetn       (clk_1_resetn               )  //i
  );
  StreamMux_25 kv_vScaleMux (
    .io_select           (kv_vScaleMux_io_select              ), //i
    .io_inputs_0_valid   (kv_vScalePreInsert_valid            ), //i
    .io_inputs_0_ready   (kv_vScaleMux_io_inputs_0_ready      ), //o
    .io_inputs_0_payload (kv_vScalePreInsert_payload[15:0]    ), //i
    .io_inputs_1_valid   (kv_vScaleOne_valid                  ), //i
    .io_inputs_1_ready   (kv_vScaleMux_io_inputs_1_ready      ), //o
    .io_inputs_1_payload (kv_vScaleOne_payload[15:0]          ), //i
    .io_output_valid     (kv_vScaleMux_io_output_valid        ), //o
    .io_output_ready     (kv_vScale_ready                     ), //i
    .io_output_payload   (kv_vScaleMux_io_output_payload[15:0])  //o
  );
  StreamMux_41 zeroInt4Mux (
    .io_select           (zeroInt4Mux_io_select             ), //i
    .io_inputs_0_valid   (dense_zeroAlign_valid             ), //i
    .io_inputs_0_ready   (zeroInt4Mux_io_inputs_0_ready     ), //o
    .io_inputs_0_payload (dense_zeroAlign_payload[7:0]      ), //i
    .io_inputs_1_valid   (sparse_zeroQueue_valid            ), //i
    .io_inputs_1_ready   (zeroInt4Mux_io_inputs_1_ready     ), //o
    .io_inputs_1_payload (sparse_zeroQueue_payload[7:0]     ), //i
    .io_output_valid     (zeroInt4Mux_io_output_valid       ), //o
    .io_output_ready     (int_zeroInt4_ready                ), //i
    .io_output_payload   (zeroInt4Mux_io_output_payload[7:0])  //o
  );
  StreamFifo_18 vZeroFifo (
    .io_push_valid   (kv_vZero_valid                ), //i
    .io_push_ready   (vZeroFifo_io_push_ready       ), //o
    .io_push_payload (kv_vZero_payload[7:0]         ), //i
    .io_pop_valid    (vZeroFifo_io_pop_valid        ), //o
    .io_pop_ready    (zeroInt8Mux_io_inputs_2_ready ), //i
    .io_pop_payload  (vZeroFifo_io_pop_payload[7:0] ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (vZeroFifo_io_occupancy[9:0]   ), //o
    .io_availability (vZeroFifo_io_availability[9:0]), //o
    .clk_1_clk       (clk_1_clk                     ), //i
    .clk_1_resetn    (clk_1_resetn                  )  //i
  );
  StreamFifo_19 vScaleFifo (
    .io_push_valid   (kv_vScale_valid                ), //i
    .io_push_ready   (vScaleFifo_io_push_ready       ), //o
    .io_push_payload (kv_vScale_payload[15:0]        ), //i
    .io_pop_valid    (vScaleFifo_io_pop_valid        ), //o
    .io_pop_ready    (preScaleMux_io_inputs_1_ready  ), //i
    .io_pop_payload  (vScaleFifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                           ), //i
    .io_occupancy    (vScaleFifo_io_occupancy[9:0]   ), //o
    .io_availability (vScaleFifo_io_availability[9:0]), //o
    .clk_1_clk       (clk_1_clk                      ), //i
    .clk_1_resetn    (clk_1_resetn                   )  //i
  );
  StreamMux_27 zeroInt8Mux (
    .io_select           (zeroInt8Mux_io_select[1:0]        ), //i
    .io_inputs_0_valid   (1'b0                              ), //i
    .io_inputs_0_ready   (zeroInt8Mux_io_inputs_0_ready     ), //o
    .io_inputs_0_payload (8'h0                              ), //i
    .io_inputs_1_valid   (kv_kZero_valid                    ), //i
    .io_inputs_1_ready   (zeroInt8Mux_io_inputs_1_ready     ), //o
    .io_inputs_1_payload (kv_kZero_payload[7:0]             ), //i
    .io_inputs_2_valid   (vZeroFifo_io_pop_valid            ), //i
    .io_inputs_2_ready   (zeroInt8Mux_io_inputs_2_ready     ), //o
    .io_inputs_2_payload (vZeroFifo_io_pop_payload[7:0]     ), //i
    .io_output_valid     (zeroInt8Mux_io_output_valid       ), //o
    .io_output_ready     (int_zeroInt8_ready                ), //i
    .io_output_payload   (zeroInt8Mux_io_output_payload[7:0])  //o
  );
  StreamFifo_20 denseScaleFifo (
    .io_push_valid   (dense_scale_to_ip_m_axis_result_tvalid     ), //i
    .io_push_ready   (denseScaleFifo_io_push_ready               ), //o
    .io_push_payload (dense_scale_to_ip_m_axis_result_tdata[31:0]), //i
    .io_pop_valid    (denseScaleFifo_io_pop_valid                ), //o
    .io_pop_ready    (postScaleMux_io_inputs_0_ready             ), //i
    .io_pop_payload  (denseScaleFifo_io_pop_payload[31:0]        ), //o
    .io_flush        (1'b0                                       ), //i
    .io_occupancy    (denseScaleFifo_io_occupancy[9:0]           ), //o
    .io_availability (denseScaleFifo_io_availability[9:0]        ), //o
    .clk_1_clk       (clk_1_clk                                  ), //i
    .clk_1_resetn    (clk_1_resetn                               )  //i
  );
  StreamFifo_20 sparseScaleFifo (
    .io_push_valid   (axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tvalid     ), //i
    .io_push_ready   (sparseScaleFifo_io_push_ready                                  ), //o
    .io_push_payload (axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tdata[31:0]), //i
    .io_pop_valid    (sparseScaleFifo_io_pop_valid                                   ), //o
    .io_pop_ready    (postScaleMux_io_inputs_1_ready                                 ), //i
    .io_pop_payload  (sparseScaleFifo_io_pop_payload[31:0]                           ), //o
    .io_flush        (1'b0                                                           ), //i
    .io_occupancy    (sparseScaleFifo_io_occupancy[9:0]                              ), //o
    .io_availability (sparseScaleFifo_io_availability[9:0]                           ), //o
    .clk_1_clk       (clk_1_clk                                                      ), //i
    .clk_1_resetn    (clk_1_resetn                                                   )  //i
  );
  StreamFifo_20 kScaleFifo (
    .io_push_valid   (kv_kScale_to_ip_m_axis_result_tvalid     ), //i
    .io_push_ready   (kScaleFifo_io_push_ready                 ), //o
    .io_push_payload (kv_kScale_to_ip_m_axis_result_tdata[31:0]), //i
    .io_pop_valid    (kScaleFifo_io_pop_valid                  ), //o
    .io_pop_ready    (postScaleMux_io_inputs_2_ready           ), //i
    .io_pop_payload  (kScaleFifo_io_pop_payload[31:0]          ), //o
    .io_flush        (1'b0                                     ), //i
    .io_occupancy    (kScaleFifo_io_occupancy[9:0]             ), //o
    .io_availability (kScaleFifo_io_availability[9:0]          ), //o
    .clk_1_clk       (clk_1_clk                                ), //i
    .clk_1_resetn    (clk_1_resetn                             )  //i
  );
  fp16toFp32s dense_scale_to_ip (
    .aclk                 (clk_1_clk                                  ), //i
    .s_axis_a_tvalid      (dense_scale_valid                          ), //i
    .s_axis_a_tready      (dense_scale_to_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (dense_scale_payload[15:0]                  ), //i
    .m_axis_result_tvalid (dense_scale_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (denseScaleFifo_io_push_ready               ), //i
    .m_axis_result_tdata  (dense_scale_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32s axi_sparse_postScaleFifo_io_pop_to_ip (
    .aclk                 (clk_1_clk                                                      ), //i
    .s_axis_a_tvalid      (sparse_postScaleFifo_io_pop_valid                              ), //i
    .s_axis_a_tready      (axi_sparse_postScaleFifo_io_pop_to_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (sparse_postScaleFifo_io_pop_payload[15:0]                      ), //i
    .m_axis_result_tvalid (axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (sparseScaleFifo_io_push_ready                                  ), //i
    .m_axis_result_tdata  (axi_sparse_postScaleFifo_io_pop_to_ip_m_axis_result_tdata[31:0])  //o
  );
  fp16toFp32s kv_kScale_to_ip (
    .aclk                 (clk_1_clk                                ), //i
    .s_axis_a_tvalid      (kv_kScale_valid                          ), //i
    .s_axis_a_tready      (kv_kScale_to_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (kv_kScale_payload[15:0]                  ), //i
    .m_axis_result_tvalid (kv_kScale_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (kScaleFifo_io_push_ready                 ), //i
    .m_axis_result_tdata  (kv_kScale_to_ip_m_axis_result_tdata[31:0])  //o
  );
  StreamMux_28 postScaleMux (
    .io_select           (postSel[1:0]                        ), //i
    .io_inputs_0_valid   (denseScaleFifo_io_pop_valid         ), //i
    .io_inputs_0_ready   (postScaleMux_io_inputs_0_ready      ), //o
    .io_inputs_0_payload (denseScaleFifo_io_pop_payload[31:0] ), //i
    .io_inputs_1_valid   (sparseScaleFifo_io_pop_valid        ), //i
    .io_inputs_1_ready   (postScaleMux_io_inputs_1_ready      ), //o
    .io_inputs_1_payload (sparseScaleFifo_io_pop_payload[31:0]), //i
    .io_inputs_2_valid   (kScaleFifo_io_pop_valid             ), //i
    .io_inputs_2_ready   (postScaleMux_io_inputs_2_ready      ), //o
    .io_inputs_2_payload (kScaleFifo_io_pop_payload[31:0]     ), //i
    .io_inputs_3_valid   (1'b0                                ), //i
    .io_inputs_3_ready   (postScaleMux_io_inputs_3_ready      ), //o
    .io_inputs_3_payload (32'h0                               ), //i
    .io_output_valid     (postScaleMux_io_output_valid        ), //o
    .io_output_ready     (int_postScale_ready                 ), //i
    .io_output_payload   (postScaleMux_io_output_payload[31:0])  //o
  );
  StreamFifo_19 sparsePreScaleFifo (
    .io_push_valid   (sparse_preScaleFifo_io_pop_valid        ), //i
    .io_push_ready   (sparsePreScaleFifo_io_push_ready        ), //o
    .io_push_payload (sparse_preScaleFifo_io_pop_payload[15:0]), //i
    .io_pop_valid    (sparsePreScaleFifo_io_pop_valid         ), //o
    .io_pop_ready    (preScaleMux_io_inputs_0_ready           ), //i
    .io_pop_payload  (sparsePreScaleFifo_io_pop_payload[15:0] ), //o
    .io_flush        (1'b0                                    ), //i
    .io_occupancy    (sparsePreScaleFifo_io_occupancy[9:0]    ), //o
    .io_availability (sparsePreScaleFifo_io_availability[9:0] ), //o
    .clk_1_clk       (clk_1_clk                               ), //i
    .clk_1_resetn    (clk_1_resetn                            )  //i
  );
  StreamMux_29 preScaleMux (
    .io_select           (preSel[1:0]                            ), //i
    .io_inputs_0_valid   (sparsePreScaleFifo_io_pop_valid        ), //i
    .io_inputs_0_ready   (preScaleMux_io_inputs_0_ready          ), //o
    .io_inputs_0_payload (sparsePreScaleFifo_io_pop_payload[15:0]), //i
    .io_inputs_1_valid   (vScaleFifo_io_pop_valid                ), //i
    .io_inputs_1_ready   (preScaleMux_io_inputs_1_ready          ), //o
    .io_inputs_1_payload (vScaleFifo_io_pop_payload[15:0]        ), //i
    .io_inputs_2_valid   (1'b0                                   ), //i
    .io_inputs_2_ready   (preScaleMux_io_inputs_2_ready          ), //o
    .io_inputs_2_payload (16'h0                                  ), //i
    .io_output_valid     (preScaleMux_io_output_valid            ), //o
    .io_output_ready     (int_preScale_ready                     ), //i
    .io_output_payload   (preScaleMux_io_output_payload[15:0]    )  //o
  );
  always @(*) begin
    case(t_io_push_payload_2)
      2'b00 : t_io_push_payload_4 = t_io_push_payload_3[127 : 0];
      2'b01 : t_io_push_payload_4 = t_io_push_payload_3[255 : 128];
      2'b10 : t_io_push_payload_4 = t_io_push_payload_3[383 : 256];
      default : t_io_push_payload_4 = t_io_push_payload_3[511 : 384];
    endcase
  end

  always @(*) begin
    case(t_ln_scaleOut_payload_2)
      3'b000 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[15 : 0];
      3'b001 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[31 : 16];
      3'b010 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[47 : 32];
      3'b011 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[63 : 48];
      3'b100 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[79 : 64];
      3'b101 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[95 : 80];
      3'b110 : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[111 : 96];
      default : t_ln_scaleOut_payload_4 = t_ln_scaleOut_payload_3[127 : 112];
    endcase
  end

  always @(*) begin
    case(t_dense_scale_payload_2)
      5'b00000 : t_dense_scale_payload_4 = t_dense_scale_payload_3[15 : 0];
      5'b00001 : t_dense_scale_payload_4 = t_dense_scale_payload_3[31 : 16];
      5'b00010 : t_dense_scale_payload_4 = t_dense_scale_payload_3[47 : 32];
      5'b00011 : t_dense_scale_payload_4 = t_dense_scale_payload_3[63 : 48];
      5'b00100 : t_dense_scale_payload_4 = t_dense_scale_payload_3[79 : 64];
      5'b00101 : t_dense_scale_payload_4 = t_dense_scale_payload_3[95 : 80];
      5'b00110 : t_dense_scale_payload_4 = t_dense_scale_payload_3[111 : 96];
      5'b00111 : t_dense_scale_payload_4 = t_dense_scale_payload_3[127 : 112];
      5'b01000 : t_dense_scale_payload_4 = t_dense_scale_payload_3[143 : 128];
      5'b01001 : t_dense_scale_payload_4 = t_dense_scale_payload_3[159 : 144];
      5'b01010 : t_dense_scale_payload_4 = t_dense_scale_payload_3[175 : 160];
      5'b01011 : t_dense_scale_payload_4 = t_dense_scale_payload_3[191 : 176];
      5'b01100 : t_dense_scale_payload_4 = t_dense_scale_payload_3[207 : 192];
      5'b01101 : t_dense_scale_payload_4 = t_dense_scale_payload_3[223 : 208];
      5'b01110 : t_dense_scale_payload_4 = t_dense_scale_payload_3[239 : 224];
      5'b01111 : t_dense_scale_payload_4 = t_dense_scale_payload_3[255 : 240];
      5'b10000 : t_dense_scale_payload_4 = t_dense_scale_payload_3[271 : 256];
      5'b10001 : t_dense_scale_payload_4 = t_dense_scale_payload_3[287 : 272];
      5'b10010 : t_dense_scale_payload_4 = t_dense_scale_payload_3[303 : 288];
      5'b10011 : t_dense_scale_payload_4 = t_dense_scale_payload_3[319 : 304];
      5'b10100 : t_dense_scale_payload_4 = t_dense_scale_payload_3[335 : 320];
      5'b10101 : t_dense_scale_payload_4 = t_dense_scale_payload_3[351 : 336];
      5'b10110 : t_dense_scale_payload_4 = t_dense_scale_payload_3[367 : 352];
      5'b10111 : t_dense_scale_payload_4 = t_dense_scale_payload_3[383 : 368];
      5'b11000 : t_dense_scale_payload_4 = t_dense_scale_payload_3[399 : 384];
      5'b11001 : t_dense_scale_payload_4 = t_dense_scale_payload_3[415 : 400];
      5'b11010 : t_dense_scale_payload_4 = t_dense_scale_payload_3[431 : 416];
      5'b11011 : t_dense_scale_payload_4 = t_dense_scale_payload_3[447 : 432];
      5'b11100 : t_dense_scale_payload_4 = t_dense_scale_payload_3[463 : 448];
      5'b11101 : t_dense_scale_payload_4 = t_dense_scale_payload_3[479 : 464];
      5'b11110 : t_dense_scale_payload_4 = t_dense_scale_payload_3[495 : 480];
      default : t_dense_scale_payload_4 = t_dense_scale_payload_3[511 : 496];
    endcase
  end

  always @(*) begin
    case(t_dense_zero_payload_2)
      7'b0000000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[3 : 0];
      7'b0000001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[7 : 4];
      7'b0000010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[11 : 8];
      7'b0000011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[15 : 12];
      7'b0000100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[19 : 16];
      7'b0000101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[23 : 20];
      7'b0000110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[27 : 24];
      7'b0000111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[31 : 28];
      7'b0001000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[35 : 32];
      7'b0001001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[39 : 36];
      7'b0001010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[43 : 40];
      7'b0001011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[47 : 44];
      7'b0001100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[51 : 48];
      7'b0001101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[55 : 52];
      7'b0001110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[59 : 56];
      7'b0001111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[63 : 60];
      7'b0010000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[67 : 64];
      7'b0010001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[71 : 68];
      7'b0010010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[75 : 72];
      7'b0010011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[79 : 76];
      7'b0010100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[83 : 80];
      7'b0010101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[87 : 84];
      7'b0010110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[91 : 88];
      7'b0010111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[95 : 92];
      7'b0011000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[99 : 96];
      7'b0011001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[103 : 100];
      7'b0011010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[107 : 104];
      7'b0011011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[111 : 108];
      7'b0011100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[115 : 112];
      7'b0011101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[119 : 116];
      7'b0011110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[123 : 120];
      7'b0011111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[127 : 124];
      7'b0100000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[131 : 128];
      7'b0100001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[135 : 132];
      7'b0100010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[139 : 136];
      7'b0100011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[143 : 140];
      7'b0100100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[147 : 144];
      7'b0100101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[151 : 148];
      7'b0100110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[155 : 152];
      7'b0100111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[159 : 156];
      7'b0101000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[163 : 160];
      7'b0101001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[167 : 164];
      7'b0101010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[171 : 168];
      7'b0101011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[175 : 172];
      7'b0101100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[179 : 176];
      7'b0101101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[183 : 180];
      7'b0101110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[187 : 184];
      7'b0101111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[191 : 188];
      7'b0110000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[195 : 192];
      7'b0110001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[199 : 196];
      7'b0110010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[203 : 200];
      7'b0110011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[207 : 204];
      7'b0110100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[211 : 208];
      7'b0110101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[215 : 212];
      7'b0110110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[219 : 216];
      7'b0110111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[223 : 220];
      7'b0111000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[227 : 224];
      7'b0111001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[231 : 228];
      7'b0111010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[235 : 232];
      7'b0111011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[239 : 236];
      7'b0111100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[243 : 240];
      7'b0111101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[247 : 244];
      7'b0111110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[251 : 248];
      7'b0111111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[255 : 252];
      7'b1000000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[259 : 256];
      7'b1000001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[263 : 260];
      7'b1000010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[267 : 264];
      7'b1000011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[271 : 268];
      7'b1000100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[275 : 272];
      7'b1000101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[279 : 276];
      7'b1000110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[283 : 280];
      7'b1000111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[287 : 284];
      7'b1001000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[291 : 288];
      7'b1001001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[295 : 292];
      7'b1001010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[299 : 296];
      7'b1001011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[303 : 300];
      7'b1001100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[307 : 304];
      7'b1001101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[311 : 308];
      7'b1001110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[315 : 312];
      7'b1001111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[319 : 316];
      7'b1010000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[323 : 320];
      7'b1010001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[327 : 324];
      7'b1010010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[331 : 328];
      7'b1010011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[335 : 332];
      7'b1010100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[339 : 336];
      7'b1010101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[343 : 340];
      7'b1010110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[347 : 344];
      7'b1010111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[351 : 348];
      7'b1011000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[355 : 352];
      7'b1011001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[359 : 356];
      7'b1011010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[363 : 360];
      7'b1011011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[367 : 364];
      7'b1011100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[371 : 368];
      7'b1011101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[375 : 372];
      7'b1011110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[379 : 376];
      7'b1011111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[383 : 380];
      7'b1100000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[387 : 384];
      7'b1100001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[391 : 388];
      7'b1100010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[395 : 392];
      7'b1100011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[399 : 396];
      7'b1100100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[403 : 400];
      7'b1100101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[407 : 404];
      7'b1100110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[411 : 408];
      7'b1100111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[415 : 412];
      7'b1101000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[419 : 416];
      7'b1101001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[423 : 420];
      7'b1101010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[427 : 424];
      7'b1101011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[431 : 428];
      7'b1101100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[435 : 432];
      7'b1101101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[439 : 436];
      7'b1101110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[443 : 440];
      7'b1101111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[447 : 444];
      7'b1110000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[451 : 448];
      7'b1110001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[455 : 452];
      7'b1110010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[459 : 456];
      7'b1110011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[463 : 460];
      7'b1110100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[467 : 464];
      7'b1110101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[471 : 468];
      7'b1110110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[475 : 472];
      7'b1110111 : t_dense_zero_payload_4 = t_dense_zero_payload_3[479 : 476];
      7'b1111000 : t_dense_zero_payload_4 = t_dense_zero_payload_3[483 : 480];
      7'b1111001 : t_dense_zero_payload_4 = t_dense_zero_payload_3[487 : 484];
      7'b1111010 : t_dense_zero_payload_4 = t_dense_zero_payload_3[491 : 488];
      7'b1111011 : t_dense_zero_payload_4 = t_dense_zero_payload_3[495 : 492];
      7'b1111100 : t_dense_zero_payload_4 = t_dense_zero_payload_3[499 : 496];
      7'b1111101 : t_dense_zero_payload_4 = t_dense_zero_payload_3[503 : 500];
      7'b1111110 : t_dense_zero_payload_4 = t_dense_zero_payload_3[507 : 504];
      default : t_dense_zero_payload_4 = t_dense_zero_payload_3[511 : 508];
    endcase
  end

  always @(*) begin
    case(t_sparse_packOut_payload_1)
      5'b00000 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_0;
      5'b00001 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_1;
      5'b00010 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_2;
      5'b00011 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_3;
      5'b00100 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_4;
      5'b00101 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_5;
      5'b00110 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_6;
      5'b00111 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_7;
      5'b01000 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_8;
      5'b01001 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_9;
      5'b01010 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_10;
      5'b01011 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_11;
      5'b01100 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_12;
      5'b01101 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_13;
      5'b01110 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_14;
      5'b01111 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_15;
      5'b10000 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_16;
      5'b10001 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_17;
      5'b10010 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_18;
      5'b10011 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_19;
      5'b10100 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_20;
      5'b10101 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_21;
      5'b10110 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_22;
      5'b10111 : t_sparse_packOut_payload = sparse_busPayloadSubDiv_23;
      default : t_sparse_packOut_payload = sparse_busPayloadSubDiv_24;
    endcase
  end

  always @(*) begin
    case(t_kv_extPack_payload_2)
      4'b0000 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[31 : 0];
      4'b0001 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[63 : 32];
      4'b0010 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[95 : 64];
      4'b0011 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[127 : 96];
      4'b0100 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[159 : 128];
      4'b0101 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[191 : 160];
      4'b0110 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[223 : 192];
      4'b0111 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[255 : 224];
      4'b1000 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[287 : 256];
      4'b1001 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[319 : 288];
      4'b1010 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[351 : 320];
      4'b1011 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[383 : 352];
      4'b1100 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[415 : 384];
      4'b1101 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[447 : 416];
      4'b1110 : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[479 : 448];
      default : t_kv_extPack_payload_4 = t_kv_extPack_payload_3[511 : 480];
    endcase
  end

  assign io_bus_ready = busDeMux_io_input_ready;
  assign busTag = io_bus_payload_dest;
  assign mlpGBusHitNotSparse = ((busTag == 6'h0f) && (! io_enPredictor));
  assign lnScaleHit = (((6'h03 == busTag) || (6'h0c == busTag)) || (6'h12 == busTag));
  assign denseHit = (((((((6'h04 == busTag) || (6'h05 == busTag)) || (6'h07 == busTag)) || (6'h0b == busTag)) || (6'h0d == busTag)) || (6'h13 == busTag)) || mlpGBusHitNotSparse);
  assign sparseHit = (((6'h10 == busTag) || (6'h11 == busTag)) && (! mlpGBusHitNotSparse));
  assign kvHit = ((6'h06 == busTag) || (6'h08 == busTag));
  always @(*) begin
    busDeMuxSel = 3'b000;
    if(denseHit) begin
      busDeMuxSel = 3'b001;
    end else begin
      if(sparseHit) begin
        busDeMuxSel = 3'b010;
      end else begin
        if(kvHit) begin
          busDeMuxSel = 3'b011;
        end else begin
          if(lnScaleHit) begin
            busDeMuxSel = 3'b100;
          end
        end
      end
    end
  end

  always @(*) begin
    busMuxSel = 2'b00;
    if(denseHit) begin
      busMuxSel = 2'b01;
    end else begin
      if(sparseHit) begin
        busMuxSel = 2'b10;
      end else begin
        if(kvHit) begin
          busMuxSel = 2'b11;
        end
      end
    end
  end

  always @(*) begin
    miscInMuxSel = 2'b00;
    if(sparseHit) begin
      miscInMuxSel = 2'b01;
    end else begin
      if(kvHit) begin
        miscInMuxSel = 2'b10;
      end
    end
  end

  assign axi_busDataFifo_io_push_fire = (busMux_io_output_valid && busDataFifo_io_push_ready);
  assign busLinkFifo_io_push_payload_fragment = io_bus_payload_dest;
  assign axi_busDataFifo_io_pop_fire = (busDataFifo_io_pop_valid && int_bus_ready);
  assign int_bus_valid = busDataFifo_io_pop_valid;
  assign int_bus_payload_last = busLinkFifo_io_pop_payload_last;
  assign int_bus_payload_tuser = busLinkFifo_io_pop_payload_fragment;
  assign int_bus_payload_tdata = busDataFifo_io_pop_payload;
  assign isVOut = (io_bus_payload_dest == 6'h08);
  assign axpyHit = (6'h11 == io_bus_payload_dest);
  assign axi_miscFifo_io_push_fire = (miscInMux_io_output_valid && miscFifo_io_push_ready);
  assign tagFifo_io_push_payload = {{{axpyHit,isVOut},miscInMuxSel},io_bus_payload_dest};
  assign tagFifoDest = tagFifo_io_pop_payload[5 : 0];
  assign tagFifoSel = t_tagFifoSel[1 : 0];
  assign miscOutDeMux_io_select = t_io_select[1 : 0];
  assign axi_tagFifo_io_pop_fire = (tagFifo_io_pop_valid && miscOutDeMux_io_input_ready);
  assign ln_bufIn_valid = busDeMux_io_outputs_4_valid;
  assign ln_bufIn_payload = io_bus_payload_data;
  assign axi_ln_buf_io_push_fire = (ln_bufIn_valid && ln_buf_io_push_ready);
  always @(*) begin
    t_io_push_payload = 1'b0;
    if(axi_ln_buf_io_push_fire) begin
      t_io_push_payload = 1'b1;
    end
  end

  assign t_ln_bufIn_ready = (t_io_push_payload_2 == 2'b11);
  always @(*) begin
    t_io_push_payload_1 = (t_io_push_payload_2 + t_t_io_push_payload_1);
    if(1'b0) begin
      t_io_push_payload_1 = 2'b00;
    end
  end

  assign t_io_push_payload_3 = ln_bufIn_payload;
  assign ln_buf_io_push_payload = t_io_push_payload_4;
  assign ln_bufIn_ready = (ln_buf_io_push_ready && t_ln_bufIn_ready);
  assign ln_scaleOut_fire = (ln_scaleOut_valid && ln_scaleOut_ready);
  always @(*) begin
    t_ln_scaleOut_payload = 1'b0;
    if(ln_scaleOut_fire) begin
      t_ln_scaleOut_payload = 1'b1;
    end
  end

  assign t_io_pop_ready = (t_ln_scaleOut_payload_2 == 3'b111);
  always @(*) begin
    t_ln_scaleOut_payload_1 = (t_ln_scaleOut_payload_2 + t_t_ln_scaleOut_payload_1);
    if(1'b0) begin
      t_ln_scaleOut_payload_1 = 3'b000;
    end
  end

  assign ln_scaleOut_valid = ln_buf_io_pop_valid;
  assign t_ln_scaleOut_payload_3 = ln_buf_io_pop_payload;
  assign ln_scaleOut_payload = t_ln_scaleOut_payload_4;
  assign ln_buf_io_pop_ready = (ln_scaleOut_ready && t_io_pop_ready);
  assign ln_scaleOut_ready = ln_scaleOut_fifo_io_push_ready;
  assign int_lnScale_valid = ln_scaleOut_fifo_io_pop_valid;
  assign int_lnScale_payload = ln_scaleOut_fifo_io_pop_payload;
  assign dense_bus_valid = miscOutDeMux_io_outputs_0_valid;
  assign dense_bus_payload = miscFifo_io_pop_payload;
  assign dense_cntOvf = (dense_cnt == 3'b100);
  assign dense_bus_fire = (dense_bus_valid && dense_bus_ready);
  assign dense_bus_ready = dense_deMux_io_input_ready;
  assign dense_deMux_io_select = dense_cntIsZero;
  assign dense_toScale_valid = dense_deMux_io_outputs_0_valid;
  assign dense_toScale_payload = dense_bus_payload;
  assign dense_toZero_valid = dense_deMux_io_outputs_1_valid;
  assign dense_toZero_payload = dense_bus_payload;
  assign dense_toScale_ready = dense_scaleFifo_io_push_ready;
  assign dense_scale_fire = (dense_scale_valid && dense_scale_ready);
  always @(*) begin
    t_dense_scale_payload = 1'b0;
    if(dense_scale_fire) begin
      t_dense_scale_payload = 1'b1;
    end
  end

  assign t_io_pop_ready_1 = (t_dense_scale_payload_2 == 5'h1f);
  always @(*) begin
    t_dense_scale_payload_1 = (t_dense_scale_payload_2 + t_t_dense_scale_payload_1);
    if(1'b0) begin
      t_dense_scale_payload_1 = 5'h0;
    end
  end

  assign dense_scale_valid = dense_scaleFifo_io_pop_valid;
  assign t_dense_scale_payload_3 = dense_scaleFifo_io_pop_payload;
  assign dense_scale_payload = t_dense_scale_payload_4;
  assign dense_scaleFifo_io_pop_ready = (dense_scale_ready && t_io_pop_ready_1);
  always @(*) begin
    dense_zero_ready = dense_zeroPipe_ready;
    if((! dense_zeroPipe_valid)) begin
      dense_zero_ready = 1'b1;
    end
  end

  assign dense_zeroPipe_valid = dense_zero_rValid;
  assign dense_zeroPipe_payload = dense_zero_rData;
  always @(*) begin
    dense_toZero_ready = dense_toZero_m2sPipe_ready;
    if((! dense_toZero_m2sPipe_valid)) begin
      dense_toZero_ready = 1'b1;
    end
  end

  assign dense_toZero_m2sPipe_valid = dense_toZero_rValid;
  assign dense_toZero_m2sPipe_payload = dense_toZero_rData;
  assign dense_zero_fire = (dense_zero_valid && dense_zero_ready);
  always @(*) begin
    t_dense_zero_payload = 1'b0;
    if(dense_zero_fire) begin
      t_dense_zero_payload = 1'b1;
    end
  end

  assign t_dense_toZero_m2sPipe_ready = (t_dense_zero_payload_2 == 7'h7f);
  always @(*) begin
    t_dense_zero_payload_1 = (t_dense_zero_payload_2 + t_t_dense_zero_payload_1);
    if(1'b0) begin
      t_dense_zero_payload_1 = 7'h0;
    end
  end

  assign dense_zero_valid = dense_toZero_m2sPipe_valid;
  assign t_dense_zero_payload_3 = dense_toZero_m2sPipe_payload;
  assign dense_zero_payload = t_dense_zero_payload_4;
  assign dense_toZero_m2sPipe_ready = (dense_zero_ready && t_dense_toZero_m2sPipe_ready);
  assign dense_zeroAlign_valid = dense_zeroPipe_valid;
  assign dense_zeroPipe_ready = dense_zeroAlign_ready;
  assign dense_zeroAlign_payload = {4'd0, dense_zeroPipe_payload};
  assign sparse_gen_io_tag = io_bus_payload_dest;
  assign sparse_bus_valid = miscOutDeMux_io_outputs_1_valid;
  assign sparse_bus_tdata = miscFifo_io_pop_payload[499 : 0];
  assign sparse_bus_tuser = tagFifo_io_pop_payload[5 : 0];
  assign sparse_tagHit = {(6'h11 == sparse_bus_tuser),(6'h10 == sparse_bus_tuser)};
  assign sparse_packVec_0 = 8'h0c;
  assign sparse_packVec_1 = 8'h0c;
  assign sparse_packCnt = (sparse_tagHit[0] ? sparse_packVec_0 : sparse_packVec_1);
  assign sparse_cntLv1Ovf = (sparse_cntLv1 == 8'h18);
  assign sparse_cntLv2Ovf = (sparse_cntLv2 == t_sparse_cntLv2Ovf);
  always @(*) begin
    sparse_bus_ready = 1'b0;
    if(sparse_packOut_fire) begin
      if(sparse_cntLv1Ovf) begin
        sparse_bus_ready = 1'b1;
      end
      if(sparse_cntLv2Ovf) begin
        sparse_bus_ready = 1'b1;
      end
    end
  end

  assign sparse_packOut_fire = (sparse_packOut_valid && sparse_packOut_ready);
  assign sparse_busPayloadSubDiv_0 = sparse_bus_tdata[19 : 0];
  assign sparse_busPayloadSubDiv_1 = sparse_bus_tdata[39 : 20];
  assign sparse_busPayloadSubDiv_2 = sparse_bus_tdata[59 : 40];
  assign sparse_busPayloadSubDiv_3 = sparse_bus_tdata[79 : 60];
  assign sparse_busPayloadSubDiv_4 = sparse_bus_tdata[99 : 80];
  assign sparse_busPayloadSubDiv_5 = sparse_bus_tdata[119 : 100];
  assign sparse_busPayloadSubDiv_6 = sparse_bus_tdata[139 : 120];
  assign sparse_busPayloadSubDiv_7 = sparse_bus_tdata[159 : 140];
  assign sparse_busPayloadSubDiv_8 = sparse_bus_tdata[179 : 160];
  assign sparse_busPayloadSubDiv_9 = sparse_bus_tdata[199 : 180];
  assign sparse_busPayloadSubDiv_10 = sparse_bus_tdata[219 : 200];
  assign sparse_busPayloadSubDiv_11 = sparse_bus_tdata[239 : 220];
  assign sparse_busPayloadSubDiv_12 = sparse_bus_tdata[259 : 240];
  assign sparse_busPayloadSubDiv_13 = sparse_bus_tdata[279 : 260];
  assign sparse_busPayloadSubDiv_14 = sparse_bus_tdata[299 : 280];
  assign sparse_busPayloadSubDiv_15 = sparse_bus_tdata[319 : 300];
  assign sparse_busPayloadSubDiv_16 = sparse_bus_tdata[339 : 320];
  assign sparse_busPayloadSubDiv_17 = sparse_bus_tdata[359 : 340];
  assign sparse_busPayloadSubDiv_18 = sparse_bus_tdata[379 : 360];
  assign sparse_busPayloadSubDiv_19 = sparse_bus_tdata[399 : 380];
  assign sparse_busPayloadSubDiv_20 = sparse_bus_tdata[419 : 400];
  assign sparse_busPayloadSubDiv_21 = sparse_bus_tdata[439 : 420];
  assign sparse_busPayloadSubDiv_22 = sparse_bus_tdata[459 : 440];
  assign sparse_busPayloadSubDiv_23 = sparse_bus_tdata[479 : 460];
  assign sparse_busPayloadSubDiv_24 = sparse_bus_tdata[499 : 480];
  assign sparse_packOut_valid = sparse_bus_valid;
  assign sparse_packOut_payload = t_sparse_packOut_payload;
  assign sparse_packOut_ready = 1'b1;
  assign sparse_preScaleFifo_io_push_payload = sparse_packOut_payload[19 : 4];
  assign sparse_postScaleFifo_io_push_payload = sparse_packOut_payload[19 : 4];
  assign sparse_zeroFifo_io_push_payload = sparse_packOut_payload[3 : 0];
  assign sparse_selAxpy = tagFifo_io_pop_payload[9];
  assign sparse_preScaleFifo_io_push_valid = (sparse_packOut_valid && sparse_selAxpy);
  assign sparse_postScaleFifo_io_push_valid = (sparse_packOut_valid && (! sparse_selAxpy));
  assign sparse_zeroQueue_valid = sparse_zeroFifo_io_pop_valid;
  assign sparse_zeroQueue_payload = {4'b0000,sparse_zeroFifo_io_pop_payload};
  assign kv_bus_valid = miscOutDeMux_io_outputs_2_valid;
  assign kv_bus_payload = miscFifo_io_pop_payload;
  assign kv_extPack_fire = (kv_extPack_valid && kv_extPack_ready);
  always @(*) begin
    t_kv_extPack_payload = 1'b0;
    if(kv_extPack_fire) begin
      t_kv_extPack_payload = 1'b1;
    end
  end

  assign t_kv_bus_ready = (t_kv_extPack_payload_2 == 4'b1111);
  always @(*) begin
    t_kv_extPack_payload_1 = (t_kv_extPack_payload_2 + t_t_kv_extPack_payload_1);
    if(1'b0) begin
      t_kv_extPack_payload_1 = 4'b0000;
    end
  end

  assign kv_extPack_valid = kv_bus_valid;
  assign t_kv_extPack_payload_3 = kv_bus_payload;
  assign kv_extPack_payload = t_kv_extPack_payload_4;
  assign kv_bus_ready = (kv_extPack_ready && t_kv_bus_ready);
  assign kv_isVOut = tagFifo_io_pop_payload[8];
  assign kv_kCntOvf = (kv_kCnt == t_kv_kCntOvf);
  assign kv_vCntOvf = (kv_vCnt == t_kv_vCntOvf);
  assign kv_tokenHigh = io_token[12 : 4];
  assign kv_kCntHigh = kv_kCnt[12 : 4];
  assign kv_vCntHigh = kv_vCnt[12 : 4];
  assign kv_kCntLow = kv_kCnt[3 : 0];
  assign kv_vCntLow = kv_vCnt[3 : 0];
  assign kv_kPack_fire = (kv_kPack_valid && kv_kPack_ready);
  assign kv_vPack_fire = (kv_vPack_valid && kv_vPack_ready);
  assign kv_kSelLocal = (kv_tokenHighZeroDly || kv_kCntHighMatch);
  assign kv_vSelLocal = (kv_tokenHighZeroDly || kv_vCntHighMatch);
  always @(*) begin
    kv_extPack_ready = kv_extPack_m2sPipe_ready;
    if((! kv_extPack_m2sPipe_valid)) begin
      kv_extPack_ready = 1'b1;
    end
  end

  assign kv_extPack_m2sPipe_valid = kv_extPack_rValid;
  assign kv_extPack_m2sPipe_payload = kv_extPack_rData;
  assign kv_extPack_m2sPipe_ready = kv_extPackDeMux_io_input_ready;
  assign kv_extPackDeMux_io_select = kv_isVOut;
  assign io_kSzOut_ready = kv_kMux_io_inputs_1_ready;
  assign kv_kMux_io_select = kv_kSelLocal;
  assign kv_kPack_valid = kv_kMux_io_output_valid;
  assign kv_kPack_payload = kv_kMux_io_output_payload;
  assign io_vSzOut_ready = kv_vMux_io_inputs_1_ready;
  assign kv_vMux_io_select = kv_vSelLocal;
  assign kv_vPack_valid = kv_vMux_io_output_valid;
  assign kv_vPack_payload = kv_vMux_io_output_payload;
  assign kv_kPack_ready = kv_kFork_io_input_ready;
  assign kv_kScale_valid = kv_kFork_io_outputs_0_valid;
  assign kv_kScale_payload = kv_kPack_payload[15 : 0];
  assign kv_kZero_valid = kv_kFork_io_outputs_1_valid;
  assign kv_kZero_payload = t_kv_kZero_payload[7 : 0];
  assign kv_vPack_ready = kv_vFork_io_input_ready;
  assign kv_vScalePreInsert_valid = kv_vFork_io_outputs_0_valid;
  assign kv_vScalePreInsert_payload = kv_vPack_payload[15 : 0];
  assign kv_vZero_valid = kv_vFork_io_outputs_1_valid;
  assign kv_vZero_payload = t_kv_vZero_payload[7 : 0];
  assign kv_vScale_fire = (kv_vScale_valid && kv_vScale_ready);
  assign kv_vScaleOne_valid = (kv_vScalePreInsert_valid && kv_vScaleCntIsZero);
  assign kv_vScaleOne_payload = 16'h3c00;
  assign kv_vScalePreInsert_ready = kv_vScaleMux_io_inputs_0_ready;
  assign kv_vScaleOne_ready = kv_vScaleMux_io_inputs_1_ready;
  assign kv_vScaleMux_io_select = kv_vScaleCntIsZero;
  assign kv_vScale_valid = kv_vScaleMux_io_output_valid;
  assign kv_vScale_payload = kv_vScaleMux_io_output_payload;
  assign postMlpGBusHitNotSparse = ((int_bus_payload_tuser == 6'h0f) && (! io_enPredictor));
  assign postSparseHit = (((6'h10 == int_bus_payload_tuser) || (6'h11 == int_bus_payload_tuser)) && (! postMlpGBusHitNotSparse));
  assign postKHit = (int_bus_payload_tuser == 6'h06);
  assign postVHit = (int_bus_payload_tuser == 6'h08);
  assign dense_zeroAlign_ready = zeroInt4Mux_io_inputs_0_ready;
  assign sparse_zeroQueue_ready = zeroInt4Mux_io_inputs_1_ready;
  assign zeroInt4Mux_io_select = postSparseHit;
  assign int_zeroInt4_valid = zeroInt4Mux_io_output_valid;
  assign int_zeroInt4_payload = zeroInt4Mux_io_output_payload;
  assign kv_vZero_ready = vZeroFifo_io_push_ready;
  assign kv_vScale_ready = vScaleFifo_io_push_ready;
  assign kv_kZero_ready = zeroInt8Mux_io_inputs_1_ready;
  always @(*) begin
    zeroInt8Mux_io_select = 2'b00;
    if(postKHit) begin
      zeroInt8Mux_io_select = 2'b01;
    end
    if(postVHit) begin
      zeroInt8Mux_io_select = 2'b10;
    end
  end

  assign int_zeroInt8_valid = zeroInt8Mux_io_output_valid;
  assign int_zeroInt8_payload = zeroInt8Mux_io_output_payload;
  assign dense_scale_ready = dense_scale_to_ip_s_axis_a_tready;
  assign kv_kScale_ready = kv_kScale_to_ip_s_axis_a_tready;
  assign int_postScale_valid = postScaleMux_io_output_valid;
  assign int_postScale_payload = postScaleMux_io_output_payload;
  assign postMlpCfgHitNotSparse = ((io_postCfgTag == 6'h16) && (! io_enPredictor));
  assign postCfgDenseHit = (((((((((t_postCfgDenseHit == io_postCfgTag) || (t_postCfgDenseHit_1 == io_postCfgTag)) || (6'h07 == io_postCfgTag)) || (6'h10 == io_postCfgTag)) || (6'h11 == io_postCfgTag)) || (6'h13 == io_postCfgTag)) || (6'h1b == io_postCfgTag)) || (6'h23 == io_postCfgTag)) || postMlpCfgHitNotSparse);
  assign postCfgSparseHit = (((((6'h1c == io_postCfgTag) || (6'h16 == io_postCfgTag)) || (6'h18 == io_postCfgTag)) || (6'h1f == io_postCfgTag)) && (! postMlpCfgHitNotSparse));
  assign postCfgKvHit = (io_postCfgTag == 6'h0d);
  always @(*) begin
    postSel = 2'b11;
    if(postCfgDenseHit) begin
      postSel = 2'b00;
    end
    if(postCfgSparseHit) begin
      postSel = 2'b01;
    end
    if(postCfgKvHit) begin
      postSel = 2'b10;
    end
  end

  assign int_preScale_valid = preScaleMux_io_output_valid;
  assign int_preScale_payload = preScaleMux_io_output_payload;
  assign preCfgSparseHit = ((((6'h1c == io_preCfgTag) || (6'h16 == io_preCfgTag)) || (6'h18 == io_preCfgTag)) || (6'h1f == io_preCfgTag));
  assign preCfgKvHit = (io_preCfgTag == 6'h0f);
  always @(*) begin
    preSel = 2'b10;
    if(preCfgSparseHit) begin
      preSel = 2'b00;
    end
    if(preCfgKvHit) begin
      preSel = 2'b01;
    end
  end

  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      t_io_push_payload_2 <= 2'b00;
      t_ln_scaleOut_payload_2 <= 3'b000;
      dense_cnt <= 3'b000;
      dense_cntIsZero <= 1'b1;
      t_dense_scale_payload_2 <= 5'h0;
      dense_zero_rValid <= 1'b0;
      dense_toZero_rValid <= 1'b0;
      t_dense_zero_payload_2 <= 7'h0;
      sparse_cntLv1 <= 8'h0;
      sparse_cntLv2 <= 8'h0;
      t_kv_extPack_payload_2 <= 4'b0000;
      kv_kCnt <= 13'h0;
      kv_vCnt <= 13'h0;
      kv_tokenHighZeroDly <= 1'b1;
      kv_kCntHighMatch <= 1'b0;
      kv_vCntHighMatch <= 1'b0;
      kv_extPack_rValid <= 1'b0;
      kv_vScaleCnt <= 13'h0;
      kv_vScaleCntIsZero <= 1'b1;
    end else begin
      t_io_push_payload_2 <= t_io_push_payload_1;
      t_ln_scaleOut_payload_2 <= t_ln_scaleOut_payload_1;
      if(dense_bus_fire) begin
        dense_cnt <= (dense_cnt + 3'b001);
        dense_cntIsZero <= 1'b0;
        if(dense_cntOvf) begin
          dense_cnt <= 3'b000;
          dense_cntIsZero <= 1'b1;
        end
      end
      t_dense_scale_payload_2 <= t_dense_scale_payload_1;
      if(dense_zero_ready) begin
        dense_zero_rValid <= dense_zero_valid;
      end
      if(dense_toZero_ready) begin
        dense_toZero_rValid <= dense_toZero_valid;
      end
      t_dense_zero_payload_2 <= t_dense_zero_payload_1;
      if(sparse_packOut_fire) begin
        sparse_cntLv1 <= (sparse_cntLv1 + 8'h01);
        sparse_cntLv2 <= (sparse_cntLv2 + 8'h01);
        if(sparse_cntLv1Ovf) begin
          sparse_cntLv1 <= 8'h0;
        end
        if(sparse_cntLv2Ovf) begin
          sparse_cntLv1 <= 8'h0;
          sparse_cntLv2 <= 8'h0;
        end
      end
      t_kv_extPack_payload_2 <= t_kv_extPack_payload_1;
      kv_tokenHighZeroDly <= (kv_tokenHigh == 9'h0);
      if(kv_kPack_fire) begin
        kv_kCnt <= (kv_kCnt + 13'h0001);
        if(((&kv_kCntLow) && (kv_kCntHigh == t_when))) begin
          kv_kCntHighMatch <= 1'b1;
        end
        if(kv_kCntOvf) begin
          kv_kCnt <= 13'h0;
          kv_kCntHighMatch <= 1'b0;
        end
      end
      if(kv_vPack_fire) begin
        kv_vCnt <= (kv_vCnt + 13'h0001);
        if(((&kv_vCntLow) && (kv_vCntHigh == t_when_1))) begin
          kv_vCntHighMatch <= 1'b1;
        end
        if(kv_vCntOvf) begin
          kv_vCnt <= 13'h0;
          kv_vCntHighMatch <= 1'b0;
        end
      end
      if(kv_extPack_ready) begin
        kv_extPack_rValid <= kv_extPack_valid;
      end
      if(kv_vScale_fire) begin
        kv_vScaleCnt <= (kv_vScaleCnt + 13'h0001);
        kv_vScaleCntIsZero <= 1'b0;
        if((kv_vScaleCnt == io_token)) begin
          kv_vScaleCnt <= 13'h0;
          kv_vScaleCntIsZero <= 1'b1;
        end
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(dense_zero_ready) begin
      dense_zero_rData <= dense_zero_payload;
    end
    if(dense_toZero_ready) begin
      dense_toZero_rData <= dense_toZero_payload;
    end
    if(kv_extPack_ready) begin
      kv_extPack_rData <= kv_extPack_payload;
    end
  end


endmodule

