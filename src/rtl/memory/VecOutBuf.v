// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module VecOutBuf (
  input  wire          io_input_valid,
  input  wire [2047:0] io_input_tdata,
  input  wire [5:0]    io_input_tuser,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [2047:0] io_output_payload,
  input  wire          status_tokenIndexFlow_valid,
  input  wire [5:0]    status_tokenIndexFlow_payload,
  input  wire          status_enPredictor,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                pushStatus_prefillIn_fifo_io_pop_ready;
  wire                popStatus_prefillIn_fifo_io_pop_ready;
  reg        [127:0]  ram_mem_0_spinal_port1;
  reg        [127:0]  ram_mem_1_spinal_port1;
  reg        [127:0]  ram_mem_2_spinal_port1;
  reg        [127:0]  ram_mem_3_spinal_port1;
  reg        [127:0]  ram_mem_4_spinal_port1;
  reg        [127:0]  ram_mem_5_spinal_port1;
  reg        [127:0]  ram_mem_6_spinal_port1;
  reg        [127:0]  ram_mem_7_spinal_port1;
  reg        [127:0]  ram_mem_8_spinal_port1;
  reg        [127:0]  ram_mem_9_spinal_port1;
  reg        [127:0]  ram_mem_10_spinal_port1;
  reg        [127:0]  ram_mem_11_spinal_port1;
  reg        [127:0]  ram_mem_12_spinal_port1;
  reg        [127:0]  ram_mem_13_spinal_port1;
  reg        [127:0]  ram_mem_14_spinal_port1;
  reg        [127:0]  ram_mem_15_spinal_port1;
  wire                pushStatus_prefillIn_fifo_io_push_ready;
  wire                pushStatus_prefillIn_fifo_io_pop_valid;
  wire                pushStatus_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    pushStatus_prefillIn_fifo_io_occupancy;
  wire       [6:0]    pushStatus_prefillIn_fifo_io_availability;
  wire                popStatus_prefillIn_fifo_io_push_ready;
  wire                popStatus_prefillIn_fifo_io_pop_valid;
  wire                popStatus_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    popStatus_prefillIn_fifo_io_occupancy;
  wire       [6:0]    popStatus_prefillIn_fifo_io_availability;
  wire                lutInst_0_O;
  wire                lutInst_1_O;
  wire                lutInst_2_O;
  wire                lutInst_3_O;
  wire                lutInst_4_O;
  wire                lutInst_5_O;
  wire                lutInst_6_O;
  wire                lutInst_7_O;
  wire                lutInst_8_O;
  wire                lutInst_9_O;
  wire                lutInst_10_O;
  wire                lutInst_11_O;
  wire                lutInst_12_O;
  wire                lutInst_13_O;
  wire                lutInst_14_O;
  wire                lutInst_15_O;
  wire                t_when;
  wire                t_when_1;
  wire                t_when_2;
  wire                t_when_3;
  wire                t_when_4;
  wire                t_when_5;
  wire                t_when_6;
  wire                t_when_7;
  wire                t_when_8;
  wire                t_when_9;
  wire                t_when_10;
  wire                t_when_11;
  wire                t_when_12;
  wire                t_when_13;
  wire                t_when_14;
  wire       [5:0]    t_ram_mem_0_port;
  wire       [5:0]    t_ram_mem_1_port;
  wire       [5:0]    t_ram_mem_2_port;
  wire       [5:0]    t_ram_mem_3_port;
  wire       [5:0]    t_ram_mem_4_port;
  wire       [5:0]    t_ram_mem_5_port;
  wire       [5:0]    t_ram_mem_6_port;
  wire       [5:0]    t_ram_mem_7_port;
  wire       [5:0]    t_ram_mem_8_port;
  wire       [5:0]    t_ram_mem_9_port;
  wire       [5:0]    t_ram_mem_10_port;
  wire       [5:0]    t_ram_mem_11_port;
  wire       [5:0]    t_ram_mem_12_port;
  wire       [5:0]    t_ram_mem_13_port;
  wire       [5:0]    t_ram_mem_14_port;
  wire       [5:0]    t_ram_mem_15_port;
  reg                 validDly;
  reg        [2047:0] dataDly;
  wire                ptrPush_enPushCnt;
  reg        [4:0]    ptrPush_pushPackLen;
  reg        [4:0]    ptrPush_pushStartAt;
  reg        [4:0]    ptrPush_pushStartAtNext;
  reg                 ptrPush_pushReuse;
  reg                 ptrPush_pushReuseNext;
  reg        [4:0]    ptrPush_pushPtr;
  reg        [4:0]    ptrPush_pushNext;
  wire                ptrPush_pushPtrOvf;
  reg        [4:0]    pushStatus_layerCnt;
  reg                 pushStatus_lastLayer;
  wire                pushStatus_layerCntAbout2Ovf;
  reg                 pushStatus_enLayerCntInc;
  wire                pushStatus_prefillIn_valid;
  wire                pushStatus_prefillIn_ready;
  wire                pushStatus_prefillIn_payload;
  reg                 pushStatus_prefillFirstToken;
  reg                 pushStatus_logitsGen;
  wire                vecBuf_pushStatus_prefillIn_fifo_io_pop_fire;
  reg                 pushStatus_tokenIn;
  reg                 pushStatus_lnOut;
  reg                 pushStatus_qRotateOut;
  reg                 pushStatus_qkvOut;
  reg                 pushStatus_mlpLnOut;
  wire                pushStatus_stateTrig;
  reg        [4:0]    pushStatus_headCnt;
  wire                pushStatus_headCntOvf;
  reg        [4:0]    pushStatus_headCntNext;
  wire       [4:0]    pushStatus_headCntNextInc;
  wire                ptrPop_enPopCnt;
  reg        [4:0]    ptrPop_popPackLen;
  reg        [4:0]    ptrPop_popStartAt;
  reg        [4:0]    ptrPop_popStartAtNext;
  reg        [4:0]    ptrPop_popPtr;
  reg                 ptrPop_popReuse;
  reg                 ptrPop_popReuseNext;
  reg        [4:0]    ptrPop_popNext;
  wire                ptrPop_popPtrOvf;
  reg        [4:0]    popStatus_layerCnt;
  reg                 popStatus_lastLayer;
  wire                popStatus_layerCntAbout2Ovf;
  reg                 popStatus_enLayerCntInc;
  wire                popStatus_prefillIn_valid;
  wire                popStatus_prefillIn_ready;
  wire                popStatus_prefillIn_payload;
  reg                 popStatus_prefillFirstToken;
  reg                 popStatus_logitsGen;
  wire                vecBuf_popStatus_prefillIn_fifo_io_pop_fire;
  reg                 popStatus_throughToLn;
  reg                 popStatus_lnToLogits;
  reg                 popStatus_reuseToQ;
  reg                 popStatus_qToQK;
  reg                 popStatus_reuseToK;
  reg                 popStatus_reuseToV;
  reg                 popStatus_qkvToOutProj;
  reg                 popStatus_reuseToPredU;
  reg                 popStatus_reuseToGate;
  reg                 popStatus_reuseToUp;
  wire                popStatus_stateTrig;
  wire                popStatus_prefillCond;
  reg        [4:0]    popStatus_headCnt;
  wire                popStatus_headCntOvf;
  wire       [4:0]    popStatus_headCntNext;
  (* keep = "true" *) reg                 ram_pushEn_0;
  (* keep = "true" *) reg                 ram_pushEn_1;
  (* keep = "true" *) reg                 ram_pushEn_2;
  (* keep = "true" *) reg                 ram_pushEn_3;
  (* keep = "true" *) reg                 ram_pushEn_4;
  (* keep = "true" *) reg                 ram_pushEn_5;
  (* keep = "true" *) reg                 ram_pushEn_6;
  (* keep = "true" *) reg                 ram_pushEn_7;
  (* keep = "true" *) reg                 ram_pushEn_8;
  (* keep = "true" *) reg                 ram_pushEn_9;
  (* keep = "true" *) reg                 ram_pushEn_10;
  (* keep = "true" *) reg                 ram_pushEn_11;
  (* keep = "true" *) reg                 ram_pushEn_12;
  (* keep = "true" *) reg                 ram_pushEn_13;
  (* keep = "true" *) reg                 ram_pushEn_14;
  (* keep = "true" *) reg                 ram_pushEn_15;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_0;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_1;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_2;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_3;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_4;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_5;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_6;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_7;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_8;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_9;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_10;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_11;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_12;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_13;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_14;
  (* keep = "true" *) reg        [4:0]    ram_pushPtrLow_15;
  (* keep = "true" *) reg                 ram_pushPtrMsb_0;
  (* keep = "true" *) reg                 ram_pushPtrMsb_1;
  (* keep = "true" *) reg                 ram_pushPtrMsb_2;
  (* keep = "true" *) reg                 ram_pushPtrMsb_3;
  (* keep = "true" *) reg                 ram_pushPtrMsb_4;
  (* keep = "true" *) reg                 ram_pushPtrMsb_5;
  (* keep = "true" *) reg                 ram_pushPtrMsb_6;
  (* keep = "true" *) reg                 ram_pushPtrMsb_7;
  (* keep = "true" *) reg                 ram_pushPtrMsb_8;
  (* keep = "true" *) reg                 ram_pushPtrMsb_9;
  (* keep = "true" *) reg                 ram_pushPtrMsb_10;
  (* keep = "true" *) reg                 ram_pushPtrMsb_11;
  (* keep = "true" *) reg                 ram_pushPtrMsb_12;
  (* keep = "true" *) reg                 ram_pushPtrMsb_13;
  (* keep = "true" *) reg                 ram_pushPtrMsb_14;
  (* keep = "true" *) reg                 ram_pushPtrMsb_15;
  wire       [5:0]    ram_pushPtr_0;
  wire       [5:0]    ram_pushPtr_1;
  wire       [5:0]    ram_pushPtr_2;
  wire       [5:0]    ram_pushPtr_3;
  wire       [5:0]    ram_pushPtr_4;
  wire       [5:0]    ram_pushPtr_5;
  wire       [5:0]    ram_pushPtr_6;
  wire       [5:0]    ram_pushPtr_7;
  wire       [5:0]    ram_pushPtr_8;
  wire       [5:0]    ram_pushPtr_9;
  wire       [5:0]    ram_pushPtr_10;
  wire       [5:0]    ram_pushPtr_11;
  wire       [5:0]    ram_pushPtr_12;
  wire       [5:0]    ram_pushPtr_13;
  wire       [5:0]    ram_pushPtr_14;
  wire       [5:0]    ram_pushPtr_15;
  wire                ram_popEn_0;
  wire                ram_popEn_1;
  wire                ram_popEn_2;
  wire                ram_popEn_3;
  wire                ram_popEn_4;
  wire                ram_popEn_5;
  wire                ram_popEn_6;
  wire                ram_popEn_7;
  wire                ram_popEn_8;
  wire                ram_popEn_9;
  wire                ram_popEn_10;
  wire                ram_popEn_11;
  wire                ram_popEn_12;
  wire                ram_popEn_13;
  wire                ram_popEn_14;
  wire                ram_popEn_15;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_0;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_1;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_2;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_3;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_4;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_5;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_6;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_7;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_8;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_9;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_10;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_11;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_12;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_13;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_14;
  (* keep = "true" *) reg        [4:0]    ram_popPtrLow_15;
  (* keep = "true" *) reg                 ram_popPtrMsb_0;
  (* keep = "true" *) reg                 ram_popPtrMsb_1;
  (* keep = "true" *) reg                 ram_popPtrMsb_2;
  (* keep = "true" *) reg                 ram_popPtrMsb_3;
  (* keep = "true" *) reg                 ram_popPtrMsb_4;
  (* keep = "true" *) reg                 ram_popPtrMsb_5;
  (* keep = "true" *) reg                 ram_popPtrMsb_6;
  (* keep = "true" *) reg                 ram_popPtrMsb_7;
  (* keep = "true" *) reg                 ram_popPtrMsb_8;
  (* keep = "true" *) reg                 ram_popPtrMsb_9;
  (* keep = "true" *) reg                 ram_popPtrMsb_10;
  (* keep = "true" *) reg                 ram_popPtrMsb_11;
  (* keep = "true" *) reg                 ram_popPtrMsb_12;
  (* keep = "true" *) reg                 ram_popPtrMsb_13;
  (* keep = "true" *) reg                 ram_popPtrMsb_14;
  (* keep = "true" *) reg                 ram_popPtrMsb_15;
  wire       [5:0]    ram_popPtr_0;
  wire       [5:0]    ram_popPtr_1;
  wire       [5:0]    ram_popPtr_2;
  wire       [5:0]    ram_popPtr_3;
  wire       [5:0]    ram_popPtr_4;
  wire       [5:0]    ram_popPtr_5;
  wire       [5:0]    ram_popPtr_6;
  wire       [5:0]    ram_popPtr_7;
  wire       [5:0]    ram_popPtr_8;
  wire       [5:0]    ram_popPtr_9;
  wire       [5:0]    ram_popPtr_10;
  wire       [5:0]    ram_popPtr_11;
  wire       [5:0]    ram_popPtr_12;
  wire       [5:0]    ram_popPtr_13;
  wire       [5:0]    ram_popPtr_14;
  wire       [5:0]    ram_popPtr_15;
  wire       [127:0]  ram_ramIn_0;
  wire       [127:0]  ram_ramIn_1;
  wire       [127:0]  ram_ramIn_2;
  wire       [127:0]  ram_ramIn_3;
  wire       [127:0]  ram_ramIn_4;
  wire       [127:0]  ram_ramIn_5;
  wire       [127:0]  ram_ramIn_6;
  wire       [127:0]  ram_ramIn_7;
  wire       [127:0]  ram_ramIn_8;
  wire       [127:0]  ram_ramIn_9;
  wire       [127:0]  ram_ramIn_10;
  wire       [127:0]  ram_ramIn_11;
  wire       [127:0]  ram_ramIn_12;
  wire       [127:0]  ram_ramIn_13;
  wire       [127:0]  ram_ramIn_14;
  wire       [127:0]  ram_ramIn_15;
  wire       [127:0]  ram_ramOut_0;
  wire       [127:0]  ram_ramOut_1;
  wire       [127:0]  ram_ramOut_2;
  wire       [127:0]  ram_ramOut_3;
  wire       [127:0]  ram_ramOut_4;
  wire       [127:0]  ram_ramOut_5;
  wire       [127:0]  ram_ramOut_6;
  wire       [127:0]  ram_ramOut_7;
  wire       [127:0]  ram_ramOut_8;
  wire       [127:0]  ram_ramOut_9;
  wire       [127:0]  ram_ramOut_10;
  wire       [127:0]  ram_ramOut_11;
  wire       [127:0]  ram_ramOut_12;
  wire       [127:0]  ram_ramOut_13;
  wire       [127:0]  ram_ramOut_14;
  wire       [127:0]  ram_ramOut_15;
  wire       [5:0]    t_ram_ramOut_0;
  wire       [5:0]    t_ram_ramOut_1;
  wire       [5:0]    t_ram_ramOut_2;
  wire       [5:0]    t_ram_ramOut_3;
  wire       [5:0]    t_ram_ramOut_4;
  wire       [5:0]    t_ram_ramOut_5;
  wire       [5:0]    t_ram_ramOut_6;
  wire       [5:0]    t_ram_ramOut_7;
  wire       [5:0]    t_ram_ramOut_8;
  wire       [5:0]    t_ram_ramOut_9;
  wire       [5:0]    t_ram_ramOut_10;
  wire       [5:0]    t_ram_ramOut_11;
  wire       [5:0]    t_ram_ramOut_12;
  wire       [5:0]    t_ram_ramOut_13;
  wire       [5:0]    t_ram_ramOut_14;
  wire       [5:0]    t_ram_ramOut_15;
  reg                 reusePushFinish;
  wire                popLtPush;
  reg                 popPre_valid;
  reg                 popPre_ready;
  reg                 popPre_thrown_valid;
  reg                 popPre_thrown_ready;
  wire                popPrePipe_valid;
  wire                popPrePipe_ready;
  reg                 popPre_thrown_rValid;
  wire                popPre_fire;
  (* ram_style = "distributed" *) reg [127:0] ram_mem_0 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_1 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_2 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_3 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_4 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_5 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_6 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_7 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_8 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_9 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_10 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_11 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_12 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_13 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_14 [0:63];
  (* ram_style = "distributed" *) reg [127:0] ram_mem_15 [0:63];

  assign t_when = (pushStatus_tokenIn && pushStatus_stateTrig);
  assign t_when_1 = (pushStatus_lnOut && pushStatus_stateTrig);
  assign t_when_2 = (pushStatus_prefillIn_fifo_io_pop_payload && pushStatus_lastLayer);
  assign t_when_4 = (pushStatus_qkvOut && pushStatus_stateTrig);
  assign t_when_5 = (pushStatus_mlpLnOut && pushStatus_stateTrig);
  assign t_when_3 = (pushStatus_qRotateOut && pushStatus_stateTrig);
  assign t_when_6 = (popStatus_throughToLn && popStatus_stateTrig);
  assign t_when_7 = (popStatus_lnToLogits && popStatus_stateTrig);
  assign t_when_8 = (popStatus_reuseToQ && popStatus_stateTrig);
  assign t_when_9 = (popStatus_reuseToK && popStatus_stateTrig);
  assign t_when_10 = (popStatus_qToQK && popStatus_stateTrig);
  assign t_when_11 = (popStatus_reuseToV && popStatus_stateTrig);
  assign t_when_13 = (popStatus_qkvToOutProj && popStatus_stateTrig);
  assign t_when_14 = (popStatus_reuseToUp && popStatus_stateTrig);
  assign t_when_12 = (popStatus_prefillIn_fifo_io_pop_payload && popStatus_lastLayer);
  assign t_ram_mem_0_port = ram_pushPtr_0;
  assign t_ram_mem_1_port = ram_pushPtr_1;
  assign t_ram_mem_2_port = ram_pushPtr_2;
  assign t_ram_mem_3_port = ram_pushPtr_3;
  assign t_ram_mem_4_port = ram_pushPtr_4;
  assign t_ram_mem_5_port = ram_pushPtr_5;
  assign t_ram_mem_6_port = ram_pushPtr_6;
  assign t_ram_mem_7_port = ram_pushPtr_7;
  assign t_ram_mem_8_port = ram_pushPtr_8;
  assign t_ram_mem_9_port = ram_pushPtr_9;
  assign t_ram_mem_10_port = ram_pushPtr_10;
  assign t_ram_mem_11_port = ram_pushPtr_11;
  assign t_ram_mem_12_port = ram_pushPtr_12;
  assign t_ram_mem_13_port = ram_pushPtr_13;
  assign t_ram_mem_14_port = ram_pushPtr_14;
  assign t_ram_mem_15_port = ram_pushPtr_15;
  always @(posedge clk_1_clk) begin
    if(ram_pushEn_0) begin
      ram_mem_0[t_ram_mem_0_port] <= ram_ramIn_0;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_0) begin
      ram_mem_0_spinal_port1 <= ram_mem_0[t_ram_ramOut_0];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_1) begin
      ram_mem_1[t_ram_mem_1_port] <= ram_ramIn_1;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_1) begin
      ram_mem_1_spinal_port1 <= ram_mem_1[t_ram_ramOut_1];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_2) begin
      ram_mem_2[t_ram_mem_2_port] <= ram_ramIn_2;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_2) begin
      ram_mem_2_spinal_port1 <= ram_mem_2[t_ram_ramOut_2];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_3) begin
      ram_mem_3[t_ram_mem_3_port] <= ram_ramIn_3;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_3) begin
      ram_mem_3_spinal_port1 <= ram_mem_3[t_ram_ramOut_3];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_4) begin
      ram_mem_4[t_ram_mem_4_port] <= ram_ramIn_4;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_4) begin
      ram_mem_4_spinal_port1 <= ram_mem_4[t_ram_ramOut_4];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_5) begin
      ram_mem_5[t_ram_mem_5_port] <= ram_ramIn_5;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_5) begin
      ram_mem_5_spinal_port1 <= ram_mem_5[t_ram_ramOut_5];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_6) begin
      ram_mem_6[t_ram_mem_6_port] <= ram_ramIn_6;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_6) begin
      ram_mem_6_spinal_port1 <= ram_mem_6[t_ram_ramOut_6];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_7) begin
      ram_mem_7[t_ram_mem_7_port] <= ram_ramIn_7;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_7) begin
      ram_mem_7_spinal_port1 <= ram_mem_7[t_ram_ramOut_7];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_8) begin
      ram_mem_8[t_ram_mem_8_port] <= ram_ramIn_8;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_8) begin
      ram_mem_8_spinal_port1 <= ram_mem_8[t_ram_ramOut_8];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_9) begin
      ram_mem_9[t_ram_mem_9_port] <= ram_ramIn_9;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_9) begin
      ram_mem_9_spinal_port1 <= ram_mem_9[t_ram_ramOut_9];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_10) begin
      ram_mem_10[t_ram_mem_10_port] <= ram_ramIn_10;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_10) begin
      ram_mem_10_spinal_port1 <= ram_mem_10[t_ram_ramOut_10];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_11) begin
      ram_mem_11[t_ram_mem_11_port] <= ram_ramIn_11;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_11) begin
      ram_mem_11_spinal_port1 <= ram_mem_11[t_ram_ramOut_11];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_12) begin
      ram_mem_12[t_ram_mem_12_port] <= ram_ramIn_12;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_12) begin
      ram_mem_12_spinal_port1 <= ram_mem_12[t_ram_ramOut_12];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_13) begin
      ram_mem_13[t_ram_mem_13_port] <= ram_ramIn_13;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_13) begin
      ram_mem_13_spinal_port1 <= ram_mem_13[t_ram_ramOut_13];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_14) begin
      ram_mem_14[t_ram_mem_14_port] <= ram_ramIn_14;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_14) begin
      ram_mem_14_spinal_port1 <= ram_mem_14[t_ram_ramOut_14];
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_pushEn_15) begin
      ram_mem_15[t_ram_mem_15_port] <= ram_ramIn_15;
    end
  end

  always @(posedge clk_1_clk) begin
    if(ram_popEn_15) begin
      ram_mem_15_spinal_port1 <= ram_mem_15[t_ram_ramOut_15];
    end
  end

  StreamFifo_69 pushStatus_prefillIn_fifo (
    .io_push_valid   (pushStatus_prefillIn_valid                    ), //i
    .io_push_ready   (pushStatus_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (pushStatus_prefillIn_payload                  ), //i
    .io_pop_valid    (pushStatus_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (pushStatus_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (pushStatus_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                          ), //i
    .io_occupancy    (pushStatus_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (pushStatus_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                                     ), //i
    .clk_1_resetn    (clk_1_resetn                                  )  //i
  );
  StreamFifo_69 popStatus_prefillIn_fifo (
    .io_push_valid   (popStatus_prefillIn_valid                    ), //i
    .io_push_ready   (popStatus_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (popStatus_prefillIn_payload                  ), //i
    .io_pop_valid    (popStatus_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (popStatus_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (popStatus_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                         ), //i
    .io_occupancy    (popStatus_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (popStatus_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                                    ), //i
    .clk_1_resetn    (clk_1_resetn                                 )  //i
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_0 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_0_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_1 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_1_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_2 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_2_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_3 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_3_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_4 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_4_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_5 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_5_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_6 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_6_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_7 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_7_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_8 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_8_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_9 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_9_O          )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_10 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_10_O         )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_11 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_11_O         )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_12 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_12_O         )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_13 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_13_O         )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_14 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_14_O         )  //o
  );
  (* keep_hierarchy = "yes" *) LUT3 #(
    .INIT (8'hfb)
  ) lutInst_15 (
    .I0 (popPrePipe_ready     ), //i
    .I1 (popPrePipe_valid     ), //i
    .I2 (popStatus_throughToLn), //i
    .O  (lutInst_15_O         )  //o
  );
  assign ptrPush_pushPtrOvf = (ptrPush_pushPtr == ptrPush_pushPackLen);
  always @(*) begin
    ptrPush_pushNext = ptrPush_pushPtr;
    if(ptrPush_enPushCnt) begin
      ptrPush_pushNext = (ptrPush_pushPtr + 5'h01);
      if(ptrPush_pushPtrOvf) begin
        ptrPush_pushNext = ptrPush_pushStartAtNext;
      end
    end
  end

  always @(*) begin
    ptrPush_pushReuseNext = ptrPush_pushReuse;
    if(t_when) begin
      ptrPush_pushReuseNext = (pushStatus_logitsGen ? 1'b0 : 1'b1);
    end
    if(t_when_1) begin
      if(t_when_2) begin
        ptrPush_pushReuseNext = 1'b0;
      end else begin
        if(pushStatus_prefillFirstToken) begin
          ptrPush_pushReuseNext = 1'b0;
        end else begin
          if(pushStatus_logitsGen) begin
            ptrPush_pushReuseNext = 1'b0;
          end else begin
            ptrPush_pushReuseNext = 1'b0;
          end
        end
      end
    end
    if(t_when_4) begin
      if(pushStatus_headCntOvf) begin
        ptrPush_pushReuseNext = 1'b1;
      end
    end
    if(t_when_5) begin
      ptrPush_pushReuseNext = 1'b0;
    end
  end

  always @(*) begin
    ptrPush_pushStartAtNext = ptrPush_pushStartAt;
    if(t_when) begin
      ptrPush_pushStartAtNext = 5'h0;
    end
    if(t_when_1) begin
      if(!t_when_2) begin
        if(pushStatus_prefillFirstToken) begin
          ptrPush_pushStartAtNext = pushStatus_headCntNextInc;
        end else begin
          if(!pushStatus_logitsGen) begin
            ptrPush_pushStartAtNext = 5'h0;
          end
        end
      end
    end
    if(t_when_3) begin
      ptrPush_pushStartAtNext = pushStatus_headCntNextInc;
    end
    if(t_when_4) begin
      if(pushStatus_prefillFirstToken) begin
        ptrPush_pushStartAtNext = pushStatus_headCntNextInc;
      end else begin
        ptrPush_pushStartAtNext = 5'h0;
      end
      if(pushStatus_headCntOvf) begin
        ptrPush_pushStartAtNext = 5'h0;
      end
    end
  end

  assign pushStatus_layerCntAbout2Ovf = (pushStatus_layerCnt == 5'h1a);
  assign pushStatus_prefillIn_valid = status_tokenIndexFlow_valid;
  assign pushStatus_prefillIn_payload = (status_tokenIndexFlow_payload == 6'h0);
  assign pushStatus_prefillIn_ready = pushStatus_prefillIn_fifo_io_push_ready;
  assign pushStatus_prefillIn_fifo_io_pop_ready = (pushStatus_enLayerCntInc && pushStatus_lastLayer);
  assign vecBuf_pushStatus_prefillIn_fifo_io_pop_fire = (pushStatus_prefillIn_fifo_io_pop_valid && pushStatus_prefillIn_fifo_io_pop_ready);
  assign pushStatus_stateTrig = (ptrPush_enPushCnt && ptrPush_pushPtrOvf);
  assign pushStatus_headCntOvf = (pushStatus_headCnt == 5'h0b);
  assign pushStatus_headCntNextInc = (pushStatus_headCntNext + 5'h01);
  always @(*) begin
    pushStatus_headCntNext = pushStatus_headCnt;
    if(t_when_4) begin
      pushStatus_headCntNext = (pushStatus_headCnt + 5'h01);
      if(pushStatus_headCntOvf) begin
        pushStatus_headCntNext = 5'h0;
      end
    end
  end

  always @(*) begin
    pushStatus_enLayerCntInc = (pushStatus_mlpLnOut && pushStatus_stateTrig);
    if((pushStatus_prefillIn_fifo_io_pop_payload && pushStatus_lastLayer)) begin
      pushStatus_enLayerCntInc = (pushStatus_lnOut && pushStatus_stateTrig);
    end
  end

  assign ptrPop_popPtrOvf = (ptrPop_popPtr == ptrPop_popPackLen);
  always @(*) begin
    ptrPop_popNext = ptrPop_popPtr;
    if(ptrPop_enPopCnt) begin
      ptrPop_popNext = (ptrPop_popPtr + 5'h01);
      if(ptrPop_popPtrOvf) begin
        ptrPop_popNext = ptrPop_popStartAtNext;
      end
    end
  end

  always @(*) begin
    ptrPop_popReuseNext = ptrPop_popReuse;
    if(t_when_6) begin
      if(popStatus_logitsGen) begin
        ptrPop_popReuseNext = 1'b0;
      end else begin
        if(popStatus_prefillCond) begin
          ptrPop_popReuseNext = 1'b1;
        end else begin
          ptrPop_popReuseNext = 1'b1;
        end
      end
    end
    if(t_when_7) begin
      ptrPop_popReuseNext = 1'b0;
    end
    if(t_when_8) begin
      ptrPop_popReuseNext = 1'b1;
    end
    if(t_when_9) begin
      if(popStatus_prefillCond) begin
        ptrPop_popReuseNext = 1'b1;
      end else begin
        ptrPop_popReuseNext = 1'b0;
      end
    end
    if(t_when_10) begin
      ptrPop_popReuseNext = 1'b1;
    end
    if(t_when_11) begin
      if(popStatus_prefillCond) begin
        ptrPop_popReuseNext = 1'b1;
      end else begin
        ptrPop_popReuseNext = 1'b1;
      end
      if(popStatus_headCntOvf) begin
        ptrPop_popReuseNext = 1'b0;
      end
    end
    if(t_when_13) begin
      ptrPop_popReuseNext = 1'b1;
    end
    if(t_when_14) begin
      ptrPop_popReuseNext = 1'b0;
    end
  end

  always @(*) begin
    ptrPop_popStartAtNext = ptrPop_popStartAt;
    if(t_when_11) begin
      if(popStatus_headCntOvf) begin
        if(!t_when_12) begin
          ptrPop_popStartAtNext = 5'h01;
        end
      end
    end
    if(t_when_13) begin
      ptrPop_popStartAtNext = 5'h0;
    end
  end

  assign popStatus_layerCntAbout2Ovf = (popStatus_layerCnt == 5'h1a);
  assign popStatus_prefillIn_valid = status_tokenIndexFlow_valid;
  assign popStatus_prefillIn_payload = (status_tokenIndexFlow_payload == 6'h0);
  assign popStatus_prefillIn_ready = popStatus_prefillIn_fifo_io_push_ready;
  assign popStatus_prefillIn_fifo_io_pop_ready = (popStatus_enLayerCntInc && popStatus_lastLayer);
  assign vecBuf_popStatus_prefillIn_fifo_io_pop_fire = (popStatus_prefillIn_fifo_io_pop_valid && popStatus_prefillIn_fifo_io_pop_ready);
  assign popStatus_stateTrig = (ptrPop_enPopCnt && ptrPop_popPtrOvf);
  assign popStatus_prefillCond = (popStatus_prefillFirstToken || (popStatus_prefillIn_fifo_io_pop_payload && popStatus_lastLayer));
  assign popStatus_headCntOvf = (popStatus_headCnt == 5'h0b);
  assign popStatus_headCntNext = (popStatus_headCnt + 5'h01);
  always @(*) begin
    popStatus_enLayerCntInc = (popStatus_reuseToUp && popStatus_stateTrig);
    if((popStatus_prefillIn_fifo_io_pop_payload && popStatus_lastLayer)) begin
      popStatus_enLayerCntInc = ((popStatus_reuseToV && popStatus_stateTrig) && popStatus_headCntOvf);
    end
  end

  assign ram_pushPtr_0 = {ram_pushPtrMsb_0,ram_pushPtrLow_0};
  assign ram_pushPtr_1 = {ram_pushPtrMsb_1,ram_pushPtrLow_1};
  assign ram_pushPtr_2 = {ram_pushPtrMsb_2,ram_pushPtrLow_2};
  assign ram_pushPtr_3 = {ram_pushPtrMsb_3,ram_pushPtrLow_3};
  assign ram_pushPtr_4 = {ram_pushPtrMsb_4,ram_pushPtrLow_4};
  assign ram_pushPtr_5 = {ram_pushPtrMsb_5,ram_pushPtrLow_5};
  assign ram_pushPtr_6 = {ram_pushPtrMsb_6,ram_pushPtrLow_6};
  assign ram_pushPtr_7 = {ram_pushPtrMsb_7,ram_pushPtrLow_7};
  assign ram_pushPtr_8 = {ram_pushPtrMsb_8,ram_pushPtrLow_8};
  assign ram_pushPtr_9 = {ram_pushPtrMsb_9,ram_pushPtrLow_9};
  assign ram_pushPtr_10 = {ram_pushPtrMsb_10,ram_pushPtrLow_10};
  assign ram_pushPtr_11 = {ram_pushPtrMsb_11,ram_pushPtrLow_11};
  assign ram_pushPtr_12 = {ram_pushPtrMsb_12,ram_pushPtrLow_12};
  assign ram_pushPtr_13 = {ram_pushPtrMsb_13,ram_pushPtrLow_13};
  assign ram_pushPtr_14 = {ram_pushPtrMsb_14,ram_pushPtrLow_14};
  assign ram_pushPtr_15 = {ram_pushPtrMsb_15,ram_pushPtrLow_15};
  assign ram_popPtr_0 = {ram_popPtrMsb_0,ram_popPtrLow_0};
  assign ram_popPtr_1 = {ram_popPtrMsb_1,ram_popPtrLow_1};
  assign ram_popPtr_2 = {ram_popPtrMsb_2,ram_popPtrLow_2};
  assign ram_popPtr_3 = {ram_popPtrMsb_3,ram_popPtrLow_3};
  assign ram_popPtr_4 = {ram_popPtrMsb_4,ram_popPtrLow_4};
  assign ram_popPtr_5 = {ram_popPtrMsb_5,ram_popPtrLow_5};
  assign ram_popPtr_6 = {ram_popPtrMsb_6,ram_popPtrLow_6};
  assign ram_popPtr_7 = {ram_popPtrMsb_7,ram_popPtrLow_7};
  assign ram_popPtr_8 = {ram_popPtrMsb_8,ram_popPtrLow_8};
  assign ram_popPtr_9 = {ram_popPtrMsb_9,ram_popPtrLow_9};
  assign ram_popPtr_10 = {ram_popPtrMsb_10,ram_popPtrLow_10};
  assign ram_popPtr_11 = {ram_popPtrMsb_11,ram_popPtrLow_11};
  assign ram_popPtr_12 = {ram_popPtrMsb_12,ram_popPtrLow_12};
  assign ram_popPtr_13 = {ram_popPtrMsb_13,ram_popPtrLow_13};
  assign ram_popPtr_14 = {ram_popPtrMsb_14,ram_popPtrLow_14};
  assign ram_popPtr_15 = {ram_popPtrMsb_15,ram_popPtrLow_15};
  assign ram_ramIn_0 = dataDly[127 : 0];
  assign ram_ramIn_1 = dataDly[255 : 128];
  assign ram_ramIn_2 = dataDly[383 : 256];
  assign ram_ramIn_3 = dataDly[511 : 384];
  assign ram_ramIn_4 = dataDly[639 : 512];
  assign ram_ramIn_5 = dataDly[767 : 640];
  assign ram_ramIn_6 = dataDly[895 : 768];
  assign ram_ramIn_7 = dataDly[1023 : 896];
  assign ram_ramIn_8 = dataDly[1151 : 1024];
  assign ram_ramIn_9 = dataDly[1279 : 1152];
  assign ram_ramIn_10 = dataDly[1407 : 1280];
  assign ram_ramIn_11 = dataDly[1535 : 1408];
  assign ram_ramIn_12 = dataDly[1663 : 1536];
  assign ram_ramIn_13 = dataDly[1791 : 1664];
  assign ram_ramIn_14 = dataDly[1919 : 1792];
  assign ram_ramIn_15 = dataDly[2047 : 1920];
  assign t_ram_ramOut_0 = ram_popPtr_0;
  assign ram_ramOut_0 = ram_mem_0_spinal_port1;
  assign t_ram_ramOut_1 = ram_popPtr_1;
  assign ram_ramOut_1 = ram_mem_1_spinal_port1;
  assign t_ram_ramOut_2 = ram_popPtr_2;
  assign ram_ramOut_2 = ram_mem_2_spinal_port1;
  assign t_ram_ramOut_3 = ram_popPtr_3;
  assign ram_ramOut_3 = ram_mem_3_spinal_port1;
  assign t_ram_ramOut_4 = ram_popPtr_4;
  assign ram_ramOut_4 = ram_mem_4_spinal_port1;
  assign t_ram_ramOut_5 = ram_popPtr_5;
  assign ram_ramOut_5 = ram_mem_5_spinal_port1;
  assign t_ram_ramOut_6 = ram_popPtr_6;
  assign ram_ramOut_6 = ram_mem_6_spinal_port1;
  assign t_ram_ramOut_7 = ram_popPtr_7;
  assign ram_ramOut_7 = ram_mem_7_spinal_port1;
  assign t_ram_ramOut_8 = ram_popPtr_8;
  assign ram_ramOut_8 = ram_mem_8_spinal_port1;
  assign t_ram_ramOut_9 = ram_popPtr_9;
  assign ram_ramOut_9 = ram_mem_9_spinal_port1;
  assign t_ram_ramOut_10 = ram_popPtr_10;
  assign ram_ramOut_10 = ram_mem_10_spinal_port1;
  assign t_ram_ramOut_11 = ram_popPtr_11;
  assign ram_ramOut_11 = ram_mem_11_spinal_port1;
  assign t_ram_ramOut_12 = ram_popPtr_12;
  assign ram_ramOut_12 = ram_mem_12_spinal_port1;
  assign t_ram_ramOut_13 = ram_popPtr_13;
  assign ram_ramOut_13 = ram_mem_13_spinal_port1;
  assign t_ram_ramOut_14 = ram_popPtr_14;
  assign ram_ramOut_14 = ram_mem_14_spinal_port1;
  assign t_ram_ramOut_15 = ram_popPtr_15;
  assign ram_ramOut_15 = ram_mem_15_spinal_port1;
  assign popLtPush = (ptrPop_popPtr < ptrPush_pushPtr);
  always @(*) begin
    popPre_thrown_valid = popPre_valid;
    if(popStatus_throughToLn) begin
      popPre_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    popPre_ready = popPre_thrown_ready;
    if(popStatus_throughToLn) begin
      popPre_ready = 1'b1;
    end
  end

  always @(*) begin
    popPre_thrown_ready = popPrePipe_ready;
    if((! popPrePipe_valid)) begin
      popPre_thrown_ready = 1'b1;
    end
  end

  assign popPrePipe_valid = popPre_thrown_rValid;
  assign io_output_valid = popPrePipe_valid;
  assign popPrePipe_ready = io_output_ready;
  assign io_output_payload = {ram_ramOut_15,{ram_ramOut_14,{ram_ramOut_13,{ram_ramOut_12,{ram_ramOut_11,{ram_ramOut_10,{ram_ramOut_9,{ram_ramOut_8,{ram_ramOut_7,{ram_ramOut_6,{ram_ramOut_5,{ram_ramOut_4,{ram_ramOut_3,{ram_ramOut_2,{ram_ramOut_1,ram_ramOut_0}}}}}}}}}}}}}}};
  assign ptrPush_enPushCnt = validDly;
  assign popPre_fire = (popPre_valid && popPre_ready);
  assign ptrPop_enPopCnt = popPre_fire;
  always @(*) begin
    popPre_valid = 1'b0;
    if(ptrPop_popReuse) begin
      if(reusePushFinish) begin
        popPre_valid = 1'b1;
      end else begin
        popPre_valid = popLtPush;
      end
    end else begin
      if(popStatus_throughToLn) begin
        if(pushStatus_lnOut) begin
          popPre_valid = 1'b1;
        end else begin
          popPre_valid = popLtPush;
        end
      end
      if(popStatus_lnToLogits) begin
        if(pushStatus_tokenIn) begin
          popPre_valid = 1'b1;
        end else begin
          popPre_valid = popLtPush;
        end
      end
      if(popStatus_qToQK) begin
        popPre_valid = pushStatus_qkvOut;
      end
      if(popStatus_qkvToOutProj) begin
        popPre_valid = pushStatus_mlpLnOut;
      end
    end
  end

  assign ram_popEn_0 = lutInst_0_O;
  assign ram_popEn_1 = lutInst_1_O;
  assign ram_popEn_2 = lutInst_2_O;
  assign ram_popEn_3 = lutInst_3_O;
  assign ram_popEn_4 = lutInst_4_O;
  assign ram_popEn_5 = lutInst_5_O;
  assign ram_popEn_6 = lutInst_6_O;
  assign ram_popEn_7 = lutInst_7_O;
  assign ram_popEn_8 = lutInst_8_O;
  assign ram_popEn_9 = lutInst_9_O;
  assign ram_popEn_10 = lutInst_10_O;
  assign ram_popEn_11 = lutInst_11_O;
  assign ram_popEn_12 = lutInst_12_O;
  assign ram_popEn_13 = lutInst_13_O;
  assign ram_popEn_14 = lutInst_14_O;
  assign ram_popEn_15 = lutInst_15_O;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      validDly <= 1'b0;
      ptrPush_pushPackLen <= 5'h0;
      ptrPush_pushStartAt <= 5'h0;
      ptrPush_pushReuse <= 1'b0;
      ptrPush_pushPtr <= 5'h0;
      pushStatus_layerCnt <= 5'h0;
      pushStatus_lastLayer <= 1'b0;
      pushStatus_prefillFirstToken <= 1'b1;
      pushStatus_logitsGen <= 1'b0;
      pushStatus_tokenIn <= 1'b1;
      pushStatus_lnOut <= 1'b0;
      pushStatus_qRotateOut <= 1'b0;
      pushStatus_qkvOut <= 1'b0;
      pushStatus_mlpLnOut <= 1'b0;
      pushStatus_headCnt <= 5'h0;
      ptrPop_popPackLen <= 5'h0;
      ptrPop_popStartAt <= 5'h0;
      ptrPop_popPtr <= 5'h0;
      ptrPop_popReuse <= 1'b0;
      popStatus_layerCnt <= 5'h0;
      popStatus_lastLayer <= 1'b0;
      popStatus_prefillFirstToken <= 1'b1;
      popStatus_logitsGen <= 1'b0;
      popStatus_throughToLn <= 1'b1;
      popStatus_lnToLogits <= 1'b0;
      popStatus_reuseToQ <= 1'b0;
      popStatus_qToQK <= 1'b0;
      popStatus_reuseToK <= 1'b0;
      popStatus_reuseToV <= 1'b0;
      popStatus_qkvToOutProj <= 1'b0;
      popStatus_reuseToPredU <= 1'b0;
      popStatus_reuseToGate <= 1'b0;
      popStatus_reuseToUp <= 1'b0;
      popStatus_headCnt <= 5'h0;
      ram_pushEn_0 <= 1'b0;
      ram_pushEn_1 <= 1'b0;
      ram_pushEn_2 <= 1'b0;
      ram_pushEn_3 <= 1'b0;
      ram_pushEn_4 <= 1'b0;
      ram_pushEn_5 <= 1'b0;
      ram_pushEn_6 <= 1'b0;
      ram_pushEn_7 <= 1'b0;
      ram_pushEn_8 <= 1'b0;
      ram_pushEn_9 <= 1'b0;
      ram_pushEn_10 <= 1'b0;
      ram_pushEn_11 <= 1'b0;
      ram_pushEn_12 <= 1'b0;
      ram_pushEn_13 <= 1'b0;
      ram_pushEn_14 <= 1'b0;
      ram_pushEn_15 <= 1'b0;
      ram_pushPtrLow_0 <= 5'h0;
      ram_pushPtrLow_1 <= 5'h0;
      ram_pushPtrLow_2 <= 5'h0;
      ram_pushPtrLow_3 <= 5'h0;
      ram_pushPtrLow_4 <= 5'h0;
      ram_pushPtrLow_5 <= 5'h0;
      ram_pushPtrLow_6 <= 5'h0;
      ram_pushPtrLow_7 <= 5'h0;
      ram_pushPtrLow_8 <= 5'h0;
      ram_pushPtrLow_9 <= 5'h0;
      ram_pushPtrLow_10 <= 5'h0;
      ram_pushPtrLow_11 <= 5'h0;
      ram_pushPtrLow_12 <= 5'h0;
      ram_pushPtrLow_13 <= 5'h0;
      ram_pushPtrLow_14 <= 5'h0;
      ram_pushPtrLow_15 <= 5'h0;
      ram_pushPtrMsb_0 <= 1'b0;
      ram_pushPtrMsb_1 <= 1'b0;
      ram_pushPtrMsb_2 <= 1'b0;
      ram_pushPtrMsb_3 <= 1'b0;
      ram_pushPtrMsb_4 <= 1'b0;
      ram_pushPtrMsb_5 <= 1'b0;
      ram_pushPtrMsb_6 <= 1'b0;
      ram_pushPtrMsb_7 <= 1'b0;
      ram_pushPtrMsb_8 <= 1'b0;
      ram_pushPtrMsb_9 <= 1'b0;
      ram_pushPtrMsb_10 <= 1'b0;
      ram_pushPtrMsb_11 <= 1'b0;
      ram_pushPtrMsb_12 <= 1'b0;
      ram_pushPtrMsb_13 <= 1'b0;
      ram_pushPtrMsb_14 <= 1'b0;
      ram_pushPtrMsb_15 <= 1'b0;
      ram_popPtrLow_0 <= 5'h0;
      ram_popPtrLow_1 <= 5'h0;
      ram_popPtrLow_2 <= 5'h0;
      ram_popPtrLow_3 <= 5'h0;
      ram_popPtrLow_4 <= 5'h0;
      ram_popPtrLow_5 <= 5'h0;
      ram_popPtrLow_6 <= 5'h0;
      ram_popPtrLow_7 <= 5'h0;
      ram_popPtrLow_8 <= 5'h0;
      ram_popPtrLow_9 <= 5'h0;
      ram_popPtrLow_10 <= 5'h0;
      ram_popPtrLow_11 <= 5'h0;
      ram_popPtrLow_12 <= 5'h0;
      ram_popPtrLow_13 <= 5'h0;
      ram_popPtrLow_14 <= 5'h0;
      ram_popPtrLow_15 <= 5'h0;
      ram_popPtrMsb_0 <= 1'b0;
      ram_popPtrMsb_1 <= 1'b0;
      ram_popPtrMsb_2 <= 1'b0;
      ram_popPtrMsb_3 <= 1'b0;
      ram_popPtrMsb_4 <= 1'b0;
      ram_popPtrMsb_5 <= 1'b0;
      ram_popPtrMsb_6 <= 1'b0;
      ram_popPtrMsb_7 <= 1'b0;
      ram_popPtrMsb_8 <= 1'b0;
      ram_popPtrMsb_9 <= 1'b0;
      ram_popPtrMsb_10 <= 1'b0;
      ram_popPtrMsb_11 <= 1'b0;
      ram_popPtrMsb_12 <= 1'b0;
      ram_popPtrMsb_13 <= 1'b0;
      ram_popPtrMsb_14 <= 1'b0;
      ram_popPtrMsb_15 <= 1'b0;
      reusePushFinish <= 1'b0;
      popPre_thrown_rValid <= 1'b0;
    end else begin
      validDly <= io_input_valid;
      ptrPush_pushPtr <= ptrPush_pushNext;
      ptrPush_pushReuse <= ptrPush_pushReuseNext;
      ptrPush_pushStartAt <= ptrPush_pushStartAtNext;
      if(pushStatus_enLayerCntInc) begin
        pushStatus_layerCnt <= (pushStatus_layerCnt + 5'h01);
        if(pushStatus_layerCntAbout2Ovf) begin
          pushStatus_lastLayer <= 1'b1;
        end
        if(pushStatus_lastLayer) begin
          pushStatus_layerCnt <= 5'h0;
          pushStatus_lastLayer <= 1'b0;
        end
      end
      if(vecBuf_pushStatus_prefillIn_fifo_io_pop_fire) begin
        pushStatus_prefillFirstToken <= 1'b0;
      end
      if((vecBuf_pushStatus_prefillIn_fifo_io_pop_fire && (! pushStatus_prefillIn_fifo_io_pop_payload))) begin
        pushStatus_logitsGen <= 1'b1;
      end
      pushStatus_headCnt <= pushStatus_headCntNext;
      if(t_when) begin
        pushStatus_tokenIn <= 1'b0;
        pushStatus_lnOut <= 1'b1;
        ptrPush_pushPackLen <= (pushStatus_logitsGen ? 5'h0b : 5'h17);
      end
      if(t_when_1) begin
        pushStatus_lnOut <= 1'b0;
        if(t_when_2) begin
          pushStatus_tokenIn <= 1'b1;
          ptrPush_pushPackLen <= 5'h0;
        end else begin
          if(pushStatus_prefillFirstToken) begin
            pushStatus_qkvOut <= 1'b1;
            ptrPush_pushPackLen <= pushStatus_headCntNextInc;
          end else begin
            if(pushStatus_logitsGen) begin
              pushStatus_tokenIn <= 1'b1;
              ptrPush_pushPackLen <= 5'h0;
            end else begin
              pushStatus_qRotateOut <= 1'b1;
              ptrPush_pushPackLen <= 5'h0;
            end
          end
        end
      end
      if(t_when_3) begin
        pushStatus_qRotateOut <= 1'b0;
        pushStatus_qkvOut <= 1'b1;
        ptrPush_pushPackLen <= pushStatus_headCntNextInc;
      end
      if(t_when_4) begin
        if(pushStatus_prefillFirstToken) begin
          ptrPush_pushPackLen <= pushStatus_headCntNextInc;
        end else begin
          pushStatus_qkvOut <= 1'b0;
          pushStatus_qRotateOut <= 1'b1;
          ptrPush_pushPackLen <= 5'h0;
        end
        if(pushStatus_headCntOvf) begin
          pushStatus_qkvOut <= 1'b0;
          pushStatus_qRotateOut <= 1'b0;
          pushStatus_mlpLnOut <= 1'b1;
          ptrPush_pushPackLen <= 5'h0b;
        end
      end
      if(t_when_5) begin
        pushStatus_mlpLnOut <= 1'b0;
        pushStatus_tokenIn <= 1'b1;
        ptrPush_pushPackLen <= 5'h0;
      end
      if((pushStatus_lnOut && pushStatus_stateTrig)) begin
        pushStatus_logitsGen <= 1'b0;
      end
      ptrPop_popPtr <= ptrPop_popNext;
      ptrPop_popReuse <= ptrPop_popReuseNext;
      ptrPop_popStartAt <= ptrPop_popStartAtNext;
      if(popStatus_enLayerCntInc) begin
        popStatus_layerCnt <= (popStatus_layerCnt + 5'h01);
        if(popStatus_layerCntAbout2Ovf) begin
          popStatus_lastLayer <= 1'b1;
        end
        if(popStatus_lastLayer) begin
          popStatus_layerCnt <= 5'h0;
          popStatus_lastLayer <= 1'b0;
        end
      end
      if(vecBuf_popStatus_prefillIn_fifo_io_pop_fire) begin
        popStatus_prefillFirstToken <= 1'b0;
      end
      if((vecBuf_popStatus_prefillIn_fifo_io_pop_fire && (! popStatus_prefillIn_fifo_io_pop_payload))) begin
        popStatus_logitsGen <= 1'b1;
      end
      if(t_when_6) begin
        popStatus_throughToLn <= 1'b0;
        if(popStatus_logitsGen) begin
          popStatus_lnToLogits <= 1'b1;
          ptrPop_popPackLen <= 5'h0b;
        end else begin
          if(popStatus_prefillCond) begin
            popStatus_reuseToK <= 1'b1;
            ptrPop_popPackLen <= 5'h17;
          end else begin
            popStatus_reuseToQ <= 1'b1;
            ptrPop_popPackLen <= 5'h17;
          end
        end
      end
      if(t_when_7) begin
        popStatus_lnToLogits <= 1'b0;
        popStatus_throughToLn <= 1'b1;
        ptrPop_popPackLen <= 5'h0;
      end
      if(t_when_8) begin
        popStatus_reuseToQ <= 1'b0;
        popStatus_reuseToK <= 1'b1;
        ptrPop_popPackLen <= 5'h17;
      end
      if(t_when_9) begin
        popStatus_reuseToK <= 1'b0;
        if(popStatus_prefillCond) begin
          popStatus_reuseToV <= 1'b1;
          ptrPop_popPackLen <= 5'h17;
        end else begin
          popStatus_qToQK <= 1'b1;
          ptrPop_popPackLen <= 5'h0;
        end
      end
      if(t_when_10) begin
        popStatus_qToQK <= 1'b0;
        popStatus_reuseToV <= 1'b1;
        ptrPop_popPackLen <= 5'h17;
      end
      if(t_when_11) begin
        popStatus_reuseToV <= 1'b0;
        popStatus_headCnt <= popStatus_headCntNext;
        if(popStatus_prefillCond) begin
          popStatus_reuseToK <= 1'b1;
          ptrPop_popPackLen <= 5'h17;
        end else begin
          popStatus_reuseToQ <= 1'b1;
          ptrPop_popPackLen <= 5'h17;
        end
        if(popStatus_headCntOvf) begin
          popStatus_headCnt <= 5'h0;
          popStatus_reuseToQ <= 1'b0;
          popStatus_reuseToK <= 1'b0;
          if(t_when_12) begin
            popStatus_throughToLn <= 1'b1;
            ptrPop_popPackLen <= 5'h0;
          end else begin
            popStatus_qkvToOutProj <= 1'b1;
            ptrPop_popPackLen <= 5'h0c;
          end
        end
      end
      if(t_when_13) begin
        popStatus_qkvToOutProj <= 1'b0;
        if(status_enPredictor) begin
          popStatus_reuseToPredU <= 1'b1;
        end else begin
          popStatus_reuseToGate <= 1'b1;
        end
        ptrPop_popPackLen <= 5'h0b;
      end
      if((popStatus_reuseToPredU && popStatus_stateTrig)) begin
        popStatus_reuseToPredU <= 1'b0;
        popStatus_reuseToGate <= 1'b1;
      end
      if((popStatus_reuseToGate && popStatus_stateTrig)) begin
        popStatus_reuseToGate <= 1'b0;
        popStatus_reuseToUp <= 1'b1;
      end
      if(t_when_14) begin
        popStatus_reuseToUp <= 1'b0;
        popStatus_throughToLn <= 1'b1;
        ptrPop_popPackLen <= 5'h0;
      end
      if((popStatus_lnToLogits && popStatus_stateTrig)) begin
        popStatus_logitsGen <= 1'b0;
      end
      if((pushStatus_stateTrig && ((pushStatus_lnOut && (! pushStatus_logitsGen)) || pushStatus_mlpLnOut))) begin
        reusePushFinish <= 1'b1;
      end
      if((popStatus_stateTrig && ((popStatus_reuseToV && popStatus_headCntOvf) || popStatus_reuseToUp))) begin
        reusePushFinish <= 1'b0;
      end
      if(popPre_thrown_ready) begin
        popPre_thrown_rValid <= popPre_thrown_valid;
      end
      ram_pushEn_0 <= io_input_valid;
      ram_pushEn_1 <= io_input_valid;
      ram_pushEn_2 <= io_input_valid;
      ram_pushEn_3 <= io_input_valid;
      ram_pushEn_4 <= io_input_valid;
      ram_pushEn_5 <= io_input_valid;
      ram_pushEn_6 <= io_input_valid;
      ram_pushEn_7 <= io_input_valid;
      ram_pushEn_8 <= io_input_valid;
      ram_pushEn_9 <= io_input_valid;
      ram_pushEn_10 <= io_input_valid;
      ram_pushEn_11 <= io_input_valid;
      ram_pushEn_12 <= io_input_valid;
      ram_pushEn_13 <= io_input_valid;
      ram_pushEn_14 <= io_input_valid;
      ram_pushEn_15 <= io_input_valid;
      ram_pushPtrLow_0 <= ptrPush_pushNext;
      ram_pushPtrLow_1 <= ptrPush_pushNext;
      ram_pushPtrLow_2 <= ptrPush_pushNext;
      ram_pushPtrLow_3 <= ptrPush_pushNext;
      ram_pushPtrLow_4 <= ptrPush_pushNext;
      ram_pushPtrLow_5 <= ptrPush_pushNext;
      ram_pushPtrLow_6 <= ptrPush_pushNext;
      ram_pushPtrLow_7 <= ptrPush_pushNext;
      ram_pushPtrLow_8 <= ptrPush_pushNext;
      ram_pushPtrLow_9 <= ptrPush_pushNext;
      ram_pushPtrLow_10 <= ptrPush_pushNext;
      ram_pushPtrLow_11 <= ptrPush_pushNext;
      ram_pushPtrLow_12 <= ptrPush_pushNext;
      ram_pushPtrLow_13 <= ptrPush_pushNext;
      ram_pushPtrLow_14 <= ptrPush_pushNext;
      ram_pushPtrLow_15 <= ptrPush_pushNext;
      ram_pushPtrMsb_0 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_1 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_2 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_3 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_4 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_5 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_6 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_7 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_8 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_9 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_10 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_11 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_12 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_13 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_14 <= ptrPush_pushReuseNext;
      ram_pushPtrMsb_15 <= ptrPush_pushReuseNext;
      ram_popPtrLow_0 <= ptrPop_popNext;
      ram_popPtrLow_1 <= ptrPop_popNext;
      ram_popPtrLow_2 <= ptrPop_popNext;
      ram_popPtrLow_3 <= ptrPop_popNext;
      ram_popPtrLow_4 <= ptrPop_popNext;
      ram_popPtrLow_5 <= ptrPop_popNext;
      ram_popPtrLow_6 <= ptrPop_popNext;
      ram_popPtrLow_7 <= ptrPop_popNext;
      ram_popPtrLow_8 <= ptrPop_popNext;
      ram_popPtrLow_9 <= ptrPop_popNext;
      ram_popPtrLow_10 <= ptrPop_popNext;
      ram_popPtrLow_11 <= ptrPop_popNext;
      ram_popPtrLow_12 <= ptrPop_popNext;
      ram_popPtrLow_13 <= ptrPop_popNext;
      ram_popPtrLow_14 <= ptrPop_popNext;
      ram_popPtrLow_15 <= ptrPop_popNext;
      ram_popPtrMsb_0 <= ptrPop_popReuseNext;
      ram_popPtrMsb_1 <= ptrPop_popReuseNext;
      ram_popPtrMsb_2 <= ptrPop_popReuseNext;
      ram_popPtrMsb_3 <= ptrPop_popReuseNext;
      ram_popPtrMsb_4 <= ptrPop_popReuseNext;
      ram_popPtrMsb_5 <= ptrPop_popReuseNext;
      ram_popPtrMsb_6 <= ptrPop_popReuseNext;
      ram_popPtrMsb_7 <= ptrPop_popReuseNext;
      ram_popPtrMsb_8 <= ptrPop_popReuseNext;
      ram_popPtrMsb_9 <= ptrPop_popReuseNext;
      ram_popPtrMsb_10 <= ptrPop_popReuseNext;
      ram_popPtrMsb_11 <= ptrPop_popReuseNext;
      ram_popPtrMsb_12 <= ptrPop_popReuseNext;
      ram_popPtrMsb_13 <= ptrPop_popReuseNext;
      ram_popPtrMsb_14 <= ptrPop_popReuseNext;
      ram_popPtrMsb_15 <= ptrPop_popReuseNext;
    end
  end

  always @(posedge clk_1_clk) begin
    dataDly <= io_input_tdata;
  end


endmodule

