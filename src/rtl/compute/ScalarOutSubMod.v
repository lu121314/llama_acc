// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module ScalarOutSubMod (
  input  wire          io_p2sOut_valid,
  input  wire [15:0]   io_p2sOut_tdata,
  input  wire [5:0]    io_p2sOut_tuser,
  input  wire          io_allReduceOut_valid,
  input  wire [15:0]   io_allReduceOut_tdata,
  input  wire [5:0]    io_allReduceOut_tuser,
  input  wire          io_softmaxOut_valid,
  input  wire          io_softmaxOut_payload_last,
  input  wire [15:0]   io_softmaxOut_payload_tdata,
  input  wire [5:0]    io_softmaxOut_payload_tuser,
  output wire          io_scalarOut_valid,
  input  wire          io_scalarOut_ready,
  output wire [15:0]   io_scalarOut_payload,
  input  wire          io_allGatherIndexIn_valid,
  input  wire          io_allGatherIndexIn_payload_last,
  input  wire [15:0]   io_allGatherIndexIn_payload_tdata,
  input  wire [5:0]    io_allGatherIndexIn_payload_tuser,
  output wire          io_zfIndexOut_valid,
  output wire          io_zfIndexOut_payload_last,
  output wire [15:0]   io_zfIndexOut_payload_tdata,
  output wire [5:0]    io_zfIndexOut_payload_tuser,
  output wire          io_gateIndexOut_valid,
  output wire          io_gateIndexOut_payload_last,
  output wire [15:0]   io_gateIndexOut_payload_tdata,
  output wire [5:0]    io_gateIndexOut_payload_tuser,
  output wire          io_ugIndexOut_valid,
  output wire          io_ugIndexOut_payload_last,
  output wire [15:0]   io_ugIndexOut_payload_tdata,
  output wire [5:0]    io_ugIndexOut_payload_tuser,
  input  wire          clk_1_clk,
  input  wire          status_enPredictor,
  input  wire          status_enFatRelu,
  output wire          silu_to_valid,
  output wire [15:0]   silu_to_payload,
  input  wire          silu_from_valid,
  input  wire [15:0]   silu_from_payload,
  input  wire          clk_1_resetn
);

  wire                ug_gateIndexOut_valid;
  wire                ug_gateIndexOut_payload_last;
  wire       [15:0]   ug_gateIndexOut_payload_tdata;
  wire       [5:0]    ug_gateIndexOut_payload_tuser;
  wire                ug_ugIndexOut_valid;
  wire                ug_ugIndexOut_payload_last;
  wire       [15:0]   ug_ugIndexOut_payload_tdata;
  wire       [5:0]    ug_ugIndexOut_payload_tuser;
  wire                ug_ugOut_tvalid;
  wire                ug_ugOut_tlast;
  wire       [15:0]   ug_ugOut_tdata;
  wire       [5:0]    ug_ugOut_tuser;
  wire                ug_silu_to_valid;
  wire       [15:0]   ug_silu_to_payload;
  wire                scalarFifo_io_push_ready;
  wire                scalarFifo_io_pop_valid;
  wire                scalarFifo_io_pop_payload_last;
  wire       [15:0]   scalarFifo_io_pop_payload_fragment;
  wire       [23:0]   t_io_zfIndexOut_valid;
  wire       [22:0]   t_io_zfIndexOut_payload_last;
  wire       [21:0]   t_io_zfIndexOut_payload_tdata;
  reg                 sOut_ug_gateIndexOut_regNext_valid;
  reg                 sOut_ug_gateIndexOut_regNext_payload_last;
  reg        [15:0]   sOut_ug_gateIndexOut_regNext_payload_tdata;
  reg        [5:0]    sOut_ug_gateIndexOut_regNext_payload_tuser;
  reg                 sOut_ug_ugIndexOut_regNext_valid;
  reg                 sOut_ug_ugIndexOut_regNext_payload_last;
  reg        [15:0]   sOut_ug_ugIndexOut_regNext_payload_tdata;
  reg        [5:0]    sOut_ug_ugIndexOut_regNext_payload_tuser;
  wire                ug2Axpy_valid;
  wire                ug2Axpy_payload_last;
  wire       [15:0]   ug2Axpy_payload_fragment;
  wire                softmax2Axpy_valid;
  wire                softmax2Axpy_payload_last;
  wire       [15:0]   softmax2Axpy_payload_fragment;
  wire                axpyInMux_valid;
  wire                axpyInMux_payload_last;
  wire       [15:0]   axpyInMux_payload_fragment;
  wire                axpyErr;
  reg                 axpyIn_tvalid;
  reg                 axpyIn_tlast;
  reg        [15:0]   axpyIn_tdata;

  UGMul ug (
    .predIndexIn_valid          (io_allGatherIndexIn_valid              ), //i
    .predIndexIn_payload_last   (io_allGatherIndexIn_payload_last       ), //i
    .predIndexIn_payload_tdata  (io_allGatherIndexIn_payload_tdata[15:0]), //i
    .predIndexIn_payload_tuser  (io_allGatherIndexIn_payload_tuser[5:0] ), //i
    .gateIndexOut_valid         (ug_gateIndexOut_valid                  ), //o
    .gateIndexOut_payload_last  (ug_gateIndexOut_payload_last           ), //o
    .gateIndexOut_payload_tdata (ug_gateIndexOut_payload_tdata[15:0]    ), //o
    .gateIndexOut_payload_tuser (ug_gateIndexOut_payload_tuser[5:0]     ), //o
    .ugIndexOut_valid           (ug_ugIndexOut_valid                    ), //o
    .ugIndexOut_payload_last    (ug_ugIndexOut_payload_last             ), //o
    .ugIndexOut_payload_tdata   (ug_ugIndexOut_payload_tdata[15:0]      ), //o
    .ugIndexOut_payload_tuser   (ug_ugIndexOut_payload_tuser[5:0]       ), //o
    .allReduceOut_valid         (io_allReduceOut_valid                  ), //i
    .allReduceOut_tdata         (io_allReduceOut_tdata[15:0]            ), //i
    .allReduceOut_tuser         (io_allReduceOut_tuser[5:0]             ), //i
    .ugOut_tvalid               (ug_ugOut_tvalid                        ), //o
    .ugOut_tlast                (ug_ugOut_tlast                         ), //o
    .ugOut_tdata                (ug_ugOut_tdata[15:0]                   ), //o
    .ugOut_tuser                (ug_ugOut_tuser[5:0]                    ), //o
    .status_enPredictor         (status_enPredictor                     ), //i
    .status_enFatRelu           (status_enFatRelu                       ), //i
    .silu_to_valid              (ug_silu_to_valid                       ), //o
    .silu_to_payload            (ug_silu_to_payload[15:0]               ), //o
    .silu_from_valid            (silu_from_valid                        ), //i
    .silu_from_payload          (silu_from_payload[15:0]                ), //i
    .clk_1_clk                  (clk_1_clk                              ), //i
    .clk_1_resetn               (clk_1_resetn                           )  //i
  );
  URAM16x16384Fifo_2 scalarFifo (
    .io_push_valid            (axpyIn_tvalid                           ), //i
    .io_push_ready            (scalarFifo_io_push_ready                ), //o
    .io_push_payload_last     (axpyIn_tlast                            ), //i
    .io_push_payload_fragment (axpyIn_tdata[15:0]                      ), //i
    .io_pop_valid             (scalarFifo_io_pop_valid                 ), //o
    .io_pop_ready             (io_scalarOut_ready                      ), //i
    .io_pop_payload_last      (scalarFifo_io_pop_payload_last          ), //o
    .io_pop_payload_fragment  (scalarFifo_io_pop_payload_fragment[15:0]), //o
    .clk_1_clk                (clk_1_clk                               ), //i
    .clk_1_resetn             (clk_1_resetn                            )  //i
  );
  assign silu_to_valid = ug_silu_to_valid;
  assign silu_to_payload = ug_silu_to_payload;
  assign t_io_zfIndexOut_valid = 24'h0;
  assign io_zfIndexOut_valid = t_io_zfIndexOut_valid[0];
  assign t_io_zfIndexOut_payload_last = t_io_zfIndexOut_valid[23 : 1];
  assign io_zfIndexOut_payload_last = t_io_zfIndexOut_payload_last[0];
  assign t_io_zfIndexOut_payload_tdata = t_io_zfIndexOut_payload_last[22 : 1];
  assign io_zfIndexOut_payload_tdata = t_io_zfIndexOut_payload_tdata[15 : 0];
  assign io_zfIndexOut_payload_tuser = t_io_zfIndexOut_payload_tdata[21 : 16];
  assign io_gateIndexOut_valid = sOut_ug_gateIndexOut_regNext_valid;
  assign io_gateIndexOut_payload_last = sOut_ug_gateIndexOut_regNext_payload_last;
  assign io_gateIndexOut_payload_tdata = sOut_ug_gateIndexOut_regNext_payload_tdata;
  assign io_gateIndexOut_payload_tuser = sOut_ug_gateIndexOut_regNext_payload_tuser;
  assign io_ugIndexOut_valid = sOut_ug_ugIndexOut_regNext_valid;
  assign io_ugIndexOut_payload_last = sOut_ug_ugIndexOut_regNext_payload_last;
  assign io_ugIndexOut_payload_tdata = sOut_ug_ugIndexOut_regNext_payload_tdata;
  assign io_ugIndexOut_payload_tuser = sOut_ug_ugIndexOut_regNext_payload_tuser;
  assign ug2Axpy_valid = (ug_ugOut_tvalid && (ug_ugOut_tuser == 6'h19));
  assign ug2Axpy_payload_fragment = ug_ugOut_tdata;
  assign ug2Axpy_payload_last = ug_ugOut_tlast;
  assign softmax2Axpy_valid = (io_softmaxOut_valid && (io_softmaxOut_payload_tuser == 6'h0e));
  assign softmax2Axpy_payload_fragment = io_softmaxOut_payload_tdata;
  assign softmax2Axpy_payload_last = io_softmaxOut_payload_last;
  assign axpyErr = 1'b0;
  assign axpyInMux_valid = (|{softmax2Axpy_valid,ug2Axpy_valid});
  assign axpyInMux_payload_last = (ug2Axpy_valid ? ug2Axpy_payload_last : softmax2Axpy_payload_last);
  assign axpyInMux_payload_fragment = (ug2Axpy_valid ? ug2Axpy_payload_fragment : softmax2Axpy_payload_fragment);
  assign io_scalarOut_valid = scalarFifo_io_pop_valid;
  assign io_scalarOut_payload = scalarFifo_io_pop_payload_fragment;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      sOut_ug_gateIndexOut_regNext_valid <= 1'b0;
      sOut_ug_ugIndexOut_regNext_valid <= 1'b0;
      axpyIn_tvalid <= 1'b0;
    end else begin
      sOut_ug_gateIndexOut_regNext_valid <= ug_gateIndexOut_valid;
      sOut_ug_ugIndexOut_regNext_valid <= ug_ugIndexOut_valid;
      axpyIn_tvalid <= axpyInMux_valid;
    end
  end

  always @(posedge clk_1_clk) begin
    sOut_ug_gateIndexOut_regNext_payload_last <= ug_gateIndexOut_payload_last;
    sOut_ug_gateIndexOut_regNext_payload_tdata <= ug_gateIndexOut_payload_tdata;
    sOut_ug_gateIndexOut_regNext_payload_tuser <= ug_gateIndexOut_payload_tuser;
    sOut_ug_ugIndexOut_regNext_payload_last <= ug_ugIndexOut_payload_last;
    sOut_ug_ugIndexOut_regNext_payload_tdata <= ug_ugIndexOut_payload_tdata;
    sOut_ug_ugIndexOut_regNext_payload_tuser <= ug_ugIndexOut_payload_tuser;
    axpyIn_tlast <= axpyInMux_payload_last;
    axpyIn_tdata <= axpyInMux_payload_fragment;
  end


endmodule

