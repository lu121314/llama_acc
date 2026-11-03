// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module QuantWrapper_1 (
  input  wire          io_toBeQuant_0_valid,
  input  wire [15:0]   io_toBeQuant_0_tdata,
  input  wire [5:0]    io_toBeQuant_0_tuser,
  input  wire          io_toBeQuant_1_valid,
  input  wire [15:0]   io_toBeQuant_1_tdata,
  input  wire [5:0]    io_toBeQuant_1_tuser,
  output wire          io_quantZero_valid,
  output wire [7:0]    io_quantZero_payload,
  output wire          io_quantScale_valid,
  output wire [15:0]   io_quantScale_payload,
  output wire          io_afterQuant_valid,
  output wire          io_afterQuant_payload_last,
  output wire [7:0]    io_afterQuant_payload_fragment,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                scaleFifo_io_pop_ready;
  wire                zeroFifo_io_pop_ready;
  wire                find_max_tvalid;
  wire       [15:0]   find_max_tdata;
  wire                find_min_tvalid;
  wire       [15:0]   find_min_tdata;
  wire                getCfg_scale_tvalid;
  wire       [15:0]   getCfg_scale_tdata;
  wire                getCfg_zero_tvalid;
  wire       [7:0]    getCfg_zero_tdata;
  wire                quant_zero_tready;
  wire                quant_q_tvalid;
  wire       [7:0]    quant_q_tdata;
  wire                xFifo_io_push_ready;
  wire                xFifo_io_pop_valid;
  wire       [15:0]   xFifo_io_pop_payload;
  wire       [10:0]   xFifo_io_occupancy;
  wire       [10:0]   xFifo_io_availability;
  wire                scaleFifo_io_push_ready;
  wire                scaleFifo_io_pop_valid;
  wire       [15:0]   scaleFifo_io_pop_payload;
  wire       [5:0]    scaleFifo_io_occupancy;
  wire       [5:0]    scaleFifo_io_availability;
  wire                zeroFifo_io_push_ready;
  wire                zeroFifo_io_pop_valid;
  wire       [7:0]    zeroFifo_io_pop_payload;
  wire       [5:0]    zeroFifo_io_occupancy;
  wire       [5:0]    zeroFifo_io_availability;
  wire       [1:0]    t_kToBeQuant_tuser;
  wire       [1:0]    t_vToBeQuant_tuser;
  wire       [6:0]    t_t_io_pop_ready_2;
  wire       [0:0]    t_t_io_pop_ready_2_1;
  wire       [6:0]    t_t_io_pop_ready_7;
  wire       [0:0]    t_t_io_pop_ready_7_1;
  reg                 kToBeQuant_valid;
  reg        [15:0]   kToBeQuant_tdata;
  reg        [5:0]    kToBeQuant_tuser;
  reg                 vToBeQuant_valid;
  reg        [15:0]   vToBeQuant_tdata;
  reg        [5:0]    vToBeQuant_tuser;
  wire                toBeQuant_tvalid;
  wire       [15:0]   toBeQuant_tdata;
  wire       [5:0]    toBeQuant_tuser;
  wire                t_scaleRep_valid;
  reg                 t_io_pop_ready;
  reg                 t_io_pop_ready_1;
  reg        [6:0]    t_io_pop_ready_2;
  reg        [6:0]    t_io_pop_ready_3;
  wire                t_io_pop_ready_4;
  wire                scaleRep_valid;
  wire                scaleRep_ready;
  wire       [15:0]   scaleRep_payload;
  reg                 t_scaleRep_valid_1;
  reg        [15:0]   t_scaleRep_payload;
  wire                t_zeroRep_valid;
  reg                 t_io_pop_ready_5;
  reg                 t_io_pop_ready_6;
  reg        [6:0]    t_io_pop_ready_7;
  reg        [6:0]    t_io_pop_ready_8;
  wire                t_io_pop_ready_9;
  wire                zeroRep_valid;
  wire                zeroRep_ready;
  wire       [7:0]    zeroRep_payload;
  reg                 t_zeroRep_valid_1;
  reg        [7:0]    t_zeroRep_payload;
  wire                joinEvent_valid;
  wire                joinEvent_ready;
  wire                joinEventFire;
  wire                afterQuant_valid;
  wire                afterQuant_payload_last;
  wire       [7:0]    afterQuant_payload_fragment;
  reg        [6:0]    cnt;
  wire                cntOvf;
  reg                 afterQuant_regNext_valid;
  reg                 afterQuant_regNext_payload_last;
  reg        [7:0]    afterQuant_regNext_payload_fragment;
  reg                 quant_getCfg_scale_regNext_valid;
  reg        [15:0]   quant_getCfg_scale_regNext_payload;
  reg                 quant_getCfg_zero_regNext_valid;
  reg        [7:0]    quant_getCfg_zero_regNext_payload;

  assign t_kToBeQuant_tuser = {(io_toBeQuant_0_tuser == 6'h12),(io_toBeQuant_0_tuser == 6'h09)};
  assign t_vToBeQuant_tuser = {(io_toBeQuant_1_tuser == 6'h13),(io_toBeQuant_1_tuser == 6'h07)};
  assign t_t_io_pop_ready_2_1 = t_io_pop_ready_1;
  assign t_t_io_pop_ready_2 = {6'd0, t_t_io_pop_ready_2_1};
  assign t_t_io_pop_ready_7_1 = t_io_pop_ready_6;
  assign t_t_io_pop_ready_7 = {6'd0, t_t_io_pop_ready_7_1};
  FindRange_1 find (
    .x_tvalid     (toBeQuant_tvalid     ), //i
    .x_tdata      (toBeQuant_tdata[15:0]), //i
    .max_tvalid   (find_max_tvalid      ), //o
    .max_tdata    (find_max_tdata[15:0] ), //o
    .min_tvalid   (find_min_tvalid      ), //o
    .min_tdata    (find_min_tdata[15:0] ), //o
    .cfg_length   (16'h007f             ), //i
    .clk_0_clk    (clk_0_clk            ), //i
    .clk_0_resetn (clk_0_resetn         )  //i
  );
  GetScaleZero_1 getCfg (
    .max_tvalid   (find_max_tvalid         ), //i
    .max_tdata    (find_max_tdata[15:0]    ), //i
    .min_tvalid   (find_min_tvalid         ), //i
    .min_tdata    (find_min_tdata[15:0]    ), //i
    .scale_tvalid (getCfg_scale_tvalid     ), //o
    .scale_tdata  (getCfg_scale_tdata[15:0]), //o
    .zero_tvalid  (getCfg_zero_tvalid      ), //o
    .zero_tdata   (getCfg_zero_tdata[7:0]  ), //o
    .clk_0_clk    (clk_0_clk               ), //i
    .clk_0_resetn (clk_0_resetn            )  //i
  );
  LinearQuant_1 quant (
    .x_tvalid     (joinEventFire             ), //i
    .x_tdata      (xFifo_io_pop_payload[15:0]), //i
    .scale_tvalid (joinEventFire             ), //i
    .scale_tdata  (scaleRep_payload[15:0]    ), //i
    .zero_tvalid  (zeroRep_valid             ), //i
    .zero_tready  (quant_zero_tready         ), //o
    .zero_tdata   (zeroRep_payload[7:0]      ), //i
    .q_tvalid     (quant_q_tvalid            ), //o
    .q_tdata      (quant_q_tdata[7:0]        ), //o
    .clk_0_clk    (clk_0_clk                 ), //i
    .clk_0_resetn (clk_0_resetn              )  //i
  );
  StreamFifo_113 xFifo (
    .io_push_valid   (toBeQuant_tvalid           ), //i
    .io_push_ready   (xFifo_io_push_ready        ), //o
    .io_push_payload (toBeQuant_tdata[15:0]      ), //i
    .io_pop_valid    (xFifo_io_pop_valid         ), //o
    .io_pop_ready    (joinEventFire              ), //i
    .io_pop_payload  (xFifo_io_pop_payload[15:0] ), //o
    .io_flush        (1'b0                       ), //i
    .io_occupancy    (xFifo_io_occupancy[10:0]   ), //o
    .io_availability (xFifo_io_availability[10:0]), //o
    .clk_0_clk       (clk_0_clk                  ), //i
    .clk_0_resetn    (clk_0_resetn               )  //i
  );
  StreamFifo_114 scaleFifo (
    .io_push_valid   (getCfg_scale_tvalid           ), //i
    .io_push_ready   (scaleFifo_io_push_ready       ), //o
    .io_push_payload (getCfg_scale_tdata[15:0]      ), //i
    .io_pop_valid    (scaleFifo_io_pop_valid        ), //o
    .io_pop_ready    (scaleFifo_io_pop_ready        ), //i
    .io_pop_payload  (scaleFifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                          ), //i
    .io_occupancy    (scaleFifo_io_occupancy[5:0]   ), //o
    .io_availability (scaleFifo_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                     ), //i
    .clk_0_resetn    (clk_0_resetn                  )  //i
  );
  StreamFifo_115 zeroFifo (
    .io_push_valid   (getCfg_zero_tvalid           ), //i
    .io_push_ready   (zeroFifo_io_push_ready       ), //o
    .io_push_payload (getCfg_zero_tdata[7:0]       ), //i
    .io_pop_valid    (zeroFifo_io_pop_valid        ), //o
    .io_pop_ready    (zeroFifo_io_pop_ready        ), //i
    .io_pop_payload  (zeroFifo_io_pop_payload[7:0] ), //o
    .io_flush        (1'b0                         ), //i
    .io_occupancy    (zeroFifo_io_occupancy[5:0]   ), //o
    .io_availability (zeroFifo_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                    ), //i
    .clk_0_resetn    (clk_0_resetn                 )  //i
  );
  assign toBeQuant_tvalid = (|{vToBeQuant_valid,kToBeQuant_valid});
  assign toBeQuant_tdata = (kToBeQuant_valid ? kToBeQuant_tdata : vToBeQuant_tdata);
  assign toBeQuant_tuser = (kToBeQuant_valid ? kToBeQuant_tuser : vToBeQuant_tuser);
  always @(*) begin
    t_io_pop_ready_1 = 1'b0;
    if((t_scaleRep_valid && t_io_pop_ready)) begin
      t_io_pop_ready_1 = 1'b1;
    end
  end

  assign t_io_pop_ready_4 = (t_io_pop_ready_3 == 7'h7f);
  always @(*) begin
    t_io_pop_ready_2 = (t_io_pop_ready_3 + t_t_io_pop_ready_2);
    if(1'b0) begin
      t_io_pop_ready_2 = 7'h0;
    end
  end

  assign t_scaleRep_valid = scaleFifo_io_pop_valid;
  assign scaleFifo_io_pop_ready = (t_io_pop_ready && t_io_pop_ready_4);
  always @(*) begin
    t_io_pop_ready = scaleRep_ready;
    if((! scaleRep_valid)) begin
      t_io_pop_ready = 1'b1;
    end
  end

  assign scaleRep_valid = t_scaleRep_valid_1;
  assign scaleRep_payload = t_scaleRep_payload;
  always @(*) begin
    t_io_pop_ready_6 = 1'b0;
    if((t_zeroRep_valid && t_io_pop_ready_5)) begin
      t_io_pop_ready_6 = 1'b1;
    end
  end

  assign t_io_pop_ready_9 = (t_io_pop_ready_8 == 7'h7f);
  always @(*) begin
    t_io_pop_ready_7 = (t_io_pop_ready_8 + t_t_io_pop_ready_7);
    if(1'b0) begin
      t_io_pop_ready_7 = 7'h0;
    end
  end

  assign t_zeroRep_valid = zeroFifo_io_pop_valid;
  assign zeroFifo_io_pop_ready = (t_io_pop_ready_5 && t_io_pop_ready_9);
  always @(*) begin
    t_io_pop_ready_5 = zeroRep_ready;
    if((! zeroRep_valid)) begin
      t_io_pop_ready_5 = 1'b1;
    end
  end

  assign zeroRep_valid = t_zeroRep_valid_1;
  assign zeroRep_payload = t_zeroRep_payload;
  assign scaleRep_ready = joinEventFire;
  assign joinEvent_valid = (xFifo_io_pop_valid && scaleRep_valid);
  assign joinEventFire = (joinEvent_valid && joinEvent_ready);
  assign joinEvent_ready = 1'b1;
  assign zeroRep_ready = quant_zero_tready;
  assign cntOvf = (cnt == 7'h7f);
  assign afterQuant_valid = quant_q_tvalid;
  assign afterQuant_payload_fragment = quant_q_tdata;
  assign afterQuant_payload_last = (cntOvf && quant_q_tvalid);
  assign io_afterQuant_valid = afterQuant_regNext_valid;
  assign io_afterQuant_payload_last = afterQuant_regNext_payload_last;
  assign io_afterQuant_payload_fragment = afterQuant_regNext_payload_fragment;
  assign io_quantScale_valid = quant_getCfg_scale_regNext_valid;
  assign io_quantScale_payload = quant_getCfg_scale_regNext_payload;
  assign io_quantZero_valid = quant_getCfg_zero_regNext_valid;
  assign io_quantZero_payload = quant_getCfg_zero_regNext_payload;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      kToBeQuant_valid <= 1'b0;
      vToBeQuant_valid <= 1'b0;
      t_io_pop_ready_3 <= 7'h0;
      t_scaleRep_valid_1 <= 1'b0;
      t_io_pop_ready_8 <= 7'h0;
      t_zeroRep_valid_1 <= 1'b0;
      cnt <= 7'h0;
      afterQuant_regNext_valid <= 1'b0;
      quant_getCfg_scale_regNext_valid <= 1'b0;
      quant_getCfg_zero_regNext_valid <= 1'b0;
    end else begin
      kToBeQuant_valid <= (io_toBeQuant_0_valid && (|{(6'h12 == io_toBeQuant_0_tuser),(6'h09 == io_toBeQuant_0_tuser)}));
      vToBeQuant_valid <= (io_toBeQuant_1_valid && (|{(6'h13 == io_toBeQuant_1_tuser),(6'h07 == io_toBeQuant_1_tuser)}));
      t_io_pop_ready_3 <= t_io_pop_ready_2;
      if(t_io_pop_ready) begin
        t_scaleRep_valid_1 <= t_scaleRep_valid;
      end
      t_io_pop_ready_8 <= t_io_pop_ready_7;
      if(t_io_pop_ready_5) begin
        t_zeroRep_valid_1 <= t_zeroRep_valid;
      end
      if(afterQuant_valid) begin
        cnt <= (cnt + 7'h01);
        if(cntOvf) begin
          cnt <= 7'h0;
        end
      end
      afterQuant_regNext_valid <= afterQuant_valid;
      quant_getCfg_scale_regNext_valid <= getCfg_scale_tvalid;
      quant_getCfg_zero_regNext_valid <= getCfg_zero_tvalid;
    end
  end

  always @(posedge clk_0_clk) begin
    kToBeQuant_tdata <= io_toBeQuant_0_tdata;
    kToBeQuant_tuser <= (t_kToBeQuant_tuser[0] ? 6'h0a : 6'h0a);
    vToBeQuant_tdata <= io_toBeQuant_1_tdata;
    vToBeQuant_tuser <= (t_vToBeQuant_tuser[0] ? 6'h0b : 6'h0b);
    if(t_io_pop_ready) begin
      t_scaleRep_payload <= scaleFifo_io_pop_payload;
    end
    if(t_io_pop_ready_5) begin
      t_zeroRep_payload <= zeroFifo_io_pop_payload;
    end
    afterQuant_regNext_payload_last <= afterQuant_payload_last;
    afterQuant_regNext_payload_fragment <= afterQuant_payload_fragment;
    quant_getCfg_scale_regNext_payload <= getCfg_scale_tdata;
    quant_getCfg_zero_regNext_payload <= getCfg_zero_tdata;
  end


endmodule

