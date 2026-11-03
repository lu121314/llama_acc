// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StateGen (
  input  wire          io_busIn_valid,
  input  wire          io_busIn_payload_last,
  input  wire [5:0]    io_busIn_payload_fragment,
  input  wire          io_engineOut_valid,
  input  wire [5:0]    io_engineOut_payload,
  input  wire          io_dotOut_valid,
  input  wire [5:0]    io_dotOut_payload,
  input  wire          io_gtCnt_valid,
  input  wire [15:0]   io_gtCnt_payload,
  input  wire          io_tokenIndexFlow_valid,
  input  wire [5:0]    io_tokenIndexFlow_payload,
  input  wire          status_argmaxVld,
  input  wire          status_endOfDecode,
  output wire          status_enPredictor,
  output wire          status_enProSparse,
  output wire          status_tokenNextHit,
  output wire          status_mlpNextHit,
  output wire          status_vNextHit,
  output wire          status_prefill,
  output wire          status_flushRes,
  output wire          status_nextLayer,
  output wire [15:0]   status_nonZeroCnt,
  output wire          status_logitsGen,
  output wire          status_toLogitsGen,
  output wire [12:0]   status_token,
  output wire [4:0]    status_layerCnt,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                busAlign_prefillIn_fifo_io_pop_ready;
  wire                dataAlign_prefillIn_fifo_io_pop_ready;
  wire                busAlign_prefillIn_fifo_io_push_ready;
  wire                busAlign_prefillIn_fifo_io_pop_valid;
  wire                busAlign_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    busAlign_prefillIn_fifo_io_occupancy;
  wire       [6:0]    busAlign_prefillIn_fifo_io_availability;
  wire                dataAlign_prefillIn_fifo_io_push_ready;
  wire                dataAlign_prefillIn_fifo_io_pop_valid;
  wire                dataAlign_prefillIn_fifo_io_pop_payload;
  wire       [6:0]    dataAlign_prefillIn_fifo_io_occupancy;
  wire       [6:0]    dataAlign_prefillIn_fifo_io_availability;
  wire                busAlign_prefillIn_valid;
  wire                busAlign_prefillIn_ready;
  wire                busAlign_prefillIn_payload;
  wire                busAlign_prefillLastHit;
  wire                busAlign_prefillHit;
  wire                busAlign_attnVHit;
  wire                busAlign_mlpDHit;
  wire                busAlign_lmHeadHit;
  reg        [3:0]    busAlign_headCnt;
  wire                busAlign_headCntOvf;
  reg                 busAlign_lastHead;
  wire                busAlign_headVld;
  reg        [4:0]    busAlign_layerCnt;
  reg                 busAlign_lastLayer;
  wire                busAlign_layerCntAbout2Ovf;
  reg                 busAlign_enLayerCntInc;
  reg                 busAlign_prefillFirstToken;
  wire                stateGen_2_busAlign_prefillIn_fifo_io_pop_fire;
  wire                busAlign_noAttn;
  wire                busAlign_tokenNextHit;
  wire                busAlign_vNextHit;
  wire                dataAlign_prefillIn_valid;
  wire                dataAlign_prefillIn_ready;
  wire                dataAlign_prefillIn_payload;
  wire                dataAlign_mlpHit;
  wire                dataAlign_vHit;
  reg        [3:0]    dataAlign_engineOutCnt;
  wire                dataAlign_engineOutCntOvf;
  wire                dataAlign_engineOutVld;
  reg        [10:0]   dataAlign_dotOutCnt;
  wire                dataAlign_dotOutCntOvf;
  wire                dataAlign_dotOutVld;
  wire                dataAlign_mlpDone;
  wire                dataAlign_vDone;
  reg                 dataAlign_prefillFirstToken;
  reg                 dataAlign_lastLayer;
  reg                 dataAlign_enInc;
  reg        [4:0]    dataAlign_layerCnt;
  reg        [12:0]   dataAlign_tokenCnt;
  wire                dataAlign_layerOvf;
  wire                dataAlign_beforeLastLayer;
  reg        [15:0]   dataAlign_nonZeroCnt;
  wire                dataAlign_flushRes;
  reg                 dataAlign_logitsGen;

  StreamFifo_69 busAlign_prefillIn_fifo (
    .io_push_valid   (busAlign_prefillIn_valid                    ), //i
    .io_push_ready   (busAlign_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (busAlign_prefillIn_payload                  ), //i
    .io_pop_valid    (busAlign_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (busAlign_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (busAlign_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                        ), //i
    .io_occupancy    (busAlign_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (busAlign_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                                   ), //i
    .clk_1_resetn    (clk_1_resetn                                )  //i
  );
  StreamFifo_69 dataAlign_prefillIn_fifo (
    .io_push_valid   (dataAlign_prefillIn_valid                    ), //i
    .io_push_ready   (dataAlign_prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (dataAlign_prefillIn_payload                  ), //i
    .io_pop_valid    (dataAlign_prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (dataAlign_prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (dataAlign_prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                                         ), //i
    .io_occupancy    (dataAlign_prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (dataAlign_prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                                    ), //i
    .clk_1_resetn    (clk_1_resetn                                 )  //i
  );
  assign status_enPredictor = 1'b0;
  assign status_enProSparse = 1'b0;
  assign busAlign_prefillIn_valid = io_tokenIndexFlow_valid;
  assign busAlign_prefillIn_payload = (io_tokenIndexFlow_payload == 6'h0);
  assign busAlign_prefillIn_ready = busAlign_prefillIn_fifo_io_push_ready;
  assign busAlign_prefillLastHit = (io_busIn_payload_fragment == 6'h01);
  assign busAlign_prefillHit = ((io_busIn_payload_fragment == 6'h0) || busAlign_prefillLastHit);
  assign busAlign_attnVHit = (io_busIn_payload_fragment == 6'h07);
  assign busAlign_mlpDHit = (io_busIn_payload_fragment == 6'h11);
  assign busAlign_lmHeadHit = (io_busIn_payload_fragment == 6'h13);
  assign busAlign_headCntOvf = (busAlign_headCnt == 4'b1011);
  assign busAlign_layerCntAbout2Ovf = (busAlign_layerCnt == 5'h1a);
  assign busAlign_prefillIn_fifo_io_pop_ready = (busAlign_enLayerCntInc && busAlign_lastLayer);
  assign stateGen_2_busAlign_prefillIn_fifo_io_pop_fire = (busAlign_prefillIn_fifo_io_pop_valid && busAlign_prefillIn_fifo_io_pop_ready);
  assign busAlign_headVld = ((io_busIn_valid && io_busIn_payload_last) && busAlign_attnVHit);
  always @(*) begin
    busAlign_enLayerCntInc = ((io_busIn_valid && io_busIn_payload_last) && busAlign_mlpDHit);
    if((busAlign_prefillIn_fifo_io_pop_payload && busAlign_lastLayer)) begin
      busAlign_enLayerCntInc = (busAlign_headVld && busAlign_headCntOvf);
    end
  end

  assign busAlign_noAttn = (busAlign_prefillFirstToken || (busAlign_prefillIn_fifo_io_pop_payload && busAlign_lastLayer));
  assign busAlign_tokenNextHit = ((((busAlign_attnVHit && busAlign_prefillIn_fifo_io_pop_payload) && busAlign_lastLayer) && busAlign_lastHead) || busAlign_lmHeadHit);
  assign busAlign_vNextHit = (busAlign_attnVHit && (! busAlign_noAttn));
  assign status_tokenNextHit = busAlign_tokenNextHit;
  assign status_vNextHit = busAlign_vNextHit;
  assign status_mlpNextHit = busAlign_mlpDHit;
  assign status_prefill = busAlign_prefillIn_fifo_io_pop_payload;
  assign dataAlign_prefillIn_valid = io_tokenIndexFlow_valid;
  assign dataAlign_prefillIn_payload = (io_tokenIndexFlow_payload == 6'h0);
  assign dataAlign_prefillIn_ready = dataAlign_prefillIn_fifo_io_push_ready;
  assign dataAlign_mlpHit = (io_engineOut_payload == 6'h1f);
  assign dataAlign_vHit = ((io_dotOut_payload == 6'h07) || (io_dotOut_payload == 6'h13));
  assign dataAlign_engineOutCntOvf = (dataAlign_engineOutCnt == 4'b1011);
  assign dataAlign_dotOutCntOvf = (dataAlign_dotOutCnt == 11'h5ff);
  assign dataAlign_mlpDone = (dataAlign_engineOutVld && dataAlign_engineOutCntOvf);
  assign dataAlign_vDone = (dataAlign_dotOutVld && dataAlign_dotOutCntOvf);
  assign dataAlign_engineOutVld = (io_engineOut_valid && dataAlign_mlpHit);
  assign dataAlign_dotOutVld = (io_dotOut_valid && dataAlign_vHit);
  assign dataAlign_layerOvf = (dataAlign_layerCnt == 5'h1b);
  assign dataAlign_beforeLastLayer = (dataAlign_layerCnt == 5'h1a);
  always @(*) begin
    dataAlign_enInc = dataAlign_mlpDone;
    if((dataAlign_prefillIn_fifo_io_pop_payload && dataAlign_lastLayer)) begin
      dataAlign_enInc = dataAlign_vDone;
    end
  end

  assign dataAlign_prefillIn_fifo_io_pop_ready = (dataAlign_enInc && dataAlign_lastLayer);
  assign dataAlign_flushRes = ((dataAlign_prefillIn_fifo_io_pop_payload ? dataAlign_beforeLastLayer : dataAlign_lastLayer) && dataAlign_engineOutVld);
  assign status_flushRes = dataAlign_flushRes;
  assign status_nextLayer = dataAlign_enInc;
  assign status_nonZeroCnt = dataAlign_nonZeroCnt;
  assign status_logitsGen = dataAlign_logitsGen;
  assign status_toLogitsGen = ((! dataAlign_prefillIn_fifo_io_pop_payload) && dataAlign_lastLayer);
  assign status_token = dataAlign_tokenCnt;
  assign status_layerCnt = dataAlign_layerCnt;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      busAlign_headCnt <= 4'b0000;
      busAlign_lastHead <= 1'b0;
      busAlign_layerCnt <= 5'h0;
      busAlign_lastLayer <= 1'b0;
      busAlign_prefillFirstToken <= 1'b1;
      dataAlign_engineOutCnt <= 4'b0000;
      dataAlign_dotOutCnt <= 11'h0;
      dataAlign_prefillFirstToken <= 1'b1;
      dataAlign_lastLayer <= 1'b0;
      dataAlign_layerCnt <= 5'h0;
      dataAlign_tokenCnt <= 13'h0;
      dataAlign_nonZeroCnt <= 16'hffff;
      dataAlign_logitsGen <= 1'b0;
    end else begin
      if(busAlign_headVld) begin
        busAlign_headCnt <= (busAlign_headCnt + 4'b0001);
        if((busAlign_headCnt == 4'b1010)) begin
          busAlign_lastHead <= 1'b1;
        end
        if(busAlign_headCntOvf) begin
          busAlign_lastHead <= 1'b0;
          busAlign_headCnt <= 4'b0000;
        end
      end
      if(busAlign_enLayerCntInc) begin
        busAlign_layerCnt <= (busAlign_layerCnt + 5'h01);
        if(busAlign_layerCntAbout2Ovf) begin
          busAlign_lastLayer <= 1'b1;
        end
        if(busAlign_lastLayer) begin
          busAlign_layerCnt <= 5'h0;
          busAlign_lastLayer <= 1'b0;
        end
      end
      if(stateGen_2_busAlign_prefillIn_fifo_io_pop_fire) begin
        busAlign_prefillFirstToken <= 1'b0;
      end
      if(dataAlign_engineOutVld) begin
        dataAlign_engineOutCnt <= (dataAlign_engineOutCnt + 4'b0001);
        if(dataAlign_engineOutCntOvf) begin
          dataAlign_engineOutCnt <= 4'b0000;
        end
      end
      if(dataAlign_dotOutVld) begin
        dataAlign_dotOutCnt <= (dataAlign_dotOutCnt + 11'h001);
        if(dataAlign_dotOutCntOvf) begin
          dataAlign_dotOutCnt <= 11'h0;
        end
      end
      if(dataAlign_enInc) begin
        dataAlign_layerCnt <= (dataAlign_layerCnt + 5'h01);
        if(dataAlign_beforeLastLayer) begin
          dataAlign_lastLayer <= 1'b1;
        end
        if(dataAlign_layerOvf) begin
          dataAlign_layerCnt <= 5'h0;
          dataAlign_lastLayer <= 1'b0;
          dataAlign_prefillFirstToken <= 1'b0;
          dataAlign_tokenCnt <= (dataAlign_tokenCnt + 13'h0001);
          if((dataAlign_tokenCnt == 13'h1fff)) begin
            dataAlign_tokenCnt <= 13'h0;
          end
        end
      end
      if(io_gtCnt_valid) begin
        dataAlign_nonZeroCnt <= io_gtCnt_payload;
      end
      if(dataAlign_enInc) begin
        dataAlign_nonZeroCnt <= 16'hffff;
      end
      if((((! dataAlign_prefillIn_fifo_io_pop_payload) && dataAlign_mlpDone) && dataAlign_lastLayer)) begin
        dataAlign_logitsGen <= 1'b1;
      end
      if(status_argmaxVld) begin
        dataAlign_logitsGen <= 1'b0;
      end
    end
  end


endmodule

