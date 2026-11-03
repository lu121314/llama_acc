// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module GreedySampler (
  input  wire          logits_valid,
  input  wire [15:0]   logits_tdata,
  input  wire [5:0]    logits_tuser,
  output wire          argmax_tvalid,
  output wire [16:0]   argmax_tdata,
  output wire          endOfDecode,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                maxFlow_lt_async_ip_m_axis_result_tvalid;
  wire       [7:0]    maxFlow_lt_async_ip_m_axis_result_tdata;
  wire                logitsIn_valid;
  wire       [15:0]   logitsIn_payload;
  wire                maxFlow_valid;
  reg        [15:0]   maxFlow_payload;
  reg        [16:0]   cnt;
  wire                cntOvf;
  wire                logitsProbe_tvalid;
  wire                logitsProbe_tlast;
  wire       [15:0]   logitsProbe_tdata;
  wire                xGreaterThanMax_valid;
  wire                xGreaterThanMax_payload;
  reg        [16:0]   index;
  reg        [16:0]   indexNext;
  reg        [15:0]   maxNext;
  wire                vld;
  reg                 vldDly;
  reg        [16:0]   indexDly;
  wire                argmax_valid;
  wire       [16:0]   argmax_payload;

  fp16lt0 maxFlow_lt_async_ip (
    .s_axis_a_tvalid      (maxFlow_valid                               ), //i
    .s_axis_a_tdata       (maxFlow_payload[15:0]                       ), //i
    .s_axis_b_tvalid      (logitsIn_valid                              ), //i
    .s_axis_b_tdata       (logitsIn_payload[15:0]                      ), //i
    .m_axis_result_tvalid (maxFlow_lt_async_ip_m_axis_result_tvalid    ), //o
    .m_axis_result_tdata  (maxFlow_lt_async_ip_m_axis_result_tdata[7:0])  //o
  );
  assign logitsIn_valid = (logits_valid && (logits_tuser == 6'h23));
  assign logitsIn_payload = logits_tdata;
  assign maxFlow_valid = logitsIn_valid;
  assign cntOvf = (cnt == 17'h1f4ff);
  assign logitsProbe_tvalid = logitsIn_valid;
  assign logitsProbe_tlast = cntOvf;
  assign logitsProbe_tdata = logitsIn_payload;
  assign xGreaterThanMax_valid = maxFlow_lt_async_ip_m_axis_result_tvalid;
  assign xGreaterThanMax_payload = maxFlow_lt_async_ip_m_axis_result_tdata[0];
  always @(*) begin
    indexNext = index;
    if(logitsIn_valid) begin
      if(xGreaterThanMax_payload) begin
        indexNext = cnt;
      end
    end
  end

  always @(*) begin
    maxNext = maxFlow_payload;
    if(logitsIn_valid) begin
      if(xGreaterThanMax_payload) begin
        maxNext = logitsIn_payload;
      end
    end
  end

  assign vld = (logitsIn_valid && cntOvf);
  assign argmax_valid = vldDly;
  assign argmax_payload = indexDly;
  assign argmax_tvalid = argmax_valid;
  assign argmax_tdata = argmax_payload;
  assign endOfDecode = 1'b0;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      maxFlow_payload <= 16'hfc00;
      cnt <= 17'h0;
      index <= 17'h0;
      vldDly <= 1'b0;
    end else begin
      if(logitsIn_valid) begin
        cnt <= (cnt + 17'h00001);
        if(cntOvf) begin
          cnt <= 17'h0;
        end
      end
      if(logitsIn_valid) begin
        maxFlow_payload <= maxNext;
        index <= indexNext;
        if(cntOvf) begin
          maxFlow_payload <= 16'hfc00;
          index <= 17'h0;
        end
      end
      vldDly <= vld;
    end
  end

  always @(posedge clk_1_clk) begin
    indexDly <= indexNext;
  end


endmodule

