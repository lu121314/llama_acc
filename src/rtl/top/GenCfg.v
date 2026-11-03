// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module GenCfg (
  output wire          io_cfg_valid,
  input  wire          io_cfg_ready,
  output wire [31:0]   io_cfg_payload,
  input  wire          status_tokenIndexFlow_valid,
  input  wire [5:0]    status_tokenIndexFlow_payload,
  input  wire          status_enPredictor,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                mux_io_inputs_0_ready;
  wire                mux_io_inputs_1_ready;
  wire                mux_io_inputs_2_ready;
  wire                mux_io_inputs_3_ready;
  wire                mux_io_inputs_4_ready;
  wire                mux_io_inputs_5_ready;
  wire                mux_io_inputs_6_ready;
  wire                mux_io_output_valid;
  wire                mux_io_output_payload_last;
  wire       [31:0]   mux_io_output_payload_fragment;
  wire                prefillIn_fifo_io_push_ready;
  wire                prefillIn_fifo_io_pop_valid;
  wire                prefillIn_fifo_io_pop_payload;
  wire       [6:0]    prefillIn_fifo_io_occupancy;
  wire       [6:0]    prefillIn_fifo_io_availability;
  wire       [16:0]   t_t_kCacheCfg;
  wire       [12:0]   t_t_kCacheCfg_1;
  wire       [16:0]   t_t_vCacheCfg;
  wire       [12:0]   t_t_vCacheCfg_1;
  wire       [12:0]   t_t_vCacheCfg_2;
  reg        [31:0]   t_attnKV_cfg_payload_fragment;
  reg        [31:0]   t_attnQKV_cfg_payload_fragment;
  reg        [31:0]   t_mlpDense_cfg_payload_fragment;
  reg        [31:0]   t_logits_cfg_payload_fragment;
  reg        [12:0]   token;
  wire                firstToken;
  wire       [31:0]   attnLnCfg;
  wire       [31:0]   kNoAttnCfg;
  wire       [31:0]   vNoAttnCfg;
  wire       [31:0]   qCfg;
  wire       [31:0]   kCfg;
  wire       [31:0]   vCfg;
  wire       [16:0]   t_kCacheCfg;
  wire       [31:0]   kCacheCfg;
  wire       [16:0]   t_vCacheCfg;
  wire       [31:0]   vCacheCfg;
  wire       [31:0]   attnOCfg;
  wire       [31:0]   mlpPredUCfg;
  wire       [31:0]   mlpPredDCfg;
  wire       [31:0]   mlpGDenseCfg;
  wire       [31:0]   mlpGSparseCfg;
  wire       [31:0]   mlpUCfg;
  wire       [31:0]   mlpDCfg;
  wire       [31:0]   logitsLnCfg;
  wire       [31:0]   logitsOutCfg;
  wire                attnLn_valid;
  wire                attnLn_ready;
  wire                attnLn_payload_last;
  wire       [31:0]   attnLn_payload_fragment;
  wire                attnO_valid;
  wire                attnO_ready;
  wire                attnO_payload_last;
  wire       [31:0]   attnO_payload_fragment;
  reg        [0:0]    attnKV_cnt;
  wire                attnKV_cntOvf;
  wire                attnKV_cfg_valid;
  reg                 attnKV_cfg_ready;
  wire                attnKV_cfg_payload_last;
  wire       [31:0]   attnKV_cfg_payload_fragment;
  wire                attnKV_cfgPipe_valid;
  wire                attnKV_cfgPipe_ready;
  wire                attnKV_cfgPipe_payload_last;
  wire       [31:0]   attnKV_cfgPipe_payload_fragment;
  reg                 attnKV_cfg_rValid;
  reg                 attnKV_cfg_rData_last;
  reg        [31:0]   attnKV_cfg_rData_fragment;
  wire                attnKV_cfg_fire;
  reg        [2:0]    attnQKV_cnt;
  wire                attnQKV_cntOvf;
  wire                attnQKV_cfg_valid;
  reg                 attnQKV_cfg_ready;
  wire                attnQKV_cfg_payload_last;
  wire       [31:0]   attnQKV_cfg_payload_fragment;
  wire                attnQKV_cfgPipe_valid;
  wire                attnQKV_cfgPipe_ready;
  wire                attnQKV_cfgPipe_payload_last;
  wire       [31:0]   attnQKV_cfgPipe_payload_fragment;
  reg                 attnQKV_cfg_rValid;
  reg                 attnQKV_cfg_rData_last;
  reg        [31:0]   attnQKV_cfg_rData_fragment;
  wire                attnQKV_cfg_fire;
  wire                mlpSparse_cfgPipe_valid;
  wire                mlpSparse_cfgPipe_ready;
  wire                mlpSparse_cfgPipe_payload_last;
  wire       [31:0]   mlpSparse_cfgPipe_payload_fragment;
  wire       [32:0]   t_mlpSparse_cfgPipe_payload_last;
  reg        [1:0]    mlpDense_cnt;
  wire                mlpDense_cntOvf;
  wire                mlpDense_cfg_valid;
  reg                 mlpDense_cfg_ready;
  wire                mlpDense_cfg_payload_last;
  wire       [31:0]   mlpDense_cfg_payload_fragment;
  wire                mlpDense_cfgPipe_valid;
  wire                mlpDense_cfgPipe_ready;
  wire                mlpDense_cfgPipe_payload_last;
  wire       [31:0]   mlpDense_cfgPipe_payload_fragment;
  reg                 mlpDense_cfg_rValid;
  reg                 mlpDense_cfg_rData_last;
  reg        [31:0]   mlpDense_cfg_rData_fragment;
  wire                mlpDense_cfg_fire;
  reg        [0:0]    logits_cnt;
  wire                logits_cntOvf;
  wire                logits_cfg_valid;
  reg                 logits_cfg_ready;
  wire                logits_cfg_payload_last;
  wire       [31:0]   logits_cfg_payload_fragment;
  wire                logits_cfgPipe_valid;
  wire                logits_cfgPipe_ready;
  wire                logits_cfgPipe_payload_last;
  wire       [31:0]   logits_cfgPipe_payload_fragment;
  reg                 logits_cfg_rValid;
  reg                 logits_cfg_rData_last;
  reg        [31:0]   logits_cfg_rData_fragment;
  wire                logits_cfg_fire;
  reg        [3:0]    headCnt;
  wire                headCntOvf;
  wire                enHeadCntInc;
  reg        [4:0]    layerCnt;
  wire                layerCntOvf;
  reg                 enLayerCntInc;
  wire                enTokenCnt;
  wire                attnKV_cfgPipe_fire;
  wire                kvDone;
  wire                attnQKV_cfgPipe_fire;
  wire                qkvDone;
  wire                mlpSparse_cfgPipe_fire;
  wire                sparseMlpDone;
  wire                mlpDense_cfgPipe_fire;
  wire                denseMlpDone;
  wire                mlpDone;
  wire                logits_cfgPipe_fire;
  wire                logitsDone;
  wire                prefillIn_valid;
  wire                prefillIn_ready;
  wire                prefillIn_payload;
  reg        [2:0]    select_1;
  reg        [2:0]    selectNext;
  wire                attnLn_fire;
  wire                attnO_fire;
  wire                cfg_valid;
  reg                 cfg_ready;
  wire       [31:0]   cfg_payload;
  wire                throwCond;
  reg                 cfg_thrown_valid;
  reg                 cfg_thrown_ready;
  wire       [31:0]   cfg_thrown_payload;
  wire                cfg_thrown_m2sPipe_valid;
  wire                cfg_thrown_m2sPipe_ready;
  wire       [31:0]   cfg_thrown_m2sPipe_payload;
  reg                 cfg_thrown_rValid;
  reg        [31:0]   cfg_thrown_rData;

  assign t_t_kCacheCfg_1 = (token - 13'h0001);
  assign t_t_kCacheCfg = {4'd0, t_t_kCacheCfg_1};
  assign t_t_vCacheCfg_1 = (t_t_vCacheCfg_2 - 13'h0001);
  assign t_t_vCacheCfg = {4'd0, t_t_vCacheCfg_1};
  assign t_t_vCacheCfg_2 = (token + 13'h0001);
  StreamMux_19 mux (
    .io_select                    (select_1[2:0]                           ), //i
    .io_inputs_0_valid            (attnLn_valid                            ), //i
    .io_inputs_0_ready            (mux_io_inputs_0_ready                   ), //o
    .io_inputs_0_payload_last     (attnLn_payload_last                     ), //i
    .io_inputs_0_payload_fragment (attnLn_payload_fragment[31:0]           ), //i
    .io_inputs_1_valid            (attnKV_cfgPipe_valid                    ), //i
    .io_inputs_1_ready            (mux_io_inputs_1_ready                   ), //o
    .io_inputs_1_payload_last     (attnKV_cfgPipe_payload_last             ), //i
    .io_inputs_1_payload_fragment (attnKV_cfgPipe_payload_fragment[31:0]   ), //i
    .io_inputs_2_valid            (attnQKV_cfgPipe_valid                   ), //i
    .io_inputs_2_ready            (mux_io_inputs_2_ready                   ), //o
    .io_inputs_2_payload_last     (attnQKV_cfgPipe_payload_last            ), //i
    .io_inputs_2_payload_fragment (attnQKV_cfgPipe_payload_fragment[31:0]  ), //i
    .io_inputs_3_valid            (attnO_valid                             ), //i
    .io_inputs_3_ready            (mux_io_inputs_3_ready                   ), //o
    .io_inputs_3_payload_last     (attnO_payload_last                      ), //i
    .io_inputs_3_payload_fragment (attnO_payload_fragment[31:0]            ), //i
    .io_inputs_4_valid            (mlpSparse_cfgPipe_valid                 ), //i
    .io_inputs_4_ready            (mux_io_inputs_4_ready                   ), //o
    .io_inputs_4_payload_last     (mlpSparse_cfgPipe_payload_last          ), //i
    .io_inputs_4_payload_fragment (mlpSparse_cfgPipe_payload_fragment[31:0]), //i
    .io_inputs_5_valid            (mlpDense_cfgPipe_valid                  ), //i
    .io_inputs_5_ready            (mux_io_inputs_5_ready                   ), //o
    .io_inputs_5_payload_last     (mlpDense_cfgPipe_payload_last           ), //i
    .io_inputs_5_payload_fragment (mlpDense_cfgPipe_payload_fragment[31:0] ), //i
    .io_inputs_6_valid            (logits_cfgPipe_valid                    ), //i
    .io_inputs_6_ready            (mux_io_inputs_6_ready                   ), //o
    .io_inputs_6_payload_last     (logits_cfgPipe_payload_last             ), //i
    .io_inputs_6_payload_fragment (logits_cfgPipe_payload_fragment[31:0]   ), //i
    .io_output_valid              (mux_io_output_valid                     ), //o
    .io_output_ready              (cfg_ready                               ), //i
    .io_output_payload_last       (mux_io_output_payload_last              ), //o
    .io_output_payload_fragment   (mux_io_output_payload_fragment[31:0]    )  //o
  );
  StreamFifo_69 prefillIn_fifo (
    .io_push_valid   (prefillIn_valid                    ), //i
    .io_push_ready   (prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (prefillIn_payload                  ), //i
    .io_pop_valid    (prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (enTokenCnt                         ), //i
    .io_pop_payload  (prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                               ), //i
    .io_occupancy    (prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                          ), //i
    .clk_1_resetn    (clk_1_resetn                       )  //i
  );
  always @(*) begin
    case(attnKV_cnt)
      1'b0 : t_attnKV_cfg_payload_fragment = kNoAttnCfg;
      default : t_attnKV_cfg_payload_fragment = vNoAttnCfg;
    endcase
  end

  always @(*) begin
    case(attnQKV_cnt)
      3'b000 : t_attnQKV_cfg_payload_fragment = qCfg;
      3'b001 : t_attnQKV_cfg_payload_fragment = kCfg;
      3'b010 : t_attnQKV_cfg_payload_fragment = kCacheCfg;
      3'b011 : t_attnQKV_cfg_payload_fragment = vCfg;
      default : t_attnQKV_cfg_payload_fragment = vCacheCfg;
    endcase
  end

  always @(*) begin
    case(mlpDense_cnt)
      2'b00 : t_mlpDense_cfg_payload_fragment = mlpGDenseCfg;
      2'b01 : t_mlpDense_cfg_payload_fragment = mlpUCfg;
      default : t_mlpDense_cfg_payload_fragment = mlpDCfg;
    endcase
  end

  always @(*) begin
    case(logits_cnt)
      1'b0 : t_logits_cfg_payload_fragment = logitsLnCfg;
      default : t_logits_cfg_payload_fragment = logitsOutCfg;
    endcase
  end

  assign firstToken = (token == 13'h0);
  assign attnLnCfg = {{{8'h0c,1'b0},7'h0b},16'h0};
  assign kNoAttnCfg = {{{8'h44,1'b0},7'h17},16'h007f};
  assign vNoAttnCfg = {{{8'h4c,1'b0},7'h17},16'h007f};
  assign qCfg = {{{8'h14,1'b0},7'h17},16'h007f};
  assign kCfg = {{{8'h18,1'b0},7'h17},16'h007f};
  assign vCfg = {{{8'h1c,1'b0},7'h17},16'h007f};
  assign t_kCacheCfg = t_t_kCacheCfg;
  assign kCacheCfg = {{{8'h34,t_kCacheCfg[16]},7'h0},t_kCacheCfg[15 : 0]};
  assign t_vCacheCfg = t_t_vCacheCfg;
  assign vCacheCfg = {{{8'h3d,t_vCacheCfg[16]},7'h0},t_vCacheCfg[15 : 0]};
  assign attnOCfg = {{{8'h40,1'b0},7'h0b},16'h0bff};
  assign mlpPredUCfg = {{{8'h6c,1'b0},7'h0b},16'h03ff};
  assign mlpPredDCfg = {{{8'h71,1'b0},7'h1f},16'h0};
  assign mlpGDenseCfg = {{{8'h58,1'b0},7'h0b},16'h1fff};
  assign mlpGSparseCfg = {{{8'h58,1'b0},7'h0b},16'h0};
  assign mlpUCfg = {{{8'h60,1'b0},7'h0b},16'h0};
  assign mlpDCfg = {{{8'h7f,1'b0},7'h0b},16'h0};
  assign logitsLnCfg = {{{8'h80,1'b0},7'h0b},16'h0};
  assign logitsOutCfg = {{{8'h8c,1'b1},7'h0b},16'hf4ff};
  assign attnLn_valid = 1'b1;
  assign attnLn_payload_fragment = attnLnCfg;
  assign attnLn_payload_last = 1'b1;
  assign attnO_valid = 1'b1;
  assign attnO_payload_fragment = attnOCfg;
  assign attnO_payload_last = 1'b1;
  assign attnKV_cntOvf = (attnKV_cnt == 1'b1);
  always @(*) begin
    attnKV_cfg_ready = attnKV_cfgPipe_ready;
    if((! attnKV_cfgPipe_valid)) begin
      attnKV_cfg_ready = 1'b1;
    end
  end

  assign attnKV_cfgPipe_valid = attnKV_cfg_rValid;
  assign attnKV_cfgPipe_payload_last = attnKV_cfg_rData_last;
  assign attnKV_cfgPipe_payload_fragment = attnKV_cfg_rData_fragment;
  assign attnKV_cfg_valid = 1'b1;
  assign attnKV_cfg_payload_fragment = t_attnKV_cfg_payload_fragment;
  assign attnKV_cfg_payload_last = attnKV_cntOvf;
  assign attnKV_cfg_fire = (attnKV_cfg_valid && attnKV_cfg_ready);
  assign attnQKV_cntOvf = (attnQKV_cnt == 3'b100);
  always @(*) begin
    attnQKV_cfg_ready = attnQKV_cfgPipe_ready;
    if((! attnQKV_cfgPipe_valid)) begin
      attnQKV_cfg_ready = 1'b1;
    end
  end

  assign attnQKV_cfgPipe_valid = attnQKV_cfg_rValid;
  assign attnQKV_cfgPipe_payload_last = attnQKV_cfg_rData_last;
  assign attnQKV_cfgPipe_payload_fragment = attnQKV_cfg_rData_fragment;
  assign attnQKV_cfg_valid = 1'b1;
  assign attnQKV_cfg_payload_fragment = t_attnQKV_cfg_payload_fragment;
  assign attnQKV_cfg_payload_last = attnQKV_cntOvf;
  assign attnQKV_cfg_fire = (attnQKV_cfg_valid && attnQKV_cfg_ready);
  assign mlpSparse_cfgPipe_valid = 1'b0;
  assign t_mlpSparse_cfgPipe_payload_last = 33'h0;
  assign mlpSparse_cfgPipe_payload_last = t_mlpSparse_cfgPipe_payload_last[0];
  assign mlpSparse_cfgPipe_payload_fragment = t_mlpSparse_cfgPipe_payload_last[32 : 1];
  assign mlpDense_cntOvf = (mlpDense_cnt == 2'b10);
  always @(*) begin
    mlpDense_cfg_ready = mlpDense_cfgPipe_ready;
    if((! mlpDense_cfgPipe_valid)) begin
      mlpDense_cfg_ready = 1'b1;
    end
  end

  assign mlpDense_cfgPipe_valid = mlpDense_cfg_rValid;
  assign mlpDense_cfgPipe_payload_last = mlpDense_cfg_rData_last;
  assign mlpDense_cfgPipe_payload_fragment = mlpDense_cfg_rData_fragment;
  assign mlpDense_cfg_valid = 1'b1;
  assign mlpDense_cfg_payload_fragment = t_mlpDense_cfg_payload_fragment;
  assign mlpDense_cfg_payload_last = mlpDense_cntOvf;
  assign mlpDense_cfg_fire = (mlpDense_cfg_valid && mlpDense_cfg_ready);
  assign logits_cntOvf = (logits_cnt == 1'b1);
  always @(*) begin
    logits_cfg_ready = logits_cfgPipe_ready;
    if((! logits_cfgPipe_valid)) begin
      logits_cfg_ready = 1'b1;
    end
  end

  assign logits_cfgPipe_valid = logits_cfg_rValid;
  assign logits_cfgPipe_payload_last = logits_cfg_rData_last;
  assign logits_cfgPipe_payload_fragment = logits_cfg_rData_fragment;
  assign logits_cfg_valid = 1'b1;
  assign logits_cfg_payload_fragment = t_logits_cfg_payload_fragment;
  assign logits_cfg_payload_last = logits_cntOvf;
  assign logits_cfg_fire = (logits_cfg_valid && logits_cfg_ready);
  assign attnLn_ready = mux_io_inputs_0_ready;
  assign attnKV_cfgPipe_ready = mux_io_inputs_1_ready;
  assign attnQKV_cfgPipe_ready = mux_io_inputs_2_ready;
  assign attnO_ready = mux_io_inputs_3_ready;
  assign mlpSparse_cfgPipe_ready = mux_io_inputs_4_ready;
  assign mlpDense_cfgPipe_ready = mux_io_inputs_5_ready;
  assign logits_cfgPipe_ready = mux_io_inputs_6_ready;
  assign headCntOvf = (headCnt == 4'b1011);
  assign layerCntOvf = (layerCnt == 5'h1b);
  assign enTokenCnt = (enLayerCntInc && layerCntOvf);
  assign attnKV_cfgPipe_fire = (attnKV_cfgPipe_valid && attnKV_cfgPipe_ready);
  assign kvDone = (attnKV_cfgPipe_fire && attnKV_cfgPipe_payload_last);
  assign attnQKV_cfgPipe_fire = (attnQKV_cfgPipe_valid && attnQKV_cfgPipe_ready);
  assign qkvDone = (attnQKV_cfgPipe_fire && attnQKV_cfgPipe_payload_last);
  assign mlpSparse_cfgPipe_fire = (mlpSparse_cfgPipe_valid && mlpSparse_cfgPipe_ready);
  assign sparseMlpDone = (mlpSparse_cfgPipe_fire && mlpSparse_cfgPipe_payload_last);
  assign mlpDense_cfgPipe_fire = (mlpDense_cfgPipe_valid && mlpDense_cfgPipe_ready);
  assign denseMlpDone = (mlpDense_cfgPipe_fire && mlpDense_cfgPipe_payload_last);
  assign mlpDone = (sparseMlpDone || denseMlpDone);
  assign logits_cfgPipe_fire = (logits_cfgPipe_valid && logits_cfgPipe_ready);
  assign logitsDone = (logits_cfgPipe_fire && logits_cfgPipe_payload_last);
  assign prefillIn_valid = status_tokenIndexFlow_valid;
  assign prefillIn_payload = (status_tokenIndexFlow_payload == 6'h0);
  assign prefillIn_ready = prefillIn_fifo_io_push_ready;
  assign enHeadCntInc = (kvDone || qkvDone);
  always @(*) begin
    enLayerCntInc = mlpDone;
    if((prefillIn_fifo_io_pop_payload && layerCntOvf)) begin
      enLayerCntInc = (kvDone && headCntOvf);
    end
  end

  always @(*) begin
    selectNext = select_1;
    if(((select_1 == 3'b000) && attnLn_fire)) begin
      if((firstToken || (prefillIn_fifo_io_pop_payload && layerCntOvf))) begin
        selectNext = 3'b001;
      end else begin
        selectNext = 3'b010;
      end
    end
    if((((select_1 == 3'b001) && kvDone) && headCntOvf)) begin
      if((prefillIn_fifo_io_pop_payload && layerCntOvf)) begin
        selectNext = 3'b000;
      end else begin
        selectNext = 3'b011;
      end
    end
    if((((select_1 == 3'b010) && qkvDone) && headCntOvf)) begin
      selectNext = 3'b011;
    end
    if(((select_1 == 3'b011) && attnO_fire)) begin
      if(status_enPredictor) begin
        selectNext = 3'b100;
      end else begin
        selectNext = 3'b101;
      end
    end
    if(((select_1 == 3'b100) && sparseMlpDone)) begin
      if(layerCntOvf) begin
        selectNext = 3'b110;
      end else begin
        selectNext = 3'b000;
      end
    end
    if(((select_1 == 3'b101) && denseMlpDone)) begin
      if(layerCntOvf) begin
        selectNext = 3'b110;
      end else begin
        selectNext = 3'b000;
      end
    end
    if(((select_1 == 3'b110) && logitsDone)) begin
      selectNext = 3'b000;
    end
  end

  assign attnLn_fire = (attnLn_valid && attnLn_ready);
  assign attnO_fire = (attnO_valid && attnO_ready);
  assign cfg_valid = mux_io_output_valid;
  assign cfg_payload = mux_io_output_payload_fragment;
  assign throwCond = ((cfg_payload == attnLnCfg) || (cfg_payload == logitsLnCfg));
  always @(*) begin
    cfg_thrown_valid = cfg_valid;
    if(throwCond) begin
      cfg_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    cfg_ready = cfg_thrown_ready;
    if(throwCond) begin
      cfg_ready = 1'b1;
    end
  end

  assign cfg_thrown_payload = cfg_payload;
  always @(*) begin
    cfg_thrown_ready = cfg_thrown_m2sPipe_ready;
    if((! cfg_thrown_m2sPipe_valid)) begin
      cfg_thrown_ready = 1'b1;
    end
  end

  assign cfg_thrown_m2sPipe_valid = cfg_thrown_rValid;
  assign cfg_thrown_m2sPipe_payload = cfg_thrown_rData;
  assign io_cfg_valid = cfg_thrown_m2sPipe_valid;
  assign cfg_thrown_m2sPipe_ready = io_cfg_ready;
  assign io_cfg_payload = cfg_thrown_m2sPipe_payload;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      token <= 13'h0;
      attnKV_cnt <= 1'b0;
      attnKV_cfg_rValid <= 1'b0;
      attnQKV_cnt <= 3'b000;
      attnQKV_cfg_rValid <= 1'b0;
      mlpDense_cnt <= 2'b00;
      mlpDense_cfg_rValid <= 1'b0;
      logits_cnt <= 1'b0;
      logits_cfg_rValid <= 1'b0;
      headCnt <= 4'b0000;
      layerCnt <= 5'h0;
      select_1 <= 3'b000;
      cfg_thrown_rValid <= 1'b0;
    end else begin
      if(attnKV_cfg_ready) begin
        attnKV_cfg_rValid <= attnKV_cfg_valid;
      end
      if(attnKV_cfg_fire) begin
        attnKV_cnt <= (attnKV_cnt + 1'b1);
        if(attnKV_cntOvf) begin
          attnKV_cnt <= 1'b0;
        end
      end
      if(attnQKV_cfg_ready) begin
        attnQKV_cfg_rValid <= attnQKV_cfg_valid;
      end
      if(attnQKV_cfg_fire) begin
        attnQKV_cnt <= (attnQKV_cnt + 3'b001);
        if(attnQKV_cntOvf) begin
          attnQKV_cnt <= 3'b000;
        end
      end
      if(mlpDense_cfg_ready) begin
        mlpDense_cfg_rValid <= mlpDense_cfg_valid;
      end
      if(mlpDense_cfg_fire) begin
        mlpDense_cnt <= (mlpDense_cnt + 2'b01);
        if(mlpDense_cntOvf) begin
          mlpDense_cnt <= 2'b00;
        end
      end
      if(logits_cfg_ready) begin
        logits_cfg_rValid <= logits_cfg_valid;
      end
      if(logits_cfg_fire) begin
        logits_cnt <= (logits_cnt + 1'b1);
        if(logits_cntOvf) begin
          logits_cnt <= 1'b0;
        end
      end
      if(enHeadCntInc) begin
        headCnt <= (headCnt + 4'b0001);
        if(headCntOvf) begin
          headCnt <= 4'b0000;
        end
      end
      if(enLayerCntInc) begin
        layerCnt <= (layerCnt + 5'h01);
        if(layerCntOvf) begin
          layerCnt <= 5'h0;
        end
      end
      if(enTokenCnt) begin
        token <= (token + 13'h0001);
      end
      select_1 <= selectNext;
      if(cfg_thrown_ready) begin
        cfg_thrown_rValid <= cfg_thrown_valid;
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(attnKV_cfg_ready) begin
      attnKV_cfg_rData_last <= attnKV_cfg_payload_last;
      attnKV_cfg_rData_fragment <= attnKV_cfg_payload_fragment;
    end
    if(attnQKV_cfg_ready) begin
      attnQKV_cfg_rData_last <= attnQKV_cfg_payload_last;
      attnQKV_cfg_rData_fragment <= attnQKV_cfg_payload_fragment;
    end
    if(mlpDense_cfg_ready) begin
      mlpDense_cfg_rData_last <= mlpDense_cfg_payload_last;
      mlpDense_cfg_rData_fragment <= mlpDense_cfg_payload_fragment;
    end
    if(logits_cfg_ready) begin
      logits_cfg_rData_last <= logits_cfg_payload_last;
      logits_cfg_rData_fragment <= logits_cfg_payload_fragment;
    end
    if(cfg_thrown_ready) begin
      cfg_thrown_rData <= cfg_thrown_payload;
    end
  end


endmodule

