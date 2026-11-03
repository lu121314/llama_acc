// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module FlowFragmentAlign (
  input  wire          io_input_valid,
  input  wire          io_input_payload_last,
  input  wire [15:0]   io_input_payload_tdata,
  input  wire [5:0]    io_input_payload_tuser,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [15:0]   io_output_payload_tdata,
  output wire [5:0]    io_output_payload_tuser,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  reg                 io_input_regNext_valid;
  reg                 io_input_regNext_payload_last;
  reg        [15:0]   io_input_regNext_payload_tdata;
  reg        [5:0]    io_input_regNext_payload_tuser;

  assign io_output_valid = io_input_regNext_valid;
  assign io_output_payload_last = io_input_regNext_payload_last;
  assign io_output_payload_tdata = io_input_regNext_payload_tdata;
  assign io_output_payload_tuser = io_input_regNext_payload_tuser;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      io_input_regNext_valid <= 1'b0;
    end else begin
      io_input_regNext_valid <= io_input_valid;
    end
  end

  always @(posedge clk_1_clk) begin
    io_input_regNext_payload_last <= io_input_payload_last;
    io_input_regNext_payload_tdata <= io_input_payload_tdata;
    io_input_regNext_payload_tuser <= io_input_payload_tuser;
  end


endmodule

