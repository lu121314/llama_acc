// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SerialRoPE_1 (
  input  wire [15:0]   io_pos,
  input  wire          io_input_0_valid,
  input  wire [15:0]   io_input_0_tdata,
  input  wire [5:0]    io_input_0_tuser,
  output wire          output_tvalid,
  output wire [15:0]   output_tdata,
  output wire [5:0]    output_tuser,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                indexGen_pos_valid;
  wire                rotator_io_output_valid;
  wire       [15:0]   rotator_io_output_payload_A;
  wire       [15:0]   rotator_io_output_payload_B;
  wire                indexGen_index_tvalid;
  wire       [15:0]   indexGen_index_tdata;
  wire                cosSinGen_2_index_tready;
  wire                cosSinGen_2_sinCos_tvalid;
  wire       [31:0]   cosSinGen_2_sinCos_tdata;
  wire                qkFlow_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   qkFlow_mul_ip_m_axis_result_tdata;
  wire                qkRotateFlow_mul_ip_m_axis_result_tvalid;
  wire       [15:0]   qkRotateFlow_mul_ip_m_axis_result_tdata;
  wire                rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  wire       [15:0]   rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tdata;
  reg        [5:0]    t_ropeTgM_tuser_4;
  wire       [1:0]    t_ropeTgM_tuser_5;
  wire       [5:0]    t_ropeTgM_tuser;
  wire                ropeErr;
  wire       [2:0]    t_ropeTgM_tuser_1;
  wire                t_ropeTgM_tuser_2;
  wire                t_ropeTgM_tuser_3;
  wire                ropeTgM_valid;
  wire       [15:0]   ropeTgM_tdata;
  wire       [5:0]    ropeTgM_tuser;
  reg                 ropeIn_tvalid;
  reg        [15:0]   ropeIn_tdata;
  reg        [5:0]    ropeIn_tuser;
  reg        [6:0]    inCnt;
  wire                inCntOvf;
  wire                inCntZero;
  wire                usrStream_valid;
  reg                 usrStream_ready;
  wire       [5:0]    usrStream_payload;
  wire                usrStream_m2sPipe_valid;
  reg                 usrStream_m2sPipe_ready;
  wire       [5:0]    usrStream_m2sPipe_payload;
  reg                 usrStream_rValid;
  reg        [5:0]    usrStream_rData;
  wire                usrStreamPipe_valid;
  wire                usrStreamPipe_ready;
  wire       [5:0]    usrStreamPipe_payload;
  reg                 usrStream_m2sPipe_rValid;
  reg        [5:0]    usrStream_m2sPipe_rData;
  wire                indexMon_tvalid;
  wire       [15:0]   indexMon_tdata;
  wire                rope_indexGen_index_fire;
  wire                joinEvent_valid;
  wire                qkFlow_valid;
  wire       [15:0]   qkFlow_payload;
  wire                cosFlow_tvalid;
  wire       [15:0]   cosFlow_tdata;
  wire                qkRotateFlow_valid;
  wire       [15:0]   qkRotateFlow_payload;
  wire                sinFlow_tvalid;
  wire       [15:0]   sinFlow_tdata;
  reg        [6:0]    outCnt;
  wire                outCntOvf;

  assign t_ropeTgM_tuser_5 = {t_ropeTgM_tuser_3,t_ropeTgM_tuser_2};
  RoPERotate_1 rotator (
    .io_input_valid      (ropeIn_tvalid                    ), //i
    .io_input_payload    (ropeIn_tdata[15:0]               ), //i
    .io_output_valid     (rotator_io_output_valid          ), //o
    .io_output_payload_A (rotator_io_output_payload_A[15:0]), //o
    .io_output_payload_B (rotator_io_output_payload_B[15:0]), //o
    .cfg_dim             (7'h7f                            ), //i
    .clk_0_clk           (clk_0_clk                        ), //i
    .clk_0_resetn        (clk_0_resetn                     )  //i
  );
  CosSinIndexGen_1 indexGen (
    .pos_valid    (indexGen_pos_valid        ), //i
    .pos_payload  (io_pos[15:0]              ), //i
    .index_tvalid (indexGen_index_tvalid     ), //o
    .index_tready (cosSinGen_2_index_tready  ), //i
    .index_tdata  (indexGen_index_tdata[15:0]), //o
    .clk_0_clk    (clk_0_clk                 ), //i
    .clk_0_resetn (clk_0_resetn              )  //i
  );
  CosSinGen_1 cosSinGen_2 (
    .index_tvalid  (indexGen_index_tvalid         ), //i
    .index_tready  (cosSinGen_2_index_tready      ), //o
    .index_tdata   (indexGen_index_tdata[15:0]    ), //i
    .sinCos_tvalid (cosSinGen_2_sinCos_tvalid     ), //o
    .sinCos_tready (rotator_io_output_valid       ), //i
    .sinCos_tdata  (cosSinGen_2_sinCos_tdata[31:0]), //o
    .clk_0_clk     (clk_0_clk                     ), //i
    .clk_0_resetn  (clk_0_resetn                  )  //i
  );
  fp16mul6 qkFlow_mul_ip (
    .aclk                 (clk_0_clk                              ), //i
    .s_axis_a_tvalid      (qkFlow_valid                           ), //i
    .s_axis_a_tdata       (qkFlow_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (cosFlow_tvalid                         ), //i
    .s_axis_b_tdata       (cosFlow_tdata[15:0]                    ), //i
    .m_axis_result_tvalid (qkFlow_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (qkFlow_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16mul6 qkRotateFlow_mul_ip (
    .aclk                 (clk_0_clk                                    ), //i
    .s_axis_a_tvalid      (qkRotateFlow_valid                           ), //i
    .s_axis_a_tdata       (qkRotateFlow_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (sinFlow_tvalid                               ), //i
    .s_axis_b_tdata       (sinFlow_tdata[15:0]                          ), //i
    .m_axis_result_tvalid (qkRotateFlow_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (qkRotateFlow_mul_ip_m_axis_result_tdata[15:0])  //o
  );
  fp16add6 rope_qkFlow_mul_ip_m_axis_result_add_ip (
    .aclk                 (clk_0_clk                                                        ), //i
    .s_axis_a_tvalid      (qkFlow_mul_ip_m_axis_result_tvalid                               ), //i
    .s_axis_a_tdata       (qkFlow_mul_ip_m_axis_result_tdata[15:0]                          ), //i
    .s_axis_b_tvalid      (qkRotateFlow_mul_ip_m_axis_result_tvalid                         ), //i
    .s_axis_b_tdata       (qkRotateFlow_mul_ip_m_axis_result_tdata[15:0]                    ), //i
    .m_axis_result_tvalid (rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tdata[15:0])  //o
  );
  always @(*) begin
    case(t_ropeTgM_tuser_5)
      2'b00 : t_ropeTgM_tuser_4 = 6'h08;
      2'b01 : t_ropeTgM_tuser_4 = 6'h09;
      default : t_ropeTgM_tuser_4 = 6'h12;
    endcase
  end

  assign ropeErr = 1'b0;
  assign t_ropeTgM_tuser = io_input_0_tuser;
  assign t_ropeTgM_tuser_1 = {(t_ropeTgM_tuser == 6'h11),{(t_ropeTgM_tuser == 6'h06),(t_ropeTgM_tuser == 6'h05)}};
  assign t_ropeTgM_tuser_2 = t_ropeTgM_tuser_1[1];
  assign t_ropeTgM_tuser_3 = t_ropeTgM_tuser_1[2];
  assign ropeTgM_valid = (|(io_input_0_valid && (((io_input_0_tuser == 6'h05) || (io_input_0_tuser == 6'h06)) || (io_input_0_tuser == 6'h11))));
  assign ropeTgM_tdata = io_input_0_tdata;
  assign ropeTgM_tuser = t_ropeTgM_tuser_4;
  assign inCntOvf = (inCnt == 7'h7f);
  assign inCntZero = (inCnt == 7'h0);
  always @(*) begin
    usrStream_ready = usrStream_m2sPipe_ready;
    if((! usrStream_m2sPipe_valid)) begin
      usrStream_ready = 1'b1;
    end
  end

  assign usrStream_m2sPipe_valid = usrStream_rValid;
  assign usrStream_m2sPipe_payload = usrStream_rData;
  always @(*) begin
    usrStream_m2sPipe_ready = usrStreamPipe_ready;
    if((! usrStreamPipe_valid)) begin
      usrStream_m2sPipe_ready = 1'b1;
    end
  end

  assign usrStreamPipe_valid = usrStream_m2sPipe_rValid;
  assign usrStreamPipe_payload = usrStream_m2sPipe_rData;
  assign usrStream_valid = (inCntZero && ropeIn_tvalid);
  assign usrStream_payload = ropeIn_tuser;
  assign rope_indexGen_index_fire = (indexGen_index_tvalid && cosSinGen_2_index_tready);
  assign indexMon_tvalid = rope_indexGen_index_fire;
  assign indexMon_tdata = indexGen_index_tdata;
  assign indexGen_pos_valid = (ropeIn_tvalid && inCntZero);
  assign joinEvent_valid = rotator_io_output_valid;
  assign qkFlow_valid = joinEvent_valid;
  assign qkFlow_payload = rotator_io_output_payload_A;
  assign cosFlow_tvalid = joinEvent_valid;
  assign cosFlow_tdata = cosSinGen_2_sinCos_tdata[15 : 0];
  assign qkRotateFlow_valid = joinEvent_valid;
  assign qkRotateFlow_payload = rotator_io_output_payload_B;
  assign sinFlow_tvalid = joinEvent_valid;
  assign sinFlow_tdata = cosSinGen_2_sinCos_tdata[31 : 16];
  assign output_tvalid = rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tvalid;
  assign output_tdata = rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tdata;
  assign output_tuser = usrStreamPipe_payload;
  assign outCntOvf = (outCnt == 7'h7f);
  assign usrStreamPipe_ready = (rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tvalid && outCntOvf);
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      ropeIn_tvalid <= 1'b0;
      inCnt <= 7'h0;
      usrStream_rValid <= 1'b0;
      usrStream_m2sPipe_rValid <= 1'b0;
      outCnt <= 7'h0;
    end else begin
      ropeIn_tvalid <= ropeTgM_valid;
      if(usrStream_ready) begin
        usrStream_rValid <= usrStream_valid;
      end
      if(usrStream_m2sPipe_ready) begin
        usrStream_m2sPipe_rValid <= usrStream_m2sPipe_valid;
      end
      if(ropeIn_tvalid) begin
        inCnt <= (inCnt + 7'h01);
        if(inCntOvf) begin
          inCnt <= 7'h0;
        end
      end
      if(rope_qkFlow_mul_ip_m_axis_result_add_ip_m_axis_result_tvalid) begin
        outCnt <= (outCnt + 7'h01);
        if(outCntOvf) begin
          outCnt <= 7'h0;
        end
      end
    end
  end

  always @(posedge clk_0_clk) begin
    ropeIn_tdata <= ropeTgM_tdata;
    ropeIn_tuser <= ropeTgM_tuser;
    if(usrStream_ready) begin
      usrStream_rData <= usrStream_payload;
    end
    if(usrStream_m2sPipe_ready) begin
      usrStream_m2sPipe_rData <= usrStream_m2sPipe_payload;
    end
  end


endmodule

