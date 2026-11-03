// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module DataPath_xN (
  input  wire          S00_AXIL_awvalid,
  output wire          S00_AXIL_awready,
  input  wire [31:0]   S00_AXIL_awaddr,
  input  wire [2:0]    S00_AXIL_awprot,
  input  wire          S00_AXIL_wvalid,
  output wire          S00_AXIL_wready,
  input  wire [31:0]   S00_AXIL_wdata,
  input  wire [3:0]    S00_AXIL_wstrb,
  output wire          S00_AXIL_bvalid,
  input  wire          S00_AXIL_bready,
  output wire [1:0]    S00_AXIL_bresp,
  input  wire          S00_AXIL_arvalid,
  output wire          S00_AXIL_arready,
  input  wire [31:0]   S00_AXIL_araddr,
  input  wire [2:0]    S00_AXIL_arprot,
  output wire          S00_AXIL_rvalid,
  input  wire          S00_AXIL_rready,
  output wire [31:0]   S00_AXIL_rdata,
  output wire [1:0]    S00_AXIL_rresp,
  output wire          softReset,
  input  wire          S00_ACLK,
  input  wire          S00_ARESETN,
  output wire          M01_AXI_awvalid,
  input  wire          M01_AXI_awready,
  output wire [31:0]   M01_AXI_awaddr,
  output wire [3:0]    M01_AXI_awid,
  output wire [7:0]    M01_AXI_awlen,
  output wire [2:0]    M01_AXI_awsize,
  output wire [1:0]    M01_AXI_awburst,
  output wire [3:0]    M01_AXI_awcache,
  output wire [3:0]    M01_AXI_awuser,
  output wire [2:0]    M01_AXI_awprot,
  output wire          M01_AXI_wvalid,
  input  wire          M01_AXI_wready,
  output wire [511:0]  M01_AXI_wdata,
  output wire [63:0]   M01_AXI_wstrb,
  output wire          M01_AXI_wlast,
  input  wire          M01_AXI_bvalid,
  output wire          M01_AXI_bready,
  input  wire [3:0]    M01_AXI_bid,
  input  wire [1:0]    M01_AXI_bresp,
  output wire          M01_AXI_arvalid,
  input  wire          M01_AXI_arready,
  output wire [31:0]   M01_AXI_araddr,
  output wire [3:0]    M01_AXI_arid,
  output wire [7:0]    M01_AXI_arlen,
  output wire [2:0]    M01_AXI_arsize,
  output wire [1:0]    M01_AXI_arburst,
  output wire [3:0]    M01_AXI_arcache,
  output wire [3:0]    M01_AXI_aruser,
  output wire [2:0]    M01_AXI_arprot,
  input  wire          M01_AXI_rvalid,
  output wire          M01_AXI_rready,
  input  wire [511:0]  M01_AXI_rdata,
  input  wire [3:0]    M01_AXI_rid,
  input  wire [1:0]    M01_AXI_rresp,
  input  wire          M01_AXI_rlast,
  output wire          m_axi_hp_0_0_awvalid,
  input  wire          m_axi_hp_0_0_awready,
  output wire [31:0]   m_axi_hp_0_0_awaddr,
  output wire [3:0]    m_axi_hp_0_0_awid,
  output wire [7:0]    m_axi_hp_0_0_awlen,
  output wire [2:0]    m_axi_hp_0_0_awsize,
  output wire [1:0]    m_axi_hp_0_0_awburst,
  output wire [3:0]    m_axi_hp_0_0_awcache,
  output wire [3:0]    m_axi_hp_0_0_awuser,
  output wire [2:0]    m_axi_hp_0_0_awprot,
  output wire          m_axi_hp_0_0_wvalid,
  input  wire          m_axi_hp_0_0_wready,
  output wire [127:0]  m_axi_hp_0_0_wdata,
  output wire [15:0]   m_axi_hp_0_0_wstrb,
  output wire          m_axi_hp_0_0_wlast,
  input  wire          m_axi_hp_0_0_bvalid,
  output wire          m_axi_hp_0_0_bready,
  input  wire [3:0]    m_axi_hp_0_0_bid,
  input  wire [1:0]    m_axi_hp_0_0_bresp,
  output wire          m_axi_hp_0_0_arvalid,
  input  wire          m_axi_hp_0_0_arready,
  output wire [31:0]   m_axi_hp_0_0_araddr,
  output wire [3:0]    m_axi_hp_0_0_arid,
  output wire [7:0]    m_axi_hp_0_0_arlen,
  output wire [2:0]    m_axi_hp_0_0_arsize,
  output wire [1:0]    m_axi_hp_0_0_arburst,
  output wire [3:0]    m_axi_hp_0_0_arcache,
  output wire [3:0]    m_axi_hp_0_0_aruser,
  output wire [2:0]    m_axi_hp_0_0_arprot,
  input  wire          m_axi_hp_0_0_rvalid,
  output wire          m_axi_hp_0_0_rready,
  input  wire [127:0]  m_axi_hp_0_0_rdata,
  input  wire [3:0]    m_axi_hp_0_0_rid,
  input  wire [1:0]    m_axi_hp_0_0_rresp,
  input  wire          m_axi_hp_0_0_rlast,
  output wire          m_axi_hp_0_1_awvalid,
  input  wire          m_axi_hp_0_1_awready,
  output wire [31:0]   m_axi_hp_0_1_awaddr,
  output wire [3:0]    m_axi_hp_0_1_awid,
  output wire [7:0]    m_axi_hp_0_1_awlen,
  output wire [2:0]    m_axi_hp_0_1_awsize,
  output wire [1:0]    m_axi_hp_0_1_awburst,
  output wire [3:0]    m_axi_hp_0_1_awcache,
  output wire [3:0]    m_axi_hp_0_1_awuser,
  output wire [2:0]    m_axi_hp_0_1_awprot,
  output wire          m_axi_hp_0_1_wvalid,
  input  wire          m_axi_hp_0_1_wready,
  output wire [127:0]  m_axi_hp_0_1_wdata,
  output wire [15:0]   m_axi_hp_0_1_wstrb,
  output wire          m_axi_hp_0_1_wlast,
  input  wire          m_axi_hp_0_1_bvalid,
  output wire          m_axi_hp_0_1_bready,
  input  wire [3:0]    m_axi_hp_0_1_bid,
  input  wire [1:0]    m_axi_hp_0_1_bresp,
  output wire          m_axi_hp_0_1_arvalid,
  input  wire          m_axi_hp_0_1_arready,
  output wire [31:0]   m_axi_hp_0_1_araddr,
  output wire [3:0]    m_axi_hp_0_1_arid,
  output wire [7:0]    m_axi_hp_0_1_arlen,
  output wire [2:0]    m_axi_hp_0_1_arsize,
  output wire [1:0]    m_axi_hp_0_1_arburst,
  output wire [3:0]    m_axi_hp_0_1_arcache,
  output wire [3:0]    m_axi_hp_0_1_aruser,
  output wire [2:0]    m_axi_hp_0_1_arprot,
  input  wire          m_axi_hp_0_1_rvalid,
  output wire          m_axi_hp_0_1_rready,
  input  wire [127:0]  m_axi_hp_0_1_rdata,
  input  wire [3:0]    m_axi_hp_0_1_rid,
  input  wire [1:0]    m_axi_hp_0_1_rresp,
  input  wire          m_axi_hp_0_1_rlast,
  output wire          m_axi_hp_0_2_awvalid,
  input  wire          m_axi_hp_0_2_awready,
  output wire [31:0]   m_axi_hp_0_2_awaddr,
  output wire [3:0]    m_axi_hp_0_2_awid,
  output wire [7:0]    m_axi_hp_0_2_awlen,
  output wire [2:0]    m_axi_hp_0_2_awsize,
  output wire [1:0]    m_axi_hp_0_2_awburst,
  output wire [3:0]    m_axi_hp_0_2_awcache,
  output wire [3:0]    m_axi_hp_0_2_awuser,
  output wire [2:0]    m_axi_hp_0_2_awprot,
  output wire          m_axi_hp_0_2_wvalid,
  input  wire          m_axi_hp_0_2_wready,
  output wire [127:0]  m_axi_hp_0_2_wdata,
  output wire [15:0]   m_axi_hp_0_2_wstrb,
  output wire          m_axi_hp_0_2_wlast,
  input  wire          m_axi_hp_0_2_bvalid,
  output wire          m_axi_hp_0_2_bready,
  input  wire [3:0]    m_axi_hp_0_2_bid,
  input  wire [1:0]    m_axi_hp_0_2_bresp,
  output wire          m_axi_hp_0_2_arvalid,
  input  wire          m_axi_hp_0_2_arready,
  output wire [31:0]   m_axi_hp_0_2_araddr,
  output wire [3:0]    m_axi_hp_0_2_arid,
  output wire [7:0]    m_axi_hp_0_2_arlen,
  output wire [2:0]    m_axi_hp_0_2_arsize,
  output wire [1:0]    m_axi_hp_0_2_arburst,
  output wire [3:0]    m_axi_hp_0_2_arcache,
  output wire [3:0]    m_axi_hp_0_2_aruser,
  output wire [2:0]    m_axi_hp_0_2_arprot,
  input  wire          m_axi_hp_0_2_rvalid,
  output wire          m_axi_hp_0_2_rready,
  input  wire [127:0]  m_axi_hp_0_2_rdata,
  input  wire [3:0]    m_axi_hp_0_2_rid,
  input  wire [1:0]    m_axi_hp_0_2_rresp,
  input  wire          m_axi_hp_0_2_rlast,
  output wire          m_axi_hp_0_3_awvalid,
  input  wire          m_axi_hp_0_3_awready,
  output wire [31:0]   m_axi_hp_0_3_awaddr,
  output wire [3:0]    m_axi_hp_0_3_awid,
  output wire [7:0]    m_axi_hp_0_3_awlen,
  output wire [2:0]    m_axi_hp_0_3_awsize,
  output wire [1:0]    m_axi_hp_0_3_awburst,
  output wire [3:0]    m_axi_hp_0_3_awcache,
  output wire [3:0]    m_axi_hp_0_3_awuser,
  output wire [2:0]    m_axi_hp_0_3_awprot,
  output wire          m_axi_hp_0_3_wvalid,
  input  wire          m_axi_hp_0_3_wready,
  output wire [127:0]  m_axi_hp_0_3_wdata,
  output wire [15:0]   m_axi_hp_0_3_wstrb,
  output wire          m_axi_hp_0_3_wlast,
  input  wire          m_axi_hp_0_3_bvalid,
  output wire          m_axi_hp_0_3_bready,
  input  wire [3:0]    m_axi_hp_0_3_bid,
  input  wire [1:0]    m_axi_hp_0_3_bresp,
  output wire          m_axi_hp_0_3_arvalid,
  input  wire          m_axi_hp_0_3_arready,
  output wire [31:0]   m_axi_hp_0_3_araddr,
  output wire [3:0]    m_axi_hp_0_3_arid,
  output wire [7:0]    m_axi_hp_0_3_arlen,
  output wire [2:0]    m_axi_hp_0_3_arsize,
  output wire [1:0]    m_axi_hp_0_3_arburst,
  output wire [3:0]    m_axi_hp_0_3_arcache,
  output wire [3:0]    m_axi_hp_0_3_aruser,
  output wire [2:0]    m_axi_hp_0_3_arprot,
  input  wire          m_axi_hp_0_3_rvalid,
  output wire          m_axi_hp_0_3_rready,
  input  wire [127:0]  m_axi_hp_0_3_rdata,
  input  wire [3:0]    m_axi_hp_0_3_rid,
  input  wire [1:0]    m_axi_hp_0_3_rresp,
  input  wire          m_axi_hp_0_3_rlast
);

  wire                cfg_io_ctrl_aw_ready;
  wire                cfg_io_ctrl_w_ready;
  wire                cfg_io_ctrl_b_valid;
  wire       [1:0]    cfg_io_ctrl_b_payload_resp;
  wire                cfg_io_ctrl_ar_ready;
  wire                cfg_io_ctrl_r_valid;
  wire       [31:0]   cfg_io_ctrl_r_payload_data;
  wire       [1:0]    cfg_io_ctrl_r_payload_resp;
  wire                cfg_io_tokenIndex_valid;
  wire       [16:0]   cfg_io_tokenIndex_tdata;
  wire       [5:0]    cfg_io_tokenIndex_tuser;
  wire       [1:0]    cfg_io_cmdSel;
  wire       [4:0]    cfg_io_presetLayer;
  wire       [9:0]    cfg_io_presetToken;
  wire                cfg_resetOut;
  wire                coreArea_0_core_c2c_from_ready;
  wire                coreArea_0_core_c2c_to_valid;
  wire                coreArea_0_core_c2c_to_payload_last;
  wire       [15:0]   coreArea_0_core_c2c_to_payload_tdata;
  wire       [5:0]    coreArea_0_core_c2c_to_payload_tuser;
  wire       [0:0]    coreArea_0_core_c2c_to_payload_tdest;
  wire       [15:0]   coreArea_0_core_toAxiLite_tokenCnt;
  wire                coreArea_0_core_toAxiLite_argMaxVld;
  wire       [16:0]   coreArea_0_core_toAxiLite_argMaxIndex;
  wire                coreArea_0_core_toAxiLite_prefill;
  wire       [7:0]    coreArea_0_core_toAxiLite_layerCnt;
  wire                coreArea_0_core_tokenIndex_ready;
  wire                coreArea_0_core_m_axi_hp_0_ar_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_0_ar_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_ar_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_0_ar_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_0_ar_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_0_ar_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_ar_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_ar_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_0_ar_payload_prot;
  wire                coreArea_0_core_m_axi_hp_0_aw_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_0_aw_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_aw_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_0_aw_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_0_aw_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_0_aw_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_aw_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_0_aw_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_0_aw_payload_prot;
  wire                coreArea_0_core_m_axi_hp_0_w_valid;
  wire       [127:0]  coreArea_0_core_m_axi_hp_0_w_payload_data;
  wire       [15:0]   coreArea_0_core_m_axi_hp_0_w_payload_strb;
  wire                coreArea_0_core_m_axi_hp_0_w_payload_last;
  wire                coreArea_0_core_m_axi_hp_0_r_ready;
  wire                coreArea_0_core_m_axi_hp_0_b_ready;
  wire                coreArea_0_core_m_axi_hp_1_ar_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_1_ar_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_ar_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_1_ar_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_1_ar_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_1_ar_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_ar_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_ar_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_1_ar_payload_prot;
  wire                coreArea_0_core_m_axi_hp_1_aw_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_1_aw_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_aw_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_1_aw_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_1_aw_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_1_aw_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_aw_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_1_aw_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_1_aw_payload_prot;
  wire                coreArea_0_core_m_axi_hp_1_w_valid;
  wire       [127:0]  coreArea_0_core_m_axi_hp_1_w_payload_data;
  wire       [15:0]   coreArea_0_core_m_axi_hp_1_w_payload_strb;
  wire                coreArea_0_core_m_axi_hp_1_w_payload_last;
  wire                coreArea_0_core_m_axi_hp_1_r_ready;
  wire                coreArea_0_core_m_axi_hp_1_b_ready;
  wire                coreArea_0_core_m_axi_hp_2_ar_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_2_ar_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_ar_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_2_ar_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_2_ar_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_2_ar_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_ar_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_ar_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_2_ar_payload_prot;
  wire                coreArea_0_core_m_axi_hp_2_aw_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_2_aw_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_aw_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_2_aw_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_2_aw_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_2_aw_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_aw_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_2_aw_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_2_aw_payload_prot;
  wire                coreArea_0_core_m_axi_hp_2_w_valid;
  wire       [127:0]  coreArea_0_core_m_axi_hp_2_w_payload_data;
  wire       [15:0]   coreArea_0_core_m_axi_hp_2_w_payload_strb;
  wire                coreArea_0_core_m_axi_hp_2_w_payload_last;
  wire                coreArea_0_core_m_axi_hp_2_r_ready;
  wire                coreArea_0_core_m_axi_hp_2_b_ready;
  wire                coreArea_0_core_m_axi_hp_3_ar_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_3_ar_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_ar_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_3_ar_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_3_ar_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_3_ar_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_ar_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_ar_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_3_ar_payload_prot;
  wire                coreArea_0_core_m_axi_hp_3_aw_valid;
  wire       [31:0]   coreArea_0_core_m_axi_hp_3_aw_payload_addr;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_aw_payload_id;
  wire       [7:0]    coreArea_0_core_m_axi_hp_3_aw_payload_len;
  wire       [2:0]    coreArea_0_core_m_axi_hp_3_aw_payload_size;
  wire       [1:0]    coreArea_0_core_m_axi_hp_3_aw_payload_burst;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_aw_payload_cache;
  wire       [3:0]    coreArea_0_core_m_axi_hp_3_aw_payload_user;
  wire       [2:0]    coreArea_0_core_m_axi_hp_3_aw_payload_prot;
  wire                coreArea_0_core_m_axi_hp_3_w_valid;
  wire       [127:0]  coreArea_0_core_m_axi_hp_3_w_payload_data;
  wire       [15:0]   coreArea_0_core_m_axi_hp_3_w_payload_strb;
  wire                coreArea_0_core_m_axi_hp_3_w_payload_last;
  wire                coreArea_0_core_m_axi_hp_3_r_ready;
  wire                coreArea_0_core_m_axi_hp_3_b_ready;
  wire                coreArea_1_core_c2c_from_ready;
  wire                coreArea_1_core_c2c_to_valid;
  wire                coreArea_1_core_c2c_to_payload_last;
  wire       [15:0]   coreArea_1_core_c2c_to_payload_tdata;
  wire       [5:0]    coreArea_1_core_c2c_to_payload_tuser;
  wire       [0:0]    coreArea_1_core_c2c_to_payload_tdest;
  wire       [15:0]   coreArea_1_core_toAxiLite_tokenCnt;
  wire                coreArea_1_core_toAxiLite_argMaxVld;
  wire       [16:0]   coreArea_1_core_toAxiLite_argMaxIndex;
  wire                coreArea_1_core_toAxiLite_prefill;
  wire       [7:0]    coreArea_1_core_toAxiLite_layerCnt;
  wire                coreArea_1_core_tokenIndex_ready;
  wire                coreArea_1_core_m_axi_ar_valid;
  wire       [31:0]   coreArea_1_core_m_axi_ar_payload_addr;
  wire       [3:0]    coreArea_1_core_m_axi_ar_payload_id;
  wire       [7:0]    coreArea_1_core_m_axi_ar_payload_len;
  wire       [2:0]    coreArea_1_core_m_axi_ar_payload_size;
  wire       [1:0]    coreArea_1_core_m_axi_ar_payload_burst;
  wire       [3:0]    coreArea_1_core_m_axi_ar_payload_cache;
  wire       [3:0]    coreArea_1_core_m_axi_ar_payload_user;
  wire       [2:0]    coreArea_1_core_m_axi_ar_payload_prot;
  wire                coreArea_1_core_m_axi_aw_valid;
  wire       [31:0]   coreArea_1_core_m_axi_aw_payload_addr;
  wire       [3:0]    coreArea_1_core_m_axi_aw_payload_id;
  wire       [7:0]    coreArea_1_core_m_axi_aw_payload_len;
  wire       [2:0]    coreArea_1_core_m_axi_aw_payload_size;
  wire       [1:0]    coreArea_1_core_m_axi_aw_payload_burst;
  wire       [3:0]    coreArea_1_core_m_axi_aw_payload_cache;
  wire       [3:0]    coreArea_1_core_m_axi_aw_payload_user;
  wire       [2:0]    coreArea_1_core_m_axi_aw_payload_prot;
  wire                coreArea_1_core_m_axi_w_valid;
  wire       [511:0]  coreArea_1_core_m_axi_w_payload_data;
  wire       [63:0]   coreArea_1_core_m_axi_w_payload_strb;
  wire                coreArea_1_core_m_axi_w_payload_last;
  wire                coreArea_1_core_m_axi_r_ready;
  wire                coreArea_1_core_m_axi_b_ready;
  wire                clk_0_clk;
  wire                clk_0_resetn;
  wire                clk_1_clk;
  wire                clk_1_resetn;
  reg                 toplevel_cfg_io_tokenIndex_regNext_valid;
  reg        [16:0]   toplevel_cfg_io_tokenIndex_regNext_tdata;
  reg        [5:0]    toplevel_cfg_io_tokenIndex_regNext_tuser;
  reg                 toplevel_cfg_io_tokenIndex_regNext_regNext_valid;
  reg        [16:0]   toplevel_cfg_io_tokenIndex_regNext_regNext_tdata;
  reg        [5:0]    toplevel_cfg_io_tokenIndex_regNext_regNext_tuser;
  wire                toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid;
  wire                toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_ready;
  wire       [16:0]   toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata;
  wire       [5:0]    toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser;
  reg                 toplevel_cfg_io_tokenIndex_regNext_valid_1;
  reg        [16:0]   toplevel_cfg_io_tokenIndex_regNext_tdata_1;
  reg        [5:0]    toplevel_cfg_io_tokenIndex_regNext_tuser_1;
  reg                 toplevel_cfg_io_tokenIndex_regNext_regNext_valid_1;
  reg        [16:0]   toplevel_cfg_io_tokenIndex_regNext_regNext_tdata_1;
  reg        [5:0]    toplevel_cfg_io_tokenIndex_regNext_regNext_tuser_1;
  wire                toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid_1;
  wire                toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_ready_1;
  wire       [16:0]   toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata_1;
  wire       [5:0]    toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser_1;
  wire                toplevel_coreArea_1_core_c2c_to_toStream_valid;
  wire                toplevel_coreArea_1_core_c2c_to_toStream_ready;
  wire                toplevel_coreArea_1_core_c2c_to_toStream_payload_last;
  wire       [15:0]   toplevel_coreArea_1_core_c2c_to_toStream_payload_tdata;
  wire       [5:0]    toplevel_coreArea_1_core_c2c_to_toStream_payload_tuser;
  wire       [0:0]    toplevel_coreArea_1_core_c2c_to_toStream_payload_tdest;
  wire                toplevel_coreArea_0_core_c2c_to_toStream_valid;
  wire                toplevel_coreArea_0_core_c2c_to_toStream_ready;
  wire                toplevel_coreArea_0_core_c2c_to_toStream_payload_last;
  wire       [15:0]   toplevel_coreArea_0_core_c2c_to_toStream_payload_tdata;
  wire       [5:0]    toplevel_coreArea_0_core_c2c_to_toStream_payload_tuser;
  wire       [0:0]    toplevel_coreArea_0_core_c2c_to_toStream_payload_tdest;

  AxiLiteCtrl cfg (
    .io_ctrl_aw_valid        (S00_AXIL_awvalid                           ), //i
    .io_ctrl_aw_ready        (cfg_io_ctrl_aw_ready                       ), //o
    .io_ctrl_aw_payload_addr (S00_AXIL_awaddr[31:0]                      ), //i
    .io_ctrl_aw_payload_prot (S00_AXIL_awprot[2:0]                       ), //i
    .io_ctrl_w_valid         (S00_AXIL_wvalid                            ), //i
    .io_ctrl_w_ready         (cfg_io_ctrl_w_ready                        ), //o
    .io_ctrl_w_payload_data  (S00_AXIL_wdata[31:0]                       ), //i
    .io_ctrl_w_payload_strb  (S00_AXIL_wstrb[3:0]                        ), //i
    .io_ctrl_b_valid         (cfg_io_ctrl_b_valid                        ), //o
    .io_ctrl_b_ready         (S00_AXIL_bready                            ), //i
    .io_ctrl_b_payload_resp  (cfg_io_ctrl_b_payload_resp[1:0]            ), //o
    .io_ctrl_ar_valid        (S00_AXIL_arvalid                           ), //i
    .io_ctrl_ar_ready        (cfg_io_ctrl_ar_ready                       ), //o
    .io_ctrl_ar_payload_addr (S00_AXIL_araddr[31:0]                      ), //i
    .io_ctrl_ar_payload_prot (S00_AXIL_arprot[2:0]                       ), //i
    .io_ctrl_r_valid         (cfg_io_ctrl_r_valid                        ), //o
    .io_ctrl_r_ready         (S00_AXIL_rready                            ), //i
    .io_ctrl_r_payload_data  (cfg_io_ctrl_r_payload_data[31:0]           ), //o
    .io_ctrl_r_payload_resp  (cfg_io_ctrl_r_payload_resp[1:0]            ), //o
    .io_tokenIndex_valid     (cfg_io_tokenIndex_valid                    ), //o
    .io_tokenIndex_tdata     (cfg_io_tokenIndex_tdata[16:0]              ), //o
    .io_tokenIndex_tuser     (cfg_io_tokenIndex_tuser[5:0]               ), //o
    .io_cmdSel               (cfg_io_cmdSel[1:0]                         ), //o
    .io_presetLayer          (cfg_io_presetLayer[4:0]                    ), //o
    .io_presetToken          (cfg_io_presetToken[9:0]                    ), //o
    .status_tokenCnt         (coreArea_0_core_toAxiLite_tokenCnt[15:0]   ), //i
    .status_layerCnt         (coreArea_0_core_toAxiLite_layerCnt[7:0]    ), //i
    .status_argMaxVld        (coreArea_0_core_toAxiLite_argMaxVld        ), //i
    .status_argMaxIndex      (coreArea_0_core_toAxiLite_argMaxIndex[16:0]), //i
    .status_prefill          (coreArea_0_core_toAxiLite_prefill          ), //i
    .resetOut                (cfg_resetOut                               ), //o
    .S00_ACLK                (S00_ACLK                                   ), //i
    .S00_ARESETN             (S00_ARESETN                                )  //i
  );
  DataPath coreArea_0_core (
    .c2c_from_valid              (toplevel_coreArea_1_core_c2c_to_toStream_valid                 ), //i
    .c2c_from_ready              (coreArea_0_core_c2c_from_ready                                 ), //o
    .c2c_from_payload_last       (toplevel_coreArea_1_core_c2c_to_toStream_payload_last          ), //i
    .c2c_from_payload_tdata      (toplevel_coreArea_1_core_c2c_to_toStream_payload_tdata[15:0]   ), //i
    .c2c_from_payload_tuser      (toplevel_coreArea_1_core_c2c_to_toStream_payload_tuser[5:0]    ), //i
    .c2c_from_payload_tdest      (toplevel_coreArea_1_core_c2c_to_toStream_payload_tdest         ), //i
    .c2c_to_valid                (coreArea_0_core_c2c_to_valid                                   ), //o
    .c2c_to_payload_last         (coreArea_0_core_c2c_to_payload_last                            ), //o
    .c2c_to_payload_tdata        (coreArea_0_core_c2c_to_payload_tdata[15:0]                     ), //o
    .c2c_to_payload_tuser        (coreArea_0_core_c2c_to_payload_tuser[5:0]                      ), //o
    .c2c_to_payload_tdest        (coreArea_0_core_c2c_to_payload_tdest                           ), //o
    .toAxiLite_tokenCnt          (coreArea_0_core_toAxiLite_tokenCnt[15:0]                       ), //o
    .toAxiLite_argMaxVld         (coreArea_0_core_toAxiLite_argMaxVld                            ), //o
    .toAxiLite_argMaxIndex       (coreArea_0_core_toAxiLite_argMaxIndex[16:0]                    ), //o
    .toAxiLite_prefill           (coreArea_0_core_toAxiLite_prefill                              ), //o
    .toAxiLite_layerCnt          (coreArea_0_core_toAxiLite_layerCnt[7:0]                        ), //o
    .tokenIndex_valid            (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid      ), //i
    .tokenIndex_ready            (coreArea_0_core_tokenIndex_ready                               ), //o
    .tokenIndex_tdata            (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata[16:0]), //i
    .tokenIndex_tuser            (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser[5:0] ), //i
    .m_axi_hp_0_aw_valid         (coreArea_0_core_m_axi_hp_0_aw_valid                            ), //o
    .m_axi_hp_0_aw_ready         (m_axi_hp_0_0_awready                                           ), //i
    .m_axi_hp_0_aw_payload_addr  (coreArea_0_core_m_axi_hp_0_aw_payload_addr[31:0]               ), //o
    .m_axi_hp_0_aw_payload_id    (coreArea_0_core_m_axi_hp_0_aw_payload_id[3:0]                  ), //o
    .m_axi_hp_0_aw_payload_len   (coreArea_0_core_m_axi_hp_0_aw_payload_len[7:0]                 ), //o
    .m_axi_hp_0_aw_payload_size  (coreArea_0_core_m_axi_hp_0_aw_payload_size[2:0]                ), //o
    .m_axi_hp_0_aw_payload_burst (coreArea_0_core_m_axi_hp_0_aw_payload_burst[1:0]               ), //o
    .m_axi_hp_0_aw_payload_cache (coreArea_0_core_m_axi_hp_0_aw_payload_cache[3:0]               ), //o
    .m_axi_hp_0_aw_payload_user  (coreArea_0_core_m_axi_hp_0_aw_payload_user[3:0]                ), //o
    .m_axi_hp_0_aw_payload_prot  (coreArea_0_core_m_axi_hp_0_aw_payload_prot[2:0]                ), //o
    .m_axi_hp_0_w_valid          (coreArea_0_core_m_axi_hp_0_w_valid                             ), //o
    .m_axi_hp_0_w_ready          (m_axi_hp_0_0_wready                                            ), //i
    .m_axi_hp_0_w_payload_data   (coreArea_0_core_m_axi_hp_0_w_payload_data[127:0]               ), //o
    .m_axi_hp_0_w_payload_strb   (coreArea_0_core_m_axi_hp_0_w_payload_strb[15:0]                ), //o
    .m_axi_hp_0_w_payload_last   (coreArea_0_core_m_axi_hp_0_w_payload_last                      ), //o
    .m_axi_hp_0_b_valid          (m_axi_hp_0_0_bvalid                                            ), //i
    .m_axi_hp_0_b_ready          (coreArea_0_core_m_axi_hp_0_b_ready                             ), //o
    .m_axi_hp_0_b_payload_id     (m_axi_hp_0_0_bid[3:0]                                          ), //i
    .m_axi_hp_0_b_payload_resp   (m_axi_hp_0_0_bresp[1:0]                                        ), //i
    .m_axi_hp_0_ar_valid         (coreArea_0_core_m_axi_hp_0_ar_valid                            ), //o
    .m_axi_hp_0_ar_ready         (m_axi_hp_0_0_arready                                           ), //i
    .m_axi_hp_0_ar_payload_addr  (coreArea_0_core_m_axi_hp_0_ar_payload_addr[31:0]               ), //o
    .m_axi_hp_0_ar_payload_id    (coreArea_0_core_m_axi_hp_0_ar_payload_id[3:0]                  ), //o
    .m_axi_hp_0_ar_payload_len   (coreArea_0_core_m_axi_hp_0_ar_payload_len[7:0]                 ), //o
    .m_axi_hp_0_ar_payload_size  (coreArea_0_core_m_axi_hp_0_ar_payload_size[2:0]                ), //o
    .m_axi_hp_0_ar_payload_burst (coreArea_0_core_m_axi_hp_0_ar_payload_burst[1:0]               ), //o
    .m_axi_hp_0_ar_payload_cache (coreArea_0_core_m_axi_hp_0_ar_payload_cache[3:0]               ), //o
    .m_axi_hp_0_ar_payload_user  (coreArea_0_core_m_axi_hp_0_ar_payload_user[3:0]                ), //o
    .m_axi_hp_0_ar_payload_prot  (coreArea_0_core_m_axi_hp_0_ar_payload_prot[2:0]                ), //o
    .m_axi_hp_0_r_valid          (m_axi_hp_0_0_rvalid                                            ), //i
    .m_axi_hp_0_r_ready          (coreArea_0_core_m_axi_hp_0_r_ready                             ), //o
    .m_axi_hp_0_r_payload_data   (m_axi_hp_0_0_rdata[127:0]                                      ), //i
    .m_axi_hp_0_r_payload_id     (m_axi_hp_0_0_rid[3:0]                                          ), //i
    .m_axi_hp_0_r_payload_resp   (m_axi_hp_0_0_rresp[1:0]                                        ), //i
    .m_axi_hp_0_r_payload_last   (m_axi_hp_0_0_rlast                                             ), //i
    .m_axi_hp_1_aw_valid         (coreArea_0_core_m_axi_hp_1_aw_valid                            ), //o
    .m_axi_hp_1_aw_ready         (m_axi_hp_0_1_awready                                           ), //i
    .m_axi_hp_1_aw_payload_addr  (coreArea_0_core_m_axi_hp_1_aw_payload_addr[31:0]               ), //o
    .m_axi_hp_1_aw_payload_id    (coreArea_0_core_m_axi_hp_1_aw_payload_id[3:0]                  ), //o
    .m_axi_hp_1_aw_payload_len   (coreArea_0_core_m_axi_hp_1_aw_payload_len[7:0]                 ), //o
    .m_axi_hp_1_aw_payload_size  (coreArea_0_core_m_axi_hp_1_aw_payload_size[2:0]                ), //o
    .m_axi_hp_1_aw_payload_burst (coreArea_0_core_m_axi_hp_1_aw_payload_burst[1:0]               ), //o
    .m_axi_hp_1_aw_payload_cache (coreArea_0_core_m_axi_hp_1_aw_payload_cache[3:0]               ), //o
    .m_axi_hp_1_aw_payload_user  (coreArea_0_core_m_axi_hp_1_aw_payload_user[3:0]                ), //o
    .m_axi_hp_1_aw_payload_prot  (coreArea_0_core_m_axi_hp_1_aw_payload_prot[2:0]                ), //o
    .m_axi_hp_1_w_valid          (coreArea_0_core_m_axi_hp_1_w_valid                             ), //o
    .m_axi_hp_1_w_ready          (m_axi_hp_0_1_wready                                            ), //i
    .m_axi_hp_1_w_payload_data   (coreArea_0_core_m_axi_hp_1_w_payload_data[127:0]               ), //o
    .m_axi_hp_1_w_payload_strb   (coreArea_0_core_m_axi_hp_1_w_payload_strb[15:0]                ), //o
    .m_axi_hp_1_w_payload_last   (coreArea_0_core_m_axi_hp_1_w_payload_last                      ), //o
    .m_axi_hp_1_b_valid          (m_axi_hp_0_1_bvalid                                            ), //i
    .m_axi_hp_1_b_ready          (coreArea_0_core_m_axi_hp_1_b_ready                             ), //o
    .m_axi_hp_1_b_payload_id     (m_axi_hp_0_1_bid[3:0]                                          ), //i
    .m_axi_hp_1_b_payload_resp   (m_axi_hp_0_1_bresp[1:0]                                        ), //i
    .m_axi_hp_1_ar_valid         (coreArea_0_core_m_axi_hp_1_ar_valid                            ), //o
    .m_axi_hp_1_ar_ready         (m_axi_hp_0_1_arready                                           ), //i
    .m_axi_hp_1_ar_payload_addr  (coreArea_0_core_m_axi_hp_1_ar_payload_addr[31:0]               ), //o
    .m_axi_hp_1_ar_payload_id    (coreArea_0_core_m_axi_hp_1_ar_payload_id[3:0]                  ), //o
    .m_axi_hp_1_ar_payload_len   (coreArea_0_core_m_axi_hp_1_ar_payload_len[7:0]                 ), //o
    .m_axi_hp_1_ar_payload_size  (coreArea_0_core_m_axi_hp_1_ar_payload_size[2:0]                ), //o
    .m_axi_hp_1_ar_payload_burst (coreArea_0_core_m_axi_hp_1_ar_payload_burst[1:0]               ), //o
    .m_axi_hp_1_ar_payload_cache (coreArea_0_core_m_axi_hp_1_ar_payload_cache[3:0]               ), //o
    .m_axi_hp_1_ar_payload_user  (coreArea_0_core_m_axi_hp_1_ar_payload_user[3:0]                ), //o
    .m_axi_hp_1_ar_payload_prot  (coreArea_0_core_m_axi_hp_1_ar_payload_prot[2:0]                ), //o
    .m_axi_hp_1_r_valid          (m_axi_hp_0_1_rvalid                                            ), //i
    .m_axi_hp_1_r_ready          (coreArea_0_core_m_axi_hp_1_r_ready                             ), //o
    .m_axi_hp_1_r_payload_data   (m_axi_hp_0_1_rdata[127:0]                                      ), //i
    .m_axi_hp_1_r_payload_id     (m_axi_hp_0_1_rid[3:0]                                          ), //i
    .m_axi_hp_1_r_payload_resp   (m_axi_hp_0_1_rresp[1:0]                                        ), //i
    .m_axi_hp_1_r_payload_last   (m_axi_hp_0_1_rlast                                             ), //i
    .m_axi_hp_2_aw_valid         (coreArea_0_core_m_axi_hp_2_aw_valid                            ), //o
    .m_axi_hp_2_aw_ready         (m_axi_hp_0_2_awready                                           ), //i
    .m_axi_hp_2_aw_payload_addr  (coreArea_0_core_m_axi_hp_2_aw_payload_addr[31:0]               ), //o
    .m_axi_hp_2_aw_payload_id    (coreArea_0_core_m_axi_hp_2_aw_payload_id[3:0]                  ), //o
    .m_axi_hp_2_aw_payload_len   (coreArea_0_core_m_axi_hp_2_aw_payload_len[7:0]                 ), //o
    .m_axi_hp_2_aw_payload_size  (coreArea_0_core_m_axi_hp_2_aw_payload_size[2:0]                ), //o
    .m_axi_hp_2_aw_payload_burst (coreArea_0_core_m_axi_hp_2_aw_payload_burst[1:0]               ), //o
    .m_axi_hp_2_aw_payload_cache (coreArea_0_core_m_axi_hp_2_aw_payload_cache[3:0]               ), //o
    .m_axi_hp_2_aw_payload_user  (coreArea_0_core_m_axi_hp_2_aw_payload_user[3:0]                ), //o
    .m_axi_hp_2_aw_payload_prot  (coreArea_0_core_m_axi_hp_2_aw_payload_prot[2:0]                ), //o
    .m_axi_hp_2_w_valid          (coreArea_0_core_m_axi_hp_2_w_valid                             ), //o
    .m_axi_hp_2_w_ready          (m_axi_hp_0_2_wready                                            ), //i
    .m_axi_hp_2_w_payload_data   (coreArea_0_core_m_axi_hp_2_w_payload_data[127:0]               ), //o
    .m_axi_hp_2_w_payload_strb   (coreArea_0_core_m_axi_hp_2_w_payload_strb[15:0]                ), //o
    .m_axi_hp_2_w_payload_last   (coreArea_0_core_m_axi_hp_2_w_payload_last                      ), //o
    .m_axi_hp_2_b_valid          (m_axi_hp_0_2_bvalid                                            ), //i
    .m_axi_hp_2_b_ready          (coreArea_0_core_m_axi_hp_2_b_ready                             ), //o
    .m_axi_hp_2_b_payload_id     (m_axi_hp_0_2_bid[3:0]                                          ), //i
    .m_axi_hp_2_b_payload_resp   (m_axi_hp_0_2_bresp[1:0]                                        ), //i
    .m_axi_hp_2_ar_valid         (coreArea_0_core_m_axi_hp_2_ar_valid                            ), //o
    .m_axi_hp_2_ar_ready         (m_axi_hp_0_2_arready                                           ), //i
    .m_axi_hp_2_ar_payload_addr  (coreArea_0_core_m_axi_hp_2_ar_payload_addr[31:0]               ), //o
    .m_axi_hp_2_ar_payload_id    (coreArea_0_core_m_axi_hp_2_ar_payload_id[3:0]                  ), //o
    .m_axi_hp_2_ar_payload_len   (coreArea_0_core_m_axi_hp_2_ar_payload_len[7:0]                 ), //o
    .m_axi_hp_2_ar_payload_size  (coreArea_0_core_m_axi_hp_2_ar_payload_size[2:0]                ), //o
    .m_axi_hp_2_ar_payload_burst (coreArea_0_core_m_axi_hp_2_ar_payload_burst[1:0]               ), //o
    .m_axi_hp_2_ar_payload_cache (coreArea_0_core_m_axi_hp_2_ar_payload_cache[3:0]               ), //o
    .m_axi_hp_2_ar_payload_user  (coreArea_0_core_m_axi_hp_2_ar_payload_user[3:0]                ), //o
    .m_axi_hp_2_ar_payload_prot  (coreArea_0_core_m_axi_hp_2_ar_payload_prot[2:0]                ), //o
    .m_axi_hp_2_r_valid          (m_axi_hp_0_2_rvalid                                            ), //i
    .m_axi_hp_2_r_ready          (coreArea_0_core_m_axi_hp_2_r_ready                             ), //o
    .m_axi_hp_2_r_payload_data   (m_axi_hp_0_2_rdata[127:0]                                      ), //i
    .m_axi_hp_2_r_payload_id     (m_axi_hp_0_2_rid[3:0]                                          ), //i
    .m_axi_hp_2_r_payload_resp   (m_axi_hp_0_2_rresp[1:0]                                        ), //i
    .m_axi_hp_2_r_payload_last   (m_axi_hp_0_2_rlast                                             ), //i
    .m_axi_hp_3_aw_valid         (coreArea_0_core_m_axi_hp_3_aw_valid                            ), //o
    .m_axi_hp_3_aw_ready         (m_axi_hp_0_3_awready                                           ), //i
    .m_axi_hp_3_aw_payload_addr  (coreArea_0_core_m_axi_hp_3_aw_payload_addr[31:0]               ), //o
    .m_axi_hp_3_aw_payload_id    (coreArea_0_core_m_axi_hp_3_aw_payload_id[3:0]                  ), //o
    .m_axi_hp_3_aw_payload_len   (coreArea_0_core_m_axi_hp_3_aw_payload_len[7:0]                 ), //o
    .m_axi_hp_3_aw_payload_size  (coreArea_0_core_m_axi_hp_3_aw_payload_size[2:0]                ), //o
    .m_axi_hp_3_aw_payload_burst (coreArea_0_core_m_axi_hp_3_aw_payload_burst[1:0]               ), //o
    .m_axi_hp_3_aw_payload_cache (coreArea_0_core_m_axi_hp_3_aw_payload_cache[3:0]               ), //o
    .m_axi_hp_3_aw_payload_user  (coreArea_0_core_m_axi_hp_3_aw_payload_user[3:0]                ), //o
    .m_axi_hp_3_aw_payload_prot  (coreArea_0_core_m_axi_hp_3_aw_payload_prot[2:0]                ), //o
    .m_axi_hp_3_w_valid          (coreArea_0_core_m_axi_hp_3_w_valid                             ), //o
    .m_axi_hp_3_w_ready          (m_axi_hp_0_3_wready                                            ), //i
    .m_axi_hp_3_w_payload_data   (coreArea_0_core_m_axi_hp_3_w_payload_data[127:0]               ), //o
    .m_axi_hp_3_w_payload_strb   (coreArea_0_core_m_axi_hp_3_w_payload_strb[15:0]                ), //o
    .m_axi_hp_3_w_payload_last   (coreArea_0_core_m_axi_hp_3_w_payload_last                      ), //o
    .m_axi_hp_3_b_valid          (m_axi_hp_0_3_bvalid                                            ), //i
    .m_axi_hp_3_b_ready          (coreArea_0_core_m_axi_hp_3_b_ready                             ), //o
    .m_axi_hp_3_b_payload_id     (m_axi_hp_0_3_bid[3:0]                                          ), //i
    .m_axi_hp_3_b_payload_resp   (m_axi_hp_0_3_bresp[1:0]                                        ), //i
    .m_axi_hp_3_ar_valid         (coreArea_0_core_m_axi_hp_3_ar_valid                            ), //o
    .m_axi_hp_3_ar_ready         (m_axi_hp_0_3_arready                                           ), //i
    .m_axi_hp_3_ar_payload_addr  (coreArea_0_core_m_axi_hp_3_ar_payload_addr[31:0]               ), //o
    .m_axi_hp_3_ar_payload_id    (coreArea_0_core_m_axi_hp_3_ar_payload_id[3:0]                  ), //o
    .m_axi_hp_3_ar_payload_len   (coreArea_0_core_m_axi_hp_3_ar_payload_len[7:0]                 ), //o
    .m_axi_hp_3_ar_payload_size  (coreArea_0_core_m_axi_hp_3_ar_payload_size[2:0]                ), //o
    .m_axi_hp_3_ar_payload_burst (coreArea_0_core_m_axi_hp_3_ar_payload_burst[1:0]               ), //o
    .m_axi_hp_3_ar_payload_cache (coreArea_0_core_m_axi_hp_3_ar_payload_cache[3:0]               ), //o
    .m_axi_hp_3_ar_payload_user  (coreArea_0_core_m_axi_hp_3_ar_payload_user[3:0]                ), //o
    .m_axi_hp_3_ar_payload_prot  (coreArea_0_core_m_axi_hp_3_ar_payload_prot[2:0]                ), //o
    .m_axi_hp_3_r_valid          (m_axi_hp_0_3_rvalid                                            ), //i
    .m_axi_hp_3_r_ready          (coreArea_0_core_m_axi_hp_3_r_ready                             ), //o
    .m_axi_hp_3_r_payload_data   (m_axi_hp_0_3_rdata[127:0]                                      ), //i
    .m_axi_hp_3_r_payload_id     (m_axi_hp_0_3_rid[3:0]                                          ), //i
    .m_axi_hp_3_r_payload_resp   (m_axi_hp_0_3_rresp[1:0]                                        ), //i
    .m_axi_hp_3_r_payload_last   (m_axi_hp_0_3_rlast                                             ), //i
    .aresetn                     (S00_ARESETN                                                    ), //i
    .clk_0_clk                   (clk_0_clk                                                      ), //i
    .clk_0_resetn                (clk_0_resetn                                                   )  //i
  );
  DataPath_1 coreArea_1_core (
    .c2c_from_valid         (toplevel_coreArea_0_core_c2c_to_toStream_valid                   ), //i
    .c2c_from_ready         (coreArea_1_core_c2c_from_ready                                   ), //o
    .c2c_from_payload_last  (toplevel_coreArea_0_core_c2c_to_toStream_payload_last            ), //i
    .c2c_from_payload_tdata (toplevel_coreArea_0_core_c2c_to_toStream_payload_tdata[15:0]     ), //i
    .c2c_from_payload_tuser (toplevel_coreArea_0_core_c2c_to_toStream_payload_tuser[5:0]      ), //i
    .c2c_from_payload_tdest (toplevel_coreArea_0_core_c2c_to_toStream_payload_tdest           ), //i
    .c2c_to_valid           (coreArea_1_core_c2c_to_valid                                     ), //o
    .c2c_to_payload_last    (coreArea_1_core_c2c_to_payload_last                              ), //o
    .c2c_to_payload_tdata   (coreArea_1_core_c2c_to_payload_tdata[15:0]                       ), //o
    .c2c_to_payload_tuser   (coreArea_1_core_c2c_to_payload_tuser[5:0]                        ), //o
    .c2c_to_payload_tdest   (coreArea_1_core_c2c_to_payload_tdest                             ), //o
    .toAxiLite_tokenCnt     (coreArea_1_core_toAxiLite_tokenCnt[15:0]                         ), //o
    .toAxiLite_argMaxVld    (coreArea_1_core_toAxiLite_argMaxVld                              ), //o
    .toAxiLite_argMaxIndex  (coreArea_1_core_toAxiLite_argMaxIndex[16:0]                      ), //o
    .toAxiLite_prefill      (coreArea_1_core_toAxiLite_prefill                                ), //o
    .toAxiLite_layerCnt     (coreArea_1_core_toAxiLite_layerCnt[7:0]                          ), //o
    .tokenIndex_valid       (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid_1      ), //i
    .tokenIndex_ready       (coreArea_1_core_tokenIndex_ready                                 ), //o
    .tokenIndex_tdata       (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata_1[16:0]), //i
    .tokenIndex_tuser       (toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser_1[5:0] ), //i
    .m_axi_aw_valid         (coreArea_1_core_m_axi_aw_valid                                   ), //o
    .m_axi_aw_ready         (M01_AXI_awready                                                  ), //i
    .m_axi_aw_payload_addr  (coreArea_1_core_m_axi_aw_payload_addr[31:0]                      ), //o
    .m_axi_aw_payload_id    (coreArea_1_core_m_axi_aw_payload_id[3:0]                         ), //o
    .m_axi_aw_payload_len   (coreArea_1_core_m_axi_aw_payload_len[7:0]                        ), //o
    .m_axi_aw_payload_size  (coreArea_1_core_m_axi_aw_payload_size[2:0]                       ), //o
    .m_axi_aw_payload_burst (coreArea_1_core_m_axi_aw_payload_burst[1:0]                      ), //o
    .m_axi_aw_payload_cache (coreArea_1_core_m_axi_aw_payload_cache[3:0]                      ), //o
    .m_axi_aw_payload_user  (coreArea_1_core_m_axi_aw_payload_user[3:0]                       ), //o
    .m_axi_aw_payload_prot  (coreArea_1_core_m_axi_aw_payload_prot[2:0]                       ), //o
    .m_axi_w_valid          (coreArea_1_core_m_axi_w_valid                                    ), //o
    .m_axi_w_ready          (M01_AXI_wready                                                   ), //i
    .m_axi_w_payload_data   (coreArea_1_core_m_axi_w_payload_data[511:0]                      ), //o
    .m_axi_w_payload_strb   (coreArea_1_core_m_axi_w_payload_strb[63:0]                       ), //o
    .m_axi_w_payload_last   (coreArea_1_core_m_axi_w_payload_last                             ), //o
    .m_axi_b_valid          (M01_AXI_bvalid                                                   ), //i
    .m_axi_b_ready          (coreArea_1_core_m_axi_b_ready                                    ), //o
    .m_axi_b_payload_id     (M01_AXI_bid[3:0]                                                 ), //i
    .m_axi_b_payload_resp   (M01_AXI_bresp[1:0]                                               ), //i
    .m_axi_ar_valid         (coreArea_1_core_m_axi_ar_valid                                   ), //o
    .m_axi_ar_ready         (M01_AXI_arready                                                  ), //i
    .m_axi_ar_payload_addr  (coreArea_1_core_m_axi_ar_payload_addr[31:0]                      ), //o
    .m_axi_ar_payload_id    (coreArea_1_core_m_axi_ar_payload_id[3:0]                         ), //o
    .m_axi_ar_payload_len   (coreArea_1_core_m_axi_ar_payload_len[7:0]                        ), //o
    .m_axi_ar_payload_size  (coreArea_1_core_m_axi_ar_payload_size[2:0]                       ), //o
    .m_axi_ar_payload_burst (coreArea_1_core_m_axi_ar_payload_burst[1:0]                      ), //o
    .m_axi_ar_payload_cache (coreArea_1_core_m_axi_ar_payload_cache[3:0]                      ), //o
    .m_axi_ar_payload_user  (coreArea_1_core_m_axi_ar_payload_user[3:0]                       ), //o
    .m_axi_ar_payload_prot  (coreArea_1_core_m_axi_ar_payload_prot[2:0]                       ), //o
    .m_axi_r_valid          (M01_AXI_rvalid                                                   ), //i
    .m_axi_r_ready          (coreArea_1_core_m_axi_r_ready                                    ), //o
    .m_axi_r_payload_data   (M01_AXI_rdata[511:0]                                             ), //i
    .m_axi_r_payload_id     (M01_AXI_rid[3:0]                                                 ), //i
    .m_axi_r_payload_resp   (M01_AXI_rresp[1:0]                                               ), //i
    .m_axi_r_payload_last   (M01_AXI_rlast                                                    ), //i
    .aresetn                (S00_ARESETN                                                      ), //i
    .clk_1_clk              (clk_1_clk                                                        ), //i
    .clk_1_resetn           (clk_1_resetn                                                     )  //i
  );
  assign S00_AXIL_awready = cfg_io_ctrl_aw_ready;
  assign S00_AXIL_wready = cfg_io_ctrl_w_ready;
  assign S00_AXIL_bvalid = cfg_io_ctrl_b_valid;
  assign S00_AXIL_bresp = cfg_io_ctrl_b_payload_resp;
  assign S00_AXIL_arready = cfg_io_ctrl_ar_ready;
  assign S00_AXIL_rvalid = cfg_io_ctrl_r_valid;
  assign S00_AXIL_rdata = cfg_io_ctrl_r_payload_data;
  assign S00_AXIL_rresp = cfg_io_ctrl_r_payload_resp;
  assign softReset = cfg_resetOut;
  assign clk_0_clk = S00_ACLK;
  assign clk_0_resetn = S00_ARESETN;
  assign clk_1_clk = S00_ACLK;
  assign clk_1_resetn = S00_ARESETN;
  assign M01_AXI_awvalid = coreArea_1_core_m_axi_aw_valid;
  assign M01_AXI_awaddr = coreArea_1_core_m_axi_aw_payload_addr;
  assign M01_AXI_awid = coreArea_1_core_m_axi_aw_payload_id;
  assign M01_AXI_awlen = coreArea_1_core_m_axi_aw_payload_len;
  assign M01_AXI_awsize = coreArea_1_core_m_axi_aw_payload_size;
  assign M01_AXI_awburst = coreArea_1_core_m_axi_aw_payload_burst;
  assign M01_AXI_awcache = coreArea_1_core_m_axi_aw_payload_cache;
  assign M01_AXI_awuser = coreArea_1_core_m_axi_aw_payload_user;
  assign M01_AXI_awprot = coreArea_1_core_m_axi_aw_payload_prot;
  assign M01_AXI_wvalid = coreArea_1_core_m_axi_w_valid;
  assign M01_AXI_wdata = coreArea_1_core_m_axi_w_payload_data;
  assign M01_AXI_wstrb = coreArea_1_core_m_axi_w_payload_strb;
  assign M01_AXI_wlast = coreArea_1_core_m_axi_w_payload_last;
  assign M01_AXI_bready = coreArea_1_core_m_axi_b_ready;
  assign M01_AXI_arvalid = coreArea_1_core_m_axi_ar_valid;
  assign M01_AXI_araddr = coreArea_1_core_m_axi_ar_payload_addr;
  assign M01_AXI_arid = coreArea_1_core_m_axi_ar_payload_id;
  assign M01_AXI_arlen = coreArea_1_core_m_axi_ar_payload_len;
  assign M01_AXI_arsize = coreArea_1_core_m_axi_ar_payload_size;
  assign M01_AXI_arburst = coreArea_1_core_m_axi_ar_payload_burst;
  assign M01_AXI_arcache = coreArea_1_core_m_axi_ar_payload_cache;
  assign M01_AXI_aruser = coreArea_1_core_m_axi_ar_payload_user;
  assign M01_AXI_arprot = coreArea_1_core_m_axi_ar_payload_prot;
  assign M01_AXI_rready = coreArea_1_core_m_axi_r_ready;
  assign m_axi_hp_0_0_awvalid = coreArea_0_core_m_axi_hp_0_aw_valid;
  assign m_axi_hp_0_0_awaddr = coreArea_0_core_m_axi_hp_0_aw_payload_addr;
  assign m_axi_hp_0_0_awid = coreArea_0_core_m_axi_hp_0_aw_payload_id;
  assign m_axi_hp_0_0_awlen = coreArea_0_core_m_axi_hp_0_aw_payload_len;
  assign m_axi_hp_0_0_awsize = coreArea_0_core_m_axi_hp_0_aw_payload_size;
  assign m_axi_hp_0_0_awburst = coreArea_0_core_m_axi_hp_0_aw_payload_burst;
  assign m_axi_hp_0_0_awcache = coreArea_0_core_m_axi_hp_0_aw_payload_cache;
  assign m_axi_hp_0_0_awuser = coreArea_0_core_m_axi_hp_0_aw_payload_user;
  assign m_axi_hp_0_0_awprot = coreArea_0_core_m_axi_hp_0_aw_payload_prot;
  assign m_axi_hp_0_0_wvalid = coreArea_0_core_m_axi_hp_0_w_valid;
  assign m_axi_hp_0_0_wdata = coreArea_0_core_m_axi_hp_0_w_payload_data;
  assign m_axi_hp_0_0_wstrb = coreArea_0_core_m_axi_hp_0_w_payload_strb;
  assign m_axi_hp_0_0_wlast = coreArea_0_core_m_axi_hp_0_w_payload_last;
  assign m_axi_hp_0_0_bready = coreArea_0_core_m_axi_hp_0_b_ready;
  assign m_axi_hp_0_0_arvalid = coreArea_0_core_m_axi_hp_0_ar_valid;
  assign m_axi_hp_0_0_araddr = coreArea_0_core_m_axi_hp_0_ar_payload_addr;
  assign m_axi_hp_0_0_arid = coreArea_0_core_m_axi_hp_0_ar_payload_id;
  assign m_axi_hp_0_0_arlen = coreArea_0_core_m_axi_hp_0_ar_payload_len;
  assign m_axi_hp_0_0_arsize = coreArea_0_core_m_axi_hp_0_ar_payload_size;
  assign m_axi_hp_0_0_arburst = coreArea_0_core_m_axi_hp_0_ar_payload_burst;
  assign m_axi_hp_0_0_arcache = coreArea_0_core_m_axi_hp_0_ar_payload_cache;
  assign m_axi_hp_0_0_aruser = coreArea_0_core_m_axi_hp_0_ar_payload_user;
  assign m_axi_hp_0_0_arprot = coreArea_0_core_m_axi_hp_0_ar_payload_prot;
  assign m_axi_hp_0_0_rready = coreArea_0_core_m_axi_hp_0_r_ready;
  assign m_axi_hp_0_1_awvalid = coreArea_0_core_m_axi_hp_1_aw_valid;
  assign m_axi_hp_0_1_awaddr = coreArea_0_core_m_axi_hp_1_aw_payload_addr;
  assign m_axi_hp_0_1_awid = coreArea_0_core_m_axi_hp_1_aw_payload_id;
  assign m_axi_hp_0_1_awlen = coreArea_0_core_m_axi_hp_1_aw_payload_len;
  assign m_axi_hp_0_1_awsize = coreArea_0_core_m_axi_hp_1_aw_payload_size;
  assign m_axi_hp_0_1_awburst = coreArea_0_core_m_axi_hp_1_aw_payload_burst;
  assign m_axi_hp_0_1_awcache = coreArea_0_core_m_axi_hp_1_aw_payload_cache;
  assign m_axi_hp_0_1_awuser = coreArea_0_core_m_axi_hp_1_aw_payload_user;
  assign m_axi_hp_0_1_awprot = coreArea_0_core_m_axi_hp_1_aw_payload_prot;
  assign m_axi_hp_0_1_wvalid = coreArea_0_core_m_axi_hp_1_w_valid;
  assign m_axi_hp_0_1_wdata = coreArea_0_core_m_axi_hp_1_w_payload_data;
  assign m_axi_hp_0_1_wstrb = coreArea_0_core_m_axi_hp_1_w_payload_strb;
  assign m_axi_hp_0_1_wlast = coreArea_0_core_m_axi_hp_1_w_payload_last;
  assign m_axi_hp_0_1_bready = coreArea_0_core_m_axi_hp_1_b_ready;
  assign m_axi_hp_0_1_arvalid = coreArea_0_core_m_axi_hp_1_ar_valid;
  assign m_axi_hp_0_1_araddr = coreArea_0_core_m_axi_hp_1_ar_payload_addr;
  assign m_axi_hp_0_1_arid = coreArea_0_core_m_axi_hp_1_ar_payload_id;
  assign m_axi_hp_0_1_arlen = coreArea_0_core_m_axi_hp_1_ar_payload_len;
  assign m_axi_hp_0_1_arsize = coreArea_0_core_m_axi_hp_1_ar_payload_size;
  assign m_axi_hp_0_1_arburst = coreArea_0_core_m_axi_hp_1_ar_payload_burst;
  assign m_axi_hp_0_1_arcache = coreArea_0_core_m_axi_hp_1_ar_payload_cache;
  assign m_axi_hp_0_1_aruser = coreArea_0_core_m_axi_hp_1_ar_payload_user;
  assign m_axi_hp_0_1_arprot = coreArea_0_core_m_axi_hp_1_ar_payload_prot;
  assign m_axi_hp_0_1_rready = coreArea_0_core_m_axi_hp_1_r_ready;
  assign m_axi_hp_0_2_awvalid = coreArea_0_core_m_axi_hp_2_aw_valid;
  assign m_axi_hp_0_2_awaddr = coreArea_0_core_m_axi_hp_2_aw_payload_addr;
  assign m_axi_hp_0_2_awid = coreArea_0_core_m_axi_hp_2_aw_payload_id;
  assign m_axi_hp_0_2_awlen = coreArea_0_core_m_axi_hp_2_aw_payload_len;
  assign m_axi_hp_0_2_awsize = coreArea_0_core_m_axi_hp_2_aw_payload_size;
  assign m_axi_hp_0_2_awburst = coreArea_0_core_m_axi_hp_2_aw_payload_burst;
  assign m_axi_hp_0_2_awcache = coreArea_0_core_m_axi_hp_2_aw_payload_cache;
  assign m_axi_hp_0_2_awuser = coreArea_0_core_m_axi_hp_2_aw_payload_user;
  assign m_axi_hp_0_2_awprot = coreArea_0_core_m_axi_hp_2_aw_payload_prot;
  assign m_axi_hp_0_2_wvalid = coreArea_0_core_m_axi_hp_2_w_valid;
  assign m_axi_hp_0_2_wdata = coreArea_0_core_m_axi_hp_2_w_payload_data;
  assign m_axi_hp_0_2_wstrb = coreArea_0_core_m_axi_hp_2_w_payload_strb;
  assign m_axi_hp_0_2_wlast = coreArea_0_core_m_axi_hp_2_w_payload_last;
  assign m_axi_hp_0_2_bready = coreArea_0_core_m_axi_hp_2_b_ready;
  assign m_axi_hp_0_2_arvalid = coreArea_0_core_m_axi_hp_2_ar_valid;
  assign m_axi_hp_0_2_araddr = coreArea_0_core_m_axi_hp_2_ar_payload_addr;
  assign m_axi_hp_0_2_arid = coreArea_0_core_m_axi_hp_2_ar_payload_id;
  assign m_axi_hp_0_2_arlen = coreArea_0_core_m_axi_hp_2_ar_payload_len;
  assign m_axi_hp_0_2_arsize = coreArea_0_core_m_axi_hp_2_ar_payload_size;
  assign m_axi_hp_0_2_arburst = coreArea_0_core_m_axi_hp_2_ar_payload_burst;
  assign m_axi_hp_0_2_arcache = coreArea_0_core_m_axi_hp_2_ar_payload_cache;
  assign m_axi_hp_0_2_aruser = coreArea_0_core_m_axi_hp_2_ar_payload_user;
  assign m_axi_hp_0_2_arprot = coreArea_0_core_m_axi_hp_2_ar_payload_prot;
  assign m_axi_hp_0_2_rready = coreArea_0_core_m_axi_hp_2_r_ready;
  assign m_axi_hp_0_3_awvalid = coreArea_0_core_m_axi_hp_3_aw_valid;
  assign m_axi_hp_0_3_awaddr = coreArea_0_core_m_axi_hp_3_aw_payload_addr;
  assign m_axi_hp_0_3_awid = coreArea_0_core_m_axi_hp_3_aw_payload_id;
  assign m_axi_hp_0_3_awlen = coreArea_0_core_m_axi_hp_3_aw_payload_len;
  assign m_axi_hp_0_3_awsize = coreArea_0_core_m_axi_hp_3_aw_payload_size;
  assign m_axi_hp_0_3_awburst = coreArea_0_core_m_axi_hp_3_aw_payload_burst;
  assign m_axi_hp_0_3_awcache = coreArea_0_core_m_axi_hp_3_aw_payload_cache;
  assign m_axi_hp_0_3_awuser = coreArea_0_core_m_axi_hp_3_aw_payload_user;
  assign m_axi_hp_0_3_awprot = coreArea_0_core_m_axi_hp_3_aw_payload_prot;
  assign m_axi_hp_0_3_wvalid = coreArea_0_core_m_axi_hp_3_w_valid;
  assign m_axi_hp_0_3_wdata = coreArea_0_core_m_axi_hp_3_w_payload_data;
  assign m_axi_hp_0_3_wstrb = coreArea_0_core_m_axi_hp_3_w_payload_strb;
  assign m_axi_hp_0_3_wlast = coreArea_0_core_m_axi_hp_3_w_payload_last;
  assign m_axi_hp_0_3_bready = coreArea_0_core_m_axi_hp_3_b_ready;
  assign m_axi_hp_0_3_arvalid = coreArea_0_core_m_axi_hp_3_ar_valid;
  assign m_axi_hp_0_3_araddr = coreArea_0_core_m_axi_hp_3_ar_payload_addr;
  assign m_axi_hp_0_3_arid = coreArea_0_core_m_axi_hp_3_ar_payload_id;
  assign m_axi_hp_0_3_arlen = coreArea_0_core_m_axi_hp_3_ar_payload_len;
  assign m_axi_hp_0_3_arsize = coreArea_0_core_m_axi_hp_3_ar_payload_size;
  assign m_axi_hp_0_3_arburst = coreArea_0_core_m_axi_hp_3_ar_payload_burst;
  assign m_axi_hp_0_3_arcache = coreArea_0_core_m_axi_hp_3_ar_payload_cache;
  assign m_axi_hp_0_3_aruser = coreArea_0_core_m_axi_hp_3_ar_payload_user;
  assign m_axi_hp_0_3_arprot = coreArea_0_core_m_axi_hp_3_ar_payload_prot;
  assign m_axi_hp_0_3_rready = coreArea_0_core_m_axi_hp_3_r_ready;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid = toplevel_cfg_io_tokenIndex_regNext_regNext_valid;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata = toplevel_cfg_io_tokenIndex_regNext_regNext_tdata;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser = toplevel_cfg_io_tokenIndex_regNext_regNext_tuser;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_ready = coreArea_0_core_tokenIndex_ready;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_valid_1 = toplevel_cfg_io_tokenIndex_regNext_regNext_valid_1;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tdata_1 = toplevel_cfg_io_tokenIndex_regNext_regNext_tdata_1;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_tuser_1 = toplevel_cfg_io_tokenIndex_regNext_regNext_tuser_1;
  assign toplevel_cfg_io_tokenIndex_regNext_regNext_toStream_ready_1 = coreArea_1_core_tokenIndex_ready;
  assign toplevel_coreArea_1_core_c2c_to_toStream_valid = coreArea_1_core_c2c_to_valid;
  assign toplevel_coreArea_1_core_c2c_to_toStream_payload_last = coreArea_1_core_c2c_to_payload_last;
  assign toplevel_coreArea_1_core_c2c_to_toStream_payload_tdata = coreArea_1_core_c2c_to_payload_tdata;
  assign toplevel_coreArea_1_core_c2c_to_toStream_payload_tuser = coreArea_1_core_c2c_to_payload_tuser;
  assign toplevel_coreArea_1_core_c2c_to_toStream_payload_tdest = coreArea_1_core_c2c_to_payload_tdest;
  assign toplevel_coreArea_1_core_c2c_to_toStream_ready = coreArea_0_core_c2c_from_ready;
  assign toplevel_coreArea_0_core_c2c_to_toStream_valid = coreArea_0_core_c2c_to_valid;
  assign toplevel_coreArea_0_core_c2c_to_toStream_payload_last = coreArea_0_core_c2c_to_payload_last;
  assign toplevel_coreArea_0_core_c2c_to_toStream_payload_tdata = coreArea_0_core_c2c_to_payload_tdata;
  assign toplevel_coreArea_0_core_c2c_to_toStream_payload_tuser = coreArea_0_core_c2c_to_payload_tuser;
  assign toplevel_coreArea_0_core_c2c_to_toStream_payload_tdest = coreArea_0_core_c2c_to_payload_tdest;
  assign toplevel_coreArea_0_core_c2c_to_toStream_ready = coreArea_1_core_c2c_from_ready;
  always @(posedge S00_ACLK or negedge S00_ARESETN) begin
    if(!S00_ARESETN) begin
      toplevel_cfg_io_tokenIndex_regNext_valid <= 1'b0;
      toplevel_cfg_io_tokenIndex_regNext_regNext_valid <= 1'b0;
      toplevel_cfg_io_tokenIndex_regNext_valid_1 <= 1'b0;
      toplevel_cfg_io_tokenIndex_regNext_regNext_valid_1 <= 1'b0;
    end else begin
      toplevel_cfg_io_tokenIndex_regNext_valid <= cfg_io_tokenIndex_valid;
      toplevel_cfg_io_tokenIndex_regNext_regNext_valid <= toplevel_cfg_io_tokenIndex_regNext_valid;
      toplevel_cfg_io_tokenIndex_regNext_valid_1 <= cfg_io_tokenIndex_valid;
      toplevel_cfg_io_tokenIndex_regNext_regNext_valid_1 <= toplevel_cfg_io_tokenIndex_regNext_valid_1;
    end
  end

  always @(posedge S00_ACLK) begin
    toplevel_cfg_io_tokenIndex_regNext_tdata <= cfg_io_tokenIndex_tdata;
    toplevel_cfg_io_tokenIndex_regNext_tuser <= cfg_io_tokenIndex_tuser;
    toplevel_cfg_io_tokenIndex_regNext_regNext_tdata <= toplevel_cfg_io_tokenIndex_regNext_tdata;
    toplevel_cfg_io_tokenIndex_regNext_regNext_tuser <= toplevel_cfg_io_tokenIndex_regNext_tuser;
    toplevel_cfg_io_tokenIndex_regNext_tdata_1 <= cfg_io_tokenIndex_tdata;
    toplevel_cfg_io_tokenIndex_regNext_tuser_1 <= cfg_io_tokenIndex_tuser;
    toplevel_cfg_io_tokenIndex_regNext_regNext_tdata_1 <= toplevel_cfg_io_tokenIndex_regNext_tdata_1;
    toplevel_cfg_io_tokenIndex_regNext_regNext_tuser_1 <= toplevel_cfg_io_tokenIndex_regNext_tuser_1;
  end


endmodule

