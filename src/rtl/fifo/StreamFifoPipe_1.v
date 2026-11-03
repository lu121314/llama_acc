// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamFifoPipe_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire          io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire          io_pop_payload,
  input  wire          io_flush,
  output wire [12:0]   io_occupancy,
  output wire [12:0]   io_availability,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  reg        [0:0]    logic_ram_spinal_port1;
  wire       [0:0]    t_logic_ram_port;
  reg                 t_1;
  wire                popOut_valid;
  reg                 popOut_ready;
  wire                popOut_payload;
  wire                popOut_m2sPipe_valid;
  wire                popOut_m2sPipe_ready;
  wire                popOut_m2sPipe_payload;
  reg                 popOut_rValid;
  reg                 popOut_rData;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [12:0]   logic_ptr_push;
  reg        [12:0]   logic_ptr_pop;
  wire       [12:0]   logic_ptr_occupancy;
  wire       [12:0]   logic_ptr_popOnIo;
  reg                 logic_ptr_wentUp;
  wire                logic_ptr_arb_fmax_emptyTracker_incr;
  wire                logic_ptr_arb_fmax_emptyTracker_decr;
  reg        [12:0]   logic_ptr_arb_fmax_emptyTracker_value;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_arb_fmax_emptyTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_arb_fmax_emptyTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_ptr_arb_fmax_fullTracker_incr;
  wire                logic_ptr_arb_fmax_fullTracker_decr;
  reg        [12:0]   logic_ptr_arb_fmax_fullTracker_value;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_arb_fmax_fullTracker_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_arb_fmax_fullTracker_minusOne /* synthesis syn_keep = 1 */ ;
  wire                io_push_fire;
  wire                popOut_fire;
  wire                logic_ptr_fmax_incr;
  wire                logic_ptr_fmax_decr;
  reg        [12:0]   logic_ptr_fmax_value;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_fmax_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [12:0]   logic_ptr_fmax_minusOne /* synthesis syn_keep = 1 */ ;
  wire                logic_push_onRam_write_valid;
  wire       [11:0]   logic_push_onRam_write_payload_address;
  wire                logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [11:0]   logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitation_valid;
  wire                logic_pop_sync_readArbitation_ready;
  wire       [11:0]   logic_pop_sync_readArbitation_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [11:0]   logic_pop_addressGen_rData;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [11:0]   logic_pop_sync_readPort_cmd_payload;
  wire                logic_pop_sync_readPort_rsp;
  wire                logic_pop_sync_readArbitation_translated_valid;
  wire                logic_pop_sync_readArbitation_translated_ready;
  wire                logic_pop_sync_readArbitation_translated_payload;
  wire                logic_pop_sync_readArbitation_fire;
  reg        [12:0]   logic_pop_sync_popReg;
  wire                logic_fmaxAvail_incr;
  wire                logic_fmaxAvail_decr;
  reg        [12:0]   logic_fmaxAvail_value;
  (* keep , syn_keep *) wire       [12:0]   logic_fmaxAvail_plusOne /* synthesis syn_keep = 1 */ ;
  (* keep , syn_keep *) wire       [12:0]   logic_fmaxAvail_minusOne /* synthesis syn_keep = 1 */ ;
  reg [0:0] logic_ram [0:4095];

  assign t_logic_ram_port = logic_push_onRam_write_payload_data;
  always @(posedge clk_1_clk) begin
    if(t_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= t_logic_ram_port;
    end
  end

  always @(posedge clk_1_clk) begin
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

  always @(*) begin
    popOut_ready = popOut_m2sPipe_ready;
    if((! popOut_m2sPipe_valid)) begin
      popOut_ready = 1'b1;
    end
  end

  assign popOut_m2sPipe_valid = popOut_rValid;
  assign popOut_m2sPipe_payload = popOut_rData;
  assign io_pop_valid = popOut_m2sPipe_valid;
  assign popOut_m2sPipe_ready = io_pop_ready;
  assign io_pop_payload = popOut_m2sPipe_payload;
  assign logic_ptr_arb_fmax_emptyTracker_plusOne = (logic_ptr_arb_fmax_emptyTracker_value + 13'h0001);
  assign logic_ptr_arb_fmax_emptyTracker_minusOne = (logic_ptr_arb_fmax_emptyTracker_value - 13'h0001);
  assign logic_ptr_arb_fmax_emptyTracker_incr = logic_ptr_doPop;
  assign logic_ptr_arb_fmax_emptyTracker_decr = logic_ptr_doPush;
  assign logic_ptr_empty = logic_ptr_arb_fmax_emptyTracker_value[12];
  assign logic_ptr_arb_fmax_fullTracker_plusOne = (logic_ptr_arb_fmax_fullTracker_value + 13'h0001);
  assign logic_ptr_arb_fmax_fullTracker_minusOne = (logic_ptr_arb_fmax_fullTracker_value - 13'h0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_arb_fmax_fullTracker_incr = io_push_fire;
  assign popOut_fire = (popOut_valid && popOut_ready);
  assign logic_ptr_arb_fmax_fullTracker_decr = popOut_fire;
  assign logic_ptr_full = logic_ptr_arb_fmax_fullTracker_value[12];
  assign logic_ptr_fmax_plusOne = (logic_ptr_fmax_value + 13'h0001);
  assign logic_ptr_fmax_minusOne = (logic_ptr_fmax_value - 13'h0001);
  assign logic_ptr_fmax_incr = io_push_fire;
  assign logic_ptr_fmax_decr = popOut_fire;
  assign logic_ptr_occupancy = logic_ptr_fmax_value;
  assign io_push_ready = (! logic_ptr_full);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[11:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[11:0];
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
  assign logic_pop_sync_readPort_rsp = logic_ram_spinal_port1[0];
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_fire;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readArbitation_translated_valid = logic_pop_sync_readArbitation_valid;
  assign logic_pop_sync_readArbitation_ready = logic_pop_sync_readArbitation_translated_ready;
  assign logic_pop_sync_readArbitation_translated_payload = logic_pop_sync_readPort_rsp;
  assign popOut_valid = logic_pop_sync_readArbitation_translated_valid;
  assign logic_pop_sync_readArbitation_translated_ready = popOut_ready;
  assign popOut_payload = logic_pop_sync_readArbitation_translated_payload;
  assign logic_pop_sync_readArbitation_fire = (logic_pop_sync_readArbitation_valid && logic_pop_sync_readArbitation_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign logic_fmaxAvail_plusOne = (logic_fmaxAvail_value + 13'h0001);
  assign logic_fmaxAvail_minusOne = (logic_fmaxAvail_value - 13'h0001);
  assign logic_fmaxAvail_incr = popOut_fire;
  assign logic_fmaxAvail_decr = io_push_fire;
  assign io_availability = logic_fmaxAvail_value;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      popOut_rValid <= 1'b0;
      logic_ptr_push <= 13'h0;
      logic_ptr_pop <= 13'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_ptr_arb_fmax_emptyTracker_value <= 13'h1000;
      logic_ptr_arb_fmax_fullTracker_value <= 13'h0;
      logic_ptr_fmax_value <= 13'h0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 13'h0;
      logic_fmaxAvail_value <= 13'h1000;
    end else begin
      if(popOut_ready) begin
        popOut_rValid <= popOut_valid;
      end
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
        logic_ptr_arb_fmax_emptyTracker_value <= 13'h1000;
      end
      if((logic_ptr_arb_fmax_fullTracker_incr != logic_ptr_arb_fmax_fullTracker_decr)) begin
        logic_ptr_arb_fmax_fullTracker_value <= (logic_ptr_arb_fmax_fullTracker_incr ? logic_ptr_arb_fmax_fullTracker_plusOne : logic_ptr_arb_fmax_fullTracker_minusOne);
      end
      if(io_flush) begin
        logic_ptr_arb_fmax_fullTracker_value <= 13'h0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 13'h0001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 13'h0001);
      end
      if(io_flush) begin
        logic_ptr_push <= 13'h0;
        logic_ptr_pop <= 13'h0;
      end
      if((logic_ptr_fmax_incr != logic_ptr_fmax_decr)) begin
        logic_ptr_fmax_value <= (logic_ptr_fmax_incr ? logic_ptr_fmax_plusOne : logic_ptr_fmax_minusOne);
      end
      if(io_flush) begin
        logic_ptr_fmax_value <= 13'h0;
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
        logic_pop_sync_popReg <= 13'h0;
      end
      if((logic_fmaxAvail_incr != logic_fmaxAvail_decr)) begin
        logic_fmaxAvail_value <= (logic_fmaxAvail_incr ? logic_fmaxAvail_plusOne : logic_fmaxAvail_minusOne);
      end
      if(io_flush) begin
        logic_fmaxAvail_value <= 13'h1000;
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(popOut_ready) begin
      popOut_rData <= popOut_payload;
    end
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

//StreamFifoPipe replaced by StreamFifoPipe_7

//StreamMux_11 replaced by StreamMux_30

//StreamFifo_28 replaced by StreamFifo_103

//StreamFifo_27 replaced by StreamFifo_103

//StreamFifo_29 replaced by StreamFifo_103

