// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module SplitAxiDatamoverCmd (
  input  wire          io_inCmd_valid,
  output wire          io_inCmd_ready,
  input  wire [71:0]   io_inCmd_payload,
  output wire          io_outCmd_0_valid,
  input  wire          io_outCmd_0_ready,
  output wire [71:0]   io_outCmd_0_payload,
  output wire          io_outCmd_1_valid,
  input  wire          io_outCmd_1_ready,
  output wire [71:0]   io_outCmd_1_payload,
  output wire          io_outCmd_2_valid,
  input  wire          io_outCmd_2_ready,
  output wire [71:0]   io_outCmd_2_payload,
  output wire          io_outCmd_3_valid,
  input  wire          io_outCmd_3_ready,
  output wire [71:0]   io_outCmd_3_payload,
  input  wire          clk_0_clk,
  input  wire          clk_0_resetn
);

  wire                forks_io_input_ready;
  wire                forks_io_outputs_0_valid;
  wire                forks_io_outputs_1_valid;
  wire                forks_io_outputs_2_valid;
  wire                forks_io_outputs_3_valid;
  wire       [63:0]   t_addr;
  wire       [7:0]    t_tag;
  reg        [20:0]   t_offsetSel;
  wire       [20:0]   t_offsetSel_1;
  wire       [20:0]   t_offsetSel_2;
  wire       [31:0]   t_forkCmd_0_payload;
  wire       [31:0]   t_forkCmd_0_payload_1;
  wire       [22:0]   t_forkCmd_0_payload_2;
  wire       [31:0]   t_forkCmd_1_payload;
  wire       [31:0]   t_forkCmd_1_payload_1;
  wire       [22:0]   t_forkCmd_1_payload_2;
  wire       [31:0]   t_forkCmd_2_payload;
  wire       [31:0]   t_forkCmd_2_payload_1;
  wire       [22:0]   t_forkCmd_2_payload_2;
  wire       [31:0]   t_forkCmd_3_payload;
  wire       [31:0]   t_forkCmd_3_payload_1;
  wire       [22:0]   t_forkCmd_3_payload_2;
  wire       [31:0]   addr;
  wire       [22:0]   len;
  wire                inc;
  wire                eof;
  wire       [3:0]    tag;
  wire       [20:0]   splitLen;
  wire       [18:0]   offsetVec_1;
  wire       [13:0]   offsetVec_2;
  wire       [20:0]   offsetVec_4;
  wire       [20:0]   offsetVec_5;
  wire       [20:0]   offsetSel;
  wire       [20:0]   offsetBase;
  wire       [20:0]   offset_0;
  wire       [21:0]   offset_1;
  wire       [22:0]   offset_2;
  wire       [22:0]   offset_3;
  wire                forkCmd_0_valid;
  reg                 forkCmd_0_ready;
  wire       [71:0]   forkCmd_0_payload;
  wire                forkCmd_1_valid;
  reg                 forkCmd_1_ready;
  wire       [71:0]   forkCmd_1_payload;
  wire                forkCmd_2_valid;
  reg                 forkCmd_2_ready;
  wire       [71:0]   forkCmd_2_payload;
  wire                forkCmd_3_valid;
  reg                 forkCmd_3_ready;
  wire       [71:0]   forkCmd_3_payload;
  wire                forkCmd_0_m2sPipe_valid;
  wire                forkCmd_0_m2sPipe_ready;
  wire       [71:0]   forkCmd_0_m2sPipe_payload;
  reg                 forkCmd_0_rValid;
  reg        [71:0]   forkCmd_0_rData;
  wire                forkCmd_1_m2sPipe_valid;
  wire                forkCmd_1_m2sPipe_ready;
  wire       [71:0]   forkCmd_1_m2sPipe_payload;
  reg                 forkCmd_1_rValid;
  reg        [71:0]   forkCmd_1_rData;
  wire                forkCmd_2_m2sPipe_valid;
  wire                forkCmd_2_m2sPipe_ready;
  wire       [71:0]   forkCmd_2_m2sPipe_payload;
  reg                 forkCmd_2_rValid;
  reg        [71:0]   forkCmd_2_rData;
  wire                forkCmd_3_m2sPipe_valid;
  wire                forkCmd_3_m2sPipe_ready;
  wire       [71:0]   forkCmd_3_m2sPipe_payload;
  reg                 forkCmd_3_rValid;
  reg        [71:0]   forkCmd_3_rData;

  assign t_addr = io_inCmd_payload[63 : 0];
  assign t_tag = io_inCmd_payload[71 : 64];
  assign t_offsetSel_1 = {2'd0, offsetVec_1};
  assign t_offsetSel_2 = {7'd0, offsetVec_2};
  assign t_forkCmd_0_payload = (t_forkCmd_0_payload_1 + addr);
  assign t_forkCmd_0_payload_1 = {11'd0, offset_0};
  assign t_forkCmd_0_payload_2 = {2'd0, splitLen};
  assign t_forkCmd_1_payload = (t_forkCmd_1_payload_1 + addr);
  assign t_forkCmd_1_payload_1 = {10'd0, offset_1};
  assign t_forkCmd_1_payload_2 = {2'd0, splitLen};
  assign t_forkCmd_2_payload = (t_forkCmd_2_payload_1 + addr);
  assign t_forkCmd_2_payload_1 = {9'd0, offset_2};
  assign t_forkCmd_2_payload_2 = {2'd0, splitLen};
  assign t_forkCmd_3_payload = (t_forkCmd_3_payload_1 + addr);
  assign t_forkCmd_3_payload_1 = {9'd0, offset_3};
  assign t_forkCmd_3_payload_2 = {2'd0, splitLen};
  StreamFork_6 forks (
    .io_input_valid     (io_inCmd_valid          ), //i
    .io_input_ready     (forks_io_input_ready    ), //o
    .io_outputs_0_valid (forks_io_outputs_0_valid), //o
    .io_outputs_0_ready (forkCmd_0_ready         ), //i
    .io_outputs_1_valid (forks_io_outputs_1_valid), //o
    .io_outputs_1_ready (forkCmd_1_ready         ), //i
    .io_outputs_2_valid (forks_io_outputs_2_valid), //o
    .io_outputs_2_ready (forkCmd_2_ready         ), //i
    .io_outputs_3_valid (forks_io_outputs_3_valid), //o
    .io_outputs_3_ready (forkCmd_3_ready         )  //i
  );
  always @(*) begin
    case(tag)
      4'b0000 : t_offsetSel = 21'h0;
      4'b0001 : t_offsetSel = t_offsetSel_1;
      4'b0010 : t_offsetSel = t_offsetSel_2;
      4'b0011 : t_offsetSel = 21'h0;
      4'b0100 : t_offsetSel = offsetVec_4;
      4'b0101 : t_offsetSel = offsetVec_5;
      4'b0110 : t_offsetSel = 21'h0;
      4'b0111 : t_offsetSel = 21'h0;
      4'b1000 : t_offsetSel = 21'h0;
      4'b1001 : t_offsetSel = 21'h0;
      4'b1010 : t_offsetSel = 21'h0;
      4'b1011 : t_offsetSel = 21'h0;
      4'b1100 : t_offsetSel = 21'h0;
      4'b1101 : t_offsetSel = 21'h0;
      4'b1110 : t_offsetSel = 21'h0;
      default : t_offsetSel = 21'h0;
    endcase
  end

  assign addr = t_addr[63 : 32];
  assign len = io_inCmd_payload[22 : 0];
  assign inc = io_inCmd_payload[23];
  assign eof = io_inCmd_payload[30];
  assign tag = t_tag[3 : 0];
  assign splitLen = len[22 : 2];
  assign offsetVec_1 = 19'h40000;
  assign offsetVec_2 = 14'h2000;
  assign offsetVec_4 = 21'h1a0000;
  assign offsetVec_5 = 21'h1a0000;
  assign offsetSel = t_offsetSel;
  assign offsetBase = ((tag == 4'b0000) ? splitLen : offsetSel);
  assign offset_0 = 21'h0;
  assign offset_1 = (offsetBase * 1'b1);
  assign offset_2 = (offsetBase * 2'b10);
  assign offset_3 = (offsetBase * 2'b11);
  assign io_inCmd_ready = forks_io_input_ready;
  assign forkCmd_0_valid = forks_io_outputs_0_valid;
  assign forkCmd_0_payload = {{{{{{{4'b0000,tag},t_forkCmd_0_payload},1'b0},eof},6'h0},inc},t_forkCmd_0_payload_2};
  always @(*) begin
    forkCmd_0_ready = forkCmd_0_m2sPipe_ready;
    if((! forkCmd_0_m2sPipe_valid)) begin
      forkCmd_0_ready = 1'b1;
    end
  end

  assign forkCmd_0_m2sPipe_valid = forkCmd_0_rValid;
  assign forkCmd_0_m2sPipe_payload = forkCmd_0_rData;
  assign io_outCmd_0_valid = forkCmd_0_m2sPipe_valid;
  assign forkCmd_0_m2sPipe_ready = io_outCmd_0_ready;
  assign io_outCmd_0_payload = forkCmd_0_m2sPipe_payload;
  assign forkCmd_1_valid = forks_io_outputs_1_valid;
  assign forkCmd_1_payload = {{{{{{{4'b0000,tag},t_forkCmd_1_payload},1'b0},eof},6'h0},inc},t_forkCmd_1_payload_2};
  always @(*) begin
    forkCmd_1_ready = forkCmd_1_m2sPipe_ready;
    if((! forkCmd_1_m2sPipe_valid)) begin
      forkCmd_1_ready = 1'b1;
    end
  end

  assign forkCmd_1_m2sPipe_valid = forkCmd_1_rValid;
  assign forkCmd_1_m2sPipe_payload = forkCmd_1_rData;
  assign io_outCmd_1_valid = forkCmd_1_m2sPipe_valid;
  assign forkCmd_1_m2sPipe_ready = io_outCmd_1_ready;
  assign io_outCmd_1_payload = forkCmd_1_m2sPipe_payload;
  assign forkCmd_2_valid = forks_io_outputs_2_valid;
  assign forkCmd_2_payload = {{{{{{{4'b0000,tag},t_forkCmd_2_payload},1'b0},eof},6'h0},inc},t_forkCmd_2_payload_2};
  always @(*) begin
    forkCmd_2_ready = forkCmd_2_m2sPipe_ready;
    if((! forkCmd_2_m2sPipe_valid)) begin
      forkCmd_2_ready = 1'b1;
    end
  end

  assign forkCmd_2_m2sPipe_valid = forkCmd_2_rValid;
  assign forkCmd_2_m2sPipe_payload = forkCmd_2_rData;
  assign io_outCmd_2_valid = forkCmd_2_m2sPipe_valid;
  assign forkCmd_2_m2sPipe_ready = io_outCmd_2_ready;
  assign io_outCmd_2_payload = forkCmd_2_m2sPipe_payload;
  assign forkCmd_3_valid = forks_io_outputs_3_valid;
  assign forkCmd_3_payload = {{{{{{{4'b0000,tag},t_forkCmd_3_payload},1'b0},eof},6'h0},inc},t_forkCmd_3_payload_2};
  always @(*) begin
    forkCmd_3_ready = forkCmd_3_m2sPipe_ready;
    if((! forkCmd_3_m2sPipe_valid)) begin
      forkCmd_3_ready = 1'b1;
    end
  end

  assign forkCmd_3_m2sPipe_valid = forkCmd_3_rValid;
  assign forkCmd_3_m2sPipe_payload = forkCmd_3_rData;
  assign io_outCmd_3_valid = forkCmd_3_m2sPipe_valid;
  assign forkCmd_3_m2sPipe_ready = io_outCmd_3_ready;
  assign io_outCmd_3_payload = forkCmd_3_m2sPipe_payload;
  always @(posedge clk_0_clk or negedge clk_0_resetn) begin
    if(!clk_0_resetn) begin
      forkCmd_0_rValid <= 1'b0;
      forkCmd_1_rValid <= 1'b0;
      forkCmd_2_rValid <= 1'b0;
      forkCmd_3_rValid <= 1'b0;
    end else begin
      if(forkCmd_0_ready) begin
        forkCmd_0_rValid <= forkCmd_0_valid;
      end
      if(forkCmd_1_ready) begin
        forkCmd_1_rValid <= forkCmd_1_valid;
      end
      if(forkCmd_2_ready) begin
        forkCmd_2_rValid <= forkCmd_2_valid;
      end
      if(forkCmd_3_ready) begin
        forkCmd_3_rValid <= forkCmd_3_valid;
      end
    end
  end

  always @(posedge clk_0_clk) begin
    if(forkCmd_0_ready) begin
      forkCmd_0_rData <= forkCmd_0_payload;
    end
    if(forkCmd_1_ready) begin
      forkCmd_1_rData <= forkCmd_1_payload;
    end
    if(forkCmd_2_ready) begin
      forkCmd_2_rData <= forkCmd_2_payload;
    end
    if(forkCmd_3_ready) begin
      forkCmd_3_rData <= forkCmd_3_payload;
    end
  end


endmodule

