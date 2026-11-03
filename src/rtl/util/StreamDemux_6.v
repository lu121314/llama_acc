// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamDemux_6 (
  input  wire [0:0]    io_select,
  input  wire          io_input_valid,
  output reg           io_input_ready,
  input  wire [2047:0] io_input_payload,
  output reg           io_outputs_0_valid,
  input  wire          io_outputs_0_ready,
  output wire [2047:0] io_outputs_0_payload,
  output reg           io_outputs_1_valid,
  input  wire          io_outputs_1_ready,
  output wire [2047:0] io_outputs_1_payload
);

  wire                t_when;
  wire                t_when_1;

  assign t_when = (1'b0 != io_select);
  assign t_when_1 = (1'b1 != io_select);
  always @(*) begin
    io_input_ready = 1'b0;
    if(!t_when) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!t_when_1) begin
      io_input_ready = io_outputs_1_ready;
    end
  end

  assign io_outputs_0_payload = io_input_payload;
  always @(*) begin
    if(t_when) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload = io_input_payload;
  always @(*) begin
    if(t_when_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end


endmodule

