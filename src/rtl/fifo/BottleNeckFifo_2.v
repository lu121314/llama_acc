// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module BottleNeckFifo_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [511:0]  io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [511:0]  io_pop_payload,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                fifo_io_pop_ready;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [63:0]   fifo_io_pop_payload;
  wire       [11:0]   fifo_io_occupancy;
  wire       [11:0]   fifo_io_availability;
  wire       [2:0]    t_t_adaptIn_payload_1;
  wire       [0:0]    t_t_adaptIn_payload_1_1;
  reg        [63:0]   t_adaptIn_payload_4;
  wire       [2:0]    t_t_adaptOut_valid_1;
  wire       [0:0]    t_t_adaptOut_valid_1_1;
  wire       [383:0]  t_t_adaptOut_payload;
  wire                pushIn_valid;
  reg                 pushIn_ready;
  wire       [511:0]  pushIn_payload;
  wire                pushInPipe_valid;
  wire                pushInPipe_ready;
  wire       [511:0]  pushInPipe_payload;
  reg                 pushIn_rValid;
  reg        [511:0]  pushIn_rData;
  wire                adaptIn_valid;
  reg                 adaptIn_ready;
  wire       [63:0]   adaptIn_payload;
  wire                adaptIn_fire;
  reg                 t_adaptIn_payload;
  reg        [2:0]    t_adaptIn_payload_1;
  reg        [2:0]    t_adaptIn_payload_2;
  wire                t_pushInPipe_ready;
  wire       [511:0]  t_adaptIn_payload_3;
  wire                adaptOut_valid;
  wire                adaptOut_ready;
  wire       [511:0]  adaptOut_payload;
  wire                k_fifo_fifo_io_pop_fire;
  reg                 t_adaptOut_valid;
  reg        [2:0]    t_adaptOut_valid_1;
  reg        [2:0]    t_adaptOut_valid_2;
  wire                t_adaptOut_valid_3;
  reg        [447:0]  t_adaptOut_payload;
  wire                adaptIn_m2sPipe_valid;
  wire                adaptIn_m2sPipe_ready;
  wire       [63:0]   adaptIn_m2sPipe_payload;
  reg                 adaptIn_rValid;
  reg        [63:0]   adaptIn_rData;

  assign t_t_adaptIn_payload_1_1 = t_adaptIn_payload;
  assign t_t_adaptIn_payload_1 = {2'd0, t_t_adaptIn_payload_1_1};
  assign t_t_adaptOut_valid_1_1 = t_adaptOut_valid;
  assign t_t_adaptOut_valid_1 = {2'd0, t_t_adaptOut_valid_1_1};
  assign t_t_adaptOut_payload = (t_adaptOut_payload >>> 7'd64);
  StreamFifo_95 fifo (
    .io_push_valid   (adaptIn_m2sPipe_valid        ), //i
    .io_push_ready   (fifo_io_push_ready           ), //o
    .io_push_payload (adaptIn_m2sPipe_payload[63:0]), //i
    .io_pop_valid    (fifo_io_pop_valid            ), //o
    .io_pop_ready    (fifo_io_pop_ready            ), //i
    .io_pop_payload  (fifo_io_pop_payload[63:0]    ), //o
    .io_flush        (1'b0                         ), //i
    .io_occupancy    (fifo_io_occupancy[11:0]      ), //o
    .io_availability (fifo_io_availability[11:0]   ), //o
    .clk_0_clk       (clk_0_clk                    ), //i
    .clk_0_resetn    (clk_0_resetn                 )  //i
  );
  always @(*) begin
    case(t_adaptIn_payload_2)
      3'b000 : t_adaptIn_payload_4 = t_adaptIn_payload_3[63 : 0];
      3'b001 : t_adaptIn_payload_4 = t_adaptIn_payload_3[127 : 64];
      3'b010 : t_adaptIn_payload_4 = t_adaptIn_payload_3[191 : 128];
      3'b011 : t_adaptIn_payload_4 = t_adaptIn_payload_3[255 : 192];
      3'b100 : t_adaptIn_payload_4 = t_adaptIn_payload_3[319 : 256];
      3'b101 : t_adaptIn_payload_4 = t_adaptIn_payload_3[383 : 320];
      3'b110 : t_adaptIn_payload_4 = t_adaptIn_payload_3[447 : 384];
      default : t_adaptIn_payload_4 = t_adaptIn_payload_3[511 : 448];
    endcase
  end

  assign pushIn_valid = io_push_valid;
  assign pushIn_payload = io_push_payload;
  always @(*) begin
    pushIn_ready = pushInPipe_ready;
    if((! pushInPipe_valid)) begin
      pushIn_ready = 1'b1;
    end
  end

  assign pushInPipe_valid = pushIn_rValid;
  assign pushInPipe_payload = pushIn_rData;
  assign adaptIn_fire = (adaptIn_valid && adaptIn_ready);
  always @(*) begin
    t_adaptIn_payload = 1'b0;
    if(adaptIn_fire) begin
      t_adaptIn_payload = 1'b1;
    end
  end

  assign t_pushInPipe_ready = (t_adaptIn_payload_2 == 3'b111);
  always @(*) begin
    t_adaptIn_payload_1 = (t_adaptIn_payload_2 + t_t_adaptIn_payload_1);
    if(1'b0) begin
      t_adaptIn_payload_1 = 3'b000;
    end
  end

  assign adaptIn_valid = pushInPipe_valid;
  assign t_adaptIn_payload_3 = pushInPipe_payload;
  assign adaptIn_payload = t_adaptIn_payload_4;
  assign pushInPipe_ready = (adaptIn_ready && t_pushInPipe_ready);
  assign k_fifo_fifo_io_pop_fire = (fifo_io_pop_valid && fifo_io_pop_ready);
  always @(*) begin
    t_adaptOut_valid = 1'b0;
    if(k_fifo_fifo_io_pop_fire) begin
      t_adaptOut_valid = 1'b1;
    end
  end

  assign t_adaptOut_valid_3 = (t_adaptOut_valid_2 == 3'b111);
  always @(*) begin
    t_adaptOut_valid_1 = (t_adaptOut_valid_2 + t_t_adaptOut_valid_1);
    if(1'b0) begin
      t_adaptOut_valid_1 = 3'b000;
    end
  end

  assign adaptOut_valid = (fifo_io_pop_valid && t_adaptOut_valid_3);
  assign adaptOut_payload = {fifo_io_pop_payload,t_adaptOut_payload};
  assign fifo_io_pop_ready = (! ((! adaptOut_ready) && t_adaptOut_valid_3));
  always @(*) begin
    adaptIn_ready = adaptIn_m2sPipe_ready;
    if((! adaptIn_m2sPipe_valid)) begin
      adaptIn_ready = 1'b1;
    end
  end

  assign adaptIn_m2sPipe_valid = adaptIn_rValid;
  assign adaptIn_m2sPipe_payload = adaptIn_rData;
  assign adaptIn_m2sPipe_ready = fifo_io_push_ready;
  assign io_pop_valid = adaptOut_valid;
  assign adaptOut_ready = io_pop_ready;
  assign io_pop_payload = adaptOut_payload;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      pushIn_rValid <= 1'b0;
      t_adaptIn_payload_2 <= 3'b000;
      t_adaptOut_valid_2 <= 3'b000;
      adaptIn_rValid <= 1'b0;
    end else begin
      if(pushIn_ready) begin
        pushIn_rValid <= pushIn_valid;
      end
      t_adaptIn_payload_2 <= t_adaptIn_payload_1;
      t_adaptOut_valid_2 <= t_adaptOut_valid_1;
      if(adaptIn_ready) begin
        adaptIn_rValid <= adaptIn_valid;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(pushIn_ready) begin
      pushIn_rData <= pushIn_payload;
    end
    if(k_fifo_fifo_io_pop_fire) begin
      t_adaptOut_payload <= {fifo_io_pop_payload,t_t_adaptOut_payload};
    end
    if(adaptIn_ready) begin
      adaptIn_rData <= adaptIn_payload;
    end
  end


endmodule

//StreamFifo_30 replaced by StreamFifo_103

