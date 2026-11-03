// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SparseCase_1 (
  input  wire [5:0]    io_tag,
  input  wire          io_bus_valid,
  output wire          io_bus_ready,
  output wire          io_main_valid,
  input  wire          io_main_ready,
  output wire          io_misc_valid,
  input  wire          io_misc_ready,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                deMux_io_input_ready;
  wire                deMux_io_outputs_0_valid;
  wire                deMux_io_outputs_1_valid;
  wire       [7:0]    t_cntLv1Ovf;
  wire       [7:0]    t_cntLv2Ovf;
  wire       [1:0]    tagHit;
  wire       [7:0]    miscLenVec_0;
  wire       [7:0]    miscLenVec_1;
  wire       [7:0]    mainLenVec_0;
  wire       [7:0]    mainLenVec_1;
  wire                t_miscLen;
  wire       [7:0]    miscLen;
  wire       [7:0]    mainLen;
  reg        [7:0]    cntLv1;
  reg        [7:0]    cntLv2;
  wire                cntLv1Ovf;
  wire                cntLv2Ovf;
  reg        [0:0]    sel;
  wire                io_misc_fire;
  wire                io_main_fire;

  assign t_cntLv1Ovf = (miscLen - 8'h01);
  assign t_cntLv2Ovf = (mainLen - 8'h01);
  StreamDemux_17 deMux (
    .io_select          (sel                     ), //i
    .io_input_valid     (io_bus_valid            ), //i
    .io_input_ready     (deMux_io_input_ready    ), //o
    .io_outputs_0_valid (deMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (io_misc_ready           ), //i
    .io_outputs_1_valid (deMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (io_main_ready           )  //i
  );
  assign tagHit = {(6'h11 == io_tag),(6'h10 == io_tag)};
  assign miscLenVec_0 = 8'h01;
  assign miscLenVec_1 = 8'h01;
  assign mainLenVec_0 = 8'h0c;
  assign mainLenVec_1 = 8'h0c;
  assign t_miscLen = tagHit[0];
  assign miscLen = (t_miscLen ? miscLenVec_0 : miscLenVec_1);
  assign mainLen = (t_miscLen ? mainLenVec_0 : mainLenVec_1);
  assign io_bus_ready = deMux_io_input_ready;
  assign io_main_valid = deMux_io_outputs_1_valid;
  assign io_misc_valid = deMux_io_outputs_0_valid;
  assign cntLv1Ovf = (cntLv1 == t_cntLv1Ovf);
  assign cntLv2Ovf = (cntLv2 == t_cntLv2Ovf);
  assign io_misc_fire = (io_misc_valid && io_misc_ready);
  assign io_main_fire = (io_main_valid && io_main_ready);
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      cntLv1 <= 8'h0;
      cntLv2 <= 8'h0;
      sel <= 1'b0;
    end else begin
      if(io_misc_fire) begin
        cntLv1 <= (cntLv1 + 8'h01);
        if(cntLv1Ovf) begin
          cntLv1 <= 8'h0;
          sel <= 1'b1;
        end
      end
      if(io_main_fire) begin
        cntLv2 <= (cntLv2 + 8'h01);
        if(cntLv2Ovf) begin
          cntLv2 <= 8'h0;
          sel <= 1'b0;
        end
      end
    end
  end


endmodule

