// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SerialResAdd_1 (
  input  wire          io_dotOut_valid,
  input  wire [15:0]   io_dotOut_tdata,
  input  wire [5:0]    io_dotOut_tuser,
  output wire          io_output_valid,
  output wire          io_output_payload_last,
  output wire [15:0]   io_output_payload_tdata,
  output wire [5:0]    io_output_payload_tuser,
  input  wire          io_fromAllReduce_valid,
  input  wire [15:0]   io_fromAllReduce_tdata,
  input  wire [5:0]    io_fromAllReduce_tuser,
  input  wire          io_fromResBuf_valid,
  output wire          io_fromResBuf_ready,
  input  wire [15:0]   io_fromResBuf_payload,
  output wire          io_toResBuf_valid,
  output wire [15:0]   io_toResBuf_payload,
  input  wire          clk_0_clk,
  output wire          multiCore2Res_resAddProbe_valid,
  output wire [15:0]   multiCore2Res_resAddProbe_payload,
  input  wire          clk_0_resetn
);

  wire                io_fromResBuf_fifo_io_pop_ready;
  wire                io_fromResBuf_fifo_io_push_ready;
  wire                io_fromResBuf_fifo_io_pop_valid;
  wire       [15:0]   io_fromResBuf_fifo_io_pop_payload;
  wire       [5:0]    io_fromResBuf_fifo_io_occupancy;
  wire       [5:0]    io_fromResBuf_fifo_io_availability;
  wire                input_add_ip_m_axis_result_tvalid;
  wire       [15:0]   input_add_ip_m_axis_result_tdata;
  wire                input_valid;
  wire       [15:0]   input_payload;
  reg        [5:0]    io_dotOut_tuser_delay_1;
  reg        [5:0]    io_dotOut_tuser_delay_2;
  reg        [5:0]    io_dotOut_tuser_delay_3;
  reg        [5:0]    io_dotOut_tuser_delay_4;
  reg        [5:0]    io_dotOut_tuser_delay_5;
  reg        [5:0]    tuser;
  reg        [0:0]    multiCore_idCnt;
  reg        [15:0]   multiCore_bankCnt;
  wire                multiCore_idOvf;
  wire                multiCore_bankOvf;
  wire                multiCore_tobeAdded_valid;
  wire       [15:0]   multiCore_tobeAdded_payload;
  wire                multiCore_flag;
  wire                multiCore2Res_allReduce_valid;
  wire       [15:0]   multiCore2Res_allReduce_payload;
  reg        [0:0]    multiCore2Res_idCnt;
  reg        [15:0]   multiCore2Res_bankCnt;
  wire                multiCore2Res_idOvf;
  wire                multiCore2Res_bankOvf;
  wire                multiCore2Res_flag;
  (* max_fanout = 100 *) reg                 multiCore2Res_toResBuf_valid;
  wire       [15:0]   multiCore2Res_toResBuf_payload;
  reg        [15:0]   multiCore2Res_allReduce_payload_regNext;

  StreamFifo_33 io_fromResBuf_fifo (
    .io_push_valid   (io_fromResBuf_valid                    ), //i
    .io_push_ready   (io_fromResBuf_fifo_io_push_ready       ), //o
    .io_push_payload (io_fromResBuf_payload[15:0]            ), //i
    .io_pop_valid    (io_fromResBuf_fifo_io_pop_valid        ), //o
    .io_pop_ready    (io_fromResBuf_fifo_io_pop_ready        ), //i
    .io_pop_payload  (io_fromResBuf_fifo_io_pop_payload[15:0]), //o
    .io_flush        (1'b0                                   ), //i
    .io_occupancy    (io_fromResBuf_fifo_io_occupancy[5:0]   ), //o
    .io_availability (io_fromResBuf_fifo_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                              ), //i
    .clk_0_resetn    (clk_0_resetn                           )  //i
  );
  fp16add6 input_add_ip (
    .aclk                 (clk_0_clk                             ), //i
    .s_axis_a_tvalid      (input_valid                           ), //i
    .s_axis_a_tdata       (input_payload[15:0]                   ), //i
    .s_axis_b_tvalid      (multiCore_tobeAdded_valid             ), //i
    .s_axis_b_tdata       (multiCore_tobeAdded_payload[15:0]     ), //i
    .m_axis_result_tvalid (input_add_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tdata  (input_add_ip_m_axis_result_tdata[15:0])  //o
  );
  assign io_fromResBuf_ready = io_fromResBuf_fifo_io_push_ready;
  assign input_valid = (io_dotOut_valid && (io_dotOut_tuser == 6'h10));
  assign input_payload = io_dotOut_tdata;
  assign multiCore_idOvf = (multiCore_idCnt == 1'b1);
  assign multiCore_bankOvf = (multiCore_bankCnt == 16'h05ff);
  assign io_output_valid = input_add_ip_m_axis_result_tvalid;
  assign io_output_payload_tdata = input_add_ip_m_axis_result_tdata;
  assign io_output_payload_tuser = tuser;
  assign io_output_payload_last = 1'b1;
  assign multiCore_flag = (multiCore_idCnt == 1'b0);
  assign multiCore_tobeAdded_valid = input_valid;
  assign multiCore_tobeAdded_payload = (multiCore_flag ? io_fromResBuf_fifo_io_pop_payload : 16'h0);
  assign io_fromResBuf_fifo_io_pop_ready = (input_valid && multiCore_flag);
  assign multiCore2Res_allReduce_valid = (io_fromAllReduce_valid && (io_fromAllReduce_tuser == 6'h10));
  assign multiCore2Res_allReduce_payload = io_fromAllReduce_tdata;
  assign multiCore2Res_idOvf = (multiCore2Res_idCnt == 1'b1);
  assign multiCore2Res_bankOvf = (multiCore2Res_bankCnt == 16'h05ff);
  assign multiCore2Res_flag = (multiCore2Res_idCnt == 1'b0);
  assign multiCore2Res_toResBuf_payload = multiCore2Res_allReduce_payload_regNext;
  assign io_toResBuf_valid = multiCore2Res_toResBuf_valid;
  assign io_toResBuf_payload = multiCore2Res_toResBuf_payload;
  assign multiCore2Res_resAddProbe_valid = ((multiCore2Res_allReduce_valid && (multiCore2Res_bankCnt == 16'h0)) && multiCore2Res_flag);
  assign multiCore2Res_resAddProbe_payload = multiCore2Res_allReduce_payload;
  always @(posedge clk_0_clk) begin
    io_dotOut_tuser_delay_1 <= io_dotOut_tuser;
    io_dotOut_tuser_delay_2 <= io_dotOut_tuser_delay_1;
    io_dotOut_tuser_delay_3 <= io_dotOut_tuser_delay_2;
    io_dotOut_tuser_delay_4 <= io_dotOut_tuser_delay_3;
    io_dotOut_tuser_delay_5 <= io_dotOut_tuser_delay_4;
    tuser <= io_dotOut_tuser_delay_5;
    multiCore2Res_allReduce_payload_regNext <= multiCore2Res_allReduce_payload;
  end

  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      multiCore_idCnt <= 1'b0;
      multiCore_bankCnt <= 16'h0;
      multiCore2Res_idCnt <= 1'b0;
      multiCore2Res_bankCnt <= 16'h0;
      multiCore2Res_toResBuf_valid <= 1'b0;
    end else begin
      if(input_valid) begin
        multiCore_bankCnt <= (multiCore_bankCnt + 16'h0001);
        if(multiCore_bankOvf) begin
          multiCore_bankCnt <= 16'h0;
          multiCore_idCnt <= (multiCore_idCnt + 1'b1);
          if(multiCore_idOvf) begin
            multiCore_idCnt <= 1'b0;
          end
        end
      end
      if(multiCore2Res_allReduce_valid) begin
        multiCore2Res_bankCnt <= (multiCore2Res_bankCnt + 16'h0001);
        if(multiCore2Res_bankOvf) begin
          multiCore2Res_bankCnt <= 16'h0;
          multiCore2Res_idCnt <= (multiCore2Res_idCnt + 1'b1);
          if(multiCore2Res_idOvf) begin
            multiCore2Res_idCnt <= 1'b0;
          end
        end
      end
      multiCore2Res_toResBuf_valid <= (multiCore2Res_allReduce_valid && multiCore2Res_flag);
    end
  end


endmodule

