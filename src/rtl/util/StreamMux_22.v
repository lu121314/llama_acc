// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamMux_22 (
  input  wire [1:0]    io_select,
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire          io_inputs_2_valid,
  output wire          io_inputs_2_ready,
  output wire          io_output_valid,
  input  wire          io_output_ready
);

  reg                 t_io_output_valid;

  always @(*) begin
    case(io_select)
      2'b00 : t_io_output_valid = io_inputs_0_valid;
      2'b01 : t_io_output_valid = io_inputs_1_valid;
      default : t_io_output_valid = io_inputs_2_valid;
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 2'b00) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 2'b01) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 2'b10) && io_output_ready);
  assign io_output_valid = t_io_output_valid;

endmodule

