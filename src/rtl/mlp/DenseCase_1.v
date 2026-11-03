// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module DenseCase_1 (
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
  reg        [7:0]    cntLv1;
  reg        [7:0]    cntLv2;
  wire                cntLv1Ovf;
  wire                cntLv2Ovf;
  reg        [1:0]    sel;
  wire                io_misc_fire;
  wire                io_main_fire;

  StreamDemux_17 deMux (
    .io_select          (deMux_io_select         ), //i
    .io_input_valid     (io_bus_valid            ), //i
    .io_input_ready     (deMux_io_input_ready    ), //o
    .io_outputs_0_valid (deMux_io_outputs_0_valid), //o
    .io_outputs_0_ready (io_misc_ready           ), //i
    .io_outputs_1_valid (deMux_io_outputs_1_valid), //o
    .io_outputs_1_ready (io_main_ready           )  //i
  );
  assign io_bus_ready = deMux_io_input_ready;
  assign io_main_valid = deMux_io_outputs_1_valid;
  assign io_misc_valid = deMux_io_outputs_0_valid;
  assign cntLv1Ovf = (cntLv1 == 8'h1f);
  assign cntLv2Ovf = (cntLv2 == 8'h03);
  assign io_misc_fire = (io_misc_valid && io_misc_ready);
  assign io_main_fire = (io_main_valid && io_main_ready);
  always @(*) begin
    if(((sel == 2'b00) || (sel == 2'b01))) begin
      deMux_io_select = 1'b0;
    end else begin
      deMux_io_select = 1'b1;
    end
  end

  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      cntLv1 <= 8'h0;
      cntLv2 <= 8'h0;
      sel <= 2'b00;
    end else begin
      if((io_misc_fire && (sel == 2'b00))) begin
        sel <= 2'b01;
      end
      if((io_misc_fire && (sel == 2'b01))) begin
        sel <= 2'b10;
      end
      if(io_main_fire) begin
        cntLv1 <= (cntLv1 + 8'h01);
        if(cntLv1Ovf) begin
          cntLv1 <= 8'h0;
          cntLv2 <= (cntLv2 + 8'h01);
          sel <= 2'b01;
          if(cntLv2Ovf) begin
            cntLv2 <= 8'h0;
            sel <= 2'b00;
          end
        end
      end
    end
  end


endmodule

//StreamFifo_38 replaced by StreamFifo_114

//StreamFifo_37 replaced by StreamFifo_120

