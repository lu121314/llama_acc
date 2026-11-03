// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module KvCacheCase_1 (
  input  wire [12:0]   io_token,
  input  wire          io_bus_valid,
  output wire          io_bus_ready,
  output wire          io_main_valid,
  input  wire          io_main_ready,
  output wire          io_misc_valid,
  input  wire          io_misc_ready,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  reg        [0:0]    deMux_io_select;
  wire                deMux_io_input_ready;
  wire                deMux_io_outputs_0_valid;
  wire                deMux_io_outputs_1_valid;
  wire       [15:0]   t_cntLv1Ovf;
  wire       [8:0]    t_cntLv1Ovf_1;
  wire       [15:0]   t_cntLv2Ovf;
  wire       [13:0]   t_cntLv2Ovf_1;
  wire       [13:0]   kvCnt;
  wire       [8:0]    kvSzCnt;
  reg        [15:0]   cntLv1;
  reg        [15:0]   cntLv2;
  wire                cntLv1Ovf;
  wire                cntLv2Ovf;
  reg        [0:0]    sel;
  wire                io_misc_fire;
  wire                io_main_fire;
  reg                 kvSzCntZeroDly;

  assign t_cntLv1Ovf_1 = (kvSzCnt - 9'h001);
  assign t_cntLv1Ovf = {7'd0, t_cntLv1Ovf_1};
  assign t_cntLv2Ovf_1 = (kvCnt - 14'h0001);
  assign t_cntLv2Ovf = {2'd0, t_cntLv2Ovf_1};
  StreamDemux_17 deMux (
    .io_select          (deMux_io_select         ), //i
    .io_input_valid     (io_bus_valid            ), //i
    .io_input_ready     (deMux_io_input_ready    ), //o
    .io_outputs_0_valid (deMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (io_misc_ready           ), //i
    .io_outputs_1_valid (deMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (io_main_ready           )  //i
  );
  assign kvCnt = ({1'd0,io_token} <<< 1'd1);
  assign kvSzCnt = io_token[12 : 4];
  assign io_bus_ready = deMux_io_input_ready;
  assign io_main_valid = deMux_io_outputs_1_valid;
  assign io_misc_valid = deMux_io_outputs_0_valid;
  assign cntLv1Ovf = (cntLv1 == t_cntLv1Ovf);
  assign cntLv2Ovf = (cntLv2 == t_cntLv2Ovf);
  assign io_misc_fire = (io_misc_valid && io_misc_ready);
  assign io_main_fire = (io_main_valid && io_main_ready);
  always @(*) begin
    deMux_io_select = sel;
    if(kvSzCntZeroDly) begin
      deMux_io_select = 1'b1;
    end
  end

  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      cntLv1 <= 16'h0;
      cntLv2 <= 16'h0;
      sel <= 1'b0;
      kvSzCntZeroDly <= 1'b1;
    end else begin
      if(io_misc_fire) begin
        cntLv1 <= (cntLv1 + 16'h0001);
        if(cntLv1Ovf) begin
          cntLv1 <= 16'h0;
          sel <= 1'b1;
        end
      end
      if(io_main_fire) begin
        cntLv2 <= (cntLv2 + 16'h0001);
        if(cntLv2Ovf) begin
          cntLv2 <= 16'h0;
          sel <= 1'b0;
        end
      end
      kvSzCntZeroDly <= (kvSzCnt == 9'h0);
    end
  end


endmodule

