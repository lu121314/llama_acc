// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamFifo_35 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload_last,
  input  wire [5:0]    io_push_payload_fragment,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload_last,
  output wire [5:0]    io_pop_payload_fragment,
  input  wire          io_flush,
  output wire [5:0]    io_occupancy,
  output wire [5:0]    io_availability,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  reg        [6:0]    logic_ram_spinal_port1;
  wire       [6:0]    t_logic_ram_port;
  reg                 t_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [5:0]    logic_ptr_push;
  reg        [5:0]    logic_ptr_pop;
  wire       [5:0]    logic_ptr_occupancy;
  wire       [5:0]    logic_ptr_popOnIo;
  reg                 logic_ptr_wentUp;
  wire                logic_ptr_arb_fmax_emptyTracker_incr;
  wire                logic_ptr_arb_fmax_emptyTracker_decr;
  reg        [5:0]    logic_ptr_arb_fmax_emptyTracker_value;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_arb_fmax_emptyTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_arb_fmax_emptyTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_ptr_arb_fmax_fullTracker_incr;
  wire                logic_ptr_arb_fmax_fullTracker_decr;
  reg        [5:0]    logic_ptr_arb_fmax_fullTracker_value;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_arb_fmax_fullTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_arb_fmax_fullTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                io_push_fire;
  wire                io_pop_fire;
  wire                logic_ptr_fmax_incr;
  wire                logic_ptr_fmax_decr;
  reg        [5:0]    logic_ptr_fmax_value;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_fmax_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [5:0]    logic_ptr_fmax_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_push_onRam_write_valid;
  wire       [4:0]    logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data_last;
  wire       [5:0]    logic_push_onRam_write_payload_data_fragment;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [4:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [4:0]    logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [4:0]    logic_pop_addressGen_rData;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [4:0]    logic_pop_sync_readPort_cmd_payload;
  wire                logic_pop_sync_readPort_rsp_last;
  wire       [5:0]    logic_pop_sync_readPort_rsp_fragment;
  wire       [6:0]    t_logic_pop_sync_readPort_rsp_last;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire                logic_pop_sync_readArbitation_translated_payload_last;
  wire       [5:0]    logic_pop_sync_readArbitation_translated_payload_fragment;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [5:0]    logic_pop_sync_popReg;
  wire                logic_fmaxAvail_incr;
  wire                logic_fmaxAvail_decr;
  reg        [5:0]    logic_fmaxAvail_value;
  (* keep , syn_keep *) wire       [5:0]    logic_fmaxAvail_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [5:0]    logic_fmaxAvail_minusOne /* synthesis syn_keep = 1 */ ;
  reg [6:0] logic_ram [0:31];

  assign t_logic_ram_port = {logic_push_onRam_write_payload_data_fragment,logic_push_onRam_write_payload_data_last};
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

  assign logic_ptr_arb_fmax_emptyTracker_plusOne = (logic_ptr_arb_fmax_emptyTracker_value + 6'h01);
  assign logic_ptr_arb_fmax_emptyTracker_minusOne = (logic_ptr_arb_fmax_emptyTracker_value - 6'h01);
  assign logic_ptr_arb_fmax_emptyTracker_incr = logic_ptr_doPop;
  assign logic_ptr_arb_fmax_emptyTracker_decr = logic_ptr_doPush;
  assign logic_ptr_empty = logic_ptr_arb_fmax_emptyTracker_value[5];
  assign logic_ptr_arb_fmax_fullTracker_plusOne = (logic_ptr_arb_fmax_fullTracker_value + 6'h01);
  assign logic_ptr_arb_fmax_fullTracker_minusOne = (logic_ptr_arb_fmax_fullTracker_value - 6'h01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_arb_fmax_fullTracker_incr = io_push_fire;
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign logic_ptr_arb_fmax_fullTracker_decr = io_pop_fire;
  assign logic_ptr_full = logic_ptr_arb_fmax_fullTracker_value[5];
  assign logic_ptr_fmax_plusOne = (logic_ptr_fmax_value + 6'h01);
  assign logic_ptr_fmax_minusOne = (logic_ptr_fmax_value - 6'h01);
  assign logic_ptr_fmax_incr = io_push_fire;
  assign logic_ptr_fmax_decr = io_pop_fire;
  assign logic_ptr_occupancy = logic_ptr_fmax_value;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[4:0];
  assign logic_push_onRam_write_payload_data_last = io_push_payload_last;
  assign logic_push_onRam_write_payload_data_fragment = io_push_payload_fragment;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[4:0];
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
  assign logic_pop_sync_readPort_rsp_last = t_logic_pop_sync_readPort_rsp_last[0];
  assign logic_pop_sync_readPort_rsp_fragment = t_logic_pop_sync_readPort_rsp_last[6 : 1];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload_last = logic_pop_sync_readPort_rsp_last;
  assign logic_pop_sync_readArbitation_translated_payload_fragment = logic_pop_sync_readPort_rsp_fragment;
  assign io_pop_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_last = logic_pop_sync_readArbitation_translated_payload_last;
  assign io_pop_payload_fragment = logic_pop_sync_readArbitation_translated_payload_fragment;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign logic_fmaxAvail_plusOne = (logic_fmaxAvail_value + 6'h01);
  assign logic_fmaxAvail_minusOne = (logic_fmaxAvail_value - 6'h01);
  assign logic_fmaxAvail_incr = io_pop_fire;
  assign logic_fmaxAvail_decr = io_push_fire;
  assign io_availability = logic_fmaxAvail_value;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      logic_ptr_push <= 6'h0;
      logic_ptr_pop <= 6'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_arb_fmax_emptyTracker_value <= 6'h20;
      logic_ptr_arb_fmax_fullTracker_value <= 6'h0;
      logic_ptr_fmax_value <= 6'h0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 6'h0;
      logic_fmaxAvail_value <= 6'h20;
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
        logic_ptr_arb_fmax_emptyTracker_value <= 6'h20;
      end
      if((logic_ptr_arb_fmax_fullTracker_incr != logic_ptr_arb_fmax_fullTracker_decr)) begin
        logic_ptr_arb_fmax_fullTracker_value <= (logic_ptr_arb_fmax_fullTracker_incr ? logic_ptr_arb_fmax_fullTracker_plusOne : logic_ptr_arb_fmax_fullTracker_minusOne);
      end
      if(io_flush) begin
        logic_ptr_arb_fmax_fullTracker_value <= 6'h0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 6'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 6'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 6'h0;
        logic_ptr_pop <= 6'h0;
      end
      if((logic_ptr_fmax_incr != logic_ptr_fmax_decr)) begin
        logic_ptr_fmax_value <= (logic_ptr_fmax_incr ? logic_ptr_fmax_plusOne : logic_ptr_fmax_minusOne);
      end
      if(io_flush) begin
        logic_ptr_fmax_value <= 6'h0;
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
        logic_pop_sync_popReg <= 6'h0;
      end
      if((logic_fmaxAvail_incr != logic_fmaxAvail_decr)) begin
        logic_fmaxAvail_value <= (logic_fmaxAvail_incr ? logic_fmaxAvail_plusOne : logic_fmaxAvail_minusOne);
      end
      if(io_flush) begin
        logic_fmaxAvail_value <= 6'h20;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

