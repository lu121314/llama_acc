// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module CosSinIndexGen (
  input  wire          pos_valid,
  input  wire [15:0]   pos_payload,
  output wire          index_tvalid,
  input  wire          index_tready,
  output wire [15:0]   index_tdata,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire       [13:0]   pipe_io_push_payload;
  reg                 pipe_io_pop_ready;
  wire                rom_io_invFreq_valid;
  wire       [31:0]   rom_io_invFreq_payload;
  wire                posIn_from_ip_m_axis_result_tvalid;
  wire       [31:0]   posIn_from_ip_m_axis_result_tdata;
  wire                indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tvalid;
  wire       [31:0]   indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tdata;
  wire                indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid;
  wire       [31:0]   indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tdata;
  wire                pipe_io_push_ready;
  wire                pipe_io_pop_valid;
  wire       [13:0]   pipe_io_pop_payload;
  wire       [7:0]    pipe_io_occupancy;
  wire       [7:0]    pipe_io_availability;
  wire       [15:0]   t_index_tdata;
  reg                 flag;
  reg        [6:0]    posCnt;
  wire                posIn_valid;
  wire       [15:0]   posIn_payload;
  wire                invFreqFlow_valid;
  wire       [31:0]   invFreqFlow_payload;
  wire                pipeOut_valid;
  wire                pipeOut_ready;
  wire       [13:0]   pipeOut_payload;
  reg                 indexGen_pipe_io_pop_rValid;
  reg        [13:0]   indexGen_pipe_io_pop_rData;

  assign t_index_tdata = {2'd0, pipeOut_payload};
  InvFreqRom rom (
    .io_invFreq_valid   (rom_io_invFreq_valid              ), //o
    .io_invFreq_ready   (posIn_from_ip_m_axis_result_tvalid), //i
    .io_invFreq_payload (rom_io_invFreq_payload[31:0]      ), //o
    .clk_1_clk          (clk_1_clk                         ), //i
    .clk_1_resetn       (clk_1_resetn                      )  //i
  );
  fp32int16d4 posIn_from_ip (
    .aclk                 (clk_1_clk                              ), //i
    .s_axis_a_tvalid      (posIn_valid                            ), //i
    .s_axis_a_tdata       (posIn_payload[15:0]                    ), //i
    .m_axis_result_tvalid (posIn_from_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (posIn_from_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32mul8 indexGen_posIn_from_ip_m_axis_result_mul_ip (
    .aclk                 (clk_1_clk                                                            ), //i
    .s_axis_a_tvalid      (posIn_from_ip_m_axis_result_tvalid                                   ), //i
    .s_axis_a_tdata       (posIn_from_ip_m_axis_result_tdata[31:0]                              ), //i
    .s_axis_b_tvalid      (invFreqFlow_valid                                                    ), //i
    .s_axis_b_tdata       (invFreqFlow_payload[31:0]                                            ), //i
    .m_axis_result_tvalid (indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tdata[31:0])  //o
  );
  fp32toint32d6 indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip (
    .aclk                 (clk_1_clk                                                                                         ), //i
    .s_axis_a_tvalid      (indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tvalid                                  ), //i
    .s_axis_a_tdata       (indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_tdata[31:0]                             ), //i
    .m_axis_result_tvalid (indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tdata[31:0])  //o
  );
  StreamFifo_133 pipe (
    .io_push_valid   (indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tvalid), //i
    .io_push_ready   (pipe_io_push_ready                                                                           ), //o
    .io_push_payload (pipe_io_push_payload[13:0]                                                                   ), //i
    .io_pop_valid    (pipe_io_pop_valid                                                                            ), //o
    .io_pop_ready    (pipe_io_pop_ready                                                                            ), //i
    .io_pop_payload  (pipe_io_pop_payload[13:0]                                                                    ), //o
    .io_flush        (1'b0                                                                                         ), //i
    .io_occupancy    (pipe_io_occupancy[7:0]                                                                       ), //o
    .io_availability (pipe_io_availability[7:0]                                                                    ), //o
    .clk_1_clk       (clk_1_clk                                                                                    ), //i
    .clk_1_resetn    (clk_1_resetn                                                                                 )  //i
  );
  assign posIn_valid = flag;
  assign posIn_payload = pos_payload;
  assign invFreqFlow_valid = posIn_from_ip_m_axis_result_tvalid;
  assign invFreqFlow_payload = rom_io_invFreq_payload;
  assign pipe_io_push_payload = indexGen_indexGen_posIn_from_ip_m_axis_result_mul_ip_m_axis_result_to_ip_m_axis_result_tdata[13 : 0];
  always @(*) begin
    pipe_io_pop_ready = pipeOut_ready;
    if((! pipeOut_valid)) begin
      pipe_io_pop_ready = 1'b1;
    end
  end

  assign pipeOut_valid = indexGen_pipe_io_pop_rValid;
  assign pipeOut_payload = indexGen_pipe_io_pop_rData;
  assign index_tvalid = pipeOut_valid;
  assign pipeOut_ready = index_tready;
  assign index_tdata = t_index_tdata;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      flag <= 1'b0;
      posCnt <= 7'h0;
      indexGen_pipe_io_pop_rValid <= 1'b0;
    end else begin
      if(pos_valid) begin
        flag <= 1'b1;
      end
      if(flag) begin
        posCnt <= (posCnt + 7'h01);
        if((posCnt == 7'h7f)) begin
          posCnt <= 7'h0;
          flag <= 1'b0;
        end
      end
      if(pipe_io_pop_ready) begin
        indexGen_pipe_io_pop_rValid <= pipe_io_pop_valid;
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(pipe_io_pop_ready) begin
      indexGen_pipe_io_pop_rData <= pipe_io_pop_payload;
    end
  end


endmodule

