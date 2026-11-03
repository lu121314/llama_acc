// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamAxiFrameFifo_1 (
  input  wire          io_input_valid,
  output wire          io_input_ready,
  input  wire [2047:0] io_input_tdata,
  input  wire [5:0]    io_input_tuser,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [2047:0] io_output_tdata,
  output wire [5:0]    io_output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                largeBankFifo_12_io_push_ready;
  wire                largeBankFifo_12_io_pop_valid;
  wire       [2047:0] largeBankFifo_12_io_pop_payload;
  wire       [5:0]    largeBankFifo_12_io_occupancy;
  wire       [5:0]    largeBankFifo_12_io_availability;
  wire                streamFifo_144_io_push_ready;
  wire                streamFifo_144_io_pop_valid;
  wire       [5:0]    streamFifo_144_io_pop_payload;
  wire       [5:0]    streamFifo_144_io_occupancy;
  wire       [5:0]    streamFifo_144_io_availability;

  LargeBankFifo_11 largeBankFifo_12 (
    .io_push_valid   (io_input_valid                         ), //i
    .io_push_ready   (largeBankFifo_12_io_push_ready         ), //o
    .io_push_payload (io_input_tdata[2047:0]                 ), //i
    .io_pop_valid    (largeBankFifo_12_io_pop_valid          ), //o
    .io_pop_ready    (io_output_ready                        ), //i
    .io_pop_payload  (largeBankFifo_12_io_pop_payload[2047:0]), //o
    .io_occupancy    (largeBankFifo_12_io_occupancy[5:0]     ), //o
    .io_availability (largeBankFifo_12_io_availability[5:0]  ), //o
    .clk_0_clk       (clk_0_clk                              ), //i
    .clk_0_resetn    (clk_0_resetn                           )  //i
  );
  StreamFifo_105 streamFifo_144 (
    .io_push_valid   (io_input_valid                     ), //i
    .io_push_ready   (streamFifo_144_io_push_ready       ), //o
    .io_push_payload (io_input_tuser[5:0]                ), //i
    .io_pop_valid    (streamFifo_144_io_pop_valid        ), //o
    .io_pop_ready    (io_output_ready                    ), //i
    .io_pop_payload  (streamFifo_144_io_pop_payload[5:0] ), //o
    .io_flush        (1'b0                               ), //i
    .io_occupancy    (streamFifo_144_io_occupancy[5:0]   ), //o
    .io_availability (streamFifo_144_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                          ), //i
    .clk_0_resetn    (clk_0_resetn                       )  //i
  );
  assign io_input_ready = largeBankFifo_12_io_push_ready;
  assign io_output_valid = largeBankFifo_12_io_pop_valid;
  assign io_output_tdata = largeBankFifo_12_io_pop_payload;
  assign io_output_tuser = streamFifo_144_io_pop_payload;

endmodule

//LargeBankFifo_6 replaced by LargeBankFifo_11

