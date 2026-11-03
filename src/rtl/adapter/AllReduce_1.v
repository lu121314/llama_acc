// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module AllReduce_1 (
  input  wire          input_valid,
  input  wire [15:0]   input_tdata,
  input  wire [5:0]    input_tuser,
  input  wire [0:0]    input_tdest,
  output wire          output_tvalid,
  output wire [15:0]   output_tdata,
  output wire [5:0]    output_tuser,
  input  wire          clk_0_resetn,
  input  wire          clk_0_clk
);

  wire                multiCore_tuser_fifo_io_push_ready;
  wire                multiCore_tuser_fifo_io_pop_valid;
  wire       [5:0]    multiCore_tuser_fifo_io_pop_payload;
  wire       [5:0]    multiCore_tuser_fifo_io_occupancy;
  wire       [5:0]    multiCore_tuser_fifo_io_availability;
  wire                multiCore_accIn_acc_ip_m_axis_result_tvalid;
  wire                multiCore_accIn_acc_ip_m_axis_result_tlast;
  wire       [15:0]   multiCore_accIn_acc_ip_m_axis_result_tdata;
  wire                input_valid_1;
  wire       [15:0]   input_tdata_1;
  wire       [5:0]    input_tuser_1;
  wire                cond;
  wire                multiCore_tuser_valid;
  wire                multiCore_tuser_ready;
  wire       [5:0]    multiCore_tuser_payload;
  reg        [0:0]    multiCore_idCnt;
  wire                multiCore_idOvf;
  wire                multiCore_accIn_valid;
  wire                multiCore_accIn_payload_last;
  wire       [15:0]   multiCore_accIn_payload_fragment;

  StreamFifo_96 multiCore_tuser_fifo (
    .io_push_valid   (multiCore_tuser_valid                    ), //i
    .io_push_ready   (multiCore_tuser_fifo_io_push_ready       ), //o
    .io_push_payload (multiCore_tuser_payload[5:0]             ), //i
    .io_pop_valid    (multiCore_tuser_fifo_io_pop_valid        ), //o
    .io_pop_ready    (output_tvalid                            ), //i
    .io_pop_payload  (multiCore_tuser_fifo_io_pop_payload[5:0] ), //o
    .io_flush        (1'b0                                     ), //i
    .io_occupancy    (multiCore_tuser_fifo_io_occupancy[5:0]   ), //o
    .io_availability (multiCore_tuser_fifo_io_availability[5:0]), //o
    .clk_0_clk       (clk_0_clk                                ), //i
    .clk_0_resetn    (clk_0_resetn                             )  //i
  );
  fp16acc16 multiCore_accIn_acc_ip (
    .aclk                 (clk_0_clk                                       ), //i
    .aresetn              (clk_0_resetn                                    ), //i
    .s_axis_a_tvalid      (multiCore_accIn_valid                           ), //i
    .s_axis_a_tlast       (multiCore_accIn_payload_last                    ), //i
    .s_axis_a_tdata       (multiCore_accIn_payload_fragment[15:0]          ), //i
    .m_axis_result_tvalid (multiCore_accIn_acc_ip_m_axis_result_tvalid     ), //o
    .m_axis_result_tlast  (multiCore_accIn_acc_ip_m_axis_result_tlast      ), //o
    .m_axis_result_tdata  (multiCore_accIn_acc_ip_m_axis_result_tdata[15:0])  //o
  );
  assign cond = ((((((input_tuser == 6'h1b) || (input_tuser == 6'h18)) || (input_tuser == 6'h16)) || (input_tuser == 6'h20)) || (input_tuser == 6'h23)) || (input_tuser == 6'h10));
  assign input_valid_1 = (input_valid && cond);
  assign input_tdata_1 = input_tdata;
  assign input_tuser_1 = input_tuser;
  assign multiCore_tuser_ready = multiCore_tuser_fifo_io_push_ready;
  assign multiCore_idOvf = (multiCore_idCnt == 1'b1);
  assign multiCore_tuser_valid = (input_valid_1 && multiCore_idOvf);
  assign multiCore_tuser_payload = input_tuser;
  assign multiCore_accIn_valid = input_valid_1;
  assign multiCore_accIn_payload_fragment = input_tdata_1;
  assign multiCore_accIn_payload_last = multiCore_idOvf;
  assign output_tvalid = (multiCore_accIn_acc_ip_m_axis_result_tvalid && multiCore_accIn_acc_ip_m_axis_result_tlast);
  assign output_tdata = multiCore_accIn_acc_ip_m_axis_result_tdata;
  assign output_tuser = multiCore_tuser_fifo_io_pop_payload;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      multiCore_idCnt <= 1'b0;
    end else begin
      if(input_valid_1) begin
        multiCore_idCnt <= (multiCore_idCnt + 1'b1);
      end
    end
  end


endmodule

