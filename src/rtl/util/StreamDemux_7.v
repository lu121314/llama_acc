// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamDemux_7 (
  input  wire [2:0]    io_select,
  input  wire          io_input_valid,
  output reg           io_input_ready,
  output reg           io_outputs_0_valid,
  input  wire          io_outputs_0_ready,
  output reg           io_outputs_1_valid,
  input  wire          io_outputs_1_ready,
  output reg           io_outputs_2_valid,
  input  wire          io_outputs_2_ready,
  output reg           io_outputs_3_valid,
  input  wire          io_outputs_3_ready,
  output reg           io_outputs_4_valid,
  input  wire          io_outputs_4_ready
);

  wire                t_when;
  wire                t_when_1;
  wire                t_when_2;
  wire                t_when_3;
  wire                t_when_4;

  assign t_when = (3'b000 != io_select);
  assign t_when_1 = (3'b001 != io_select);
  assign t_when_2 = (3'b010 != io_select);
  assign t_when_3 = (3'b011 != io_select);
  assign t_when_4 = (3'b100 != io_select);
  always @(*) begin
    io_input_ready = 1'b0;
    if(!t_when) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!t_when_1) begin
      io_input_ready = io_outputs_1_ready;
    end
    if(!t_when_2) begin
      io_input_ready = io_outputs_2_ready;
    end
    if(!t_when_3) begin
      io_input_ready = io_outputs_3_ready;
    end
    if(!t_when_4) begin
      io_input_ready = io_outputs_4_ready;
    end
  end

  always @(*) begin
    if(t_when) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  always @(*) begin
    if(t_when_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  always @(*) begin
    if(t_when_2) begin
      io_outputs_2_valid = 1'b0;
    end else begin
      io_outputs_2_valid = io_input_valid;
    end
  end

  always @(*) begin
    if(t_when_3) begin
      io_outputs_3_valid = 1'b0;
    end else begin
      io_outputs_3_valid = io_input_valid;
    end
  end

  always @(*) begin
    if(t_when_4) begin
      io_outputs_4_valid = 1'b0;
    end else begin
      io_outputs_4_valid = io_input_valid;
    end
  end


endmodule

//StreamFork_4 replaced by StreamFork_6

//StreamFifo_56 replaced by StreamFifo_53

//StreamFifo_55 replaced by StreamFifo_53

//StreamFifo_54 replaced by StreamFifo_53

