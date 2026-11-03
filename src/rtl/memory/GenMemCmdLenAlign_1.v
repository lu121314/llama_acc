// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module GenMemCmdLenAlign_1 (
  input  wire          io_tokenIndex_valid,
  output wire          io_tokenIndex_ready,
  input  wire [16:0]   io_tokenIndex_tdata,
  input  wire [5:0]    io_tokenIndex_tuser,
  input  wire          io_mm2s_valid,
  output wire          io_mm2s_ready,
  input  wire [511:0]  io_mm2s_payload_data,
  input  wire [63:0]   io_mm2s_payload_keep,
  input  wire          io_mm2s_payload_last,
  output wire          io_s2mm_valid,
  input  wire          io_s2mm_ready,
  output wire [511:0]  io_s2mm_payload_data,
  output wire [63:0]   io_s2mm_payload_keep,
  output wire          io_s2mm_payload_last,
  output wire          io_mm2sCmd_valid,
  input  wire          io_mm2sCmd_ready,
  output wire [71:0]   io_mm2sCmd_payload,
  output wire          io_s2mmCmd_valid,
  input  wire          io_s2mmCmd_ready,
  output wire [71:0]   io_s2mmCmd_payload,
  output wire          local_bus_valid,
  input  wire          local_bus_ready,
  output wire [511:0]  local_bus_payload_data,
  output wire          local_bus_payload_last,
  output wire [5:0]    local_bus_payload_dest,
  input  wire          local_kvBus_valid,
  output wire          local_kvBus_ready,
  input  wire [511:0]  local_kvBus_payload_data,
  input  wire          local_kvBus_payload_last,
  input  wire [5:0]    local_kvBus_payload_dest,
  input  wire          local_index_valid,
  input  wire          local_index_payload_last,
  input  wire [15:0]   local_index_payload_tdata,
  input  wire [5:0]    local_index_payload_tuser,
  input  wire          status_enPredictor,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                indexCmdGen_indexMux_io_output_ready;
  wire       [0:0]    indexCmdGen_deMux_io_select;
  wire       [1:0]    logits_mux_io_select;
  wire                logits_mux_io_inputs_2_payload_last;
  wire       [71:0]   logits_mux_io_inputs_2_payload_fragment;
  wire                logits_mux_io_inputs_3_payload_last;
  wire       [71:0]   logits_mux_io_inputs_3_payload_fragment;
  wire                tagFifo_io_pop_ready;
  reg                 s2mm_tokenEnFifo_io_pop_ready;
  wire                indexCmdGen_indexMux_io_inputs_0_ready;
  wire                indexCmdGen_indexMux_io_inputs_1_ready;
  wire                indexCmdGen_indexMux_io_output_valid;
  wire                indexCmdGen_indexMux_io_output_payload_last;
  wire       [71:0]   indexCmdGen_indexMux_io_output_payload_fragment;
  wire                indexCmdGen_indexCmdFifo_io_push_ready;
  wire                indexCmdGen_indexCmdFifo_io_pop_valid;
  wire       [71:0]   indexCmdGen_indexCmdFifo_io_pop_payload;
  wire       [12:0]   indexCmdGen_indexCmdFifo_io_occupancy;
  wire       [12:0]   indexCmdGen_indexCmdFifo_io_availability;
  wire                indexCmdGen_indexLastFifo_io_push_ready;
  wire                indexCmdGen_indexLastFifo_io_pop_valid;
  wire                indexCmdGen_indexLastFifo_io_pop_payload;
  wire       [12:0]   indexCmdGen_indexLastFifo_io_occupancy;
  wire       [12:0]   indexCmdGen_indexLastFifo_io_availability;
  wire                indexCmdGen_deMux_io_input_ready;
  wire                indexCmdGen_deMux_io_outputs_0_valid;
  wire                indexCmdGen_deMux_io_outputs_0_payload_last;
  wire       [71:0]   indexCmdGen_deMux_io_outputs_0_payload_fragment;
  wire                indexCmdGen_deMux_io_outputs_1_valid;
  wire                indexCmdGen_deMux_io_outputs_1_payload_last;
  wire       [71:0]   indexCmdGen_deMux_io_outputs_1_payload_fragment;
  wire                attnKV_mux_io_inputs_0_ready;
  wire                attnKV_mux_io_inputs_1_ready;
  wire                attnKV_mux_io_output_valid;
  wire                attnKV_mux_io_output_payload_last;
  wire       [71:0]   attnKV_mux_io_output_payload_fragment;
  wire                attnQKVNoSz_mux_io_inputs_0_ready;
  wire                attnQKVNoSz_mux_io_inputs_1_ready;
  wire                attnQKVNoSz_mux_io_inputs_2_ready;
  wire                attnQKVNoSz_mux_io_inputs_3_ready;
  wire                attnQKVNoSz_mux_io_inputs_4_ready;
  wire                attnQKVNoSz_mux_io_output_valid;
  wire                attnQKVNoSz_mux_io_output_payload_last;
  wire       [71:0]   attnQKVNoSz_mux_io_output_payload_fragment;
  wire                attnQKVWithSz_mux_io_inputs_0_ready;
  wire                attnQKVWithSz_mux_io_inputs_1_ready;
  wire                attnQKVWithSz_mux_io_inputs_2_ready;
  wire                attnQKVWithSz_mux_io_inputs_3_ready;
  wire                attnQKVWithSz_mux_io_inputs_4_ready;
  wire                attnQKVWithSz_mux_io_inputs_5_ready;
  wire                attnQKVWithSz_mux_io_inputs_6_ready;
  wire                attnQKVWithSz_mux_io_output_valid;
  wire                attnQKVWithSz_mux_io_output_payload_last;
  wire       [71:0]   attnQKVWithSz_mux_io_output_payload_fragment;
  wire                mlpDense_mux_io_inputs_0_ready;
  wire                mlpDense_mux_io_inputs_1_ready;
  wire                mlpDense_mux_io_inputs_2_ready;
  wire                mlpDense_mux_io_inputs_3_ready;
  wire                mlpDense_mux_io_output_valid;
  wire                mlpDense_mux_io_output_payload_last;
  wire       [71:0]   mlpDense_mux_io_output_payload_fragment;
  wire                logits_mux_io_inputs_0_ready;
  wire                logits_mux_io_inputs_1_ready;
  wire                logits_mux_io_inputs_2_ready;
  wire                logits_mux_io_inputs_3_ready;
  wire                logits_mux_io_output_valid;
  wire                logits_mux_io_output_payload_last;
  wire       [71:0]   logits_mux_io_output_payload_fragment;
  wire                mm2sCmdMux_io_inputs_0_ready;
  wire                mm2sCmdMux_io_inputs_1_ready;
  wire                mm2sCmdMux_io_inputs_2_ready;
  wire                mm2sCmdMux_io_inputs_3_ready;
  wire                mm2sCmdMux_io_inputs_4_ready;
  wire                mm2sCmdMux_io_inputs_5_ready;
  wire                mm2sCmdMux_io_inputs_6_ready;
  wire                mm2sCmdMux_io_inputs_7_ready;
  wire                mm2sCmdMux_io_output_valid;
  wire                mm2sCmdMux_io_output_payload_last;
  wire       [71:0]   mm2sCmdMux_io_output_payload_fragment;
  wire                busTagMux_io_inputs_0_ready;
  wire                busTagMux_io_inputs_1_ready;
  wire                busTagMux_io_inputs_2_ready;
  wire                busTagMux_io_inputs_3_ready;
  wire                busTagMux_io_inputs_4_ready;
  wire                busTagMux_io_inputs_5_ready;
  wire                busTagMux_io_inputs_6_ready;
  wire                busTagMux_io_inputs_7_ready;
  wire                busTagMux_io_output_valid;
  wire       [5:0]    busTagMux_io_output_payload;
  wire                tagFifo_io_push_ready;
  wire                tagFifo_io_pop_valid;
  wire       [5:0]    tagFifo_io_pop_payload;
  wire       [6:0]    tagFifo_io_occupancy;
  wire       [6:0]    tagFifo_io_availability;
  wire                s2mm_tokenEnFifo_io_push_ready;
  wire                s2mm_tokenEnFifo_io_pop_valid;
  wire       [6:0]    s2mm_tokenEnFifo_io_occupancy;
  wire       [6:0]    s2mm_tokenEnFifo_io_availability;
  wire                s2mm_cmdFifo_io_push_ready;
  wire                s2mm_cmdFifo_io_pop_valid;
  wire       [71:0]   s2mm_cmdFifo_io_pop_payload;
  wire       [5:0]    s2mm_cmdFifo_io_occupancy;
  wire       [5:0]    s2mm_cmdFifo_io_availability;
  wire       [31:0]   t_headBaseNext;
  wire       [31:0]   t_layerBaseNext;
  wire       [31:0]   t_tokenIn_payload_fragment;
  wire       [28:0]   t_tokenIn_payload_fragment_1;
  wire       [28:0]   t_tokenIn_payload_fragment_2;
  wire       [22:0]   t_tokenIn_payload_fragment_3;
  wire       [11:0]   t_tokenIn_payload_fragment_4;
  wire       [31:0]   t_attnLn_payload_fragment;
  wire       [22:0]   t_attnLn_payload_fragment_1;
  wire       [12:0]   t_attnLn_payload_fragment_2;
  reg        [25:0]   t_indexCmdGen_selDenseBaseAddr;
  reg        [9:0]    t_indexCmdGen_selDenseLen;
  reg        [3:0]    t_indexCmdGen_selDenseTag;
  wire       [13:0]   t_t_indexCmdGen_denseU_payload_fragment_2;
  wire       [31:0]   t_indexCmdGen_denseU_payload_fragment_3;
  wire       [13:0]   t_t_indexCmdGen_denseD_payload_fragment_2;
  wire       [31:0]   t_indexCmdGen_denseD_payload_fragment_3;
  wire       [13:0]   t_t_attnKV_attnKCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnKV_attnKCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_attnKV_attnVCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnKV_attnVCmdVec_payload_fragment_3;
  reg        [5:0]    t_attnKV_tag_payload;
  wire       [13:0]   t_t_attnQKVNoSz_attnQCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVNoSz_attnQCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_attnQKVNoSz_attnKCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVNoSz_attnKCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_attnQKVNoSz_attnVCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVNoSz_attnVCmdVec_payload_fragment_3;
  wire       [31:0]   t_attnQKVNoSz_attnKCacheCmd_payload_fragment;
  wire       [22:0]   t_attnQKVNoSz_attnKCacheCmd_payload_fragment_1;
  wire       [19:0]   t_attnQKVNoSz_attnKCacheCmd_payload_fragment_2;
  wire       [31:0]   t_attnQKVNoSz_attnVCacheCmd_payload_fragment;
  wire       [22:0]   t_attnQKVNoSz_attnVCacheCmd_payload_fragment_1;
  wire       [19:0]   t_attnQKVNoSz_attnVCacheCmd_payload_fragment_2;
  reg        [5:0]    t_attnQKVNoSz_tag_payload;
  wire       [13:0]   t_t_attnQKVWithSz_attnQCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnQCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_attnQKVWithSz_attnKCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnKCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_attnQKVWithSz_attnVCmdVec_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnVCmdVec_payload_fragment_3;
  wire       [31:0]   t_attnQKVWithSz_attnKszCmd_payload_fragment;
  wire       [22:0]   t_attnQKVWithSz_attnKszCmd_payload_fragment_1;
  wire       [14:0]   t_attnQKVWithSz_attnKszCmd_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnVszCmd_payload_fragment;
  wire       [22:0]   t_attnQKVWithSz_attnVszCmd_payload_fragment_1;
  wire       [14:0]   t_attnQKVWithSz_attnVszCmd_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnKCacheCmd_payload_fragment;
  wire       [22:0]   t_attnQKVWithSz_attnKCacheCmd_payload_fragment_1;
  wire       [19:0]   t_attnQKVWithSz_attnKCacheCmd_payload_fragment_2;
  wire       [31:0]   t_attnQKVWithSz_attnVCacheCmd_payload_fragment;
  wire       [22:0]   t_attnQKVWithSz_attnVCacheCmd_payload_fragment_1;
  wire       [19:0]   t_attnQKVWithSz_attnVCacheCmd_payload_fragment_2;
  reg        [5:0]    t_attnQKVWithSz_tag_payload;
  wire       [31:0]   t_mlpDense_mlpLnCmd_payload_fragment;
  wire       [22:0]   t_mlpDense_mlpLnCmd_payload_fragment_1;
  wire       [11:0]   t_mlpDense_mlpLnCmd_payload_fragment_2;
  wire       [13:0]   t_t_mlpDense_attnOCmdVec_payload_fragment_2;
  wire       [31:0]   t_mlpDense_attnOCmdVec_payload_fragment_3;
  wire       [13:0]   t_t_mlpDense_mlpDenseGCmdVec_payload_fragment_2;
  wire       [31:0]   t_mlpDense_mlpDenseGCmdVec_payload_fragment_3;
  reg        [5:0]    t_mlpDense_tag_payload;
  wire       [31:0]   t_logits_lgDenseScale_payload_fragment;
  wire       [30:0]   t_logits_lgDenseScale_payload_fragment_1;
  wire       [22:0]   t_logits_lgDenseScale_payload_fragment_2;
  wire       [11:0]   t_logits_lgDenseScale_payload_fragment_3;
  wire       [13:0]   t_t_logits_lgDenseHeadVec_payload_fragment_2;
  wire       [31:0]   t_logits_lgDenseHeadVec_payload_fragment_3;
  reg        [5:0]    t_logits_tag_payload;
  wire       [31:0]   t_s2mm_headBaseNext;
  wire       [31:0]   t_s2mm_layerBaseNext;
  wire       [31:0]   t_s2mm_kCacheCmd;
  wire       [31:0]   t_s2mm_kCacheCmd_1;
  wire       [17:0]   t_s2mm_kCacheCmd_2;
  wire       [31:0]   t_s2mm_kCacheCmd_3;
  wire       [22:0]   t_s2mm_kCacheCmd_4;
  wire       [7:0]    t_s2mm_kCacheCmd_5;
  wire       [31:0]   t_s2mm_vCacheCmd;
  wire       [31:0]   t_s2mm_vCacheCmd_1;
  wire       [17:0]   t_s2mm_vCacheCmd_2;
  wire       [31:0]   t_s2mm_vCacheCmd_3;
  wire       [22:0]   t_s2mm_vCacheCmd_4;
  wire       [7:0]    t_s2mm_vCacheCmd_5;
  wire       [31:0]   t_s2mm_kSzCmd;
  wire       [31:0]   t_s2mm_kSzCmd_1;
  wire       [12:0]   t_s2mm_kSzCmd_2;
  wire       [31:0]   t_s2mm_kSzCmd_3;
  wire       [22:0]   t_s2mm_kSzCmd_4;
  wire       [6:0]    t_s2mm_kSzCmd_5;
  wire       [31:0]   t_s2mm_vSzCmd;
  wire       [31:0]   t_s2mm_vSzCmd_1;
  wire       [12:0]   t_s2mm_vSzCmd_2;
  wire       [31:0]   t_s2mm_vSzCmd_3;
  wire       [22:0]   t_s2mm_vSzCmd_4;
  wire       [6:0]    t_s2mm_vSzCmd_5;
  reg        [71:0]   t_s2mm_s2mmCmd_payload;
  wire                t_when;
  reg        [12:0]   token;
  wire       [8:0]    tokenHigh;
  wire       [3:0]    tokenLow;
  wire                firstToken;
  wire                noSzFromMem;
  wire       [21:0]   mallocPerHead;
  reg        [31:0]   headBase;
  reg        [31:0]   headBaseNext;
  wire                enIncHead;
  reg        [3:0]    headCnt;
  wire                headCntAbout2Ovf;
  reg                 headCntOvf;
  wire       [25:0]   mallocPerLayer;
  reg        [31:0]   layerBase;
  reg        [31:0]   layerBaseNext;
  reg                 enIncLayer;
  reg        [4:0]    layerCnt;
  wire                layerCntAbout2Ovf;
  reg                 layerCntOvf;
  reg        [31:0]   attnHeadBase;
  wire       [31:0]   attnHeadBaseNext;
  wire                tokenIn_valid;
  wire                tokenIn_ready;
  wire                tokenIn_payload_last;
  wire       [71:0]   tokenIn_payload_fragment;
  wire                tokenTag_valid;
  wire                tokenTag_ready;
  wire       [5:0]    tokenTag_payload;
  wire                tokenIn_fire;
  wire                attnLn_valid;
  wire                attnLn_ready;
  wire                attnLn_payload_last;
  wire       [71:0]   attnLn_payload_fragment;
  wire                attnLnTag_valid;
  wire                attnLnTag_ready;
  wire       [5:0]    attnLnTag_payload;
  wire                attnLn_fire;
  wire       [25:0]   indexCmdGen_denseBaseAddrOs_0;
  wire       [25:0]   indexCmdGen_denseBaseAddrOs_1;
  wire       [9:0]    indexCmdGen_denseLen_0;
  wire       [9:0]    indexCmdGen_denseLen_1;
  wire       [3:0]    indexCmdGen_denseTag_0;
  wire       [3:0]    indexCmdGen_denseTag_1;
  reg        [0:0]    indexCmdGen_denseLastCnt;
  wire       [25:0]   indexCmdGen_selDenseBaseAddr;
  wire       [9:0]    indexCmdGen_selDenseLen;
  wire       [3:0]    indexCmdGen_selDenseTag;
  reg        [25:0]   indexCmdGen_selBaseAddr;
  reg        [9:0]    indexCmdGen_selLen;
  reg        [3:0]    indexCmdGen_selTag;
  wire                indexCmdGen_indexFlow_valid;
  wire                indexCmdGen_indexFlow_payload_last;
  wire       [15:0]   indexCmdGen_indexFlow_payload_fragment;
  reg                 local_index_valid_regNext;
  reg                 local_index_payload_last_regNext;
  reg        [15:0]   t_indexCmdGen_indexFlow_payload_fragment;
  reg        [9:0]    t_indexCmdGen_denseU_payload_last;
  reg        [9:0]    t_indexCmdGen_denseU_payload_last_1;
  reg                 t_indexCmdGen_denseU_payload_last_2;
  wire                t_indexCmdGen_denseU_payload_last_3;
  reg        [31:0]   t_indexCmdGen_denseU_payload_fragment;
  reg        [31:0]   t_indexCmdGen_denseU_payload_fragment_1;
  reg        [22:0]   t_indexCmdGen_denseU_payload_fragment_2;
  wire                indexCmdGen_denseU_valid;
  wire                indexCmdGen_denseU_ready;
  wire                indexCmdGen_denseU_payload_last;
  wire       [71:0]   indexCmdGen_denseU_payload_fragment;
  wire                indexCmdGen_denseU_fire;
  reg        [9:0]    t_indexCmdGen_denseD_payload_last;
  reg        [9:0]    t_indexCmdGen_denseD_payload_last_1;
  reg                 t_indexCmdGen_denseD_payload_last_2;
  wire                t_indexCmdGen_denseD_payload_last_3;
  reg        [31:0]   t_indexCmdGen_denseD_payload_fragment;
  reg        [31:0]   t_indexCmdGen_denseD_payload_fragment_1;
  reg        [22:0]   t_indexCmdGen_denseD_payload_fragment_2;
  wire                indexCmdGen_denseD_valid;
  wire                indexCmdGen_denseD_ready;
  wire                indexCmdGen_denseD_payload_last;
  wire       [71:0]   indexCmdGen_denseD_payload_fragment;
  wire                indexCmdGen_denseD_fire;
  reg                 indexCmdGen_enDenseUD;
  reg                 indexCmdGen_indexFlow_payload_first;
  wire                indexCmdGen_indexCmd_valid;
  wire                indexCmdGen_indexCmd_payload_last;
  wire       [71:0]   indexCmdGen_indexCmd_payload_fragment;
  wire                cmdGen_indexCmdGen_indexCmdFifo_io_push_fire;
  wire                cmdGen_indexCmdGen_indexCmdFifo_io_pop_fire;
  wire                indexCmdGen_indexCmdOut_valid;
  wire                indexCmdGen_indexCmdOut_ready;
  wire                indexCmdGen_indexCmdOut_payload_last;
  wire       [71:0]   indexCmdGen_indexCmdOut_payload_fragment;
  reg        [4:0]    t_attnKV_attnKCmdVec_payload_last;
  reg        [4:0]    t_attnKV_attnKCmdVec_payload_last_1;
  reg                 t_attnKV_attnKCmdVec_payload_last_2;
  wire                t_attnKV_attnKCmdVec_payload_last_3;
  reg        [31:0]   t_attnKV_attnKCmdVec_payload_fragment;
  reg        [31:0]   t_attnKV_attnKCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnKV_attnKCmdVec_payload_fragment_2;
  wire                attnKV_attnKCmdVec_valid;
  wire                attnKV_attnKCmdVec_ready;
  wire                attnKV_attnKCmdVec_payload_last;
  wire       [71:0]   attnKV_attnKCmdVec_payload_fragment;
  wire                attnKV_attnKCmdVec_fire;
  reg        [4:0]    t_attnKV_attnVCmdVec_payload_last;
  reg        [4:0]    t_attnKV_attnVCmdVec_payload_last_1;
  reg                 t_attnKV_attnVCmdVec_payload_last_2;
  wire                t_attnKV_attnVCmdVec_payload_last_3;
  reg        [31:0]   t_attnKV_attnVCmdVec_payload_fragment;
  reg        [31:0]   t_attnKV_attnVCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnKV_attnVCmdVec_payload_fragment_2;
  wire                attnKV_attnVCmdVec_valid;
  wire                attnKV_attnVCmdVec_ready;
  wire                attnKV_attnVCmdVec_payload_last;
  wire       [71:0]   attnKV_attnVCmdVec_payload_fragment;
  wire                attnKV_attnVCmdVec_fire;
  reg        [0:0]    attnKV_sel;
  wire                attnKV_muxOutFire;
  reg                 cmdGen_attnKV_mux_io_output_payload_first;
  wire                attnKV_muxOutIsFirst;
  wire                attnKV_selOvf;
  wire       [5:0]    attnKV_tagVec_0;
  wire       [5:0]    attnKV_tagVec_1;
  reg        [0:0]    attnKV_tagSel;
  wire                attnKV_tagFire;
  wire                attnKV_tag_valid;
  wire                attnKV_tag_ready;
  wire       [5:0]    attnKV_tag_payload;
  wire                attnKV_cmd_valid;
  wire                attnKV_cmd_ready;
  wire                attnKV_cmd_payload_last;
  wire       [71:0]   attnKV_cmd_payload_fragment;
  reg        [4:0]    t_attnQKVNoSz_attnQCmdVec_payload_last;
  reg        [4:0]    t_attnQKVNoSz_attnQCmdVec_payload_last_1;
  reg                 t_attnQKVNoSz_attnQCmdVec_payload_last_2;
  wire                t_attnQKVNoSz_attnQCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVNoSz_attnQCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVNoSz_attnQCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVNoSz_attnQCmdVec_payload_fragment_2;
  wire                attnQKVNoSz_attnQCmdVec_valid;
  wire                attnQKVNoSz_attnQCmdVec_ready;
  wire                attnQKVNoSz_attnQCmdVec_payload_last;
  wire       [71:0]   attnQKVNoSz_attnQCmdVec_payload_fragment;
  wire                attnQKVNoSz_attnQCmdVec_fire;
  reg        [4:0]    t_attnQKVNoSz_attnKCmdVec_payload_last;
  reg        [4:0]    t_attnQKVNoSz_attnKCmdVec_payload_last_1;
  reg                 t_attnQKVNoSz_attnKCmdVec_payload_last_2;
  wire                t_attnQKVNoSz_attnKCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVNoSz_attnKCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVNoSz_attnKCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVNoSz_attnKCmdVec_payload_fragment_2;
  wire                attnQKVNoSz_attnKCmdVec_valid;
  wire                attnQKVNoSz_attnKCmdVec_ready;
  wire                attnQKVNoSz_attnKCmdVec_payload_last;
  wire       [71:0]   attnQKVNoSz_attnKCmdVec_payload_fragment;
  wire                attnQKVNoSz_attnKCmdVec_fire;
  reg        [4:0]    t_attnQKVNoSz_attnVCmdVec_payload_last;
  reg        [4:0]    t_attnQKVNoSz_attnVCmdVec_payload_last_1;
  reg                 t_attnQKVNoSz_attnVCmdVec_payload_last_2;
  wire                t_attnQKVNoSz_attnVCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVNoSz_attnVCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVNoSz_attnVCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVNoSz_attnVCmdVec_payload_fragment_2;
  wire                attnQKVNoSz_attnVCmdVec_valid;
  wire                attnQKVNoSz_attnVCmdVec_ready;
  wire                attnQKVNoSz_attnVCmdVec_payload_last;
  wire       [71:0]   attnQKVNoSz_attnVCmdVec_payload_fragment;
  wire                attnQKVNoSz_attnVCmdVec_fire;
  wire                attnQKVNoSz_attnKCacheCmd_valid;
  wire                attnQKVNoSz_attnKCacheCmd_ready;
  wire                attnQKVNoSz_attnKCacheCmd_payload_last;
  wire       [71:0]   attnQKVNoSz_attnKCacheCmd_payload_fragment;
  wire                attnQKVNoSz_attnVCacheCmd_valid;
  wire                attnQKVNoSz_attnVCacheCmd_ready;
  wire                attnQKVNoSz_attnVCacheCmd_payload_last;
  wire       [71:0]   attnQKVNoSz_attnVCacheCmd_payload_fragment;
  reg        [2:0]    attnQKVNoSz_sel;
  wire                attnQKVNoSz_muxOutFire;
  reg                 cmdGen_attnQKVNoSz_mux_io_output_payload_first;
  wire                attnQKVNoSz_muxOutIsFirst;
  wire                attnQKVNoSz_selOvf;
  wire       [5:0]    attnQKVNoSz_tagVec_0;
  wire       [5:0]    attnQKVNoSz_tagVec_1;
  wire       [5:0]    attnQKVNoSz_tagVec_2;
  wire       [5:0]    attnQKVNoSz_tagVec_3;
  wire       [5:0]    attnQKVNoSz_tagVec_4;
  reg        [2:0]    attnQKVNoSz_tagSel;
  wire                attnQKVNoSz_tagFire;
  wire                attnQKVNoSz_tag_valid;
  wire                attnQKVNoSz_tag_ready;
  wire       [5:0]    attnQKVNoSz_tag_payload;
  wire                attnQKVNoSz_cmd_valid;
  wire                attnQKVNoSz_cmd_ready;
  wire                attnQKVNoSz_cmd_payload_last;
  wire       [71:0]   attnQKVNoSz_cmd_payload_fragment;
  reg        [4:0]    t_attnQKVWithSz_attnQCmdVec_payload_last;
  reg        [4:0]    t_attnQKVWithSz_attnQCmdVec_payload_last_1;
  reg                 t_attnQKVWithSz_attnQCmdVec_payload_last_2;
  wire                t_attnQKVWithSz_attnQCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVWithSz_attnQCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVWithSz_attnQCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVWithSz_attnQCmdVec_payload_fragment_2;
  wire                attnQKVWithSz_attnQCmdVec_valid;
  wire                attnQKVWithSz_attnQCmdVec_ready;
  wire                attnQKVWithSz_attnQCmdVec_payload_last;
  wire       [71:0]   attnQKVWithSz_attnQCmdVec_payload_fragment;
  wire                attnQKVWithSz_attnQCmdVec_fire;
  reg        [4:0]    t_attnQKVWithSz_attnKCmdVec_payload_last;
  reg        [4:0]    t_attnQKVWithSz_attnKCmdVec_payload_last_1;
  reg                 t_attnQKVWithSz_attnKCmdVec_payload_last_2;
  wire                t_attnQKVWithSz_attnKCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVWithSz_attnKCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVWithSz_attnKCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVWithSz_attnKCmdVec_payload_fragment_2;
  wire                attnQKVWithSz_attnKCmdVec_valid;
  wire                attnQKVWithSz_attnKCmdVec_ready;
  wire                attnQKVWithSz_attnKCmdVec_payload_last;
  wire       [71:0]   attnQKVWithSz_attnKCmdVec_payload_fragment;
  wire                attnQKVWithSz_attnKCmdVec_fire;
  reg        [4:0]    t_attnQKVWithSz_attnVCmdVec_payload_last;
  reg        [4:0]    t_attnQKVWithSz_attnVCmdVec_payload_last_1;
  reg                 t_attnQKVWithSz_attnVCmdVec_payload_last_2;
  wire                t_attnQKVWithSz_attnVCmdVec_payload_last_3;
  reg        [31:0]   t_attnQKVWithSz_attnVCmdVec_payload_fragment;
  reg        [31:0]   t_attnQKVWithSz_attnVCmdVec_payload_fragment_1;
  reg        [22:0]   t_attnQKVWithSz_attnVCmdVec_payload_fragment_2;
  wire                attnQKVWithSz_attnVCmdVec_valid;
  wire                attnQKVWithSz_attnVCmdVec_ready;
  wire                attnQKVWithSz_attnVCmdVec_payload_last;
  wire       [71:0]   attnQKVWithSz_attnVCmdVec_payload_fragment;
  wire                attnQKVWithSz_attnVCmdVec_fire;
  wire                attnQKVWithSz_attnKszCmd_valid;
  wire                attnQKVWithSz_attnKszCmd_ready;
  wire                attnQKVWithSz_attnKszCmd_payload_last;
  wire       [71:0]   attnQKVWithSz_attnKszCmd_payload_fragment;
  wire                attnQKVWithSz_attnVszCmd_valid;
  wire                attnQKVWithSz_attnVszCmd_ready;
  wire                attnQKVWithSz_attnVszCmd_payload_last;
  wire       [71:0]   attnQKVWithSz_attnVszCmd_payload_fragment;
  wire                attnQKVWithSz_attnKCacheCmd_valid;
  wire                attnQKVWithSz_attnKCacheCmd_ready;
  wire                attnQKVWithSz_attnKCacheCmd_payload_last;
  wire       [71:0]   attnQKVWithSz_attnKCacheCmd_payload_fragment;
  wire                attnQKVWithSz_attnVCacheCmd_valid;
  wire                attnQKVWithSz_attnVCacheCmd_ready;
  wire                attnQKVWithSz_attnVCacheCmd_payload_last;
  wire       [71:0]   attnQKVWithSz_attnVCacheCmd_payload_fragment;
  reg        [2:0]    attnQKVWithSz_sel;
  wire                attnQKVWithSz_muxOutFire;
  reg                 cmdGen_attnQKVWithSz_mux_io_output_payload_first;
  wire                attnQKVWithSz_muxOutIsFirst;
  wire                attnQKVWithSz_selOvf;
  wire       [5:0]    attnQKVWithSz_tagVec_0;
  wire       [5:0]    attnQKVWithSz_tagVec_1;
  wire       [5:0]    attnQKVWithSz_tagVec_2;
  wire       [5:0]    attnQKVWithSz_tagVec_3;
  wire       [5:0]    attnQKVWithSz_tagVec_4;
  wire       [5:0]    attnQKVWithSz_tagVec_5;
  wire       [5:0]    attnQKVWithSz_tagVec_6;
  reg        [2:0]    attnQKVWithSz_tagSel;
  wire                attnQKVWithSz_tagFire;
  wire                attnQKVWithSz_tag_valid;
  wire                attnQKVWithSz_tag_ready;
  wire       [5:0]    attnQKVWithSz_tag_payload;
  wire                attnQKVWithSz_cmd_valid;
  wire                attnQKVWithSz_cmd_ready;
  wire                attnQKVWithSz_cmd_payload_last;
  wire       [71:0]   attnQKVWithSz_cmd_payload_fragment;
  wire                mlpWithPredict_cmd_valid;
  wire                mlpWithPredict_cmd_ready;
  wire                mlpWithPredict_cmd_payload_last;
  wire       [71:0]   mlpWithPredict_cmd_payload_fragment;
  wire       [72:0]   t_mlpWithPredict_cmd_payload_last;
  wire                mlpWithPredict_tag_valid;
  wire                mlpWithPredict_tag_ready;
  wire       [5:0]    mlpWithPredict_tag_payload;
  wire                mlpDense_mlpLnCmd_valid;
  wire                mlpDense_mlpLnCmd_ready;
  wire                mlpDense_mlpLnCmd_payload_last;
  wire       [71:0]   mlpDense_mlpLnCmd_payload_fragment;
  reg        [8:0]    t_mlpDense_attnOCmdVec_payload_last;
  reg        [8:0]    t_mlpDense_attnOCmdVec_payload_last_1;
  reg                 t_mlpDense_attnOCmdVec_payload_last_2;
  wire                t_mlpDense_attnOCmdVec_payload_last_3;
  reg        [31:0]   t_mlpDense_attnOCmdVec_payload_fragment;
  reg        [31:0]   t_mlpDense_attnOCmdVec_payload_fragment_1;
  reg        [22:0]   t_mlpDense_attnOCmdVec_payload_fragment_2;
  wire                mlpDense_attnOCmdVec_valid;
  wire                mlpDense_attnOCmdVec_ready;
  wire                mlpDense_attnOCmdVec_payload_last;
  wire       [71:0]   mlpDense_attnOCmdVec_payload_fragment;
  wire                mlpDense_attnOCmdVec_fire;
  reg        [9:0]    t_mlpDense_mlpDenseGCmdVec_payload_last;
  reg        [9:0]    t_mlpDense_mlpDenseGCmdVec_payload_last_1;
  reg                 t_mlpDense_mlpDenseGCmdVec_payload_last_2;
  wire                t_mlpDense_mlpDenseGCmdVec_payload_last_3;
  reg        [31:0]   t_mlpDense_mlpDenseGCmdVec_payload_fragment;
  reg        [31:0]   t_mlpDense_mlpDenseGCmdVec_payload_fragment_1;
  reg        [22:0]   t_mlpDense_mlpDenseGCmdVec_payload_fragment_2;
  wire                mlpDense_mlpDenseGCmdVec_valid;
  wire                mlpDense_mlpDenseGCmdVec_ready;
  wire                mlpDense_mlpDenseGCmdVec_payload_last;
  wire       [71:0]   mlpDense_mlpDenseGCmdVec_payload_fragment;
  wire                mlpDense_mlpDenseGCmdVec_fire;
  reg        [2:0]    mlpDense_sel;
  wire                mlpDense_muxOutFire;
  reg                 cmdGen_mlpDense_mux_io_output_payload_first;
  wire                mlpDense_muxOutIsFirst;
  wire                mlpDense_selOvf;
  reg        [1:0]    mlpDense_muxSel;
  wire       [5:0]    mlpDense_tagVec_0;
  wire       [5:0]    mlpDense_tagVec_1;
  wire       [5:0]    mlpDense_tagVec_2;
  wire       [5:0]    mlpDense_tagVec_3;
  wire       [5:0]    mlpDense_tagVec_4;
  reg        [2:0]    mlpDense_tagSel;
  wire                mlpDense_tagFire;
  wire                mlpDense_tag_valid;
  wire                mlpDense_tag_ready;
  wire       [5:0]    mlpDense_tag_payload;
  wire                mlpDense_cmd_valid;
  wire                mlpDense_cmd_ready;
  wire                mlpDense_cmd_payload_last;
  wire       [71:0]   mlpDense_cmd_payload_fragment;
  wire                logits_lgDenseScale_valid;
  wire                logits_lgDenseScale_ready;
  wire                logits_lgDenseScale_payload_last;
  wire       [71:0]   logits_lgDenseScale_payload_fragment;
  reg        [13:0]   t_logits_lgDenseHeadVec_payload_last;
  reg        [13:0]   t_logits_lgDenseHeadVec_payload_last_1;
  reg                 t_logits_lgDenseHeadVec_payload_last_2;
  wire                t_logits_lgDenseHeadVec_payload_last_3;
  reg        [31:0]   t_logits_lgDenseHeadVec_payload_fragment;
  reg        [31:0]   t_logits_lgDenseHeadVec_payload_fragment_1;
  reg        [22:0]   t_logits_lgDenseHeadVec_payload_fragment_2;
  wire                logits_lgDenseHeadVec_valid;
  wire                logits_lgDenseHeadVec_ready;
  wire                logits_lgDenseHeadVec_payload_last;
  wire       [71:0]   logits_lgDenseHeadVec_payload_fragment;
  wire                logits_lgDenseHeadVec_fire;
  wire       [72:0]   t_io_inputs_2_payload_last;
  wire       [72:0]   t_io_inputs_3_payload_last;
  reg        [0:0]    logits_sel;
  wire                logits_muxOutFire;
  reg                 cmdGen_logits_mux_io_output_payload_first;
  wire                logits_muxOutIsFirst;
  wire                logits_selOvf;
  wire       [5:0]    logits_tagVec_0;
  wire       [5:0]    logits_tagVec_1;
  reg        [0:0]    logits_tagSel;
  wire                logits_tagFire;
  wire                logits_tag_valid;
  wire                logits_tag_ready;
  wire       [5:0]    logits_tag_payload;
  wire                logits_cmd_valid;
  wire                logits_cmd_ready;
  wire                logits_cmd_payload_last;
  wire       [71:0]   logits_cmd_payload_fragment;
  wire                attnKV_cmd_fire;
  wire                kvDone;
  wire                attnQKVNoSz_cmd_fire;
  wire                qkvNoSzDone;
  wire                attnQKVWithSz_cmd_fire;
  wire                qkvDone;
  wire                mlpWithPredict_cmd_fire;
  wire                sparseMlpDone;
  wire                mlpDense_cmd_fire;
  wire                denseMlpDone;
  wire                mlpDone;
  wire                logits_cmd_fire;
  wire                logitsDone;
  wire                io_mm2s_fire;
  reg                 prefill;
  wire                tokenTag_fire;
  wire                mm2sCmd_valid;
  wire                mm2sCmd_ready;
  wire       [71:0]   mm2sCmd_payload;
  wire                mm2sCmd_s2mPipe_valid;
  reg                 mm2sCmd_s2mPipe_ready;
  wire       [71:0]   mm2sCmd_s2mPipe_payload;
  reg                 mm2sCmd_rValidN;
  reg        [71:0]   mm2sCmd_rData;
  wire                mm2sCmd_s2mPipe_m2sPipe_valid;
  wire                mm2sCmd_s2mPipe_m2sPipe_ready;
  wire       [71:0]   mm2sCmd_s2mPipe_m2sPipe_payload;
  reg                 mm2sCmd_s2mPipe_rValid;
  reg        [71:0]   mm2sCmd_s2mPipe_rData;
  wire                enTokenCnt;
  (* max_fanout = 100 *) reg        [2:0]    select_1;
  reg        [2:0]    selectNext;
  wire                io_tokenIndex_fire;
  wire       [21:0]   s2mm_mallocPerHead;
  reg        [31:0]   s2mm_headBase;
  reg        [31:0]   s2mm_headBaseNext;
  wire                s2mm_enIncHead;
  reg        [3:0]    s2mm_headCnt;
  wire                s2mm_headCntAbout2Ovf;
  reg                 s2mm_headCntOvf;
  wire       [25:0]   s2mm_mallocPerLayer;
  reg        [31:0]   s2mm_layerBase;
  reg        [31:0]   s2mm_layerBaseNext;
  wire                s2mm_enIncLayer;
  reg        [4:0]    s2mm_layerCnt;
  wire                s2mm_layerCntAbout2Ovf;
  reg                 s2mm_layerCntOvf;
  reg        [12:0]   s2mm_s2mmTokenCnt;
  reg        [31:0]   s2mm_attnHeadBase;
  wire       [31:0]   s2mm_attnHeadBaseNext;
  wire       [3:0]    s2mm_s2mmTokenCntLow;
  wire       [8:0]    s2mm_s2mmTokenHigh;
  wire                s2mm_s2mSzToMem;
  wire       [71:0]   s2mm_kCacheCmd;
  wire       [71:0]   s2mm_vCacheCmd;
  wire       [71:0]   s2mm_kSzCmd;
  wire       [71:0]   s2mm_vSzCmd;
  wire                s2mm_s2mmCmd_valid;
  reg                 s2mm_s2mmCmd_ready;
  wire       [71:0]   s2mm_s2mmCmd_payload;
  wire       [1:0]    s2mm_toMemSel;
  reg        [1:0]    s2mm_cnt;
  wire                s2mm_s2mmCmd_fire;
  reg                 s2mm_s2mmCmdThrow_valid;
  wire                s2mm_s2mmCmdThrow_ready;
  wire       [71:0]   s2mm_s2mmCmdThrow_payload;

  assign t_when = ((! s2mm_s2mSzToMem) && (s2mm_cnt[0] == 1'b0));
  assign t_headBaseNext = {10'd0, mallocPerHead};
  assign t_layerBaseNext = {6'd0, mallocPerLayer};
  assign t_tokenIn_payload_fragment_1 = (t_tokenIn_payload_fragment_2 + 29'h00036000);
  assign t_tokenIn_payload_fragment = {3'd0, t_tokenIn_payload_fragment_1};
  assign t_tokenIn_payload_fragment_2 = (io_tokenIndex_tdata * 12'hc00);
  assign t_tokenIn_payload_fragment_4 = 12'hc00;
  assign t_tokenIn_payload_fragment_3 = {11'd0, t_tokenIn_payload_fragment_4};
  assign t_attnLn_payload_fragment = (32'h0 + layerBase);
  assign t_attnLn_payload_fragment_2 = 13'h1800;
  assign t_attnLn_payload_fragment_1 = {10'd0, t_attnLn_payload_fragment_2};
  assign t_t_indexCmdGen_denseU_payload_fragment_2 = (t_indexCmdGen_denseU_payload_last_3 ? 14'h2000 : 14'h2000);
  assign t_indexCmdGen_denseU_payload_fragment_3 = (t_indexCmdGen_denseU_payload_fragment + layerBase);
  assign t_t_indexCmdGen_denseD_payload_fragment_2 = (t_indexCmdGen_denseD_payload_last_3 ? 14'h2000 : 14'h2000);
  assign t_indexCmdGen_denseD_payload_fragment_3 = (t_indexCmdGen_denseD_payload_fragment + layerBase);
  assign t_t_attnKV_attnKCmdVec_payload_fragment_2 = (t_attnKV_attnKCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnKV_attnKCmdVec_payload_fragment_3 = (t_attnKV_attnKCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnKV_attnVCmdVec_payload_fragment_2 = (t_attnKV_attnVCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnKV_attnVCmdVec_payload_fragment_3 = (t_attnKV_attnVCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnQKVNoSz_attnQCmdVec_payload_fragment_2 = (t_attnQKVNoSz_attnQCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVNoSz_attnQCmdVec_payload_fragment_3 = (t_attnQKVNoSz_attnQCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnQKVNoSz_attnKCmdVec_payload_fragment_2 = (t_attnQKVNoSz_attnKCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVNoSz_attnKCmdVec_payload_fragment_3 = (t_attnQKVNoSz_attnKCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnQKVNoSz_attnVCmdVec_payload_fragment_2 = (t_attnQKVNoSz_attnVCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVNoSz_attnVCmdVec_payload_fragment_3 = (t_attnQKVNoSz_attnVCmdVec_payload_fragment + attnHeadBase);
  assign t_attnQKVNoSz_attnKCacheCmd_payload_fragment = (32'h00096000 + attnHeadBase);
  assign t_attnQKVNoSz_attnKCacheCmd_payload_fragment_2 = {token,7'h0};
  assign t_attnQKVNoSz_attnKCacheCmd_payload_fragment_1 = {3'd0, t_attnQKVNoSz_attnKCacheCmd_payload_fragment_2};
  assign t_attnQKVNoSz_attnVCacheCmd_payload_fragment = (32'h00196000 + attnHeadBase);
  assign t_attnQKVNoSz_attnVCacheCmd_payload_fragment_2 = {token,7'h0};
  assign t_attnQKVNoSz_attnVCacheCmd_payload_fragment_1 = {3'd0, t_attnQKVNoSz_attnVCacheCmd_payload_fragment_2};
  assign t_t_attnQKVWithSz_attnQCmdVec_payload_fragment_2 = (t_attnQKVWithSz_attnQCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVWithSz_attnQCmdVec_payload_fragment_3 = (t_attnQKVWithSz_attnQCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnQKVWithSz_attnKCmdVec_payload_fragment_2 = (t_attnQKVWithSz_attnKCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVWithSz_attnKCmdVec_payload_fragment_3 = (t_attnQKVWithSz_attnKCmdVec_payload_fragment + attnHeadBase);
  assign t_t_attnQKVWithSz_attnVCmdVec_payload_fragment_2 = (t_attnQKVWithSz_attnVCmdVec_payload_last_3 ? 14'h1e00 : 14'h2000);
  assign t_attnQKVWithSz_attnVCmdVec_payload_fragment_3 = (t_attnQKVWithSz_attnVCmdVec_payload_fragment + attnHeadBase);
  assign t_attnQKVWithSz_attnKszCmd_payload_fragment = (32'h00296000 + attnHeadBase);
  assign t_attnQKVWithSz_attnKszCmd_payload_fragment_2 = {token[12 : 4],6'h0};
  assign t_attnQKVWithSz_attnKszCmd_payload_fragment_1 = {8'd0, t_attnQKVWithSz_attnKszCmd_payload_fragment_2};
  assign t_attnQKVWithSz_attnVszCmd_payload_fragment = (32'h0029e000 + attnHeadBase);
  assign t_attnQKVWithSz_attnVszCmd_payload_fragment_2 = {token[12 : 4],6'h0};
  assign t_attnQKVWithSz_attnVszCmd_payload_fragment_1 = {8'd0, t_attnQKVWithSz_attnVszCmd_payload_fragment_2};
  assign t_attnQKVWithSz_attnKCacheCmd_payload_fragment = (32'h00096000 + attnHeadBase);
  assign t_attnQKVWithSz_attnKCacheCmd_payload_fragment_2 = {token,7'h0};
  assign t_attnQKVWithSz_attnKCacheCmd_payload_fragment_1 = {3'd0, t_attnQKVWithSz_attnKCacheCmd_payload_fragment_2};
  assign t_attnQKVWithSz_attnVCacheCmd_payload_fragment = (32'h00196000 + attnHeadBase);
  assign t_attnQKVWithSz_attnVCacheCmd_payload_fragment_2 = {token,7'h0};
  assign t_attnQKVWithSz_attnVCacheCmd_payload_fragment_1 = {3'd0, t_attnQKVWithSz_attnVCacheCmd_payload_fragment_2};
  assign t_mlpDense_mlpLnCmd_payload_fragment = (32'h02222000 + layerBase);
  assign t_mlpDense_mlpLnCmd_payload_fragment_2 = 12'hc00;
  assign t_mlpDense_mlpLnCmd_payload_fragment_1 = {11'd0, t_mlpDense_mlpLnCmd_payload_fragment_2};
  assign t_t_mlpDense_attnOCmdVec_payload_fragment_2 = (t_mlpDense_attnOCmdVec_payload_last_3 ? 14'h0800 : 14'h2000);
  assign t_mlpDense_attnOCmdVec_payload_fragment_3 = (t_mlpDense_attnOCmdVec_payload_fragment + layerBase);
  assign t_t_mlpDense_mlpDenseGCmdVec_payload_fragment_2 = (t_mlpDense_mlpDenseGCmdVec_payload_last_3 ? 14'h2000 : 14'h2000);
  assign t_mlpDense_mlpDenseGCmdVec_payload_fragment_3 = (t_mlpDense_mlpDenseGCmdVec_payload_fragment + layerBase);
  assign t_logits_lgDenseScale_payload_fragment_1 = (31'h74e40000 + 31'h00036000);
  assign t_logits_lgDenseScale_payload_fragment = {1'd0, t_logits_lgDenseScale_payload_fragment_1};
  assign t_logits_lgDenseScale_payload_fragment_3 = 12'hc00;
  assign t_logits_lgDenseScale_payload_fragment_2 = {11'd0, t_logits_lgDenseScale_payload_fragment_3};
  assign t_t_logits_lgDenseHeadVec_payload_fragment_2 = (t_logits_lgDenseHeadVec_payload_last_3 ? 14'h1600 : 14'h2000);
  assign t_logits_lgDenseHeadVec_payload_fragment_3 = (t_logits_lgDenseHeadVec_payload_fragment + 32'h00036000);
  assign t_s2mm_headBaseNext = {10'd0, s2mm_mallocPerHead};
  assign t_s2mm_layerBaseNext = {6'd0, s2mm_mallocPerLayer};
  assign t_s2mm_kCacheCmd = (t_s2mm_kCacheCmd_1 + t_s2mm_kCacheCmd_3);
  assign t_s2mm_kCacheCmd_2 = {s2mm_s2mmTokenCnt,5'h0};
  assign t_s2mm_kCacheCmd_1 = {14'd0, t_s2mm_kCacheCmd_2};
  assign t_s2mm_kCacheCmd_3 = (s2mm_attnHeadBase + 32'h00096000);
  assign t_s2mm_kCacheCmd_5 = 8'h80;
  assign t_s2mm_kCacheCmd_4 = {15'd0, t_s2mm_kCacheCmd_5};
  assign t_s2mm_vCacheCmd = (t_s2mm_vCacheCmd_1 + t_s2mm_vCacheCmd_3);
  assign t_s2mm_vCacheCmd_2 = {s2mm_s2mmTokenCnt,5'h0};
  assign t_s2mm_vCacheCmd_1 = {14'd0, t_s2mm_vCacheCmd_2};
  assign t_s2mm_vCacheCmd_3 = (s2mm_attnHeadBase + 32'h00196000);
  assign t_s2mm_vCacheCmd_5 = 8'h80;
  assign t_s2mm_vCacheCmd_4 = {15'd0, t_s2mm_vCacheCmd_5};
  assign t_s2mm_kSzCmd = (t_s2mm_kSzCmd_1 + t_s2mm_kSzCmd_3);
  assign t_s2mm_kSzCmd_2 = {s2mm_s2mmTokenHigh,4'b0000};
  assign t_s2mm_kSzCmd_1 = {19'd0, t_s2mm_kSzCmd_2};
  assign t_s2mm_kSzCmd_3 = (s2mm_attnHeadBase + 32'h00296000);
  assign t_s2mm_kSzCmd_5 = 7'h40;
  assign t_s2mm_kSzCmd_4 = {16'd0, t_s2mm_kSzCmd_5};
  assign t_s2mm_vSzCmd = (t_s2mm_vSzCmd_1 + t_s2mm_vSzCmd_3);
  assign t_s2mm_vSzCmd_2 = {s2mm_s2mmTokenHigh,4'b0000};
  assign t_s2mm_vSzCmd_1 = {19'd0, t_s2mm_vSzCmd_2};
  assign t_s2mm_vSzCmd_3 = (s2mm_attnHeadBase + 32'h0029e000);
  assign t_s2mm_vSzCmd_5 = 7'h40;
  assign t_s2mm_vSzCmd_4 = {16'd0, t_s2mm_vSzCmd_5};
  StreamMux_30 indexCmdGen_indexMux (
    .io_select                    (indexCmdGen_denseLastCnt                             ), //i
    .io_inputs_0_valid            (indexCmdGen_denseU_valid                             ), //i
    .io_inputs_0_ready            (indexCmdGen_indexMux_io_inputs_0_ready               ), //o
    .io_inputs_0_payload_last     (indexCmdGen_denseU_payload_last                      ), //i
    .io_inputs_0_payload_fragment (indexCmdGen_denseU_payload_fragment[71:0]            ), //i
    .io_inputs_1_valid            (indexCmdGen_denseD_valid                             ), //i
    .io_inputs_1_ready            (indexCmdGen_indexMux_io_inputs_1_ready               ), //o
    .io_inputs_1_payload_last     (indexCmdGen_denseD_payload_last                      ), //i
    .io_inputs_1_payload_fragment (indexCmdGen_denseD_payload_fragment[71:0]            ), //i
    .io_output_valid              (indexCmdGen_indexMux_io_output_valid                 ), //o
    .io_output_ready              (indexCmdGen_indexMux_io_output_ready                 ), //i
    .io_output_payload_last       (indexCmdGen_indexMux_io_output_payload_last          ), //o
    .io_output_payload_fragment   (indexCmdGen_indexMux_io_output_payload_fragment[71:0])  //o
  );
  StreamFifoPipe_9 indexCmdGen_indexCmdFifo (
    .io_push_valid   (indexCmdGen_indexCmd_valid                    ), //i
    .io_push_ready   (indexCmdGen_indexCmdFifo_io_push_ready        ), //o
    .io_push_payload (indexCmdGen_indexCmd_payload_fragment[71:0]   ), //i
    .io_pop_valid    (indexCmdGen_indexCmdFifo_io_pop_valid         ), //o
    .io_pop_ready    (indexCmdGen_indexCmdOut_ready                 ), //i
    .io_pop_payload  (indexCmdGen_indexCmdFifo_io_pop_payload[71:0] ), //o
    .io_flush        (1'b0                                          ), //i
    .io_occupancy    (indexCmdGen_indexCmdFifo_io_occupancy[12:0]   ), //o
    .io_availability (indexCmdGen_indexCmdFifo_io_availability[12:0]), //o
    .clk_0_clk       (clk_0_clk                                     ), //i
    .clk_0_resetn    (clk_0_resetn                                  )  //i
  );
  StreamFifoPipe_3 indexCmdGen_indexLastFifo (
    .io_push_valid   (cmdGen_indexCmdGen_indexCmdFifo_io_push_fire   ), //i
    .io_push_ready   (indexCmdGen_indexLastFifo_io_push_ready        ), //o
    .io_push_payload (indexCmdGen_indexCmd_payload_last              ), //i
    .io_pop_valid    (indexCmdGen_indexLastFifo_io_pop_valid         ), //o
    .io_pop_ready    (cmdGen_indexCmdGen_indexCmdFifo_io_pop_fire    ), //i
    .io_pop_payload  (indexCmdGen_indexLastFifo_io_pop_payload       ), //o
    .io_flush        (1'b0                                           ), //i
    .io_occupancy    (indexCmdGen_indexLastFifo_io_occupancy[12:0]   ), //o
    .io_availability (indexCmdGen_indexLastFifo_io_availability[12:0]), //o
    .clk_0_clk       (clk_0_clk                                      ), //i
    .clk_0_resetn    (clk_0_resetn                                   )  //i
  );
  StreamDemux_11 indexCmdGen_deMux (
    .io_select                     (indexCmdGen_deMux_io_select                          ), //i
    .io_input_valid                (indexCmdGen_indexCmdOut_valid                        ), //i
    .io_input_ready                (indexCmdGen_deMux_io_input_ready                     ), //o
    .io_input_payload_last         (indexCmdGen_indexCmdOut_payload_last                 ), //i
    .io_input_payload_fragment     (indexCmdGen_indexCmdOut_payload_fragment[71:0]       ), //i
    .io_outputs_0_valid            (indexCmdGen_deMux_io_outputs_0_valid                 ), //o
    .io_outputs_0_ready            (mlpDense_mux_io_inputs_3_ready                       ), //i
    .io_outputs_0_payload_last     (indexCmdGen_deMux_io_outputs_0_payload_last          ), //o
    .io_outputs_0_payload_fragment (indexCmdGen_deMux_io_outputs_0_payload_fragment[71:0]), //o
    .io_outputs_1_valid            (indexCmdGen_deMux_io_outputs_1_valid                 ), //o
    .io_outputs_1_ready            (1'b1                                                 ), //i
    .io_outputs_1_payload_last     (indexCmdGen_deMux_io_outputs_1_payload_last          ), //o
    .io_outputs_1_payload_fragment (indexCmdGen_deMux_io_outputs_1_payload_fragment[71:0])  //o
  );
  StreamMux_30 attnKV_mux (
    .io_select                    (attnKV_sel                                 ), //i
    .io_inputs_0_valid            (attnKV_attnKCmdVec_valid                   ), //i
    .io_inputs_0_ready            (attnKV_mux_io_inputs_0_ready               ), //o
    .io_inputs_0_payload_last     (attnKV_attnKCmdVec_payload_last            ), //i
    .io_inputs_0_payload_fragment (attnKV_attnKCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_1_valid            (attnKV_attnVCmdVec_valid                   ), //i
    .io_inputs_1_ready            (attnKV_mux_io_inputs_1_ready               ), //o
    .io_inputs_1_payload_last     (attnKV_attnVCmdVec_payload_last            ), //i
    .io_inputs_1_payload_fragment (attnKV_attnVCmdVec_payload_fragment[71:0]  ), //i
    .io_output_valid              (attnKV_mux_io_output_valid                 ), //o
    .io_output_ready              (attnKV_cmd_ready                           ), //i
    .io_output_payload_last       (attnKV_mux_io_output_payload_last          ), //o
    .io_output_payload_fragment   (attnKV_mux_io_output_payload_fragment[71:0])  //o
  );
  StreamMux_32 attnQKVNoSz_mux (
    .io_select                    (attnQKVNoSz_sel[2:0]                            ), //i
    .io_inputs_0_valid            (attnQKVNoSz_attnQCmdVec_valid                   ), //i
    .io_inputs_0_ready            (attnQKVNoSz_mux_io_inputs_0_ready               ), //o
    .io_inputs_0_payload_last     (attnQKVNoSz_attnQCmdVec_payload_last            ), //i
    .io_inputs_0_payload_fragment (attnQKVNoSz_attnQCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_1_valid            (attnQKVNoSz_attnKCmdVec_valid                   ), //i
    .io_inputs_1_ready            (attnQKVNoSz_mux_io_inputs_1_ready               ), //o
    .io_inputs_1_payload_last     (attnQKVNoSz_attnKCmdVec_payload_last            ), //i
    .io_inputs_1_payload_fragment (attnQKVNoSz_attnKCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_2_valid            (attnQKVNoSz_attnKCacheCmd_valid                 ), //i
    .io_inputs_2_ready            (attnQKVNoSz_mux_io_inputs_2_ready               ), //o
    .io_inputs_2_payload_last     (attnQKVNoSz_attnKCacheCmd_payload_last          ), //i
    .io_inputs_2_payload_fragment (attnQKVNoSz_attnKCacheCmd_payload_fragment[71:0]), //i
    .io_inputs_3_valid            (attnQKVNoSz_attnVCmdVec_valid                   ), //i
    .io_inputs_3_ready            (attnQKVNoSz_mux_io_inputs_3_ready               ), //o
    .io_inputs_3_payload_last     (attnQKVNoSz_attnVCmdVec_payload_last            ), //i
    .io_inputs_3_payload_fragment (attnQKVNoSz_attnVCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_4_valid            (attnQKVNoSz_attnVCacheCmd_valid                 ), //i
    .io_inputs_4_ready            (attnQKVNoSz_mux_io_inputs_4_ready               ), //o
    .io_inputs_4_payload_last     (attnQKVNoSz_attnVCacheCmd_payload_last          ), //i
    .io_inputs_4_payload_fragment (attnQKVNoSz_attnVCacheCmd_payload_fragment[71:0]), //i
    .io_output_valid              (attnQKVNoSz_mux_io_output_valid                 ), //o
    .io_output_ready              (attnQKVNoSz_cmd_ready                           ), //i
    .io_output_payload_last       (attnQKVNoSz_mux_io_output_payload_last          ), //o
    .io_output_payload_fragment   (attnQKVNoSz_mux_io_output_payload_fragment[71:0])  //o
  );
  StreamMux_33 attnQKVWithSz_mux (
    .io_select                    (attnQKVWithSz_sel[2:0]                            ), //i
    .io_inputs_0_valid            (attnQKVWithSz_attnQCmdVec_valid                   ), //i
    .io_inputs_0_ready            (attnQKVWithSz_mux_io_inputs_0_ready               ), //o
    .io_inputs_0_payload_last     (attnQKVWithSz_attnQCmdVec_payload_last            ), //i
    .io_inputs_0_payload_fragment (attnQKVWithSz_attnQCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_1_valid            (attnQKVWithSz_attnKCmdVec_valid                   ), //i
    .io_inputs_1_ready            (attnQKVWithSz_mux_io_inputs_1_ready               ), //o
    .io_inputs_1_payload_last     (attnQKVWithSz_attnKCmdVec_payload_last            ), //i
    .io_inputs_1_payload_fragment (attnQKVWithSz_attnKCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_2_valid            (attnQKVWithSz_attnKszCmd_valid                    ), //i
    .io_inputs_2_ready            (attnQKVWithSz_mux_io_inputs_2_ready               ), //o
    .io_inputs_2_payload_last     (attnQKVWithSz_attnKszCmd_payload_last             ), //i
    .io_inputs_2_payload_fragment (attnQKVWithSz_attnKszCmd_payload_fragment[71:0]   ), //i
    .io_inputs_3_valid            (attnQKVWithSz_attnKCacheCmd_valid                 ), //i
    .io_inputs_3_ready            (attnQKVWithSz_mux_io_inputs_3_ready               ), //o
    .io_inputs_3_payload_last     (attnQKVWithSz_attnKCacheCmd_payload_last          ), //i
    .io_inputs_3_payload_fragment (attnQKVWithSz_attnKCacheCmd_payload_fragment[71:0]), //i
    .io_inputs_4_valid            (attnQKVWithSz_attnVCmdVec_valid                   ), //i
    .io_inputs_4_ready            (attnQKVWithSz_mux_io_inputs_4_ready               ), //o
    .io_inputs_4_payload_last     (attnQKVWithSz_attnVCmdVec_payload_last            ), //i
    .io_inputs_4_payload_fragment (attnQKVWithSz_attnVCmdVec_payload_fragment[71:0]  ), //i
    .io_inputs_5_valid            (attnQKVWithSz_attnVszCmd_valid                    ), //i
    .io_inputs_5_ready            (attnQKVWithSz_mux_io_inputs_5_ready               ), //o
    .io_inputs_5_payload_last     (attnQKVWithSz_attnVszCmd_payload_last             ), //i
    .io_inputs_5_payload_fragment (attnQKVWithSz_attnVszCmd_payload_fragment[71:0]   ), //i
    .io_inputs_6_valid            (attnQKVWithSz_attnVCacheCmd_valid                 ), //i
    .io_inputs_6_ready            (attnQKVWithSz_mux_io_inputs_6_ready               ), //o
    .io_inputs_6_payload_last     (attnQKVWithSz_attnVCacheCmd_payload_last          ), //i
    .io_inputs_6_payload_fragment (attnQKVWithSz_attnVCacheCmd_payload_fragment[71:0]), //i
    .io_output_valid              (attnQKVWithSz_mux_io_output_valid                 ), //o
    .io_output_ready              (attnQKVWithSz_cmd_ready                           ), //i
    .io_output_payload_last       (attnQKVWithSz_mux_io_output_payload_last          ), //o
    .io_output_payload_fragment   (attnQKVWithSz_mux_io_output_payload_fragment[71:0])  //o
  );
  StreamMux_34 mlpDense_mux (
    .io_select                    (mlpDense_muxSel[1:0]                                 ), //i
    .io_inputs_0_valid            (mlpDense_attnOCmdVec_valid                           ), //i
    .io_inputs_0_ready            (mlpDense_mux_io_inputs_0_ready                       ), //o
    .io_inputs_0_payload_last     (mlpDense_attnOCmdVec_payload_last                    ), //i
    .io_inputs_0_payload_fragment (mlpDense_attnOCmdVec_payload_fragment[71:0]          ), //i
    .io_inputs_1_valid            (mlpDense_mlpLnCmd_valid                              ), //i
    .io_inputs_1_ready            (mlpDense_mux_io_inputs_1_ready                       ), //o
    .io_inputs_1_payload_last     (mlpDense_mlpLnCmd_payload_last                       ), //i
    .io_inputs_1_payload_fragment (mlpDense_mlpLnCmd_payload_fragment[71:0]             ), //i
    .io_inputs_2_valid            (mlpDense_mlpDenseGCmdVec_valid                       ), //i
    .io_inputs_2_ready            (mlpDense_mux_io_inputs_2_ready                       ), //o
    .io_inputs_2_payload_last     (mlpDense_mlpDenseGCmdVec_payload_last                ), //i
    .io_inputs_2_payload_fragment (mlpDense_mlpDenseGCmdVec_payload_fragment[71:0]      ), //i
    .io_inputs_3_valid            (indexCmdGen_deMux_io_outputs_0_valid                 ), //i
    .io_inputs_3_ready            (mlpDense_mux_io_inputs_3_ready                       ), //o
    .io_inputs_3_payload_last     (indexCmdGen_deMux_io_outputs_0_payload_last          ), //i
    .io_inputs_3_payload_fragment (indexCmdGen_deMux_io_outputs_0_payload_fragment[71:0]), //i
    .io_output_valid              (mlpDense_mux_io_output_valid                         ), //o
    .io_output_ready              (mlpDense_cmd_ready                                   ), //i
    .io_output_payload_last       (mlpDense_mux_io_output_payload_last                  ), //o
    .io_output_payload_fragment   (mlpDense_mux_io_output_payload_fragment[71:0]        )  //o
  );
  StreamMux_34 logits_mux (
    .io_select                    (logits_mux_io_select[1:0]                    ), //i
    .io_inputs_0_valid            (logits_lgDenseScale_valid                    ), //i
    .io_inputs_0_ready            (logits_mux_io_inputs_0_ready                 ), //o
    .io_inputs_0_payload_last     (logits_lgDenseScale_payload_last             ), //i
    .io_inputs_0_payload_fragment (logits_lgDenseScale_payload_fragment[71:0]   ), //i
    .io_inputs_1_valid            (logits_lgDenseHeadVec_valid                  ), //i
    .io_inputs_1_ready            (logits_mux_io_inputs_1_ready                 ), //o
    .io_inputs_1_payload_last     (logits_lgDenseHeadVec_payload_last           ), //i
    .io_inputs_1_payload_fragment (logits_lgDenseHeadVec_payload_fragment[71:0] ), //i
    .io_inputs_2_valid            (1'b0                                         ), //i
    .io_inputs_2_ready            (logits_mux_io_inputs_2_ready                 ), //o
    .io_inputs_2_payload_last     (logits_mux_io_inputs_2_payload_last          ), //i
    .io_inputs_2_payload_fragment (logits_mux_io_inputs_2_payload_fragment[71:0]), //i
    .io_inputs_3_valid            (1'b0                                         ), //i
    .io_inputs_3_ready            (logits_mux_io_inputs_3_ready                 ), //o
    .io_inputs_3_payload_last     (logits_mux_io_inputs_3_payload_last          ), //i
    .io_inputs_3_payload_fragment (logits_mux_io_inputs_3_payload_fragment[71:0]), //i
    .io_output_valid              (logits_mux_io_output_valid                   ), //o
    .io_output_ready              (logits_cmd_ready                             ), //i
    .io_output_payload_last       (logits_mux_io_output_payload_last            ), //o
    .io_output_payload_fragment   (logits_mux_io_output_payload_fragment[71:0]  )  //o
  );
  StreamMux_36 mm2sCmdMux (
    .io_select                    (select_1[2:0]                              ), //i
    .io_inputs_0_valid            (tokenIn_valid                              ), //i
    .io_inputs_0_ready            (mm2sCmdMux_io_inputs_0_ready               ), //o
    .io_inputs_0_payload_last     (tokenIn_payload_last                       ), //i
    .io_inputs_0_payload_fragment (tokenIn_payload_fragment[71:0]             ), //i
    .io_inputs_1_valid            (attnLn_valid                               ), //i
    .io_inputs_1_ready            (mm2sCmdMux_io_inputs_1_ready               ), //o
    .io_inputs_1_payload_last     (attnLn_payload_last                        ), //i
    .io_inputs_1_payload_fragment (attnLn_payload_fragment[71:0]              ), //i
    .io_inputs_2_valid            (attnKV_cmd_valid                           ), //i
    .io_inputs_2_ready            (mm2sCmdMux_io_inputs_2_ready               ), //o
    .io_inputs_2_payload_last     (attnKV_cmd_payload_last                    ), //i
    .io_inputs_2_payload_fragment (attnKV_cmd_payload_fragment[71:0]          ), //i
    .io_inputs_3_valid            (attnQKVNoSz_cmd_valid                      ), //i
    .io_inputs_3_ready            (mm2sCmdMux_io_inputs_3_ready               ), //o
    .io_inputs_3_payload_last     (attnQKVNoSz_cmd_payload_last               ), //i
    .io_inputs_3_payload_fragment (attnQKVNoSz_cmd_payload_fragment[71:0]     ), //i
    .io_inputs_4_valid            (attnQKVWithSz_cmd_valid                    ), //i
    .io_inputs_4_ready            (mm2sCmdMux_io_inputs_4_ready               ), //o
    .io_inputs_4_payload_last     (attnQKVWithSz_cmd_payload_last             ), //i
    .io_inputs_4_payload_fragment (attnQKVWithSz_cmd_payload_fragment[71:0]   ), //i
    .io_inputs_5_valid            (mlpWithPredict_cmd_valid                   ), //i
    .io_inputs_5_ready            (mm2sCmdMux_io_inputs_5_ready               ), //o
    .io_inputs_5_payload_last     (mlpWithPredict_cmd_payload_last            ), //i
    .io_inputs_5_payload_fragment (mlpWithPredict_cmd_payload_fragment[71:0]  ), //i
    .io_inputs_6_valid            (mlpDense_cmd_valid                         ), //i
    .io_inputs_6_ready            (mm2sCmdMux_io_inputs_6_ready               ), //o
    .io_inputs_6_payload_last     (mlpDense_cmd_payload_last                  ), //i
    .io_inputs_6_payload_fragment (mlpDense_cmd_payload_fragment[71:0]        ), //i
    .io_inputs_7_valid            (logits_cmd_valid                           ), //i
    .io_inputs_7_ready            (mm2sCmdMux_io_inputs_7_ready               ), //o
    .io_inputs_7_payload_last     (logits_cmd_payload_last                    ), //i
    .io_inputs_7_payload_fragment (logits_cmd_payload_fragment[71:0]          ), //i
    .io_output_valid              (mm2sCmdMux_io_output_valid                 ), //o
    .io_output_ready              (mm2sCmd_ready                              ), //i
    .io_output_payload_last       (mm2sCmdMux_io_output_payload_last          ), //o
    .io_output_payload_fragment   (mm2sCmdMux_io_output_payload_fragment[71:0])  //o
  );
  StreamMux_37 busTagMux (
    .io_select           (select_1[2:0]                   ), //i
    .io_inputs_0_valid   (tokenTag_valid                  ), //i
    .io_inputs_0_ready   (busTagMux_io_inputs_0_ready     ), //o
    .io_inputs_0_payload (tokenTag_payload[5:0]           ), //i
    .io_inputs_1_valid   (attnLnTag_valid                 ), //i
    .io_inputs_1_ready   (busTagMux_io_inputs_1_ready     ), //o
    .io_inputs_1_payload (attnLnTag_payload[5:0]          ), //i
    .io_inputs_2_valid   (attnKV_tag_valid                ), //i
    .io_inputs_2_ready   (busTagMux_io_inputs_2_ready     ), //o
    .io_inputs_2_payload (attnKV_tag_payload[5:0]         ), //i
    .io_inputs_3_valid   (attnQKVNoSz_tag_valid           ), //i
    .io_inputs_3_ready   (busTagMux_io_inputs_3_ready     ), //o
    .io_inputs_3_payload (attnQKVNoSz_tag_payload[5:0]    ), //i
    .io_inputs_4_valid   (attnQKVWithSz_tag_valid         ), //i
    .io_inputs_4_ready   (busTagMux_io_inputs_4_ready     ), //o
    .io_inputs_4_payload (attnQKVWithSz_tag_payload[5:0]  ), //i
    .io_inputs_5_valid   (mlpWithPredict_tag_valid        ), //i
    .io_inputs_5_ready   (busTagMux_io_inputs_5_ready     ), //o
    .io_inputs_5_payload (mlpWithPredict_tag_payload[5:0] ), //i
    .io_inputs_6_valid   (mlpDense_tag_valid              ), //i
    .io_inputs_6_ready   (busTagMux_io_inputs_6_ready     ), //o
    .io_inputs_6_payload (mlpDense_tag_payload[5:0]       ), //i
    .io_inputs_7_valid   (logits_tag_valid                ), //i
    .io_inputs_7_ready   (busTagMux_io_inputs_7_ready     ), //o
    .io_inputs_7_payload (logits_tag_payload[5:0]         ), //i
    .io_output_valid     (busTagMux_io_output_valid       ), //o
    .io_output_ready     (tagFifo_io_push_ready           ), //i
    .io_output_payload   (busTagMux_io_output_payload[5:0])  //o
  );
  StreamFifo_57 tagFifo (
    .io_push_valid   (busTagMux_io_output_valid       ), //i
    .io_push_ready   (tagFifo_io_push_ready           ), //o
    .io_push_payload (busTagMux_io_output_payload[5:0]), //i
    .io_pop_valid    (tagFifo_io_pop_valid            ), //o
    .io_pop_ready    (tagFifo_io_pop_ready            ), //i
    .io_pop_payload  (tagFifo_io_pop_payload[5:0]     ), //o
    .io_flush        (1'b0                            ), //i
    .io_occupancy    (tagFifo_io_occupancy[6:0]       ), //o
    .io_availability (tagFifo_io_availability[6:0]    ), //o
    .clk_0_clk       (clk_0_clk                       ), //i
    .clk_0_resetn    (clk_0_resetn                    )  //i
  );
  StreamFifo_58 s2mm_tokenEnFifo (
    .io_push_valid   (io_tokenIndex_fire                   ), //i
    .io_push_ready   (s2mm_tokenEnFifo_io_push_ready       ), //o
    .io_pop_valid    (s2mm_tokenEnFifo_io_pop_valid        ), //o
    .io_pop_ready    (s2mm_tokenEnFifo_io_pop_ready        ), //i
    .io_flush        (1'b0                                 ), //i
    .io_occupancy    (s2mm_tokenEnFifo_io_occupancy[6:0]   ), //o
    .io_availability (s2mm_tokenEnFifo_io_availability[6:0]), //o
    .clk_0_clk       (clk_0_clk                            ), //i
    .clk_0_resetn    (clk_0_resetn                         )  //i
  );
  StreamFifo_59 s2mm_cmdFifo (
    .io_push_valid   (s2mm_s2mmCmdThrow_valid          ), //i
    .io_push_ready   (s2mm_cmdFifo_io_push_ready       ), //o
    .io_push_payload (s2mm_s2mmCmdThrow_payload[71:0]  ), //i
    .io_pop_valid    (s2mm_cmdFifo_io_pop_valid        ), //o
    .io_pop_ready    (io_s2mmCmd_ready                 ), //i
    .io_pop_payload  (s2mm_cmdFifo_io_pop_payload[71:0]), //o
    .io_flush        (1'b0                             ), //i
    .io_occupancy    (s2mm_cmdFifo_io_occupancy[5:0]   ), //o
    .io_availability (s2mm_cmdFifo_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                        ), //i
    .clk_0_resetn    (clk_0_resetn                     )  //i
  );
  always @(*) begin
    case(indexCmdGen_denseLastCnt)
      1'b0 : begin
        t_indexCmdGen_selDenseBaseAddr = indexCmdGen_denseBaseAddrOs_0;
        t_indexCmdGen_selDenseLen = indexCmdGen_denseLen_0;
        t_indexCmdGen_selDenseTag = indexCmdGen_denseTag_0;
      end
      default : begin
        t_indexCmdGen_selDenseBaseAddr = indexCmdGen_denseBaseAddrOs_1;
        t_indexCmdGen_selDenseLen = indexCmdGen_denseLen_1;
        t_indexCmdGen_selDenseTag = indexCmdGen_denseTag_1;
      end
    endcase
  end

  always @(*) begin
    case(attnKV_tagSel)
      1'b0 : t_attnKV_tag_payload = attnKV_tagVec_0;
      default : t_attnKV_tag_payload = attnKV_tagVec_1;
    endcase
  end

  always @(*) begin
    case(attnQKVNoSz_tagSel)
      3'b000 : t_attnQKVNoSz_tag_payload = attnQKVNoSz_tagVec_0;
      3'b001 : t_attnQKVNoSz_tag_payload = attnQKVNoSz_tagVec_1;
      3'b010 : t_attnQKVNoSz_tag_payload = attnQKVNoSz_tagVec_2;
      3'b011 : t_attnQKVNoSz_tag_payload = attnQKVNoSz_tagVec_3;
      default : t_attnQKVNoSz_tag_payload = attnQKVNoSz_tagVec_4;
    endcase
  end

  always @(*) begin
    case(attnQKVWithSz_tagSel)
      3'b000 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_0;
      3'b001 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_1;
      3'b010 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_2;
      3'b011 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_3;
      3'b100 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_4;
      3'b101 : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_5;
      default : t_attnQKVWithSz_tag_payload = attnQKVWithSz_tagVec_6;
    endcase
  end

  always @(*) begin
    case(mlpDense_tagSel)
      3'b000 : t_mlpDense_tag_payload = mlpDense_tagVec_0;
      3'b001 : t_mlpDense_tag_payload = mlpDense_tagVec_1;
      3'b010 : t_mlpDense_tag_payload = mlpDense_tagVec_2;
      3'b011 : t_mlpDense_tag_payload = mlpDense_tagVec_3;
      default : t_mlpDense_tag_payload = mlpDense_tagVec_4;
    endcase
  end

  always @(*) begin
    case(logits_tagSel)
      1'b0 : t_logits_tag_payload = logits_tagVec_0;
      default : t_logits_tag_payload = logits_tagVec_1;
    endcase
  end

  always @(*) begin
    case(s2mm_toMemSel)
      2'b00 : t_s2mm_s2mmCmd_payload = s2mm_kSzCmd;
      2'b01 : t_s2mm_s2mmCmd_payload = s2mm_kCacheCmd;
      2'b10 : t_s2mm_s2mmCmd_payload = s2mm_vSzCmd;
      default : t_s2mm_s2mmCmd_payload = s2mm_vCacheCmd;
    endcase
  end

  assign tokenHigh = token[12 : 4];
  assign tokenLow = token[3 : 0];
  assign firstToken = (token == 13'h0);
  assign noSzFromMem = (tokenHigh == 9'h0);
  assign mallocPerHead = 22'h2a6000;
  assign headCntAbout2Ovf = (headCnt == 4'b1010);
  always @(*) begin
    headBaseNext = headBase;
    if(enIncHead) begin
      headBaseNext = (headBase + t_headBaseNext);
      if(headCntOvf) begin
        headBaseNext = 32'h00002000;
      end
    end
  end

  assign mallocPerLayer = (status_enPredictor ? 26'h388a400 : 26'h3560000);
  assign layerCntAbout2Ovf = (layerCnt == 5'h1a);
  always @(*) begin
    layerBaseNext = layerBase;
    if(enIncLayer) begin
      layerBaseNext = (layerBase + t_layerBaseNext);
      if(layerCntOvf) begin
        layerBaseNext = 32'h177f6000;
      end
    end
  end

  assign attnHeadBaseNext = (layerBaseNext + headBaseNext);
  assign tokenIn_valid = io_tokenIndex_valid;
  assign io_tokenIndex_ready = tokenIn_ready;
  assign tokenIn_payload_last = 1'b1;
  assign tokenIn_payload_fragment = {{{{{{{4'b0000,4'b0000},t_tokenIn_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_tokenIn_payload_fragment_3};
  assign tokenIn_fire = (tokenIn_valid && tokenIn_ready);
  assign tokenTag_valid = tokenIn_fire;
  assign tokenTag_payload = io_tokenIndex_tuser;
  assign attnLn_valid = 1'b1;
  assign attnLn_payload_last = 1'b1;
  assign attnLn_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnLn_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnLn_payload_fragment_1};
  assign attnLn_fire = (attnLn_valid && attnLn_ready);
  assign attnLnTag_valid = attnLn_fire;
  assign attnLnTag_payload = 6'h03;
  assign indexCmdGen_denseBaseAddrOs_0 = 26'h2860000;
  assign indexCmdGen_denseBaseAddrOs_1 = 26'h2ee0000;
  assign indexCmdGen_denseLen_0 = 10'h340;
  assign indexCmdGen_denseLen_1 = 10'h340;
  assign indexCmdGen_denseTag_0 = 4'b0100;
  assign indexCmdGen_denseTag_1 = 4'b0101;
  assign indexCmdGen_selDenseBaseAddr = t_indexCmdGen_selDenseBaseAddr;
  assign indexCmdGen_selDenseLen = t_indexCmdGen_selDenseLen;
  assign indexCmdGen_selDenseTag = t_indexCmdGen_selDenseTag;
  assign indexCmdGen_indexFlow_valid = local_index_valid_regNext;
  assign indexCmdGen_indexFlow_payload_last = local_index_payload_last_regNext;
  assign indexCmdGen_indexFlow_payload_fragment = t_indexCmdGen_indexFlow_payload_fragment;
  assign t_indexCmdGen_denseU_payload_last_3 = (t_indexCmdGen_denseU_payload_last_1 == 10'h33f);
  always @(*) begin
    t_indexCmdGen_denseU_payload_last_1 = t_indexCmdGen_denseU_payload_last;
    if(indexCmdGen_denseU_fire) begin
      t_indexCmdGen_denseU_payload_last_1 = (t_indexCmdGen_denseU_payload_last + 10'h001);
      if(t_indexCmdGen_denseU_payload_last_2) begin
        t_indexCmdGen_denseU_payload_last_1 = 10'h0;
      end
    end
  end

  always @(*) begin
    t_indexCmdGen_denseU_payload_fragment_1 = t_indexCmdGen_denseU_payload_fragment;
    if(indexCmdGen_denseU_fire) begin
      t_indexCmdGen_denseU_payload_fragment_1 = (t_indexCmdGen_denseU_payload_fragment + 32'h00002000);
      if(t_indexCmdGen_denseU_payload_last_2) begin
        t_indexCmdGen_denseU_payload_fragment_1 = 32'h02860000;
      end
    end
  end

  assign indexCmdGen_denseU_valid = 1'b1;
  assign indexCmdGen_denseU_payload_fragment = {{{{{{{4'b0000,4'b0000},t_indexCmdGen_denseU_payload_fragment_3},1'b0},t_indexCmdGen_denseU_payload_last_2},6'h0},1'b1},t_indexCmdGen_denseU_payload_fragment_2};
  assign indexCmdGen_denseU_payload_last = t_indexCmdGen_denseU_payload_last_2;
  assign indexCmdGen_denseU_fire = (indexCmdGen_denseU_valid && indexCmdGen_denseU_ready);
  assign t_indexCmdGen_denseD_payload_last_3 = (t_indexCmdGen_denseD_payload_last_1 == 10'h33f);
  always @(*) begin
    t_indexCmdGen_denseD_payload_last_1 = t_indexCmdGen_denseD_payload_last;
    if(indexCmdGen_denseD_fire) begin
      t_indexCmdGen_denseD_payload_last_1 = (t_indexCmdGen_denseD_payload_last + 10'h001);
      if(t_indexCmdGen_denseD_payload_last_2) begin
        t_indexCmdGen_denseD_payload_last_1 = 10'h0;
      end
    end
  end

  always @(*) begin
    t_indexCmdGen_denseD_payload_fragment_1 = t_indexCmdGen_denseD_payload_fragment;
    if(indexCmdGen_denseD_fire) begin
      t_indexCmdGen_denseD_payload_fragment_1 = (t_indexCmdGen_denseD_payload_fragment + 32'h00002000);
      if(t_indexCmdGen_denseD_payload_last_2) begin
        t_indexCmdGen_denseD_payload_fragment_1 = 32'h02ee0000;
      end
    end
  end

  assign indexCmdGen_denseD_valid = 1'b1;
  assign indexCmdGen_denseD_payload_fragment = {{{{{{{4'b0000,4'b0000},t_indexCmdGen_denseD_payload_fragment_3},1'b0},t_indexCmdGen_denseD_payload_last_2},6'h0},1'b1},t_indexCmdGen_denseD_payload_fragment_2};
  assign indexCmdGen_denseD_payload_last = t_indexCmdGen_denseD_payload_last_2;
  assign indexCmdGen_denseD_fire = (indexCmdGen_denseD_valid && indexCmdGen_denseD_ready);
  assign indexCmdGen_denseU_ready = indexCmdGen_indexMux_io_inputs_0_ready;
  assign indexCmdGen_denseD_ready = indexCmdGen_indexMux_io_inputs_1_ready;
  assign indexCmdGen_indexMux_io_output_ready = (1'b1 && indexCmdGen_enDenseUD);
  assign indexCmdGen_indexCmd_valid = (indexCmdGen_indexMux_io_output_valid && indexCmdGen_enDenseUD);
  assign indexCmdGen_indexCmd_payload_last = indexCmdGen_indexMux_io_output_payload_last;
  assign indexCmdGen_indexCmd_payload_fragment = indexCmdGen_indexMux_io_output_payload_fragment;
  assign cmdGen_indexCmdGen_indexCmdFifo_io_push_fire = (indexCmdGen_indexCmd_valid && indexCmdGen_indexCmdFifo_io_push_ready);
  assign cmdGen_indexCmdGen_indexCmdFifo_io_pop_fire = (indexCmdGen_indexCmdFifo_io_pop_valid && indexCmdGen_indexCmdOut_ready);
  assign indexCmdGen_indexCmdOut_valid = indexCmdGen_indexCmdFifo_io_pop_valid;
  assign indexCmdGen_indexCmdOut_payload_fragment = indexCmdGen_indexCmdFifo_io_pop_payload;
  assign indexCmdGen_indexCmdOut_payload_last = indexCmdGen_indexLastFifo_io_pop_payload;
  assign indexCmdGen_indexCmdOut_ready = indexCmdGen_deMux_io_input_ready;
  assign indexCmdGen_deMux_io_select = status_enPredictor;
  assign t_attnKV_attnKCmdVec_payload_last_3 = (t_attnKV_attnKCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnKV_attnKCmdVec_payload_last_1 = t_attnKV_attnKCmdVec_payload_last;
    if(attnKV_attnKCmdVec_fire) begin
      t_attnKV_attnKCmdVec_payload_last_1 = (t_attnKV_attnKCmdVec_payload_last + 5'h01);
      if(t_attnKV_attnKCmdVec_payload_last_2) begin
        t_attnKV_attnKCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnKV_attnKCmdVec_payload_fragment_1 = t_attnKV_attnKCmdVec_payload_fragment;
    if(attnKV_attnKCmdVec_fire) begin
      t_attnKV_attnKCmdVec_payload_fragment_1 = (t_attnKV_attnKCmdVec_payload_fragment + 32'h00002000);
      if(t_attnKV_attnKCmdVec_payload_last_2) begin
        t_attnKV_attnKCmdVec_payload_fragment_1 = 32'h00032000;
      end
    end
  end

  assign attnKV_attnKCmdVec_valid = 1'b1;
  assign attnKV_attnKCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnKV_attnKCmdVec_payload_fragment_3},1'b0},t_attnKV_attnKCmdVec_payload_last_2},6'h0},1'b1},t_attnKV_attnKCmdVec_payload_fragment_2};
  assign attnKV_attnKCmdVec_payload_last = t_attnKV_attnKCmdVec_payload_last_2;
  assign attnKV_attnKCmdVec_fire = (attnKV_attnKCmdVec_valid && attnKV_attnKCmdVec_ready);
  assign t_attnKV_attnVCmdVec_payload_last_3 = (t_attnKV_attnVCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnKV_attnVCmdVec_payload_last_1 = t_attnKV_attnVCmdVec_payload_last;
    if(attnKV_attnVCmdVec_fire) begin
      t_attnKV_attnVCmdVec_payload_last_1 = (t_attnKV_attnVCmdVec_payload_last + 5'h01);
      if(t_attnKV_attnVCmdVec_payload_last_2) begin
        t_attnKV_attnVCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnKV_attnVCmdVec_payload_fragment_1 = t_attnKV_attnVCmdVec_payload_fragment;
    if(attnKV_attnVCmdVec_fire) begin
      t_attnKV_attnVCmdVec_payload_fragment_1 = (t_attnKV_attnVCmdVec_payload_fragment + 32'h00002000);
      if(t_attnKV_attnVCmdVec_payload_last_2) begin
        t_attnKV_attnVCmdVec_payload_fragment_1 = 32'h00064000;
      end
    end
  end

  assign attnKV_attnVCmdVec_valid = 1'b1;
  assign attnKV_attnVCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnKV_attnVCmdVec_payload_fragment_3},1'b0},t_attnKV_attnVCmdVec_payload_last_2},6'h0},1'b1},t_attnKV_attnVCmdVec_payload_fragment_2};
  assign attnKV_attnVCmdVec_payload_last = t_attnKV_attnVCmdVec_payload_last_2;
  assign attnKV_attnVCmdVec_fire = (attnKV_attnVCmdVec_valid && attnKV_attnVCmdVec_ready);
  assign attnKV_attnKCmdVec_ready = attnKV_mux_io_inputs_0_ready;
  assign attnKV_attnVCmdVec_ready = attnKV_mux_io_inputs_1_ready;
  assign attnKV_muxOutFire = (attnKV_mux_io_output_valid && attnKV_cmd_ready);
  assign attnKV_muxOutIsFirst = (attnKV_mux_io_output_valid && cmdGen_attnKV_mux_io_output_payload_first);
  assign attnKV_selOvf = (attnKV_sel == 1'b1);
  assign attnKV_tagVec_0 = 6'h05;
  assign attnKV_tagVec_1 = 6'h07;
  assign attnKV_tagFire = (attnKV_muxOutFire && attnKV_muxOutIsFirst);
  assign attnKV_tag_valid = attnKV_tagFire;
  assign attnKV_tag_payload = t_attnKV_tag_payload;
  assign attnKV_cmd_valid = attnKV_mux_io_output_valid;
  assign attnKV_cmd_payload_fragment = attnKV_mux_io_output_payload_fragment;
  assign attnKV_cmd_payload_last = (attnKV_mux_io_output_payload_last && attnKV_selOvf);
  assign t_attnQKVNoSz_attnQCmdVec_payload_last_3 = (t_attnQKVNoSz_attnQCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVNoSz_attnQCmdVec_payload_last_1 = t_attnQKVNoSz_attnQCmdVec_payload_last;
    if(attnQKVNoSz_attnQCmdVec_fire) begin
      t_attnQKVNoSz_attnQCmdVec_payload_last_1 = (t_attnQKVNoSz_attnQCmdVec_payload_last + 5'h01);
      if(t_attnQKVNoSz_attnQCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnQCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVNoSz_attnQCmdVec_payload_fragment_1 = t_attnQKVNoSz_attnQCmdVec_payload_fragment;
    if(attnQKVNoSz_attnQCmdVec_fire) begin
      t_attnQKVNoSz_attnQCmdVec_payload_fragment_1 = (t_attnQKVNoSz_attnQCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVNoSz_attnQCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnQCmdVec_payload_fragment_1 = 32'h0;
      end
    end
  end

  assign attnQKVNoSz_attnQCmdVec_valid = 1'b1;
  assign attnQKVNoSz_attnQCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVNoSz_attnQCmdVec_payload_fragment_3},1'b0},t_attnQKVNoSz_attnQCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVNoSz_attnQCmdVec_payload_fragment_2};
  assign attnQKVNoSz_attnQCmdVec_payload_last = t_attnQKVNoSz_attnQCmdVec_payload_last_2;
  assign attnQKVNoSz_attnQCmdVec_fire = (attnQKVNoSz_attnQCmdVec_valid && attnQKVNoSz_attnQCmdVec_ready);
  assign t_attnQKVNoSz_attnKCmdVec_payload_last_3 = (t_attnQKVNoSz_attnKCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVNoSz_attnKCmdVec_payload_last_1 = t_attnQKVNoSz_attnKCmdVec_payload_last;
    if(attnQKVNoSz_attnKCmdVec_fire) begin
      t_attnQKVNoSz_attnKCmdVec_payload_last_1 = (t_attnQKVNoSz_attnKCmdVec_payload_last + 5'h01);
      if(t_attnQKVNoSz_attnKCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnKCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVNoSz_attnKCmdVec_payload_fragment_1 = t_attnQKVNoSz_attnKCmdVec_payload_fragment;
    if(attnQKVNoSz_attnKCmdVec_fire) begin
      t_attnQKVNoSz_attnKCmdVec_payload_fragment_1 = (t_attnQKVNoSz_attnKCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVNoSz_attnKCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnKCmdVec_payload_fragment_1 = 32'h00032000;
      end
    end
  end

  assign attnQKVNoSz_attnKCmdVec_valid = 1'b1;
  assign attnQKVNoSz_attnKCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVNoSz_attnKCmdVec_payload_fragment_3},1'b0},t_attnQKVNoSz_attnKCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVNoSz_attnKCmdVec_payload_fragment_2};
  assign attnQKVNoSz_attnKCmdVec_payload_last = t_attnQKVNoSz_attnKCmdVec_payload_last_2;
  assign attnQKVNoSz_attnKCmdVec_fire = (attnQKVNoSz_attnKCmdVec_valid && attnQKVNoSz_attnKCmdVec_ready);
  assign t_attnQKVNoSz_attnVCmdVec_payload_last_3 = (t_attnQKVNoSz_attnVCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVNoSz_attnVCmdVec_payload_last_1 = t_attnQKVNoSz_attnVCmdVec_payload_last;
    if(attnQKVNoSz_attnVCmdVec_fire) begin
      t_attnQKVNoSz_attnVCmdVec_payload_last_1 = (t_attnQKVNoSz_attnVCmdVec_payload_last + 5'h01);
      if(t_attnQKVNoSz_attnVCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnVCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVNoSz_attnVCmdVec_payload_fragment_1 = t_attnQKVNoSz_attnVCmdVec_payload_fragment;
    if(attnQKVNoSz_attnVCmdVec_fire) begin
      t_attnQKVNoSz_attnVCmdVec_payload_fragment_1 = (t_attnQKVNoSz_attnVCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVNoSz_attnVCmdVec_payload_last_2) begin
        t_attnQKVNoSz_attnVCmdVec_payload_fragment_1 = 32'h00064000;
      end
    end
  end

  assign attnQKVNoSz_attnVCmdVec_valid = 1'b1;
  assign attnQKVNoSz_attnVCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVNoSz_attnVCmdVec_payload_fragment_3},1'b0},t_attnQKVNoSz_attnVCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVNoSz_attnVCmdVec_payload_fragment_2};
  assign attnQKVNoSz_attnVCmdVec_payload_last = t_attnQKVNoSz_attnVCmdVec_payload_last_2;
  assign attnQKVNoSz_attnVCmdVec_fire = (attnQKVNoSz_attnVCmdVec_valid && attnQKVNoSz_attnVCmdVec_ready);
  assign attnQKVNoSz_attnKCacheCmd_valid = 1'b1;
  assign attnQKVNoSz_attnKCacheCmd_payload_last = 1'b1;
  assign attnQKVNoSz_attnKCacheCmd_payload_fragment = {{{{{{{4'b0000,4'b0001},t_attnQKVNoSz_attnKCacheCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVNoSz_attnKCacheCmd_payload_fragment_1};
  assign attnQKVNoSz_attnVCacheCmd_valid = 1'b1;
  assign attnQKVNoSz_attnVCacheCmd_payload_last = 1'b1;
  assign attnQKVNoSz_attnVCacheCmd_payload_fragment = {{{{{{{4'b0000,4'b0001},t_attnQKVNoSz_attnVCacheCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVNoSz_attnVCacheCmd_payload_fragment_1};
  assign attnQKVNoSz_attnQCmdVec_ready = attnQKVNoSz_mux_io_inputs_0_ready;
  assign attnQKVNoSz_attnKCmdVec_ready = attnQKVNoSz_mux_io_inputs_1_ready;
  assign attnQKVNoSz_attnKCacheCmd_ready = attnQKVNoSz_mux_io_inputs_2_ready;
  assign attnQKVNoSz_attnVCmdVec_ready = attnQKVNoSz_mux_io_inputs_3_ready;
  assign attnQKVNoSz_attnVCacheCmd_ready = attnQKVNoSz_mux_io_inputs_4_ready;
  assign attnQKVNoSz_muxOutFire = (attnQKVNoSz_mux_io_output_valid && attnQKVNoSz_cmd_ready);
  assign attnQKVNoSz_muxOutIsFirst = (attnQKVNoSz_mux_io_output_valid && cmdGen_attnQKVNoSz_mux_io_output_payload_first);
  assign attnQKVNoSz_selOvf = (attnQKVNoSz_sel == 3'b100);
  assign attnQKVNoSz_tagVec_0 = 6'h04;
  assign attnQKVNoSz_tagVec_1 = 6'h05;
  assign attnQKVNoSz_tagVec_2 = 6'h06;
  assign attnQKVNoSz_tagVec_3 = 6'h07;
  assign attnQKVNoSz_tagVec_4 = 6'h08;
  assign attnQKVNoSz_tagFire = (attnQKVNoSz_muxOutFire && attnQKVNoSz_muxOutIsFirst);
  assign attnQKVNoSz_tag_valid = attnQKVNoSz_tagFire;
  assign attnQKVNoSz_tag_payload = t_attnQKVNoSz_tag_payload;
  assign attnQKVNoSz_cmd_valid = attnQKVNoSz_mux_io_output_valid;
  assign attnQKVNoSz_cmd_payload_fragment = attnQKVNoSz_mux_io_output_payload_fragment;
  assign attnQKVNoSz_cmd_payload_last = (attnQKVNoSz_mux_io_output_payload_last && attnQKVNoSz_selOvf);
  assign t_attnQKVWithSz_attnQCmdVec_payload_last_3 = (t_attnQKVWithSz_attnQCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVWithSz_attnQCmdVec_payload_last_1 = t_attnQKVWithSz_attnQCmdVec_payload_last;
    if(attnQKVWithSz_attnQCmdVec_fire) begin
      t_attnQKVWithSz_attnQCmdVec_payload_last_1 = (t_attnQKVWithSz_attnQCmdVec_payload_last + 5'h01);
      if(t_attnQKVWithSz_attnQCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnQCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVWithSz_attnQCmdVec_payload_fragment_1 = t_attnQKVWithSz_attnQCmdVec_payload_fragment;
    if(attnQKVWithSz_attnQCmdVec_fire) begin
      t_attnQKVWithSz_attnQCmdVec_payload_fragment_1 = (t_attnQKVWithSz_attnQCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVWithSz_attnQCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnQCmdVec_payload_fragment_1 = 32'h0;
      end
    end
  end

  assign attnQKVWithSz_attnQCmdVec_valid = 1'b1;
  assign attnQKVWithSz_attnQCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVWithSz_attnQCmdVec_payload_fragment_3},1'b0},t_attnQKVWithSz_attnQCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVWithSz_attnQCmdVec_payload_fragment_2};
  assign attnQKVWithSz_attnQCmdVec_payload_last = t_attnQKVWithSz_attnQCmdVec_payload_last_2;
  assign attnQKVWithSz_attnQCmdVec_fire = (attnQKVWithSz_attnQCmdVec_valid && attnQKVWithSz_attnQCmdVec_ready);
  assign t_attnQKVWithSz_attnKCmdVec_payload_last_3 = (t_attnQKVWithSz_attnKCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVWithSz_attnKCmdVec_payload_last_1 = t_attnQKVWithSz_attnKCmdVec_payload_last;
    if(attnQKVWithSz_attnKCmdVec_fire) begin
      t_attnQKVWithSz_attnKCmdVec_payload_last_1 = (t_attnQKVWithSz_attnKCmdVec_payload_last + 5'h01);
      if(t_attnQKVWithSz_attnKCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnKCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVWithSz_attnKCmdVec_payload_fragment_1 = t_attnQKVWithSz_attnKCmdVec_payload_fragment;
    if(attnQKVWithSz_attnKCmdVec_fire) begin
      t_attnQKVWithSz_attnKCmdVec_payload_fragment_1 = (t_attnQKVWithSz_attnKCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVWithSz_attnKCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnKCmdVec_payload_fragment_1 = 32'h00032000;
      end
    end
  end

  assign attnQKVWithSz_attnKCmdVec_valid = 1'b1;
  assign attnQKVWithSz_attnKCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVWithSz_attnKCmdVec_payload_fragment_3},1'b0},t_attnQKVWithSz_attnKCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVWithSz_attnKCmdVec_payload_fragment_2};
  assign attnQKVWithSz_attnKCmdVec_payload_last = t_attnQKVWithSz_attnKCmdVec_payload_last_2;
  assign attnQKVWithSz_attnKCmdVec_fire = (attnQKVWithSz_attnKCmdVec_valid && attnQKVWithSz_attnKCmdVec_ready);
  assign t_attnQKVWithSz_attnVCmdVec_payload_last_3 = (t_attnQKVWithSz_attnVCmdVec_payload_last_1 == 5'h18);
  always @(*) begin
    t_attnQKVWithSz_attnVCmdVec_payload_last_1 = t_attnQKVWithSz_attnVCmdVec_payload_last;
    if(attnQKVWithSz_attnVCmdVec_fire) begin
      t_attnQKVWithSz_attnVCmdVec_payload_last_1 = (t_attnQKVWithSz_attnVCmdVec_payload_last + 5'h01);
      if(t_attnQKVWithSz_attnVCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnVCmdVec_payload_last_1 = 5'h0;
      end
    end
  end

  always @(*) begin
    t_attnQKVWithSz_attnVCmdVec_payload_fragment_1 = t_attnQKVWithSz_attnVCmdVec_payload_fragment;
    if(attnQKVWithSz_attnVCmdVec_fire) begin
      t_attnQKVWithSz_attnVCmdVec_payload_fragment_1 = (t_attnQKVWithSz_attnVCmdVec_payload_fragment + 32'h00002000);
      if(t_attnQKVWithSz_attnVCmdVec_payload_last_2) begin
        t_attnQKVWithSz_attnVCmdVec_payload_fragment_1 = 32'h00064000;
      end
    end
  end

  assign attnQKVWithSz_attnVCmdVec_valid = 1'b1;
  assign attnQKVWithSz_attnVCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_attnQKVWithSz_attnVCmdVec_payload_fragment_3},1'b0},t_attnQKVWithSz_attnVCmdVec_payload_last_2},6'h0},1'b1},t_attnQKVWithSz_attnVCmdVec_payload_fragment_2};
  assign attnQKVWithSz_attnVCmdVec_payload_last = t_attnQKVWithSz_attnVCmdVec_payload_last_2;
  assign attnQKVWithSz_attnVCmdVec_fire = (attnQKVWithSz_attnVCmdVec_valid && attnQKVWithSz_attnVCmdVec_ready);
  assign attnQKVWithSz_attnKszCmd_valid = 1'b1;
  assign attnQKVWithSz_attnKszCmd_payload_last = 1'b1;
  assign attnQKVWithSz_attnKszCmd_payload_fragment = {{{{{{{4'b0000,4'b0010},t_attnQKVWithSz_attnKszCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVWithSz_attnKszCmd_payload_fragment_1};
  assign attnQKVWithSz_attnVszCmd_valid = 1'b1;
  assign attnQKVWithSz_attnVszCmd_payload_last = 1'b1;
  assign attnQKVWithSz_attnVszCmd_payload_fragment = {{{{{{{4'b0000,4'b0010},t_attnQKVWithSz_attnVszCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVWithSz_attnVszCmd_payload_fragment_1};
  assign attnQKVWithSz_attnKCacheCmd_valid = 1'b1;
  assign attnQKVWithSz_attnKCacheCmd_payload_last = 1'b1;
  assign attnQKVWithSz_attnKCacheCmd_payload_fragment = {{{{{{{4'b0000,4'b0001},t_attnQKVWithSz_attnKCacheCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVWithSz_attnKCacheCmd_payload_fragment_1};
  assign attnQKVWithSz_attnVCacheCmd_valid = 1'b1;
  assign attnQKVWithSz_attnVCacheCmd_payload_last = 1'b1;
  assign attnQKVWithSz_attnVCacheCmd_payload_fragment = {{{{{{{4'b0000,4'b0001},t_attnQKVWithSz_attnVCacheCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_attnQKVWithSz_attnVCacheCmd_payload_fragment_1};
  assign attnQKVWithSz_attnQCmdVec_ready = attnQKVWithSz_mux_io_inputs_0_ready;
  assign attnQKVWithSz_attnKCmdVec_ready = attnQKVWithSz_mux_io_inputs_1_ready;
  assign attnQKVWithSz_attnKszCmd_ready = attnQKVWithSz_mux_io_inputs_2_ready;
  assign attnQKVWithSz_attnKCacheCmd_ready = attnQKVWithSz_mux_io_inputs_3_ready;
  assign attnQKVWithSz_attnVCmdVec_ready = attnQKVWithSz_mux_io_inputs_4_ready;
  assign attnQKVWithSz_attnVszCmd_ready = attnQKVWithSz_mux_io_inputs_5_ready;
  assign attnQKVWithSz_attnVCacheCmd_ready = attnQKVWithSz_mux_io_inputs_6_ready;
  assign attnQKVWithSz_muxOutFire = (attnQKVWithSz_mux_io_output_valid && attnQKVWithSz_cmd_ready);
  assign attnQKVWithSz_muxOutIsFirst = (attnQKVWithSz_mux_io_output_valid && cmdGen_attnQKVWithSz_mux_io_output_payload_first);
  assign attnQKVWithSz_selOvf = (attnQKVWithSz_sel == 3'b110);
  assign attnQKVWithSz_tagVec_0 = 6'h04;
  assign attnQKVWithSz_tagVec_1 = 6'h05;
  assign attnQKVWithSz_tagVec_2 = 6'h06;
  assign attnQKVWithSz_tagVec_3 = 6'h06;
  assign attnQKVWithSz_tagVec_4 = 6'h07;
  assign attnQKVWithSz_tagVec_5 = 6'h08;
  assign attnQKVWithSz_tagVec_6 = 6'h08;
  assign attnQKVWithSz_tagFire = (attnQKVWithSz_muxOutFire && attnQKVWithSz_muxOutIsFirst);
  assign attnQKVWithSz_tag_valid = attnQKVWithSz_tagFire;
  assign attnQKVWithSz_tag_payload = t_attnQKVWithSz_tag_payload;
  assign attnQKVWithSz_cmd_valid = attnQKVWithSz_mux_io_output_valid;
  assign attnQKVWithSz_cmd_payload_fragment = attnQKVWithSz_mux_io_output_payload_fragment;
  assign attnQKVWithSz_cmd_payload_last = (attnQKVWithSz_mux_io_output_payload_last && attnQKVWithSz_selOvf);
  assign mlpWithPredict_cmd_valid = 1'b0;
  assign t_mlpWithPredict_cmd_payload_last = 73'h0;
  assign mlpWithPredict_cmd_payload_last = t_mlpWithPredict_cmd_payload_last[0];
  assign mlpWithPredict_cmd_payload_fragment = t_mlpWithPredict_cmd_payload_last[72 : 1];
  assign mlpWithPredict_tag_valid = 1'b0;
  assign mlpWithPredict_tag_payload = 6'h0;
  assign mlpDense_mlpLnCmd_valid = 1'b1;
  assign mlpDense_mlpLnCmd_payload_last = 1'b1;
  assign mlpDense_mlpLnCmd_payload_fragment = {{{{{{{4'b0000,4'b0000},t_mlpDense_mlpLnCmd_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_mlpDense_mlpLnCmd_payload_fragment_1};
  assign t_mlpDense_attnOCmdVec_payload_last_3 = (t_mlpDense_attnOCmdVec_payload_last_1 == 9'h12b);
  always @(*) begin
    t_mlpDense_attnOCmdVec_payload_last_1 = t_mlpDense_attnOCmdVec_payload_last;
    if(mlpDense_attnOCmdVec_fire) begin
      t_mlpDense_attnOCmdVec_payload_last_1 = (t_mlpDense_attnOCmdVec_payload_last + 9'h001);
      if(t_mlpDense_attnOCmdVec_payload_last_2) begin
        t_mlpDense_attnOCmdVec_payload_last_1 = 9'h0;
      end
    end
  end

  always @(*) begin
    t_mlpDense_attnOCmdVec_payload_fragment_1 = t_mlpDense_attnOCmdVec_payload_fragment;
    if(mlpDense_attnOCmdVec_fire) begin
      t_mlpDense_attnOCmdVec_payload_fragment_1 = (t_mlpDense_attnOCmdVec_payload_fragment + 32'h00002000);
      if(t_mlpDense_attnOCmdVec_payload_last_2) begin
        t_mlpDense_attnOCmdVec_payload_fragment_1 = 32'h01fca000;
      end
    end
  end

  assign mlpDense_attnOCmdVec_valid = 1'b1;
  assign mlpDense_attnOCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_mlpDense_attnOCmdVec_payload_fragment_3},1'b0},t_mlpDense_attnOCmdVec_payload_last_2},6'h0},1'b1},t_mlpDense_attnOCmdVec_payload_fragment_2};
  assign mlpDense_attnOCmdVec_payload_last = t_mlpDense_attnOCmdVec_payload_last_2;
  assign mlpDense_attnOCmdVec_fire = (mlpDense_attnOCmdVec_valid && mlpDense_attnOCmdVec_ready);
  assign t_mlpDense_mlpDenseGCmdVec_payload_last_3 = (t_mlpDense_mlpDenseGCmdVec_payload_last_1 == 10'h31d);
  always @(*) begin
    t_mlpDense_mlpDenseGCmdVec_payload_last_1 = t_mlpDense_mlpDenseGCmdVec_payload_last;
    if(mlpDense_mlpDenseGCmdVec_fire) begin
      t_mlpDense_mlpDenseGCmdVec_payload_last_1 = (t_mlpDense_mlpDenseGCmdVec_payload_last + 10'h001);
      if(t_mlpDense_mlpDenseGCmdVec_payload_last_2) begin
        t_mlpDense_mlpDenseGCmdVec_payload_last_1 = 10'h0;
      end
    end
  end

  always @(*) begin
    t_mlpDense_mlpDenseGCmdVec_payload_fragment_1 = t_mlpDense_mlpDenseGCmdVec_payload_fragment;
    if(mlpDense_mlpDenseGCmdVec_fire) begin
      t_mlpDense_mlpDenseGCmdVec_payload_fragment_1 = (t_mlpDense_mlpDenseGCmdVec_payload_fragment + 32'h00002000);
      if(t_mlpDense_mlpDenseGCmdVec_payload_last_2) begin
        t_mlpDense_mlpDenseGCmdVec_payload_fragment_1 = 32'h02224000;
      end
    end
  end

  assign mlpDense_mlpDenseGCmdVec_valid = 1'b1;
  assign mlpDense_mlpDenseGCmdVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_mlpDense_mlpDenseGCmdVec_payload_fragment_3},1'b0},t_mlpDense_mlpDenseGCmdVec_payload_last_2},6'h0},1'b1},t_mlpDense_mlpDenseGCmdVec_payload_fragment_2};
  assign mlpDense_mlpDenseGCmdVec_payload_last = t_mlpDense_mlpDenseGCmdVec_payload_last_2;
  assign mlpDense_mlpDenseGCmdVec_fire = (mlpDense_mlpDenseGCmdVec_valid && mlpDense_mlpDenseGCmdVec_ready);
  assign mlpDense_attnOCmdVec_ready = mlpDense_mux_io_inputs_0_ready;
  assign mlpDense_mlpLnCmd_ready = mlpDense_mux_io_inputs_1_ready;
  assign mlpDense_mlpDenseGCmdVec_ready = mlpDense_mux_io_inputs_2_ready;
  assign mlpDense_muxOutFire = (mlpDense_mux_io_output_valid && mlpDense_cmd_ready);
  assign mlpDense_muxOutIsFirst = (mlpDense_mux_io_output_valid && cmdGen_mlpDense_mux_io_output_payload_first);
  assign mlpDense_selOvf = (mlpDense_sel == 3'b100);
  assign mlpDense_tagVec_0 = 6'h0b;
  assign mlpDense_tagVec_1 = 6'h0c;
  assign mlpDense_tagVec_2 = 6'h0f;
  assign mlpDense_tagVec_3 = 6'h10;
  assign mlpDense_tagVec_4 = 6'h11;
  assign mlpDense_tagFire = (mlpDense_muxOutFire && mlpDense_muxOutIsFirst);
  assign mlpDense_tag_valid = mlpDense_tagFire;
  assign mlpDense_tag_payload = t_mlpDense_tag_payload;
  assign mlpDense_cmd_valid = mlpDense_mux_io_output_valid;
  assign mlpDense_cmd_payload_fragment = mlpDense_mux_io_output_payload_fragment;
  assign mlpDense_cmd_payload_last = (mlpDense_mux_io_output_payload_last && mlpDense_selOvf);
  assign logits_lgDenseScale_valid = 1'b1;
  assign logits_lgDenseScale_payload_last = 1'b1;
  assign logits_lgDenseScale_payload_fragment = {{{{{{{4'b0000,4'b0000},t_logits_lgDenseScale_payload_fragment},1'b0},1'b1},6'h0},1'b1},t_logits_lgDenseScale_payload_fragment_2};
  assign t_logits_lgDenseHeadVec_payload_last_3 = (t_logits_lgDenseHeadVec_payload_last_1 == 14'h30cd);
  always @(*) begin
    t_logits_lgDenseHeadVec_payload_last_1 = t_logits_lgDenseHeadVec_payload_last;
    if(logits_lgDenseHeadVec_fire) begin
      t_logits_lgDenseHeadVec_payload_last_1 = (t_logits_lgDenseHeadVec_payload_last + 14'h0001);
      if(t_logits_lgDenseHeadVec_payload_last_2) begin
        t_logits_lgDenseHeadVec_payload_last_1 = 14'h0;
      end
    end
  end

  always @(*) begin
    t_logits_lgDenseHeadVec_payload_fragment_1 = t_logits_lgDenseHeadVec_payload_fragment;
    if(logits_lgDenseHeadVec_fire) begin
      t_logits_lgDenseHeadVec_payload_fragment_1 = (t_logits_lgDenseHeadVec_payload_fragment + 32'h00002000);
      if(t_logits_lgDenseHeadVec_payload_last_2) begin
        t_logits_lgDenseHeadVec_payload_fragment_1 = 32'h74e42000;
      end
    end
  end

  assign logits_lgDenseHeadVec_valid = 1'b1;
  assign logits_lgDenseHeadVec_payload_fragment = {{{{{{{4'b0000,4'b0000},t_logits_lgDenseHeadVec_payload_fragment_3},1'b0},t_logits_lgDenseHeadVec_payload_last_2},6'h0},1'b1},t_logits_lgDenseHeadVec_payload_fragment_2};
  assign logits_lgDenseHeadVec_payload_last = t_logits_lgDenseHeadVec_payload_last_2;
  assign logits_lgDenseHeadVec_fire = (logits_lgDenseHeadVec_valid && logits_lgDenseHeadVec_ready);
  assign logits_lgDenseScale_ready = logits_mux_io_inputs_0_ready;
  assign logits_lgDenseHeadVec_ready = logits_mux_io_inputs_1_ready;
  assign t_io_inputs_2_payload_last = 73'h0;
  assign logits_mux_io_inputs_2_payload_last = t_io_inputs_2_payload_last[0];
  assign logits_mux_io_inputs_2_payload_fragment = t_io_inputs_2_payload_last[72 : 1];
  assign t_io_inputs_3_payload_last = 73'h0;
  assign logits_mux_io_inputs_3_payload_last = t_io_inputs_3_payload_last[0];
  assign logits_mux_io_inputs_3_payload_fragment = t_io_inputs_3_payload_last[72 : 1];
  assign logits_muxOutFire = (logits_mux_io_output_valid && logits_cmd_ready);
  assign logits_muxOutIsFirst = (logits_mux_io_output_valid && cmdGen_logits_mux_io_output_payload_first);
  assign logits_selOvf = (logits_sel == 1'b1);
  assign logits_mux_io_select = {status_enPredictor,logits_sel};
  assign logits_tagVec_0 = 6'h12;
  assign logits_tagVec_1 = 6'h13;
  assign logits_tagFire = (logits_muxOutFire && logits_muxOutIsFirst);
  assign logits_tag_valid = logits_tagFire;
  assign logits_tag_payload = t_logits_tag_payload;
  assign logits_cmd_valid = logits_mux_io_output_valid;
  assign logits_cmd_payload_fragment = logits_mux_io_output_payload_fragment;
  assign logits_cmd_payload_last = (logits_mux_io_output_payload_last && logits_selOvf);
  assign attnKV_cmd_fire = (attnKV_cmd_valid && attnKV_cmd_ready);
  assign kvDone = (attnKV_cmd_fire && attnKV_cmd_payload_last);
  assign attnQKVNoSz_cmd_fire = (attnQKVNoSz_cmd_valid && attnQKVNoSz_cmd_ready);
  assign qkvNoSzDone = (attnQKVNoSz_cmd_fire && attnQKVNoSz_cmd_payload_last);
  assign attnQKVWithSz_cmd_fire = (attnQKVWithSz_cmd_valid && attnQKVWithSz_cmd_ready);
  assign qkvDone = (attnQKVWithSz_cmd_fire && attnQKVWithSz_cmd_payload_last);
  assign mlpWithPredict_cmd_fire = (mlpWithPredict_cmd_valid && mlpWithPredict_cmd_ready);
  assign sparseMlpDone = (mlpWithPredict_cmd_fire && mlpWithPredict_cmd_payload_last);
  assign mlpDense_cmd_fire = (mlpDense_cmd_valid && mlpDense_cmd_ready);
  assign denseMlpDone = (mlpDense_cmd_fire && mlpDense_cmd_payload_last);
  assign mlpDone = (sparseMlpDone || denseMlpDone);
  assign logits_cmd_fire = (logits_cmd_valid && logits_cmd_ready);
  assign logitsDone = (logits_cmd_fire && logits_cmd_payload_last);
  assign tokenIn_ready = mm2sCmdMux_io_inputs_0_ready;
  assign attnLn_ready = mm2sCmdMux_io_inputs_1_ready;
  assign attnKV_cmd_ready = mm2sCmdMux_io_inputs_2_ready;
  assign attnQKVNoSz_cmd_ready = mm2sCmdMux_io_inputs_3_ready;
  assign attnQKVWithSz_cmd_ready = mm2sCmdMux_io_inputs_4_ready;
  assign mlpWithPredict_cmd_ready = mm2sCmdMux_io_inputs_5_ready;
  assign mlpDense_cmd_ready = mm2sCmdMux_io_inputs_6_ready;
  assign logits_cmd_ready = mm2sCmdMux_io_inputs_7_ready;
  assign tokenTag_ready = busTagMux_io_inputs_0_ready;
  assign attnLnTag_ready = busTagMux_io_inputs_1_ready;
  assign attnKV_tag_ready = busTagMux_io_inputs_2_ready;
  assign attnQKVNoSz_tag_ready = busTagMux_io_inputs_3_ready;
  assign attnQKVWithSz_tag_ready = busTagMux_io_inputs_4_ready;
  assign mlpWithPredict_tag_ready = busTagMux_io_inputs_5_ready;
  assign mlpDense_tag_ready = busTagMux_io_inputs_6_ready;
  assign logits_tag_ready = busTagMux_io_inputs_7_ready;
  assign local_bus_valid = io_mm2s_valid;
  assign io_mm2s_ready = local_bus_ready;
  assign local_bus_payload_data = io_mm2s_payload_data;
  assign local_bus_payload_dest = tagFifo_io_pop_payload[5 : 0];
  assign local_bus_payload_last = io_mm2s_payload_last;
  assign io_mm2s_fire = (io_mm2s_valid && io_mm2s_ready);
  assign tagFifo_io_pop_ready = (io_mm2s_fire && io_mm2s_payload_last);
  assign tokenTag_fire = (tokenTag_valid && tokenTag_ready);
  assign io_s2mm_valid = local_kvBus_valid;
  assign local_kvBus_ready = io_s2mm_ready;
  assign io_s2mm_payload_data = local_kvBus_payload_data;
  assign io_s2mm_payload_last = local_kvBus_payload_last;
  assign io_s2mm_payload_keep = 64'hffffffffffffffff;
  assign mm2sCmd_valid = mm2sCmdMux_io_output_valid;
  assign mm2sCmd_payload = mm2sCmdMux_io_output_payload_fragment;
  assign mm2sCmd_ready = mm2sCmd_rValidN;
  assign mm2sCmd_s2mPipe_valid = (mm2sCmd_valid || (! mm2sCmd_rValidN));
  assign mm2sCmd_s2mPipe_payload = (mm2sCmd_rValidN ? mm2sCmd_payload : mm2sCmd_rData);
  always @(*) begin
    mm2sCmd_s2mPipe_ready = mm2sCmd_s2mPipe_m2sPipe_ready;
    if((! mm2sCmd_s2mPipe_m2sPipe_valid)) begin
      mm2sCmd_s2mPipe_ready = 1'b1;
    end
  end

  assign mm2sCmd_s2mPipe_m2sPipe_valid = mm2sCmd_s2mPipe_rValid;
  assign mm2sCmd_s2mPipe_m2sPipe_payload = mm2sCmd_s2mPipe_rData;
  assign io_mm2sCmd_valid = mm2sCmd_s2mPipe_m2sPipe_valid;
  assign mm2sCmd_s2mPipe_m2sPipe_ready = io_mm2sCmd_ready;
  assign io_mm2sCmd_payload = mm2sCmd_s2mPipe_m2sPipe_payload;
  assign enIncHead = ((kvDone || qkvNoSzDone) || qkvDone);
  always @(*) begin
    enIncLayer = mlpDone;
    if((prefill && layerCntOvf)) begin
      enIncLayer = (kvDone && headCntOvf);
    end
  end

  assign enTokenCnt = (enIncLayer && layerCntOvf);
  always @(*) begin
    selectNext = select_1;
    if(((select_1 == 3'b000) && tokenIn_fire)) begin
      selectNext = 3'b001;
    end
    if(((select_1 == 3'b001) && attnLn_fire)) begin
      if((firstToken || (prefill && layerCntOvf))) begin
        selectNext = 3'b010;
      end else begin
        if(noSzFromMem) begin
          selectNext = 3'b011;
        end else begin
          selectNext = 3'b100;
        end
      end
    end
    if((((select_1 == 3'b010) && kvDone) && headCntOvf)) begin
      if((prefill && layerCntOvf)) begin
        selectNext = 3'b000;
      end else begin
        if(status_enPredictor) begin
          selectNext = 3'b101;
        end else begin
          selectNext = 3'b110;
        end
      end
    end
    if((((select_1 == 3'b011) && qkvNoSzDone) && headCntOvf)) begin
      if(status_enPredictor) begin
        selectNext = 3'b101;
      end else begin
        selectNext = 3'b110;
      end
    end
    if((((select_1 == 3'b100) && qkvDone) && headCntOvf)) begin
      if(status_enPredictor) begin
        selectNext = 3'b101;
      end else begin
        selectNext = 3'b110;
      end
    end
    if(((select_1 == 3'b101) && sparseMlpDone)) begin
      if(layerCntOvf) begin
        selectNext = 3'b111;
      end else begin
        selectNext = 3'b001;
      end
    end
    if(((select_1 == 3'b110) && denseMlpDone)) begin
      if(layerCntOvf) begin
        selectNext = 3'b111;
      end else begin
        selectNext = 3'b001;
      end
    end
    if(((select_1 == 3'b111) && logitsDone)) begin
      selectNext = 3'b000;
    end
  end

  assign io_tokenIndex_fire = (io_tokenIndex_valid && io_tokenIndex_ready);
  always @(*) begin
    s2mm_tokenEnFifo_io_pop_ready = 1'b0;
    if(s2mm_enIncLayer) begin
      if(s2mm_layerCntOvf) begin
        s2mm_tokenEnFifo_io_pop_ready = 1'b1;
      end
    end
  end

  assign s2mm_mallocPerHead = 22'h2a6000;
  assign s2mm_headCntAbout2Ovf = (s2mm_headCnt == 4'b1010);
  always @(*) begin
    s2mm_headBaseNext = s2mm_headBase;
    if(s2mm_enIncHead) begin
      s2mm_headBaseNext = (s2mm_headBase + t_s2mm_headBaseNext);
      if(s2mm_headCntOvf) begin
        s2mm_headBaseNext = 32'h00002000;
      end
    end
  end

  assign s2mm_mallocPerLayer = (status_enPredictor ? 26'h388a400 : 26'h3560000);
  assign s2mm_layerCntAbout2Ovf = (s2mm_layerCnt == 5'h1a);
  always @(*) begin
    s2mm_layerBaseNext = s2mm_layerBase;
    if(s2mm_enIncLayer) begin
      s2mm_layerBaseNext = (s2mm_layerBase + t_s2mm_layerBaseNext);
      if(s2mm_layerCntOvf) begin
        s2mm_layerBaseNext = 32'h177f6000;
      end
    end
  end

  assign s2mm_attnHeadBaseNext = (s2mm_layerBaseNext + s2mm_headBaseNext);
  assign s2mm_s2mmTokenCntLow = s2mm_s2mmTokenCnt[3 : 0];
  assign s2mm_s2mmTokenHigh = s2mm_s2mmTokenCnt[12 : 4];
  assign s2mm_s2mSzToMem = (&s2mm_s2mmTokenCntLow);
  assign s2mm_kCacheCmd = {{{{{{{4'b0000,4'b0001},t_s2mm_kCacheCmd},1'b0},1'b1},6'h0},1'b1},t_s2mm_kCacheCmd_4};
  assign s2mm_vCacheCmd = {{{{{{{4'b0000,4'b0001},t_s2mm_vCacheCmd},1'b0},1'b1},6'h0},1'b1},t_s2mm_vCacheCmd_4};
  assign s2mm_kSzCmd = {{{{{{{4'b0000,4'b0010},t_s2mm_kSzCmd},1'b0},1'b1},6'h0},1'b1},t_s2mm_kSzCmd_4};
  assign s2mm_vSzCmd = {{{{{{{4'b0000,4'b0010},t_s2mm_vSzCmd},1'b0},1'b1},6'h0},1'b1},t_s2mm_vSzCmd_4};
  assign s2mm_s2mmCmd_payload = t_s2mm_s2mmCmd_payload;
  assign s2mm_s2mmCmd_valid = s2mm_tokenEnFifo_io_pop_valid;
  assign s2mm_s2mmCmd_fire = (s2mm_s2mmCmd_valid && s2mm_s2mmCmd_ready);
  assign s2mm_enIncHead = (s2mm_s2mmCmd_fire && (&s2mm_cnt));
  assign s2mm_enIncLayer = (s2mm_enIncHead && s2mm_headCntOvf);
  assign s2mm_toMemSel = s2mm_cnt;
  always @(*) begin
    s2mm_s2mmCmdThrow_valid = s2mm_s2mmCmd_valid;
    if(t_when) begin
      s2mm_s2mmCmdThrow_valid = 1'b0;
    end
  end

  always @(*) begin
    s2mm_s2mmCmd_ready = s2mm_s2mmCmdThrow_ready;
    if(t_when) begin
      s2mm_s2mmCmd_ready = 1'b1;
    end
  end

  assign s2mm_s2mmCmdThrow_payload = s2mm_s2mmCmd_payload;
  assign s2mm_s2mmCmdThrow_ready = s2mm_cmdFifo_io_push_ready;
  assign io_s2mmCmd_valid = s2mm_cmdFifo_io_pop_valid;
  assign io_s2mmCmd_payload = s2mm_cmdFifo_io_pop_payload;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      token <= 13'h0;
      headBase <= 32'h00002000;
      headCnt <= 4'b0000;
      headCntOvf <= 1'b0;
      layerBase <= 32'h177f6000;
      layerCnt <= 5'h0;
      layerCntOvf <= 1'b0;
      attnHeadBase <= 32'h0;
      indexCmdGen_denseLastCnt <= 1'b0;
      indexCmdGen_selBaseAddr <= 26'h0;
      indexCmdGen_selLen <= 10'h0;
      local_index_valid_regNext <= 1'b0;
      local_index_payload_last_regNext <= 1'b0;
      t_indexCmdGen_denseU_payload_last <= 10'h0;
      t_indexCmdGen_denseU_payload_last_2 <= 1'b0;
      t_indexCmdGen_denseU_payload_fragment <= 32'h02860000;
      t_indexCmdGen_denseU_payload_fragment_2 <= 23'h002000;
      t_indexCmdGen_denseD_payload_last <= 10'h0;
      t_indexCmdGen_denseD_payload_last_2 <= 1'b0;
      t_indexCmdGen_denseD_payload_fragment <= 32'h02ee0000;
      t_indexCmdGen_denseD_payload_fragment_2 <= 23'h002000;
      indexCmdGen_enDenseUD <= 1'b0;
      indexCmdGen_indexFlow_payload_first <= 1'b1;
      t_attnKV_attnKCmdVec_payload_last <= 5'h0;
      t_attnKV_attnKCmdVec_payload_last_2 <= 1'b0;
      t_attnKV_attnKCmdVec_payload_fragment <= 32'h00032000;
      t_attnKV_attnKCmdVec_payload_fragment_2 <= 23'h002000;
      t_attnKV_attnVCmdVec_payload_last <= 5'h0;
      t_attnKV_attnVCmdVec_payload_last_2 <= 1'b0;
      t_attnKV_attnVCmdVec_payload_fragment <= 32'h00064000;
      t_attnKV_attnVCmdVec_payload_fragment_2 <= 23'h002000;
      attnKV_sel <= 1'b0;
      cmdGen_attnKV_mux_io_output_payload_first <= 1'b1;
      attnKV_tagSel <= 1'b0;
      t_attnQKVNoSz_attnQCmdVec_payload_last <= 5'h0;
      t_attnQKVNoSz_attnQCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVNoSz_attnQCmdVec_payload_fragment <= 32'h0;
      t_attnQKVNoSz_attnQCmdVec_payload_fragment_2 <= 23'h002000;
      t_attnQKVNoSz_attnKCmdVec_payload_last <= 5'h0;
      t_attnQKVNoSz_attnKCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVNoSz_attnKCmdVec_payload_fragment <= 32'h00032000;
      t_attnQKVNoSz_attnKCmdVec_payload_fragment_2 <= 23'h002000;
      t_attnQKVNoSz_attnVCmdVec_payload_last <= 5'h0;
      t_attnQKVNoSz_attnVCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVNoSz_attnVCmdVec_payload_fragment <= 32'h00064000;
      t_attnQKVNoSz_attnVCmdVec_payload_fragment_2 <= 23'h002000;
      attnQKVNoSz_sel <= 3'b000;
      cmdGen_attnQKVNoSz_mux_io_output_payload_first <= 1'b1;
      attnQKVNoSz_tagSel <= 3'b000;
      t_attnQKVWithSz_attnQCmdVec_payload_last <= 5'h0;
      t_attnQKVWithSz_attnQCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVWithSz_attnQCmdVec_payload_fragment <= 32'h0;
      t_attnQKVWithSz_attnQCmdVec_payload_fragment_2 <= 23'h002000;
      t_attnQKVWithSz_attnKCmdVec_payload_last <= 5'h0;
      t_attnQKVWithSz_attnKCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVWithSz_attnKCmdVec_payload_fragment <= 32'h00032000;
      t_attnQKVWithSz_attnKCmdVec_payload_fragment_2 <= 23'h002000;
      t_attnQKVWithSz_attnVCmdVec_payload_last <= 5'h0;
      t_attnQKVWithSz_attnVCmdVec_payload_last_2 <= 1'b0;
      t_attnQKVWithSz_attnVCmdVec_payload_fragment <= 32'h00064000;
      t_attnQKVWithSz_attnVCmdVec_payload_fragment_2 <= 23'h002000;
      attnQKVWithSz_sel <= 3'b000;
      cmdGen_attnQKVWithSz_mux_io_output_payload_first <= 1'b1;
      attnQKVWithSz_tagSel <= 3'b000;
      t_mlpDense_attnOCmdVec_payload_last <= 9'h0;
      t_mlpDense_attnOCmdVec_payload_last_2 <= 1'b0;
      t_mlpDense_attnOCmdVec_payload_fragment <= 32'h01fca000;
      t_mlpDense_attnOCmdVec_payload_fragment_2 <= 23'h002000;
      t_mlpDense_mlpDenseGCmdVec_payload_last <= 10'h0;
      t_mlpDense_mlpDenseGCmdVec_payload_last_2 <= 1'b0;
      t_mlpDense_mlpDenseGCmdVec_payload_fragment <= 32'h02224000;
      t_mlpDense_mlpDenseGCmdVec_payload_fragment_2 <= 23'h002000;
      mlpDense_sel <= 3'b000;
      cmdGen_mlpDense_mux_io_output_payload_first <= 1'b1;
      mlpDense_muxSel <= 2'b00;
      mlpDense_tagSel <= 3'b000;
      t_logits_lgDenseHeadVec_payload_last <= 14'h0;
      t_logits_lgDenseHeadVec_payload_last_2 <= 1'b0;
      t_logits_lgDenseHeadVec_payload_fragment <= 32'h74e42000;
      t_logits_lgDenseHeadVec_payload_fragment_2 <= 23'h002000;
      logits_sel <= 1'b0;
      cmdGen_logits_mux_io_output_payload_first <= 1'b1;
      logits_tagSel <= 1'b0;
      prefill <= 1'b1;
      mm2sCmd_rValidN <= 1'b1;
      mm2sCmd_s2mPipe_rValid <= 1'b0;
      select_1 <= 3'b000;
      s2mm_headBase <= 32'h00002000;
      s2mm_headCnt <= 4'b0000;
      s2mm_headCntOvf <= 1'b0;
      s2mm_layerBase <= 32'h177f6000;
      s2mm_layerCnt <= 5'h0;
      s2mm_layerCntOvf <= 1'b0;
      s2mm_s2mmTokenCnt <= 13'h0;
      s2mm_attnHeadBase <= 32'h0;
      s2mm_cnt <= 2'b00;
    end else begin
      headBase <= headBaseNext;
      if(enIncHead) begin
        headCnt <= (headCnt + 4'b0001);
        if(headCntAbout2Ovf) begin
          headCntOvf <= 1'b1;
        end
        if(headCntOvf) begin
          headCnt <= 4'b0000;
          headCntOvf <= 1'b0;
        end
      end
      layerBase <= layerBaseNext;
      if(enIncLayer) begin
        layerCnt <= (layerCnt + 5'h01);
        if(layerCntAbout2Ovf) begin
          layerCntOvf <= 1'b1;
        end
        if(layerCntOvf) begin
          layerCnt <= 5'h0;
          layerCntOvf <= 1'b0;
        end
      end
      attnHeadBase <= attnHeadBaseNext;
      if(((local_index_valid && local_index_payload_last) && (! status_enPredictor))) begin
        indexCmdGen_denseLastCnt <= (indexCmdGen_denseLastCnt + 1'b1);
        if((indexCmdGen_denseLastCnt == 1'b1)) begin
          indexCmdGen_denseLastCnt <= 1'b0;
        end
      end
      indexCmdGen_selBaseAddr <= indexCmdGen_selDenseBaseAddr;
      indexCmdGen_selLen <= indexCmdGen_selDenseLen;
      local_index_valid_regNext <= local_index_valid;
      local_index_payload_last_regNext <= local_index_payload_last;
      t_indexCmdGen_denseU_payload_last <= t_indexCmdGen_denseU_payload_last_1;
      t_indexCmdGen_denseU_payload_last_2 <= t_indexCmdGen_denseU_payload_last_3;
      t_indexCmdGen_denseU_payload_fragment <= t_indexCmdGen_denseU_payload_fragment_1;
      t_indexCmdGen_denseU_payload_fragment_2 <= {9'd0, t_t_indexCmdGen_denseU_payload_fragment_2};
      t_indexCmdGen_denseD_payload_last <= t_indexCmdGen_denseD_payload_last_1;
      t_indexCmdGen_denseD_payload_last_2 <= t_indexCmdGen_denseD_payload_last_3;
      t_indexCmdGen_denseD_payload_fragment <= t_indexCmdGen_denseD_payload_fragment_1;
      t_indexCmdGen_denseD_payload_fragment_2 <= {9'd0, t_t_indexCmdGen_denseD_payload_fragment_2};
      if(indexCmdGen_indexFlow_valid) begin
        indexCmdGen_indexFlow_payload_first <= indexCmdGen_indexFlow_payload_last;
      end
      if((indexCmdGen_indexFlow_valid && indexCmdGen_indexFlow_payload_first)) begin
        indexCmdGen_enDenseUD <= 1'b1;
      end
      if((indexCmdGen_indexMux_io_output_valid && indexCmdGen_indexMux_io_output_payload_last)) begin
        indexCmdGen_enDenseUD <= 1'b0;
      end
      t_attnKV_attnKCmdVec_payload_last <= t_attnKV_attnKCmdVec_payload_last_1;
      t_attnKV_attnKCmdVec_payload_last_2 <= t_attnKV_attnKCmdVec_payload_last_3;
      t_attnKV_attnKCmdVec_payload_fragment <= t_attnKV_attnKCmdVec_payload_fragment_1;
      t_attnKV_attnKCmdVec_payload_fragment_2 <= {9'd0, t_t_attnKV_attnKCmdVec_payload_fragment_2};
      t_attnKV_attnVCmdVec_payload_last <= t_attnKV_attnVCmdVec_payload_last_1;
      t_attnKV_attnVCmdVec_payload_last_2 <= t_attnKV_attnVCmdVec_payload_last_3;
      t_attnKV_attnVCmdVec_payload_fragment <= t_attnKV_attnVCmdVec_payload_fragment_1;
      t_attnKV_attnVCmdVec_payload_fragment_2 <= {9'd0, t_t_attnKV_attnVCmdVec_payload_fragment_2};
      if(attnKV_muxOutFire) begin
        cmdGen_attnKV_mux_io_output_payload_first <= attnKV_mux_io_output_payload_last;
      end
      if((attnKV_muxOutFire && attnKV_mux_io_output_payload_last)) begin
        attnKV_sel <= (attnKV_sel + 1'b1);
        if(attnKV_selOvf) begin
          attnKV_sel <= 1'b0;
        end
      end
      if((attnKV_muxOutFire && attnKV_muxOutIsFirst)) begin
        attnKV_tagSel <= (attnKV_tagSel + 1'b1);
        if((attnKV_tagSel == 1'b1)) begin
          attnKV_tagSel <= 1'b0;
        end
      end
      t_attnQKVNoSz_attnQCmdVec_payload_last <= t_attnQKVNoSz_attnQCmdVec_payload_last_1;
      t_attnQKVNoSz_attnQCmdVec_payload_last_2 <= t_attnQKVNoSz_attnQCmdVec_payload_last_3;
      t_attnQKVNoSz_attnQCmdVec_payload_fragment <= t_attnQKVNoSz_attnQCmdVec_payload_fragment_1;
      t_attnQKVNoSz_attnQCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVNoSz_attnQCmdVec_payload_fragment_2};
      t_attnQKVNoSz_attnKCmdVec_payload_last <= t_attnQKVNoSz_attnKCmdVec_payload_last_1;
      t_attnQKVNoSz_attnKCmdVec_payload_last_2 <= t_attnQKVNoSz_attnKCmdVec_payload_last_3;
      t_attnQKVNoSz_attnKCmdVec_payload_fragment <= t_attnQKVNoSz_attnKCmdVec_payload_fragment_1;
      t_attnQKVNoSz_attnKCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVNoSz_attnKCmdVec_payload_fragment_2};
      t_attnQKVNoSz_attnVCmdVec_payload_last <= t_attnQKVNoSz_attnVCmdVec_payload_last_1;
      t_attnQKVNoSz_attnVCmdVec_payload_last_2 <= t_attnQKVNoSz_attnVCmdVec_payload_last_3;
      t_attnQKVNoSz_attnVCmdVec_payload_fragment <= t_attnQKVNoSz_attnVCmdVec_payload_fragment_1;
      t_attnQKVNoSz_attnVCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVNoSz_attnVCmdVec_payload_fragment_2};
      if(attnQKVNoSz_muxOutFire) begin
        cmdGen_attnQKVNoSz_mux_io_output_payload_first <= attnQKVNoSz_mux_io_output_payload_last;
      end
      if((attnQKVNoSz_muxOutFire && attnQKVNoSz_mux_io_output_payload_last)) begin
        attnQKVNoSz_sel <= (attnQKVNoSz_sel + 3'b001);
        if(attnQKVNoSz_selOvf) begin
          attnQKVNoSz_sel <= 3'b000;
        end
      end
      if((attnQKVNoSz_muxOutFire && attnQKVNoSz_muxOutIsFirst)) begin
        attnQKVNoSz_tagSel <= (attnQKVNoSz_tagSel + 3'b001);
        if((attnQKVNoSz_tagSel == 3'b100)) begin
          attnQKVNoSz_tagSel <= 3'b000;
        end
      end
      t_attnQKVWithSz_attnQCmdVec_payload_last <= t_attnQKVWithSz_attnQCmdVec_payload_last_1;
      t_attnQKVWithSz_attnQCmdVec_payload_last_2 <= t_attnQKVWithSz_attnQCmdVec_payload_last_3;
      t_attnQKVWithSz_attnQCmdVec_payload_fragment <= t_attnQKVWithSz_attnQCmdVec_payload_fragment_1;
      t_attnQKVWithSz_attnQCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVWithSz_attnQCmdVec_payload_fragment_2};
      t_attnQKVWithSz_attnKCmdVec_payload_last <= t_attnQKVWithSz_attnKCmdVec_payload_last_1;
      t_attnQKVWithSz_attnKCmdVec_payload_last_2 <= t_attnQKVWithSz_attnKCmdVec_payload_last_3;
      t_attnQKVWithSz_attnKCmdVec_payload_fragment <= t_attnQKVWithSz_attnKCmdVec_payload_fragment_1;
      t_attnQKVWithSz_attnKCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVWithSz_attnKCmdVec_payload_fragment_2};
      t_attnQKVWithSz_attnVCmdVec_payload_last <= t_attnQKVWithSz_attnVCmdVec_payload_last_1;
      t_attnQKVWithSz_attnVCmdVec_payload_last_2 <= t_attnQKVWithSz_attnVCmdVec_payload_last_3;
      t_attnQKVWithSz_attnVCmdVec_payload_fragment <= t_attnQKVWithSz_attnVCmdVec_payload_fragment_1;
      t_attnQKVWithSz_attnVCmdVec_payload_fragment_2 <= {9'd0, t_t_attnQKVWithSz_attnVCmdVec_payload_fragment_2};
      if(attnQKVWithSz_muxOutFire) begin
        cmdGen_attnQKVWithSz_mux_io_output_payload_first <= attnQKVWithSz_mux_io_output_payload_last;
      end
      if((attnQKVWithSz_muxOutFire && attnQKVWithSz_mux_io_output_payload_last)) begin
        attnQKVWithSz_sel <= (attnQKVWithSz_sel + 3'b001);
        if(attnQKVWithSz_selOvf) begin
          attnQKVWithSz_sel <= 3'b000;
        end
      end
      if((attnQKVWithSz_muxOutFire && attnQKVWithSz_muxOutIsFirst)) begin
        attnQKVWithSz_tagSel <= (attnQKVWithSz_tagSel + 3'b001);
        if((attnQKVWithSz_tagSel == 3'b110)) begin
          attnQKVWithSz_tagSel <= 3'b000;
        end
      end
      t_mlpDense_attnOCmdVec_payload_last <= t_mlpDense_attnOCmdVec_payload_last_1;
      t_mlpDense_attnOCmdVec_payload_last_2 <= t_mlpDense_attnOCmdVec_payload_last_3;
      t_mlpDense_attnOCmdVec_payload_fragment <= t_mlpDense_attnOCmdVec_payload_fragment_1;
      t_mlpDense_attnOCmdVec_payload_fragment_2 <= {9'd0, t_t_mlpDense_attnOCmdVec_payload_fragment_2};
      t_mlpDense_mlpDenseGCmdVec_payload_last <= t_mlpDense_mlpDenseGCmdVec_payload_last_1;
      t_mlpDense_mlpDenseGCmdVec_payload_last_2 <= t_mlpDense_mlpDenseGCmdVec_payload_last_3;
      t_mlpDense_mlpDenseGCmdVec_payload_fragment <= t_mlpDense_mlpDenseGCmdVec_payload_fragment_1;
      t_mlpDense_mlpDenseGCmdVec_payload_fragment_2 <= {9'd0, t_t_mlpDense_mlpDenseGCmdVec_payload_fragment_2};
      if(mlpDense_muxOutFire) begin
        cmdGen_mlpDense_mux_io_output_payload_first <= mlpDense_mux_io_output_payload_last;
      end
      if((mlpDense_muxOutFire && mlpDense_mux_io_output_payload_last)) begin
        if((mlpDense_muxSel != 2'b11)) begin
          mlpDense_muxSel <= (mlpDense_muxSel + 2'b01);
        end
        mlpDense_sel <= (mlpDense_sel + 3'b001);
        if(mlpDense_selOvf) begin
          mlpDense_sel <= 3'b000;
          mlpDense_muxSel <= 2'b00;
        end
      end
      if((mlpDense_muxOutFire && mlpDense_muxOutIsFirst)) begin
        mlpDense_tagSel <= (mlpDense_tagSel + 3'b001);
        if((mlpDense_tagSel == 3'b100)) begin
          mlpDense_tagSel <= 3'b000;
        end
      end
      t_logits_lgDenseHeadVec_payload_last <= t_logits_lgDenseHeadVec_payload_last_1;
      t_logits_lgDenseHeadVec_payload_last_2 <= t_logits_lgDenseHeadVec_payload_last_3;
      t_logits_lgDenseHeadVec_payload_fragment <= t_logits_lgDenseHeadVec_payload_fragment_1;
      t_logits_lgDenseHeadVec_payload_fragment_2 <= {9'd0, t_t_logits_lgDenseHeadVec_payload_fragment_2};
      if(logits_muxOutFire) begin
        cmdGen_logits_mux_io_output_payload_first <= logits_mux_io_output_payload_last;
      end
      if((logits_muxOutFire && logits_mux_io_output_payload_last)) begin
        logits_sel <= (logits_sel + 1'b1);
        if((logits_sel == 1'b1)) begin
          logits_sel <= 1'b0;
        end
      end
      if((logits_muxOutFire && logits_muxOutIsFirst)) begin
        logits_tagSel <= (logits_tagSel + 1'b1);
        if((logits_tagSel == 1'b1)) begin
          logits_tagSel <= 1'b0;
        end
      end
      if((tokenTag_fire && (tokenTag_payload == 6'h01))) begin
        prefill <= 1'b0;
      end
      if(mm2sCmd_valid) begin
        mm2sCmd_rValidN <= 1'b0;
      end
      if(mm2sCmd_s2mPipe_ready) begin
        mm2sCmd_rValidN <= 1'b1;
      end
      if(mm2sCmd_s2mPipe_ready) begin
        mm2sCmd_s2mPipe_rValid <= mm2sCmd_s2mPipe_valid;
      end
      if(enTokenCnt) begin
        token <= (token + 13'h0001);
      end
      select_1 <= selectNext;
      s2mm_headBase <= s2mm_headBaseNext;
      if(s2mm_enIncHead) begin
        s2mm_headCnt <= (s2mm_headCnt + 4'b0001);
        if(s2mm_headCntAbout2Ovf) begin
          s2mm_headCntOvf <= 1'b1;
        end
        if(s2mm_headCntOvf) begin
          s2mm_headCnt <= 4'b0000;
          s2mm_headCntOvf <= 1'b0;
        end
      end
      s2mm_layerBase <= s2mm_layerBaseNext;
      if(s2mm_enIncLayer) begin
        s2mm_layerCnt <= (s2mm_layerCnt + 5'h01);
        if(s2mm_layerCntAbout2Ovf) begin
          s2mm_layerCntOvf <= 1'b1;
        end
        if(s2mm_layerCntOvf) begin
          s2mm_layerCnt <= 5'h0;
          s2mm_layerCntOvf <= 1'b0;
          s2mm_s2mmTokenCnt <= (s2mm_s2mmTokenCnt + 13'h0001);
        end
      end
      s2mm_attnHeadBase <= s2mm_attnHeadBaseNext;
      if(s2mm_s2mmCmd_fire) begin
        s2mm_cnt <= (s2mm_cnt + 2'b01);
      end
    end
  end

  always @(posedge clk_0_clk) begin
    indexCmdGen_selTag <= indexCmdGen_selDenseTag;
    t_indexCmdGen_indexFlow_payload_fragment <= local_index_payload_tdata;
    if(mm2sCmd_ready) begin
      mm2sCmd_rData <= mm2sCmd_payload;
    end
    if(mm2sCmd_s2mPipe_ready) begin
      mm2sCmd_s2mPipe_rData <= mm2sCmd_s2mPipe_payload;
    end
  end


endmodule

//StreamFifo_4 replaced by StreamFifo_69

//StreamFifo_3 replaced by StreamFifo_69

//StreamFifo_5 replaced by StreamFifo_69

//StreamMux replaced by StreamMux_19

//StreamMux_1 replaced by StreamMux_20

