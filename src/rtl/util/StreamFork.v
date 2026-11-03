// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamFork (
  input  wire          io_input_valid,
  output reg           io_input_ready,
  output wire          io_outputs_0_valid,
  input  wire          io_outputs_0_ready,
  output wire          io_outputs_1_valid,
  input  wire          io_outputs_1_ready,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  reg                 logic_linkEnable_0;
  reg                 logic_linkEnable_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && logic_linkEnable_0)) begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && logic_linkEnable_1)) begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && logic_linkEnable_0);
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && logic_linkEnable_1);
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      logic_linkEnable_0 <= 1'b1;
      logic_linkEnable_1 <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        logic_linkEnable_0 <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        logic_linkEnable_1 <= 1'b0;
      end
      if(io_input_ready) begin
        logic_linkEnable_0 <= 1'b1;
        logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

//StreamMux_5 replaced by StreamMux_23

//StreamMux_4 replaced by StreamMux_23

//StreamDemux_4 replaced by StreamDemux_25

