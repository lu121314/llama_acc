// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module LinearQuant (
  input  wire          x_tvalid,
  input  wire [15:0]   x_tdata,
  input  wire          scale_tvalid,
  input  wire [15:0]   scale_tdata,
  input  wire          zero_tvalid,
  output wire          zero_tready,
  input  wire [7:0]    zero_tdata,
  output wire          q_tvalid,
  output wire [7:0]    q_tdata,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                x_regNext_div_ip_m_axis_result_tvalid;
  wire       [15:0]   x_regNext_div_ip_m_axis_result_tdata;
  wire                quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tvalid;
  wire       [15:0]   quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tdata;
  wire       [9:0]    t_add;
  wire       [15:0]   t_add_1;
  wire       [9:0]    t_add_2;
  wire       [9:0]    t_add_3;
  wire       [7:0]    t_q;
  reg                 x_regNext_valid;
  reg        [15:0]   x_regNext_payload;
  reg                 scale_regNext_valid;
  reg        [15:0]   scale_regNext_payload;
  reg                 quant_x_regNext_div_ip_m_axis_result_regNext_valid;
  reg        [15:0]   quant_x_regNext_div_ip_m_axis_result_regNext_payload;
  wire       [9:0]    add;
  reg        [7:0]    q;

  assign t_add_1 = quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tdata;
  assign t_add = t_add_1[9:0];
  assign t_add_2 = t_add_3;
  assign t_add_3 = {2'd0, zero_tdata};
  assign t_q = add[7:0];
  fp16div12 x_regNext_div_ip (
    .aclk                 (clk_1_clk                                 ), //i
    .s_axis_a_tvalid      (x_regNext_valid                           ), //i
    .s_axis_a_tdata       (x_regNext_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (scale_regNext_valid                       ), //i
    .s_axis_b_tdata       (scale_regNext_payload[15:0]               ), //i
    .m_axis_result_tvalid (x_regNext_div_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (x_regNext_div_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16toint9d4 quant_x_regNext_div_ip_m_axis_result_regNext_to_ip (
    .aclk                 (clk_1_clk                                                                   ), //i
    .s_axis_a_tvalid      (quant_x_regNext_div_ip_m_axis_result_regNext_valid                          ), //i
    .s_axis_a_tdata       (quant_x_regNext_div_ip_m_axis_result_regNext_payload[15:0]                  ), //i
    .m_axis_result_tvalid (quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tdata[15:0])  //o
  );
  assign zero_tready = quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tvalid;
  assign add = ($signed(t_add) + $signed(t_add_2));
  always @(*) begin
    q = t_q;
    if(($signed(add) < $signed(10'h0))) begin
      q = 8'h0;
    end
    if(($signed(10'h100) <= $signed(add))) begin
      q = 8'hff;
    end
  end

  assign q_tvalid = quant_x_regNext_div_ip_m_axis_result_regNext_to_ip_m_axis_result_tvalid;
  assign q_tdata = q;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      x_regNext_valid <= 1'b0;
      scale_regNext_valid <= 1'b0;
      quant_x_regNext_div_ip_m_axis_result_regNext_valid <= 1'b0;
    end else begin
      x_regNext_valid <= x_tvalid;
      scale_regNext_valid <= scale_tvalid;
      quant_x_regNext_div_ip_m_axis_result_regNext_valid <= x_regNext_div_ip_m_axis_result_tvalid;
    end
  end

  always @(posedge clk_1_clk) begin
    x_regNext_payload <= x_tdata;
    scale_regNext_payload <= scale_tdata;
    quant_x_regNext_div_ip_m_axis_result_regNext_payload <= x_regNext_div_ip_m_axis_result_tdata;
  end


endmodule

