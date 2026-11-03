// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module DataPath (
  input  wire          c2c_from_valid,
  output wire          c2c_from_ready,
  input  wire          c2c_from_payload_last,
  input  wire [15:0]   c2c_from_payload_tdata,
  input  wire [5:0]    c2c_from_payload_tuser,
  input  wire [0:0]    c2c_from_payload_tdest,
  output wire          c2c_to_valid,
  output wire          c2c_to_payload_last,
  output wire [15:0]   c2c_to_payload_tdata,
  output wire [5:0]    c2c_to_payload_tuser,
  output wire [0:0]    c2c_to_payload_tdest,
  output wire [15:0]   toAxiLite_tokenCnt,
  output wire          toAxiLite_argMaxVld,
  output wire [16:0]   toAxiLite_argMaxIndex,
  output wire          toAxiLite_prefill,
  output wire [7:0]    toAxiLite_layerCnt,
  input  wire          tokenIndex_valid,
  output wire          tokenIndex_ready,
  input  wire [16:0]   tokenIndex_tdata,
  input  wire [5:0]    tokenIndex_tuser,
  output wire          m_axi_hp_0_aw_valid,
  input  wire          m_axi_hp_0_aw_ready,
  output wire [31:0]   m_axi_hp_0_aw_payload_addr,
  output wire [3:0]    m_axi_hp_0_aw_payload_id,
  output wire [7:0]    m_axi_hp_0_aw_payload_len,
  output wire [2:0]    m_axi_hp_0_aw_payload_size,
  output wire [1:0]    m_axi_hp_0_aw_payload_burst,
  output wire [3:0]    m_axi_hp_0_aw_payload_cache,
  output wire [3:0]    m_axi_hp_0_aw_payload_user,
  output wire [2:0]    m_axi_hp_0_aw_payload_prot,
  output wire          m_axi_hp_0_w_valid,
  input  wire          m_axi_hp_0_w_ready,
  output wire [127:0]  m_axi_hp_0_w_payload_data,
  output wire [15:0]   m_axi_hp_0_w_payload_strb,
  output wire          m_axi_hp_0_w_payload_last,
  input  wire          m_axi_hp_0_b_valid,
  output wire          m_axi_hp_0_b_ready,
  input  wire [3:0]    m_axi_hp_0_b_payload_id,
  input  wire [1:0]    m_axi_hp_0_b_payload_resp,
  output wire          m_axi_hp_0_ar_valid,
  input  wire          m_axi_hp_0_ar_ready,
  output wire [31:0]   m_axi_hp_0_ar_payload_addr,
  output wire [3:0]    m_axi_hp_0_ar_payload_id,
  output wire [7:0]    m_axi_hp_0_ar_payload_len,
  output wire [2:0]    m_axi_hp_0_ar_payload_size,
  output wire [1:0]    m_axi_hp_0_ar_payload_burst,
  output wire [3:0]    m_axi_hp_0_ar_payload_cache,
  output wire [3:0]    m_axi_hp_0_ar_payload_user,
  output wire [2:0]    m_axi_hp_0_ar_payload_prot,
  input  wire          m_axi_hp_0_r_valid,
  output wire          m_axi_hp_0_r_ready,
  input  wire [127:0]  m_axi_hp_0_r_payload_data,
  input  wire [3:0]    m_axi_hp_0_r_payload_id,
  input  wire [1:0]    m_axi_hp_0_r_payload_resp,
  input  wire          m_axi_hp_0_r_payload_last,
  output wire          m_axi_hp_1_aw_valid,
  input  wire          m_axi_hp_1_aw_ready,
  output wire [31:0]   m_axi_hp_1_aw_payload_addr,
  output wire [3:0]    m_axi_hp_1_aw_payload_id,
  output wire [7:0]    m_axi_hp_1_aw_payload_len,
  output wire [2:0]    m_axi_hp_1_aw_payload_size,
  output wire [1:0]    m_axi_hp_1_aw_payload_burst,
  output wire [3:0]    m_axi_hp_1_aw_payload_cache,
  output wire [3:0]    m_axi_hp_1_aw_payload_user,
  output wire [2:0]    m_axi_hp_1_aw_payload_prot,
  output wire          m_axi_hp_1_w_valid,
  input  wire          m_axi_hp_1_w_ready,
  output wire [127:0]  m_axi_hp_1_w_payload_data,
  output wire [15:0]   m_axi_hp_1_w_payload_strb,
  output wire          m_axi_hp_1_w_payload_last,
  input  wire          m_axi_hp_1_b_valid,
  output wire          m_axi_hp_1_b_ready,
  input  wire [3:0]    m_axi_hp_1_b_payload_id,
  input  wire [1:0]    m_axi_hp_1_b_payload_resp,
  output wire          m_axi_hp_1_ar_valid,
  input  wire          m_axi_hp_1_ar_ready,
  output wire [31:0]   m_axi_hp_1_ar_payload_addr,
  output wire [3:0]    m_axi_hp_1_ar_payload_id,
  output wire [7:0]    m_axi_hp_1_ar_payload_len,
  output wire [2:0]    m_axi_hp_1_ar_payload_size,
  output wire [1:0]    m_axi_hp_1_ar_payload_burst,
  output wire [3:0]    m_axi_hp_1_ar_payload_cache,
  output wire [3:0]    m_axi_hp_1_ar_payload_user,
  output wire [2:0]    m_axi_hp_1_ar_payload_prot,
  input  wire          m_axi_hp_1_r_valid,
  output wire          m_axi_hp_1_r_ready,
  input  wire [127:0]  m_axi_hp_1_r_payload_data,
  input  wire [3:0]    m_axi_hp_1_r_payload_id,
  input  wire [1:0]    m_axi_hp_1_r_payload_resp,
  input  wire          m_axi_hp_1_r_payload_last,
  output wire          m_axi_hp_2_aw_valid,
  input  wire          m_axi_hp_2_aw_ready,
  output wire [31:0]   m_axi_hp_2_aw_payload_addr,
  output wire [3:0]    m_axi_hp_2_aw_payload_id,
  output wire [7:0]    m_axi_hp_2_aw_payload_len,
  output wire [2:0]    m_axi_hp_2_aw_payload_size,
  output wire [1:0]    m_axi_hp_2_aw_payload_burst,
  output wire [3:0]    m_axi_hp_2_aw_payload_cache,
  output wire [3:0]    m_axi_hp_2_aw_payload_user,
  output wire [2:0]    m_axi_hp_2_aw_payload_prot,
  output wire          m_axi_hp_2_w_valid,
  input  wire          m_axi_hp_2_w_ready,
  output wire [127:0]  m_axi_hp_2_w_payload_data,
  output wire [15:0]   m_axi_hp_2_w_payload_strb,
  output wire          m_axi_hp_2_w_payload_last,
  input  wire          m_axi_hp_2_b_valid,
  output wire          m_axi_hp_2_b_ready,
  input  wire [3:0]    m_axi_hp_2_b_payload_id,
  input  wire [1:0]    m_axi_hp_2_b_payload_resp,
  output wire          m_axi_hp_2_ar_valid,
  input  wire          m_axi_hp_2_ar_ready,
  output wire [31:0]   m_axi_hp_2_ar_payload_addr,
  output wire [3:0]    m_axi_hp_2_ar_payload_id,
  output wire [7:0]    m_axi_hp_2_ar_payload_len,
  output wire [2:0]    m_axi_hp_2_ar_payload_size,
  output wire [1:0]    m_axi_hp_2_ar_payload_burst,
  output wire [3:0]    m_axi_hp_2_ar_payload_cache,
  output wire [3:0]    m_axi_hp_2_ar_payload_user,
  output wire [2:0]    m_axi_hp_2_ar_payload_prot,
  input  wire          m_axi_hp_2_r_valid,
  output wire          m_axi_hp_2_r_ready,
  input  wire [127:0]  m_axi_hp_2_r_payload_data,
  input  wire [3:0]    m_axi_hp_2_r_payload_id,
  input  wire [1:0]    m_axi_hp_2_r_payload_resp,
  input  wire          m_axi_hp_2_r_payload_last,
  output wire          m_axi_hp_3_aw_valid,
  input  wire          m_axi_hp_3_aw_ready,
  output wire [31:0]   m_axi_hp_3_aw_payload_addr,
  output wire [3:0]    m_axi_hp_3_aw_payload_id,
  output wire [7:0]    m_axi_hp_3_aw_payload_len,
  output wire [2:0]    m_axi_hp_3_aw_payload_size,
  output wire [1:0]    m_axi_hp_3_aw_payload_burst,
  output wire [3:0]    m_axi_hp_3_aw_payload_cache,
  output wire [3:0]    m_axi_hp_3_aw_payload_user,
  output wire [2:0]    m_axi_hp_3_aw_payload_prot,
  output wire          m_axi_hp_3_w_valid,
  input  wire          m_axi_hp_3_w_ready,
  output wire [127:0]  m_axi_hp_3_w_payload_data,
  output wire [15:0]   m_axi_hp_3_w_payload_strb,
  output wire          m_axi_hp_3_w_payload_last,
  input  wire          m_axi_hp_3_b_valid,
  output wire          m_axi_hp_3_b_ready,
  input  wire [3:0]    m_axi_hp_3_b_payload_id,
  input  wire [1:0]    m_axi_hp_3_b_payload_resp,
  output wire          m_axi_hp_3_ar_valid,
  input  wire          m_axi_hp_3_ar_ready,
  output wire [31:0]   m_axi_hp_3_ar_payload_addr,
  output wire [3:0]    m_axi_hp_3_ar_payload_id,
  output wire [7:0]    m_axi_hp_3_ar_payload_len,
  output wire [2:0]    m_axi_hp_3_ar_payload_size,
  output wire [1:0]    m_axi_hp_3_ar_payload_burst,
  output wire [3:0]    m_axi_hp_3_ar_payload_cache,
  output wire [3:0]    m_axi_hp_3_ar_payload_user,
  output wire [2:0]    m_axi_hp_3_ar_payload_prot,
  input  wire          m_axi_hp_3_r_valid,
  output wire          m_axi_hp_3_r_ready,
  input  wire [127:0]  m_axi_hp_3_r_payload_data,
  input  wire [3:0]    m_axi_hp_3_r_payload_id,
  input  wire [1:0]    m_axi_hp_3_r_payload_resp,
  input  wire          m_axi_hp_3_r_payload_last,
  input  wire          aresetn,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                dmaHp_ctrl_aw_valid;
  wire       [31:0]   dmaHp_ctrl_aw_payload_addr;
  wire       [2:0]    dmaHp_ctrl_aw_payload_prot;
  wire                dmaHp_ctrl_w_valid;
  wire       [31:0]   dmaHp_ctrl_w_payload_data;
  wire       [3:0]    dmaHp_ctrl_w_payload_strb;
  wire                dmaHp_ctrl_b_ready;
  wire                dmaHp_ctrl_ar_valid;
  wire       [31:0]   dmaHp_ctrl_ar_payload_addr;
  wire       [2:0]    dmaHp_ctrl_ar_payload_prot;
  wire                dmaHp_ctrl_r_ready;
  wire                attn_exp_from_valid;
  wire       [15:0]   attn_exp_from_payload;
  wire                sOut_io_p2sOut_valid;
  wire       [15:0]   sOut_io_p2sOut_tdata;
  wire       [5:0]    sOut_io_p2sOut_tuser;
  wire                cmdGen_io_tokenIndex_ready;
  wire                cmdGen_io_mm2s_ready;
  wire                cmdGen_io_s2mm_valid;
  wire       [511:0]  cmdGen_io_s2mm_payload_data;
  wire       [63:0]   cmdGen_io_s2mm_payload_keep;
  wire                cmdGen_io_s2mm_payload_last;
  wire                cmdGen_io_mm2sCmd_valid;
  wire       [71:0]   cmdGen_io_mm2sCmd_payload;
  wire                cmdGen_io_s2mmCmd_valid;
  wire       [71:0]   cmdGen_io_s2mmCmd_payload;
  wire                cmdGen_local_bus_valid;
  wire       [511:0]  cmdGen_local_bus_payload_data;
  wire                cmdGen_local_bus_payload_last;
  wire       [5:0]    cmdGen_local_bus_payload_dest;
  wire                cmdGen_local_kvBus_ready;
  wire                tokenIndexFifo_io_push_ready;
  wire                tokenIndexFifo_io_pop_valid;
  wire       [16:0]   tokenIndexFifo_io_pop_tdata;
  wire       [5:0]    tokenIndexFifo_io_pop_tuser;
  wire       [6:0]    tokenIndexFifo_io_occupancy;
  wire       [6:0]    tokenIndexFifo_io_availability;
  wire                dmaHp_s2mm_tready;
  wire                dmaHp_mm2s_tvalid;
  wire       [511:0]  dmaHp_mm2s_tdata;
  wire       [63:0]   dmaHp_mm2s_tkeep;
  wire                dmaHp_mm2s_tlast;
  wire                dmaHp_s2mmCmd_tready;
  wire                dmaHp_mm2sCmd_tready;
  wire                dmaHp_m_axi_0_arvalid;
  wire       [31:0]   dmaHp_m_axi_0_araddr;
  wire       [3:0]    dmaHp_m_axi_0_arid;
  wire       [7:0]    dmaHp_m_axi_0_arlen;
  wire       [2:0]    dmaHp_m_axi_0_arsize;
  wire       [1:0]    dmaHp_m_axi_0_arburst;
  wire       [3:0]    dmaHp_m_axi_0_arcache;
  wire       [3:0]    dmaHp_m_axi_0_aruser;
  wire       [2:0]    dmaHp_m_axi_0_arprot;
  wire                dmaHp_m_axi_0_awvalid;
  wire       [31:0]   dmaHp_m_axi_0_awaddr;
  wire       [3:0]    dmaHp_m_axi_0_awid;
  wire       [7:0]    dmaHp_m_axi_0_awlen;
  wire       [2:0]    dmaHp_m_axi_0_awsize;
  wire       [1:0]    dmaHp_m_axi_0_awburst;
  wire       [3:0]    dmaHp_m_axi_0_awcache;
  wire       [3:0]    dmaHp_m_axi_0_awuser;
  wire       [2:0]    dmaHp_m_axi_0_awprot;
  wire                dmaHp_m_axi_0_wvalid;
  wire       [127:0]  dmaHp_m_axi_0_wdata;
  wire       [15:0]   dmaHp_m_axi_0_wstrb;
  wire                dmaHp_m_axi_0_wlast;
  wire                dmaHp_m_axi_0_rready;
  wire                dmaHp_m_axi_0_bready;
  wire                dmaHp_m_axi_1_arvalid;
  wire       [31:0]   dmaHp_m_axi_1_araddr;
  wire       [3:0]    dmaHp_m_axi_1_arid;
  wire       [7:0]    dmaHp_m_axi_1_arlen;
  wire       [2:0]    dmaHp_m_axi_1_arsize;
  wire       [1:0]    dmaHp_m_axi_1_arburst;
  wire       [3:0]    dmaHp_m_axi_1_arcache;
  wire       [3:0]    dmaHp_m_axi_1_aruser;
  wire       [2:0]    dmaHp_m_axi_1_arprot;
  wire                dmaHp_m_axi_1_awvalid;
  wire       [31:0]   dmaHp_m_axi_1_awaddr;
  wire       [3:0]    dmaHp_m_axi_1_awid;
  wire       [7:0]    dmaHp_m_axi_1_awlen;
  wire       [2:0]    dmaHp_m_axi_1_awsize;
  wire       [1:0]    dmaHp_m_axi_1_awburst;
  wire       [3:0]    dmaHp_m_axi_1_awcache;
  wire       [3:0]    dmaHp_m_axi_1_awuser;
  wire       [2:0]    dmaHp_m_axi_1_awprot;
  wire                dmaHp_m_axi_1_wvalid;
  wire       [127:0]  dmaHp_m_axi_1_wdata;
  wire       [15:0]   dmaHp_m_axi_1_wstrb;
  wire                dmaHp_m_axi_1_wlast;
  wire                dmaHp_m_axi_1_rready;
  wire                dmaHp_m_axi_1_bready;
  wire                dmaHp_m_axi_2_arvalid;
  wire       [31:0]   dmaHp_m_axi_2_araddr;
  wire       [3:0]    dmaHp_m_axi_2_arid;
  wire       [7:0]    dmaHp_m_axi_2_arlen;
  wire       [2:0]    dmaHp_m_axi_2_arsize;
  wire       [1:0]    dmaHp_m_axi_2_arburst;
  wire       [3:0]    dmaHp_m_axi_2_arcache;
  wire       [3:0]    dmaHp_m_axi_2_aruser;
  wire       [2:0]    dmaHp_m_axi_2_arprot;
  wire                dmaHp_m_axi_2_awvalid;
  wire       [31:0]   dmaHp_m_axi_2_awaddr;
  wire       [3:0]    dmaHp_m_axi_2_awid;
  wire       [7:0]    dmaHp_m_axi_2_awlen;
  wire       [2:0]    dmaHp_m_axi_2_awsize;
  wire       [1:0]    dmaHp_m_axi_2_awburst;
  wire       [3:0]    dmaHp_m_axi_2_awcache;
  wire       [3:0]    dmaHp_m_axi_2_awuser;
  wire       [2:0]    dmaHp_m_axi_2_awprot;
  wire                dmaHp_m_axi_2_wvalid;
  wire       [127:0]  dmaHp_m_axi_2_wdata;
  wire       [15:0]   dmaHp_m_axi_2_wstrb;
  wire                dmaHp_m_axi_2_wlast;
  wire                dmaHp_m_axi_2_rready;
  wire                dmaHp_m_axi_2_bready;
  wire                dmaHp_m_axi_3_arvalid;
  wire       [31:0]   dmaHp_m_axi_3_araddr;
  wire       [3:0]    dmaHp_m_axi_3_arid;
  wire       [7:0]    dmaHp_m_axi_3_arlen;
  wire       [2:0]    dmaHp_m_axi_3_arsize;
  wire       [1:0]    dmaHp_m_axi_3_arburst;
  wire       [3:0]    dmaHp_m_axi_3_arcache;
  wire       [3:0]    dmaHp_m_axi_3_aruser;
  wire       [2:0]    dmaHp_m_axi_3_arprot;
  wire                dmaHp_m_axi_3_awvalid;
  wire       [31:0]   dmaHp_m_axi_3_awaddr;
  wire       [3:0]    dmaHp_m_axi_3_awid;
  wire       [7:0]    dmaHp_m_axi_3_awlen;
  wire       [2:0]    dmaHp_m_axi_3_awsize;
  wire       [1:0]    dmaHp_m_axi_3_awburst;
  wire       [3:0]    dmaHp_m_axi_3_awcache;
  wire       [3:0]    dmaHp_m_axi_3_awuser;
  wire       [2:0]    dmaHp_m_axi_3_awprot;
  wire                dmaHp_m_axi_3_wvalid;
  wire       [127:0]  dmaHp_m_axi_3_wdata;
  wire       [15:0]   dmaHp_m_axi_3_wstrb;
  wire                dmaHp_m_axi_3_wlast;
  wire                dmaHp_m_axi_3_rready;
  wire                dmaHp_m_axi_3_bready;
  wire                dmaHp_ctrl_aw_ready;
  wire                dmaHp_ctrl_w_ready;
  wire                dmaHp_ctrl_b_valid;
  wire       [1:0]    dmaHp_ctrl_b_payload_resp;
  wire                dmaHp_ctrl_ar_ready;
  wire                dmaHp_ctrl_r_valid;
  wire       [31:0]   dmaHp_ctrl_r_payload_data;
  wire       [1:0]    dmaHp_ctrl_r_payload_resp;
  wire                axi_io_bus_ready;
  wire                axi_io_kSzOut_ready;
  wire                axi_io_vSzOut_ready;
  wire                axi_int_bus_valid;
  wire                axi_int_bus_payload_last;
  wire       [511:0]  axi_int_bus_payload_tdata;
  wire       [5:0]    axi_int_bus_payload_tuser;
  wire                axi_int_lnScale_valid;
  wire       [15:0]   axi_int_lnScale_payload;
  wire                axi_int_zeroInt4_valid;
  wire       [7:0]    axi_int_zeroInt4_payload;
  wire                axi_int_zeroInt8_valid;
  wire       [7:0]    axi_int_zeroInt8_payload;
  wire                axi_int_preScale_valid;
  wire       [15:0]   axi_int_preScale_payload;
  wire                axi_int_postScale_valid;
  wire       [31:0]   axi_int_postScale_payload;
  wire                attn_io_ropeOut_valid;
  wire       [15:0]   attn_io_ropeOut_tdata;
  wire       [5:0]    attn_io_ropeOut_tuser;
  wire                attn_io_softmaxOut_valid;
  wire                attn_io_softmaxOut_payload_last;
  wire       [15:0]   attn_io_softmaxOut_payload_tdata;
  wire       [5:0]    attn_io_softmaxOut_payload_tuser;
  wire                attn_io_quantZero_valid;
  wire       [7:0]    attn_io_quantZero_payload;
  wire                attn_io_quantScale_valid;
  wire       [15:0]   attn_io_quantScale_payload;
  wire                attn_io_afterQuant_valid;
  wire                attn_io_afterQuant_payload_last;
  wire       [7:0]    attn_io_afterQuant_payload_fragment;
  wire                attn_exp_to_valid;
  wire       [15:0]   attn_exp_to_payload;
  wire                ln_io_lnScale_ready;
  wire                ln_io_lnOut_valid;
  wire       [15:0]   ln_io_lnOut_tdata;
  wire       [5:0]    ln_io_lnOut_tuser;
  wire                sOut_io_scalarOut_valid;
  wire       [15:0]   sOut_io_scalarOut_payload;
  wire                sOut_io_zfIndexOut_valid;
  wire                sOut_io_zfIndexOut_payload_last;
  wire       [15:0]   sOut_io_zfIndexOut_payload_tdata;
  wire       [5:0]    sOut_io_zfIndexOut_payload_tuser;
  wire                sOut_io_gateIndexOut_valid;
  wire                sOut_io_gateIndexOut_payload_last;
  wire       [15:0]   sOut_io_gateIndexOut_payload_tdata;
  wire       [5:0]    sOut_io_gateIndexOut_payload_tuser;
  wire                sOut_io_ugIndexOut_valid;
  wire                sOut_io_ugIndexOut_payload_last;
  wire       [15:0]   sOut_io_ugIndexOut_payload_tdata;
  wire       [5:0]    sOut_io_ugIndexOut_payload_tuser;
  wire                sOut_silu_to_valid;
  wire       [15:0]   sOut_silu_to_payload;
  wire                busIn_io_bus_ready;
  wire                busIn_io_zeroInt4_ready;
  wire                busIn_io_zeroInt8_ready;
  wire                busIn_io_wkv_valid;
  wire       [2047:0] busIn_io_wkv_payload;
  wire                busIn_io_p2sOut_valid;
  wire                busIn_io_p2sOut_payload_last;
  wire       [15:0]   busIn_io_p2sOut_payload_tdata;
  wire       [5:0]    busIn_io_p2sOut_payload_tuser;
  wire                busIn_io_toResBuf_valid;
  wire       [2047:0] busIn_io_toResBuf_payload;
  wire                busIn_io_directOut_valid;
  wire       [2047:0] busIn_io_directOut_tdata;
  wire       [5:0]    busIn_io_directOut_tuser;
  wire                vecOut_io_vLocal_valid;
  wire       [2047:0] vecOut_io_vLocal_tdata;
  wire       [5:0]    vecOut_io_vLocal_tuser;
  wire                vecOut_io_vecOut_valid;
  wire       [2047:0] vecOut_io_vecOut_payload;
  wire                resBuf_serialOut_tvalid;
  wire       [15:0]   resBuf_serialOut_tdata;
  wire                resBuf_parallelOut_tvalid;
  wire       [2047:0] resBuf_parallelOut_tdata;
  wire                resAdd_io_output_valid;
  wire                resAdd_io_output_payload_last;
  wire       [15:0]   resAdd_io_output_payload_tdata;
  wire       [5:0]    resAdd_io_output_payload_tuser;
  wire                resAdd_io_fromResBuf_ready;
  wire                resAdd_io_toResBuf_valid;
  wire       [15:0]   resAdd_io_toResBuf_payload;
  wire                resAdd_multiCore2Res_resAddProbe_valid;
  wire       [15:0]   resAdd_multiCore2Res_resAddProbe_payload;
  wire                engine_wkvIn_tready;
  wire                engine_dotIn_tready;
  wire                engine_resAdd_tready;
  wire                engine_axpyIn_tready;
  wire                engine_preScale_tready;
  wire                engine_postScale_tready;
  wire                engine_vecOut_tvalid;
  wire       [2047:0] engine_vecOut_tdata;
  wire       [5:0]    engine_vecOut_tuser;
  wire                engine_scalarOut_tvalid;
  wire       [15:0]   engine_scalarOut_tdata;
  wire       [5:0]    engine_scalarOut_tuser;
  wire                engine_cfg_tready;
  wire       [5:0]    engine_preCfgTag;
  wire       [5:0]    engine_postCfgTag;
  wire                node_allGatherOut_tvalid;
  wire       [15:0]   node_allGatherOut_tdata;
  wire       [5:0]    node_allGatherOut_tuser;
  wire                node_allReduceOut_tvalid;
  wire       [15:0]   node_allReduceOut_tdata;
  wire       [5:0]    node_allReduceOut_tuser;
  wire                node_indexOut_tvalid;
  wire                node_indexOut_tlast;
  wire       [15:0]   node_indexOut_tdata;
  wire       [5:0]    node_indexOut_tuser;
  wire                node_c2c_from_ready;
  wire                node_c2c_to_valid;
  wire                node_c2c_to_payload_last;
  wire       [15:0]   node_c2c_to_payload_tdata;
  wire       [5:0]    node_c2c_to_payload_tuser;
  wire       [0:0]    node_c2c_to_payload_tdest;
  wire                cfgInsert_io_cfgIn_ready;
  wire                cfgInsert_io_cfgOut_valid;
  wire       [31:0]   cfgInsert_io_cfgOut_payload;
  wire                cfgInsert_io_gtCnt_valid;
  wire       [15:0]   cfgInsert_io_gtCnt_payload;
  wire                sample_argmax_tvalid;
  wire       [16:0]   sample_argmax_tdata;
  wire                sample_endOfDecode;
  wire                siluAct_io_out_valid;
  wire       [15:0]   siluAct_io_out_payload;
  wire                szPacker_io_kvBus_valid;
  wire                szPacker_io_kvBus_payload_last;
  wire       [511:0]  szPacker_io_kvBus_payload_fragment;
  wire                szPacker_io_kSzOut_valid;
  wire       [31:0]   szPacker_io_kSzOut_payload;
  wire                szPacker_io_vSzOut_valid;
  wire       [31:0]   szPacker_io_vSzOut_payload;
  wire                cfgGen_io_cfg_valid;
  wire       [31:0]   cfgGen_io_cfg_payload;
  wire                stateGen_2_status_enPredictor;
  wire                stateGen_2_status_enProSparse;
  wire                stateGen_2_status_tokenNextHit;
  wire                stateGen_2_status_mlpNextHit;
  wire                stateGen_2_status_vNextHit;
  wire                stateGen_2_status_prefill;
  wire                stateGen_2_status_flushRes;
  wire                stateGen_2_status_nextLayer;
  wire       [15:0]   stateGen_2_status_nonZeroCnt;
  wire                stateGen_2_status_logitsGen;
  wire                stateGen_2_status_toLogitsGen;
  wire       [12:0]   stateGen_2_status_token;
  wire       [4:0]    stateGen_2_status_layerCnt;
  wire       [12:0]   t_toAxiLite_tokenCnt;
  wire       [4:0]    t_toAxiLite_layerCnt;
  reg                 tokenIndexPipe_valid;
  reg        [16:0]   tokenIndexPipe_tdata;
  reg        [5:0]    tokenIndexPipe_tuser;
  wire       [63:0]   t_io_bus_payload_keep;
  wire       [22:0]   t_io_p2sOut_valid;
  wire       [21:0]   t_io_p2sOut_tdata;
  wire                coreArea_0_core_axi_int_bus_fire;

  assign t_toAxiLite_tokenCnt = stateGen_2_status_token;
  assign t_toAxiLite_layerCnt = stateGen_2_status_layerCnt;
  GenMemCmdLenAlign_1 cmdGen (
    .io_tokenIndex_valid       (tokenIndexFifo_io_pop_valid              ), //i
    .io_tokenIndex_ready       (cmdGen_io_tokenIndex_ready               ), //o
    .io_tokenIndex_tdata       (tokenIndexFifo_io_pop_tdata[16:0]        ), //i
    .io_tokenIndex_tuser       (tokenIndexFifo_io_pop_tuser[5:0]         ), //i
    .io_mm2s_valid             (dmaHp_mm2s_tvalid                        ), //i
    .io_mm2s_ready             (cmdGen_io_mm2s_ready                     ), //o
    .io_mm2s_payload_data      (dmaHp_mm2s_tdata[511:0]                  ), //i
    .io_mm2s_payload_keep      (dmaHp_mm2s_tkeep[63:0]                   ), //i
    .io_mm2s_payload_last      (dmaHp_mm2s_tlast                         ), //i
    .io_s2mm_valid             (cmdGen_io_s2mm_valid                     ), //o
    .io_s2mm_ready             (dmaHp_s2mm_tready                        ), //i
    .io_s2mm_payload_data      (cmdGen_io_s2mm_payload_data[511:0]       ), //o
    .io_s2mm_payload_keep      (cmdGen_io_s2mm_payload_keep[63:0]        ), //o
    .io_s2mm_payload_last      (cmdGen_io_s2mm_payload_last              ), //o
    .io_mm2sCmd_valid          (cmdGen_io_mm2sCmd_valid                  ), //o
    .io_mm2sCmd_ready          (dmaHp_mm2sCmd_tready                     ), //i
    .io_mm2sCmd_payload        (cmdGen_io_mm2sCmd_payload[71:0]          ), //o
    .io_s2mmCmd_valid          (cmdGen_io_s2mmCmd_valid                  ), //o
    .io_s2mmCmd_ready          (dmaHp_s2mmCmd_tready                     ), //i
    .io_s2mmCmd_payload        (cmdGen_io_s2mmCmd_payload[71:0]          ), //o
    .local_bus_valid           (cmdGen_local_bus_valid                   ), //o
    .local_bus_ready           (axi_io_bus_ready                         ), //i
    .local_bus_payload_data    (cmdGen_local_bus_payload_data[511:0]     ), //o
    .local_bus_payload_last    (cmdGen_local_bus_payload_last            ), //o
    .local_bus_payload_dest    (cmdGen_local_bus_payload_dest[5:0]       ), //o
    .local_kvBus_valid         (szPacker_io_kvBus_valid                  ), //i
    .local_kvBus_ready         (cmdGen_local_kvBus_ready                 ), //o
    .local_kvBus_payload_data  (szPacker_io_kvBus_payload_fragment[511:0]), //i
    .local_kvBus_payload_last  (szPacker_io_kvBus_payload_last           ), //i
    .local_kvBus_payload_dest  (6'h0                                     ), //i
    .local_index_valid         (node_indexOut_tvalid                     ), //i
    .local_index_payload_last  (node_indexOut_tlast                      ), //i
    .local_index_payload_tdata (node_indexOut_tdata[15:0]                ), //i
    .local_index_payload_tuser (node_indexOut_tuser[5:0]                 ), //i
    .status_enPredictor        (stateGen_2_status_enPredictor            ), //i
    .clk_0_clk                 (clk_0_clk                                ), //i
    .clk_0_resetn              (clk_0_resetn                             )  //i
  );
  StreamFifo_2 tokenIndexFifo (
    .io_push_valid   (tokenIndexPipe_valid               ), //i
    .io_push_ready   (tokenIndexFifo_io_push_ready       ), //o
    .io_push_tdata   (tokenIndexPipe_tdata[16:0]         ), //i
    .io_push_tuser   (tokenIndexPipe_tuser[5:0]          ), //i
    .io_pop_valid    (tokenIndexFifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdGen_io_tokenIndex_ready         ), //i
    .io_pop_tdata    (tokenIndexFifo_io_pop_tdata[16:0]  ), //o
    .io_pop_tuser    (tokenIndexFifo_io_pop_tuser[5:0]   ), //o
    .io_flush        (1'b0                               ), //i
    .io_occupancy    (tokenIndexFifo_io_occupancy[6:0]   ), //o
    .io_availability (tokenIndexFifo_io_availability[6:0]), //o
    .clk_0_clk       (clk_0_clk                          ), //i
    .clk_0_resetn    (clk_0_resetn                       )  //i
  );
  SplitAxiDatamover dmaHp (
    .s2mm_tvalid          (cmdGen_io_s2mm_valid              ), //i
    .s2mm_tready          (dmaHp_s2mm_tready                 ), //o
    .s2mm_tdata           (cmdGen_io_s2mm_payload_data[511:0]), //i
    .s2mm_tkeep           (cmdGen_io_s2mm_payload_keep[63:0] ), //i
    .s2mm_tlast           (cmdGen_io_s2mm_payload_last       ), //i
    .mm2s_tvalid          (dmaHp_mm2s_tvalid                 ), //o
    .mm2s_tready          (cmdGen_io_mm2s_ready              ), //i
    .mm2s_tdata           (dmaHp_mm2s_tdata[511:0]           ), //o
    .mm2s_tkeep           (dmaHp_mm2s_tkeep[63:0]            ), //o
    .mm2s_tlast           (dmaHp_mm2s_tlast                  ), //o
    .s2mmCmd_tvalid       (cmdGen_io_s2mmCmd_valid           ), //i
    .s2mmCmd_tready       (dmaHp_s2mmCmd_tready              ), //o
    .s2mmCmd_tdata        (cmdGen_io_s2mmCmd_payload[71:0]   ), //i
    .mm2sCmd_tvalid       (cmdGen_io_mm2sCmd_valid           ), //i
    .mm2sCmd_tready       (dmaHp_mm2sCmd_tready              ), //o
    .mm2sCmd_tdata        (cmdGen_io_mm2sCmd_payload[71:0]   ), //i
    .m_axi_0_awvalid      (dmaHp_m_axi_0_awvalid             ), //o
    .m_axi_0_awready      (m_axi_hp_0_aw_ready               ), //i
    .m_axi_0_awaddr       (dmaHp_m_axi_0_awaddr[31:0]        ), //o
    .m_axi_0_awid         (dmaHp_m_axi_0_awid[3:0]           ), //o
    .m_axi_0_awlen        (dmaHp_m_axi_0_awlen[7:0]          ), //o
    .m_axi_0_awsize       (dmaHp_m_axi_0_awsize[2:0]         ), //o
    .m_axi_0_awburst      (dmaHp_m_axi_0_awburst[1:0]        ), //o
    .m_axi_0_awcache      (dmaHp_m_axi_0_awcache[3:0]        ), //o
    .m_axi_0_awuser       (dmaHp_m_axi_0_awuser[3:0]         ), //o
    .m_axi_0_awprot       (dmaHp_m_axi_0_awprot[2:0]         ), //o
    .m_axi_0_wvalid       (dmaHp_m_axi_0_wvalid              ), //o
    .m_axi_0_wready       (m_axi_hp_0_w_ready                ), //i
    .m_axi_0_wdata        (dmaHp_m_axi_0_wdata[127:0]        ), //o
    .m_axi_0_wstrb        (dmaHp_m_axi_0_wstrb[15:0]         ), //o
    .m_axi_0_wlast        (dmaHp_m_axi_0_wlast               ), //o
    .m_axi_0_bvalid       (m_axi_hp_0_b_valid                ), //i
    .m_axi_0_bready       (dmaHp_m_axi_0_bready              ), //o
    .m_axi_0_bid          (m_axi_hp_0_b_payload_id[3:0]      ), //i
    .m_axi_0_bresp        (m_axi_hp_0_b_payload_resp[1:0]    ), //i
    .m_axi_0_arvalid      (dmaHp_m_axi_0_arvalid             ), //o
    .m_axi_0_arready      (m_axi_hp_0_ar_ready               ), //i
    .m_axi_0_araddr       (dmaHp_m_axi_0_araddr[31:0]        ), //o
    .m_axi_0_arid         (dmaHp_m_axi_0_arid[3:0]           ), //o
    .m_axi_0_arlen        (dmaHp_m_axi_0_arlen[7:0]          ), //o
    .m_axi_0_arsize       (dmaHp_m_axi_0_arsize[2:0]         ), //o
    .m_axi_0_arburst      (dmaHp_m_axi_0_arburst[1:0]        ), //o
    .m_axi_0_arcache      (dmaHp_m_axi_0_arcache[3:0]        ), //o
    .m_axi_0_aruser       (dmaHp_m_axi_0_aruser[3:0]         ), //o
    .m_axi_0_arprot       (dmaHp_m_axi_0_arprot[2:0]         ), //o
    .m_axi_0_rvalid       (m_axi_hp_0_r_valid                ), //i
    .m_axi_0_rready       (dmaHp_m_axi_0_rready              ), //o
    .m_axi_0_rdata        (m_axi_hp_0_r_payload_data[127:0]  ), //i
    .m_axi_0_rid          (m_axi_hp_0_r_payload_id[3:0]      ), //i
    .m_axi_0_rresp        (m_axi_hp_0_r_payload_resp[1:0]    ), //i
    .m_axi_0_rlast        (m_axi_hp_0_r_payload_last         ), //i
    .m_axi_1_awvalid      (dmaHp_m_axi_1_awvalid             ), //o
    .m_axi_1_awready      (m_axi_hp_1_aw_ready               ), //i
    .m_axi_1_awaddr       (dmaHp_m_axi_1_awaddr[31:0]        ), //o
    .m_axi_1_awid         (dmaHp_m_axi_1_awid[3:0]           ), //o
    .m_axi_1_awlen        (dmaHp_m_axi_1_awlen[7:0]          ), //o
    .m_axi_1_awsize       (dmaHp_m_axi_1_awsize[2:0]         ), //o
    .m_axi_1_awburst      (dmaHp_m_axi_1_awburst[1:0]        ), //o
    .m_axi_1_awcache      (dmaHp_m_axi_1_awcache[3:0]        ), //o
    .m_axi_1_awuser       (dmaHp_m_axi_1_awuser[3:0]         ), //o
    .m_axi_1_awprot       (dmaHp_m_axi_1_awprot[2:0]         ), //o
    .m_axi_1_wvalid       (dmaHp_m_axi_1_wvalid              ), //o
    .m_axi_1_wready       (m_axi_hp_1_w_ready                ), //i
    .m_axi_1_wdata        (dmaHp_m_axi_1_wdata[127:0]        ), //o
    .m_axi_1_wstrb        (dmaHp_m_axi_1_wstrb[15:0]         ), //o
    .m_axi_1_wlast        (dmaHp_m_axi_1_wlast               ), //o
    .m_axi_1_bvalid       (m_axi_hp_1_b_valid                ), //i
    .m_axi_1_bready       (dmaHp_m_axi_1_bready              ), //o
    .m_axi_1_bid          (m_axi_hp_1_b_payload_id[3:0]      ), //i
    .m_axi_1_bresp        (m_axi_hp_1_b_payload_resp[1:0]    ), //i
    .m_axi_1_arvalid      (dmaHp_m_axi_1_arvalid             ), //o
    .m_axi_1_arready      (m_axi_hp_1_ar_ready               ), //i
    .m_axi_1_araddr       (dmaHp_m_axi_1_araddr[31:0]        ), //o
    .m_axi_1_arid         (dmaHp_m_axi_1_arid[3:0]           ), //o
    .m_axi_1_arlen        (dmaHp_m_axi_1_arlen[7:0]          ), //o
    .m_axi_1_arsize       (dmaHp_m_axi_1_arsize[2:0]         ), //o
    .m_axi_1_arburst      (dmaHp_m_axi_1_arburst[1:0]        ), //o
    .m_axi_1_arcache      (dmaHp_m_axi_1_arcache[3:0]        ), //o
    .m_axi_1_aruser       (dmaHp_m_axi_1_aruser[3:0]         ), //o
    .m_axi_1_arprot       (dmaHp_m_axi_1_arprot[2:0]         ), //o
    .m_axi_1_rvalid       (m_axi_hp_1_r_valid                ), //i
    .m_axi_1_rready       (dmaHp_m_axi_1_rready              ), //o
    .m_axi_1_rdata        (m_axi_hp_1_r_payload_data[127:0]  ), //i
    .m_axi_1_rid          (m_axi_hp_1_r_payload_id[3:0]      ), //i
    .m_axi_1_rresp        (m_axi_hp_1_r_payload_resp[1:0]    ), //i
    .m_axi_1_rlast        (m_axi_hp_1_r_payload_last         ), //i
    .m_axi_2_awvalid      (dmaHp_m_axi_2_awvalid             ), //o
    .m_axi_2_awready      (m_axi_hp_2_aw_ready               ), //i
    .m_axi_2_awaddr       (dmaHp_m_axi_2_awaddr[31:0]        ), //o
    .m_axi_2_awid         (dmaHp_m_axi_2_awid[3:0]           ), //o
    .m_axi_2_awlen        (dmaHp_m_axi_2_awlen[7:0]          ), //o
    .m_axi_2_awsize       (dmaHp_m_axi_2_awsize[2:0]         ), //o
    .m_axi_2_awburst      (dmaHp_m_axi_2_awburst[1:0]        ), //o
    .m_axi_2_awcache      (dmaHp_m_axi_2_awcache[3:0]        ), //o
    .m_axi_2_awuser       (dmaHp_m_axi_2_awuser[3:0]         ), //o
    .m_axi_2_awprot       (dmaHp_m_axi_2_awprot[2:0]         ), //o
    .m_axi_2_wvalid       (dmaHp_m_axi_2_wvalid              ), //o
    .m_axi_2_wready       (m_axi_hp_2_w_ready                ), //i
    .m_axi_2_wdata        (dmaHp_m_axi_2_wdata[127:0]        ), //o
    .m_axi_2_wstrb        (dmaHp_m_axi_2_wstrb[15:0]         ), //o
    .m_axi_2_wlast        (dmaHp_m_axi_2_wlast               ), //o
    .m_axi_2_bvalid       (m_axi_hp_2_b_valid                ), //i
    .m_axi_2_bready       (dmaHp_m_axi_2_bready              ), //o
    .m_axi_2_bid          (m_axi_hp_2_b_payload_id[3:0]      ), //i
    .m_axi_2_bresp        (m_axi_hp_2_b_payload_resp[1:0]    ), //i
    .m_axi_2_arvalid      (dmaHp_m_axi_2_arvalid             ), //o
    .m_axi_2_arready      (m_axi_hp_2_ar_ready               ), //i
    .m_axi_2_araddr       (dmaHp_m_axi_2_araddr[31:0]        ), //o
    .m_axi_2_arid         (dmaHp_m_axi_2_arid[3:0]           ), //o
    .m_axi_2_arlen        (dmaHp_m_axi_2_arlen[7:0]          ), //o
    .m_axi_2_arsize       (dmaHp_m_axi_2_arsize[2:0]         ), //o
    .m_axi_2_arburst      (dmaHp_m_axi_2_arburst[1:0]        ), //o
    .m_axi_2_arcache      (dmaHp_m_axi_2_arcache[3:0]        ), //o
    .m_axi_2_aruser       (dmaHp_m_axi_2_aruser[3:0]         ), //o
    .m_axi_2_arprot       (dmaHp_m_axi_2_arprot[2:0]         ), //o
    .m_axi_2_rvalid       (m_axi_hp_2_r_valid                ), //i
    .m_axi_2_rready       (dmaHp_m_axi_2_rready              ), //o
    .m_axi_2_rdata        (m_axi_hp_2_r_payload_data[127:0]  ), //i
    .m_axi_2_rid          (m_axi_hp_2_r_payload_id[3:0]      ), //i
    .m_axi_2_rresp        (m_axi_hp_2_r_payload_resp[1:0]    ), //i
    .m_axi_2_rlast        (m_axi_hp_2_r_payload_last         ), //i
    .m_axi_3_awvalid      (dmaHp_m_axi_3_awvalid             ), //o
    .m_axi_3_awready      (m_axi_hp_3_aw_ready               ), //i
    .m_axi_3_awaddr       (dmaHp_m_axi_3_awaddr[31:0]        ), //o
    .m_axi_3_awid         (dmaHp_m_axi_3_awid[3:0]           ), //o
    .m_axi_3_awlen        (dmaHp_m_axi_3_awlen[7:0]          ), //o
    .m_axi_3_awsize       (dmaHp_m_axi_3_awsize[2:0]         ), //o
    .m_axi_3_awburst      (dmaHp_m_axi_3_awburst[1:0]        ), //o
    .m_axi_3_awcache      (dmaHp_m_axi_3_awcache[3:0]        ), //o
    .m_axi_3_awuser       (dmaHp_m_axi_3_awuser[3:0]         ), //o
    .m_axi_3_awprot       (dmaHp_m_axi_3_awprot[2:0]         ), //o
    .m_axi_3_wvalid       (dmaHp_m_axi_3_wvalid              ), //o
    .m_axi_3_wready       (m_axi_hp_3_w_ready                ), //i
    .m_axi_3_wdata        (dmaHp_m_axi_3_wdata[127:0]        ), //o
    .m_axi_3_wstrb        (dmaHp_m_axi_3_wstrb[15:0]         ), //o
    .m_axi_3_wlast        (dmaHp_m_axi_3_wlast               ), //o
    .m_axi_3_bvalid       (m_axi_hp_3_b_valid                ), //i
    .m_axi_3_bready       (dmaHp_m_axi_3_bready              ), //o
    .m_axi_3_bid          (m_axi_hp_3_b_payload_id[3:0]      ), //i
    .m_axi_3_bresp        (m_axi_hp_3_b_payload_resp[1:0]    ), //i
    .m_axi_3_arvalid      (dmaHp_m_axi_3_arvalid             ), //o
    .m_axi_3_arready      (m_axi_hp_3_ar_ready               ), //i
    .m_axi_3_araddr       (dmaHp_m_axi_3_araddr[31:0]        ), //o
    .m_axi_3_arid         (dmaHp_m_axi_3_arid[3:0]           ), //o
    .m_axi_3_arlen        (dmaHp_m_axi_3_arlen[7:0]          ), //o
    .m_axi_3_arsize       (dmaHp_m_axi_3_arsize[2:0]         ), //o
    .m_axi_3_arburst      (dmaHp_m_axi_3_arburst[1:0]        ), //o
    .m_axi_3_arcache      (dmaHp_m_axi_3_arcache[3:0]        ), //o
    .m_axi_3_aruser       (dmaHp_m_axi_3_aruser[3:0]         ), //o
    .m_axi_3_arprot       (dmaHp_m_axi_3_arprot[2:0]         ), //o
    .m_axi_3_rvalid       (m_axi_hp_3_r_valid                ), //i
    .m_axi_3_rready       (dmaHp_m_axi_3_rready              ), //o
    .m_axi_3_rdata        (m_axi_hp_3_r_payload_data[127:0]  ), //i
    .m_axi_3_rid          (m_axi_hp_3_r_payload_id[3:0]      ), //i
    .m_axi_3_rresp        (m_axi_hp_3_r_payload_resp[1:0]    ), //i
    .m_axi_3_rlast        (m_axi_hp_3_r_payload_last         ), //i
    .ctrl_aw_valid        (dmaHp_ctrl_aw_valid               ), //i
    .ctrl_aw_ready        (dmaHp_ctrl_aw_ready               ), //o
    .ctrl_aw_payload_addr (dmaHp_ctrl_aw_payload_addr[31:0]  ), //i
    .ctrl_aw_payload_prot (dmaHp_ctrl_aw_payload_prot[2:0]   ), //i
    .ctrl_w_valid         (dmaHp_ctrl_w_valid                ), //i
    .ctrl_w_ready         (dmaHp_ctrl_w_ready                ), //o
    .ctrl_w_payload_data  (dmaHp_ctrl_w_payload_data[31:0]   ), //i
    .ctrl_w_payload_strb  (dmaHp_ctrl_w_payload_strb[3:0]    ), //i
    .ctrl_b_valid         (dmaHp_ctrl_b_valid                ), //o
    .ctrl_b_ready         (dmaHp_ctrl_b_ready                ), //i
    .ctrl_b_payload_resp  (dmaHp_ctrl_b_payload_resp[1:0]    ), //o
    .ctrl_ar_valid        (dmaHp_ctrl_ar_valid               ), //i
    .ctrl_ar_ready        (dmaHp_ctrl_ar_ready               ), //o
    .ctrl_ar_payload_addr (dmaHp_ctrl_ar_payload_addr[31:0]  ), //i
    .ctrl_ar_payload_prot (dmaHp_ctrl_ar_payload_prot[2:0]   ), //i
    .ctrl_r_valid         (dmaHp_ctrl_r_valid                ), //o
    .ctrl_r_ready         (dmaHp_ctrl_r_ready                ), //i
    .ctrl_r_payload_data  (dmaHp_ctrl_r_payload_data[31:0]   ), //o
    .ctrl_r_payload_resp  (dmaHp_ctrl_r_payload_resp[1:0]    ), //o
    .aresetn              (aresetn                           ), //i
    .clk_0_clk            (clk_0_clk                         ), //i
    .clk_0_resetn         (clk_0_resetn                      )  //i
  );
  AxiBusDistributor_1 axi (
    .io_bus_valid          (cmdGen_local_bus_valid              ), //i
    .io_bus_ready          (axi_io_bus_ready                    ), //o
    .io_bus_payload_data   (cmdGen_local_bus_payload_data[511:0]), //i
    .io_bus_payload_keep   (t_io_bus_payload_keep[63:0]         ), //i
    .io_bus_payload_last   (cmdGen_local_bus_payload_last       ), //i
    .io_bus_payload_dest   (cmdGen_local_bus_payload_dest[5:0]  ), //i
    .io_token              (stateGen_2_status_token[12:0]       ), //i
    .io_preCfgTag          (engine_preCfgTag[5:0]               ), //i
    .io_postCfgTag         (engine_postCfgTag[5:0]              ), //i
    .io_enPredictor        (stateGen_2_status_enPredictor       ), //i
    .io_kSzOut_valid       (szPacker_io_kSzOut_valid            ), //i
    .io_kSzOut_ready       (axi_io_kSzOut_ready                 ), //o
    .io_kSzOut_payload     (szPacker_io_kSzOut_payload[31:0]    ), //i
    .io_vSzOut_valid       (szPacker_io_vSzOut_valid            ), //i
    .io_vSzOut_ready       (axi_io_vSzOut_ready                 ), //o
    .io_vSzOut_payload     (szPacker_io_vSzOut_payload[31:0]    ), //i
    .int_bus_valid         (axi_int_bus_valid                   ), //o
    .int_bus_ready         (busIn_io_bus_ready                  ), //i
    .int_bus_payload_last  (axi_int_bus_payload_last            ), //o
    .int_bus_payload_tdata (axi_int_bus_payload_tdata[511:0]    ), //o
    .int_bus_payload_tuser (axi_int_bus_payload_tuser[5:0]      ), //o
    .int_lnScale_valid     (axi_int_lnScale_valid               ), //o
    .int_lnScale_ready     (ln_io_lnScale_ready                 ), //i
    .int_lnScale_payload   (axi_int_lnScale_payload[15:0]       ), //o
    .int_zeroInt4_valid    (axi_int_zeroInt4_valid              ), //o
    .int_zeroInt4_ready    (busIn_io_zeroInt4_ready             ), //i
    .int_zeroInt4_payload  (axi_int_zeroInt4_payload[7:0]       ), //o
    .int_zeroInt8_valid    (axi_int_zeroInt8_valid              ), //o
    .int_zeroInt8_ready    (busIn_io_zeroInt8_ready             ), //i
    .int_zeroInt8_payload  (axi_int_zeroInt8_payload[7:0]       ), //o
    .int_preScale_valid    (axi_int_preScale_valid              ), //o
    .int_preScale_ready    (engine_preScale_tready              ), //i
    .int_preScale_payload  (axi_int_preScale_payload[15:0]      ), //o
    .int_postScale_valid   (axi_int_postScale_valid             ), //o
    .int_postScale_ready   (engine_postScale_tready             ), //i
    .int_postScale_payload (axi_int_postScale_payload[31:0]     ), //o
    .clk_0_clk             (clk_0_clk                           ), //i
    .clk_0_resetn          (clk_0_resetn                        )  //i
  );
  AttnSubMod_1 attn (
    .io_dotOut_valid                (engine_scalarOut_tvalid                 ), //i
    .io_dotOut_tdata                (engine_scalarOut_tdata[15:0]            ), //i
    .io_dotOut_tuser                (engine_scalarOut_tuser[5:0]             ), //i
    .io_ropeOut_valid               (attn_io_ropeOut_valid                   ), //o
    .io_ropeOut_tdata               (attn_io_ropeOut_tdata[15:0]             ), //o
    .io_ropeOut_tuser               (attn_io_ropeOut_tuser[5:0]              ), //o
    .io_softmaxOut_valid            (attn_io_softmaxOut_valid                ), //o
    .io_softmaxOut_payload_last     (attn_io_softmaxOut_payload_last         ), //o
    .io_softmaxOut_payload_tdata    (attn_io_softmaxOut_payload_tdata[15:0]  ), //o
    .io_softmaxOut_payload_tuser    (attn_io_softmaxOut_payload_tuser[5:0]   ), //o
    .io_quantZero_valid             (attn_io_quantZero_valid                 ), //o
    .io_quantZero_payload           (attn_io_quantZero_payload[7:0]          ), //o
    .io_quantScale_valid            (attn_io_quantScale_valid                ), //o
    .io_quantScale_payload          (attn_io_quantScale_payload[15:0]        ), //o
    .io_afterQuant_valid            (attn_io_afterQuant_valid                ), //o
    .io_afterQuant_payload_last     (attn_io_afterQuant_payload_last         ), //o
    .io_afterQuant_payload_fragment (attn_io_afterQuant_payload_fragment[7:0]), //o
    .status_token                   (stateGen_2_status_token[12:0]           ), //i
    .exp_to_valid                   (attn_exp_to_valid                       ), //o
    .exp_to_payload                 (attn_exp_to_payload[15:0]               ), //o
    .exp_from_valid                 (attn_exp_from_valid                     ), //i
    .exp_from_payload               (attn_exp_from_payload[15:0]             ), //i
    .clk_0_clk                      (clk_0_clk                               ), //i
    .clk_0_resetn                   (clk_0_resetn                            )  //i
  );
  NormSubModNew_1 ln (
    .io_allGatherOut_valid (node_allGatherOut_tvalid     ), //i
    .io_allGatherOut_tdata (node_allGatherOut_tdata[15:0]), //i
    .io_allGatherOut_tuser (node_allGatherOut_tuser[5:0] ), //i
    .io_allReduceOut_valid (node_allReduceOut_tvalid     ), //i
    .io_allReduceOut_tdata (node_allReduceOut_tdata[15:0]), //i
    .io_allReduceOut_tuser (node_allReduceOut_tuser[5:0] ), //i
    .io_lnScale_valid      (axi_int_lnScale_valid        ), //i
    .io_lnScale_ready      (ln_io_lnScale_ready          ), //o
    .io_lnScale_payload    (axi_int_lnScale_payload[15:0]), //i
    .io_lnOut_valid        (ln_io_lnOut_valid            ), //o
    .io_lnOut_tdata        (ln_io_lnOut_tdata[15:0]      ), //o
    .io_lnOut_tuser        (ln_io_lnOut_tuser[5:0]       ), //o
    .status_toLogitsGen    (stateGen_2_status_toLogitsGen), //i
    .clk_0_clk             (clk_0_clk                    ), //i
    .clk_0_resetn          (clk_0_resetn                 )  //i
  );
  ScalarOutSubMod_1 sOut (
    .io_p2sOut_valid                   (sOut_io_p2sOut_valid                    ), //i
    .io_p2sOut_tdata                   (sOut_io_p2sOut_tdata[15:0]              ), //i
    .io_p2sOut_tuser                   (sOut_io_p2sOut_tuser[5:0]               ), //i
    .io_allReduceOut_valid             (node_allReduceOut_tvalid                ), //i
    .io_allReduceOut_tdata             (node_allReduceOut_tdata[15:0]           ), //i
    .io_allReduceOut_tuser             (node_allReduceOut_tuser[5:0]            ), //i
    .io_softmaxOut_valid               (attn_io_softmaxOut_valid                ), //i
    .io_softmaxOut_payload_last        (attn_io_softmaxOut_payload_last         ), //i
    .io_softmaxOut_payload_tdata       (attn_io_softmaxOut_payload_tdata[15:0]  ), //i
    .io_softmaxOut_payload_tuser       (attn_io_softmaxOut_payload_tuser[5:0]   ), //i
    .io_scalarOut_valid                (sOut_io_scalarOut_valid                 ), //o
    .io_scalarOut_ready                (engine_axpyIn_tready                    ), //i
    .io_scalarOut_payload              (sOut_io_scalarOut_payload[15:0]         ), //o
    .io_allGatherIndexIn_valid         (node_indexOut_tvalid                    ), //i
    .io_allGatherIndexIn_payload_last  (node_indexOut_tlast                     ), //i
    .io_allGatherIndexIn_payload_tdata (node_indexOut_tdata[15:0]               ), //i
    .io_allGatherIndexIn_payload_tuser (node_indexOut_tuser[5:0]                ), //i
    .io_zfIndexOut_valid               (sOut_io_zfIndexOut_valid                ), //o
    .io_zfIndexOut_payload_last        (sOut_io_zfIndexOut_payload_last         ), //o
    .io_zfIndexOut_payload_tdata       (sOut_io_zfIndexOut_payload_tdata[15:0]  ), //o
    .io_zfIndexOut_payload_tuser       (sOut_io_zfIndexOut_payload_tuser[5:0]   ), //o
    .io_gateIndexOut_valid             (sOut_io_gateIndexOut_valid              ), //o
    .io_gateIndexOut_payload_last      (sOut_io_gateIndexOut_payload_last       ), //o
    .io_gateIndexOut_payload_tdata     (sOut_io_gateIndexOut_payload_tdata[15:0]), //o
    .io_gateIndexOut_payload_tuser     (sOut_io_gateIndexOut_payload_tuser[5:0] ), //o
    .io_ugIndexOut_valid               (sOut_io_ugIndexOut_valid                ), //o
    .io_ugIndexOut_payload_last        (sOut_io_ugIndexOut_payload_last         ), //o
    .io_ugIndexOut_payload_tdata       (sOut_io_ugIndexOut_payload_tdata[15:0]  ), //o
    .io_ugIndexOut_payload_tuser       (sOut_io_ugIndexOut_payload_tuser[5:0]   ), //o
    .clk_0_clk                         (clk_0_clk                               ), //i
    .status_enPredictor                (stateGen_2_status_enPredictor           ), //i
    .status_enFatRelu                  (1'b0                                    ), //i
    .silu_to_valid                     (sOut_silu_to_valid                      ), //o
    .silu_to_payload                   (sOut_silu_to_payload[15:0]              ), //o
    .silu_from_valid                   (siluAct_io_out_valid                    ), //i
    .silu_from_payload                 (siluAct_io_out_payload[15:0]            ), //i
    .clk_0_resetn                      (clk_0_resetn                            )  //i
  );
  BusInSubModNew_1 busIn (
    .io_bus_valid            (axi_int_bus_valid                  ), //i
    .io_bus_ready            (busIn_io_bus_ready                 ), //o
    .io_bus_payload_last     (axi_int_bus_payload_last           ), //i
    .io_bus_payload_tdata    (axi_int_bus_payload_tdata[511:0]   ), //i
    .io_bus_payload_tuser    (axi_int_bus_payload_tuser[5:0]     ), //i
    .io_vecIn_valid          (engine_vecOut_tvalid               ), //i
    .io_vecIn_tdata          (engine_vecOut_tdata[2047:0]        ), //i
    .io_vecIn_tuser          (engine_vecOut_tuser[5:0]           ), //i
    .io_vLocal_valid         (vecOut_io_vLocal_valid             ), //i
    .io_vLocal_tdata         (vecOut_io_vLocal_tdata[2047:0]     ), //i
    .io_vLocal_tuser         (vecOut_io_vLocal_tuser[5:0]        ), //i
    .io_zeroInt4_valid       (axi_int_zeroInt4_valid             ), //i
    .io_zeroInt4_ready       (busIn_io_zeroInt4_ready            ), //o
    .io_zeroInt4_payload     (axi_int_zeroInt4_payload[7:0]      ), //i
    .io_zeroInt8_valid       (axi_int_zeroInt8_valid             ), //i
    .io_zeroInt8_ready       (busIn_io_zeroInt8_ready            ), //o
    .io_zeroInt8_payload     (axi_int_zeroInt8_payload[7:0]      ), //i
    .io_wkv_valid            (busIn_io_wkv_valid                 ), //o
    .io_wkv_ready            (engine_wkvIn_tready                ), //i
    .io_wkv_payload          (busIn_io_wkv_payload[2047:0]       ), //o
    .io_p2sOut_valid         (busIn_io_p2sOut_valid              ), //o
    .io_p2sOut_payload_last  (busIn_io_p2sOut_payload_last       ), //o
    .io_p2sOut_payload_tdata (busIn_io_p2sOut_payload_tdata[15:0]), //o
    .io_p2sOut_payload_tuser (busIn_io_p2sOut_payload_tuser[5:0] ), //o
    .io_toResBuf_valid       (busIn_io_toResBuf_valid            ), //o
    .io_toResBuf_payload     (busIn_io_toResBuf_payload[2047:0]  ), //o
    .io_directOut_valid      (busIn_io_directOut_valid           ), //o
    .io_directOut_tdata      (busIn_io_directOut_tdata[2047:0]   ), //o
    .io_directOut_tuser      (busIn_io_directOut_tuser[5:0]      ), //o
    .status_tokenNextHit     (stateGen_2_status_tokenNextHit     ), //i
    .status_mlpNextHit       (stateGen_2_status_mlpNextHit       ), //i
    .status_vNextHit         (stateGen_2_status_vNextHit         ), //i
    .status_flushRes         (stateGen_2_status_flushRes         ), //i
    .status_logitsGen        (stateGen_2_status_logitsGen        ), //i
    .clk_0_clk               (clk_0_clk                          ), //i
    .clk_0_resetn            (clk_0_resetn                       )  //i
  );
  VecOutSubMod_1 vecOut (
    .io_lnOut_valid                (ln_io_lnOut_valid               ), //i
    .io_lnOut_tdata                (ln_io_lnOut_tdata[15:0]         ), //i
    .io_lnOut_tuser                (ln_io_lnOut_tuser[5:0]          ), //i
    .io_dotOut_valid               (engine_scalarOut_tvalid         ), //i
    .io_dotOut_tdata               (engine_scalarOut_tdata[15:0]    ), //i
    .io_dotOut_tuser               (engine_scalarOut_tuser[5:0]     ), //i
    .io_ropeOut_valid              (attn_io_ropeOut_valid           ), //i
    .io_ropeOut_tdata              (attn_io_ropeOut_tdata[15:0]     ), //i
    .io_ropeOut_tuser              (attn_io_ropeOut_tuser[5:0]      ), //i
    .io_busVecIn_valid             (busIn_io_directOut_valid        ), //i
    .io_busVecIn_tdata             (busIn_io_directOut_tdata[2047:0]), //i
    .io_busVecIn_tuser             (busIn_io_directOut_tuser[5:0]   ), //i
    .io_engineVecIn_valid          (engine_vecOut_tvalid            ), //i
    .io_engineVecIn_tdata          (engine_vecOut_tdata[2047:0]     ), //i
    .io_engineVecIn_tuser          (engine_vecOut_tuser[5:0]        ), //i
    .io_vLocal_valid               (vecOut_io_vLocal_valid          ), //o
    .io_vLocal_tdata               (vecOut_io_vLocal_tdata[2047:0]  ), //o
    .io_vLocal_tuser               (vecOut_io_vLocal_tuser[5:0]     ), //o
    .io_vecOut_valid               (vecOut_io_vecOut_valid          ), //o
    .io_vecOut_ready               (engine_dotIn_tready             ), //i
    .io_vecOut_payload             (vecOut_io_vecOut_payload[2047:0]), //o
    .status_tokenIndexFlow_valid   (tokenIndexPipe_valid            ), //i
    .status_tokenIndexFlow_payload (tokenIndexPipe_tuser[5:0]       ), //i
    .status_enPredictor            (stateGen_2_status_enPredictor   ), //i
    .clk_0_clk                     (clk_0_clk                       ), //i
    .clk_0_resetn                  (clk_0_resetn                    )  //i
  );
  ResidualBuffer_1 resBuf (
    .serialIn_tvalid    (resAdd_io_toResBuf_valid         ), //i
    .serialIn_tdata     (resAdd_io_toResBuf_payload[15:0] ), //i
    .parallelIn_tvalid  (busIn_io_toResBuf_valid          ), //i
    .parallelIn_tdata   (busIn_io_toResBuf_payload[2047:0]), //i
    .serialOut_tvalid   (resBuf_serialOut_tvalid          ), //o
    .serialOut_tready   (resAdd_io_fromResBuf_ready       ), //i
    .serialOut_tdata    (resBuf_serialOut_tdata[15:0]     ), //o
    .parallelOut_tvalid (resBuf_parallelOut_tvalid        ), //o
    .parallelOut_tready (engine_resAdd_tready             ), //i
    .parallelOut_tdata  (resBuf_parallelOut_tdata[2047:0] ), //o
    .clk_0_clk          (clk_0_clk                        ), //i
    .clk_0_resetn       (clk_0_resetn                     )  //i
  );
  SerialResAdd_1 resAdd (
    .io_dotOut_valid                   (engine_scalarOut_tvalid                       ), //i
    .io_dotOut_tdata                   (engine_scalarOut_tdata[15:0]                  ), //i
    .io_dotOut_tuser                   (engine_scalarOut_tuser[5:0]                   ), //i
    .io_output_valid                   (resAdd_io_output_valid                        ), //o
    .io_output_payload_last            (resAdd_io_output_payload_last                 ), //o
    .io_output_payload_tdata           (resAdd_io_output_payload_tdata[15:0]          ), //o
    .io_output_payload_tuser           (resAdd_io_output_payload_tuser[5:0]           ), //o
    .io_fromAllReduce_valid            (node_allReduceOut_tvalid                      ), //i
    .io_fromAllReduce_tdata            (node_allReduceOut_tdata[15:0]                 ), //i
    .io_fromAllReduce_tuser            (node_allReduceOut_tuser[5:0]                  ), //i
    .io_fromResBuf_valid               (resBuf_serialOut_tvalid                       ), //i
    .io_fromResBuf_ready               (resAdd_io_fromResBuf_ready                    ), //o
    .io_fromResBuf_payload             (resBuf_serialOut_tdata[15:0]                  ), //i
    .io_toResBuf_valid                 (resAdd_io_toResBuf_valid                      ), //o
    .io_toResBuf_payload               (resAdd_io_toResBuf_payload[15:0]              ), //o
    .clk_0_clk                         (clk_0_clk                                     ), //i
    .multiCore2Res_resAddProbe_valid   (resAdd_multiCore2Res_resAddProbe_valid        ), //o
    .multiCore2Res_resAddProbe_payload (resAdd_multiCore2Res_resAddProbe_payload[15:0]), //o
    .clk_0_resetn                      (clk_0_resetn                                  )  //i
  );
  MulAddSGNew_1 engine (
    .wkvIn_tvalid     (busIn_io_wkv_valid               ), //i
    .wkvIn_tready     (engine_wkvIn_tready              ), //o
    .wkvIn_tdata      (busIn_io_wkv_payload[2047:0]     ), //i
    .dotIn_tvalid     (vecOut_io_vecOut_valid           ), //i
    .dotIn_tready     (engine_dotIn_tready              ), //o
    .dotIn_tdata      (vecOut_io_vecOut_payload[2047:0] ), //i
    .resAdd_tvalid    (resBuf_parallelOut_tvalid        ), //i
    .resAdd_tready    (engine_resAdd_tready             ), //o
    .resAdd_tdata     (resBuf_parallelOut_tdata[2047:0] ), //i
    .axpyIn_tvalid    (sOut_io_scalarOut_valid          ), //i
    .axpyIn_tready    (engine_axpyIn_tready             ), //o
    .axpyIn_tdata     (sOut_io_scalarOut_payload[15:0]  ), //i
    .preScale_tvalid  (axi_int_preScale_valid           ), //i
    .preScale_tready  (engine_preScale_tready           ), //o
    .preScale_tdata   (axi_int_preScale_payload[15:0]   ), //i
    .postScale_tvalid (axi_int_postScale_valid          ), //i
    .postScale_tready (engine_postScale_tready          ), //o
    .postScale_tdata  (axi_int_postScale_payload[31:0]  ), //i
    .vecOut_tvalid    (engine_vecOut_tvalid             ), //o
    .vecOut_tdata     (engine_vecOut_tdata[2047:0]      ), //o
    .vecOut_tuser     (engine_vecOut_tuser[5:0]         ), //o
    .scalarOut_tvalid (engine_scalarOut_tvalid          ), //o
    .scalarOut_tdata  (engine_scalarOut_tdata[15:0]     ), //o
    .scalarOut_tuser  (engine_scalarOut_tuser[5:0]      ), //o
    .cfg_tvalid       (cfgInsert_io_cfgOut_valid        ), //i
    .cfg_tready       (engine_cfg_tready                ), //o
    .cfg_tdata        (cfgInsert_io_cfgOut_payload[31:0]), //i
    .preCfgTag        (engine_preCfgTag[5:0]            ), //o
    .postCfgTag       (engine_postCfgTag[5:0]           ), //o
    .clk_0_clk        (clk_0_clk                        ), //i
    .clk_0_resetn     (clk_0_resetn                     )  //i
  );
  AllGatherSubModNew_1 node (
    .dotOut_valid              (engine_scalarOut_tvalid                 ), //i
    .dotOut_tdata              (engine_scalarOut_tdata[15:0]            ), //i
    .dotOut_tuser              (engine_scalarOut_tuser[5:0]             ), //i
    .resOut_valid              (resAdd_io_output_valid                  ), //i
    .resOut_payload_last       (resAdd_io_output_payload_last           ), //i
    .resOut_payload_tdata      (resAdd_io_output_payload_tdata[15:0]    ), //i
    .resOut_payload_tuser      (resAdd_io_output_payload_tuser[5:0]     ), //i
    .p2sOut_valid              (busIn_io_p2sOut_valid                   ), //i
    .p2sOut_payload_last       (busIn_io_p2sOut_payload_last            ), //i
    .p2sOut_payload_tdata      (busIn_io_p2sOut_payload_tdata[15:0]     ), //i
    .p2sOut_payload_tuser      (busIn_io_p2sOut_payload_tuser[5:0]      ), //i
    .allGatherOut_tvalid       (node_allGatherOut_tvalid                ), //o
    .allGatherOut_tdata        (node_allGatherOut_tdata[15:0]           ), //o
    .allGatherOut_tuser        (node_allGatherOut_tuser[5:0]            ), //o
    .allReduceOut_tvalid       (node_allReduceOut_tvalid                ), //o
    .allReduceOut_tdata        (node_allReduceOut_tdata[15:0]           ), //o
    .allReduceOut_tuser        (node_allReduceOut_tuser[5:0]            ), //o
    .indexIn_valid             (sOut_io_zfIndexOut_valid                ), //i
    .indexIn_payload_last      (sOut_io_zfIndexOut_payload_last         ), //i
    .indexIn_payload_tdata     (sOut_io_zfIndexOut_payload_tdata[15:0]  ), //i
    .indexIn_payload_tuser     (sOut_io_zfIndexOut_payload_tuser[5:0]   ), //i
    .gateIndexIn_valid         (sOut_io_gateIndexOut_valid              ), //i
    .gateIndexIn_payload_last  (sOut_io_gateIndexOut_payload_last       ), //i
    .gateIndexIn_payload_tdata (sOut_io_gateIndexOut_payload_tdata[15:0]), //i
    .gateIndexIn_payload_tuser (sOut_io_gateIndexOut_payload_tuser[5:0] ), //i
    .ugIndexIn_valid           (sOut_io_ugIndexOut_valid                ), //i
    .ugIndexIn_payload_last    (sOut_io_ugIndexOut_payload_last         ), //i
    .ugIndexIn_payload_tdata   (sOut_io_ugIndexOut_payload_tdata[15:0]  ), //i
    .ugIndexIn_payload_tuser   (sOut_io_ugIndexOut_payload_tuser[5:0]   ), //i
    .indexOut_tvalid           (node_indexOut_tvalid                    ), //o
    .indexOut_tlast            (node_indexOut_tlast                     ), //o
    .indexOut_tdata            (node_indexOut_tdata[15:0]               ), //o
    .indexOut_tuser            (node_indexOut_tuser[5:0]                ), //o
    .c2c_from_valid            (c2c_from_valid                          ), //i
    .c2c_from_ready            (node_c2c_from_ready                     ), //o
    .c2c_from_payload_last     (c2c_from_payload_last                   ), //i
    .c2c_from_payload_tdata    (c2c_from_payload_tdata[15:0]            ), //i
    .c2c_from_payload_tuser    (c2c_from_payload_tuser[5:0]             ), //i
    .c2c_from_payload_tdest    (c2c_from_payload_tdest                  ), //i
    .c2c_to_valid              (node_c2c_to_valid                       ), //o
    .c2c_to_payload_last       (node_c2c_to_payload_last                ), //o
    .c2c_to_payload_tdata      (node_c2c_to_payload_tdata[15:0]         ), //o
    .c2c_to_payload_tuser      (node_c2c_to_payload_tuser[5:0]          ), //o
    .c2c_to_payload_tdest      (node_c2c_to_payload_tdest               ), //o
    .clk_0_resetn              (clk_0_resetn                            ), //i
    .clk_0_clk                 (clk_0_clk                               )  //i
  );
  InsertCfg_1 cfgInsert (
    .io_cfgIn_valid         (cfgGen_io_cfg_valid              ), //i
    .io_cfgIn_ready         (cfgInsert_io_cfgIn_ready         ), //o
    .io_cfgIn_payload       (cfgGen_io_cfg_payload[31:0]      ), //i
    .io_cfgOut_valid        (cfgInsert_io_cfgOut_valid        ), //o
    .io_cfgOut_ready        (engine_cfg_tready                ), //i
    .io_cfgOut_payload      (cfgInsert_io_cfgOut_payload[31:0]), //o
    .io_gtCnt_valid         (cfgInsert_io_gtCnt_valid         ), //o
    .io_gtCnt_payload       (cfgInsert_io_gtCnt_payload[15:0] ), //o
    .io_index_valid         (node_indexOut_tvalid             ), //i
    .io_index_payload_last  (node_indexOut_tlast              ), //i
    .io_index_payload_tdata (node_indexOut_tdata[15:0]        ), //i
    .io_index_payload_tuser (node_indexOut_tuser[5:0]         ), //i
    .status_enPredictor     (stateGen_2_status_enPredictor    ), //i
    .clk_0_clk              (clk_0_clk                        ), //i
    .clk_0_resetn           (clk_0_resetn                     )  //i
  );
  GreedySampler_1 sample (
    .logits_valid  (node_allReduceOut_tvalid     ), //i
    .logits_tdata  (node_allReduceOut_tdata[15:0]), //i
    .logits_tuser  (node_allReduceOut_tuser[5:0] ), //i
    .argmax_tvalid (sample_argmax_tvalid         ), //o
    .argmax_tdata  (sample_argmax_tdata[16:0]    ), //o
    .endOfDecode   (sample_endOfDecode           ), //o
    .clk_0_clk     (clk_0_clk                    ), //i
    .clk_0_resetn  (clk_0_resetn                 )  //i
  );
  SiluFp32_1 siluAct (
    .io_in_valid    (sOut_silu_to_valid          ), //i
    .io_in_payload  (sOut_silu_to_payload[15:0]  ), //i
    .io_out_valid   (siluAct_io_out_valid        ), //o
    .io_out_payload (siluAct_io_out_payload[15:0]), //o
    .clk_0_clk      (clk_0_clk                   ), //i
    .clk_0_resetn   (clk_0_resetn                )  //i
  );
  KvScaleZeroPacker_1 szPacker (
    .io_qScale_valid           (attn_io_quantScale_valid                 ), //i
    .io_qScale_payload         (attn_io_quantScale_payload[15:0]         ), //i
    .io_qZero_valid            (attn_io_quantZero_valid                  ), //i
    .io_qZero_payload          (attn_io_quantZero_payload[7:0]           ), //i
    .io_qOut_valid             (attn_io_afterQuant_valid                 ), //i
    .io_qOut_payload_last      (attn_io_afterQuant_payload_last          ), //i
    .io_qOut_payload_fragment  (attn_io_afterQuant_payload_fragment[7:0] ), //i
    .io_kvBus_valid            (szPacker_io_kvBus_valid                  ), //o
    .io_kvBus_ready            (cmdGen_local_kvBus_ready                 ), //i
    .io_kvBus_payload_last     (szPacker_io_kvBus_payload_last           ), //o
    .io_kvBus_payload_fragment (szPacker_io_kvBus_payload_fragment[511:0]), //o
    .io_kSzOut_valid           (szPacker_io_kSzOut_valid                 ), //o
    .io_kSzOut_ready           (axi_io_kSzOut_ready                      ), //i
    .io_kSzOut_payload         (szPacker_io_kSzOut_payload[31:0]         ), //o
    .io_vSzOut_valid           (szPacker_io_vSzOut_valid                 ), //o
    .io_vSzOut_ready           (axi_io_vSzOut_ready                      ), //i
    .io_vSzOut_payload         (szPacker_io_vSzOut_payload[31:0]         ), //o
    .io_nextLayer              (stateGen_2_status_nextLayer              ), //i
    .io_tokenIndexFlow_valid   (tokenIndexPipe_valid                     ), //i
    .io_tokenIndexFlow_payload (tokenIndexPipe_tuser[5:0]                ), //i
    .clk_0_clk                 (clk_0_clk                                ), //i
    .clk_0_resetn              (clk_0_resetn                             )  //i
  );
  GenCfg_1 cfgGen (
    .io_cfg_valid                  (cfgGen_io_cfg_valid          ), //o
    .io_cfg_ready                  (cfgInsert_io_cfgIn_ready     ), //i
    .io_cfg_payload                (cfgGen_io_cfg_payload[31:0]  ), //o
    .status_tokenIndexFlow_valid   (tokenIndexPipe_valid         ), //i
    .status_tokenIndexFlow_payload (tokenIndexPipe_tuser[5:0]    ), //i
    .status_enPredictor            (stateGen_2_status_enPredictor), //i
    .clk_0_clk                     (clk_0_clk                    ), //i
    .clk_0_resetn                  (clk_0_resetn                 )  //i
  );
  StateGen_1 stateGen_2 (
    .io_busIn_valid            (coreArea_0_core_axi_int_bus_fire  ), //i
    .io_busIn_payload_last     (axi_int_bus_payload_last          ), //i
    .io_busIn_payload_fragment (axi_int_bus_payload_tuser[5:0]    ), //i
    .io_engineOut_valid        (engine_vecOut_tvalid              ), //i
    .io_engineOut_payload      (engine_vecOut_tuser[5:0]          ), //i
    .io_dotOut_valid           (engine_scalarOut_tvalid           ), //i
    .io_dotOut_payload         (engine_scalarOut_tuser[5:0]       ), //i
    .io_gtCnt_valid            (cfgInsert_io_gtCnt_valid          ), //i
    .io_gtCnt_payload          (cfgInsert_io_gtCnt_payload[15:0]  ), //i
    .io_tokenIndexFlow_valid   (tokenIndexPipe_valid              ), //i
    .io_tokenIndexFlow_payload (tokenIndexPipe_tuser[5:0]         ), //i
    .status_argmaxVld          (sample_argmax_tvalid              ), //i
    .status_endOfDecode        (sample_endOfDecode                ), //i
    .status_enPredictor        (stateGen_2_status_enPredictor     ), //o
    .status_enProSparse        (stateGen_2_status_enProSparse     ), //o
    .status_tokenNextHit       (stateGen_2_status_tokenNextHit    ), //o
    .status_mlpNextHit         (stateGen_2_status_mlpNextHit      ), //o
    .status_vNextHit           (stateGen_2_status_vNextHit        ), //o
    .status_prefill            (stateGen_2_status_prefill         ), //o
    .status_flushRes           (stateGen_2_status_flushRes        ), //o
    .status_nextLayer          (stateGen_2_status_nextLayer       ), //o
    .status_nonZeroCnt         (stateGen_2_status_nonZeroCnt[15:0]), //o
    .status_logitsGen          (stateGen_2_status_logitsGen       ), //o
    .status_toLogitsGen        (stateGen_2_status_toLogitsGen     ), //o
    .status_token              (stateGen_2_status_token[12:0]     ), //o
    .status_layerCnt           (stateGen_2_status_layerCnt[4:0]   ), //o
    .clk_0_clk                 (clk_0_clk                         ), //i
    .clk_0_resetn              (clk_0_resetn                      )  //i
  );
  assign tokenIndex_ready = 1'b1;
  assign m_axi_hp_0_ar_valid = dmaHp_m_axi_0_arvalid;
  assign m_axi_hp_0_ar_payload_addr = dmaHp_m_axi_0_araddr;
  assign m_axi_hp_0_ar_payload_id = dmaHp_m_axi_0_arid;
  assign m_axi_hp_0_ar_payload_len = dmaHp_m_axi_0_arlen;
  assign m_axi_hp_0_ar_payload_size = dmaHp_m_axi_0_arsize;
  assign m_axi_hp_0_ar_payload_burst = dmaHp_m_axi_0_arburst;
  assign m_axi_hp_0_ar_payload_cache = dmaHp_m_axi_0_arcache;
  assign m_axi_hp_0_ar_payload_user = dmaHp_m_axi_0_aruser;
  assign m_axi_hp_0_ar_payload_prot = dmaHp_m_axi_0_arprot;
  assign m_axi_hp_0_aw_valid = dmaHp_m_axi_0_awvalid;
  assign m_axi_hp_0_aw_payload_addr = dmaHp_m_axi_0_awaddr;
  assign m_axi_hp_0_aw_payload_id = dmaHp_m_axi_0_awid;
  assign m_axi_hp_0_aw_payload_len = dmaHp_m_axi_0_awlen;
  assign m_axi_hp_0_aw_payload_size = dmaHp_m_axi_0_awsize;
  assign m_axi_hp_0_aw_payload_burst = dmaHp_m_axi_0_awburst;
  assign m_axi_hp_0_aw_payload_cache = dmaHp_m_axi_0_awcache;
  assign m_axi_hp_0_aw_payload_user = dmaHp_m_axi_0_awuser;
  assign m_axi_hp_0_aw_payload_prot = dmaHp_m_axi_0_awprot;
  assign m_axi_hp_0_w_valid = dmaHp_m_axi_0_wvalid;
  assign m_axi_hp_0_w_payload_data = dmaHp_m_axi_0_wdata;
  assign m_axi_hp_0_w_payload_strb = dmaHp_m_axi_0_wstrb;
  assign m_axi_hp_0_w_payload_last = dmaHp_m_axi_0_wlast;
  assign m_axi_hp_0_r_ready = dmaHp_m_axi_0_rready;
  assign m_axi_hp_0_b_ready = dmaHp_m_axi_0_bready;
  assign m_axi_hp_1_ar_valid = dmaHp_m_axi_1_arvalid;
  assign m_axi_hp_1_ar_payload_addr = dmaHp_m_axi_1_araddr;
  assign m_axi_hp_1_ar_payload_id = dmaHp_m_axi_1_arid;
  assign m_axi_hp_1_ar_payload_len = dmaHp_m_axi_1_arlen;
  assign m_axi_hp_1_ar_payload_size = dmaHp_m_axi_1_arsize;
  assign m_axi_hp_1_ar_payload_burst = dmaHp_m_axi_1_arburst;
  assign m_axi_hp_1_ar_payload_cache = dmaHp_m_axi_1_arcache;
  assign m_axi_hp_1_ar_payload_user = dmaHp_m_axi_1_aruser;
  assign m_axi_hp_1_ar_payload_prot = dmaHp_m_axi_1_arprot;
  assign m_axi_hp_1_aw_valid = dmaHp_m_axi_1_awvalid;
  assign m_axi_hp_1_aw_payload_addr = dmaHp_m_axi_1_awaddr;
  assign m_axi_hp_1_aw_payload_id = dmaHp_m_axi_1_awid;
  assign m_axi_hp_1_aw_payload_len = dmaHp_m_axi_1_awlen;
  assign m_axi_hp_1_aw_payload_size = dmaHp_m_axi_1_awsize;
  assign m_axi_hp_1_aw_payload_burst = dmaHp_m_axi_1_awburst;
  assign m_axi_hp_1_aw_payload_cache = dmaHp_m_axi_1_awcache;
  assign m_axi_hp_1_aw_payload_user = dmaHp_m_axi_1_awuser;
  assign m_axi_hp_1_aw_payload_prot = dmaHp_m_axi_1_awprot;
  assign m_axi_hp_1_w_valid = dmaHp_m_axi_1_wvalid;
  assign m_axi_hp_1_w_payload_data = dmaHp_m_axi_1_wdata;
  assign m_axi_hp_1_w_payload_strb = dmaHp_m_axi_1_wstrb;
  assign m_axi_hp_1_w_payload_last = dmaHp_m_axi_1_wlast;
  assign m_axi_hp_1_r_ready = dmaHp_m_axi_1_rready;
  assign m_axi_hp_1_b_ready = dmaHp_m_axi_1_bready;
  assign m_axi_hp_2_ar_valid = dmaHp_m_axi_2_arvalid;
  assign m_axi_hp_2_ar_payload_addr = dmaHp_m_axi_2_araddr;
  assign m_axi_hp_2_ar_payload_id = dmaHp_m_axi_2_arid;
  assign m_axi_hp_2_ar_payload_len = dmaHp_m_axi_2_arlen;
  assign m_axi_hp_2_ar_payload_size = dmaHp_m_axi_2_arsize;
  assign m_axi_hp_2_ar_payload_burst = dmaHp_m_axi_2_arburst;
  assign m_axi_hp_2_ar_payload_cache = dmaHp_m_axi_2_arcache;
  assign m_axi_hp_2_ar_payload_user = dmaHp_m_axi_2_aruser;
  assign m_axi_hp_2_ar_payload_prot = dmaHp_m_axi_2_arprot;
  assign m_axi_hp_2_aw_valid = dmaHp_m_axi_2_awvalid;
  assign m_axi_hp_2_aw_payload_addr = dmaHp_m_axi_2_awaddr;
  assign m_axi_hp_2_aw_payload_id = dmaHp_m_axi_2_awid;
  assign m_axi_hp_2_aw_payload_len = dmaHp_m_axi_2_awlen;
  assign m_axi_hp_2_aw_payload_size = dmaHp_m_axi_2_awsize;
  assign m_axi_hp_2_aw_payload_burst = dmaHp_m_axi_2_awburst;
  assign m_axi_hp_2_aw_payload_cache = dmaHp_m_axi_2_awcache;
  assign m_axi_hp_2_aw_payload_user = dmaHp_m_axi_2_awuser;
  assign m_axi_hp_2_aw_payload_prot = dmaHp_m_axi_2_awprot;
  assign m_axi_hp_2_w_valid = dmaHp_m_axi_2_wvalid;
  assign m_axi_hp_2_w_payload_data = dmaHp_m_axi_2_wdata;
  assign m_axi_hp_2_w_payload_strb = dmaHp_m_axi_2_wstrb;
  assign m_axi_hp_2_w_payload_last = dmaHp_m_axi_2_wlast;
  assign m_axi_hp_2_r_ready = dmaHp_m_axi_2_rready;
  assign m_axi_hp_2_b_ready = dmaHp_m_axi_2_bready;
  assign m_axi_hp_3_ar_valid = dmaHp_m_axi_3_arvalid;
  assign m_axi_hp_3_ar_payload_addr = dmaHp_m_axi_3_araddr;
  assign m_axi_hp_3_ar_payload_id = dmaHp_m_axi_3_arid;
  assign m_axi_hp_3_ar_payload_len = dmaHp_m_axi_3_arlen;
  assign m_axi_hp_3_ar_payload_size = dmaHp_m_axi_3_arsize;
  assign m_axi_hp_3_ar_payload_burst = dmaHp_m_axi_3_arburst;
  assign m_axi_hp_3_ar_payload_cache = dmaHp_m_axi_3_arcache;
  assign m_axi_hp_3_ar_payload_user = dmaHp_m_axi_3_aruser;
  assign m_axi_hp_3_ar_payload_prot = dmaHp_m_axi_3_arprot;
  assign m_axi_hp_3_aw_valid = dmaHp_m_axi_3_awvalid;
  assign m_axi_hp_3_aw_payload_addr = dmaHp_m_axi_3_awaddr;
  assign m_axi_hp_3_aw_payload_id = dmaHp_m_axi_3_awid;
  assign m_axi_hp_3_aw_payload_len = dmaHp_m_axi_3_awlen;
  assign m_axi_hp_3_aw_payload_size = dmaHp_m_axi_3_awsize;
  assign m_axi_hp_3_aw_payload_burst = dmaHp_m_axi_3_awburst;
  assign m_axi_hp_3_aw_payload_cache = dmaHp_m_axi_3_awcache;
  assign m_axi_hp_3_aw_payload_user = dmaHp_m_axi_3_awuser;
  assign m_axi_hp_3_aw_payload_prot = dmaHp_m_axi_3_awprot;
  assign m_axi_hp_3_w_valid = dmaHp_m_axi_3_wvalid;
  assign m_axi_hp_3_w_payload_data = dmaHp_m_axi_3_wdata;
  assign m_axi_hp_3_w_payload_strb = dmaHp_m_axi_3_wstrb;
  assign m_axi_hp_3_w_payload_last = dmaHp_m_axi_3_wlast;
  assign m_axi_hp_3_r_ready = dmaHp_m_axi_3_rready;
  assign m_axi_hp_3_b_ready = dmaHp_m_axi_3_bready;
  assign t_io_bus_payload_keep[63 : 0] = 64'hffffffffffffffff;
  assign c2c_to_valid = node_c2c_to_valid;
  assign c2c_to_payload_last = node_c2c_to_payload_last;
  assign c2c_to_payload_tdata = node_c2c_to_payload_tdata;
  assign c2c_to_payload_tuser = node_c2c_to_payload_tuser;
  assign c2c_to_payload_tdest = node_c2c_to_payload_tdest;
  assign c2c_from_ready = node_c2c_from_ready;
  assign t_io_p2sOut_valid = 23'h0;
  assign sOut_io_p2sOut_valid = t_io_p2sOut_valid[0];
  assign t_io_p2sOut_tdata = t_io_p2sOut_valid[22 : 1];
  assign sOut_io_p2sOut_tdata = t_io_p2sOut_tdata[15 : 0];
  assign sOut_io_p2sOut_tuser = t_io_p2sOut_tdata[21 : 16];
  assign coreArea_0_core_axi_int_bus_fire = (axi_int_bus_valid && busIn_io_bus_ready);
  assign toAxiLite_tokenCnt = {3'd0, t_toAxiLite_tokenCnt};
  assign toAxiLite_argMaxVld = sample_argmax_tvalid;
  assign toAxiLite_argMaxIndex = sample_argmax_tdata;
  assign toAxiLite_prefill = stateGen_2_status_prefill;
  assign toAxiLite_layerCnt = {3'd0, t_toAxiLite_layerCnt};
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      tokenIndexPipe_valid <= 1'b0;
    end else begin
      tokenIndexPipe_valid <= tokenIndex_valid;
    end
  end

  always @(posedge clk_0_clk) begin
    tokenIndexPipe_tdata <= tokenIndex_tdata;
    tokenIndexPipe_tuser <= tokenIndex_tuser;
  end


endmodule

