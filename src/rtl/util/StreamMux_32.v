// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamMux_32 (
  input  wire [2:0]    io_select,
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire          io_inputs_0_payload_last,
  input  wire [71:0]   io_inputs_0_payload_fragment,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire          io_inputs_1_payload_last,
  input  wire [71:0]   io_inputs_1_payload_fragment,
  input  wire          io_inputs_2_valid,
  output wire          io_inputs_2_ready,
  input  wire          io_inputs_2_payload_last,
  input  wire [71:0]   io_inputs_2_payload_fragment,
  input  wire          io_inputs_3_valid,
  output wire          io_inputs_3_ready,
  input  wire          io_inputs_3_payload_last,
  input  wire [71:0]   io_inputs_3_payload_fragment,
  input  wire          io_inputs_4_valid,
  output wire          io_inputs_4_ready,
  input  wire          io_inputs_4_payload_last,
  input  wire [71:0]   io_inputs_4_payload_fragment,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire          io_output_payload_last,
  output wire [71:0]   io_output_payload_fragment
);

  reg                 t_io_output_valid;
  reg                 t_io_output_payload_last;
  reg        [71:0]   t_io_output_payload_fragment;

  always @(*) begin
    case(io_select)
      3'b000 : begin
        t_io_output_valid = io_inputs_0_valid;
        t_io_output_payload_last = io_inputs_0_payload_last;
        t_io_output_payload_fragment = io_inputs_0_payload_fragment;
      end
      3'b001 : begin
        t_io_output_valid = io_inputs_1_valid;
        t_io_output_payload_last = io_inputs_1_payload_last;
        t_io_output_payload_fragment = io_inputs_1_payload_fragment;
      end
      3'b010 : begin
        t_io_output_valid = io_inputs_2_valid;
        t_io_output_payload_last = io_inputs_2_payload_last;
        t_io_output_payload_fragment = io_inputs_2_payload_fragment;
      end
      3'b011 : begin
        t_io_output_valid = io_inputs_3_valid;
        t_io_output_payload_last = io_inputs_3_payload_last;
        t_io_output_payload_fragment = io_inputs_3_payload_fragment;
      end
      default : begin
        t_io_output_valid = io_inputs_4_valid;
        t_io_output_payload_last = io_inputs_4_payload_last;
        t_io_output_payload_fragment = io_inputs_4_payload_fragment;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 3'b000) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 3'b001) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 3'b010) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 3'b011) && io_output_ready);
  assign io_inputs_4_ready = ((io_select == 3'b100) && io_output_ready);
  assign io_output_valid = t_io_output_valid;
  assign io_output_payload_last = t_io_output_payload_last;
  assign io_output_payload_fragment = t_io_output_payload_fragment;

endmodule

//StreamMux_31 replaced by StreamMux_30

