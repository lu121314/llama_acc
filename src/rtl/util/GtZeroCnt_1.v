// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module GtZeroCnt_1 (
  input  wire          io_index_valid,
  input  wire          io_index_payload_last,
  input  wire [15:0]   io_index_payload_tdata,
  input  wire [5:0]    io_index_payload_tuser,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [15:0]   io_output_tdata,
  output wire [5:0]    io_output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  reg        [15:0]   cnt;
  wire                output_valid;
  reg                 output_ready;
  wire       [15:0]   output_tdata;
  wire       [5:0]    output_tuser;
  wire                output_m2sPipe_valid;
  wire                output_m2sPipe_ready;
  wire       [15:0]   output_m2sPipe_tdata;
  wire       [5:0]    output_m2sPipe_tuser;
  reg                 output_rValid;
  reg        [15:0]   t_output_m2sPipe_tdata;
  reg        [5:0]    t_output_m2sPipe_tuser;

  assign output_valid = (io_index_valid && io_index_payload_last);
  assign output_tdata = cnt;
  assign output_tuser = io_index_payload_tuser;
  always @(*) begin
    output_ready = output_m2sPipe_ready;
    if((! output_m2sPipe_valid)) begin
      output_ready = 1'b1;
    end
  end

  assign output_m2sPipe_valid = output_rValid;
  assign output_m2sPipe_tdata = t_output_m2sPipe_tdata;
  assign output_m2sPipe_tuser = t_output_m2sPipe_tuser;
  assign io_output_valid = output_m2sPipe_valid;
  assign output_m2sPipe_ready = io_output_ready;
  assign io_output_tdata = output_m2sPipe_tdata;
  assign io_output_tuser = output_m2sPipe_tuser;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      cnt <= 16'h0;
      output_rValid <= 1'b0;
    end else begin
      if(io_index_valid) begin
        cnt <= (cnt + 16'h0001);
        if(io_index_payload_last) begin
          cnt <= 16'h0;
        end
      end
      if(output_ready) begin
        output_rValid <= output_valid;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(output_ready) begin
      t_output_m2sPipe_tdata <= output_tdata;
      t_output_m2sPipe_tuser <= output_tuser;
    end
  end


endmodule

