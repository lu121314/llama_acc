// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module NormSubModNew (
  input  wire          io_allGatherOut_valid,
  input  wire [15:0]   io_allGatherOut_tdata,
  input  wire [5:0]    io_allGatherOut_tuser,
  input  wire          io_allReduceOut_valid,
  input  wire [15:0]   io_allReduceOut_tdata,
  input  wire [5:0]    io_allReduceOut_tuser,
  input  wire          io_lnScale_valid,
  output wire          io_lnScale_ready,
  input  wire [15:0]   io_lnScale_payload,
  output wire          io_lnOut_valid,
  output wire [15:0]   io_lnOut_tdata,
  output wire [5:0]    io_lnOut_tuser,
  input  wire          status_toLogitsGen,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                rmsNorm_io_scale_ready;
  wire                rmsNorm_io_normOut_valid;
  wire       [15:0]   rmsNorm_io_normOut_payload;
  wire                allReduceOut_valid;
  wire       [15:0]   allReduceOut_tdata;
  wire       [5:0]    allReduceOut_tuser;
  wire                allGatherOut_valid;
  wire       [15:0]   allGatherOut_tdata;
  wire       [5:0]    allGatherOut_tuser;
  wire                inputTagMap_valid;
  wire       [15:0]   inputTagMap_tdata;
  wire       [5:0]    inputTagMap_tuser;
  reg                 inputVld;
  reg        [15:0]   inputData;
  wire       [5:0]    tag;
  reg        [11:0]   inCnt;
  wire                inCntOvf;
  wire                userStream_valid;
  reg                 userStream_ready;
  wire       [5:0]    userStream_payload;
  wire                userStreamPipe_valid;
  wire                userStreamPipe_ready;
  wire       [5:0]    userStreamPipe_payload;
  reg                 userStream_rValid;
  reg        [5:0]    userStream_rData;
  wire                isAttnLn;
  wire                isLmHeadLn;
  reg        [11:0]   outCnt;
  wire                outCntOvf;
  wire                output_valid;
  wire       [15:0]   output_tdata;
  wire       [5:0]    output_tuser;
  reg                 output_regNext_valid;
  reg        [15:0]   output_regNext_tdata;
  reg        [5:0]    output_regNext_tuser;

  RMSNormFp32 rmsNorm (
    .io_toBeNorm_valid   (inputVld                        ), //i
    .io_toBeNorm_payload (inputData[15:0]                 ), //i
    .io_scale_valid      (io_lnScale_valid                ), //i
    .io_scale_ready      (rmsNorm_io_scale_ready          ), //o
    .io_scale_payload    (io_lnScale_payload[15:0]        ), //i
    .io_normOut_valid    (rmsNorm_io_normOut_valid        ), //o
    .io_normOut_payload  (rmsNorm_io_normOut_payload[15:0]), //o
    .isAttnLn            (isAttnLn                        ), //i
    .isLmHeadLn          (isLmHeadLn                      ), //i
    .clk_1_clk           (clk_1_clk                       ), //i
    .clk_1_resetn        (clk_1_resetn                    )  //i
  );
  assign allReduceOut_valid = (io_allReduceOut_valid && (io_allReduceOut_tuser == 6'h10));
  assign allReduceOut_tdata = io_allReduceOut_tdata;
  assign allGatherOut_valid = (io_allGatherOut_valid && ((((io_allGatherOut_tuser == 6'h0) || (io_allGatherOut_tuser == 6'h01)) || (io_allGatherOut_tuser == 6'h02)) || (io_allGatherOut_tuser == 6'h1f)));
  assign allGatherOut_tdata = io_allGatherOut_tdata;
  assign allReduceOut_tuser = 6'h15;
  assign allGatherOut_tuser = 6'h04;
  assign inputTagMap_valid = (|{allGatherOut_valid,allReduceOut_valid});
  assign inputTagMap_tdata = (allReduceOut_valid ? allReduceOut_tdata : allGatherOut_tdata);
  assign inputTagMap_tuser = (allReduceOut_valid ? allReduceOut_tuser : allGatherOut_tuser);
  assign tag = ((status_toLogitsGen && (inputTagMap_tuser == 6'h04)) ? 6'h22 : inputTagMap_tuser);
  assign inCntOvf = (inCnt == 12'hbff);
  always @(*) begin
    userStream_ready = userStreamPipe_ready;
    if((! userStreamPipe_valid)) begin
      userStream_ready = 1'b1;
    end
  end

  assign userStreamPipe_valid = userStream_rValid;
  assign userStreamPipe_payload = userStream_rData;
  assign userStream_valid = ((inCnt == 12'h0) && inputTagMap_valid);
  assign userStream_payload = tag;
  assign isAttnLn = (userStreamPipe_payload == 6'h04);
  assign isLmHeadLn = (userStreamPipe_payload == 6'h22);
  assign io_lnScale_ready = rmsNorm_io_scale_ready;
  assign outCntOvf = (outCnt == (isAttnLn ? 12'hbff : 12'h5ff));
  assign output_valid = rmsNorm_io_normOut_valid;
  assign output_tdata = rmsNorm_io_normOut_payload;
  assign output_tuser = userStreamPipe_payload;
  assign userStreamPipe_ready = (output_valid && outCntOvf);
  assign io_lnOut_valid = output_regNext_valid;
  assign io_lnOut_tdata = output_regNext_tdata;
  assign io_lnOut_tuser = output_regNext_tuser;
  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      inputVld <= 1'b0;
      inCnt <= 12'h0;
      userStream_rValid <= 1'b0;
      outCnt <= 12'h0;
      output_regNext_valid <= 1'b0;
    end else begin
      inputVld <= inputTagMap_valid;
      if(inputTagMap_valid) begin
        inCnt <= (inCnt + 12'h001);
        if(inCntOvf) begin
          inCnt <= 12'h0;
        end
      end
      if(userStream_ready) begin
        userStream_rValid <= userStream_valid;
      end
      if(rmsNorm_io_normOut_valid) begin
        outCnt <= (outCnt + 12'h001);
        if(outCntOvf) begin
          outCnt <= 12'h0;
        end
      end
      output_regNext_valid <= output_valid;
    end
  end

  always @(posedge clk_1_clk) begin
    inputData <= inputTagMap_tdata;
    if(userStream_ready) begin
      userStream_rData <= userStream_payload;
    end
    output_regNext_tdata <= output_tdata;
    output_regNext_tuser <= output_tuser;
  end


endmodule

