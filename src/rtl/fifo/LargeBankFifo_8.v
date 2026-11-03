// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module LargeBankFifo_8 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [511:0]  io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [511:0]  io_pop_payload,
  output wire [9:0]    io_occupancy,
  output wire [9:0]    io_availability,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                fifo_0_io_push_ready;
  wire                fifo_0_io_pop_valid;
  wire       [127:0]  fifo_0_io_pop_payload;
  wire       [9:0]    fifo_0_io_occupancy;
  wire       [9:0]    fifo_0_io_availability;
  wire                fifo_1_io_push_ready;
  wire                fifo_1_io_pop_valid;
  wire       [127:0]  fifo_1_io_pop_payload;
  wire       [9:0]    fifo_1_io_occupancy;
  wire       [9:0]    fifo_1_io_availability;
  wire                fifo_2_io_push_ready;
  wire                fifo_2_io_pop_valid;
  wire       [127:0]  fifo_2_io_pop_payload;
  wire       [9:0]    fifo_2_io_occupancy;
  wire       [9:0]    fifo_2_io_availability;
  wire                fifo_3_io_push_ready;
  wire                fifo_3_io_pop_valid;
  wire       [127:0]  fifo_3_io_pop_payload;
  wire       [9:0]    fifo_3_io_occupancy;
  wire       [9:0]    fifo_3_io_availability;
  wire       [511:0]  t_inPydSplit_0;
  wire       [127:0]  inPydSplit_0;
  wire       [127:0]  inPydSplit_1;
  wire       [127:0]  inPydSplit_2;
  wire       [127:0]  inPydSplit_3;
  wire       [511:0]  outPydMerge;

  StreamFifo_120 fifo_0 (
    .io_push_valid   (io_push_valid               ), //i
    .io_push_ready   (fifo_0_io_push_ready        ), //o
    .io_push_payload (inPydSplit_0[127:0]         ), //i
    .io_pop_valid    (fifo_0_io_pop_valid         ), //o
    .io_pop_ready    (io_pop_ready                ), //i
    .io_pop_payload  (fifo_0_io_pop_payload[127:0]), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (fifo_0_io_occupancy[9:0]    ), //o
    .io_availability (fifo_0_io_availability[9:0] ), //o
    .clk_0_clk       (clk_0_clk                   ), //i
    .clk_0_resetn    (clk_0_resetn                )  //i
  );
  StreamFifo_120 fifo_1 (
    .io_push_valid   (io_push_valid               ), //i
    .io_push_ready   (fifo_1_io_push_ready        ), //o
    .io_push_payload (inPydSplit_1[127:0]         ), //i
    .io_pop_valid    (fifo_1_io_pop_valid         ), //o
    .io_pop_ready    (io_pop_ready                ), //i
    .io_pop_payload  (fifo_1_io_pop_payload[127:0]), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (fifo_1_io_occupancy[9:0]    ), //o
    .io_availability (fifo_1_io_availability[9:0] ), //o
    .clk_0_clk       (clk_0_clk                   ), //i
    .clk_0_resetn    (clk_0_resetn                )  //i
  );
  StreamFifo_120 fifo_2 (
    .io_push_valid   (io_push_valid               ), //i
    .io_push_ready   (fifo_2_io_push_ready        ), //o
    .io_push_payload (inPydSplit_2[127:0]         ), //i
    .io_pop_valid    (fifo_2_io_pop_valid         ), //o
    .io_pop_ready    (io_pop_ready                ), //i
    .io_pop_payload  (fifo_2_io_pop_payload[127:0]), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (fifo_2_io_occupancy[9:0]    ), //o
    .io_availability (fifo_2_io_availability[9:0] ), //o
    .clk_0_clk       (clk_0_clk                   ), //i
    .clk_0_resetn    (clk_0_resetn                )  //i
  );
  StreamFifo_120 fifo_3 (
    .io_push_valid   (io_push_valid               ), //i
    .io_push_ready   (fifo_3_io_push_ready        ), //o
    .io_push_payload (inPydSplit_3[127:0]         ), //i
    .io_pop_valid    (fifo_3_io_pop_valid         ), //o
    .io_pop_ready    (io_pop_ready                ), //i
    .io_pop_payload  (fifo_3_io_pop_payload[127:0]), //o
    .io_flush        (1'b0                        ), //i
    .io_occupancy    (fifo_3_io_occupancy[9:0]    ), //o
    .io_availability (fifo_3_io_availability[9:0] ), //o
    .clk_0_clk       (clk_0_clk                   ), //i
    .clk_0_resetn    (clk_0_resetn                )  //i
  );
  assign io_occupancy = fifo_0_io_occupancy;
  assign io_availability = fifo_0_io_availability;
  assign t_inPydSplit_0 = io_push_payload;
  assign inPydSplit_0 = t_inPydSplit_0[127 : 0];
  assign inPydSplit_1 = t_inPydSplit_0[255 : 128];
  assign inPydSplit_2 = t_inPydSplit_0[383 : 256];
  assign inPydSplit_3 = t_inPydSplit_0[511 : 384];
  assign outPydMerge = {fifo_3_io_pop_payload,{fifo_2_io_pop_payload,{fifo_1_io_pop_payload,fifo_0_io_pop_payload}}};
  assign io_pop_payload = outPydMerge;
  assign io_push_ready = fifo_0_io_push_ready;
  assign io_pop_valid = fifo_0_io_pop_valid;

endmodule

