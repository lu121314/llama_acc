// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module Serial2Parallel_3 (
  input  wire          input_valid,
  input  wire [511:0]  input_tdata,
  input  wire [5:0]    input_tuser,
  output wire          output_tvalid,
  output wire [2047:0] output_tdata,
  output wire [5:0]    output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  reg        [511:0]  dataDly;
  reg        [5:0]    userDly;
  (* max_fanout = 100 , keep = "true" *) reg                 vldDly;
  (* max_fanout = 100 , keep = "true" *) reg                 outVld;
  (* max_fanout = 100 *) reg                 outVldCond;
  reg        [1:0]    cnt;
  wire                cntAboutToOvf;
  wire                cntOvf;
  wire       [511:0]  t_output_tdata;
  reg        [511:0]  t_output_tdata_1;
  reg        [511:0]  t_output_tdata_2;
  reg        [511:0]  t_output_tdata_3;

  assign cntAboutToOvf = (cnt == 2'b10);
  assign cntOvf = (cnt == 2'b11);
  assign t_output_tdata = dataDly;
  assign output_tdata = {t_output_tdata,{t_output_tdata_1,{t_output_tdata_2,t_output_tdata_3}}};
  assign output_tvalid = (outVldCond && vldDly);
  assign output_tuser = userDly;
  always @(posedge clk_0_clk) begin
    dataDly <= input_tdata;
    userDly <= input_tuser;
    if(vldDly) begin
      t_output_tdata_1 <= t_output_tdata;
    end
    if(vldDly) begin
      t_output_tdata_2 <= t_output_tdata_1;
    end
    if(vldDly) begin
      t_output_tdata_3 <= t_output_tdata_2;
    end
  end

  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      vldDly <= 1'b0;
      outVld <= 1'b0;
      outVldCond <= 1'b0;
      cnt <= 2'b00;
    end else begin
      vldDly <= input_valid;
      outVld <= input_valid;
      if(vldDly) begin
        cnt <= (cnt + 2'b01);
        if(cntAboutToOvf) begin
          outVldCond <= 1'b1;
        end
        if(cntOvf) begin
          outVldCond <= 1'b0;
          cnt <= 2'b00;
        end
      end
    end
  end


endmodule

//URAM16x16384Fifo_1 replaced by URAM16x16384Fifo_4

