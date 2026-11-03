// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamFork_6 (
  input  wire          io_input_valid,
  output wire          io_input_ready,
  output wire          io_outputs_0_valid,
  input  wire          io_outputs_0_ready,
  output wire          io_outputs_1_valid,
  input  wire          io_outputs_1_ready,
  output wire          io_outputs_2_valid,
  input  wire          io_outputs_2_ready,
  output wire          io_outputs_3_valid,
  input  wire          io_outputs_3_ready
);


  assign io_input_ready = (((io_outputs_0_ready && io_outputs_1_ready) && io_outputs_2_ready) && io_outputs_3_ready);
  assign io_outputs_0_valid = (io_input_valid && io_input_ready);
  assign io_outputs_1_valid = (io_input_valid && io_input_ready);
  assign io_outputs_2_valid = (io_input_valid && io_input_ready);
  assign io_outputs_3_valid = (io_input_valid && io_input_ready);

endmodule

//StreamFifoCtrl replaced by StreamFifoCtrl_3

//StreamFifoVldProbe replaced by StreamFifoVldProbe_3

//Vec2to1 replaced by Vec2to1_3

//StreamMux_42 replaced by StreamMux_49

//StreamDemux_18 replaced by StreamDemux_25

//StreamFifoCtrl_1 replaced by StreamFifoCtrl_3

//StreamFifoVldProbe_1 replaced by StreamFifoVldProbe_3

//Vec2to1_1 replaced by Vec2to1_3

//StreamMux_43 replaced by StreamMux_49

//StreamDemux_19 replaced by StreamDemux_25

//StreamFifoCtrl_2 replaced by StreamFifoCtrl_3

//StreamFifoVldProbe_2 replaced by StreamFifoVldProbe_3

//Vec2to1_2 replaced by Vec2to1_3

//StreamMux_44 replaced by StreamMux_49

//StreamDemux_20 replaced by StreamDemux_25

