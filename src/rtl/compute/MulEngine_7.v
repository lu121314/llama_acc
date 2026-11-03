// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module MulEngine_7 (
  input  wire          wkvIn_tvalid,
  output wire          wkvIn_tready,
  input  wire [511:0]  wkvIn_tdata,
  input  wire          dotIn_tvalid,
  output wire          dotIn_tready,
  input  wire [511:0]  dotIn_tdata,
  input  wire          axpyIn_tvalid,
  output wire          axpyIn_tready,
  input  wire [15:0]   axpyIn_tdata,
  input  wire          scale_tvalid,
  output wire          scale_tready,
  input  wire [15:0]   scale_tdata,
  output wire          output_tvalid,
  input  wire          output_tready,
  output wire [511:0]  output_tdata,
  input  wire          cfg_tvalid,
  output wire          cfg_tready,
  input  wire [31:0]   cfg_tdata,
  output wire [5:0]    preCfgTag,
  output wire [16:0]   secondDim,
  input  wire          clk_0_clk,
  output wire          popVldNext,
  input  wire          clk_0_resetn
);

  wire       [0:0]    cfgDeMux_io_select;
  reg                 axpyLogic_inpRepeat_mul_ip_m_axis_result_tready;
  wire       [0:0]    mux_io_select;
  wire       [511:0]  fifo_io_push_payload;
  reg        [511:0]  mem_spinal_port0;
  wire                cfgDeMux_io_input_ready;
  wire                cfgDeMux_io_outputs_0_valid;
  wire       [31:0]   cfgDeMux_io_outputs_0_payload;
  wire                cfgDeMux_io_outputs_1_valid;
  wire       [31:0]   cfgDeMux_io_outputs_1_payload;
  wire                axpyLogic_inpRepeat_mul_ip_s_axis_a_tready;
  wire                axpyLogic_inpRepeat_mul_ip_s_axis_b_tready;
  wire                axpyLogic_inpRepeat_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   axpyLogic_inpRepeat_mul_ip_m_axis_result_tdata;
  wire                mux_io_inputs_0_ready;
  wire                mux_io_inputs_1_ready;
  wire                mux_io_output_valid;
  wire       [511:0]  mux_io_output_payload;
  wire                mul_io_res_valid;
  wire       [15:0]   mul_io_res_payload_0;
  wire       [15:0]   mul_io_res_payload_1;
  wire       [15:0]   mul_io_res_payload_2;
  wire       [15:0]   mul_io_res_payload_3;
  wire       [15:0]   mul_io_res_payload_4;
  wire       [15:0]   mul_io_res_payload_5;
  wire       [15:0]   mul_io_res_payload_6;
  wire       [15:0]   mul_io_res_payload_7;
  wire       [15:0]   mul_io_res_payload_8;
  wire       [15:0]   mul_io_res_payload_9;
  wire       [15:0]   mul_io_res_payload_10;
  wire       [15:0]   mul_io_res_payload_11;
  wire       [15:0]   mul_io_res_payload_12;
  wire       [15:0]   mul_io_res_payload_13;
  wire       [15:0]   mul_io_res_payload_14;
  wire       [15:0]   mul_io_res_payload_15;
  wire       [15:0]   mul_io_res_payload_16;
  wire       [15:0]   mul_io_res_payload_17;
  wire       [15:0]   mul_io_res_payload_18;
  wire       [15:0]   mul_io_res_payload_19;
  wire       [15:0]   mul_io_res_payload_20;
  wire       [15:0]   mul_io_res_payload_21;
  wire       [15:0]   mul_io_res_payload_22;
  wire       [15:0]   mul_io_res_payload_23;
  wire       [15:0]   mul_io_res_payload_24;
  wire       [15:0]   mul_io_res_payload_25;
  wire       [15:0]   mul_io_res_payload_26;
  wire       [15:0]   mul_io_res_payload_27;
  wire       [15:0]   mul_io_res_payload_28;
  wire       [15:0]   mul_io_res_payload_29;
  wire       [15:0]   mul_io_res_payload_30;
  wire       [15:0]   mul_io_res_payload_31;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [511:0]  fifo_io_pop_payload;
  wire                fifo_io_popVldNext;
  wire       [5:0]    fifo_io_occupancy;
  wire       [5:0]    fifo_io_availability;
  wire       [6:0]    t_dotLogic_inCntOvf;
  wire       [6:0]    t_dotLogic_popPre_valid;
  wire       [255:0]  t_axpyLogic_axpyOut_payload;
  wire       [255:0]  t_io_push_payload;
  wire                ram_rdPort_cmd_valid;
  wire       [4:0]    ram_rdPort_cmd_payload;
  wire       [511:0]  ram_rdPort_rsp;
  wire                ram_wrPort_valid;
  wire       [4:0]    ram_wrPort_payload_address;
  wire       [511:0]  ram_wrPort_payload_data;
  wire                dotLogic_enInc;
  (* max_fanout = 100 *) reg        [6:0]    dotLogic_cnt_0;
  reg        [16:0]   dotLogic_cnt_1;
  wire                dotLogic_cntOvf_0;
  wire                dotLogic_cntOvf_1;
  wire                dotLogic_cntOvfReduce;
  reg                 dotLogic_flag;
  reg                 dotLogic_notReadyFlag;
  (* max_fanout = 100 *) reg        [4:0]    dotLogic_inCnt;
  wire                dotLogic_inCntOvf;
  wire                dotIn_fire;
  wire                dotLogic_popPre_valid;
  reg                 dotLogic_popPre_ready;
  wire                dotLogic_dotOut_valid;
  wire                dotLogic_dotOut_ready;
  wire       [511:0]  dotLogic_dotOut_payload;
  wire                dotLogic_popPre_m2sPipe_valid;
  wire                dotLogic_popPre_m2sPipe_ready;
  reg                 dotLogic_popPre_rValid;
  wire                dotLogic_enIncPipe;
  reg        [6:0]    dotLogic_cntPipe_0;
  reg        [16:0]   dotLogic_cntPipe_1;
  wire                dotLogic_cntOvfPipe_0;
  wire                dotLogic_cntOvfPipe_1;
  wire                dotLogic_cntOvfReducePipe;
  wire                dotLogic_dotOut_fire;
  wire                dotLogic_clrCondPipe;
  wire                dotLogic_incCond;
  wire                dotLogic_clrCond;
  (* keep = "true" , max_fanout = 100 *) reg                 dotLogic_dotInReady;
  wire                axpyLogic_enInc;
  reg        [6:0]    axpyLogic_cnt_0;
  reg        [16:0]   axpyLogic_cnt_1;
  wire                axpyLogic_cntOvf_0;
  wire                axpyLogic_cntOvf_1;
  wire                axpyLogic_cntOvfReduce;
  wire                axpyLogic_inpHalt_valid;
  wire                axpyLogic_inpHalt_ready;
  wire       [15:0]   axpyLogic_inpHalt_payload;
  wire                axpyLogic_scaleHalt_valid;
  wire                axpyLogic_scaleHalt_ready;
  wire       [15:0]   axpyLogic_scaleHalt_payload;
  wire                axpyLogic_inpRepeat_valid;
  wire                axpyLogic_inpRepeat_ready;
  wire       [15:0]   axpyLogic_inpRepeat_payload;
  reg        [6:0]    t_axpyLogic_inpHalt_ready;
  wire                t_axpyLogic_inpHalt_ready_1;
  wire                axpyLogic_inpRepeat_fire;
  (* max_fanout = 100 *) wire                axpyLogic_res_valid;
  wire                axpyLogic_res_ready;
  wire       [15:0]   axpyLogic_res_payload;
  reg                 mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rValid;
  reg        [15:0]   mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rData;
  wire                axpyLogic_axpyOut_valid;
  wire                axpyLogic_axpyOut_ready;
  wire       [511:0]  axpyLogic_axpyOut_payload;
  wire                axpyLogic_incCond;
  wire                axpyLogic_clrCond;
  wire       [16:0]   secondDim_1;
  wire                join_valid;
  wire                join_ready;
  wire                join_fire;
  wire                act_valid;
  wire       [15:0]   act_payload_0;
  wire       [15:0]   act_payload_1;
  wire       [15:0]   act_payload_2;
  wire       [15:0]   act_payload_3;
  wire       [15:0]   act_payload_4;
  wire       [15:0]   act_payload_5;
  wire       [15:0]   act_payload_6;
  wire       [15:0]   act_payload_7;
  wire       [15:0]   act_payload_8;
  wire       [15:0]   act_payload_9;
  wire       [15:0]   act_payload_10;
  wire       [15:0]   act_payload_11;
  wire       [15:0]   act_payload_12;
  wire       [15:0]   act_payload_13;
  wire       [15:0]   act_payload_14;
  wire       [15:0]   act_payload_15;
  wire       [15:0]   act_payload_16;
  wire       [15:0]   act_payload_17;
  wire       [15:0]   act_payload_18;
  wire       [15:0]   act_payload_19;
  wire       [15:0]   act_payload_20;
  wire       [15:0]   act_payload_21;
  wire       [15:0]   act_payload_22;
  wire       [15:0]   act_payload_23;
  wire       [15:0]   act_payload_24;
  wire       [15:0]   act_payload_25;
  wire       [15:0]   act_payload_26;
  wire       [15:0]   act_payload_27;
  wire       [15:0]   act_payload_28;
  wire       [15:0]   act_payload_29;
  wire       [15:0]   act_payload_30;
  wire       [15:0]   act_payload_31;
  wire                wkv_valid;
  wire       [15:0]   wkv_payload_0;
  wire       [15:0]   wkv_payload_1;
  wire       [15:0]   wkv_payload_2;
  wire       [15:0]   wkv_payload_3;
  wire       [15:0]   wkv_payload_4;
  wire       [15:0]   wkv_payload_5;
  wire       [15:0]   wkv_payload_6;
  wire       [15:0]   wkv_payload_7;
  wire       [15:0]   wkv_payload_8;
  wire       [15:0]   wkv_payload_9;
  wire       [15:0]   wkv_payload_10;
  wire       [15:0]   wkv_payload_11;
  wire       [15:0]   wkv_payload_12;
  wire       [15:0]   wkv_payload_13;
  wire       [15:0]   wkv_payload_14;
  wire       [15:0]   wkv_payload_15;
  wire       [15:0]   wkv_payload_16;
  wire       [15:0]   wkv_payload_17;
  wire       [15:0]   wkv_payload_18;
  wire       [15:0]   wkv_payload_19;
  wire       [15:0]   wkv_payload_20;
  wire       [15:0]   wkv_payload_21;
  wire       [15:0]   wkv_payload_22;
  wire       [15:0]   wkv_payload_23;
  wire       [15:0]   wkv_payload_24;
  wire       [15:0]   wkv_payload_25;
  wire       [15:0]   wkv_payload_26;
  wire       [15:0]   wkv_payload_27;
  wire       [15:0]   wkv_payload_28;
  wire       [15:0]   wkv_payload_29;
  wire       [15:0]   wkv_payload_30;
  wire       [15:0]   wkv_payload_31;
  (* max_fanout = 100 *) reg                 ready;
  (* ram_style = "distributed" *) reg [511:0] mem [0:31];

  assign t_dotLogic_inCntOvf = {2'd0, dotLogic_inCnt};
  assign t_dotLogic_popPre_valid = {2'd0, dotLogic_inCnt};
  assign t_axpyLogic_axpyOut_payload = {axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,axpyLogic_res_payload}}}}}}}}}}}}}}};
  assign t_io_push_payload = {mul_io_res_payload_15,{mul_io_res_payload_14,{mul_io_res_payload_13,{mul_io_res_payload_12,{mul_io_res_payload_11,{mul_io_res_payload_10,{mul_io_res_payload_9,{mul_io_res_payload_8,{mul_io_res_payload_7,{mul_io_res_payload_6,{mul_io_res_payload_5,{mul_io_res_payload_4,{mul_io_res_payload_3,{mul_io_res_payload_2,{mul_io_res_payload_1,mul_io_res_payload_0}}}}}}}}}}}}}}};
  always @(posedge clk_0_clk) begin
    if(ram_rdPort_cmd_valid) begin
      mem_spinal_port0 <= mem[ram_rdPort_cmd_payload];
    end
  end

  always @(posedge clk_0_clk) begin
    if(ram_wrPort_valid) begin
      mem[ram_wrPort_payload_address] <= ram_wrPort_payload_data;
    end
  end

  StreamDemux_25 cfgDeMux (
    .io_select            (cfgDeMux_io_select                 ), //i
    .io_input_valid       (cfg_tvalid                         ), //i
    .io_input_ready       (cfgDeMux_io_input_ready            ), //o
    .io_input_payload     (cfg_tdata[31:0]                    ), //i
    .io_outputs_0_valid   (cfgDeMux_io_outputs_0_valid        ), //o
    .io_outputs_0_ready   (dotLogic_clrCondPipe               ), //i
    .io_outputs_0_payload (cfgDeMux_io_outputs_0_payload[31:0]), //o
    .io_outputs_1_valid   (cfgDeMux_io_outputs_1_valid        ), //o
    .io_outputs_1_ready   (axpyLogic_clrCond                  ), //i
    .io_outputs_1_payload (cfgDeMux_io_outputs_1_payload[31:0])  //o
  );
  fp16mul7s axpyLogic_inpRepeat_mul_ip (
    .aclk                 (clk_0_clk                                           ), //i
    .s_axis_a_tvalid      (axpyLogic_inpRepeat_valid                           ), //i
    .s_axis_a_tready      (axpyLogic_inpRepeat_mul_ip_s_axis_a_tready          ), //o
    .s_axis_a_tdata       (axpyLogic_inpRepeat_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (axpyLogic_scaleHalt_valid                           ), //i
    .s_axis_b_tready      (axpyLogic_inpRepeat_mul_ip_s_axis_b_tready          ), //o
    .s_axis_b_tdata       (axpyLogic_scaleHalt_payload[15:0]                   ), //i
    .m_axis_result_tvalid (axpyLogic_inpRepeat_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tready (axpyLogic_inpRepeat_mul_ip_m_axis_result_tready     ), //i
    .m_axis_result_tdata  (axpyLogic_inpRepeat_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  StreamMux_49 mux (
    .io_select           (mux_io_select                   ), //i
    .io_inputs_0_valid   (dotLogic_dotOut_valid           ), //i
    .io_inputs_0_ready   (mux_io_inputs_0_ready           ), //o
    .io_inputs_0_payload (dotLogic_dotOut_payload[511:0]  ), //i
    .io_inputs_1_valid   (axpyLogic_axpyOut_valid         ), //i
    .io_inputs_1_ready   (mux_io_inputs_1_ready           ), //o
    .io_inputs_1_payload (axpyLogic_axpyOut_payload[511:0]), //i
    .io_output_valid     (mux_io_output_valid             ), //o
    .io_output_ready     (join_fire                       ), //i
    .io_output_payload   (mux_io_output_payload[511:0]    )  //o
  );
  Vec2to1_7 mul (
    .io_in0_valid      (act_valid                  ), //i
    .io_in0_payload_0  (act_payload_0[15:0]        ), //i
    .io_in0_payload_1  (act_payload_1[15:0]        ), //i
    .io_in0_payload_2  (act_payload_2[15:0]        ), //i
    .io_in0_payload_3  (act_payload_3[15:0]        ), //i
    .io_in0_payload_4  (act_payload_4[15:0]        ), //i
    .io_in0_payload_5  (act_payload_5[15:0]        ), //i
    .io_in0_payload_6  (act_payload_6[15:0]        ), //i
    .io_in0_payload_7  (act_payload_7[15:0]        ), //i
    .io_in0_payload_8  (act_payload_8[15:0]        ), //i
    .io_in0_payload_9  (act_payload_9[15:0]        ), //i
    .io_in0_payload_10 (act_payload_10[15:0]       ), //i
    .io_in0_payload_11 (act_payload_11[15:0]       ), //i
    .io_in0_payload_12 (act_payload_12[15:0]       ), //i
    .io_in0_payload_13 (act_payload_13[15:0]       ), //i
    .io_in0_payload_14 (act_payload_14[15:0]       ), //i
    .io_in0_payload_15 (act_payload_15[15:0]       ), //i
    .io_in0_payload_16 (act_payload_16[15:0]       ), //i
    .io_in0_payload_17 (act_payload_17[15:0]       ), //i
    .io_in0_payload_18 (act_payload_18[15:0]       ), //i
    .io_in0_payload_19 (act_payload_19[15:0]       ), //i
    .io_in0_payload_20 (act_payload_20[15:0]       ), //i
    .io_in0_payload_21 (act_payload_21[15:0]       ), //i
    .io_in0_payload_22 (act_payload_22[15:0]       ), //i
    .io_in0_payload_23 (act_payload_23[15:0]       ), //i
    .io_in0_payload_24 (act_payload_24[15:0]       ), //i
    .io_in0_payload_25 (act_payload_25[15:0]       ), //i
    .io_in0_payload_26 (act_payload_26[15:0]       ), //i
    .io_in0_payload_27 (act_payload_27[15:0]       ), //i
    .io_in0_payload_28 (act_payload_28[15:0]       ), //i
    .io_in0_payload_29 (act_payload_29[15:0]       ), //i
    .io_in0_payload_30 (act_payload_30[15:0]       ), //i
    .io_in0_payload_31 (act_payload_31[15:0]       ), //i
    .io_in1_valid      (wkv_valid                  ), //i
    .io_in1_payload_0  (wkv_payload_0[15:0]        ), //i
    .io_in1_payload_1  (wkv_payload_1[15:0]        ), //i
    .io_in1_payload_2  (wkv_payload_2[15:0]        ), //i
    .io_in1_payload_3  (wkv_payload_3[15:0]        ), //i
    .io_in1_payload_4  (wkv_payload_4[15:0]        ), //i
    .io_in1_payload_5  (wkv_payload_5[15:0]        ), //i
    .io_in1_payload_6  (wkv_payload_6[15:0]        ), //i
    .io_in1_payload_7  (wkv_payload_7[15:0]        ), //i
    .io_in1_payload_8  (wkv_payload_8[15:0]        ), //i
    .io_in1_payload_9  (wkv_payload_9[15:0]        ), //i
    .io_in1_payload_10 (wkv_payload_10[15:0]       ), //i
    .io_in1_payload_11 (wkv_payload_11[15:0]       ), //i
    .io_in1_payload_12 (wkv_payload_12[15:0]       ), //i
    .io_in1_payload_13 (wkv_payload_13[15:0]       ), //i
    .io_in1_payload_14 (wkv_payload_14[15:0]       ), //i
    .io_in1_payload_15 (wkv_payload_15[15:0]       ), //i
    .io_in1_payload_16 (wkv_payload_16[15:0]       ), //i
    .io_in1_payload_17 (wkv_payload_17[15:0]       ), //i
    .io_in1_payload_18 (wkv_payload_18[15:0]       ), //i
    .io_in1_payload_19 (wkv_payload_19[15:0]       ), //i
    .io_in1_payload_20 (wkv_payload_20[15:0]       ), //i
    .io_in1_payload_21 (wkv_payload_21[15:0]       ), //i
    .io_in1_payload_22 (wkv_payload_22[15:0]       ), //i
    .io_in1_payload_23 (wkv_payload_23[15:0]       ), //i
    .io_in1_payload_24 (wkv_payload_24[15:0]       ), //i
    .io_in1_payload_25 (wkv_payload_25[15:0]       ), //i
    .io_in1_payload_26 (wkv_payload_26[15:0]       ), //i
    .io_in1_payload_27 (wkv_payload_27[15:0]       ), //i
    .io_in1_payload_28 (wkv_payload_28[15:0]       ), //i
    .io_in1_payload_29 (wkv_payload_29[15:0]       ), //i
    .io_in1_payload_30 (wkv_payload_30[15:0]       ), //i
    .io_in1_payload_31 (wkv_payload_31[15:0]       ), //i
    .io_res_valid      (mul_io_res_valid           ), //o
    .io_res_payload_0  (mul_io_res_payload_0[15:0] ), //o
    .io_res_payload_1  (mul_io_res_payload_1[15:0] ), //o
    .io_res_payload_2  (mul_io_res_payload_2[15:0] ), //o
    .io_res_payload_3  (mul_io_res_payload_3[15:0] ), //o
    .io_res_payload_4  (mul_io_res_payload_4[15:0] ), //o
    .io_res_payload_5  (mul_io_res_payload_5[15:0] ), //o
    .io_res_payload_6  (mul_io_res_payload_6[15:0] ), //o
    .io_res_payload_7  (mul_io_res_payload_7[15:0] ), //o
    .io_res_payload_8  (mul_io_res_payload_8[15:0] ), //o
    .io_res_payload_9  (mul_io_res_payload_9[15:0] ), //o
    .io_res_payload_10 (mul_io_res_payload_10[15:0]), //o
    .io_res_payload_11 (mul_io_res_payload_11[15:0]), //o
    .io_res_payload_12 (mul_io_res_payload_12[15:0]), //o
    .io_res_payload_13 (mul_io_res_payload_13[15:0]), //o
    .io_res_payload_14 (mul_io_res_payload_14[15:0]), //o
    .io_res_payload_15 (mul_io_res_payload_15[15:0]), //o
    .io_res_payload_16 (mul_io_res_payload_16[15:0]), //o
    .io_res_payload_17 (mul_io_res_payload_17[15:0]), //o
    .io_res_payload_18 (mul_io_res_payload_18[15:0]), //o
    .io_res_payload_19 (mul_io_res_payload_19[15:0]), //o
    .io_res_payload_20 (mul_io_res_payload_20[15:0]), //o
    .io_res_payload_21 (mul_io_res_payload_21[15:0]), //o
    .io_res_payload_22 (mul_io_res_payload_22[15:0]), //o
    .io_res_payload_23 (mul_io_res_payload_23[15:0]), //o
    .io_res_payload_24 (mul_io_res_payload_24[15:0]), //o
    .io_res_payload_25 (mul_io_res_payload_25[15:0]), //o
    .io_res_payload_26 (mul_io_res_payload_26[15:0]), //o
    .io_res_payload_27 (mul_io_res_payload_27[15:0]), //o
    .io_res_payload_28 (mul_io_res_payload_28[15:0]), //o
    .io_res_payload_29 (mul_io_res_payload_29[15:0]), //o
    .io_res_payload_30 (mul_io_res_payload_30[15:0]), //o
    .io_res_payload_31 (mul_io_res_payload_31[15:0]), //o
    .clk_0_clk         (clk_0_clk                  ), //i
    .clk_0_resetn      (clk_0_resetn               )  //i
  );
  StreamFifoVldProbe_7 fifo (
    .io_push_valid   (mul_io_res_valid           ), //i
    .io_push_ready   (fifo_io_push_ready         ), //o
    .io_push_payload (fifo_io_push_payload[511:0]), //i
    .io_pop_valid    (fifo_io_pop_valid          ), //o
    .io_pop_ready    (output_tready              ), //i
    .io_pop_payload  (fifo_io_pop_payload[511:0] ), //o
    .io_popVldNext   (fifo_io_popVldNext         ), //o
    .io_occupancy    (fifo_io_occupancy[5:0]     ), //o
    .io_availability (fifo_io_availability[5:0]  ), //o
    .clk_0_clk       (clk_0_clk                  ), //i
    .clk_0_resetn    (clk_0_resetn               )  //i
  );
  assign cfg_tready = cfgDeMux_io_input_ready;
  assign cfgDeMux_io_select = cfg_tdata[24];
  assign ram_rdPort_rsp = mem_spinal_port0;
  assign dotLogic_cntOvf_0 = (dotLogic_cnt_0 == cfgDeMux_io_outputs_0_payload[22 : 16]);
  assign dotLogic_cntOvf_1 = (dotLogic_cnt_1 == {cfgDeMux_io_outputs_0_payload[23],cfgDeMux_io_outputs_0_payload[15 : 0]});
  assign dotLogic_cntOvfReduce = (dotLogic_cntOvf_0 && dotLogic_cntOvf_1);
  assign dotLogic_inCntOvf = (t_dotLogic_inCntOvf == cfgDeMux_io_outputs_0_payload[22 : 16]);
  assign dotIn_fire = (dotIn_tvalid && dotIn_tready);
  assign dotLogic_popPre_valid = (dotLogic_flag ? 1'b1 : (dotLogic_cnt_0 < t_dotLogic_popPre_valid));
  assign ram_wrPort_valid = dotIn_fire;
  assign ram_wrPort_payload_address = dotLogic_inCnt;
  assign ram_wrPort_payload_data = dotIn_tdata;
  always @(*) begin
    dotLogic_popPre_ready = dotLogic_popPre_m2sPipe_ready;
    if((! dotLogic_popPre_m2sPipe_valid)) begin
      dotLogic_popPre_ready = 1'b1;
    end
  end

  assign dotLogic_popPre_m2sPipe_valid = dotLogic_popPre_rValid;
  assign dotLogic_dotOut_valid = dotLogic_popPre_m2sPipe_valid;
  assign dotLogic_popPre_m2sPipe_ready = dotLogic_dotOut_ready;
  assign dotLogic_dotOut_payload = ram_rdPort_rsp;
  assign ram_rdPort_cmd_valid = dotLogic_popPre_ready;
  assign ram_rdPort_cmd_payload = dotLogic_cnt_0[4:0];
  assign dotLogic_cntOvfPipe_0 = (dotLogic_cntPipe_0 == cfgDeMux_io_outputs_0_payload[22 : 16]);
  assign dotLogic_cntOvfPipe_1 = (dotLogic_cntPipe_1 == {cfgDeMux_io_outputs_0_payload[23],cfgDeMux_io_outputs_0_payload[15 : 0]});
  assign dotLogic_cntOvfReducePipe = (dotLogic_cntOvfPipe_0 && dotLogic_cntOvfPipe_1);
  assign dotLogic_dotOut_fire = (dotLogic_dotOut_valid && dotLogic_dotOut_ready);
  assign dotLogic_enIncPipe = dotLogic_dotOut_fire;
  assign dotLogic_clrCondPipe = (dotLogic_enIncPipe && dotLogic_cntOvfReducePipe);
  assign dotLogic_incCond = (dotLogic_popPre_valid && dotLogic_popPre_ready);
  assign dotLogic_clrCond = (dotLogic_incCond && dotLogic_cntOvfReduce);
  assign dotLogic_enInc = dotLogic_incCond;
  assign dotIn_tready = dotLogic_dotInReady;
  assign axpyLogic_cntOvf_0 = (axpyLogic_cnt_0 == cfgDeMux_io_outputs_1_payload[22 : 16]);
  assign axpyLogic_cntOvf_1 = (axpyLogic_cnt_1 == {cfgDeMux_io_outputs_1_payload[23],cfgDeMux_io_outputs_1_payload[15 : 0]});
  assign axpyLogic_cntOvfReduce = (axpyLogic_cntOvf_0 && axpyLogic_cntOvf_1);
  assign axpyLogic_inpHalt_valid = (axpyIn_tvalid && cfgDeMux_io_outputs_1_valid);
  assign axpyIn_tready = (axpyLogic_inpHalt_ready && cfgDeMux_io_outputs_1_valid);
  assign axpyLogic_inpHalt_payload = axpyIn_tdata;
  assign axpyLogic_scaleHalt_valid = (scale_tvalid && cfgDeMux_io_outputs_1_valid);
  assign scale_tready = (axpyLogic_scaleHalt_ready && cfgDeMux_io_outputs_1_valid);
  assign axpyLogic_scaleHalt_payload = scale_tdata;
  assign t_axpyLogic_inpHalt_ready_1 = (t_axpyLogic_inpHalt_ready == cfgDeMux_io_outputs_1_payload[22 : 16]);
  assign axpyLogic_inpRepeat_fire = (axpyLogic_inpRepeat_valid && axpyLogic_inpRepeat_ready);
  assign axpyLogic_inpRepeat_valid = axpyLogic_inpHalt_valid;
  assign axpyLogic_inpRepeat_payload = axpyLogic_inpHalt_payload;
  assign axpyLogic_inpHalt_ready = (axpyLogic_inpRepeat_ready && t_axpyLogic_inpHalt_ready_1);
  assign axpyLogic_inpRepeat_ready = axpyLogic_inpRepeat_mul_ip_s_axis_a_tready;
  assign axpyLogic_scaleHalt_ready = axpyLogic_inpRepeat_mul_ip_s_axis_b_tready;
  always @(*) begin
    axpyLogic_inpRepeat_mul_ip_m_axis_result_tready = axpyLogic_res_ready;
    if((! axpyLogic_res_valid)) begin
      axpyLogic_inpRepeat_mul_ip_m_axis_result_tready = 1'b1;
    end
  end

  assign axpyLogic_res_valid = mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rValid;
  assign axpyLogic_res_payload = mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rData;
  assign axpyLogic_axpyOut_valid = axpyLogic_res_valid;
  assign axpyLogic_res_ready = axpyLogic_axpyOut_ready;
  assign axpyLogic_axpyOut_payload = {axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,{axpyLogic_res_payload,t_axpyLogic_axpyOut_payload}}}}}}}}}}}}}}}};
  assign axpyLogic_incCond = (axpyLogic_res_valid && axpyLogic_res_ready);
  assign axpyLogic_clrCond = (axpyLogic_incCond && axpyLogic_cntOvfReduce);
  assign axpyLogic_enInc = axpyLogic_incCond;
  assign secondDim_1 = {cfgDeMux_io_outputs_1_payload[23],cfgDeMux_io_outputs_1_payload[15 : 0]};
  assign secondDim = secondDim_1;
  assign preCfgTag = cfgDeMux_io_outputs_1_payload[31 : 26];
  assign dotLogic_dotOut_ready = mux_io_inputs_0_ready;
  assign axpyLogic_axpyOut_ready = mux_io_inputs_1_ready;
  assign mux_io_select = axpyLogic_axpyOut_valid;
  assign wkvIn_tready = join_fire;
  assign join_valid = (wkvIn_tvalid && mux_io_output_valid);
  assign join_fire = (join_valid && join_ready);
  assign act_valid = join_fire;
  assign wkv_valid = join_fire;
  assign act_payload_0 = mux_io_output_payload[15 : 0];
  assign act_payload_1 = mux_io_output_payload[31 : 16];
  assign act_payload_2 = mux_io_output_payload[47 : 32];
  assign act_payload_3 = mux_io_output_payload[63 : 48];
  assign act_payload_4 = mux_io_output_payload[79 : 64];
  assign act_payload_5 = mux_io_output_payload[95 : 80];
  assign act_payload_6 = mux_io_output_payload[111 : 96];
  assign act_payload_7 = mux_io_output_payload[127 : 112];
  assign act_payload_8 = mux_io_output_payload[143 : 128];
  assign act_payload_9 = mux_io_output_payload[159 : 144];
  assign act_payload_10 = mux_io_output_payload[175 : 160];
  assign act_payload_11 = mux_io_output_payload[191 : 176];
  assign act_payload_12 = mux_io_output_payload[207 : 192];
  assign act_payload_13 = mux_io_output_payload[223 : 208];
  assign act_payload_14 = mux_io_output_payload[239 : 224];
  assign act_payload_15 = mux_io_output_payload[255 : 240];
  assign act_payload_16 = mux_io_output_payload[271 : 256];
  assign act_payload_17 = mux_io_output_payload[287 : 272];
  assign act_payload_18 = mux_io_output_payload[303 : 288];
  assign act_payload_19 = mux_io_output_payload[319 : 304];
  assign act_payload_20 = mux_io_output_payload[335 : 320];
  assign act_payload_21 = mux_io_output_payload[351 : 336];
  assign act_payload_22 = mux_io_output_payload[367 : 352];
  assign act_payload_23 = mux_io_output_payload[383 : 368];
  assign act_payload_24 = mux_io_output_payload[399 : 384];
  assign act_payload_25 = mux_io_output_payload[415 : 400];
  assign act_payload_26 = mux_io_output_payload[431 : 416];
  assign act_payload_27 = mux_io_output_payload[447 : 432];
  assign act_payload_28 = mux_io_output_payload[463 : 448];
  assign act_payload_29 = mux_io_output_payload[479 : 464];
  assign act_payload_30 = mux_io_output_payload[495 : 480];
  assign act_payload_31 = mux_io_output_payload[511 : 496];
  assign wkv_payload_0 = wkvIn_tdata[15 : 0];
  assign wkv_payload_1 = wkvIn_tdata[31 : 16];
  assign wkv_payload_2 = wkvIn_tdata[47 : 32];
  assign wkv_payload_3 = wkvIn_tdata[63 : 48];
  assign wkv_payload_4 = wkvIn_tdata[79 : 64];
  assign wkv_payload_5 = wkvIn_tdata[95 : 80];
  assign wkv_payload_6 = wkvIn_tdata[111 : 96];
  assign wkv_payload_7 = wkvIn_tdata[127 : 112];
  assign wkv_payload_8 = wkvIn_tdata[143 : 128];
  assign wkv_payload_9 = wkvIn_tdata[159 : 144];
  assign wkv_payload_10 = wkvIn_tdata[175 : 160];
  assign wkv_payload_11 = wkvIn_tdata[191 : 176];
  assign wkv_payload_12 = wkvIn_tdata[207 : 192];
  assign wkv_payload_13 = wkvIn_tdata[223 : 208];
  assign wkv_payload_14 = wkvIn_tdata[239 : 224];
  assign wkv_payload_15 = wkvIn_tdata[255 : 240];
  assign wkv_payload_16 = wkvIn_tdata[271 : 256];
  assign wkv_payload_17 = wkvIn_tdata[287 : 272];
  assign wkv_payload_18 = wkvIn_tdata[303 : 288];
  assign wkv_payload_19 = wkvIn_tdata[319 : 304];
  assign wkv_payload_20 = wkvIn_tdata[335 : 320];
  assign wkv_payload_21 = wkvIn_tdata[351 : 336];
  assign wkv_payload_22 = wkvIn_tdata[367 : 352];
  assign wkv_payload_23 = wkvIn_tdata[383 : 368];
  assign wkv_payload_24 = wkvIn_tdata[399 : 384];
  assign wkv_payload_25 = wkvIn_tdata[415 : 400];
  assign wkv_payload_26 = wkvIn_tdata[431 : 416];
  assign wkv_payload_27 = wkvIn_tdata[447 : 432];
  assign wkv_payload_28 = wkvIn_tdata[463 : 448];
  assign wkv_payload_29 = wkvIn_tdata[479 : 464];
  assign wkv_payload_30 = wkvIn_tdata[495 : 480];
  assign wkv_payload_31 = wkvIn_tdata[511 : 496];
  assign popVldNext = fifo_io_popVldNext;
  assign fifo_io_push_payload = {mul_io_res_payload_31,{mul_io_res_payload_30,{mul_io_res_payload_29,{mul_io_res_payload_28,{mul_io_res_payload_27,{mul_io_res_payload_26,{mul_io_res_payload_25,{mul_io_res_payload_24,{mul_io_res_payload_23,{mul_io_res_payload_22,{mul_io_res_payload_21,{mul_io_res_payload_20,{mul_io_res_payload_19,{mul_io_res_payload_18,{mul_io_res_payload_17,{mul_io_res_payload_16,t_io_push_payload}}}}}}}}}}}}}}}};
  assign output_tvalid = fifo_io_pop_valid;
  assign output_tdata = fifo_io_pop_payload;
  assign join_ready = ready;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      dotLogic_cnt_0 <= 7'h0;
      dotLogic_cnt_1 <= 17'h0;
      dotLogic_flag <= 1'b0;
      dotLogic_notReadyFlag <= 1'b0;
      dotLogic_inCnt <= 5'h0;
      dotLogic_popPre_rValid <= 1'b0;
      dotLogic_cntPipe_0 <= 7'h0;
      dotLogic_cntPipe_1 <= 17'h0;
      dotLogic_dotInReady <= 1'b0;
      axpyLogic_cnt_0 <= 7'h0;
      axpyLogic_cnt_1 <= 17'h0;
      t_axpyLogic_inpHalt_ready <= 7'h0;
      mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rValid <= 1'b0;
      ready <= 1'b0;
    end else begin
      if(dotLogic_enInc) begin
        dotLogic_cnt_0 <= (dotLogic_cnt_0 + 7'h01);
      end
      if((dotLogic_enInc && dotLogic_cntOvf_0)) begin
        dotLogic_cnt_0 <= 7'h0;
        dotLogic_cnt_1 <= (dotLogic_cnt_1 + 17'h00001);
      end
      if((dotLogic_enInc && (dotLogic_cntOvf_0 && dotLogic_cntOvf_1))) begin
        dotLogic_cnt_1 <= 17'h0;
      end
      if(dotIn_fire) begin
        dotLogic_inCnt <= (dotLogic_inCnt + 5'h01);
        if(dotLogic_inCntOvf) begin
          dotLogic_inCnt <= 5'h0;
          dotLogic_flag <= 1'b1;
          dotLogic_notReadyFlag <= 1'b1;
        end
      end
      if(dotLogic_popPre_ready) begin
        dotLogic_popPre_rValid <= dotLogic_popPre_valid;
      end
      if(dotLogic_enIncPipe) begin
        dotLogic_cntPipe_0 <= (dotLogic_cntPipe_0 + 7'h01);
      end
      if((dotLogic_enIncPipe && dotLogic_cntOvfPipe_0)) begin
        dotLogic_cntPipe_0 <= 7'h0;
        dotLogic_cntPipe_1 <= (dotLogic_cntPipe_1 + 17'h00001);
      end
      if((dotLogic_enIncPipe && (dotLogic_cntOvfPipe_0 && dotLogic_cntOvfPipe_1))) begin
        dotLogic_cntPipe_1 <= 17'h0;
      end
      if(dotLogic_clrCond) begin
        dotLogic_flag <= 1'b0;
      end
      if(dotLogic_clrCondPipe) begin
        dotLogic_notReadyFlag <= 1'b0;
      end
      if((cfgDeMux_io_outputs_0_valid && (! dotLogic_notReadyFlag))) begin
        dotLogic_dotInReady <= 1'b1;
      end
      if((dotIn_fire && dotLogic_inCntOvf)) begin
        dotLogic_dotInReady <= 1'b0;
      end
      if(axpyLogic_enInc) begin
        axpyLogic_cnt_0 <= (axpyLogic_cnt_0 + 7'h01);
      end
      if((axpyLogic_enInc && axpyLogic_cntOvf_0)) begin
        axpyLogic_cnt_0 <= 7'h0;
        axpyLogic_cnt_1 <= (axpyLogic_cnt_1 + 17'h00001);
      end
      if((axpyLogic_enInc && (axpyLogic_cntOvf_0 && axpyLogic_cntOvf_1))) begin
        axpyLogic_cnt_1 <= 17'h0;
      end
      if(axpyLogic_inpRepeat_fire) begin
        t_axpyLogic_inpHalt_ready <= (t_axpyLogic_inpHalt_ready + 7'h01);
        if(t_axpyLogic_inpHalt_ready_1) begin
          t_axpyLogic_inpHalt_ready <= 7'h0;
        end
      end
      if(axpyLogic_inpRepeat_mul_ip_m_axis_result_tready) begin
        mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rValid <= axpyLogic_inpRepeat_mul_ip_m_axis_result_tvalid;
      end
      ready <= (6'h08 <= fifo_io_availability);
    end
  end

  always @(posedge clk_0_clk) begin
    if(axpyLogic_inpRepeat_mul_ip_m_axis_result_tready) begin
      mul_axpyLogic_inpRepeat_mul_ip_m_axis_result_rData <= axpyLogic_inpRepeat_mul_ip_m_axis_result_tdata;
    end
  end


endmodule

//StreamFifo_102 replaced by StreamFifo_99

//StreamFifo_101 replaced by StreamFifo_99

//StreamFifo_100 replaced by StreamFifo_99

