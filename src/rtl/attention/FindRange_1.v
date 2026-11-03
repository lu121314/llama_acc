// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module FindRange_1 (
  input  wire          x_tvalid,
  input  wire [15:0]   x_tdata,
  output wire          max_tvalid,
  output wire [15:0]   max_tdata,
  output wire          min_tvalid,
  output wire [15:0]   min_tdata,
  input  wire [15:0]   cfg_length,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                x_lt_async_ip_m_axis_result_tvalid;
  wire       [7:0]    x_lt_async_ip_m_axis_result_tdata;
  wire                maxFlow_lt_async_ip_m_axis_result_tvalid;
  wire       [7:0]    maxFlow_lt_async_ip_m_axis_result_tdata;
  wire       [15:0]   t_cntAbout2Ovf;
  reg        [15:0]   cnt;
  wire                cntAbout2Ovf;
  reg                 cntOvf;
  reg                 maxFlow_valid;
  reg        [15:0]   maxFlow_payload;
  reg                 minFlow_valid;
  reg        [15:0]   minFlow_payload;
  wire                xLessThanMin_valid;
  wire                xLessThanMin_payload;
  wire                xGreaterThanMax_valid;
  wire                xGreaterThanMax_payload;
  reg        [15:0]   minNext;
  reg        [15:0]   maxNext;
  wire                vld;
  reg                 vldDly;
  reg        [15:0]   minNext_regNext;
  reg        [15:0]   maxNext_regNext;

  assign t_cntAbout2Ovf = (cfg_length - 16'h0001);
  fp16lt0 x_lt_async_ip (
    .s_axis_a_tvalid      (x_tvalid                              ), //i
    .s_axis_a_tdata       (x_tdata[15:0]                         ), //i
    .s_axis_b_tvalid      (minFlow_valid                         ), //i
    .s_axis_b_tdata       (minFlow_payload[15:0]                 ), //i
    .m_axis_result_tvalid (x_lt_async_ip_m_axis_result_tvalid    ), //o
    .m_axis_result_tdata  (x_lt_async_ip_m_axis_result_tdata[7:0])  //o
  );
  fp16lt0 maxFlow_lt_async_ip (
    .s_axis_a_tvalid      (maxFlow_valid                               ), //i
    .s_axis_a_tdata       (maxFlow_payload[15:0]                       ), //i
    .s_axis_b_tvalid      (x_tvalid                                    ), //i
    .s_axis_b_tdata       (x_tdata[15:0]                               ), //i
    .m_axis_result_tvalid (maxFlow_lt_async_ip_m_axis_result_tvalid    ), //o
    .m_axis_result_tdata  (maxFlow_lt_async_ip_m_axis_result_tdata[7:0])  //o
  );
  assign cntAbout2Ovf = (cnt == t_cntAbout2Ovf);
  always @(*) begin
    maxFlow_valid = x_tvalid;
    if(x_tvalid) begin
      if(cntOvf) begin
        maxFlow_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    minFlow_valid = x_tvalid;
    if(x_tvalid) begin
      if(cntOvf) begin
        minFlow_valid = 1'b0;
      end
    end
  end

  assign xLessThanMin_valid = x_lt_async_ip_m_axis_result_tvalid;
  assign xLessThanMin_payload = x_lt_async_ip_m_axis_result_tdata[0];
  assign xGreaterThanMax_valid = maxFlow_lt_async_ip_m_axis_result_tvalid;
  assign xGreaterThanMax_payload = maxFlow_lt_async_ip_m_axis_result_tdata[0];
  always @(*) begin
    minNext = minFlow_payload;
    if(x_tvalid) begin
      if(xLessThanMin_payload) begin
        minNext = x_tdata;
      end
    end
  end

  always @(*) begin
    maxNext = maxFlow_payload;
    if(x_tvalid) begin
      if(xGreaterThanMax_payload) begin
        maxNext = x_tdata;
      end
    end
  end

  assign vld = (x_tvalid && cntOvf);
  assign min_tvalid = vldDly;
  assign max_tvalid = vldDly;
  assign min_tdata = minNext_regNext;
  assign max_tdata = maxNext_regNext;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      cnt <= 16'h0;
      cntOvf <= 1'b0;
      maxFlow_payload <= 16'hfc00;
      minFlow_payload <= 16'h7c00;
      vldDly <= 1'b0;
    end else begin
      if(x_tvalid) begin
        cnt <= (cnt + 16'h0001);
        if(cntAbout2Ovf) begin
          cntOvf <= 1'b1;
        end
        if(cntOvf) begin
          cnt <= 16'h0;
          cntOvf <= 1'b0;
        end
      end
      if(x_tvalid) begin
        minFlow_payload <= minNext;
        maxFlow_payload <= maxNext;
        if(cntOvf) begin
          minFlow_payload <= 16'h7c00;
          maxFlow_payload <= 16'hfc00;
        end
      end
      vldDly <= vld;
    end
  end

  always @(posedge clk_0_clk) begin
    minNext_regNext <= minNext;
    maxNext_regNext <= maxNext;
  end


endmodule

