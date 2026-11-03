// Generator : SpinalHDL v1.10.2a    git head : a348a60b7e8b6a455c72e1536ec3d74a2ea16935
// Component : DataPath_xN

`timescale 1ns/1ps

module MulAddSGNew (
  input  wire          wkvIn_tvalid,
  output wire          wkvIn_tready,
  input  wire [2047:0] wkvIn_tdata,
  input  wire          dotIn_tvalid,
  output wire          dotIn_tready,
  input  wire [2047:0] dotIn_tdata,
  input  wire          resAdd_tvalid,
  output wire          resAdd_tready,
  input  wire [2047:0] resAdd_tdata,
  input  wire          axpyIn_tvalid,
  output wire          axpyIn_tready,
  input  wire [15:0]   axpyIn_tdata,
  input  wire          preScale_tvalid,
  output wire          preScale_tready,
  input  wire [15:0]   preScale_tdata,
  input  wire          postScale_tvalid,
  output wire          postScale_tready,
  input  wire [31:0]   postScale_tdata,
  output wire          vecOut_tvalid,
  output wire [2047:0] vecOut_tdata,
  output wire [5:0]    vecOut_tuser,
  output wire          scalarOut_tvalid,
  output wire [15:0]   scalarOut_tdata,
  output wire [5:0]    scalarOut_tuser,
  input  wire          cfg_tvalid,
  output wire          cfg_tready,
  input  wire [31:0]   cfg_tdata,
  output wire [5:0]    preCfgTag,
  output wire [5:0]    postCfgTag,
  input  wire          clk_1_clk,
  input  wire          clk_1_resetn
);

  wire                banks_0_wkvIn_tready;
  wire                banks_0_dotIn_tready;
  wire                banks_0_axpyIn_tready;
  wire                banks_0_preScale_tready;
  wire                banks_0_resAdd_tready;
  wire                banks_0_vecOut_tvalid;
  wire       [511:0]  banks_0_vecOut_tdata;
  wire       [5:0]    banks_0_vecOut_tuser;
  wire                banks_0_scalarOut_tvalid;
  wire                banks_0_scalarOut_tlast;
  wire       [15:0]   banks_0_scalarOut_tdata;
  wire       [5:0]    banks_0_scalarOut_tuser;
  wire                banks_0_cfg_tready;
  wire       [5:0]    banks_0_preCfgTag;
  wire       [5:0]    banks_0_postCfgTag;
  wire                banks_1_wkvIn_tready;
  wire                banks_1_dotIn_tready;
  wire                banks_1_axpyIn_tready;
  wire                banks_1_preScale_tready;
  wire                banks_1_resAdd_tready;
  wire                banks_1_vecOut_tvalid;
  wire       [511:0]  banks_1_vecOut_tdata;
  wire       [5:0]    banks_1_vecOut_tuser;
  wire                banks_1_scalarOut_tvalid;
  wire                banks_1_scalarOut_tlast;
  wire       [15:0]   banks_1_scalarOut_tdata;
  wire       [5:0]    banks_1_scalarOut_tuser;
  wire                banks_1_cfg_tready;
  wire       [5:0]    banks_1_preCfgTag;
  wire       [5:0]    banks_1_postCfgTag;
  wire                banks_2_wkvIn_tready;
  wire                banks_2_dotIn_tready;
  wire                banks_2_axpyIn_tready;
  wire                banks_2_preScale_tready;
  wire                banks_2_resAdd_tready;
  wire                banks_2_vecOut_tvalid;
  wire       [511:0]  banks_2_vecOut_tdata;
  wire       [5:0]    banks_2_vecOut_tuser;
  wire                banks_2_scalarOut_tvalid;
  wire                banks_2_scalarOut_tlast;
  wire       [15:0]   banks_2_scalarOut_tdata;
  wire       [5:0]    banks_2_scalarOut_tuser;
  wire                banks_2_cfg_tready;
  wire       [5:0]    banks_2_preCfgTag;
  wire       [5:0]    banks_2_postCfgTag;
  wire                banks_3_wkvIn_tready;
  wire                banks_3_dotIn_tready;
  wire                banks_3_axpyIn_tready;
  wire                banks_3_preScale_tready;
  wire                banks_3_resAdd_tready;
  wire                banks_3_vecOut_tvalid;
  wire       [511:0]  banks_3_vecOut_tdata;
  wire       [5:0]    banks_3_vecOut_tuser;
  wire                banks_3_scalarOut_tvalid;
  wire                banks_3_scalarOut_tlast;
  wire       [15:0]   banks_3_scalarOut_tdata;
  wire       [5:0]    banks_3_scalarOut_tuser;
  wire                banks_3_cfg_tready;
  wire       [5:0]    banks_3_preCfgTag;
  wire       [5:0]    banks_3_postCfgTag;
  wire                fp32Acc_io_postScale_ready;
  wire                fp32Acc_io_output_valid;
  wire       [15:0]   fp32Acc_io_output_tdata;
  wire       [5:0]    fp32Acc_io_output_tuser;
  wire       [511:0]  wkvInSplit_0;
  wire       [511:0]  wkvInSplit_1;
  wire       [511:0]  wkvInSplit_2;
  wire       [511:0]  wkvInSplit_3;
  wire       [511:0]  dotInSplit_0;
  wire       [511:0]  dotInSplit_1;
  wire       [511:0]  dotInSplit_2;
  wire       [511:0]  dotInSplit_3;
  wire       [511:0]  resAddSplit_0;
  wire       [511:0]  resAddSplit_1;
  wire       [511:0]  resAddSplit_2;
  wire       [511:0]  resAddSplit_3;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_1;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_2;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_3;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_4;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_5;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_6;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_7;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_8;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_9;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_10;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_11;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_12;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_13;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_14;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_15;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_16;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_17;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_18;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_19;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_20;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_21;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_22;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_23;
  reg        [5:0]    engine_banks_0_postCfgTag_delay_24;
  reg                 engine_banks_0_vecOut_tvalid_regNext;
  reg        [2047:0] t_vecOut_tdata;
  reg        [5:0]    engine_banks_0_vecOut_tuser_regNext;

  MulAddEngineNew banks_0 (
    .wkvIn_tvalid     (wkvIn_tvalid                 ), //i
    .wkvIn_tready     (banks_0_wkvIn_tready         ), //o
    .wkvIn_tdata      (wkvInSplit_0[511:0]          ), //i
    .dotIn_tvalid     (dotIn_tvalid                 ), //i
    .dotIn_tready     (banks_0_dotIn_tready         ), //o
    .dotIn_tdata      (dotInSplit_0[511:0]          ), //i
    .axpyIn_tvalid    (axpyIn_tvalid                ), //i
    .axpyIn_tready    (banks_0_axpyIn_tready        ), //o
    .axpyIn_tdata     (axpyIn_tdata[15:0]           ), //i
    .preScale_tvalid  (preScale_tvalid              ), //i
    .preScale_tready  (banks_0_preScale_tready      ), //o
    .preScale_tdata   (preScale_tdata[15:0]         ), //i
    .resAdd_tvalid    (resAdd_tvalid                ), //i
    .resAdd_tready    (banks_0_resAdd_tready        ), //o
    .resAdd_tdata     (resAddSplit_0[511:0]         ), //i
    .vecOut_tvalid    (banks_0_vecOut_tvalid        ), //o
    .vecOut_tdata     (banks_0_vecOut_tdata[511:0]  ), //o
    .vecOut_tuser     (banks_0_vecOut_tuser[5:0]    ), //o
    .scalarOut_tvalid (banks_0_scalarOut_tvalid     ), //o
    .scalarOut_tlast  (banks_0_scalarOut_tlast      ), //o
    .scalarOut_tdata  (banks_0_scalarOut_tdata[15:0]), //o
    .scalarOut_tuser  (banks_0_scalarOut_tuser[5:0] ), //o
    .cfg_tvalid       (cfg_tvalid                   ), //i
    .cfg_tready       (banks_0_cfg_tready           ), //o
    .cfg_tdata        (cfg_tdata[31:0]              ), //i
    .preCfgTag        (banks_0_preCfgTag[5:0]       ), //o
    .postCfgTag       (banks_0_postCfgTag[5:0]      ), //o
    .clk_1_clk        (clk_1_clk                    ), //i
    .clk_1_resetn     (clk_1_resetn                 )  //i
  );
  MulAddEngineNew banks_1 (
    .wkvIn_tvalid     (wkvIn_tvalid                 ), //i
    .wkvIn_tready     (banks_1_wkvIn_tready         ), //o
    .wkvIn_tdata      (wkvInSplit_1[511:0]          ), //i
    .dotIn_tvalid     (dotIn_tvalid                 ), //i
    .dotIn_tready     (banks_1_dotIn_tready         ), //o
    .dotIn_tdata      (dotInSplit_1[511:0]          ), //i
    .axpyIn_tvalid    (axpyIn_tvalid                ), //i
    .axpyIn_tready    (banks_1_axpyIn_tready        ), //o
    .axpyIn_tdata     (axpyIn_tdata[15:0]           ), //i
    .preScale_tvalid  (preScale_tvalid              ), //i
    .preScale_tready  (banks_1_preScale_tready      ), //o
    .preScale_tdata   (preScale_tdata[15:0]         ), //i
    .resAdd_tvalid    (resAdd_tvalid                ), //i
    .resAdd_tready    (banks_1_resAdd_tready        ), //o
    .resAdd_tdata     (resAddSplit_1[511:0]         ), //i
    .vecOut_tvalid    (banks_1_vecOut_tvalid        ), //o
    .vecOut_tdata     (banks_1_vecOut_tdata[511:0]  ), //o
    .vecOut_tuser     (banks_1_vecOut_tuser[5:0]    ), //o
    .scalarOut_tvalid (banks_1_scalarOut_tvalid     ), //o
    .scalarOut_tlast  (banks_1_scalarOut_tlast      ), //o
    .scalarOut_tdata  (banks_1_scalarOut_tdata[15:0]), //o
    .scalarOut_tuser  (banks_1_scalarOut_tuser[5:0] ), //o
    .cfg_tvalid       (cfg_tvalid                   ), //i
    .cfg_tready       (banks_1_cfg_tready           ), //o
    .cfg_tdata        (cfg_tdata[31:0]              ), //i
    .preCfgTag        (banks_1_preCfgTag[5:0]       ), //o
    .postCfgTag       (banks_1_postCfgTag[5:0]      ), //o
    .clk_1_clk        (clk_1_clk                    ), //i
    .clk_1_resetn     (clk_1_resetn                 )  //i
  );
  MulAddEngineNew banks_2 (
    .wkvIn_tvalid     (wkvIn_tvalid                 ), //i
    .wkvIn_tready     (banks_2_wkvIn_tready         ), //o
    .wkvIn_tdata      (wkvInSplit_2[511:0]          ), //i
    .dotIn_tvalid     (dotIn_tvalid                 ), //i
    .dotIn_tready     (banks_2_dotIn_tready         ), //o
    .dotIn_tdata      (dotInSplit_2[511:0]          ), //i
    .axpyIn_tvalid    (axpyIn_tvalid                ), //i
    .axpyIn_tready    (banks_2_axpyIn_tready        ), //o
    .axpyIn_tdata     (axpyIn_tdata[15:0]           ), //i
    .preScale_tvalid  (preScale_tvalid              ), //i
    .preScale_tready  (banks_2_preScale_tready      ), //o
    .preScale_tdata   (preScale_tdata[15:0]         ), //i
    .resAdd_tvalid    (resAdd_tvalid                ), //i
    .resAdd_tready    (banks_2_resAdd_tready        ), //o
    .resAdd_tdata     (resAddSplit_2[511:0]         ), //i
    .vecOut_tvalid    (banks_2_vecOut_tvalid        ), //o
    .vecOut_tdata     (banks_2_vecOut_tdata[511:0]  ), //o
    .vecOut_tuser     (banks_2_vecOut_tuser[5:0]    ), //o
    .scalarOut_tvalid (banks_2_scalarOut_tvalid     ), //o
    .scalarOut_tlast  (banks_2_scalarOut_tlast      ), //o
    .scalarOut_tdata  (banks_2_scalarOut_tdata[15:0]), //o
    .scalarOut_tuser  (banks_2_scalarOut_tuser[5:0] ), //o
    .cfg_tvalid       (cfg_tvalid                   ), //i
    .cfg_tready       (banks_2_cfg_tready           ), //o
    .cfg_tdata        (cfg_tdata[31:0]              ), //i
    .preCfgTag        (banks_2_preCfgTag[5:0]       ), //o
    .postCfgTag       (banks_2_postCfgTag[5:0]      ), //o
    .clk_1_clk        (clk_1_clk                    ), //i
    .clk_1_resetn     (clk_1_resetn                 )  //i
  );
  MulAddEngineNew banks_3 (
    .wkvIn_tvalid     (wkvIn_tvalid                 ), //i
    .wkvIn_tready     (banks_3_wkvIn_tready         ), //o
    .wkvIn_tdata      (wkvInSplit_3[511:0]          ), //i
    .dotIn_tvalid     (dotIn_tvalid                 ), //i
    .dotIn_tready     (banks_3_dotIn_tready         ), //o
    .dotIn_tdata      (dotInSplit_3[511:0]          ), //i
    .axpyIn_tvalid    (axpyIn_tvalid                ), //i
    .axpyIn_tready    (banks_3_axpyIn_tready        ), //o
    .axpyIn_tdata     (axpyIn_tdata[15:0]           ), //i
    .preScale_tvalid  (preScale_tvalid              ), //i
    .preScale_tready  (banks_3_preScale_tready      ), //o
    .preScale_tdata   (preScale_tdata[15:0]         ), //i
    .resAdd_tvalid    (resAdd_tvalid                ), //i
    .resAdd_tready    (banks_3_resAdd_tready        ), //o
    .resAdd_tdata     (resAddSplit_3[511:0]         ), //i
    .vecOut_tvalid    (banks_3_vecOut_tvalid        ), //o
    .vecOut_tdata     (banks_3_vecOut_tdata[511:0]  ), //o
    .vecOut_tuser     (banks_3_vecOut_tuser[5:0]    ), //o
    .scalarOut_tvalid (banks_3_scalarOut_tvalid     ), //o
    .scalarOut_tlast  (banks_3_scalarOut_tlast      ), //o
    .scalarOut_tdata  (banks_3_scalarOut_tdata[15:0]), //o
    .scalarOut_tuser  (banks_3_scalarOut_tuser[5:0] ), //o
    .cfg_tvalid       (cfg_tvalid                   ), //i
    .cfg_tready       (banks_3_cfg_tready           ), //o
    .cfg_tdata        (cfg_tdata[31:0]              ), //i
    .preCfgTag        (banks_3_preCfgTag[5:0]       ), //o
    .postCfgTag       (banks_3_postCfgTag[5:0]      ), //o
    .clk_1_clk        (clk_1_clk                    ), //i
    .clk_1_resetn     (clk_1_resetn                 )  //i
  );
  Fp32AccEngine fp32Acc (
    .io_inputs_0_valid         (banks_0_scalarOut_tvalid     ), //i
    .io_inputs_0_payload_last  (banks_0_scalarOut_tlast      ), //i
    .io_inputs_0_payload_tdata (banks_0_scalarOut_tdata[15:0]), //i
    .io_inputs_0_payload_tuser (banks_0_scalarOut_tuser[5:0] ), //i
    .io_inputs_1_valid         (banks_1_scalarOut_tvalid     ), //i
    .io_inputs_1_payload_last  (banks_1_scalarOut_tlast      ), //i
    .io_inputs_1_payload_tdata (banks_1_scalarOut_tdata[15:0]), //i
    .io_inputs_1_payload_tuser (banks_1_scalarOut_tuser[5:0] ), //i
    .io_inputs_2_valid         (banks_2_scalarOut_tvalid     ), //i
    .io_inputs_2_payload_last  (banks_2_scalarOut_tlast      ), //i
    .io_inputs_2_payload_tdata (banks_2_scalarOut_tdata[15:0]), //i
    .io_inputs_2_payload_tuser (banks_2_scalarOut_tuser[5:0] ), //i
    .io_inputs_3_valid         (banks_3_scalarOut_tvalid     ), //i
    .io_inputs_3_payload_last  (banks_3_scalarOut_tlast      ), //i
    .io_inputs_3_payload_tdata (banks_3_scalarOut_tdata[15:0]), //i
    .io_inputs_3_payload_tuser (banks_3_scalarOut_tuser[5:0] ), //i
    .io_postScale_valid        (postScale_tvalid             ), //i
    .io_postScale_ready        (fp32Acc_io_postScale_ready   ), //o
    .io_postScale_payload      (postScale_tdata[31:0]        ), //i
    .io_output_valid           (fp32Acc_io_output_valid      ), //o
    .io_output_tdata           (fp32Acc_io_output_tdata[15:0]), //o
    .io_output_tuser           (fp32Acc_io_output_tuser[5:0] ), //o
    .clk_1_clk                 (clk_1_clk                    ), //i
    .clk_1_resetn              (clk_1_resetn                 )  //i
  );
  assign wkvInSplit_0 = wkvIn_tdata[511 : 0];
  assign wkvInSplit_1 = wkvIn_tdata[1023 : 512];
  assign wkvInSplit_2 = wkvIn_tdata[1535 : 1024];
  assign wkvInSplit_3 = wkvIn_tdata[2047 : 1536];
  assign dotInSplit_0 = dotIn_tdata[511 : 0];
  assign dotInSplit_1 = dotIn_tdata[1023 : 512];
  assign dotInSplit_2 = dotIn_tdata[1535 : 1024];
  assign dotInSplit_3 = dotIn_tdata[2047 : 1536];
  assign resAddSplit_0 = resAdd_tdata[511 : 0];
  assign resAddSplit_1 = resAdd_tdata[1023 : 512];
  assign resAddSplit_2 = resAdd_tdata[1535 : 1024];
  assign resAddSplit_3 = resAdd_tdata[2047 : 1536];
  assign preCfgTag = banks_0_preCfgTag;
  assign wkvIn_tready = banks_0_wkvIn_tready;
  assign dotIn_tready = banks_0_dotIn_tready;
  assign axpyIn_tready = banks_0_axpyIn_tready;
  assign preScale_tready = banks_0_preScale_tready;
  assign resAdd_tready = banks_0_resAdd_tready;
  assign cfg_tready = banks_0_cfg_tready;
  assign postScale_tready = fp32Acc_io_postScale_ready;
  assign scalarOut_tvalid = fp32Acc_io_output_valid;
  assign scalarOut_tdata = fp32Acc_io_output_tdata;
  assign scalarOut_tuser = fp32Acc_io_output_tuser;
  assign postCfgTag = engine_banks_0_postCfgTag_delay_24;
  assign vecOut_tvalid = engine_banks_0_vecOut_tvalid_regNext;
  assign vecOut_tdata = t_vecOut_tdata;
  assign vecOut_tuser = engine_banks_0_vecOut_tuser_regNext;
  always @(posedge clk_1_clk) begin
    engine_banks_0_postCfgTag_delay_1 <= banks_0_postCfgTag;
    engine_banks_0_postCfgTag_delay_2 <= engine_banks_0_postCfgTag_delay_1;
    engine_banks_0_postCfgTag_delay_3 <= engine_banks_0_postCfgTag_delay_2;
    engine_banks_0_postCfgTag_delay_4 <= engine_banks_0_postCfgTag_delay_3;
    engine_banks_0_postCfgTag_delay_5 <= engine_banks_0_postCfgTag_delay_4;
    engine_banks_0_postCfgTag_delay_6 <= engine_banks_0_postCfgTag_delay_5;
    engine_banks_0_postCfgTag_delay_7 <= engine_banks_0_postCfgTag_delay_6;
    engine_banks_0_postCfgTag_delay_8 <= engine_banks_0_postCfgTag_delay_7;
    engine_banks_0_postCfgTag_delay_9 <= engine_banks_0_postCfgTag_delay_8;
    engine_banks_0_postCfgTag_delay_10 <= engine_banks_0_postCfgTag_delay_9;
    engine_banks_0_postCfgTag_delay_11 <= engine_banks_0_postCfgTag_delay_10;
    engine_banks_0_postCfgTag_delay_12 <= engine_banks_0_postCfgTag_delay_11;
    engine_banks_0_postCfgTag_delay_13 <= engine_banks_0_postCfgTag_delay_12;
    engine_banks_0_postCfgTag_delay_14 <= engine_banks_0_postCfgTag_delay_13;
    engine_banks_0_postCfgTag_delay_15 <= engine_banks_0_postCfgTag_delay_14;
    engine_banks_0_postCfgTag_delay_16 <= engine_banks_0_postCfgTag_delay_15;
    engine_banks_0_postCfgTag_delay_17 <= engine_banks_0_postCfgTag_delay_16;
    engine_banks_0_postCfgTag_delay_18 <= engine_banks_0_postCfgTag_delay_17;
    engine_banks_0_postCfgTag_delay_19 <= engine_banks_0_postCfgTag_delay_18;
    engine_banks_0_postCfgTag_delay_20 <= engine_banks_0_postCfgTag_delay_19;
    engine_banks_0_postCfgTag_delay_21 <= engine_banks_0_postCfgTag_delay_20;
    engine_banks_0_postCfgTag_delay_22 <= engine_banks_0_postCfgTag_delay_21;
    engine_banks_0_postCfgTag_delay_23 <= engine_banks_0_postCfgTag_delay_22;
    engine_banks_0_postCfgTag_delay_24 <= engine_banks_0_postCfgTag_delay_23;
    t_vecOut_tdata <= {banks_3_vecOut_tdata,{banks_2_vecOut_tdata,{banks_1_vecOut_tdata,banks_0_vecOut_tdata}}};
    engine_banks_0_vecOut_tuser_regNext <= banks_0_vecOut_tuser;
  end

  always @(posedge clk_1_clk or negedge clk_1_resetn) begin
    if(!clk_1_resetn) begin
      engine_banks_0_vecOut_tvalid_regNext <= 1'b0;
    end else begin
      engine_banks_0_vecOut_tvalid_regNext <= banks_0_vecOut_tvalid;
    end
  end


endmodule

