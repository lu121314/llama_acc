// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AllGatherNode (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [15:0]   io_input_payload_tdata,
  input  wire [5:0]    io_input_payload_tuser,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [15:0]   io_output_payload_tdata,
  output wire [5:0]    io_output_payload_tuser,
  output wire [0:0]    io_output_payload_tdest,
  input  wire          io_from_valid,
  input  wire          io_from_payload_last,
  input  wire [15:0]   io_from_payload_tdata,
  input  wire [5:0]    io_from_payload_tuser,
  input  wire [0:0]    io_from_payload_tdest,
  output wire          io_to_valid,
  output wire          io_to_payload_last,
  output wire [15:0]   io_to_payload_tdata,
  output wire [5:0]    io_to_payload_tuser,
  output wire [0:0]    io_to_payload_tdest,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire       [0:0]    multiCore_mux_io_select;
  wire                multiCore_mux_io_output_ready;
  wire                multiCore_inFifo_io_push_ready;
  wire                multiCore_inFifo_io_pop_valid;
  wire                multiCore_inFifo_io_pop_payload_last;
  wire       [15:0]   multiCore_inFifo_io_pop_payload_tdata;
  wire       [5:0]    multiCore_inFifo_io_pop_payload_tuser;
  wire       [14:0]   multiCore_inFifo_io_occupancy;
  wire       [14:0]   multiCore_inFifo_io_availability;
  wire                multiCore_fromFifo_io_push_ready;
  wire                multiCore_fromFifo_io_pop_valid;
  wire                multiCore_fromFifo_io_pop_payload_last;
  wire       [15:0]   multiCore_fromFifo_io_pop_payload_tdata;
  wire       [5:0]    multiCore_fromFifo_io_pop_payload_tuser;
  wire       [0:0]    multiCore_fromFifo_io_pop_payload_tdest;
  wire       [14:0]   multiCore_fromFifo_io_occupancy;
  wire       [14:0]   multiCore_fromFifo_io_availability;
  wire                multiCore_mux_io_inputs_0_ready;
  wire                multiCore_mux_io_inputs_1_ready;
  wire                multiCore_mux_io_output_valid;
  wire                multiCore_mux_io_output_payload_last;
  wire       [15:0]   multiCore_mux_io_output_payload_tdata;
  wire       [5:0]    multiCore_mux_io_output_payload_tuser;
  wire       [0:0]    multiCore_mux_io_output_payload_tdest;
  wire                io_from_takeWhen_valid;
  wire                io_from_takeWhen_payload_last;
  wire       [15:0]   io_from_takeWhen_payload_tdata;
  wire       [5:0]    io_from_takeWhen_payload_tuser;
  wire       [0:0]    io_from_takeWhen_payload_tdest;
  wire                io_from_takeWhen_toStream_valid;
  wire                io_from_takeWhen_toStream_ready;
  wire                io_from_takeWhen_toStream_payload_last;
  wire       [15:0]   io_from_takeWhen_toStream_payload_tdata;
  wire       [5:0]    io_from_takeWhen_toStream_payload_tuser;
  wire       [0:0]    io_from_takeWhen_toStream_payload_tdest;
  wire                multiCore_insert_valid;
  wire                multiCore_insert_ready;
  wire                multiCore_insert_payload_last;
  wire       [15:0]   multiCore_insert_payload_tdata;
  wire       [5:0]    multiCore_insert_payload_tuser;
  wire       [0:0]    multiCore_insert_payload_tdest;
  wire                multiCore_muxOutput_valid;
  wire                multiCore_muxOutput_payload_last;
  wire       [15:0]   multiCore_muxOutput_payload_tdata;
  wire       [5:0]    multiCore_muxOutput_payload_tuser;
  wire       [0:0]    multiCore_muxOutput_payload_tdest;
  reg                 multiCore_muxOutput_regNext_valid;
  reg                 multiCore_muxOutput_regNext_payload_last;
  reg        [15:0]   multiCore_muxOutput_regNext_payload_tdata;
  reg        [5:0]    multiCore_muxOutput_regNext_payload_tuser;
  reg        [0:0]    multiCore_muxOutput_regNext_payload_tdest;
  reg                 multiCore_muxPipe_valid;
  reg                 multiCore_muxPipe_payload_last;
  reg        [15:0]   multiCore_muxPipe_payload_tdata;
  reg        [5:0]    multiCore_muxPipe_payload_tuser;
  reg        [0:0]    multiCore_muxPipe_payload_tdest;
  wire                multiCore_enCnt;
  reg        [0:0]    multiCore_cnt;
  wire                multiCore_insertSel;

  StreamFifo_63 multiCore_inFifo (
    .io_push_valid         (io_input_valid                             ), //i
    .io_push_ready         (multiCore_inFifo_io_push_ready             ), //o
    .io_push_payload_last  (io_input_payload_last                      ), //i
    .io_push_payload_tdata (io_input_payload_tdata[15:0]               ), //i
    .io_push_payload_tuser (io_input_payload_tuser[5:0]                ), //i
    .io_pop_valid          (multiCore_inFifo_io_pop_valid              ), //o
    .io_pop_ready          (multiCore_insert_ready                     ), //i
    .io_pop_payload_last   (multiCore_inFifo_io_pop_payload_last       ), //o
    .io_pop_payload_tdata  (multiCore_inFifo_io_pop_payload_tdata[15:0]), //o
    .io_pop_payload_tuser  (multiCore_inFifo_io_pop_payload_tuser[5:0] ), //o
    .io_flush              (1'b0                                       ), //i
    .io_occupancy          (multiCore_inFifo_io_occupancy[14:0]        ), //o
    .io_availability       (multiCore_inFifo_io_availability[14:0]     ), //o
    .clk_1_clk             (clk_1_clk                                  ), //i
    .clk_1_resetn          (clk_1_resetn                               )  //i
  );
  StreamFifo_64 multiCore_fromFifo (
    .io_push_valid         (io_from_takeWhen_toStream_valid              ), //i
    .io_push_ready         (multiCore_fromFifo_io_push_ready             ), //o
    .io_push_payload_last  (io_from_takeWhen_toStream_payload_last       ), //i
    .io_push_payload_tdata (io_from_takeWhen_toStream_payload_tdata[15:0]), //i
    .io_push_payload_tuser (io_from_takeWhen_toStream_payload_tuser[5:0] ), //i
    .io_push_payload_tdest (io_from_takeWhen_toStream_payload_tdest      ), //i
    .io_pop_valid          (multiCore_fromFifo_io_pop_valid              ), //o
    .io_pop_ready          (multiCore_mux_io_inputs_0_ready              ), //i
    .io_pop_payload_last   (multiCore_fromFifo_io_pop_payload_last       ), //o
    .io_pop_payload_tdata  (multiCore_fromFifo_io_pop_payload_tdata[15:0]), //o
    .io_pop_payload_tuser  (multiCore_fromFifo_io_pop_payload_tuser[5:0] ), //o
    .io_pop_payload_tdest  (multiCore_fromFifo_io_pop_payload_tdest      ), //o
    .io_flush              (1'b0                                         ), //i
    .io_occupancy          (multiCore_fromFifo_io_occupancy[14:0]        ), //o
    .io_availability       (multiCore_fromFifo_io_availability[14:0]     ), //o
    .clk_1_clk             (clk_1_clk                                    ), //i
    .clk_1_resetn          (clk_1_resetn                                 )  //i
  );
  StreamMux_40 multiCore_mux (
    .io_select                 (multiCore_mux_io_select                      ), //i
    .io_inputs_0_valid         (multiCore_fromFifo_io_pop_valid              ), //i
    .io_inputs_0_ready         (multiCore_mux_io_inputs_0_ready              ), //o
    .io_inputs_0_payload_last  (multiCore_fromFifo_io_pop_payload_last       ), //i
    .io_inputs_0_payload_tdata (multiCore_fromFifo_io_pop_payload_tdata[15:0]), //i
    .io_inputs_0_payload_tuser (multiCore_fromFifo_io_pop_payload_tuser[5:0] ), //i
    .io_inputs_0_payload_tdest (multiCore_fromFifo_io_pop_payload_tdest      ), //i
    .io_inputs_1_valid         (multiCore_insert_valid                       ), //i
    .io_inputs_1_ready         (multiCore_mux_io_inputs_1_ready              ), //o
    .io_inputs_1_payload_last  (multiCore_insert_payload_last                ), //i
    .io_inputs_1_payload_tdata (multiCore_insert_payload_tdata[15:0]         ), //i
    .io_inputs_1_payload_tuser (multiCore_insert_payload_tuser[5:0]          ), //i
    .io_inputs_1_payload_tdest (multiCore_insert_payload_tdest               ), //i
    .io_output_valid           (multiCore_mux_io_output_valid                ), //o
    .io_output_ready           (multiCore_mux_io_output_ready                ), //i
    .io_output_payload_last    (multiCore_mux_io_output_payload_last         ), //o
    .io_output_payload_tdata   (multiCore_mux_io_output_payload_tdata[15:0]  ), //o
    .io_output_payload_tuser   (multiCore_mux_io_output_payload_tuser[5:0]   ), //o
    .io_output_payload_tdest   (multiCore_mux_io_output_payload_tdest        )  //o
  );
  assign io_from_takeWhen_valid = (io_from_valid && (! (io_from_payload_tdest == 1'b1)));
  assign io_from_takeWhen_payload_last = io_from_payload_last;
  assign io_from_takeWhen_payload_tdata = io_from_payload_tdata;
  assign io_from_takeWhen_payload_tuser = io_from_payload_tuser;
  assign io_from_takeWhen_payload_tdest = io_from_payload_tdest;
  assign io_from_takeWhen_toStream_valid = io_from_takeWhen_valid;
  assign io_from_takeWhen_toStream_payload_last = io_from_takeWhen_payload_last;
  assign io_from_takeWhen_toStream_payload_tdata = io_from_takeWhen_payload_tdata;
  assign io_from_takeWhen_toStream_payload_tuser = io_from_takeWhen_payload_tuser;
  assign io_from_takeWhen_toStream_payload_tdest = io_from_takeWhen_payload_tdest;
  assign io_from_takeWhen_toStream_ready = multiCore_fromFifo_io_push_ready;
  assign multiCore_insert_valid = multiCore_inFifo_io_pop_valid;
  assign multiCore_insert_payload_tdata = multiCore_inFifo_io_pop_payload_tdata;
  assign multiCore_insert_payload_tuser = multiCore_inFifo_io_pop_payload_tuser;
  assign multiCore_insert_payload_tdest = 1'b1;
  assign multiCore_insert_payload_last = multiCore_inFifo_io_pop_payload_last;
  assign multiCore_insert_ready = multiCore_mux_io_inputs_1_ready;
  assign multiCore_mux_io_output_ready = 1'b1;
  assign multiCore_muxOutput_valid = multiCore_mux_io_output_valid;
  assign multiCore_muxOutput_payload_last = multiCore_mux_io_output_payload_last;
  assign multiCore_muxOutput_payload_tdata = multiCore_mux_io_output_payload_tdata;
  assign multiCore_muxOutput_payload_tuser = multiCore_mux_io_output_payload_tuser;
  assign multiCore_muxOutput_payload_tdest = multiCore_mux_io_output_payload_tdest;
  assign io_to_valid = multiCore_muxPipe_valid;
  assign io_to_payload_last = multiCore_muxPipe_payload_last;
  assign io_to_payload_tdata = multiCore_muxPipe_payload_tdata;
  assign io_to_payload_tuser = multiCore_muxPipe_payload_tuser;
  assign io_to_payload_tdest = multiCore_muxPipe_payload_tdest;
  assign multiCore_enCnt = (multiCore_mux_io_output_valid && multiCore_mux_io_output_ready);
  assign io_output_payload_tdest = multiCore_muxOutput_payload_tdest;
  assign io_output_payload_tdata = multiCore_muxOutput_payload_tdata;
  assign io_output_payload_tuser = multiCore_muxOutput_payload_tuser;
  assign io_output_valid = multiCore_enCnt;
  assign io_output_payload_last = multiCore_muxOutput_payload_last;
  assign multiCore_insertSel = (multiCore_cnt == 1'b0);
  assign multiCore_mux_io_select = multiCore_insertSel;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      multiCore_muxOutput_regNext_valid <= 1'b0;
      multiCore_muxPipe_valid <= 1'b0;
      multiCore_cnt <= 1'b0;
    end else begin
      multiCore_muxOutput_regNext_valid <= multiCore_muxOutput_valid;
      multiCore_muxPipe_valid <= multiCore_muxOutput_regNext_valid;
      if(multiCore_enCnt) begin
        if(multiCore_mux_io_output_payload_last) begin
          multiCore_cnt <= (multiCore_cnt + 1'b1);
          if((multiCore_cnt == 1'b1)) begin
            multiCore_cnt <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk_1_clk) begin
    multiCore_muxOutput_regNext_payload_last <= multiCore_muxOutput_payload_last;
    multiCore_muxOutput_regNext_payload_tdata <= multiCore_muxOutput_payload_tdata;
    multiCore_muxOutput_regNext_payload_tuser <= multiCore_muxOutput_payload_tuser;
    multiCore_muxOutput_regNext_payload_tdest <= multiCore_muxOutput_payload_tdest;
    multiCore_muxPipe_payload_last <= multiCore_muxOutput_regNext_payload_last;
    multiCore_muxPipe_payload_tdata <= multiCore_muxOutput_regNext_payload_tdata;
    multiCore_muxPipe_payload_tuser <= multiCore_muxOutput_regNext_payload_tuser;
    multiCore_muxPipe_payload_tdest <= multiCore_muxOutput_regNext_payload_tdest;
  end


endmodule

