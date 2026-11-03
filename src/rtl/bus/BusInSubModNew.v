// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module BusInSubModNew (
  input  wire          io_bus_valid,
  output reg           io_bus_ready,
  input  wire          io_bus_payload_last,
  input  wire [511:0]  io_bus_payload_tdata,
  input  wire [5:0]    io_bus_payload_tuser,
  input  wire          io_vecIn_valid,
  input  wire [2047:0] io_vecIn_tdata,
  input  wire [5:0]    io_vecIn_tuser,
  input  wire          io_vLocal_valid,
  input  wire [2047:0] io_vLocal_tdata,
  input  wire [5:0]    io_vLocal_tuser,
  input  wire          io_zeroInt4_valid,
  output wire          io_zeroInt4_ready,
  input  wire [7:0]    io_zeroInt4_payload,
  input  wire          io_zeroInt8_valid,
  output wire          io_zeroInt8_ready,
  input  wire [7:0]    io_zeroInt8_payload,
  output wire          io_wkv_valid,
  input  wire          io_wkv_ready,
  output wire [2047:0] io_wkv_payload,
  output wire          io_p2sOut_valid,
  output wire          io_p2sOut_payload_last,
  output wire [15:0]   io_p2sOut_payload_tdata,
  output wire [5:0]    io_p2sOut_payload_tuser,
  output wire          io_toResBuf_valid,
  output wire [2047:0] io_toResBuf_payload,
  output wire          io_directOut_valid,
  output wire [2047:0] io_directOut_tdata,
  output wire [5:0]    io_directOut_tuser,
  input  wire          status_tokenNextHit,
  input  wire          status_mlpNextHit,
  input  wire          status_vNextHit,
  input  wire          status_flushRes,
  input  wire          status_logitsGen,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                s2p_input_valid;
  wire                conv_inputData_tvalid;
  wire                s2p_output_tvalid;
  wire       [2047:0] s2p_output_tdata;
  wire       [5:0]    s2p_output_tuser;
  wire                conv_zeroInt4_tready;
  wire                conv_zeroInt8_tready;
  wire                conv_output_tvalid;
  wire       [2047:0] conv_output_tdata;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2047:0] fifo_io_pop_payload;
  wire       [5:0]    fifo_io_occupancy;
  wire       [5:0]    fifo_io_availability;
  wire                p2sBuf_io_input_ready;
  wire                p2sBuf_io_output_valid;
  wire       [2047:0] p2sBuf_io_output_tdata;
  wire       [5:0]    p2sBuf_io_output_tuser;
  wire                p2s_io_input_ready;
  wire                p2s_io_output_valid;
  wire       [15:0]   p2s_io_output_tdata;
  wire       [5:0]    p2s_io_output_tuser;
  reg                 t_pushVld;
  reg        [255:0]  t_toFifo_0;
  reg        [255:0]  t_toFifo_1;
  reg        [255:0]  t_toFifo_2;
  reg        [255:0]  t_toFifo_3;
  reg        [255:0]  t_toFifo_4;
  reg        [255:0]  t_toFifo_5;
  reg        [255:0]  t_toFifo_6;
  reg        [255:0]  t_toFifo_7;
  wire                kvHit;
  wire                wkvFire;
  reg                 selExtTokenSqr;
  (* max_fanout = 100 *) reg                 selVLocal;
  wire                en;
  wire                vLocalVec_0_valid;
  reg                 vLocalVec_0_ready;
  wire       [255:0]  vLocalVec_0_payload;
  wire                vLocalVec_1_valid;
  reg                 vLocalVec_1_ready;
  wire       [255:0]  vLocalVec_1_payload;
  wire                vLocalVec_2_valid;
  reg                 vLocalVec_2_ready;
  wire       [255:0]  vLocalVec_2_payload;
  wire                vLocalVec_3_valid;
  reg                 vLocalVec_3_ready;
  wire       [255:0]  vLocalVec_3_payload;
  wire                vLocalVec_4_valid;
  reg                 vLocalVec_4_ready;
  wire       [255:0]  vLocalVec_4_payload;
  wire                vLocalVec_5_valid;
  reg                 vLocalVec_5_ready;
  wire       [255:0]  vLocalVec_5_payload;
  wire                vLocalVec_6_valid;
  reg                 vLocalVec_6_ready;
  wire       [255:0]  vLocalVec_6_payload;
  wire                vLocalVec_7_valid;
  reg                 vLocalVec_7_ready;
  wire       [255:0]  vLocalVec_7_payload;
  wire       [255:0]  vLocalPayload_0;
  wire       [255:0]  vLocalPayload_1;
  wire       [255:0]  vLocalPayload_2;
  wire       [255:0]  vLocalPayload_3;
  wire       [255:0]  vLocalPayload_4;
  wire       [255:0]  vLocalPayload_5;
  wire       [255:0]  vLocalPayload_6;
  wire       [255:0]  vLocalPayload_7;
  (* keep = "true" *) wire                vLocalLockVec_0_valid;
  wire                vLocalLockVec_0_ready;
  wire       [255:0]  vLocalLockVec_0_payload;
  reg                 vLocalVec_0_rValid;
  reg        [255:0]  vLocalVec_0_rData;
  (* keep = "true" *) wire                vLocalLockVec_1_valid;
  wire                vLocalLockVec_1_ready;
  wire       [255:0]  vLocalLockVec_1_payload;
  reg                 vLocalVec_1_rValid;
  reg        [255:0]  vLocalVec_1_rData;
  (* keep = "true" *) wire                vLocalLockVec_2_valid;
  wire                vLocalLockVec_2_ready;
  wire       [255:0]  vLocalLockVec_2_payload;
  reg                 vLocalVec_2_rValid;
  reg        [255:0]  vLocalVec_2_rData;
  (* keep = "true" *) wire                vLocalLockVec_3_valid;
  wire                vLocalLockVec_3_ready;
  wire       [255:0]  vLocalLockVec_3_payload;
  reg                 vLocalVec_3_rValid;
  reg        [255:0]  vLocalVec_3_rData;
  (* keep = "true" *) wire                vLocalLockVec_4_valid;
  wire                vLocalLockVec_4_ready;
  wire       [255:0]  vLocalLockVec_4_payload;
  reg                 vLocalVec_4_rValid;
  reg        [255:0]  vLocalVec_4_rData;
  (* keep = "true" *) wire                vLocalLockVec_5_valid;
  wire                vLocalLockVec_5_ready;
  wire       [255:0]  vLocalLockVec_5_payload;
  reg                 vLocalVec_5_rValid;
  reg        [255:0]  vLocalVec_5_rData;
  (* keep = "true" *) wire                vLocalLockVec_6_valid;
  wire                vLocalLockVec_6_ready;
  wire       [255:0]  vLocalLockVec_6_payload;
  reg                 vLocalVec_6_rValid;
  reg        [255:0]  vLocalVec_6_rData;
  (* keep = "true" *) wire                vLocalLockVec_7_valid;
  wire                vLocalLockVec_7_ready;
  wire       [255:0]  vLocalLockVec_7_payload;
  reg                 vLocalVec_7_rValid;
  reg        [255:0]  vLocalVec_7_rData;
  (* keep = "true" *) reg                 selVLocalVec_0;
  (* keep = "true" *) reg                 selVLocalVec_1;
  (* keep = "true" *) reg                 selVLocalVec_2;
  (* keep = "true" *) reg                 selVLocalVec_3;
  (* keep = "true" *) reg                 selVLocalVec_4;
  (* keep = "true" *) reg                 selVLocalVec_5;
  (* keep = "true" *) reg                 selVLocalVec_6;
  (* keep = "true" *) reg                 selVLocalVec_7;
  wire                vLocal_valid;
  reg                 vLocal_ready;
  (* max_fanout = 100 *) wire                vLocalLock_valid;
  wire                vLocalLock_ready;
  reg                 vLocal_rValid;
  reg        [0:0]    select_1;
  reg        [0:0]    select_1_delay_1;
  reg        [0:0]    select_1_delay_2;
  reg        [0:0]    select_1_delay_3;
  reg        [0:0]    selectPreDly;
  reg        [0:0]    selectDly;
  wire                pushVld;
  wire       [255:0]  convOutSlice_0;
  wire       [255:0]  convOutSlice_1;
  wire       [255:0]  convOutSlice_2;
  wire       [255:0]  convOutSlice_3;
  wire       [255:0]  convOutSlice_4;
  wire       [255:0]  convOutSlice_5;
  wire       [255:0]  convOutSlice_6;
  wire       [255:0]  convOutSlice_7;
  (* keep = "true" *) reg        [0:0]    selectCopy_0;
  (* keep = "true" *) reg        [0:0]    selectCopy_1;
  (* keep = "true" *) reg        [0:0]    selectCopy_2;
  (* keep = "true" *) reg        [0:0]    selectCopy_3;
  (* keep = "true" *) reg        [0:0]    selectCopy_4;
  (* keep = "true" *) reg        [0:0]    selectCopy_5;
  (* keep = "true" *) reg        [0:0]    selectCopy_6;
  (* keep = "true" *) reg        [0:0]    selectCopy_7;
  wire       [255:0]  toFifo_0;
  wire       [255:0]  toFifo_1;
  wire       [255:0]  toFifo_2;
  wire       [255:0]  toFifo_3;
  wire       [255:0]  toFifo_4;
  wire       [255:0]  toFifo_5;
  wire       [255:0]  toFifo_6;
  wire       [255:0]  toFifo_7;
  wire       [2047:0] pushPayload;
  reg                 pushVld_regNext;
  reg        [2047:0] pushPayload_regNext;
  reg                 ready;
  reg                 muxOut_valid;
  reg        [2047:0] muxOut_tdata;
  reg        [5:0]    muxOut_tuser;
  wire                muxOutFlow_valid;
  wire       [5:0]    muxOutFlow_tuser;
  wire                toResFlow_valid;
  wire                p2sInFlow_valid;
  wire       [5:0]    p2sInFlow_tuser;
  reg        [2047:0] payloadDly;
  reg        [5:0]    tagDly;
  reg                 selPrefillSqrDly;
  reg        [3:0]    tensorCnt;
  wire                tensorOvf;
  reg        [4:0]    layerCnt;
  reg        [4:0]    layerBound;
  wire                layerOvf;
  wire                prefillLayerCond;
  reg                 p2sInFlow_valid_regNext;
  reg                 t_io_toResBuf_valid;
  reg        [3:0]    vecInCnt;
  wire                vecInCntOvf;
  (* max_fanout = 100 *) reg                 directOutVld;
  reg        [10:0]   p2sOutCnt;
  wire                p2sOutCntOvf;
  wire                p2sOut_valid;
  wire                p2sOut_payload_last;
  wire       [15:0]   p2sOut_payload_tdata;
  wire       [5:0]    p2sOut_payload_tuser;
  reg                 p2sOut_regNext_valid;
  reg                 p2sOut_regNext_payload_last;
  reg        [15:0]   p2sOut_regNext_payload_tdata;
  reg        [5:0]    p2sOut_regNext_payload_tuser;

  Serial2Parallel_1 s2p (
    .input_valid   (s2p_input_valid            ), //i
    .input_tdata   (io_bus_payload_tdata[511:0]), //i
    .input_tuser   (io_bus_payload_tuser[5:0]  ), //i
    .output_tvalid (s2p_output_tvalid          ), //o
    .output_tdata  (s2p_output_tdata[2047:0]   ), //o
    .output_tuser  (s2p_output_tuser[5:0]      ), //o
    .clk_1_clk     (clk_1_clk                  ), //i
    .clk_1_resetn  (clk_1_resetn               )  //i
  );
  Int4Int8FP16Conv conv (
    .selInt8          (kvHit                      ), //i
    .inputData_tvalid (conv_inputData_tvalid      ), //i
    .inputData_tdata  (io_bus_payload_tdata[511:0]), //i
    .zeroInt4_tvalid  (io_zeroInt4_valid          ), //i
    .zeroInt4_tready  (conv_zeroInt4_tready       ), //o
    .zeroInt4_tdata   (io_zeroInt4_payload[7:0]   ), //i
    .zeroInt8_tvalid  (io_zeroInt8_valid          ), //i
    .zeroInt8_tready  (conv_zeroInt8_tready       ), //o
    .zeroInt8_tdata   (io_zeroInt8_payload[7:0]   ), //i
    .output_tvalid    (conv_output_tvalid         ), //o
    .output_tdata     (conv_output_tdata[2047:0]  ), //o
    .clk_1_clk        (clk_1_clk                  ), //i
    .clk_1_resetn     (clk_1_resetn               )  //i
  );
  LargeBankFifo_10 fifo (
    .io_push_valid   (pushVld_regNext            ), //i
    .io_push_ready   (fifo_io_push_ready         ), //o
    .io_push_payload (pushPayload_regNext[2047:0]), //i
    .io_pop_valid    (fifo_io_pop_valid          ), //o
    .io_pop_ready    (io_wkv_ready               ), //i
    .io_pop_payload  (fifo_io_pop_payload[2047:0]), //o
    .io_occupancy    (fifo_io_occupancy[5:0]     ), //o
    .io_availability (fifo_io_availability[5:0]  ), //o
    .clk_1_clk       (clk_1_clk                  ), //i
    .clk_1_resetn    (clk_1_resetn               )  //i
  );
  StreamAxiFrameFifo p2sBuf (
    .io_input_valid  (p2sInFlow_valid_regNext       ), //i
    .io_input_ready  (p2sBuf_io_input_ready         ), //o
    .io_input_tdata  (payloadDly[2047:0]            ), //i
    .io_input_tuser  (tagDly[5:0]                   ), //i
    .io_output_valid (p2sBuf_io_output_valid        ), //o
    .io_output_ready (p2s_io_input_ready            ), //i
    .io_output_tdata (p2sBuf_io_output_tdata[2047:0]), //o
    .io_output_tuser (p2sBuf_io_output_tuser[5:0]   ), //o
    .clk_1_clk       (clk_1_clk                     ), //i
    .clk_1_resetn    (clk_1_resetn                  )  //i
  );
  Parallel2Serial p2s (
    .io_input_valid  (p2sBuf_io_output_valid        ), //i
    .io_input_ready  (p2s_io_input_ready            ), //o
    .io_input_tdata  (p2sBuf_io_output_tdata[2047:0]), //i
    .io_input_tuser  (p2sBuf_io_output_tuser[5:0]   ), //i
    .io_output_valid (p2s_io_output_valid           ), //o
    .io_output_tdata (p2s_io_output_tdata[15:0]     ), //o
    .io_output_tuser (p2s_io_output_tuser[5:0]      ), //o
    .clk_1_clk       (clk_1_clk                     ), //i
    .clk_1_resetn    (clk_1_resetn                  )  //i
  );
  always @(*) begin
    case(selectDly)
      1'b0 : t_pushVld = conv_output_tvalid;
      default : t_pushVld = (vLocalLock_valid && vLocalLock_ready);
    endcase
  end

  always @(*) begin
    case(selectCopy_0)
      1'b0 : t_toFifo_0 = convOutSlice_0;
      default : t_toFifo_0 = vLocalLockVec_0_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_1)
      1'b0 : t_toFifo_1 = convOutSlice_1;
      default : t_toFifo_1 = vLocalLockVec_1_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_2)
      1'b0 : t_toFifo_2 = convOutSlice_2;
      default : t_toFifo_2 = vLocalLockVec_2_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_3)
      1'b0 : t_toFifo_3 = convOutSlice_3;
      default : t_toFifo_3 = vLocalLockVec_3_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_4)
      1'b0 : t_toFifo_4 = convOutSlice_4;
      default : t_toFifo_4 = vLocalLockVec_4_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_5)
      1'b0 : t_toFifo_5 = convOutSlice_5;
      default : t_toFifo_5 = vLocalLockVec_5_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_6)
      1'b0 : t_toFifo_6 = convOutSlice_6;
      default : t_toFifo_6 = vLocalLockVec_6_payload;
    endcase
  end

  always @(*) begin
    case(selectCopy_7)
      1'b0 : t_toFifo_7 = convOutSlice_7;
      default : t_toFifo_7 = vLocalLockVec_7_payload;
    endcase
  end

  assign kvHit = ((6'h06 == io_bus_payload_tuser) || (6'h08 == io_bus_payload_tuser));
  assign wkvFire = (io_bus_valid && io_bus_ready);
  assign en = (wkvFire && io_bus_payload_last);
  assign vLocalPayload_0 = io_vLocal_tdata[255 : 0];
  assign vLocalPayload_1 = io_vLocal_tdata[511 : 256];
  assign vLocalPayload_2 = io_vLocal_tdata[767 : 512];
  assign vLocalPayload_3 = io_vLocal_tdata[1023 : 768];
  assign vLocalPayload_4 = io_vLocal_tdata[1279 : 1024];
  assign vLocalPayload_5 = io_vLocal_tdata[1535 : 1280];
  assign vLocalPayload_6 = io_vLocal_tdata[1791 : 1536];
  assign vLocalPayload_7 = io_vLocal_tdata[2047 : 1792];
  assign vLocalVec_0_valid = io_vLocal_valid;
  assign vLocalVec_1_valid = io_vLocal_valid;
  assign vLocalVec_2_valid = io_vLocal_valid;
  assign vLocalVec_3_valid = io_vLocal_valid;
  assign vLocalVec_4_valid = io_vLocal_valid;
  assign vLocalVec_5_valid = io_vLocal_valid;
  assign vLocalVec_6_valid = io_vLocal_valid;
  assign vLocalVec_7_valid = io_vLocal_valid;
  assign vLocalVec_0_payload = vLocalPayload_0;
  assign vLocalVec_1_payload = vLocalPayload_1;
  assign vLocalVec_2_payload = vLocalPayload_2;
  assign vLocalVec_3_payload = vLocalPayload_3;
  assign vLocalVec_4_payload = vLocalPayload_4;
  assign vLocalVec_5_payload = vLocalPayload_5;
  assign vLocalVec_6_payload = vLocalPayload_6;
  assign vLocalVec_7_payload = vLocalPayload_7;
  always @(*) begin
    vLocalVec_0_ready = vLocalLockVec_0_ready;
    if((! vLocalLockVec_0_valid)) begin
      vLocalVec_0_ready = 1'b1;
    end
  end

  assign vLocalLockVec_0_valid = vLocalVec_0_rValid;
  assign vLocalLockVec_0_payload = vLocalVec_0_rData;
  always @(*) begin
    vLocalVec_1_ready = vLocalLockVec_1_ready;
    if((! vLocalLockVec_1_valid)) begin
      vLocalVec_1_ready = 1'b1;
    end
  end

  assign vLocalLockVec_1_valid = vLocalVec_1_rValid;
  assign vLocalLockVec_1_payload = vLocalVec_1_rData;
  always @(*) begin
    vLocalVec_2_ready = vLocalLockVec_2_ready;
    if((! vLocalLockVec_2_valid)) begin
      vLocalVec_2_ready = 1'b1;
    end
  end

  assign vLocalLockVec_2_valid = vLocalVec_2_rValid;
  assign vLocalLockVec_2_payload = vLocalVec_2_rData;
  always @(*) begin
    vLocalVec_3_ready = vLocalLockVec_3_ready;
    if((! vLocalLockVec_3_valid)) begin
      vLocalVec_3_ready = 1'b1;
    end
  end

  assign vLocalLockVec_3_valid = vLocalVec_3_rValid;
  assign vLocalLockVec_3_payload = vLocalVec_3_rData;
  always @(*) begin
    vLocalVec_4_ready = vLocalLockVec_4_ready;
    if((! vLocalLockVec_4_valid)) begin
      vLocalVec_4_ready = 1'b1;
    end
  end

  assign vLocalLockVec_4_valid = vLocalVec_4_rValid;
  assign vLocalLockVec_4_payload = vLocalVec_4_rData;
  always @(*) begin
    vLocalVec_5_ready = vLocalLockVec_5_ready;
    if((! vLocalLockVec_5_valid)) begin
      vLocalVec_5_ready = 1'b1;
    end
  end

  assign vLocalLockVec_5_valid = vLocalVec_5_rValid;
  assign vLocalLockVec_5_payload = vLocalVec_5_rData;
  always @(*) begin
    vLocalVec_6_ready = vLocalLockVec_6_ready;
    if((! vLocalLockVec_6_valid)) begin
      vLocalVec_6_ready = 1'b1;
    end
  end

  assign vLocalLockVec_6_valid = vLocalVec_6_rValid;
  assign vLocalLockVec_6_payload = vLocalVec_6_rData;
  always @(*) begin
    vLocalVec_7_ready = vLocalLockVec_7_ready;
    if((! vLocalLockVec_7_valid)) begin
      vLocalVec_7_ready = 1'b1;
    end
  end

  assign vLocalLockVec_7_valid = vLocalVec_7_rValid;
  assign vLocalLockVec_7_payload = vLocalVec_7_rData;
  assign vLocalLockVec_0_ready = selVLocalVec_0;
  assign vLocalLockVec_1_ready = selVLocalVec_1;
  assign vLocalLockVec_2_ready = selVLocalVec_2;
  assign vLocalLockVec_3_ready = selVLocalVec_3;
  assign vLocalLockVec_4_ready = selVLocalVec_4;
  assign vLocalLockVec_5_ready = selVLocalVec_5;
  assign vLocalLockVec_6_ready = selVLocalVec_6;
  assign vLocalLockVec_7_ready = selVLocalVec_7;
  assign vLocal_valid = io_vLocal_valid;
  always @(*) begin
    vLocal_ready = vLocalLock_ready;
    if((! vLocalLock_valid)) begin
      vLocal_ready = 1'b1;
    end
  end

  assign vLocalLock_valid = vLocal_rValid;
  assign vLocalLock_ready = selVLocal;
  assign s2p_input_valid = (wkvFire && selExtTokenSqr);
  assign conv_inputData_tvalid = (wkvFire && (! selExtTokenSqr));
  assign io_zeroInt4_ready = conv_zeroInt4_tready;
  assign io_zeroInt8_ready = conv_zeroInt8_tready;
  assign io_wkv_valid = fifo_io_pop_valid;
  assign io_wkv_payload = fifo_io_pop_payload;
  assign pushVld = t_pushVld;
  assign convOutSlice_0 = conv_output_tdata[255 : 0];
  assign convOutSlice_1 = conv_output_tdata[511 : 256];
  assign convOutSlice_2 = conv_output_tdata[767 : 512];
  assign convOutSlice_3 = conv_output_tdata[1023 : 768];
  assign convOutSlice_4 = conv_output_tdata[1279 : 1024];
  assign convOutSlice_5 = conv_output_tdata[1535 : 1280];
  assign convOutSlice_6 = conv_output_tdata[1791 : 1536];
  assign convOutSlice_7 = conv_output_tdata[2047 : 1792];
  assign toFifo_0 = t_toFifo_0;
  assign toFifo_1 = t_toFifo_1;
  assign toFifo_2 = t_toFifo_2;
  assign toFifo_3 = t_toFifo_3;
  assign toFifo_4 = t_toFifo_4;
  assign toFifo_5 = t_toFifo_5;
  assign toFifo_6 = t_toFifo_6;
  assign toFifo_7 = t_toFifo_7;
  assign pushPayload = {toFifo_7,{toFifo_6,{toFifo_5,{toFifo_4,{toFifo_3,{toFifo_2,{toFifo_1,toFifo_0}}}}}}};
  always @(*) begin
    select_1 = 1'b0;
    if(selVLocal) begin
      select_1 = 1'b1;
    end
  end

  always @(*) begin
    io_bus_ready = ready;
    if(selVLocal) begin
      io_bus_ready = 1'b0;
    end
    if(selExtTokenSqr) begin
      io_bus_ready = (! status_logitsGen);
    end
  end

  assign toResFlow_valid = (muxOutFlow_valid && ((((muxOutFlow_tuser == 6'h1f) || (muxOutFlow_tuser == 6'h0)) || (muxOutFlow_tuser == 6'h01)) || (muxOutFlow_tuser == 6'h02)));
  assign p2sInFlow_valid = (muxOutFlow_valid && (((((muxOutFlow_tuser == 6'h1f) || (muxOutFlow_tuser == 6'h1c)) || (muxOutFlow_tuser == 6'h0)) || (muxOutFlow_tuser == 6'h01)) || (muxOutFlow_tuser == 6'h02)));
  assign p2sInFlow_tuser = muxOutFlow_tuser;
  assign muxOutFlow_valid = muxOut_valid;
  assign muxOutFlow_tuser = muxOut_tuser;
  always @(*) begin
    muxOut_valid = (io_vecIn_valid && (io_vecIn_tuser == 6'h1f));
    if(selPrefillSqrDly) begin
      muxOut_valid = s2p_output_tvalid;
    end
  end

  always @(*) begin
    muxOut_tdata = io_vecIn_tdata;
    if(selPrefillSqrDly) begin
      muxOut_tdata = s2p_output_tdata;
    end
  end

  always @(*) begin
    muxOut_tuser = 6'h1f;
    if(selPrefillSqrDly) begin
      muxOut_tuser = s2p_output_tuser;
    end
  end

  assign tensorOvf = (tensorCnt == 4'b1011);
  assign layerOvf = (layerCnt == layerBound);
  assign prefillLayerCond = (muxOut_tuser == 6'h0);
  assign io_toResBuf_valid = t_io_toResBuf_valid;
  assign io_toResBuf_payload = payloadDly;
  assign vecInCntOvf = (vecInCnt == 4'b1011);
  assign io_directOut_valid = directOutVld;
  assign io_directOut_tuser = 6'h0;
  assign io_directOut_tdata = 2048'h0;
  assign p2sOutCntOvf = (p2sOutCnt == 11'h5ff);
  assign p2sOut_valid = p2s_io_output_valid;
  assign p2sOut_payload_tdata = p2s_io_output_tdata;
  assign p2sOut_payload_tuser = p2s_io_output_tuser;
  assign p2sOut_payload_last = p2sOutCntOvf;
  assign io_p2sOut_valid = p2sOut_regNext_valid;
  assign io_p2sOut_payload_last = p2sOut_regNext_payload_last;
  assign io_p2sOut_payload_tdata = p2sOut_regNext_payload_tdata;
  assign io_p2sOut_payload_tuser = p2sOut_regNext_payload_tuser;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      selExtTokenSqr <= 1'b1;
      selVLocal <= 1'b0;
      vLocalVec_0_rValid <= 1'b0;
      vLocalVec_1_rValid <= 1'b0;
      vLocalVec_2_rValid <= 1'b0;
      vLocalVec_3_rValid <= 1'b0;
      vLocalVec_4_rValid <= 1'b0;
      vLocalVec_5_rValid <= 1'b0;
      vLocalVec_6_rValid <= 1'b0;
      vLocalVec_7_rValid <= 1'b0;
      selVLocalVec_0 <= 1'b0;
      selVLocalVec_1 <= 1'b0;
      selVLocalVec_2 <= 1'b0;
      selVLocalVec_3 <= 1'b0;
      selVLocalVec_4 <= 1'b0;
      selVLocalVec_5 <= 1'b0;
      selVLocalVec_6 <= 1'b0;
      selVLocalVec_7 <= 1'b0;
      vLocal_rValid <= 1'b0;
      select_1_delay_1 <= 1'b0;
      select_1_delay_2 <= 1'b0;
      select_1_delay_3 <= 1'b0;
      selectPreDly <= 1'b0;
      selectDly <= 1'b0;
      selectCopy_0 <= 1'b0;
      selectCopy_1 <= 1'b0;
      selectCopy_2 <= 1'b0;
      selectCopy_3 <= 1'b0;
      selectCopy_4 <= 1'b0;
      selectCopy_5 <= 1'b0;
      selectCopy_6 <= 1'b0;
      selectCopy_7 <= 1'b0;
      pushVld_regNext <= 1'b0;
      ready <= 1'b0;
      selPrefillSqrDly <= 1'b0;
      tensorCnt <= 4'b0000;
      layerCnt <= 5'h0;
      layerBound <= 5'h1b;
      p2sInFlow_valid_regNext <= 1'b0;
      t_io_toResBuf_valid <= 1'b0;
      vecInCnt <= 4'b0000;
      directOutVld <= 1'b0;
      p2sOutCnt <= 11'h0;
      p2sOut_regNext_valid <= 1'b0;
    end else begin
      if(en) begin
        if(status_tokenNextHit) begin
          selExtTokenSqr <= 1'b1;
        end
        if(status_vNextHit) begin
          selVLocal <= 1'b1;
        end
      end
      if(((wkvFire && io_bus_payload_last) && selExtTokenSqr)) begin
        selExtTokenSqr <= 1'b0;
      end
      if(vLocalVec_0_ready) begin
        vLocalVec_0_rValid <= vLocalVec_0_valid;
      end
      if(vLocalVec_1_ready) begin
        vLocalVec_1_rValid <= vLocalVec_1_valid;
      end
      if(vLocalVec_2_ready) begin
        vLocalVec_2_rValid <= vLocalVec_2_valid;
      end
      if(vLocalVec_3_ready) begin
        vLocalVec_3_rValid <= vLocalVec_3_valid;
      end
      if(vLocalVec_4_ready) begin
        vLocalVec_4_rValid <= vLocalVec_4_valid;
      end
      if(vLocalVec_5_ready) begin
        vLocalVec_5_rValid <= vLocalVec_5_valid;
      end
      if(vLocalVec_6_ready) begin
        vLocalVec_6_rValid <= vLocalVec_6_valid;
      end
      if(vLocalVec_7_ready) begin
        vLocalVec_7_rValid <= vLocalVec_7_valid;
      end
      if(en) begin
        if(status_vNextHit) begin
          selVLocalVec_0 <= 1'b1;
          selVLocalVec_1 <= 1'b1;
          selVLocalVec_2 <= 1'b1;
          selVLocalVec_3 <= 1'b1;
          selVLocalVec_4 <= 1'b1;
          selVLocalVec_5 <= 1'b1;
          selVLocalVec_6 <= 1'b1;
          selVLocalVec_7 <= 1'b1;
        end
      end
      if(vLocalLockVec_0_valid) begin
        selVLocalVec_0 <= 1'b0;
      end
      if(vLocalLockVec_1_valid) begin
        selVLocalVec_1 <= 1'b0;
      end
      if(vLocalLockVec_2_valid) begin
        selVLocalVec_2 <= 1'b0;
      end
      if(vLocalLockVec_3_valid) begin
        selVLocalVec_3 <= 1'b0;
      end
      if(vLocalLockVec_4_valid) begin
        selVLocalVec_4 <= 1'b0;
      end
      if(vLocalLockVec_5_valid) begin
        selVLocalVec_5 <= 1'b0;
      end
      if(vLocalLockVec_6_valid) begin
        selVLocalVec_6 <= 1'b0;
      end
      if(vLocalLockVec_7_valid) begin
        selVLocalVec_7 <= 1'b0;
      end
      if(vLocal_ready) begin
        vLocal_rValid <= vLocal_valid;
      end
      if(vLocalLock_valid) begin
        selVLocal <= 1'b0;
      end
      select_1_delay_1 <= select_1;
      select_1_delay_2 <= select_1_delay_1;
      select_1_delay_3 <= select_1_delay_2;
      selectPreDly <= select_1_delay_3;
      selectDly <= selectPreDly;
      selectCopy_0 <= selectPreDly;
      selectCopy_1 <= selectPreDly;
      selectCopy_2 <= selectPreDly;
      selectCopy_3 <= selectPreDly;
      selectCopy_4 <= selectPreDly;
      selectCopy_5 <= selectPreDly;
      selectCopy_6 <= selectPreDly;
      selectCopy_7 <= selectPreDly;
      pushVld_regNext <= pushVld;
      ready <= (6'h08 <= fifo_io_availability);
      selPrefillSqrDly <= selExtTokenSqr;
      if(toResFlow_valid) begin
        tensorCnt <= (tensorCnt + 4'b0001);
        if(tensorOvf) begin
          tensorCnt <= 4'b0000;
          if((muxOut_tuser != 6'h1f)) begin
            layerBound <= (prefillLayerCond ? 5'h1a : 5'h1b);
          end
          if((muxOut_tuser == 6'h1f)) begin
            layerCnt <= (layerCnt + 5'h01);
          end
          if(layerOvf) begin
            layerCnt <= 5'h0;
          end
        end
      end
      p2sInFlow_valid_regNext <= p2sInFlow_valid;
      t_io_toResBuf_valid <= (toResFlow_valid && (! layerOvf));
      if(muxOut_valid) begin
        vecInCnt <= (vecInCnt + 4'b0001);
        if(vecInCntOvf) begin
          vecInCnt <= 4'b0000;
        end
      end
      directOutVld <= (muxOut_valid && (vecInCnt == 4'b0000));
      if(p2s_io_output_valid) begin
        p2sOutCnt <= (p2sOutCnt + 11'h001);
        if(p2sOutCntOvf) begin
          p2sOutCnt <= 11'h0;
        end
      end
      p2sOut_regNext_valid <= p2sOut_valid;
    end
  end

  always @(posedge clk_1_clk) begin
    if(vLocalVec_0_ready) begin
      vLocalVec_0_rData <= vLocalVec_0_payload;
    end
    if(vLocalVec_1_ready) begin
      vLocalVec_1_rData <= vLocalVec_1_payload;
    end
    if(vLocalVec_2_ready) begin
      vLocalVec_2_rData <= vLocalVec_2_payload;
    end
    if(vLocalVec_3_ready) begin
      vLocalVec_3_rData <= vLocalVec_3_payload;
    end
    if(vLocalVec_4_ready) begin
      vLocalVec_4_rData <= vLocalVec_4_payload;
    end
    if(vLocalVec_5_ready) begin
      vLocalVec_5_rData <= vLocalVec_5_payload;
    end
    if(vLocalVec_6_ready) begin
      vLocalVec_6_rData <= vLocalVec_6_payload;
    end
    if(vLocalVec_7_ready) begin
      vLocalVec_7_rData <= vLocalVec_7_payload;
    end
    pushPayload_regNext <= pushPayload;
    payloadDly <= muxOut_tdata;
    tagDly <= muxOut_tuser;
    p2sOut_regNext_payload_last <= p2sOut_payload_last;
    p2sOut_regNext_payload_tdata <= p2sOut_payload_tdata;
    p2sOut_regNext_payload_tuser <= p2sOut_payload_tuser;
  end


endmodule

