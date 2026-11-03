// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module StreamMux_37 (
  input  wire [2:0]    io_select,
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [5:0]    io_inputs_0_payload,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [5:0]    io_inputs_1_payload,
  input  wire          io_inputs_2_valid,
  output wire          io_inputs_2_ready,
  input  wire [5:0]    io_inputs_2_payload,
  input  wire          io_inputs_3_valid,
  output wire          io_inputs_3_ready,
  input  wire [5:0]    io_inputs_3_payload,
  input  wire          io_inputs_4_valid,
  output wire          io_inputs_4_ready,
  input  wire [5:0]    io_inputs_4_payload,
  input  wire          io_inputs_5_valid,
  output wire          io_inputs_5_ready,
  input  wire [5:0]    io_inputs_5_payload,
  input  wire          io_inputs_6_valid,
  output wire          io_inputs_6_ready,
  input  wire [5:0]    io_inputs_6_payload,
  input  wire          io_inputs_7_valid,
  output wire          io_inputs_7_ready,
  input  wire [5:0]    io_inputs_7_payload,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [5:0]    io_output_payload
);

  reg                 t_io_output_valid;
  reg        [5:0]    t_io_output_payload;

  always @(*) begin
    case(io_select)
      3'b000 : begin
        t_io_output_valid = io_inputs_0_valid;
        t_io_output_payload = io_inputs_0_payload;
      end
      3'b001 : begin
        t_io_output_valid = io_inputs_1_valid;
        t_io_output_payload = io_inputs_1_payload;
      end
      3'b010 : begin
        t_io_output_valid = io_inputs_2_valid;
        t_io_output_payload = io_inputs_2_payload;
      end
      3'b011 : begin
        t_io_output_valid = io_inputs_3_valid;
        t_io_output_payload = io_inputs_3_payload;
      end
      3'b100 : begin
        t_io_output_valid = io_inputs_4_valid;
        t_io_output_payload = io_inputs_4_payload;
      end
      3'b101 : begin
        t_io_output_valid = io_inputs_5_valid;
        t_io_output_payload = io_inputs_5_payload;
      end
      3'b110 : begin
        t_io_output_valid = io_inputs_6_valid;
        t_io_output_payload = io_inputs_6_payload;
      end
      default : begin
        t_io_output_valid = io_inputs_7_valid;
        t_io_output_payload = io_inputs_7_payload;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 3'b000) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 3'b001) && io_output_ready);
  assign io_inputs_2_ready = ((io_select == 3'b010) && io_output_ready);
  assign io_inputs_3_ready = ((io_select == 3'b011) && io_output_ready);
  assign io_inputs_4_ready = ((io_select == 3'b100) && io_output_ready);
  assign io_inputs_5_ready = ((io_select == 3'b101) && io_output_ready);
  assign io_inputs_6_ready = ((io_select == 3'b110) && io_output_ready);
  assign io_inputs_7_ready = ((io_select == 3'b111) && io_output_ready);
  assign io_output_valid = t_io_output_valid;
  assign io_output_payload = t_io_output_payload;

endmodule

