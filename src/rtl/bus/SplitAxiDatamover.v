// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SplitAxiDatamover (
  input  wire          s2mm_tvalid,
  output wire          s2mm_tready,
  input  wire [511:0]  s2mm_tdata,
  input  wire [63:0]   s2mm_tkeep,
  input  wire          s2mm_tlast,
  output wire          mm2s_tvalid,
  input  wire          mm2s_tready,
  output wire [511:0]  mm2s_tdata,
  output wire [63:0]   mm2s_tkeep,
  output wire          mm2s_tlast,
  input  wire          s2mmCmd_tvalid,
  output wire          s2mmCmd_tready,
  input  wire [71:0]   s2mmCmd_tdata,
  input  wire          mm2sCmd_tvalid,
  output wire          mm2sCmd_tready,
  input  wire [71:0]   mm2sCmd_tdata,
  output wire          m_axi_0_awvalid,
  input  wire          m_axi_0_awready,
  output wire [31:0]   m_axi_0_awaddr,
  output wire [3:0]    m_axi_0_awid,
  output wire [7:0]    m_axi_0_awlen,
  output wire [2:0]    m_axi_0_awsize,
  output wire [1:0]    m_axi_0_awburst,
  output wire [3:0]    m_axi_0_awcache,
  output wire [3:0]    m_axi_0_awuser,
  output wire [2:0]    m_axi_0_awprot,
  output wire          m_axi_0_wvalid,
  input  wire          m_axi_0_wready,
  output wire [127:0]  m_axi_0_wdata,
  output wire [15:0]   m_axi_0_wstrb,
  output wire          m_axi_0_wlast,
  input  wire          m_axi_0_bvalid,
  output wire          m_axi_0_bready,
  input  wire [3:0]    m_axi_0_bid,
  input  wire [1:0]    m_axi_0_bresp,
  output wire          m_axi_0_arvalid,
  input  wire          m_axi_0_arready,
  output wire [31:0]   m_axi_0_araddr,
  output wire [3:0]    m_axi_0_arid,
  output wire [7:0]    m_axi_0_arlen,
  output wire [2:0]    m_axi_0_arsize,
  output wire [1:0]    m_axi_0_arburst,
  output wire [3:0]    m_axi_0_arcache,
  output wire [3:0]    m_axi_0_aruser,
  output wire [2:0]    m_axi_0_arprot,
  input  wire          m_axi_0_rvalid,
  output wire          m_axi_0_rready,
  input  wire [127:0]  m_axi_0_rdata,
  input  wire [3:0]    m_axi_0_rid,
  input  wire [1:0]    m_axi_0_rresp,
  input  wire          m_axi_0_rlast,
  output wire          m_axi_1_awvalid,
  input  wire          m_axi_1_awready,
  output wire [31:0]   m_axi_1_awaddr,
  output wire [3:0]    m_axi_1_awid,
  output wire [7:0]    m_axi_1_awlen,
  output wire [2:0]    m_axi_1_awsize,
  output wire [1:0]    m_axi_1_awburst,
  output wire [3:0]    m_axi_1_awcache,
  output wire [3:0]    m_axi_1_awuser,
  output wire [2:0]    m_axi_1_awprot,
  output wire          m_axi_1_wvalid,
  input  wire          m_axi_1_wready,
  output wire [127:0]  m_axi_1_wdata,
  output wire [15:0]   m_axi_1_wstrb,
  output wire          m_axi_1_wlast,
  input  wire          m_axi_1_bvalid,
  output wire          m_axi_1_bready,
  input  wire [3:0]    m_axi_1_bid,
  input  wire [1:0]    m_axi_1_bresp,
  output wire          m_axi_1_arvalid,
  input  wire          m_axi_1_arready,
  output wire [31:0]   m_axi_1_araddr,
  output wire [3:0]    m_axi_1_arid,
  output wire [7:0]    m_axi_1_arlen,
  output wire [2:0]    m_axi_1_arsize,
  output wire [1:0]    m_axi_1_arburst,
  output wire [3:0]    m_axi_1_arcache,
  output wire [3:0]    m_axi_1_aruser,
  output wire [2:0]    m_axi_1_arprot,
  input  wire          m_axi_1_rvalid,
  output wire          m_axi_1_rready,
  input  wire [127:0]  m_axi_1_rdata,
  input  wire [3:0]    m_axi_1_rid,
  input  wire [1:0]    m_axi_1_rresp,
  input  wire          m_axi_1_rlast,
  output wire          m_axi_2_awvalid,
  input  wire          m_axi_2_awready,
  output wire [31:0]   m_axi_2_awaddr,
  output wire [3:0]    m_axi_2_awid,
  output wire [7:0]    m_axi_2_awlen,
  output wire [2:0]    m_axi_2_awsize,
  output wire [1:0]    m_axi_2_awburst,
  output wire [3:0]    m_axi_2_awcache,
  output wire [3:0]    m_axi_2_awuser,
  output wire [2:0]    m_axi_2_awprot,
  output wire          m_axi_2_wvalid,
  input  wire          m_axi_2_wready,
  output wire [127:0]  m_axi_2_wdata,
  output wire [15:0]   m_axi_2_wstrb,
  output wire          m_axi_2_wlast,
  input  wire          m_axi_2_bvalid,
  output wire          m_axi_2_bready,
  input  wire [3:0]    m_axi_2_bid,
  input  wire [1:0]    m_axi_2_bresp,
  output wire          m_axi_2_arvalid,
  input  wire          m_axi_2_arready,
  output wire [31:0]   m_axi_2_araddr,
  output wire [3:0]    m_axi_2_arid,
  output wire [7:0]    m_axi_2_arlen,
  output wire [2:0]    m_axi_2_arsize,
  output wire [1:0]    m_axi_2_arburst,
  output wire [3:0]    m_axi_2_arcache,
  output wire [3:0]    m_axi_2_aruser,
  output wire [2:0]    m_axi_2_arprot,
  input  wire          m_axi_2_rvalid,
  output wire          m_axi_2_rready,
  input  wire [127:0]  m_axi_2_rdata,
  input  wire [3:0]    m_axi_2_rid,
  input  wire [1:0]    m_axi_2_rresp,
  input  wire          m_axi_2_rlast,
  output wire          m_axi_3_awvalid,
  input  wire          m_axi_3_awready,
  output wire [31:0]   m_axi_3_awaddr,
  output wire [3:0]    m_axi_3_awid,
  output wire [7:0]    m_axi_3_awlen,
  output wire [2:0]    m_axi_3_awsize,
  output wire [1:0]    m_axi_3_awburst,
  output wire [3:0]    m_axi_3_awcache,
  output wire [3:0]    m_axi_3_awuser,
  output wire [2:0]    m_axi_3_awprot,
  output wire          m_axi_3_wvalid,
  input  wire          m_axi_3_wready,
  output wire [127:0]  m_axi_3_wdata,
  output wire [15:0]   m_axi_3_wstrb,
  output wire          m_axi_3_wlast,
  input  wire          m_axi_3_bvalid,
  output wire          m_axi_3_bready,
  input  wire [3:0]    m_axi_3_bid,
  input  wire [1:0]    m_axi_3_bresp,
  output wire          m_axi_3_arvalid,
  input  wire          m_axi_3_arready,
  output wire [31:0]   m_axi_3_araddr,
  output wire [3:0]    m_axi_3_arid,
  output wire [7:0]    m_axi_3_arlen,
  output wire [2:0]    m_axi_3_arsize,
  output wire [1:0]    m_axi_3_arburst,
  output wire [3:0]    m_axi_3_arcache,
  output wire [3:0]    m_axi_3_aruser,
  output wire [2:0]    m_axi_3_arprot,
  input  wire          m_axi_3_rvalid,
  output wire          m_axi_3_rready,
  input  wire [127:0]  m_axi_3_rdata,
  input  wire [3:0]    m_axi_3_rid,
  input  wire [1:0]    m_axi_3_rresp,
  input  wire          m_axi_3_rlast,
  input  wire          ctrl_aw_valid,
  output wire          ctrl_aw_ready,
  input  wire [31:0]   ctrl_aw_payload_addr,
  input  wire [2:0]    ctrl_aw_payload_prot,
  input  wire          ctrl_w_valid,
  output wire          ctrl_w_ready,
  input  wire [31:0]   ctrl_w_payload_data,
  input  wire [3:0]    ctrl_w_payload_strb,
  output wire          ctrl_b_valid,
  input  wire          ctrl_b_ready,
  output wire [1:0]    ctrl_b_payload_resp,
  input  wire          ctrl_ar_valid,
  output wire          ctrl_ar_ready,
  input  wire [31:0]   ctrl_ar_payload_addr,
  input  wire [2:0]    ctrl_ar_payload_prot,
  output wire          ctrl_r_valid,
  input  wire          ctrl_r_ready,
  output wire [31:0]   ctrl_r_payload_data,
  output wire [1:0]    ctrl_r_payload_resp,
  input  wire          aresetn,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                dma_0_s_axis_s2mm_tready;
  wire                dma_0_s_axis_s2mm_cmd_tready;
  wire                dma_0_s_axis_mm2s_cmd_tready;
  wire                dma_0_m_axi_mm2s_arvalid;
  wire       [31:0]   dma_0_m_axi_mm2s_araddr;
  wire       [3:0]    dma_0_m_axi_mm2s_arid;
  wire       [7:0]    dma_0_m_axi_mm2s_arlen;
  wire       [2:0]    dma_0_m_axi_mm2s_arsize;
  wire       [1:0]    dma_0_m_axi_mm2s_arburst;
  wire       [3:0]    dma_0_m_axi_mm2s_arcache;
  wire       [3:0]    dma_0_m_axi_mm2s_aruser;
  wire       [2:0]    dma_0_m_axi_mm2s_arprot;
  wire                dma_0_m_axi_s2mm_awvalid;
  wire       [31:0]   dma_0_m_axi_s2mm_awaddr;
  wire       [3:0]    dma_0_m_axi_s2mm_awid;
  wire       [7:0]    dma_0_m_axi_s2mm_awlen;
  wire       [2:0]    dma_0_m_axi_s2mm_awsize;
  wire       [1:0]    dma_0_m_axi_s2mm_awburst;
  wire       [3:0]    dma_0_m_axi_s2mm_awcache;
  wire       [3:0]    dma_0_m_axi_s2mm_awuser;
  wire       [2:0]    dma_0_m_axi_s2mm_awprot;
  wire                dma_0_m_axi_s2mm_wvalid;
  wire       [127:0]  dma_0_m_axi_s2mm_wdata;
  wire       [15:0]   dma_0_m_axi_s2mm_wstrb;
  wire                dma_0_m_axi_s2mm_wlast;
  wire                dma_0_m_axi_mm2s_rready;
  wire                dma_0_m_axi_s2mm_bready;
  wire                dma_0_m_axis_s2mm_sts_tvalid;
  wire       [7:0]    dma_0_m_axis_s2mm_sts_tdata;
  wire       [0:0]    dma_0_m_axis_s2mm_sts_tkeep;
  wire                dma_0_m_axis_s2mm_sts_tlast;
  wire                dma_0_m_axis_mm2s_sts_tvalid;
  wire       [7:0]    dma_0_m_axis_mm2s_sts_tdata;
  wire       [0:0]    dma_0_m_axis_mm2s_sts_tkeep;
  wire                dma_0_m_axis_mm2s_sts_tlast;
  wire                dma_0_m_axis_mm2s_tvalid;
  wire       [127:0]  dma_0_m_axis_mm2s_tdata;
  wire       [15:0]   dma_0_m_axis_mm2s_tkeep;
  wire                dma_0_m_axis_mm2s_tlast;
  wire                dma_0_mm2s_err;
  wire                dma_0_s2mm_err;
  wire                dma_1_s_axis_s2mm_tready;
  wire                dma_1_s_axis_s2mm_cmd_tready;
  wire                dma_1_s_axis_mm2s_cmd_tready;
  wire                dma_1_m_axi_mm2s_arvalid;
  wire       [31:0]   dma_1_m_axi_mm2s_araddr;
  wire       [3:0]    dma_1_m_axi_mm2s_arid;
  wire       [7:0]    dma_1_m_axi_mm2s_arlen;
  wire       [2:0]    dma_1_m_axi_mm2s_arsize;
  wire       [1:0]    dma_1_m_axi_mm2s_arburst;
  wire       [3:0]    dma_1_m_axi_mm2s_arcache;
  wire       [3:0]    dma_1_m_axi_mm2s_aruser;
  wire       [2:0]    dma_1_m_axi_mm2s_arprot;
  wire                dma_1_m_axi_s2mm_awvalid;
  wire       [31:0]   dma_1_m_axi_s2mm_awaddr;
  wire       [3:0]    dma_1_m_axi_s2mm_awid;
  wire       [7:0]    dma_1_m_axi_s2mm_awlen;
  wire       [2:0]    dma_1_m_axi_s2mm_awsize;
  wire       [1:0]    dma_1_m_axi_s2mm_awburst;
  wire       [3:0]    dma_1_m_axi_s2mm_awcache;
  wire       [3:0]    dma_1_m_axi_s2mm_awuser;
  wire       [2:0]    dma_1_m_axi_s2mm_awprot;
  wire                dma_1_m_axi_s2mm_wvalid;
  wire       [127:0]  dma_1_m_axi_s2mm_wdata;
  wire       [15:0]   dma_1_m_axi_s2mm_wstrb;
  wire                dma_1_m_axi_s2mm_wlast;
  wire                dma_1_m_axi_mm2s_rready;
  wire                dma_1_m_axi_s2mm_bready;
  wire                dma_1_m_axis_s2mm_sts_tvalid;
  wire       [7:0]    dma_1_m_axis_s2mm_sts_tdata;
  wire       [0:0]    dma_1_m_axis_s2mm_sts_tkeep;
  wire                dma_1_m_axis_s2mm_sts_tlast;
  wire                dma_1_m_axis_mm2s_sts_tvalid;
  wire       [7:0]    dma_1_m_axis_mm2s_sts_tdata;
  wire       [0:0]    dma_1_m_axis_mm2s_sts_tkeep;
  wire                dma_1_m_axis_mm2s_sts_tlast;
  wire                dma_1_m_axis_mm2s_tvalid;
  wire       [127:0]  dma_1_m_axis_mm2s_tdata;
  wire       [15:0]   dma_1_m_axis_mm2s_tkeep;
  wire                dma_1_m_axis_mm2s_tlast;
  wire                dma_1_mm2s_err;
  wire                dma_1_s2mm_err;
  wire                dma_2_s_axis_s2mm_tready;
  wire                dma_2_s_axis_s2mm_cmd_tready;
  wire                dma_2_s_axis_mm2s_cmd_tready;
  wire                dma_2_m_axi_mm2s_arvalid;
  wire       [31:0]   dma_2_m_axi_mm2s_araddr;
  wire       [3:0]    dma_2_m_axi_mm2s_arid;
  wire       [7:0]    dma_2_m_axi_mm2s_arlen;
  wire       [2:0]    dma_2_m_axi_mm2s_arsize;
  wire       [1:0]    dma_2_m_axi_mm2s_arburst;
  wire       [3:0]    dma_2_m_axi_mm2s_arcache;
  wire       [3:0]    dma_2_m_axi_mm2s_aruser;
  wire       [2:0]    dma_2_m_axi_mm2s_arprot;
  wire                dma_2_m_axi_s2mm_awvalid;
  wire       [31:0]   dma_2_m_axi_s2mm_awaddr;
  wire       [3:0]    dma_2_m_axi_s2mm_awid;
  wire       [7:0]    dma_2_m_axi_s2mm_awlen;
  wire       [2:0]    dma_2_m_axi_s2mm_awsize;
  wire       [1:0]    dma_2_m_axi_s2mm_awburst;
  wire       [3:0]    dma_2_m_axi_s2mm_awcache;
  wire       [3:0]    dma_2_m_axi_s2mm_awuser;
  wire       [2:0]    dma_2_m_axi_s2mm_awprot;
  wire                dma_2_m_axi_s2mm_wvalid;
  wire       [127:0]  dma_2_m_axi_s2mm_wdata;
  wire       [15:0]   dma_2_m_axi_s2mm_wstrb;
  wire                dma_2_m_axi_s2mm_wlast;
  wire                dma_2_m_axi_mm2s_rready;
  wire                dma_2_m_axi_s2mm_bready;
  wire                dma_2_m_axis_s2mm_sts_tvalid;
  wire       [7:0]    dma_2_m_axis_s2mm_sts_tdata;
  wire       [0:0]    dma_2_m_axis_s2mm_sts_tkeep;
  wire                dma_2_m_axis_s2mm_sts_tlast;
  wire                dma_2_m_axis_mm2s_sts_tvalid;
  wire       [7:0]    dma_2_m_axis_mm2s_sts_tdata;
  wire       [0:0]    dma_2_m_axis_mm2s_sts_tkeep;
  wire                dma_2_m_axis_mm2s_sts_tlast;
  wire                dma_2_m_axis_mm2s_tvalid;
  wire       [127:0]  dma_2_m_axis_mm2s_tdata;
  wire       [15:0]   dma_2_m_axis_mm2s_tkeep;
  wire                dma_2_m_axis_mm2s_tlast;
  wire                dma_2_mm2s_err;
  wire                dma_2_s2mm_err;
  wire                dma_3_s_axis_s2mm_tready;
  wire                dma_3_s_axis_s2mm_cmd_tready;
  wire                dma_3_s_axis_mm2s_cmd_tready;
  wire                dma_3_m_axi_mm2s_arvalid;
  wire       [31:0]   dma_3_m_axi_mm2s_araddr;
  wire       [3:0]    dma_3_m_axi_mm2s_arid;
  wire       [7:0]    dma_3_m_axi_mm2s_arlen;
  wire       [2:0]    dma_3_m_axi_mm2s_arsize;
  wire       [1:0]    dma_3_m_axi_mm2s_arburst;
  wire       [3:0]    dma_3_m_axi_mm2s_arcache;
  wire       [3:0]    dma_3_m_axi_mm2s_aruser;
  wire       [2:0]    dma_3_m_axi_mm2s_arprot;
  wire                dma_3_m_axi_s2mm_awvalid;
  wire       [31:0]   dma_3_m_axi_s2mm_awaddr;
  wire       [3:0]    dma_3_m_axi_s2mm_awid;
  wire       [7:0]    dma_3_m_axi_s2mm_awlen;
  wire       [2:0]    dma_3_m_axi_s2mm_awsize;
  wire       [1:0]    dma_3_m_axi_s2mm_awburst;
  wire       [3:0]    dma_3_m_axi_s2mm_awcache;
  wire       [3:0]    dma_3_m_axi_s2mm_awuser;
  wire       [2:0]    dma_3_m_axi_s2mm_awprot;
  wire                dma_3_m_axi_s2mm_wvalid;
  wire       [127:0]  dma_3_m_axi_s2mm_wdata;
  wire       [15:0]   dma_3_m_axi_s2mm_wstrb;
  wire                dma_3_m_axi_s2mm_wlast;
  wire                dma_3_m_axi_mm2s_rready;
  wire                dma_3_m_axi_s2mm_bready;
  wire                dma_3_m_axis_s2mm_sts_tvalid;
  wire       [7:0]    dma_3_m_axis_s2mm_sts_tdata;
  wire       [0:0]    dma_3_m_axis_s2mm_sts_tkeep;
  wire                dma_3_m_axis_s2mm_sts_tlast;
  wire                dma_3_m_axis_mm2s_sts_tvalid;
  wire       [7:0]    dma_3_m_axis_mm2s_sts_tdata;
  wire       [0:0]    dma_3_m_axis_mm2s_sts_tkeep;
  wire                dma_3_m_axis_mm2s_sts_tlast;
  wire                dma_3_m_axis_mm2s_tvalid;
  wire       [127:0]  dma_3_m_axis_mm2s_tdata;
  wire       [15:0]   dma_3_m_axis_mm2s_tkeep;
  wire                dma_3_m_axis_mm2s_tlast;
  wire                dma_3_mm2s_err;
  wire                dma_3_s2mm_err;
  wire                mm2sCmdSplit_io_inCmd_ready;
  wire                mm2sCmdSplit_io_outCmd_0_valid;
  wire       [71:0]   mm2sCmdSplit_io_outCmd_0_payload;
  wire                mm2sCmdSplit_io_outCmd_1_valid;
  wire       [71:0]   mm2sCmdSplit_io_outCmd_1_payload;
  wire                mm2sCmdSplit_io_outCmd_2_valid;
  wire       [71:0]   mm2sCmdSplit_io_outCmd_2_payload;
  wire                mm2sCmdSplit_io_outCmd_3_valid;
  wire       [71:0]   mm2sCmdSplit_io_outCmd_3_payload;
  wire                s2mmCmdSplit_io_inCmd_ready;
  wire                s2mmCmdSplit_io_outCmd_0_valid;
  wire       [71:0]   s2mmCmdSplit_io_outCmd_0_payload;
  wire                s2mmCmdSplit_io_outCmd_1_valid;
  wire       [71:0]   s2mmCmdSplit_io_outCmd_1_payload;
  wire                s2mmCmdSplit_io_outCmd_2_valid;
  wire       [71:0]   s2mmCmdSplit_io_outCmd_2_payload;
  wire                s2mmCmdSplit_io_outCmd_3_valid;
  wire       [71:0]   s2mmCmdSplit_io_outCmd_3_payload;
  wire                inBuf_0_io_push_ready;
  wire                inBuf_0_io_pop_valid;
  wire       [127:0]  inBuf_0_io_pop_payload;
  wire       [9:0]    inBuf_0_io_occupancy;
  wire       [9:0]    inBuf_0_io_availability;
  wire                inBuf_1_io_push_ready;
  wire                inBuf_1_io_pop_valid;
  wire       [127:0]  inBuf_1_io_pop_payload;
  wire       [9:0]    inBuf_1_io_occupancy;
  wire       [9:0]    inBuf_1_io_availability;
  wire                inBuf_2_io_push_ready;
  wire                inBuf_2_io_pop_valid;
  wire       [127:0]  inBuf_2_io_pop_payload;
  wire       [9:0]    inBuf_2_io_occupancy;
  wire       [9:0]    inBuf_2_io_availability;
  wire                inBuf_3_io_push_ready;
  wire                inBuf_3_io_pop_valid;
  wire       [127:0]  inBuf_3_io_pop_payload;
  wire       [9:0]    inBuf_3_io_occupancy;
  wire       [9:0]    inBuf_3_io_availability;
  wire                inLastBuf_io_push_ready;
  wire                inLastBuf_io_pop_valid;
  wire                inLastBuf_io_pop_payload;
  wire       [9:0]    inLastBuf_io_occupancy;
  wire       [9:0]    inLastBuf_io_availability;
  wire                outBuf_0_io_push_ready;
  wire                outBuf_0_io_pop_valid;
  wire                outBuf_0_io_pop_payload_last;
  wire       [127:0]  outBuf_0_io_pop_payload_fragment;
  wire       [9:0]    outBuf_0_io_occupancy;
  wire       [9:0]    outBuf_0_io_availability;
  wire                outBuf_1_io_push_ready;
  wire                outBuf_1_io_pop_valid;
  wire                outBuf_1_io_pop_payload_last;
  wire       [127:0]  outBuf_1_io_pop_payload_fragment;
  wire       [9:0]    outBuf_1_io_occupancy;
  wire       [9:0]    outBuf_1_io_availability;
  wire                outBuf_2_io_push_ready;
  wire                outBuf_2_io_pop_valid;
  wire                outBuf_2_io_pop_payload_last;
  wire       [127:0]  outBuf_2_io_pop_payload_fragment;
  wire       [9:0]    outBuf_2_io_occupancy;
  wire       [9:0]    outBuf_2_io_availability;
  wire                outBuf_3_io_push_ready;
  wire                outBuf_3_io_pop_valid;
  wire                outBuf_3_io_pop_payload_last;
  wire       [127:0]  outBuf_3_io_pop_payload_fragment;
  wire       [9:0]    outBuf_3_io_occupancy;
  wire       [9:0]    outBuf_3_io_availability;
  wire                s2mmFork_io_input_ready;
  wire                s2mmFork_io_outputs_0_valid;
  wire                s2mmFork_io_outputs_1_valid;
  wire                s2mmFork_io_outputs_2_valid;
  wire                s2mmFork_io_outputs_3_valid;
  wire       [127:0]  s2mmPayloadSplit_0;
  wire       [127:0]  s2mmPayloadSplit_1;
  wire       [127:0]  s2mmPayloadSplit_2;
  wire       [127:0]  s2mmPayloadSplit_3;
  wire                dmaHp_inBuf_0_io_push_fire;
  wire                dmaHp_inBuf_0_io_pop_fire;
  wire       [511:0]  inBufPayload;
  wire                joinEvent_valid;
  wire                joinEvent_ready;
  wire                joinEvent_fire;
  wire                mm2s_valid;
  reg                 mm2s_ready;
  wire       [511:0]  mm2s_payload_data;
  wire       [63:0]   mm2s_payload_keep;
  wire                mm2s_payload_last;
  wire                mm2s_m2sPipe_valid;
  wire                mm2s_m2sPipe_ready;
  wire       [511:0]  mm2s_m2sPipe_payload_data;
  wire       [63:0]   mm2s_m2sPipe_payload_keep;
  wire                mm2s_m2sPipe_payload_last;
  reg                 mm2s_rValid;
  reg        [511:0]  mm2s_rData_data;
  reg        [63:0]   mm2s_rData_keep;
  reg                 mm2s_rData_last;

  AxiDatamover128 dma_0 (
    .s_axis_s2mm_tvalid         (outBuf_0_io_pop_valid                  ), //i
    .s_axis_s2mm_tready         (dma_0_s_axis_s2mm_tready               ), //o
    .s_axis_s2mm_tdata          (outBuf_0_io_pop_payload_fragment[127:0]), //i
    .s_axis_s2mm_tkeep          (16'hffff                               ), //i
    .s_axis_s2mm_tlast          (outBuf_0_io_pop_payload_last           ), //i
    .s_axis_s2mm_cmd_tvalid     (s2mmCmdSplit_io_outCmd_0_valid         ), //i
    .s_axis_s2mm_cmd_tready     (dma_0_s_axis_s2mm_cmd_tready           ), //o
    .s_axis_s2mm_cmd_tdata      (s2mmCmdSplit_io_outCmd_0_payload[71:0] ), //i
    .s_axis_mm2s_cmd_tvalid     (mm2sCmdSplit_io_outCmd_0_valid         ), //i
    .s_axis_mm2s_cmd_tready     (dma_0_s_axis_mm2s_cmd_tready           ), //o
    .s_axis_mm2s_cmd_tdata      (mm2sCmdSplit_io_outCmd_0_payload[71:0] ), //i
    .m_axi_s2mm_awvalid         (dma_0_m_axi_s2mm_awvalid               ), //o
    .m_axi_s2mm_awready         (m_axi_0_awready                        ), //i
    .m_axi_s2mm_awaddr          (dma_0_m_axi_s2mm_awaddr[31:0]          ), //o
    .m_axi_s2mm_awid            (dma_0_m_axi_s2mm_awid[3:0]             ), //o
    .m_axi_s2mm_awlen           (dma_0_m_axi_s2mm_awlen[7:0]            ), //o
    .m_axi_s2mm_awsize          (dma_0_m_axi_s2mm_awsize[2:0]           ), //o
    .m_axi_s2mm_awburst         (dma_0_m_axi_s2mm_awburst[1:0]          ), //o
    .m_axi_s2mm_awcache         (dma_0_m_axi_s2mm_awcache[3:0]          ), //o
    .m_axi_s2mm_awuser          (dma_0_m_axi_s2mm_awuser[3:0]           ), //o
    .m_axi_s2mm_awprot          (dma_0_m_axi_s2mm_awprot[2:0]           ), //o
    .m_axi_s2mm_wvalid          (dma_0_m_axi_s2mm_wvalid                ), //o
    .m_axi_s2mm_wready          (m_axi_0_wready                         ), //i
    .m_axi_s2mm_wdata           (dma_0_m_axi_s2mm_wdata[127:0]          ), //o
    .m_axi_s2mm_wstrb           (dma_0_m_axi_s2mm_wstrb[15:0]           ), //o
    .m_axi_s2mm_wlast           (dma_0_m_axi_s2mm_wlast                 ), //o
    .m_axi_s2mm_bvalid          (m_axi_0_bvalid                         ), //i
    .m_axi_s2mm_bready          (dma_0_m_axi_s2mm_bready                ), //o
    .m_axi_s2mm_bresp           (m_axi_0_bresp[1:0]                     ), //i
    .m_axi_mm2s_arvalid         (dma_0_m_axi_mm2s_arvalid               ), //o
    .m_axi_mm2s_arready         (m_axi_0_arready                        ), //i
    .m_axi_mm2s_araddr          (dma_0_m_axi_mm2s_araddr[31:0]          ), //o
    .m_axi_mm2s_arid            (dma_0_m_axi_mm2s_arid[3:0]             ), //o
    .m_axi_mm2s_arlen           (dma_0_m_axi_mm2s_arlen[7:0]            ), //o
    .m_axi_mm2s_arsize          (dma_0_m_axi_mm2s_arsize[2:0]           ), //o
    .m_axi_mm2s_arburst         (dma_0_m_axi_mm2s_arburst[1:0]          ), //o
    .m_axi_mm2s_arcache         (dma_0_m_axi_mm2s_arcache[3:0]          ), //o
    .m_axi_mm2s_aruser          (dma_0_m_axi_mm2s_aruser[3:0]           ), //o
    .m_axi_mm2s_arprot          (dma_0_m_axi_mm2s_arprot[2:0]           ), //o
    .m_axi_mm2s_rvalid          (m_axi_0_rvalid                         ), //i
    .m_axi_mm2s_rready          (dma_0_m_axi_mm2s_rready                ), //o
    .m_axi_mm2s_rdata           (m_axi_0_rdata[127:0]                   ), //i
    .m_axi_mm2s_rresp           (m_axi_0_rresp[1:0]                     ), //i
    .m_axi_mm2s_rlast           (m_axi_0_rlast                          ), //i
    .m_axis_s2mm_sts_tvalid     (dma_0_m_axis_s2mm_sts_tvalid           ), //o
    .m_axis_s2mm_sts_tready     (1'b1                                   ), //i
    .m_axis_s2mm_sts_tdata      (dma_0_m_axis_s2mm_sts_tdata[7:0]       ), //o
    .m_axis_s2mm_sts_tkeep      (dma_0_m_axis_s2mm_sts_tkeep            ), //o
    .m_axis_s2mm_sts_tlast      (dma_0_m_axis_s2mm_sts_tlast            ), //o
    .m_axis_mm2s_sts_tvalid     (dma_0_m_axis_mm2s_sts_tvalid           ), //o
    .m_axis_mm2s_sts_tready     (1'b1                                   ), //i
    .m_axis_mm2s_sts_tdata      (dma_0_m_axis_mm2s_sts_tdata[7:0]       ), //o
    .m_axis_mm2s_sts_tkeep      (dma_0_m_axis_mm2s_sts_tkeep            ), //o
    .m_axis_mm2s_sts_tlast      (dma_0_m_axis_mm2s_sts_tlast            ), //o
    .m_axis_mm2s_tvalid         (dma_0_m_axis_mm2s_tvalid               ), //o
    .m_axis_mm2s_tready         (inBuf_0_io_push_ready                  ), //i
    .m_axis_mm2s_tdata          (dma_0_m_axis_mm2s_tdata[127:0]         ), //o
    .m_axis_mm2s_tkeep          (dma_0_m_axis_mm2s_tkeep[15:0]          ), //o
    .m_axis_mm2s_tlast          (dma_0_m_axis_mm2s_tlast                ), //o
    .m_axi_mm2s_aclk            (clk_0_clk                              ), //i
    .m_axi_mm2s_aresetn         (aresetn                                ), //i
    .m_axis_mm2s_cmdsts_aclk    (clk_0_clk                              ), //i
    .m_axis_mm2s_cmdsts_aresetn (aresetn                                ), //i
    .m_axi_s2mm_aclk            (clk_0_clk                              ), //i
    .m_axi_s2mm_aresetn         (aresetn                                ), //i
    .m_axis_s2mm_cmdsts_awclk   (clk_0_clk                              ), //i
    .m_axis_s2mm_cmdsts_aresetn (aresetn                                ), //i
    .mm2s_err                   (dma_0_mm2s_err                         ), //o
    .s2mm_err                   (dma_0_s2mm_err                         )  //o
  );
  AxiDatamover128 dma_1 (
    .s_axis_s2mm_tvalid         (outBuf_1_io_pop_valid                  ), //i
    .s_axis_s2mm_tready         (dma_1_s_axis_s2mm_tready               ), //o
    .s_axis_s2mm_tdata          (outBuf_1_io_pop_payload_fragment[127:0]), //i
    .s_axis_s2mm_tkeep          (16'hffff                               ), //i
    .s_axis_s2mm_tlast          (outBuf_1_io_pop_payload_last           ), //i
    .s_axis_s2mm_cmd_tvalid     (s2mmCmdSplit_io_outCmd_1_valid         ), //i
    .s_axis_s2mm_cmd_tready     (dma_1_s_axis_s2mm_cmd_tready           ), //o
    .s_axis_s2mm_cmd_tdata      (s2mmCmdSplit_io_outCmd_1_payload[71:0] ), //i
    .s_axis_mm2s_cmd_tvalid     (mm2sCmdSplit_io_outCmd_1_valid         ), //i
    .s_axis_mm2s_cmd_tready     (dma_1_s_axis_mm2s_cmd_tready           ), //o
    .s_axis_mm2s_cmd_tdata      (mm2sCmdSplit_io_outCmd_1_payload[71:0] ), //i
    .m_axi_s2mm_awvalid         (dma_1_m_axi_s2mm_awvalid               ), //o
    .m_axi_s2mm_awready         (m_axi_1_awready                        ), //i
    .m_axi_s2mm_awaddr          (dma_1_m_axi_s2mm_awaddr[31:0]          ), //o
    .m_axi_s2mm_awid            (dma_1_m_axi_s2mm_awid[3:0]             ), //o
    .m_axi_s2mm_awlen           (dma_1_m_axi_s2mm_awlen[7:0]            ), //o
    .m_axi_s2mm_awsize          (dma_1_m_axi_s2mm_awsize[2:0]           ), //o
    .m_axi_s2mm_awburst         (dma_1_m_axi_s2mm_awburst[1:0]          ), //o
    .m_axi_s2mm_awcache         (dma_1_m_axi_s2mm_awcache[3:0]          ), //o
    .m_axi_s2mm_awuser          (dma_1_m_axi_s2mm_awuser[3:0]           ), //o
    .m_axi_s2mm_awprot          (dma_1_m_axi_s2mm_awprot[2:0]           ), //o
    .m_axi_s2mm_wvalid          (dma_1_m_axi_s2mm_wvalid                ), //o
    .m_axi_s2mm_wready          (m_axi_1_wready                         ), //i
    .m_axi_s2mm_wdata           (dma_1_m_axi_s2mm_wdata[127:0]          ), //o
    .m_axi_s2mm_wstrb           (dma_1_m_axi_s2mm_wstrb[15:0]           ), //o
    .m_axi_s2mm_wlast           (dma_1_m_axi_s2mm_wlast                 ), //o
    .m_axi_s2mm_bvalid          (m_axi_1_bvalid                         ), //i
    .m_axi_s2mm_bready          (dma_1_m_axi_s2mm_bready                ), //o
    .m_axi_s2mm_bresp           (m_axi_1_bresp[1:0]                     ), //i
    .m_axi_mm2s_arvalid         (dma_1_m_axi_mm2s_arvalid               ), //o
    .m_axi_mm2s_arready         (m_axi_1_arready                        ), //i
    .m_axi_mm2s_araddr          (dma_1_m_axi_mm2s_araddr[31:0]          ), //o
    .m_axi_mm2s_arid            (dma_1_m_axi_mm2s_arid[3:0]             ), //o
    .m_axi_mm2s_arlen           (dma_1_m_axi_mm2s_arlen[7:0]            ), //o
    .m_axi_mm2s_arsize          (dma_1_m_axi_mm2s_arsize[2:0]           ), //o
    .m_axi_mm2s_arburst         (dma_1_m_axi_mm2s_arburst[1:0]          ), //o
    .m_axi_mm2s_arcache         (dma_1_m_axi_mm2s_arcache[3:0]          ), //o
    .m_axi_mm2s_aruser          (dma_1_m_axi_mm2s_aruser[3:0]           ), //o
    .m_axi_mm2s_arprot          (dma_1_m_axi_mm2s_arprot[2:0]           ), //o
    .m_axi_mm2s_rvalid          (m_axi_1_rvalid                         ), //i
    .m_axi_mm2s_rready          (dma_1_m_axi_mm2s_rready                ), //o
    .m_axi_mm2s_rdata           (m_axi_1_rdata[127:0]                   ), //i
    .m_axi_mm2s_rresp           (m_axi_1_rresp[1:0]                     ), //i
    .m_axi_mm2s_rlast           (m_axi_1_rlast                          ), //i
    .m_axis_s2mm_sts_tvalid     (dma_1_m_axis_s2mm_sts_tvalid           ), //o
    .m_axis_s2mm_sts_tready     (1'b1                                   ), //i
    .m_axis_s2mm_sts_tdata      (dma_1_m_axis_s2mm_sts_tdata[7:0]       ), //o
    .m_axis_s2mm_sts_tkeep      (dma_1_m_axis_s2mm_sts_tkeep            ), //o
    .m_axis_s2mm_sts_tlast      (dma_1_m_axis_s2mm_sts_tlast            ), //o
    .m_axis_mm2s_sts_tvalid     (dma_1_m_axis_mm2s_sts_tvalid           ), //o
    .m_axis_mm2s_sts_tready     (1'b1                                   ), //i
    .m_axis_mm2s_sts_tdata      (dma_1_m_axis_mm2s_sts_tdata[7:0]       ), //o
    .m_axis_mm2s_sts_tkeep      (dma_1_m_axis_mm2s_sts_tkeep            ), //o
    .m_axis_mm2s_sts_tlast      (dma_1_m_axis_mm2s_sts_tlast            ), //o
    .m_axis_mm2s_tvalid         (dma_1_m_axis_mm2s_tvalid               ), //o
    .m_axis_mm2s_tready         (inBuf_1_io_push_ready                  ), //i
    .m_axis_mm2s_tdata          (dma_1_m_axis_mm2s_tdata[127:0]         ), //o
    .m_axis_mm2s_tkeep          (dma_1_m_axis_mm2s_tkeep[15:0]          ), //o
    .m_axis_mm2s_tlast          (dma_1_m_axis_mm2s_tlast                ), //o
    .m_axi_mm2s_aclk            (clk_0_clk                              ), //i
    .m_axi_mm2s_aresetn         (aresetn                                ), //i
    .m_axis_mm2s_cmdsts_aclk    (clk_0_clk                              ), //i
    .m_axis_mm2s_cmdsts_aresetn (aresetn                                ), //i
    .m_axi_s2mm_aclk            (clk_0_clk                              ), //i
    .m_axi_s2mm_aresetn         (aresetn                                ), //i
    .m_axis_s2mm_cmdsts_awclk   (clk_0_clk                              ), //i
    .m_axis_s2mm_cmdsts_aresetn (aresetn                                ), //i
    .mm2s_err                   (dma_1_mm2s_err                         ), //o
    .s2mm_err                   (dma_1_s2mm_err                         )  //o
  );
  AxiDatamover128 dma_2 (
    .s_axis_s2mm_tvalid         (outBuf_2_io_pop_valid                  ), //i
    .s_axis_s2mm_tready         (dma_2_s_axis_s2mm_tready               ), //o
    .s_axis_s2mm_tdata          (outBuf_2_io_pop_payload_fragment[127:0]), //i
    .s_axis_s2mm_tkeep          (16'hffff                               ), //i
    .s_axis_s2mm_tlast          (outBuf_2_io_pop_payload_last           ), //i
    .s_axis_s2mm_cmd_tvalid     (s2mmCmdSplit_io_outCmd_2_valid         ), //i
    .s_axis_s2mm_cmd_tready     (dma_2_s_axis_s2mm_cmd_tready           ), //o
    .s_axis_s2mm_cmd_tdata      (s2mmCmdSplit_io_outCmd_2_payload[71:0] ), //i
    .s_axis_mm2s_cmd_tvalid     (mm2sCmdSplit_io_outCmd_2_valid         ), //i
    .s_axis_mm2s_cmd_tready     (dma_2_s_axis_mm2s_cmd_tready           ), //o
    .s_axis_mm2s_cmd_tdata      (mm2sCmdSplit_io_outCmd_2_payload[71:0] ), //i
    .m_axi_s2mm_awvalid         (dma_2_m_axi_s2mm_awvalid               ), //o
    .m_axi_s2mm_awready         (m_axi_2_awready                        ), //i
    .m_axi_s2mm_awaddr          (dma_2_m_axi_s2mm_awaddr[31:0]          ), //o
    .m_axi_s2mm_awid            (dma_2_m_axi_s2mm_awid[3:0]             ), //o
    .m_axi_s2mm_awlen           (dma_2_m_axi_s2mm_awlen[7:0]            ), //o
    .m_axi_s2mm_awsize          (dma_2_m_axi_s2mm_awsize[2:0]           ), //o
    .m_axi_s2mm_awburst         (dma_2_m_axi_s2mm_awburst[1:0]          ), //o
    .m_axi_s2mm_awcache         (dma_2_m_axi_s2mm_awcache[3:0]          ), //o
    .m_axi_s2mm_awuser          (dma_2_m_axi_s2mm_awuser[3:0]           ), //o
    .m_axi_s2mm_awprot          (dma_2_m_axi_s2mm_awprot[2:0]           ), //o
    .m_axi_s2mm_wvalid          (dma_2_m_axi_s2mm_wvalid                ), //o
    .m_axi_s2mm_wready          (m_axi_2_wready                         ), //i
    .m_axi_s2mm_wdata           (dma_2_m_axi_s2mm_wdata[127:0]          ), //o
    .m_axi_s2mm_wstrb           (dma_2_m_axi_s2mm_wstrb[15:0]           ), //o
    .m_axi_s2mm_wlast           (dma_2_m_axi_s2mm_wlast                 ), //o
    .m_axi_s2mm_bvalid          (m_axi_2_bvalid                         ), //i
    .m_axi_s2mm_bready          (dma_2_m_axi_s2mm_bready                ), //o
    .m_axi_s2mm_bresp           (m_axi_2_bresp[1:0]                     ), //i
    .m_axi_mm2s_arvalid         (dma_2_m_axi_mm2s_arvalid               ), //o
    .m_axi_mm2s_arready         (m_axi_2_arready                        ), //i
    .m_axi_mm2s_araddr          (dma_2_m_axi_mm2s_araddr[31:0]          ), //o
    .m_axi_mm2s_arid            (dma_2_m_axi_mm2s_arid[3:0]             ), //o
    .m_axi_mm2s_arlen           (dma_2_m_axi_mm2s_arlen[7:0]            ), //o
    .m_axi_mm2s_arsize          (dma_2_m_axi_mm2s_arsize[2:0]           ), //o
    .m_axi_mm2s_arburst         (dma_2_m_axi_mm2s_arburst[1:0]          ), //o
    .m_axi_mm2s_arcache         (dma_2_m_axi_mm2s_arcache[3:0]          ), //o
    .m_axi_mm2s_aruser          (dma_2_m_axi_mm2s_aruser[3:0]           ), //o
    .m_axi_mm2s_arprot          (dma_2_m_axi_mm2s_arprot[2:0]           ), //o
    .m_axi_mm2s_rvalid          (m_axi_2_rvalid                         ), //i
    .m_axi_mm2s_rready          (dma_2_m_axi_mm2s_rready                ), //o
    .m_axi_mm2s_rdata           (m_axi_2_rdata[127:0]                   ), //i
    .m_axi_mm2s_rresp           (m_axi_2_rresp[1:0]                     ), //i
    .m_axi_mm2s_rlast           (m_axi_2_rlast                          ), //i
    .m_axis_s2mm_sts_tvalid     (dma_2_m_axis_s2mm_sts_tvalid           ), //o
    .m_axis_s2mm_sts_tready     (1'b1                                   ), //i
    .m_axis_s2mm_sts_tdata      (dma_2_m_axis_s2mm_sts_tdata[7:0]       ), //o
    .m_axis_s2mm_sts_tkeep      (dma_2_m_axis_s2mm_sts_tkeep            ), //o
    .m_axis_s2mm_sts_tlast      (dma_2_m_axis_s2mm_sts_tlast            ), //o
    .m_axis_mm2s_sts_tvalid     (dma_2_m_axis_mm2s_sts_tvalid           ), //o
    .m_axis_mm2s_sts_tready     (1'b1                                   ), //i
    .m_axis_mm2s_sts_tdata      (dma_2_m_axis_mm2s_sts_tdata[7:0]       ), //o
    .m_axis_mm2s_sts_tkeep      (dma_2_m_axis_mm2s_sts_tkeep            ), //o
    .m_axis_mm2s_sts_tlast      (dma_2_m_axis_mm2s_sts_tlast            ), //o
    .m_axis_mm2s_tvalid         (dma_2_m_axis_mm2s_tvalid               ), //o
    .m_axis_mm2s_tready         (inBuf_2_io_push_ready                  ), //i
    .m_axis_mm2s_tdata          (dma_2_m_axis_mm2s_tdata[127:0]         ), //o
    .m_axis_mm2s_tkeep          (dma_2_m_axis_mm2s_tkeep[15:0]          ), //o
    .m_axis_mm2s_tlast          (dma_2_m_axis_mm2s_tlast                ), //o
    .m_axi_mm2s_aclk            (clk_0_clk                              ), //i
    .m_axi_mm2s_aresetn         (aresetn                                ), //i
    .m_axis_mm2s_cmdsts_aclk    (clk_0_clk                              ), //i
    .m_axis_mm2s_cmdsts_aresetn (aresetn                                ), //i
    .m_axi_s2mm_aclk            (clk_0_clk                              ), //i
    .m_axi_s2mm_aresetn         (aresetn                                ), //i
    .m_axis_s2mm_cmdsts_awclk   (clk_0_clk                              ), //i
    .m_axis_s2mm_cmdsts_aresetn (aresetn                                ), //i
    .mm2s_err                   (dma_2_mm2s_err                         ), //o
    .s2mm_err                   (dma_2_s2mm_err                         )  //o
  );
  AxiDatamover128 dma_3 (
    .s_axis_s2mm_tvalid         (outBuf_3_io_pop_valid                  ), //i
    .s_axis_s2mm_tready         (dma_3_s_axis_s2mm_tready               ), //o
    .s_axis_s2mm_tdata          (outBuf_3_io_pop_payload_fragment[127:0]), //i
    .s_axis_s2mm_tkeep          (16'hffff                               ), //i
    .s_axis_s2mm_tlast          (outBuf_3_io_pop_payload_last           ), //i
    .s_axis_s2mm_cmd_tvalid     (s2mmCmdSplit_io_outCmd_3_valid         ), //i
    .s_axis_s2mm_cmd_tready     (dma_3_s_axis_s2mm_cmd_tready           ), //o
    .s_axis_s2mm_cmd_tdata      (s2mmCmdSplit_io_outCmd_3_payload[71:0] ), //i
    .s_axis_mm2s_cmd_tvalid     (mm2sCmdSplit_io_outCmd_3_valid         ), //i
    .s_axis_mm2s_cmd_tready     (dma_3_s_axis_mm2s_cmd_tready           ), //o
    .s_axis_mm2s_cmd_tdata      (mm2sCmdSplit_io_outCmd_3_payload[71:0] ), //i
    .m_axi_s2mm_awvalid         (dma_3_m_axi_s2mm_awvalid               ), //o
    .m_axi_s2mm_awready         (m_axi_3_awready                        ), //i
    .m_axi_s2mm_awaddr          (dma_3_m_axi_s2mm_awaddr[31:0]          ), //o
    .m_axi_s2mm_awid            (dma_3_m_axi_s2mm_awid[3:0]             ), //o
    .m_axi_s2mm_awlen           (dma_3_m_axi_s2mm_awlen[7:0]            ), //o
    .m_axi_s2mm_awsize          (dma_3_m_axi_s2mm_awsize[2:0]           ), //o
    .m_axi_s2mm_awburst         (dma_3_m_axi_s2mm_awburst[1:0]          ), //o
    .m_axi_s2mm_awcache         (dma_3_m_axi_s2mm_awcache[3:0]          ), //o
    .m_axi_s2mm_awuser          (dma_3_m_axi_s2mm_awuser[3:0]           ), //o
    .m_axi_s2mm_awprot          (dma_3_m_axi_s2mm_awprot[2:0]           ), //o
    .m_axi_s2mm_wvalid          (dma_3_m_axi_s2mm_wvalid                ), //o
    .m_axi_s2mm_wready          (m_axi_3_wready                         ), //i
    .m_axi_s2mm_wdata           (dma_3_m_axi_s2mm_wdata[127:0]          ), //o
    .m_axi_s2mm_wstrb           (dma_3_m_axi_s2mm_wstrb[15:0]           ), //o
    .m_axi_s2mm_wlast           (dma_3_m_axi_s2mm_wlast                 ), //o
    .m_axi_s2mm_bvalid          (m_axi_3_bvalid                         ), //i
    .m_axi_s2mm_bready          (dma_3_m_axi_s2mm_bready                ), //o
    .m_axi_s2mm_bresp           (m_axi_3_bresp[1:0]                     ), //i
    .m_axi_mm2s_arvalid         (dma_3_m_axi_mm2s_arvalid               ), //o
    .m_axi_mm2s_arready         (m_axi_3_arready                        ), //i
    .m_axi_mm2s_araddr          (dma_3_m_axi_mm2s_araddr[31:0]          ), //o
    .m_axi_mm2s_arid            (dma_3_m_axi_mm2s_arid[3:0]             ), //o
    .m_axi_mm2s_arlen           (dma_3_m_axi_mm2s_arlen[7:0]            ), //o
    .m_axi_mm2s_arsize          (dma_3_m_axi_mm2s_arsize[2:0]           ), //o
    .m_axi_mm2s_arburst         (dma_3_m_axi_mm2s_arburst[1:0]          ), //o
    .m_axi_mm2s_arcache         (dma_3_m_axi_mm2s_arcache[3:0]          ), //o
    .m_axi_mm2s_aruser          (dma_3_m_axi_mm2s_aruser[3:0]           ), //o
    .m_axi_mm2s_arprot          (dma_3_m_axi_mm2s_arprot[2:0]           ), //o
    .m_axi_mm2s_rvalid          (m_axi_3_rvalid                         ), //i
    .m_axi_mm2s_rready          (dma_3_m_axi_mm2s_rready                ), //o
    .m_axi_mm2s_rdata           (m_axi_3_rdata[127:0]                   ), //i
    .m_axi_mm2s_rresp           (m_axi_3_rresp[1:0]                     ), //i
    .m_axi_mm2s_rlast           (m_axi_3_rlast                          ), //i
    .m_axis_s2mm_sts_tvalid     (dma_3_m_axis_s2mm_sts_tvalid           ), //o
    .m_axis_s2mm_sts_tready     (1'b1                                   ), //i
    .m_axis_s2mm_sts_tdata      (dma_3_m_axis_s2mm_sts_tdata[7:0]       ), //o
    .m_axis_s2mm_sts_tkeep      (dma_3_m_axis_s2mm_sts_tkeep            ), //o
    .m_axis_s2mm_sts_tlast      (dma_3_m_axis_s2mm_sts_tlast            ), //o
    .m_axis_mm2s_sts_tvalid     (dma_3_m_axis_mm2s_sts_tvalid           ), //o
    .m_axis_mm2s_sts_tready     (1'b1                                   ), //i
    .m_axis_mm2s_sts_tdata      (dma_3_m_axis_mm2s_sts_tdata[7:0]       ), //o
    .m_axis_mm2s_sts_tkeep      (dma_3_m_axis_mm2s_sts_tkeep            ), //o
    .m_axis_mm2s_sts_tlast      (dma_3_m_axis_mm2s_sts_tlast            ), //o
    .m_axis_mm2s_tvalid         (dma_3_m_axis_mm2s_tvalid               ), //o
    .m_axis_mm2s_tready         (inBuf_3_io_push_ready                  ), //i
    .m_axis_mm2s_tdata          (dma_3_m_axis_mm2s_tdata[127:0]         ), //o
    .m_axis_mm2s_tkeep          (dma_3_m_axis_mm2s_tkeep[15:0]          ), //o
    .m_axis_mm2s_tlast          (dma_3_m_axis_mm2s_tlast                ), //o
    .m_axi_mm2s_aclk            (clk_0_clk                              ), //i
    .m_axi_mm2s_aresetn         (aresetn                                ), //i
    .m_axis_mm2s_cmdsts_aclk    (clk_0_clk                              ), //i
    .m_axis_mm2s_cmdsts_aresetn (aresetn                                ), //i
    .m_axi_s2mm_aclk            (clk_0_clk                              ), //i
    .m_axi_s2mm_aresetn         (aresetn                                ), //i
    .m_axis_s2mm_cmdsts_awclk   (clk_0_clk                              ), //i
    .m_axis_s2mm_cmdsts_aresetn (aresetn                                ), //i
    .mm2s_err                   (dma_3_mm2s_err                         ), //o
    .s2mm_err                   (dma_3_s2mm_err                         )  //o
  );
  SplitAxiDatamoverCmd mm2sCmdSplit (
    .io_inCmd_valid      (mm2sCmd_tvalid                        ), //i
    .io_inCmd_ready      (mm2sCmdSplit_io_inCmd_ready           ), //o
    .io_inCmd_payload    (mm2sCmd_tdata[71:0]                   ), //i
    .io_outCmd_0_valid   (mm2sCmdSplit_io_outCmd_0_valid        ), //o
    .io_outCmd_0_ready   (dma_0_s_axis_mm2s_cmd_tready          ), //i
    .io_outCmd_0_payload (mm2sCmdSplit_io_outCmd_0_payload[71:0]), //o
    .io_outCmd_1_valid   (mm2sCmdSplit_io_outCmd_1_valid        ), //o
    .io_outCmd_1_ready   (dma_1_s_axis_mm2s_cmd_tready          ), //i
    .io_outCmd_1_payload (mm2sCmdSplit_io_outCmd_1_payload[71:0]), //o
    .io_outCmd_2_valid   (mm2sCmdSplit_io_outCmd_2_valid        ), //o
    .io_outCmd_2_ready   (dma_2_s_axis_mm2s_cmd_tready          ), //i
    .io_outCmd_2_payload (mm2sCmdSplit_io_outCmd_2_payload[71:0]), //o
    .io_outCmd_3_valid   (mm2sCmdSplit_io_outCmd_3_valid        ), //o
    .io_outCmd_3_ready   (dma_3_s_axis_mm2s_cmd_tready          ), //i
    .io_outCmd_3_payload (mm2sCmdSplit_io_outCmd_3_payload[71:0]), //o
    .clk_0_clk           (clk_0_clk                             ), //i
    .clk_0_resetn        (clk_0_resetn                          )  //i
  );
  SplitAxiDatamoverCmd s2mmCmdSplit (
    .io_inCmd_valid      (s2mmCmd_tvalid                        ), //i
    .io_inCmd_ready      (s2mmCmdSplit_io_inCmd_ready           ), //o
    .io_inCmd_payload    (s2mmCmd_tdata[71:0]                   ), //i
    .io_outCmd_0_valid   (s2mmCmdSplit_io_outCmd_0_valid        ), //o
    .io_outCmd_0_ready   (dma_0_s_axis_s2mm_cmd_tready          ), //i
    .io_outCmd_0_payload (s2mmCmdSplit_io_outCmd_0_payload[71:0]), //o
    .io_outCmd_1_valid   (s2mmCmdSplit_io_outCmd_1_valid        ), //o
    .io_outCmd_1_ready   (dma_1_s_axis_s2mm_cmd_tready          ), //i
    .io_outCmd_1_payload (s2mmCmdSplit_io_outCmd_1_payload[71:0]), //o
    .io_outCmd_2_valid   (s2mmCmdSplit_io_outCmd_2_valid        ), //o
    .io_outCmd_2_ready   (dma_2_s_axis_s2mm_cmd_tready          ), //i
    .io_outCmd_2_payload (s2mmCmdSplit_io_outCmd_2_payload[71:0]), //o
    .io_outCmd_3_valid   (s2mmCmdSplit_io_outCmd_3_valid        ), //o
    .io_outCmd_3_ready   (dma_3_s_axis_s2mm_cmd_tready          ), //i
    .io_outCmd_3_payload (s2mmCmdSplit_io_outCmd_3_payload[71:0]), //o
    .clk_0_clk           (clk_0_clk                             ), //i
    .clk_0_resetn        (clk_0_resetn                          )  //i
  );
  StreamFifo_120 inBuf_0 (
    .io_push_valid   (dma_0_m_axis_mm2s_tvalid      ), //i
    .io_push_ready   (inBuf_0_io_push_ready         ), //o
    .io_push_payload (dma_0_m_axis_mm2s_tdata[127:0]), //i
    .io_pop_valid    (inBuf_0_io_pop_valid          ), //o
    .io_pop_ready    (joinEvent_fire                ), //i
    .io_pop_payload  (inBuf_0_io_pop_payload[127:0] ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (inBuf_0_io_occupancy[9:0]     ), //o
    .io_availability (inBuf_0_io_availability[9:0]  ), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_120 inBuf_1 (
    .io_push_valid   (dma_1_m_axis_mm2s_tvalid      ), //i
    .io_push_ready   (inBuf_1_io_push_ready         ), //o
    .io_push_payload (dma_1_m_axis_mm2s_tdata[127:0]), //i
    .io_pop_valid    (inBuf_1_io_pop_valid          ), //o
    .io_pop_ready    (joinEvent_fire                ), //i
    .io_pop_payload  (inBuf_1_io_pop_payload[127:0] ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (inBuf_1_io_occupancy[9:0]     ), //o
    .io_availability (inBuf_1_io_availability[9:0]  ), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_120 inBuf_2 (
    .io_push_valid   (dma_2_m_axis_mm2s_tvalid      ), //i
    .io_push_ready   (inBuf_2_io_push_ready         ), //o
    .io_push_payload (dma_2_m_axis_mm2s_tdata[127:0]), //i
    .io_pop_valid    (inBuf_2_io_pop_valid          ), //o
    .io_pop_ready    (joinEvent_fire                ), //i
    .io_pop_payload  (inBuf_2_io_pop_payload[127:0] ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (inBuf_2_io_occupancy[9:0]     ), //o
    .io_availability (inBuf_2_io_availability[9:0]  ), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_120 inBuf_3 (
    .io_push_valid   (dma_3_m_axis_mm2s_tvalid      ), //i
    .io_push_ready   (inBuf_3_io_push_ready         ), //o
    .io_push_payload (dma_3_m_axis_mm2s_tdata[127:0]), //i
    .io_pop_valid    (inBuf_3_io_pop_valid          ), //o
    .io_pop_ready    (joinEvent_fire                ), //i
    .io_pop_payload  (inBuf_3_io_pop_payload[127:0] ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (inBuf_3_io_occupancy[9:0]     ), //o
    .io_availability (inBuf_3_io_availability[9:0]  ), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_52 inLastBuf (
    .io_push_valid   (dmaHp_inBuf_0_io_push_fire    ), //i
    .io_push_ready   (inLastBuf_io_push_ready       ), //o
    .io_push_payload (dma_0_m_axis_mm2s_tlast       ), //i
    .io_pop_valid    (inLastBuf_io_pop_valid        ), //o
    .io_pop_ready    (dmaHp_inBuf_0_io_pop_fire     ), //i
    .io_pop_payload  (inLastBuf_io_pop_payload      ), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (inLastBuf_io_occupancy[9:0]   ), //o
    .io_availability (inLastBuf_io_availability[9:0]), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_53 outBuf_0 (
    .io_push_valid            (s2mmFork_io_outputs_0_valid            ), //i
    .io_push_ready            (outBuf_0_io_push_ready                 ), //o
    .io_push_payload_last     (s2mm_tlast                             ), //i
    .io_push_payload_fragment (s2mmPayloadSplit_0[127:0]              ), //i
    .io_pop_valid             (outBuf_0_io_pop_valid                  ), //o
    .io_pop_ready             (dma_0_s_axis_s2mm_tready               ), //i
    .io_pop_payload_last      (outBuf_0_io_pop_payload_last           ), //o
    .io_pop_payload_fragment  (outBuf_0_io_pop_payload_fragment[127:0]), //o
    .io_flush                 (1'b0                                   ), //i
    .io_occupancy             (outBuf_0_io_occupancy[9:0]             ), //o
    .io_availability          (outBuf_0_io_availability[9:0]          ), //o
    .clk_0_clk                (clk_0_clk                              ), //i
    .clk_0_resetn             (clk_0_resetn                           )  //i
  );
  StreamFifo_53 outBuf_1 (
    .io_push_valid            (s2mmFork_io_outputs_1_valid            ), //i
    .io_push_ready            (outBuf_1_io_push_ready                 ), //o
    .io_push_payload_last     (s2mm_tlast                             ), //i
    .io_push_payload_fragment (s2mmPayloadSplit_1[127:0]              ), //i
    .io_pop_valid             (outBuf_1_io_pop_valid                  ), //o
    .io_pop_ready             (dma_1_s_axis_s2mm_tready               ), //i
    .io_pop_payload_last      (outBuf_1_io_pop_payload_last           ), //o
    .io_pop_payload_fragment  (outBuf_1_io_pop_payload_fragment[127:0]), //o
    .io_flush                 (1'b0                                   ), //i
    .io_occupancy             (outBuf_1_io_occupancy[9:0]             ), //o
    .io_availability          (outBuf_1_io_availability[9:0]          ), //o
    .clk_0_clk                (clk_0_clk                              ), //i
    .clk_0_resetn             (clk_0_resetn                           )  //i
  );
  StreamFifo_53 outBuf_2 (
    .io_push_valid            (s2mmFork_io_outputs_2_valid            ), //i
    .io_push_ready            (outBuf_2_io_push_ready                 ), //o
    .io_push_payload_last     (s2mm_tlast                             ), //i
    .io_push_payload_fragment (s2mmPayloadSplit_2[127:0]              ), //i
    .io_pop_valid             (outBuf_2_io_pop_valid                  ), //o
    .io_pop_ready             (dma_2_s_axis_s2mm_tready               ), //i
    .io_pop_payload_last      (outBuf_2_io_pop_payload_last           ), //o
    .io_pop_payload_fragment  (outBuf_2_io_pop_payload_fragment[127:0]), //o
    .io_flush                 (1'b0                                   ), //i
    .io_occupancy             (outBuf_2_io_occupancy[9:0]             ), //o
    .io_availability          (outBuf_2_io_availability[9:0]          ), //o
    .clk_0_clk                (clk_0_clk                              ), //i
    .clk_0_resetn             (clk_0_resetn                           )  //i
  );
  StreamFifo_53 outBuf_3 (
    .io_push_valid            (s2mmFork_io_outputs_3_valid            ), //i
    .io_push_ready            (outBuf_3_io_push_ready                 ), //o
    .io_push_payload_last     (s2mm_tlast                             ), //i
    .io_push_payload_fragment (s2mmPayloadSplit_3[127:0]              ), //i
    .io_pop_valid             (outBuf_3_io_pop_valid                  ), //o
    .io_pop_ready             (dma_3_s_axis_s2mm_tready               ), //i
    .io_pop_payload_last      (outBuf_3_io_pop_payload_last           ), //o
    .io_pop_payload_fragment  (outBuf_3_io_pop_payload_fragment[127:0]), //o
    .io_flush                 (1'b0                                   ), //i
    .io_occupancy             (outBuf_3_io_occupancy[9:0]             ), //o
    .io_availability          (outBuf_3_io_availability[9:0]          ), //o
    .clk_0_clk                (clk_0_clk                              ), //i
    .clk_0_resetn             (clk_0_resetn                           )  //i
  );
  StreamFork_6 s2mmFork (
    .io_input_valid     (s2mm_tvalid                ), //i
    .io_input_ready     (s2mmFork_io_input_ready    ), //o
    .io_outputs_0_valid (s2mmFork_io_outputs_0_valid), //o
    .io_outputs_0_ready (outBuf_0_io_push_ready     ), //i
    .io_outputs_1_valid (s2mmFork_io_outputs_1_valid), //o
    .io_outputs_1_ready (outBuf_1_io_push_ready     ), //i
    .io_outputs_2_valid (s2mmFork_io_outputs_2_valid), //o
    .io_outputs_2_ready (outBuf_2_io_push_ready     ), //i
    .io_outputs_3_valid (s2mmFork_io_outputs_3_valid), //o
    .io_outputs_3_ready (outBuf_3_io_push_ready     )  //i
  );
  assign mm2sCmd_tready = mm2sCmdSplit_io_inCmd_ready;
  assign s2mmCmd_tready = s2mmCmdSplit_io_inCmd_ready;
  assign s2mm_tready = s2mmFork_io_input_ready;
  assign s2mmPayloadSplit_0 = s2mm_tdata[127 : 0];
  assign s2mmPayloadSplit_1 = s2mm_tdata[255 : 128];
  assign s2mmPayloadSplit_2 = s2mm_tdata[383 : 256];
  assign s2mmPayloadSplit_3 = s2mm_tdata[511 : 384];
  assign m_axi_0_arvalid = dma_0_m_axi_mm2s_arvalid;
  assign m_axi_0_araddr = dma_0_m_axi_mm2s_araddr;
  assign m_axi_0_arid = dma_0_m_axi_mm2s_arid;
  assign m_axi_0_arlen = dma_0_m_axi_mm2s_arlen;
  assign m_axi_0_arsize = dma_0_m_axi_mm2s_arsize;
  assign m_axi_0_arburst = dma_0_m_axi_mm2s_arburst;
  assign m_axi_0_arcache = dma_0_m_axi_mm2s_arcache;
  assign m_axi_0_aruser = dma_0_m_axi_mm2s_aruser;
  assign m_axi_0_arprot = dma_0_m_axi_mm2s_arprot;
  assign m_axi_0_awvalid = dma_0_m_axi_s2mm_awvalid;
  assign m_axi_0_awaddr = dma_0_m_axi_s2mm_awaddr;
  assign m_axi_0_awid = dma_0_m_axi_s2mm_awid;
  assign m_axi_0_awlen = dma_0_m_axi_s2mm_awlen;
  assign m_axi_0_awsize = dma_0_m_axi_s2mm_awsize;
  assign m_axi_0_awburst = dma_0_m_axi_s2mm_awburst;
  assign m_axi_0_awcache = dma_0_m_axi_s2mm_awcache;
  assign m_axi_0_awuser = dma_0_m_axi_s2mm_awuser;
  assign m_axi_0_awprot = dma_0_m_axi_s2mm_awprot;
  assign m_axi_0_wvalid = dma_0_m_axi_s2mm_wvalid;
  assign m_axi_0_wdata = dma_0_m_axi_s2mm_wdata;
  assign m_axi_0_wstrb = dma_0_m_axi_s2mm_wstrb;
  assign m_axi_0_wlast = dma_0_m_axi_s2mm_wlast;
  assign m_axi_0_rready = dma_0_m_axi_mm2s_rready;
  assign m_axi_0_bready = dma_0_m_axi_s2mm_bready;
  assign m_axi_1_arvalid = dma_1_m_axi_mm2s_arvalid;
  assign m_axi_1_araddr = dma_1_m_axi_mm2s_araddr;
  assign m_axi_1_arid = dma_1_m_axi_mm2s_arid;
  assign m_axi_1_arlen = dma_1_m_axi_mm2s_arlen;
  assign m_axi_1_arsize = dma_1_m_axi_mm2s_arsize;
  assign m_axi_1_arburst = dma_1_m_axi_mm2s_arburst;
  assign m_axi_1_arcache = dma_1_m_axi_mm2s_arcache;
  assign m_axi_1_aruser = dma_1_m_axi_mm2s_aruser;
  assign m_axi_1_arprot = dma_1_m_axi_mm2s_arprot;
  assign m_axi_1_awvalid = dma_1_m_axi_s2mm_awvalid;
  assign m_axi_1_awaddr = dma_1_m_axi_s2mm_awaddr;
  assign m_axi_1_awid = dma_1_m_axi_s2mm_awid;
  assign m_axi_1_awlen = dma_1_m_axi_s2mm_awlen;
  assign m_axi_1_awsize = dma_1_m_axi_s2mm_awsize;
  assign m_axi_1_awburst = dma_1_m_axi_s2mm_awburst;
  assign m_axi_1_awcache = dma_1_m_axi_s2mm_awcache;
  assign m_axi_1_awuser = dma_1_m_axi_s2mm_awuser;
  assign m_axi_1_awprot = dma_1_m_axi_s2mm_awprot;
  assign m_axi_1_wvalid = dma_1_m_axi_s2mm_wvalid;
  assign m_axi_1_wdata = dma_1_m_axi_s2mm_wdata;
  assign m_axi_1_wstrb = dma_1_m_axi_s2mm_wstrb;
  assign m_axi_1_wlast = dma_1_m_axi_s2mm_wlast;
  assign m_axi_1_rready = dma_1_m_axi_mm2s_rready;
  assign m_axi_1_bready = dma_1_m_axi_s2mm_bready;
  assign m_axi_2_arvalid = dma_2_m_axi_mm2s_arvalid;
  assign m_axi_2_araddr = dma_2_m_axi_mm2s_araddr;
  assign m_axi_2_arid = dma_2_m_axi_mm2s_arid;
  assign m_axi_2_arlen = dma_2_m_axi_mm2s_arlen;
  assign m_axi_2_arsize = dma_2_m_axi_mm2s_arsize;
  assign m_axi_2_arburst = dma_2_m_axi_mm2s_arburst;
  assign m_axi_2_arcache = dma_2_m_axi_mm2s_arcache;
  assign m_axi_2_aruser = dma_2_m_axi_mm2s_aruser;
  assign m_axi_2_arprot = dma_2_m_axi_mm2s_arprot;
  assign m_axi_2_awvalid = dma_2_m_axi_s2mm_awvalid;
  assign m_axi_2_awaddr = dma_2_m_axi_s2mm_awaddr;
  assign m_axi_2_awid = dma_2_m_axi_s2mm_awid;
  assign m_axi_2_awlen = dma_2_m_axi_s2mm_awlen;
  assign m_axi_2_awsize = dma_2_m_axi_s2mm_awsize;
  assign m_axi_2_awburst = dma_2_m_axi_s2mm_awburst;
  assign m_axi_2_awcache = dma_2_m_axi_s2mm_awcache;
  assign m_axi_2_awuser = dma_2_m_axi_s2mm_awuser;
  assign m_axi_2_awprot = dma_2_m_axi_s2mm_awprot;
  assign m_axi_2_wvalid = dma_2_m_axi_s2mm_wvalid;
  assign m_axi_2_wdata = dma_2_m_axi_s2mm_wdata;
  assign m_axi_2_wstrb = dma_2_m_axi_s2mm_wstrb;
  assign m_axi_2_wlast = dma_2_m_axi_s2mm_wlast;
  assign m_axi_2_rready = dma_2_m_axi_mm2s_rready;
  assign m_axi_2_bready = dma_2_m_axi_s2mm_bready;
  assign m_axi_3_arvalid = dma_3_m_axi_mm2s_arvalid;
  assign m_axi_3_araddr = dma_3_m_axi_mm2s_araddr;
  assign m_axi_3_arid = dma_3_m_axi_mm2s_arid;
  assign m_axi_3_arlen = dma_3_m_axi_mm2s_arlen;
  assign m_axi_3_arsize = dma_3_m_axi_mm2s_arsize;
  assign m_axi_3_arburst = dma_3_m_axi_mm2s_arburst;
  assign m_axi_3_arcache = dma_3_m_axi_mm2s_arcache;
  assign m_axi_3_aruser = dma_3_m_axi_mm2s_aruser;
  assign m_axi_3_arprot = dma_3_m_axi_mm2s_arprot;
  assign m_axi_3_awvalid = dma_3_m_axi_s2mm_awvalid;
  assign m_axi_3_awaddr = dma_3_m_axi_s2mm_awaddr;
  assign m_axi_3_awid = dma_3_m_axi_s2mm_awid;
  assign m_axi_3_awlen = dma_3_m_axi_s2mm_awlen;
  assign m_axi_3_awsize = dma_3_m_axi_s2mm_awsize;
  assign m_axi_3_awburst = dma_3_m_axi_s2mm_awburst;
  assign m_axi_3_awcache = dma_3_m_axi_s2mm_awcache;
  assign m_axi_3_awuser = dma_3_m_axi_s2mm_awuser;
  assign m_axi_3_awprot = dma_3_m_axi_s2mm_awprot;
  assign m_axi_3_wvalid = dma_3_m_axi_s2mm_wvalid;
  assign m_axi_3_wdata = dma_3_m_axi_s2mm_wdata;
  assign m_axi_3_wstrb = dma_3_m_axi_s2mm_wstrb;
  assign m_axi_3_wlast = dma_3_m_axi_s2mm_wlast;
  assign m_axi_3_rready = dma_3_m_axi_mm2s_rready;
  assign m_axi_3_bready = dma_3_m_axi_s2mm_bready;
  assign dmaHp_inBuf_0_io_push_fire = (dma_0_m_axis_mm2s_tvalid && inBuf_0_io_push_ready);
  assign dmaHp_inBuf_0_io_pop_fire = (inBuf_0_io_pop_valid && joinEvent_fire);
  assign inBufPayload = {inBuf_3_io_pop_payload,{inBuf_2_io_pop_payload,{inBuf_1_io_pop_payload,inBuf_0_io_pop_payload}}};
  assign joinEvent_fire = (joinEvent_valid && joinEvent_ready);
  assign joinEvent_valid = (((inBuf_0_io_pop_valid && inBuf_1_io_pop_valid) && inBuf_2_io_pop_valid) && inBuf_3_io_pop_valid);
  assign mm2s_valid = joinEvent_valid;
  assign joinEvent_ready = mm2s_ready;
  assign mm2s_payload_data = inBufPayload;
  assign mm2s_payload_keep = 64'hffffffffffffffff;
  assign mm2s_payload_last = inLastBuf_io_pop_payload;
  always @(*) begin
    mm2s_ready = mm2s_m2sPipe_ready;
    if((! mm2s_m2sPipe_valid)) begin
      mm2s_ready = 1'b1;
    end
  end

  assign mm2s_m2sPipe_valid = mm2s_rValid;
  assign mm2s_m2sPipe_payload_data = mm2s_rData_data;
  assign mm2s_m2sPipe_payload_keep = mm2s_rData_keep;
  assign mm2s_m2sPipe_payload_last = mm2s_rData_last;
  assign mm2s_tvalid = mm2s_m2sPipe_valid;
  assign mm2s_m2sPipe_ready = mm2s_tready;
  assign mm2s_tdata = mm2s_m2sPipe_payload_data;
  assign mm2s_tkeep = mm2s_m2sPipe_payload_keep;
  assign mm2s_tlast = mm2s_m2sPipe_payload_last;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      mm2s_rValid <= 1'b0;
    end else begin
      if(mm2s_ready) begin
        mm2s_rValid <= mm2s_valid;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(mm2s_ready) begin
      mm2s_rData_data <= mm2s_payload_data;
      mm2s_rData_keep <= mm2s_payload_keep;
      mm2s_rData_last <= mm2s_payload_last;
    end
  end


endmodule

