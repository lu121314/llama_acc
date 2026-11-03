// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module VecOutSubMod (
  input  wire          io_lnOut_valid,
  input  wire [15:0]   io_lnOut_tdata,
  input  wire [5:0]    io_lnOut_tuser,
  input  wire          io_dotOut_valid,
  input  wire [15:0]   io_dotOut_tdata,
  input  wire [5:0]    io_dotOut_tuser,
  input  wire          io_ropeOut_valid,
  input  wire [15:0]   io_ropeOut_tdata,
  input  wire [5:0]    io_ropeOut_tuser,
  input  wire          io_busVecIn_valid,
  input  wire [2047:0] io_busVecIn_tdata,
  input  wire [5:0]    io_busVecIn_tuser,
  input  wire          io_engineVecIn_valid,
  input  wire [2047:0] io_engineVecIn_tdata,
  input  wire [5:0]    io_engineVecIn_tuser,
  output wire          io_vLocal_valid,
  output wire [2047:0] io_vLocal_tdata,
  output wire [5:0]    io_vLocal_tuser,
  output wire          io_vecOut_valid,
  input  wire          io_vecOut_ready,
  output wire [2047:0] io_vecOut_payload,
  input  wire          status_tokenIndexFlow_valid,
  input  wire [5:0]    status_tokenIndexFlow_payload,
  input  wire          status_enPredictor,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                prefillIn_fifo_io_pop_ready;
  wire                vecBuf_io_output_valid;
  wire       [2047:0] vecBuf_io_output_payload;
  wire                prefillIn_fifo_io_push_ready;
  wire                prefillIn_fifo_io_pop_valid;
  wire                prefillIn_fifo_io_pop_payload;
  wire       [6:0]    prefillIn_fifo_io_occupancy;
  wire       [6:0]    prefillIn_fifo_io_availability;
  wire                ropeOut_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   ropeOut_mul_ip_m_axis_result_tdata;
  wire                s2p_output_tvalid;
  wire       [2047:0] s2p_output_tdata;
  wire       [5:0]    s2p_output_tuser;
  reg        [15:0]   t_s2pInMux_tdata_1;
  reg        [5:0]    t_s2pInMux_tuser;
  reg        [2047:0] t_toBuf_tdata_1;
  reg        [5:0]    t_toBuf_tuser;
  wire                cond;
  wire                lnOut_valid;
  wire       [15:0]   lnOut_tdata;
  wire       [5:0]    lnOut_tuser;
  wire                dotOutPre_valid;
  wire       [15:0]   dotOutPre_tdata;
  wire       [5:0]    dotOutPre_tuser;
  wire                dotOut_valid;
  wire       [15:0]   dotOut_tdata;
  wire       [5:0]    dotOut_tuser;
  wire                ropeOut_valid;
  wire       [15:0]   ropeOut_payload;
  wire                prefillIn_valid;
  wire                prefillIn_ready;
  wire                prefillIn_payload;
  reg        [4:0]    layerCnt;
  reg                 lastLayer;
  wire                layerCntAbout2Ovf;
  wire                enLayerCntInc;
  reg        [10:0]   vCnt;
  wire                vCntOvf;
  wire                vCntVld;
  wire                sqrtD_valid;
  wire       [15:0]   sqrtD_payload;
  wire                rope2s2p_valid;
  wire       [15:0]   rope2s2p_tdata;
  wire       [5:0]    rope2s2p_tuser;
  wire                s2pInMux_valid;
  wire       [15:0]   s2pInMux_tdata;
  wire       [5:0]    s2pInMux_tuser;
  wire                s2pInErr;
  wire       [1:0]    t_s2pInMux_tdata;
  reg                 s2pIn_valid;
  reg        [15:0]   s2pIn_tdata;
  reg        [5:0]    s2pIn_tuser;
  wire                vLocalStream_valid;
  wire                vLocalStream_ready;
  wire       [2047:0] vLocalStream_tdata;
  wire       [5:0]    vLocalStream_tuser;
  wire                vLocal_valid;
  wire       [2047:0] vLocal_tdata;
  wire       [5:0]    vLocal_tuser;
  reg                 s2pToFifo_valid;
  reg        [2047:0] s2pToFifo_tdata;
  reg        [5:0]    s2pToFifo_tuser;
  wire                busVecInToFifo_valid;
  wire       [2047:0] busVecInToFifo_tdata;
  wire       [5:0]    busVecInToFifo_tuser;
  reg                 engineVecInToFifo_valid;
  reg        [2047:0] engineVecInToFifo_tdata;
  reg        [5:0]    engineVecInToFifo_tuser;
  wire                toBuf_valid;
  wire       [2047:0] toBuf_tdata;
  wire       [5:0]    toBuf_tuser;
  wire                toBufErr;
  wire       [1:0]    t_toBuf_tdata;
  reg                 toBuf_regNext_valid;
  reg        [2047:0] toBuf_regNext_tdata;
  reg        [5:0]    toBuf_regNext_tuser;

  VecOutBuf vecBuf (
    .io_input_valid                (toBuf_regNext_valid               ), //i
    .io_input_tdata                (toBuf_regNext_tdata[2047:0]       ), //i
    .io_input_tuser                (toBuf_regNext_tuser[5:0]          ), //i
    .io_output_valid               (vecBuf_io_output_valid            ), //o
    .io_output_ready               (io_vecOut_ready                   ), //i
    .io_output_payload             (vecBuf_io_output_payload[2047:0]  ), //o
    .status_tokenIndexFlow_valid   (status_tokenIndexFlow_valid       ), //i
    .status_tokenIndexFlow_payload (status_tokenIndexFlow_payload[5:0]), //i
    .status_enPredictor            (status_enPredictor                ), //i
    .clk_1_clk                     (clk_1_clk                         ), //i
    .clk_1_resetn                  (clk_1_resetn                      )  //i
  );
  StreamFifo_69 prefillIn_fifo (
    .io_push_valid   (prefillIn_valid                    ), //i
    .io_push_ready   (prefillIn_fifo_io_push_ready       ), //o
    .io_push_payload (prefillIn_payload                  ), //i
    .io_pop_valid    (prefillIn_fifo_io_pop_valid        ), //o
    .io_pop_ready    (prefillIn_fifo_io_pop_ready        ), //i
    .io_pop_payload  (prefillIn_fifo_io_pop_payload      ), //o
    .io_flush        (1'b0                               ), //i
    .io_occupancy    (prefillIn_fifo_io_occupancy[6:0]   ), //o
    .io_availability (prefillIn_fifo_io_availability[6:0]), //o
    .clk_1_clk       (clk_1_clk                          ), //i
    .clk_1_resetn    (clk_1_resetn                       )  //i
  );
  fp16mul6 ropeOut_mul_ip (
    .aclk                 (clk_1_clk                               ), //i
    .s_axis_a_tvalid      (ropeOut_valid                           ), //i
    .s_axis_a_tdata       (ropeOut_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (sqrtD_valid                             ), //i
    .s_axis_b_tdata       (sqrtD_payload[15:0]                     ), //i
    .m_axis_result_tvalid (ropeOut_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (ropeOut_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  Serial2Parallel s2p (
    .input_valid   (s2pIn_valid             ), //i
    .input_tdata   (s2pIn_tdata[15:0]       ), //i
    .input_tuser   (s2pIn_tuser[5:0]        ), //i
    .output_tvalid (s2p_output_tvalid       ), //o
    .output_tdata  (s2p_output_tdata[2047:0]), //o
    .output_tuser  (s2p_output_tuser[5:0]   ), //o
    .clk_1_clk     (clk_1_clk               ), //i
    .clk_1_resetn  (clk_1_resetn            )  //i
  );
  always @(*) begin
    case(t_s2pInMux_tdata)
      2'b00 : begin
        t_s2pInMux_tdata_1 = lnOut_tdata;
        t_s2pInMux_tuser = lnOut_tuser;
      end
      2'b01 : begin
        t_s2pInMux_tdata_1 = dotOut_tdata;
        t_s2pInMux_tuser = dotOut_tuser;
      end
      default : begin
        t_s2pInMux_tdata_1 = rope2s2p_tdata;
        t_s2pInMux_tuser = rope2s2p_tuser;
      end
    endcase
  end

  always @(*) begin
    case(t_toBuf_tdata)
      2'b00 : begin
        t_toBuf_tdata_1 = s2pToFifo_tdata;
        t_toBuf_tuser = s2pToFifo_tuser;
      end
      2'b01 : begin
        t_toBuf_tdata_1 = busVecInToFifo_tdata;
        t_toBuf_tuser = busVecInToFifo_tuser;
      end
      default : begin
        t_toBuf_tdata_1 = engineVecInToFifo_tdata;
        t_toBuf_tuser = engineVecInToFifo_tuser;
      end
    endcase
  end

  assign lnOut_valid = (io_lnOut_valid && (((io_lnOut_tuser == 6'h15) || (io_lnOut_tuser == 6'h22)) || (io_lnOut_tuser == 6'h04)));
  assign lnOut_tdata = io_lnOut_tdata;
  assign lnOut_tuser = io_lnOut_tuser;
  assign dotOutPre_valid = (io_dotOut_valid && ((io_dotOut_tuser == 6'h07) || (io_dotOut_tuser == 6'h13)));
  assign dotOutPre_tdata = io_dotOut_tdata;
  assign dotOutPre_tuser = io_dotOut_tuser;
  assign dotOut_valid = (dotOutPre_valid && (! cond));
  assign dotOut_tdata = dotOutPre_tdata;
  assign dotOut_tuser = dotOutPre_tuser;
  assign ropeOut_valid = (io_ropeOut_valid && (io_ropeOut_tuser == 6'h08));
  assign ropeOut_payload = io_ropeOut_tdata;
  assign prefillIn_valid = status_tokenIndexFlow_valid;
  assign prefillIn_payload = (status_tokenIndexFlow_payload == 6'h0);
  assign prefillIn_ready = prefillIn_fifo_io_push_ready;
  assign layerCntAbout2Ovf = (layerCnt == 5'h1a);
  assign vCntOvf = (vCnt == 11'h5ff);
  assign vCntVld = dotOutPre_valid;
  assign enLayerCntInc = (vCntVld && vCntOvf);
  assign prefillIn_fifo_io_pop_ready = (enLayerCntInc && lastLayer);
  assign cond = (prefillIn_fifo_io_pop_payload && lastLayer);
  assign sqrtD_payload = 16'h2da8;
  assign sqrtD_valid = 1'b1;
  assign rope2s2p_valid = ropeOut_mul_ip_m_axis_result_tvalid;
  assign rope2s2p_tdata = ropeOut_mul_ip_m_axis_result_tdata;
  assign rope2s2p_tuser = 6'h08;
  assign s2pInErr = 1'b0;
  assign s2pInMux_valid = (|{rope2s2p_valid,{dotOut_valid,lnOut_valid}});
  assign t_s2pInMux_tdata = {rope2s2p_valid,dotOut_valid};
  assign s2pInMux_tdata = t_s2pInMux_tdata_1;
  assign s2pInMux_tuser = t_s2pInMux_tuser;
  assign vLocal_valid = (s2p_output_tvalid && (s2p_output_tuser == 6'h07));
  assign vLocal_tdata = s2p_output_tdata;
  assign vLocal_tuser = s2p_output_tuser;
  assign io_vLocal_valid = vLocal_valid;
  assign io_vLocal_tdata = vLocal_tdata;
  assign io_vLocal_tuser = vLocal_tuser;
  assign busVecInToFifo_valid = (io_busVecIn_valid && ((((io_busVecIn_tuser == 6'h1f) || (io_busVecIn_tuser == 6'h0)) || (io_busVecIn_tuser == 6'h01)) || (io_busVecIn_tuser == 6'h02)));
  assign busVecInToFifo_tdata = io_busVecIn_tdata;
  assign busVecInToFifo_tuser = io_busVecIn_tuser;
  assign toBufErr = 1'b0;
  assign toBuf_valid = (|{engineVecInToFifo_valid,{busVecInToFifo_valid,s2pToFifo_valid}});
  assign t_toBuf_tdata = {engineVecInToFifo_valid,busVecInToFifo_valid};
  assign toBuf_tdata = t_toBuf_tdata_1;
  assign toBuf_tuser = t_toBuf_tuser;
  assign io_vecOut_valid = vecBuf_io_output_valid;
  assign io_vecOut_payload = vecBuf_io_output_payload;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      layerCnt <= 5'h0;
      lastLayer <= 1'b0;
      vCnt <= 11'h0;
      s2pIn_valid <= 1'b0;
      s2pToFifo_valid <= 1'b0;
      engineVecInToFifo_valid <= 1'b0;
      toBuf_regNext_valid <= 1'b0;
    end else begin
      if(enLayerCntInc) begin
        layerCnt <= (layerCnt + 5'h01);
        if(layerCntAbout2Ovf) begin
          lastLayer <= 1'b1;
        end
        if(lastLayer) begin
          layerCnt <= 5'h0;
          lastLayer <= 1'b0;
        end
      end
      if(vCntVld) begin
        vCnt <= (vCnt + 11'h001);
        if(vCntOvf) begin
          vCnt <= 11'h0;
        end
      end
      s2pIn_valid <= s2pInMux_valid;
      s2pToFifo_valid <= (s2p_output_tvalid && (((((s2p_output_tuser == 6'h04) || (s2p_output_tuser == 6'h15)) || (s2p_output_tuser == 6'h22)) || (s2p_output_tuser == 6'h08)) || (s2p_output_tuser == 6'h13)));
      engineVecInToFifo_valid <= (io_engineVecIn_valid && (io_engineVecIn_tuser == 6'h0f));
      toBuf_regNext_valid <= toBuf_valid;
    end
  end

  always @(posedge clk_1_clk) begin
    s2pIn_tdata <= s2pInMux_tdata;
    s2pIn_tuser <= s2pInMux_tuser;
    s2pToFifo_tdata <= s2p_output_tdata;
    s2pToFifo_tuser <= s2p_output_tuser;
    engineVecInToFifo_tdata <= io_engineVecIn_tdata;
    engineVecInToFifo_tuser <= io_engineVecIn_tuser;
    toBuf_regNext_tdata <= toBuf_tdata;
    toBuf_regNext_tuser <= toBuf_tuser;
  end


endmodule

