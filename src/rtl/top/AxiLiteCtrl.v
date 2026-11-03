// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AxiLiteCtrl (
  input  wire          io_ctrl_aw_valid,
  output wire          io_ctrl_aw_ready,
  input  wire [31:0]   io_ctrl_aw_payload_addr,
  input  wire [2:0]    io_ctrl_aw_payload_prot,
  input  wire          io_ctrl_w_valid,
  output wire          io_ctrl_w_ready,
  input  wire [31:0]   io_ctrl_w_payload_data,
  input  wire [3:0]    io_ctrl_w_payload_strb,
  output wire          io_ctrl_b_valid,
  input  wire          io_ctrl_b_ready,
  output wire [1:0]    io_ctrl_b_payload_resp,
  input  wire          io_ctrl_ar_valid,
  output wire          io_ctrl_ar_ready,
  input  wire [31:0]   io_ctrl_ar_payload_addr,
  input  wire [2:0]    io_ctrl_ar_payload_prot,
  output wire          io_ctrl_r_valid,
  input  wire          io_ctrl_r_ready,
  output wire [31:0]   io_ctrl_r_payload_data,
  output wire [1:0]    io_ctrl_r_payload_resp,
  output wire          io_tokenIndex_valid,
  output wire [16:0]   io_tokenIndex_tdata,
  output wire [5:0]    io_tokenIndex_tuser,
  output wire [1:0]    io_cmdSel,
  output wire [4:0]    io_presetLayer,
  output wire [9:0]    io_presetToken,
  input  wire [15:0]   status_tokenCnt,
  input  wire [7:0]    status_layerCnt,
  input  wire          status_argMaxVld,
  input  wire [16:0]   status_argMaxIndex,
  input  wire          status_prefill,
  output wire          resetOut,
  input  wire          S00_ACLK,
  input  wire          S00_ARESETN
);

  wire                liteBus_aw_valid;
  wire                liteBus_aw_ready;
  wire       [31:0]   liteBus_aw_payload_addr;
  wire       [2:0]    liteBus_aw_payload_prot;
  wire                liteBus_w_valid;
  wire                liteBus_w_ready;
  wire       [31:0]   liteBus_w_payload_data;
  wire       [3:0]    liteBus_w_payload_strb;
  wire                liteBus_b_valid;
  wire                liteBus_b_ready;
  wire       [1:0]    liteBus_b_payload_resp;
  wire                liteBus_ar_valid;
  wire                liteBus_ar_ready;
  wire       [31:0]   liteBus_ar_payload_addr;
  wire       [2:0]    liteBus_ar_payload_prot;
  wire                liteBus_r_valid;
  wire                liteBus_r_ready;
  wire       [31:0]   liteBus_r_payload_data;
  wire       [1:0]    liteBus_r_payload_resp;
  wire                ctrl_readErrorFlag;
  wire                ctrl_writeErrorFlag;
  wire                ctrl_readHaltRequest;
  wire                ctrl_writeHaltRequest;
  wire                ctrl_writeJoinEvent_valid;
  wire                ctrl_writeJoinEvent_ready;
  wire                ctrl_writeOccur;
  reg        [1:0]    ctrl_writeRsp_resp;
  wire                ctrl_writeJoinEvent_translated_valid;
  wire                ctrl_writeJoinEvent_translated_ready;
  wire       [1:0]    ctrl_writeJoinEvent_translated_payload_resp;
  wire                t_ctrl_writeJoinEvent_translated_ready;
  wire                t_ctrl_writeJoinEvent_translated_ready_1;
  wire                t_liteBus_b_valid;
  reg                 t_liteBus_b_valid_1;
  reg        [1:0]    t_liteBus_b_payload_resp;
  wire                ctrl_readDataStage_valid;
  wire                ctrl_readDataStage_ready;
  wire       [31:0]   ctrl_readDataStage_payload_addr;
  wire       [2:0]    ctrl_readDataStage_payload_prot;
  reg                 liteBus_ar_rValid;
  wire                ctrl_readDataStage_fire;
  reg        [31:0]   liteBus_ar_rData_addr;
  reg        [2:0]    liteBus_ar_rData_prot;
  reg        [31:0]   ctrl_readRsp_data;
  reg        [1:0]    ctrl_readRsp_resp;
  wire                t_liteBus_r_valid;
  wire       [31:0]   ctrl_readAddressMasked;
  wire       [31:0]   ctrl_writeAddressMasked;
  wire                ctrl_readOccur;
  reg        [15:0]   token;
  reg                 tokenVld;
  reg                 isPrefillToken;
  reg                 isPrefillLastToken;
  reg                 isDecodeToken;
  reg        [15:0]   destTokenCnt;
  reg        [1:0]    cmdSel;
  reg                 softReset;
  reg        [1:0]    resetCnt;
  wire                resetCntOvf;
  reg                 resetKeep;
  reg                 resetKeep_delay_1;
  reg                 resetKeep_delay_2;
  reg                 resetKeep_delay_3;
  reg                 resetKeep_delay_4;
  reg                 resetKeep_delay_5;
  reg                 resetKeep_delay_6;
  reg                 resetKeep_delay_7;
  reg                 resetKeep_delay_8;
  reg                 resetKeep_delay_9;
  reg                 resetKeep_delay_10;
  reg                 resetKeep_delay_11;
  reg                 resetKeep_delay_12;
  reg                 resetKeep_delay_13;
  reg                 resetKeep_delay_14;
  reg                 resetKeep_delay_15;
  reg                 resetKeep_delay_16;
  reg                 resetKeep_delay_17;
  reg                 resetKeep_delay_18;
  reg                 resetKeep_delay_19;
  reg                 resetKeep_delay_20;
  reg                 resetKeep_delay_21;
  reg                 resetKeep_delay_22;
  reg                 resetKeep_delay_23;
  reg                 resetKeep_delay_24;
  reg                 resetKeep_delay_25;
  reg                 resetKeep_delay_26;
  reg                 resetKeep_delay_27;
  reg                 resetKeep_delay_28;
  reg                 resetKeep_delay_29;
  reg                 resetKeep_delay_30;
  reg                 resetKeep_delay_31;
  reg                 resetKeep_delay_32;
  reg                 resetKeep_delay_33;
  reg                 resetKeep_delay_34;
  reg                 resetKeep_delay_35;
  reg                 resetKeep_delay_36;
  reg                 resetKeep_delay_37;
  reg                 resetKeep_delay_38;
  reg                 resetKeep_delay_39;
  reg                 resetKeep_delay_40;
  reg                 resetKeep_delay_41;
  reg                 resetKeep_delay_42;
  reg                 resetKeep_delay_43;
  reg                 resetKeep_delay_44;
  reg                 resetKeep_delay_45;
  reg                 resetKeep_delay_46;
  reg                 resetKeep_delay_47;
  reg                 resetKeep_delay_48;
  reg                 resetKeep_delay_49;
  reg                 resetKeep_delay_50;
  reg                 resetKeep_delay_51;
  reg                 resetKeep_delay_52;
  reg                 resetKeep_delay_53;
  reg                 resetKeep_delay_54;
  reg                 resetKeep_delay_55;
  reg                 resetKeep_delay_56;
  reg                 resetKeep_delay_57;
  reg                 resetKeep_delay_58;
  reg                 resetKeep_delay_59;
  reg                 resetKeep_delay_60;
  reg                 resetKeep_delay_61;
  reg                 resetKeep_delay_62;
  reg                 resetKeep_delay_63;
  reg                 resetDly;
  reg        [15:0]   status_tokenCnt_delay_1;
  reg        [15:0]   tokenCntDly;
  reg                 status_argMaxVld_delay_1;
  reg                 argMaxVldDly;
  reg        [16:0]   t_argMaxIndexDly;
  reg        [16:0]   argMaxIndexDly;
  reg                 status_prefill_delay_1;
  reg                 prefillDly;
  reg        [7:0]    status_layerCnt_delay_1;
  reg        [7:0]    layerCntDly;
  reg                 argMaxVldClr;
  reg                 argMaxVldLock;
  reg        [16:0]   argMaxIndexLock;
  reg        [31:0]   testReg;
  wire       [31:0]   magicNum;
  reg        [31:0]   timer;
  reg                 flag;
  reg        [5:0]    tokenUseTag;
  reg        [0:0]    t_io_tokenIndex_tdata;

  assign liteBus_aw_valid = io_ctrl_aw_valid;
  assign io_ctrl_aw_ready = liteBus_aw_ready;
  assign liteBus_aw_payload_prot = io_ctrl_aw_payload_prot;
  assign liteBus_w_valid = io_ctrl_w_valid;
  assign io_ctrl_w_ready = liteBus_w_ready;
  assign liteBus_w_payload_data = io_ctrl_w_payload_data;
  assign liteBus_w_payload_strb = io_ctrl_w_payload_strb;
  assign io_ctrl_b_valid = liteBus_b_valid;
  assign liteBus_b_ready = io_ctrl_b_ready;
  assign io_ctrl_b_payload_resp = liteBus_b_payload_resp;
  assign liteBus_ar_valid = io_ctrl_ar_valid;
  assign io_ctrl_ar_ready = liteBus_ar_ready;
  assign liteBus_ar_payload_prot = io_ctrl_ar_payload_prot;
  assign io_ctrl_r_valid = liteBus_r_valid;
  assign liteBus_r_ready = io_ctrl_r_ready;
  assign io_ctrl_r_payload_data = liteBus_r_payload_data;
  assign io_ctrl_r_payload_resp = liteBus_r_payload_resp;
  assign liteBus_ar_payload_addr = {22'h0,io_ctrl_ar_payload_addr[9 : 0]};
  assign liteBus_aw_payload_addr = {22'h0,io_ctrl_aw_payload_addr[9 : 0]};
  assign ctrl_readErrorFlag = 1'b0;
  assign ctrl_writeErrorFlag = 1'b0;
  assign ctrl_readHaltRequest = 1'b0;
  assign ctrl_writeHaltRequest = 1'b0;
  assign ctrl_writeOccur = (ctrl_writeJoinEvent_valid && ctrl_writeJoinEvent_ready);
  assign ctrl_writeJoinEvent_valid = (liteBus_aw_valid && liteBus_w_valid);
  assign liteBus_aw_ready = ctrl_writeOccur;
  assign liteBus_w_ready = ctrl_writeOccur;
  assign ctrl_writeJoinEvent_translated_valid = ctrl_writeJoinEvent_valid;
  assign ctrl_writeJoinEvent_ready = ctrl_writeJoinEvent_translated_ready;
  assign ctrl_writeJoinEvent_translated_payload_resp = ctrl_writeRsp_resp;
  assign t_ctrl_writeJoinEvent_translated_ready = (! ctrl_writeHaltRequest);
  assign ctrl_writeJoinEvent_translated_ready = (t_ctrl_writeJoinEvent_translated_ready_1 && t_ctrl_writeJoinEvent_translated_ready);
  assign t_ctrl_writeJoinEvent_translated_ready_1 = (! t_liteBus_b_valid_1);
  assign t_liteBus_b_valid = t_liteBus_b_valid_1;
  assign liteBus_b_valid = t_liteBus_b_valid;
  assign liteBus_b_payload_resp = t_liteBus_b_payload_resp;
  assign ctrl_readDataStage_fire = (ctrl_readDataStage_valid && ctrl_readDataStage_ready);
  assign liteBus_ar_ready = (! liteBus_ar_rValid);
  assign ctrl_readDataStage_valid = liteBus_ar_rValid;
  assign ctrl_readDataStage_payload_addr = liteBus_ar_rData_addr;
  assign ctrl_readDataStage_payload_prot = liteBus_ar_rData_prot;
  assign t_liteBus_r_valid = (! ctrl_readHaltRequest);
  assign ctrl_readDataStage_ready = (liteBus_r_ready && t_liteBus_r_valid);
  assign liteBus_r_valid = (ctrl_readDataStage_valid && t_liteBus_r_valid);
  assign liteBus_r_payload_data = ctrl_readRsp_data;
  assign liteBus_r_payload_resp = ctrl_readRsp_resp;
  always @(*) begin
    if(ctrl_writeErrorFlag) begin
      ctrl_writeRsp_resp = 2'b10;
    end else begin
      ctrl_writeRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    if(ctrl_readErrorFlag) begin
      ctrl_readRsp_resp = 2'b10;
    end else begin
      ctrl_readRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    ctrl_readRsp_data = 32'h0;
    case(ctrl_readAddressMasked)
      32'h00000004 : begin
        ctrl_readRsp_data[15 : 0] = tokenCntDly;
        ctrl_readRsp_data[30 : 16] = argMaxIndexLock[14:0];
        ctrl_readRsp_data[31 : 31] = argMaxVldLock;
      end
      32'h0000002c : begin
        ctrl_readRsp_data[16 : 0] = argMaxIndexLock;
      end
      32'h00000008 : begin
        ctrl_readRsp_data[0 : 0] = prefillDly;
      end
      32'h00000020 : begin
        ctrl_readRsp_data[7 : 0] = layerCntDly;
      end
      32'h0000000c : begin
        ctrl_readRsp_data[31 : 0] = testReg;
      end
      32'h00000044 : begin
        ctrl_readRsp_data[31 : 0] = magicNum;
      end
      32'h00000010 : begin
        ctrl_readRsp_data[31 : 0] = timer;
      end
      default : begin
      end
    endcase
  end

  assign ctrl_readAddressMasked = (ctrl_readDataStage_payload_addr & (~ 32'h00000003));
  assign ctrl_writeAddressMasked = (liteBus_aw_payload_addr & (~ 32'h00000003));
  assign ctrl_readOccur = (liteBus_r_valid && liteBus_r_ready);
  assign resetCntOvf = (resetCnt == 2'b11);
  assign resetOut = resetDly;
  assign magicNum = 32'h0000004d;
  always @(*) begin
    tokenUseTag = 6'h0;
    if(isPrefillToken) begin
      tokenUseTag = 6'h0;
    end
    if(isPrefillLastToken) begin
      tokenUseTag = 6'h01;
    end
    if(isDecodeToken) begin
      tokenUseTag = 6'h02;
    end
  end

  assign io_tokenIndex_tdata = {t_io_tokenIndex_tdata,token};
  assign io_tokenIndex_tuser = tokenUseTag;
  assign io_tokenIndex_valid = tokenVld;
  assign io_cmdSel = cmdSel;
  always @(posedge S00_ACLK or negedge S00_ARESETN) begin
    if(!S00_ARESETN) begin
      t_liteBus_b_valid_1 <= 1'b0;
      liteBus_ar_rValid <= 1'b0;
      token <= 16'h0;
      tokenVld <= 1'b0;
      isPrefillToken <= 1'b0;
      isPrefillLastToken <= 1'b0;
      isDecodeToken <= 1'b0;
      destTokenCnt <= 16'h0;
      cmdSel <= 2'b00;
      softReset <= 1'b0;
      resetCnt <= 2'b00;
      resetKeep <= 1'b0;
      resetKeep_delay_1 <= 1'b0;
      resetKeep_delay_2 <= 1'b0;
      resetKeep_delay_3 <= 1'b0;
      resetKeep_delay_4 <= 1'b0;
      resetKeep_delay_5 <= 1'b0;
      resetKeep_delay_6 <= 1'b0;
      resetKeep_delay_7 <= 1'b0;
      resetKeep_delay_8 <= 1'b0;
      resetKeep_delay_9 <= 1'b0;
      resetKeep_delay_10 <= 1'b0;
      resetKeep_delay_11 <= 1'b0;
      resetKeep_delay_12 <= 1'b0;
      resetKeep_delay_13 <= 1'b0;
      resetKeep_delay_14 <= 1'b0;
      resetKeep_delay_15 <= 1'b0;
      resetKeep_delay_16 <= 1'b0;
      resetKeep_delay_17 <= 1'b0;
      resetKeep_delay_18 <= 1'b0;
      resetKeep_delay_19 <= 1'b0;
      resetKeep_delay_20 <= 1'b0;
      resetKeep_delay_21 <= 1'b0;
      resetKeep_delay_22 <= 1'b0;
      resetKeep_delay_23 <= 1'b0;
      resetKeep_delay_24 <= 1'b0;
      resetKeep_delay_25 <= 1'b0;
      resetKeep_delay_26 <= 1'b0;
      resetKeep_delay_27 <= 1'b0;
      resetKeep_delay_28 <= 1'b0;
      resetKeep_delay_29 <= 1'b0;
      resetKeep_delay_30 <= 1'b0;
      resetKeep_delay_31 <= 1'b0;
      resetKeep_delay_32 <= 1'b0;
      resetKeep_delay_33 <= 1'b0;
      resetKeep_delay_34 <= 1'b0;
      resetKeep_delay_35 <= 1'b0;
      resetKeep_delay_36 <= 1'b0;
      resetKeep_delay_37 <= 1'b0;
      resetKeep_delay_38 <= 1'b0;
      resetKeep_delay_39 <= 1'b0;
      resetKeep_delay_40 <= 1'b0;
      resetKeep_delay_41 <= 1'b0;
      resetKeep_delay_42 <= 1'b0;
      resetKeep_delay_43 <= 1'b0;
      resetKeep_delay_44 <= 1'b0;
      resetKeep_delay_45 <= 1'b0;
      resetKeep_delay_46 <= 1'b0;
      resetKeep_delay_47 <= 1'b0;
      resetKeep_delay_48 <= 1'b0;
      resetKeep_delay_49 <= 1'b0;
      resetKeep_delay_50 <= 1'b0;
      resetKeep_delay_51 <= 1'b0;
      resetKeep_delay_52 <= 1'b0;
      resetKeep_delay_53 <= 1'b0;
      resetKeep_delay_54 <= 1'b0;
      resetKeep_delay_55 <= 1'b0;
      resetKeep_delay_56 <= 1'b0;
      resetKeep_delay_57 <= 1'b0;
      resetKeep_delay_58 <= 1'b0;
      resetKeep_delay_59 <= 1'b0;
      resetKeep_delay_60 <= 1'b0;
      resetKeep_delay_61 <= 1'b0;
      resetKeep_delay_62 <= 1'b0;
      resetKeep_delay_63 <= 1'b0;
      resetDly <= 1'b0;
      status_tokenCnt_delay_1 <= 16'h0;
      tokenCntDly <= 16'h0;
      status_argMaxVld_delay_1 <= 1'b0;
      argMaxVldDly <= 1'b0;
      t_argMaxIndexDly <= 17'h0;
      argMaxIndexDly <= 17'h0;
      status_prefill_delay_1 <= 1'b0;
      prefillDly <= 1'b0;
      status_layerCnt_delay_1 <= 8'h0;
      layerCntDly <= 8'h0;
      argMaxVldClr <= 1'b0;
      argMaxVldLock <= 1'b0;
      argMaxIndexLock <= 17'h0;
      testReg <= 32'h0;
      timer <= 32'h0;
      flag <= 1'b0;
      t_io_tokenIndex_tdata <= 1'b0;
    end else begin
      if((ctrl_writeJoinEvent_translated_valid && t_ctrl_writeJoinEvent_translated_ready)) begin
        t_liteBus_b_valid_1 <= 1'b1;
      end
      if((t_liteBus_b_valid && liteBus_b_ready)) begin
        t_liteBus_b_valid_1 <= 1'b0;
      end
      if(liteBus_ar_valid) begin
        liteBus_ar_rValid <= 1'b1;
      end
      if(ctrl_readDataStage_fire) begin
        liteBus_ar_rValid <= 1'b0;
      end
      tokenVld <= 1'b0;
      softReset <= 1'b0;
      if(softReset) begin
        resetKeep <= 1'b1;
      end
      if(resetKeep) begin
        resetCnt <= (resetCnt + 2'b01);
        if(resetCntOvf) begin
          resetCnt <= 2'b00;
          resetKeep <= 1'b0;
        end
      end
      resetKeep_delay_1 <= resetKeep;
      resetKeep_delay_2 <= resetKeep_delay_1;
      resetKeep_delay_3 <= resetKeep_delay_2;
      resetKeep_delay_4 <= resetKeep_delay_3;
      resetKeep_delay_5 <= resetKeep_delay_4;
      resetKeep_delay_6 <= resetKeep_delay_5;
      resetKeep_delay_7 <= resetKeep_delay_6;
      resetKeep_delay_8 <= resetKeep_delay_7;
      resetKeep_delay_9 <= resetKeep_delay_8;
      resetKeep_delay_10 <= resetKeep_delay_9;
      resetKeep_delay_11 <= resetKeep_delay_10;
      resetKeep_delay_12 <= resetKeep_delay_11;
      resetKeep_delay_13 <= resetKeep_delay_12;
      resetKeep_delay_14 <= resetKeep_delay_13;
      resetKeep_delay_15 <= resetKeep_delay_14;
      resetKeep_delay_16 <= resetKeep_delay_15;
      resetKeep_delay_17 <= resetKeep_delay_16;
      resetKeep_delay_18 <= resetKeep_delay_17;
      resetKeep_delay_19 <= resetKeep_delay_18;
      resetKeep_delay_20 <= resetKeep_delay_19;
      resetKeep_delay_21 <= resetKeep_delay_20;
      resetKeep_delay_22 <= resetKeep_delay_21;
      resetKeep_delay_23 <= resetKeep_delay_22;
      resetKeep_delay_24 <= resetKeep_delay_23;
      resetKeep_delay_25 <= resetKeep_delay_24;
      resetKeep_delay_26 <= resetKeep_delay_25;
      resetKeep_delay_27 <= resetKeep_delay_26;
      resetKeep_delay_28 <= resetKeep_delay_27;
      resetKeep_delay_29 <= resetKeep_delay_28;
      resetKeep_delay_30 <= resetKeep_delay_29;
      resetKeep_delay_31 <= resetKeep_delay_30;
      resetKeep_delay_32 <= resetKeep_delay_31;
      resetKeep_delay_33 <= resetKeep_delay_32;
      resetKeep_delay_34 <= resetKeep_delay_33;
      resetKeep_delay_35 <= resetKeep_delay_34;
      resetKeep_delay_36 <= resetKeep_delay_35;
      resetKeep_delay_37 <= resetKeep_delay_36;
      resetKeep_delay_38 <= resetKeep_delay_37;
      resetKeep_delay_39 <= resetKeep_delay_38;
      resetKeep_delay_40 <= resetKeep_delay_39;
      resetKeep_delay_41 <= resetKeep_delay_40;
      resetKeep_delay_42 <= resetKeep_delay_41;
      resetKeep_delay_43 <= resetKeep_delay_42;
      resetKeep_delay_44 <= resetKeep_delay_43;
      resetKeep_delay_45 <= resetKeep_delay_44;
      resetKeep_delay_46 <= resetKeep_delay_45;
      resetKeep_delay_47 <= resetKeep_delay_46;
      resetKeep_delay_48 <= resetKeep_delay_47;
      resetKeep_delay_49 <= resetKeep_delay_48;
      resetKeep_delay_50 <= resetKeep_delay_49;
      resetKeep_delay_51 <= resetKeep_delay_50;
      resetKeep_delay_52 <= resetKeep_delay_51;
      resetKeep_delay_53 <= resetKeep_delay_52;
      resetKeep_delay_54 <= resetKeep_delay_53;
      resetKeep_delay_55 <= resetKeep_delay_54;
      resetKeep_delay_56 <= resetKeep_delay_55;
      resetKeep_delay_57 <= resetKeep_delay_56;
      resetKeep_delay_58 <= resetKeep_delay_57;
      resetKeep_delay_59 <= resetKeep_delay_58;
      resetKeep_delay_60 <= resetKeep_delay_59;
      resetKeep_delay_61 <= resetKeep_delay_60;
      resetKeep_delay_62 <= resetKeep_delay_61;
      resetKeep_delay_63 <= resetKeep_delay_62;
      resetDly <= resetKeep_delay_63;
      status_tokenCnt_delay_1 <= status_tokenCnt;
      tokenCntDly <= status_tokenCnt_delay_1;
      status_argMaxVld_delay_1 <= status_argMaxVld;
      argMaxVldDly <= status_argMaxVld_delay_1;
      t_argMaxIndexDly <= status_argMaxIndex;
      argMaxIndexDly <= t_argMaxIndexDly;
      status_prefill_delay_1 <= status_prefill;
      prefillDly <= status_prefill_delay_1;
      status_layerCnt_delay_1 <= status_layerCnt;
      layerCntDly <= status_layerCnt_delay_1;
      argMaxVldClr <= 1'b0;
      if(argMaxVldDly) begin
        argMaxVldLock <= 1'b1;
      end
      if(argMaxVldClr) begin
        argMaxVldLock <= 1'b0;
      end
      if(argMaxVldDly) begin
        argMaxIndexLock <= argMaxIndexDly;
      end
      if(argMaxVldClr) begin
        argMaxIndexLock <= 17'h0;
      end
      if(flag) begin
        timer <= (timer + 32'h00000001);
      end
      if(tokenVld) begin
        flag <= 1'b1;
      end
      if((destTokenCnt == status_tokenCnt)) begin
        flag <= 1'b0;
      end
      case(ctrl_writeAddressMasked)
        32'h0 : begin
          if(ctrl_writeOccur) begin
            token <= liteBus_w_payload_data[15 : 0];
            tokenVld <= liteBus_w_payload_data[16];
            isPrefillToken <= liteBus_w_payload_data[17];
            isPrefillLastToken <= liteBus_w_payload_data[18];
            isDecodeToken <= liteBus_w_payload_data[19];
          end
        end
        32'h00000024 : begin
          if(ctrl_writeOccur) begin
            cmdSel <= liteBus_w_payload_data[1 : 0];
          end
        end
        32'h000000c0 : begin
          if(ctrl_writeOccur) begin
            softReset <= liteBus_w_payload_data[0];
          end
        end
        32'h00000080 : begin
          if(ctrl_writeOccur) begin
            argMaxVldClr <= liteBus_w_payload_data[0];
          end
        end
        32'h0000000c : begin
          if(ctrl_writeOccur) begin
            testReg <= liteBus_w_payload_data[31 : 0];
          end
        end
        32'h00000010 : begin
          if(ctrl_writeOccur) begin
            destTokenCnt <= liteBus_w_payload_data[15 : 0];
          end
        end
        32'h00000028 : begin
          if(ctrl_writeOccur) begin
            t_io_tokenIndex_tdata <= liteBus_w_payload_data[0 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge S00_ACLK) begin
    if(t_ctrl_writeJoinEvent_translated_ready_1) begin
      t_liteBus_b_payload_resp <= ctrl_writeJoinEvent_translated_payload_resp;
    end
    if(liteBus_ar_ready) begin
      liteBus_ar_rData_addr <= liteBus_ar_payload_addr;
      liteBus_ar_rData_prot <= liteBus_ar_payload_prot;
    end
  end


endmodule

