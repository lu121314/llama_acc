// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module InsertCfg (
  input  wire          io_cfgIn_valid,
  output wire          io_cfgIn_ready,
  input  wire [31:0]   io_cfgIn_payload,
  output wire          io_cfgOut_valid,
  input  wire          io_cfgOut_ready,
  output wire [31:0]   io_cfgOut_payload,
  output wire          io_gtCnt_valid,
  output wire [15:0]   io_gtCnt_payload,
  input  wire          io_index_valid,
  input  wire          io_index_payload_last,
  input  wire [15:0]   io_index_payload_tdata,
  input  wire [5:0]    io_index_payload_tuser,
  input  wire          status_enPredictor,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                cnt_io_output_valid;
  wire       [15:0]   cnt_io_output_tdata;
  wire       [5:0]    cnt_io_output_tuser;
  wire                gtZeroCnt_valid;
  wire                gtZeroCnt_ready;
  wire       [15:0]   gtZeroCnt_tdata;
  wire       [5:0]    gtZeroCnt_tuser;
  wire       [5:0]    tag;
  wire                hit;
  wire       [31:0]   insertCfg_2;
  wire       [31:0]   cfg;
  wire                io_cfgIn_fire;
  wire                t_io_cfgIn_ready;
  wire                cfgInHalt_valid;
  wire                cfgInHalt_ready;
  wire       [31:0]   cfgInHalt_payload;
  wire                cfgInHalt_s2mPipe_valid;
  reg                 cfgInHalt_s2mPipe_ready;
  wire       [31:0]   cfgInHalt_s2mPipe_payload;
  reg                 cfgInHalt_rValidN;
  reg        [31:0]   cfgInHalt_rData;
  wire                cfgInHalt_s2mPipe_m2sPipe_valid;
  wire                cfgInHalt_s2mPipe_m2sPipe_ready;
  wire       [31:0]   cfgInHalt_s2mPipe_m2sPipe_payload;
  reg                 cfgInHalt_s2mPipe_rValid;
  reg        [31:0]   cfgInHalt_s2mPipe_rData;
  wire                gtZeroCnt_fire;

  GtZeroCnt cnt (
    .io_index_valid         (io_index_valid              ), //i
    .io_index_payload_last  (io_index_payload_last       ), //i
    .io_index_payload_tdata (io_index_payload_tdata[15:0]), //i
    .io_index_payload_tuser (io_index_payload_tuser[5:0] ), //i
    .io_output_valid        (cnt_io_output_valid         ), //o
    .io_output_ready        (gtZeroCnt_ready             ), //i
    .io_output_tdata        (cnt_io_output_tdata[15:0]   ), //o
    .io_output_tuser        (cnt_io_output_tuser[5:0]    ), //o
    .clk_1_clk              (clk_1_clk                   ), //i
    .clk_1_resetn           (clk_1_resetn                )  //i
  );
  assign gtZeroCnt_valid = cnt_io_output_valid;
  assign gtZeroCnt_tdata = cnt_io_output_tdata;
  assign gtZeroCnt_tuser = cnt_io_output_tuser;
  assign tag = io_cfgIn_payload[31 : 26];
  assign hit = ((((tag == 6'h1c) || (tag == 6'h18)) || (tag == 6'h1f)) || (status_enPredictor ? (tag == 6'h16) : 1'b0));
  assign insertCfg_2 = {io_cfgIn_payload[31 : 16],gtZeroCnt_tdata};
  assign cfg = (hit ? insertCfg_2 : io_cfgIn_payload);
  assign io_cfgIn_fire = (io_cfgIn_valid && io_cfgIn_ready);
  assign gtZeroCnt_ready = (hit && io_cfgIn_fire);
  assign t_io_cfgIn_ready = (! (hit && (! gtZeroCnt_valid)));
  assign io_cfgIn_ready = (cfgInHalt_ready && t_io_cfgIn_ready);
  assign cfgInHalt_valid = (io_cfgIn_valid && t_io_cfgIn_ready);
  assign cfgInHalt_payload = cfg;
  assign cfgInHalt_ready = cfgInHalt_rValidN;
  assign cfgInHalt_s2mPipe_valid = (cfgInHalt_valid || (! cfgInHalt_rValidN));
  assign cfgInHalt_s2mPipe_payload = (cfgInHalt_rValidN ? cfgInHalt_payload : cfgInHalt_rData);
  always @(*) begin
    cfgInHalt_s2mPipe_ready = cfgInHalt_s2mPipe_m2sPipe_ready;
    if((! cfgInHalt_s2mPipe_m2sPipe_valid)) begin
      cfgInHalt_s2mPipe_ready = 1'b1;
    end
  end

  assign cfgInHalt_s2mPipe_m2sPipe_valid = cfgInHalt_s2mPipe_rValid;
  assign cfgInHalt_s2mPipe_m2sPipe_payload = cfgInHalt_s2mPipe_rData;
  assign io_cfgOut_valid = cfgInHalt_s2mPipe_m2sPipe_valid;
  assign cfgInHalt_s2mPipe_m2sPipe_ready = io_cfgOut_ready;
  assign io_cfgOut_payload = cfgInHalt_s2mPipe_m2sPipe_payload;
  assign gtZeroCnt_fire = (gtZeroCnt_valid && gtZeroCnt_ready);
  assign io_gtCnt_valid = gtZeroCnt_fire;
  assign io_gtCnt_payload = gtZeroCnt_tdata;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      cfgInHalt_rValidN <= 1'b1;
      cfgInHalt_s2mPipe_rValid <= 1'b0;
    end else begin
      if(cfgInHalt_valid) begin
        cfgInHalt_rValidN <= 1'b0;
      end
      if(cfgInHalt_s2mPipe_ready) begin
        cfgInHalt_rValidN <= 1'b1;
      end
      if(cfgInHalt_s2mPipe_ready) begin
        cfgInHalt_s2mPipe_rValid <= cfgInHalt_s2mPipe_valid;
      end
    end
  end

  always @(posedge clk_1_clk) begin
    if(cfgInHalt_ready) begin
      cfgInHalt_rData <= cfgInHalt_payload;
    end
    if(cfgInHalt_s2mPipe_ready) begin
      cfgInHalt_s2mPipe_rData <= cfgInHalt_s2mPipe_payload;
    end
  end


endmodule

