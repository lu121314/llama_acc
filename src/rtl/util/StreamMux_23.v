// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamMux_23 (
  input  wire [0:0]    io_select,
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [31:0]   io_inputs_1_payload,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload
);

  reg                 t_io_output_valid;
  reg        [31:0]   t_io_output_payload;

  always @(*) begin
    case(io_select)
      1'b0 : begin
        t_io_output_valid = io_inputs_0_valid;
        t_io_output_payload = io_inputs_0_payload;
      end
      default : begin
        t_io_output_valid = io_inputs_1_valid;
        t_io_output_payload = io_inputs_1_payload;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 1'b0) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 1'b1) && io_output_ready);
  assign io_output_valid = t_io_output_valid;
  assign io_output_payload = t_io_output_payload;

endmodule

//StreamDemux_10 replaced by StreamDemux_25

