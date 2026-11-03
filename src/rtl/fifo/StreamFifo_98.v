// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamFifo_98 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_last,
  input  wire [15:0]   io_push_payload_tdata,
  input  wire [5:0]    io_push_payload_tuser,
  input  wire [0:0]    io_push_payload_tdest,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_last,
  output wire [15:0]   io_pop_payload_tdata,
  output wire [5:0]    io_pop_payload_tuser,
  output wire [0:0]    io_pop_payload_tdest,
  input  wire          io_flush,
  output wire [14:0]   io_occupancy,
  output wire [14:0]   io_availability,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  reg        [23:0]   logic_ram_spinal_port1;
  wire       [23:0]   t_logic_ram_port;
  reg                 t_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [14:0]   logic_ptr_push;
  reg        [14:0]   logic_ptr_pop;
  wire       [14:0]   logic_ptr_occupancy;
  wire       [14:0]   logic_ptr_popOnIo;
  reg                 logic_ptr_wentUp;
  wire                logic_ptr_arb_fmax_emptyTracker_incr;
  wire                logic_ptr_arb_fmax_emptyTracker_decr;
  reg        [14:0]   logic_ptr_arb_fmax_emptyTracker_value;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_arb_fmax_emptyTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_arb_fmax_emptyTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_ptr_arb_fmax_fullTracker_incr;
  wire                logic_ptr_arb_fmax_fullTracker_decr;
  reg        [14:0]   logic_ptr_arb_fmax_fullTracker_value;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_arb_fmax_fullTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_arb_fmax_fullTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_ptr_fmax_incr;
  wire                logic_ptr_fmax_decr;
  reg        [14:0]   logic_ptr_fmax_value;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_fmax_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [14:0]   logic_ptr_fmax_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_push_onRam_write_valid;
  wire       [13:0]   logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data_last;
  wire       [15:0]   logic_push_onRam_write_payload_data_tdata;
  wire       [5:0]    logic_push_onRam_write_payload_data_tuser;
  wire       [0:0]    logic_push_onRam_write_payload_data_tdest;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [13:0]   logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [13:0]   logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [13:0]   logic_pop_addressGen_rData;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [13:0]   logic_pop_sync_readPort_cmd_payload;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [15:0]   logic_pop_sync_readPort_rsp_tdata;
  wire       [5:0]    logic_pop_sync_readPort_rsp_tuser;
  wire       [0:0]    logic_pop_sync_readPort_rsp_tdest;
  wire       [23:0]   t_logic_pop_sync_readPort_rsp_last;
  wire       [22:0]   t_logic_pop_sync_readPort_rsp_tdata;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire                logic_pop_sync_readArbitation_translated_payload_last;
  wire       [15:0]   logic_pop_sync_readArbitation_translated_payload_tdata;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_tuser;
  wire       [0:0]    logic_pop_sync_readArbitation_translated_payload_tdest;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [14:0]   logic_pop_sync_popReg;
  wire                logic_fmaxAvail_incr;
  wire                logic_fmaxAvail_decr;
  reg        [14:0]   logic_fmaxAvail_value;
  (* keep , syn_keep *) wire       [14:0]   logic_fmaxAvail_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [14:0]   logic_fmaxAvail_minusOne /* synthesis syn_keep = 1 */ ;
  reg [23:0] logic_ram [0:16383];

  assign t_logic_ram_port = {{logic_push_onRam_write_payload_data_tdest,{logic_push_onRam_write_payload_data_tuser,logic_push_onRam_write_payload_data_tdata}},logic_push_onRam_write_payload_data_last};
  always @(posedge clk_0_clk) begin
    if(t_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= t_logic_ram_port;
    end
  end

  always @(posedge clk_0_clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    t_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      t_1 = 1'b1;
    end
  end

  assign logic_ptr_arb_fmax_emptyTracker_plusOne = (logic_ptr_arb_fmax_emptyTracker_value + 15'h0001);
  assign logic_ptr_arb_fmax_emptyTracker_minusOne = (logic_ptr_arb_fmax_emptyTracker_value - 15'h0001);
  assign logic_ptr_arb_fmax_emptyTracker_incr = logic_ptr_doPop;
  assign logic_ptr_arb_fmax_emptyTracker_decr = logic_ptr_doPush;
  assign logic_ptr_empty = logic_ptr_arb_fmax_emptyTracker_value[14];
  assign logic_ptr_arb_fmax_fullTracker_plusOne = (logic_ptr_arb_fmax_fullTracker_value + 15'h0001);
  assign logic_ptr_arb_fmax_fullTracker_minusOne = (logic_ptr_arb_fmax_fullTracker_value - 15'h0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_arb_fmax_fullTracker_incr = io_push_fire;
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_arb_fmax_fullTracker_decr = io_pop_fire;
  assign logic_ptr_full = logic_ptr_arb_fmax_fullTracker_value[14];
  assign logic_ptr_fmax_plusOne = (logic_ptr_fmax_value + 15'h0001);
  assign logic_ptr_fmax_minusOne = (logic_ptr_fmax_value - 15'h0001);
  assign logic_ptr_fmax_incr = io_push_fire;
  assign logic_ptr_fmax_decr = io_pop_fire;
  assign logic_ptr_occupancy = logic_ptr_fmax_value;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[13:0];
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_push_onRam_write_payload_data_tdata = io_push_payload_tdata;
  assign logic_push_onRam_write_payload_data_tuser = io_push_payload_tuser;
  assign logic_push_onRam_write_payload_data_tdest = io_push_payload_tdest;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[13:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitation_ready;
    if((! logic_pop_sync_readArbitation_valid)) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign logic_pop_sync_readArbitation_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitation_payload = logic_pop_addressGen_rData;
  assign t_logic_pop_sync_readPort_rsp_last = logic_ram_spinal_port1;
  assign t_logic_pop_sync_readPort_rsp_tdata = t_logic_pop_sync_readPort_rsp_last[23 : 1];
  assign logic_pop_sync_readPort_rsp_last = t_logic_pop_sync_readPort_rsp_last[0];
  assign logic_pop_sync_readPort_rsp_tdata = t_logic_pop_sync_readPort_rsp_tdata[15 : 0];
  assign logic_pop_sync_readPort_rsp_tuser = t_logic_pop_sync_readPort_rsp_tdata[21 : 16];
  assign logic_pop_sync_readPort_rsp_tdest = t_logic_pop_sync_readPort_rsp_tdata[22 : 22];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign logic_pop_sync_readArbitation_translated_payload_tdata = logic_pop_sync_readPort_rsp_tdata;
  assign logic_pop_sync_readArbitation_translated_payload_tuser = logic_pop_sync_readPort_rsp_tuser;
  assign logic_pop_sync_readArbitation_translated_payload_tdest = logic_pop_sync_readPort_rsp_tdest;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_last = logic_pop_sync_readArbitation_translated_payload_last;
  assign io_pop_payload_tdata = logic_pop_sync_readArbitation_translated_payload_tdata;
  assign io_pop_payload_tuser = logic_pop_sync_readArbitation_translated_payload_tuser;
  assign io_pop_payload_tdest = logic_pop_sync_readArbitation_translated_payload_tdest;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign logic_fmaxAvail_plusOne = (logic_fmaxAvail_value + 15'h0001);
  assign logic_fmaxAvail_minusOne = (logic_fmaxAvail_value - 15'h0001);
  assign logic_fmaxAvail_incr = io_pop_fire;
  assign logic_fmaxAvail_decr = io_push_fire;
  assign io_availability = logic_fmaxAvail_value;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      logic_ptr_push <= 15'h0;
      logic_ptr_pop <= 15'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_arb_fmax_emptyTracker_value <= 15'h4000;
      logic_ptr_arb_fmax_fullTracker_value <= 15'h0;
      logic_ptr_fmax_value <= 15'h0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 15'h0;
      logic_fmaxAvail_value <= 15'h4000;
    end else begin
      if((logic_ptr_doPush != logic_ptr_doPop)) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if((logic_ptr_arb_fmax_emptyTracker_incr != logic_ptr_arb_fmax_emptyTracker_decr)) begin
        logic_ptr_arb_fmax_emptyTracker_value <= (logic_ptr_arb_fmax_emptyTracker_incr ? logic_ptr_arb_fmax_emptyTracker_plusOne : logic_ptr_arb_fmax_emptyTracker_minusOne);
      end
      if(io_flush) begin
        logic_ptr_arb_fmax_emptyTracker_value <= 15'h4000;
      end
      if((logic_ptr_arb_fmax_fullTracker_incr != logic_ptr_arb_fmax_fullTracker_decr)) begin
        logic_ptr_arb_fmax_fullTracker_value <= (logic_ptr_arb_fmax_fullTracker_incr ? logic_ptr_arb_fmax_fullTracker_plusOne : logic_ptr_arb_fmax_fullTracker_minusOne);
      end
      if(io_flush) begin
        logic_ptr_arb_fmax_fullTracker_value <= 15'h0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 15'h0001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 15'h0001);
      end
      if(io_flush) begin
        logic_ptr_push <= 15'h0;
        logic_ptr_pop <= 15'h0;
      end
      if((logic_ptr_fmax_incr != logic_ptr_fmax_decr)) begin
        logic_ptr_fmax_value <= (logic_ptr_fmax_incr ? logic_ptr_fmax_plusOne : logic_ptr_fmax_minusOne);
      end
      if(io_flush) begin
        logic_ptr_fmax_value <= 15'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitation_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 15'h0;
      end
      if((logic_fmaxAvail_incr != logic_fmaxAvail_decr)) begin
        logic_fmaxAvail_value <= (logic_fmaxAvail_incr ? logic_fmaxAvail_plusOne : logic_fmaxAvail_minusOne);
      end
      if(io_flush) begin
        logic_fmaxAvail_value <= 15'h4000;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

